

module BizLogics.Api

open System
open System.Text

open Util.Text
open Util.Json

open UtilWebServer.Json
open UtilWebServer.Api

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types

open BizLogics.Common
open BizLogics.TinyLink


let api_Public_Ping json =
    [|  ok
        ("timestamp",Json.Num (DateTime.UtcNow.Ticks.ToString()))   |]

let api_Public_ListBiz json =
    runtime.bcs.Values
    |> Seq.toArray
    |> Array.map(fun i -> i.biz)
    |> Array.map BIZ__json
    |> wrapOkAry

let api_Public_LoadCryptoLink json =
    let tiny = tryFindStrByAtt "tiny" json
    if runtime.tiny__full.ContainsKey tiny then
        let full = runtime.tiny__full[tiny]
        runtime.hashFull__clinks[full]
        |> CLINK__json
        |> wrapOk "clink"
    else
        er Er.InvalideParameter

let api_Public_CheckoutCryptoLink json =

    let url,urlLength = 
        let url = (tryFindStrByAtt "url" json).Trim()
        if url.StartsWith "http" then
            url,url.Length
        else
            "https://" + url,url.Length

    let bizownero =
        (fun id -> 
            if runtime.bizowners.ContainsKey id then
                runtime.bizowners[id] |> Some
            else
                None)
        |> tryLoadFromJsonId json "bizowner"

    let data = tryFindStrByAtt "data" json
    let dsto = 
        let code = tryFindStrByAtt "dst" json
        if runtime.bcs.ContainsKey code then
            runtime.bcs[code].biz
            |> Some
        else
            None
           
    let promotero =            
        let session = tryFindStrByAtt "session" json
        None

    if urlLength = 0 then
        er Er.InvalideParameter
    else
        match 
            url__clinko 
                url
                dsto
                data
                promotero
                bizownero with
        | Some clink -> 
            clink
            |> CLINK__json
            |> wrapOk "clink"
        | None -> er Er.Internal

let branch json api = 

    match api with
    | "ListBiz" -> api_Public_ListBiz json
    | "CheckoutTinyLink" -> api_Public_CheckoutCryptoLink json
    | _ -> er Er.ApiNotExists
