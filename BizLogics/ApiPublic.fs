

module BizLogics.ApiPublic

open System
open System.Text

open Util.Cat
open Util.Text
open Util.Json
open Util.HttpClient

open UtilWebServer.Json
open UtilWebServer.Api
open UtilWebServer.Auth
open UtilWebServer.Session
open UtilWebServer.Open

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Auth


let api_Public_Ping x =
    [|  ok
        ("timestamp",Json.Num (DateTime.UtcNow.Ticks.ToString()))   |]

let api_Public_Homepage x =

    runtime.data.hashFull__clinks.Values
    |> Seq.toArray
    |> Array.sortByDescending(fun i -> i.Createdat)
    |> Array.map CLINK__json
    |> Json.Ary
    |> wrapOk "clinks"

let api_Public_ListBiz x =
    runtime.data.bcs.Values
    |> Seq.toArray
    |> Array.map(fun i -> i.biz)
    |> Array.map BIZ__json
    |> wrapOkAry

let api_Public_LoadCryptoLink x =
    let tiny = tryFindStrByAtt "tiny" x.json
    if runtime.data.tiny__full.ContainsKey tiny then
        let full = runtime.data.tiny__full[tiny]
        runtime.data.hashFull__clinks[full]
        |> CLINK__json
        |> wrapOk "clink"
    else
        er Er.InvalideParameter

let api_Public_CheckoutCryptoLink x =

    let url,urlLength = 
        let url = (tryFindStrByAtt "url" x.json).Trim()
        if url.StartsWith "http" then
            url,url.Length
        else
            "https://" + url,url.Length

    if urlLength = 0 then
        er Er.InvalideParameter
    else 

        let domainnameo = 
            let domainame = (Util.Http.url__domainame url)

            runtime.data.domainnames.Values
            |> Seq.tryFind(fun v -> v.p.Caption = domainame)

        let htmlo = 
            try
                url
                |> httpGet None
                |> snd
                |> Some
            with
            | _ -> None

        let bizownero =
            (fun id -> 
                if runtime.data.bizowners.ContainsKey id then
                    runtime.data.bizowners[id] |> Some
                else
                    None)
            |> tryLoadFromJsonId x.json "bizowner"

        let data = tryFindStrByAtt "data" x.json
        let dsto = 
            let code = tryFindStrByAtt "dst" x.json
            if runtime.data.bcs.ContainsKey code then
                runtime.data.bcs[code].biz
                |> Some
            else
                None
           
        let session,ownero = 
            checkSessionUsero
                Er.Unauthorized 
                runtime.sessions
                x

        if htmlo.IsNone then
            er Er.InvalideParameter
        else
            match 
                url__clinko 
                    url
                    domainnameo
                    htmlo.Value
                    dsto
                    data
                    ownero
                    bizownero with
            | Some clink -> 
                clink
                |> CLINK__json
                |> wrapOk "clink"
            | None -> er Er.Internal

