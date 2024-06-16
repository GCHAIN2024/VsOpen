module Server.WebHandler

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Json
open Util.Zmq

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open Server.Common

open UtilWebServer.Common

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
        | "SignUp" -> ()
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
