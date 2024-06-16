module Server.Common

open System
open System.Text
open System.IO
open System.Diagnostics

open Util.Zmq

open UtilWebServer.Common

type Host = {
defaultHtml: string
fsDir: string }

type Runtime = {
host: Host
zweb: ZmqWeb
output: string -> unit }

let runtime = {
    host = {
        defaultHtml = "index.html"
        fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }
    zweb = zweb
    output = output }
