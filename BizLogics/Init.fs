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

let init (runtime:Runtime) = 

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
        runtime.data.langs[i.p.Code2] <- i)
    |> loadAll runtime.output conn LANG_metadata

    (fun i -> 
        runtime.users[i.ID] <- 
            {
                clinks = new Dictionary<int64,CLINK>()
                eu = i })
    |> loadAll runtime.output conn EU_metadata

    (fun (i:BIZ) -> 
        runtime.data.bcs[i.p.Code] <- 
            {
                biz = i })
    |> loadAll runtime.output conn BIZ_metadata

    freqBizCodes
    |> Array.iter(fun code ->
        if runtime.data.bcs.ContainsKey code = false then
            match createBiz code with
            | Some biz -> 
                runtime.data.bcs[code] <- 
                    {   
                        biz = biz }
            | None ->
                halt runtime.output ("BizLogics.Init.createBiz [" + code + "]") ""
        ())

    (fun i -> 
        runtime.data.bizowners[i.ID] <- i)
    |> loadAll runtime.output conn BIZOWNER_metadata

    (fun i -> 
        runtime.data.hashFull__clinks[i.p.HashFull] <- i
        runtime.data.tiny__full[i.p.HashTiny] <- i.p.HashFull
        
        if i.p.Owner > 0L then
            runtime.users[i.p.Owner].clinks[i.ID] <- i)
    |> loadAll runtime.output conn CLINK_metadata
