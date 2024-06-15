module Server.Common

open System
open System.Text
open System.IO
open System.Diagnostics


open Util.Zmq

type Host = {
defaultHtml: string
fsDir: string }

type Runtime = {
host: Host
zweb: ZmqWeb
output: string -> unit }

let since = DateTime.UtcNow

let output:string -> unit = 

    let assbly = System.Reflection.Assembly.GetCallingAssembly()
    let dir = Directory.GetCurrentDirectory()
    if dir.EndsWith "WebService" then
        Debug.WriteLine
    else if dir.EndsWith "WebApp" then
        fun s ->
            let elapse = DateTime.UtcNow.Subtract since
            [|
                elapse.Days.ToString("000") + "."
                elapse.Hours.ToString("00") + ":"
                elapse.Minutes.ToString("00") + ":"
                elapse.Seconds.ToString("00") + "."
                elapse.Milliseconds.ToString("000") + "> "
                s |]
            |> String.Concat
            |> Debug.WriteLine
    else
        Console.OutputEncoding <- Encoding.Unicode
        Console.WriteLine


let port = 12077

let zweb = create__ZWeb 2 port LogLevel.All false [||]


let runtime = {
    host = {
        defaultHtml = "index.html"
        fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }
    zweb = zweb
    output = output }
