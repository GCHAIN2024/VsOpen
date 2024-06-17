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

open Server.Common

open UtilWebServer.Common

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
        | _ -> Fail(Error.ApiNotExists, x)
    | "admin" -> 
        match x.api with
        | _ -> Fail(Error.ApiNotExists, x)
    | _ -> Fail(Error.ApiNotExists, x)


let apiHandler json = 

    match json with
    | Json.Str apiname -> 
        match apiname with
        | "CheckoutTinyLink" -> 
            //url__tinylink
            ()
        | _ -> ()

    | _ -> ()


let wsHandler zweb wsp =

    "<< Client: " + wsp.client.ToString() + " << incoming " + wsp.bin.Length.ToString() + " bytes"
    |> output

    match
        (wsp.bin, ref 0)
        |> bin__Msg with
    | ApiRequest json ->

        match tryFindByAtt "api" json with
        | Some (n,v) -> apiHandler v
        | _ -> ()

    | _ -> ()

    //wsp.bin |> binPushWsToAll zweb

    ">> Server Broadcast >> " + wsp.bin.Length.ToString() + " bytes"
    |> output

    None
