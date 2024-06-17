
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Http
open Util.Zmq

open Server.Common
open Server.WebHandler

open UtilWebServer.Common

open BizLogics.Common

[<EntryPoint>]

let main argv =

    init()

    let httpHandler = 
        httpEcho 
            (Some plugin) 
            runtime.host.fsDir 
            runtime.host.defaultHtml 
            runtime 
            echoHandler
        |> reqhandler__httpHandler

    lauchWebServer 
        output 
        httpHandler
        wsHandler 
        zweb

    Util.Runtime.halt output "" ""

    0