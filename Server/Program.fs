
module Server.Launching

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Cat
open Util.Perf
open Util.Zmq

open Server.Common
open Server.WebHandler

open UtilWebServer.Common

[<EntryPoint>]

let main argv =

    init()

    zweb.disconnector.Add(fun bin -> ())
    lauchWebServer 
        output 
        (httpHandler (httpEcho runtime.host.fsDir runtime.host.defaultHtml runtime echoHandler))
        wsHandler 
        zweb

    Util.Runtime.halt output "" ""

    0