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

open UtilWebServer.Constants
open UtilWebServer.DbLogger
open UtilWebServer.Init

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types

open BizLogics.Common
open BizLogics.Ca

let init runtime = 

    "Init ..."
    |> runtime.output

    conn <- runtime.host.conn

    dbLoggero <- 
        (fun log -> 
            let p = pLOG_empty()
            p.Content <- log.content
            p.Location <- log.location
            p.Sql <- log.sql
            p)
        |> createDbLogger LOG_metadata conn
        |> Some

    Shared.OrmMor.init()

    (fun (i:LANG) -> 
        runtime.langs[i.p.Code2] <- i)
    |> loadAll runtime.output conn LANG_metadata

    (fun i -> 
        runtime.ecs[i.ID] <- 
            {
                eu = i })
    |> loadAll runtime.output conn EU_metadata

    (fun (i:BIZ) -> 
        runtime.bcs[i.p.Code] <- 
            {
                biz = i })
    |> loadAll runtime.output conn BIZ_metadata

    freqBizCodes
    |> Array.iter(fun code ->
        if runtime.bcs.ContainsKey code = false then
            match createBiz code with
            | Some biz -> 
                runtime.bcs[code] <- 
                    {   
                        biz = biz }
            | None ->
                halt runtime.output ("BizLogics.Init.createBiz [" + code + "]") ""
        ())

    (fun i -> 
        runtime.bizowners[i.ID] <- i)
    |> loadAll runtime.output conn BIZOWNER_metadata
