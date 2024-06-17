module BizLogics.Init

open System
open System.Collections.Generic
open System.Collections.Concurrent
open System.Threading

open Util.Runtime
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Init

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types

open BizLogics.Common

let init runtime = 

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

    (fun i -> 
        runtime.ecs[i.ID] <- 
            {
                eu = i })
    |> loadAll runtime.output conn EU_metadata
