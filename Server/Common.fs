module Server.Common

open System
open System.Text
open System.IO
open System.Diagnostics
open System.Threading

open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Common

open Shared.OrmTypes
open Shared.OrmMor

type Host = {
conn: string
defaultHtml: string
fsDir: string }

type Runtime = {
host: Host
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
    | Prod -> {
            conn = "server=127.0.0.1; user=sa; database=GCHAIN"
            defaultHtml = "index.html"
            fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }
    | _ -> {
            conn = "server=127.0.0.1; user=sa; database=GCHAIN"
            defaultHtml = "index.html"
            fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }

let runtime = {
    host = host hostEnum
    zweb = zweb
    output = output }

let init() = 

    conn <- runtime.host.conn

    dbLoggero <- 
        (fun log -> 
    
            let p = pLOG_empty()

            p.Content <- log.content
            p.Location <- log.location
            p.Sql <- log.sql

            let pretx = None |> opctx__pretx

            let tid = Interlocked.Increment LOG_metadata.id

            (tid,pretx.dt,pretx.dt,tid,p)
            |> build_create_sql LOG_metadata
            |> pretx.sqls.Add

            pretx
            |> pipeline conn
            |> ignore)
        |> Some
