module BizLogics.TinyLink

open System
open System.Text
open System.Collections.Concurrent

open Util.Text
open Util.Crypto
open Util.DbTx

open UtilWebServer.DbLogger
open UtilWebServer.Db

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

let tinyLinkLength = 7
let expireGeneral = new TimeSpan(180,0,0)

let hashFull__plinks = new ConcurrentDictionary<string,PLINK>()
let tiny__full = new ConcurrentDictionary<string,string>()

let checkcollition promoter (url:string) =
    let mutable repeater = 0
    let mutable hashTiny = ""

    while hashTiny = "" || tiny__full.ContainsKey hashTiny do
        
        let hash =
            [|  repeater |> BitConverter.GetBytes
                promoter
                url |> Encoding.UTF8.GetBytes |]
            |> Array.concat
            |> bin__sha256

        hashTiny <- new string(Array.sub (hash.ToCharArray()) 0 tinyLinkLength)

        repeater <- repeater + 1

    hashTiny

let url__tinylinko 
    (src:string) 
    (promotero:EU option)
    (bizownero:BIZOWNER option) = 

    let promoter = 
        match promotero with
        | Some eu -> eu.ID |> BitConverter.GetBytes
        | None -> 0L |> BitConverter.GetBytes

    let url = 
        let mutable s = src.Trim()
        let i = s.IndexOf "://"
        if i > 0 then
            s.Substring(i + 3)
        else
            s

    let hashFull =  
        [|  promoter
            url |> Encoding.UTF8.GetBytes |]
        |> Array.concat
        |> bin__sha256

    if hashFull__plinks.ContainsKey hashFull then
        hashFull__plinks[hashFull]
        |> Some
    else
    
        let pretx = None |> opctx__pretx
    
        let rcd = 

            let p = pPLINK_empty()

            p.HashFull <- hashFull
            p.HashTiny <- checkcollition promoter url
            p.BizOwner <-
                match bizownero with
                | Some bizowner -> bizowner.ID
                | None -> 0L
            p.Promoter <-
                match promotero with
                | Some promoter -> promoter.ID
                | None -> 0L
            p.Expiry <- DateTime.UtcNow.Add expireGeneral
            p.Src <- url

            p
            |> populateCreateTx pretx PLINK_metadata

        if pretx |> loggedPipeline "BizLogics.TinyLink.url__tinylink" conn then
            
            tiny__full[rcd.p.HashTiny] <- rcd.p.HashFull
            hashFull__plinks[rcd.p.HashFull] <- rcd

            Some rcd
        else
            None


