module BizLogics.TinyLink

open System
open System.Numerics
open System.Text
open System.Collections.Concurrent

open Util.Text
open Util.Crypto
open Util.DbTx

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.OpenGraph

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

open BizLogics.Common

let alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let tinyLinkLength = 9
let adics = Util.Math.adics (uint64 alphabet.Length) tinyLinkLength

let expireGeneral = new TimeSpan(180,0,0)


let checkcollition 
    promoter 
    (url:string) 
    (dsto:BIZ option)
    (data:string) =

    let mutable repeater = 0
    let mutable hashTiny = ""

    while hashTiny = "" || runtime.tiny__full.ContainsKey hashTiny do
        
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
                promoter
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
    (dsto:BIZ option)
    data
    (promotero:EU option)
    (bizownero:BIZOWNER option) = 

    let domainnameo = 
        let domainame = (Util.Http.url__domainame src).ToLower()

        runtime.domainnames.Values
        |> Seq.tryFind(fun v -> v.p.Caption = domainame)

    let promoter = 
        match promotero with
        | Some eu -> eu.ID |> BitConverter.GetBytes
        | None -> 0L |> BitConverter.GetBytes

    let hashFull =  
        [|  promoter
            src |> Encoding.UTF8.GetBytes |]
        |> Array.concat
        |> bin__sha256

    if runtime.hashFull__clinks.ContainsKey hashFull then
        runtime.hashFull__clinks[hashFull]
        |> Some
    else
    
        let pretx = None |> opctx__pretx
    
        let rcd = 

            let p = pCLINK_empty()

            p.HashFull <- hashFull
            p.HashTiny <- checkcollition promoter src dsto data
            p.Src <- src
            p.Dst <-
                match dsto with
                | Some dst -> dst.ID
                | None -> 0L
            p.BizOwner <-
                match bizownero with
                | Some bizowner -> bizowner.ID
                | None -> 0L
            p.Promoter <-
                match promotero with
                | Some promoter -> promoter.ID
                | None -> 0L
            p.Data <- data
            p.Expiry <- DateTime.UtcNow.Add expireGeneral

            let title,desc,image = load p.Src
            p.OgTitle <- title
            p.OgDesc <- desc
            p.OgImg <- image

            p
            |> populateCreateTx pretx CLINK_metadata

        if pretx |> loggedPipeline "BizLogics.TinyLink.url__clink" conn then
            
            runtime.tiny__full[rcd.p.HashTiny] <- rcd.p.HashFull
            runtime.hashFull__clinks[rcd.p.HashFull] <- rcd

            Some rcd
        else
            None


