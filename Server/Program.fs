
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Http
open Util.Zmq

open Server.WebHandler

open UtilWebServer.Common

open BizLogics.Common
open BizLogics.Init

[<EntryPoint>]

let main argv =

    init runtime

    if true then

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
            wsHandlerZweb 
            (runtime.host.port |> port__zweb)

    else
        let engine = 
            Util.WebServer.prepEngine 
                output
                (Some plugin)
                runtime.host.fsDir
                runtime.host.defaultHtml
                runtime
                wsHandler
                runtime.host.port

        Util.WebServer.startEngine engine

    Util.Runtime.halt output "" ""

    0