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
open UtilWebServer.Auth
open UtilWebServer.SSR

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Auth
open BizLogics.ApiPublic
open BizLogics.ApiEu
open BizLogics.Branch
open BizLogics.SSR


let echo req = 

    if req.pathline.StartsWith "/gchain" then
        req.pathline <- req.pathline.Substring "/gchain".Length

    if req.pathline = "/" then
        ssrPageHome
        |> render (hash1,hash2)
        |> bin__StandardResponse "text/html"
        |> Some
    else if req.pathline.StartsWith "/redirect?" then
        let code = 
            req.pathline.IndexOf "redirect?code=" + "redirect?code=".Length
            |> req.pathline.Substring
        None
    else if req.pathline = "/open.js" then
        openJavaScript
        |> str__StandardResponse "text/javascript"
        |> Some
    else if req.pathline.StartsWith "/t/" then
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
