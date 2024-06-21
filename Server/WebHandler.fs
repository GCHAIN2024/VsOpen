module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Text
open Util.Bin
open Util.Json
open Util.Http
open Util.HttpServer
open Util.Zmq

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open UtilWebServer.Common
open UtilWebServer.Json
open UtilWebServer.Api
open UtilWebServer.SSR

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Api

let ssrTriple = 
    runtime.host.fsDir + "\\" + runtime.host.defaultHtml
    |> vueIndex

let r1 = string__regex @"\w+"

//  https://cha.in/t/a1Bz7wS
let hTinyLink req = 
    let m = 
        req.pathline.Substring 3
        |> regex_match r1

    if m.Length = 3 then
        if runtime.tiny__full.ContainsKey m then
            let hashFull = runtime.tiny__full[m]
            let plink = runtime.hashFull__clinks[hashFull]

            let forward = false

            if forward then
                [|  
                    "HTTP/1.1 302 Found"
                    "Location: " + plink.p.Src
                    "Content-Length: 0"
                    "Date: Mon, 17 Jun 2024 12:00:00 GMT"
                    "Connection: close"
                    "" |]
                |> String.concat crlf
                |> Encoding.UTF8.GetBytes
            else
                // title,desc,
                (plink.p.HashTiny,plink.p.HashFull,"","")
                |> render ssrTriple
                |> bin__StandardResponse "text/html"
        else
            rep404
    else
        rep404

let branch service api json = 

    match service with
    | "public" -> 
        match api with
        | "ping" -> api_Public_Ping json
        | "listBiz" -> api_Public_ListBiz json
        | "checkoutCryptoLink" -> api_Public_CheckoutCryptoLink json
        | _ -> [|  er Er.ApiNotExists   |]
    | "eu" -> [|  er Er.ApiNotExists   |]
    | "admin" -> [|  er Er.ApiNotExists   |]
    | "open" -> [|  er Er.ApiNotExists   |]
    | _ -> [|  er Er.ApiNotExists   |]

let echo req = 

    if req.pathline.StartsWith "/t/" then
        hTinyLink req
        |> Some
    else if req.path.Length = 3 then
        if req.path[0] = "api" then
            echoApiHandler branch req
            |> Some
        else
            None
    else
        None


let wsHandlerZweb zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    if wsp.bin.Length > 20 then 
        ()

    match
        (wsp.bin, ref 0)
        |> bin__Msg with
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

    //match
    //    (incoming, ref 0)
    //    |> bin__Msg with
    //| ApiRequest json ->
    //    json
    //    |> req__rep
    //    |> Some
    //| _ -> None

    None
