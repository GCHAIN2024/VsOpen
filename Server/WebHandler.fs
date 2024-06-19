module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Text
open Util.Json
open Util.Http
open Util.Zmq

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open UtilWebServer.Common
open UtilWebServer.Json

open BizLogics.Common
open BizLogics.TinyLink

let r1 = string__regex @"\w+"

//  https://cha.in/t/a1Bz7wS
let plugin req = 

    let mutable o = None

    if req.pathline.StartsWith "/t/" then

        let m = 
            req.pathline.Substring(3)
            |> regex_match r1

        if m.Length = 3 then
            if tiny__full.ContainsKey m then
                let hashFull = tiny__full[m]
                let plink = hashFull__plinks[hashFull]

                o <-
                    [|  
                        "HTTP/1.1 302 Found"
                        "Location: " + plink.p.Src
                        "Content-Length: 0"
                        "Date: Mon, 17 Jun 2024 12:00:00 GMT"
                        "Connection: close"
                        "" |]
                    |> String.concat crlf
                    |> Encoding.UTF8.GetBytes
                    |> Some
    o

let echoHandler x =
    match x.service with
    | "public" -> 
        match x.api with
        | _ -> Fail(Er.ApiNotExists, x)
    | "admin" -> 
        match x.api with
        | _ -> Fail(Er.ApiNotExists, x)
    | _ -> Fail(Er.ApiNotExists, x)


let apiHandler json api = 

    match api with
    | "CheckoutTinyLink" -> 

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
        | Some plink -> ()
        | None -> ()

    | _ -> ()


let wsHandlerZweb zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    match
        (wsp.bin, ref 0)
        |> bin__Msg with
    | ApiRequest json ->
        apiHandler json (tryFindStrByAtt "api" json)

    | _ ->
        Console.WriteLine("None")
        ()

    //wsp.bin |> binPushWsToAll zweb

    ">> Server Broadcast >> " + wsp.bin.Length.ToString() + " bytes"
    |> output

    None

let wsHandler (incoming:byte[]) =

    "<< incoming " + incoming.Length.ToString() + " bytes"
    |> output

    match
        (incoming, ref 0)
        |> bin__Msg with
    | ApiRequest json ->
        apiHandler json (tryFindStrByAtt "api" json)

    | _ ->
        Console.WriteLine("None")
        ()

    //wsp.bin |> binPushWsToAll zweb

    //">> Server Broadcast >> " + incoming.Length.ToString() + " bytes"
    //|> output

    None
