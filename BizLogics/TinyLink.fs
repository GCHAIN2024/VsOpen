module BizLogics.TinyLink

open System
open System.Numerics
open System.Text
open System.Collections.Concurrent

open Util.ADT
open Util.Text
open Util.Crypto
open Util.DbTx

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.OpenGraph
open UtilWebServer.SSR

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

open BizLogics.Common

let alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let tinyLinkLength = 9
let adics = Util.Math.adics (uint64 alphabet.Length) tinyLinkLength

let expireGeneral = new TimeSpan(180,0,0)

let clink__ssrPage (clink:CLINK) = 
    {
        title = "Powered by " + site + ": " + clink.p.OgTitle
        desc = clink.p.OgDesc
        image = clink.p.OgImg
        url = "https://" + domain + "/t/" + clink.p.Src
        noscript = "" }

let checkcollition 
    owner 
    (url:string) 
    (dsto:BIZ option)
    (data:string) =

    let mutable repeater = 0
    let mutable hashTiny = ""

    while hashTiny = "" || runtime.data.tiny__full.ContainsKey hashTiny do
        
        let hash =

            let dstBin = 
                match dsto with
                | Some dst -> dst.ID
                | None -> 0L
                |> BitConverter.GetBytes

            let dataBin = 
                [|  data.Length |> BitConverter.GetBytes
                    data |> Encoding.UTF8.GetBytes  |]
                |> Array.concat

            [|  repeater |> BitConverter.GetBytes
                owner
                url |> Encoding.UTF8.GetBytes
                dstBin
                dataBin |]
            |> Array.concat
            |> bin__sha256bin

        hashTiny <- 
            let bint = 
                let v = BigInteger hash
                if v < BigInteger.Zero then
                    - v
                else
                    v
            let m = BigInteger UInt64.MaxValue
            let r = bint % m
            r
            |> uint64
            |> uint64__str alphabet adics

        repeater <- repeater + 1

    hashTiny

let url__clinko 
    (src:string)
    domainnameo
    html
    (dsto:BIZ option)
    data
    (ownero:EuComplex option)
    (bizownero:BIZOWNER option) = 

    let owner = 
        match ownero with
        | Some ec -> ec.eu.ID |> BitConverter.GetBytes
        | None -> 0L |> BitConverter.GetBytes

    let hashFull =  
        [|  owner
            src |> Encoding.UTF8.GetBytes |]
        |> Array.concat
        |> bin__sha256

    if runtime.data.hashFull__clinks.ContainsKey hashFull then
        runtime.data.hashFull__clinks[hashFull]
        |> Some
    else
        create CLINK_metadata "BizLogics.TinyLink.url__clink" conn (fun _ -> 
            let p = pCLINK_empty()
            p.HashFull <- hashFull
            p.HashTiny <- checkcollition owner src dsto data
            p.Src <- src
            p.Dst <-
                match dsto with
                | Some dst -> dst.ID
                | None -> 0L
            p.BizOwner <-
                match bizownero with
                | Some bizowner -> bizowner.ID
                | None -> 0L
            p.Owner <-
                match ownero with
                | Some owner -> owner.eu.ID
                | None -> 0L
            p.Data <- data
            p.Expiry <- DateTime.UtcNow.Add expireGeneral

            let title,desc,image = parse html
            p.OgTitle <- title
            p.OgDesc <- desc
            p.OgImg <- image
            p) ()
        |> oPipelineSome (fun rcd -> 
            runtime.data.tiny__full[rcd.p.HashTiny] <- rcd.p.HashFull
            runtime.data.hashFull__clinks[rcd.p.HashFull] <- rcd
            rcd)

