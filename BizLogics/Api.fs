

module BizLogics.Api

open System
open System.Text

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
    let list = 
        runtime.bcs.Values
        |> Seq.toArray
        |> Array.map(fun i -> i.biz)
        |> Array.map BIZ__json
        |> Json.Ary
    
    [|  ok
        ("list",list)   |]

let api_Public_CheckoutTinyLink json =

    let bizownero =
        (fun id -> 
            if runtime.bizowners.ContainsKey id then
                runtime.bizowners[id] |> Some
            else
                None)
        |> tryLoadFromJsonId json "bizowner"

    let url = tryFindStrByAtt "url" json
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

    match 
        url__tinylinko 
            url
            dsto
            data
            promotero
            bizownero with
    | Some plink -> 
        plink
        |> PLINK__json
        |> wrapOk "plink"
    | None -> [|  er Er.Internal  |]

let branch json api = 

    match api with
    | "ListBiz" -> api_Public_ListBiz json
    | "CheckoutTinyLink" -> api_Public_CheckoutTinyLink json
    | _ -> [|  er Er.ApiNotExists   |]
