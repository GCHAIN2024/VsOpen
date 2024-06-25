
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Http
open Util.Zmq
open Util.WebServer

open Shared.Types

open Server.WebHandler

open UtilWebServer.Common

open BizLogics.Common
open BizLogics.Init
open BizLogics.Branch
open BizLogics.SSR

[<EntryPoint>]

let main argv =

    init runtime

    if runtime.host.zmq then

        //let httpHandler = 
        //    httpEcho 
        //        (Some echo) 
        //        runtime.host.fsDir 
        //        runtime.host.defaultHtml 
        //        runtime 
        //        (fun x -> Fail(Er.ApiNotExists, x))
        //    |> reqhandler__httpHandler

        //lauchWebServer 
        //    output 
        //    httpHandler
        //    wsHandlerZweb 
        //    (runtime.host.port |> port__zweb)
        ()

    else
        prepEngine 
            output
            echo
            runtime.host.fsDir
            runtime.host.defaultHtml
            runtime
            wsHandler
            runtime.host.port
        |> startEngine

    Util.Runtime.halt output "" ""

    0