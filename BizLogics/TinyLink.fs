module BizLogics.TinyLink

open System
open System.Text
open System.Collections.Concurrent

open Util.Text
open Util.Crypto

open Shared.OrmTypes
open Shared.Types

let expireGeneral = new TimeSpan(180,0,0)

let tinylinks = new ConcurrentDictionary<string,PromotedLink>()

let url__tinylink 
    (src:string) 
    (promotero:EU option)
    bizo = 

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

    let mutable repeater = 0

    let mutable hashFull = "" 
    let mutable hashTiny = ""

    while hashTiny = "" || tinylinks.ContainsKey hashTiny do
        
        hashFull <- 
            [|  repeater |> BitConverter.GetBytes
                promoter
                url |> Encoding.UTF8.GetBytes |]
            |> Array.concat
            |> bin__sha256

        hashTiny <- new string(Array.sub (hashFull.ToCharArray()) 0 7)

        repeater <- repeater + 1

    let now = DateTime.UtcNow

    let plink = {
        createdat = now
        expiry = now.Add expireGeneral
        hashFull = hashFull
        hashTiny = hashTiny
        promotero = promotero
        bizo = bizo
        src = url }

    tinylinks.[plink.hashTiny] <- plink

    plink