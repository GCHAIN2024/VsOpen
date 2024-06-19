

module BizLogics.Api

open System
open System.Text

open Util.Json

open UtilWebServer.Json

open Shared.Types

open BizLogics.Common
open BizLogics.TinyLink

let apiCheckoutTinyLink json =
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
        ()
    | None -> ()

    [|  ("tinylink","")  |]

let apiHandler json api = 

    let mutable ero = None

    match api with
    | "CheckoutTinyLink" -> apiCheckoutTinyLink json
    | _ -> 
        ero <- Some Er.ApiNotExists
        [||]
    |> Array.map(fun (k,v) -> k,(Json.Str v))
    |> Json.Braket
    |> Msg.ApiResponse
