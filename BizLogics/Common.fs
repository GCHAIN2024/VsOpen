module BizLogics.Common

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Text
open Util.Crypto
open Util.DbTx
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.Common

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

type Host = {
conn: string
defaultHtml: string
fsDir: string }

type EuComplex = {
eu: EU }

type Runtime = {
host: Host
ecs: ConcurrentDictionary<int64,EuComplex>
zweb: ZmqWeb
output: string -> unit }

type HostEnum = 
| Prod
| RevengeDev

let hostEnum = 
    match Environment.MachineName with
    | _ -> RevengeDev

let host e = 

    match e with
    | Prod -> 
        {
            conn = "server=127.0.0.1; user=sa; database=GCHAIN"
            defaultHtml = "index.html"
            fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }
    | _ -> 
        {
            conn = "server=127.0.0.1; user=sa; database=GCHAIN"
            defaultHtml = "index.html"
            fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }

let runtime = {
    host = host hostEnum
    zweb = zweb
    output = output }
