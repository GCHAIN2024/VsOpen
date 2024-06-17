module BizLogics.Ca

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

let createBiz code = 

    let pretx = None |> opctx__pretx

    let rcd = 
        let p = pBIZ_empty()

        p.Code <- code

        p
        |> populateCreateTx pretx BIZ_metadata

    if pretx |> loggedPipeline "BizLogics.Ca.code__pBiz" conn then
        Some rcd
    else
        None
