module BizLogics.Auth

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Text
open Util.Crypto
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.Common

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

open BizLogics.Common
open BizLogics.Ca

let tryCreateEu bizId id = 

    let pretx = None |> opctx__pretx
    
    let rcd = 

        let p = pEU_empty()
            
        p.SocialAuthBiz <- bizId
        p.SocialAuthId <- id

        p
        |> populateCreateTx pretx EU_metadata

    if pretx |> loggedPipeline "BizLogics.Auth.tryCreateEu" conn then
        let ec = { eu = rcd }
        runtime.ecs[rcd.ID] <- ec
        Some ec
    else
        None

let checkoutEu bizCode id = 

    match bizCode with
    | "DISCORD" -> 

        let bizId = runtime.bcs[bizCode].biz.ID
        match
            runtime.ecs.Values
            |> Seq.tryFind(fun ec -> 
                if ec.eu.p.SocialAuthBiz = bizId then
                    ec.eu.p.SocialAuthId = id
                else
                    false) with
        | Some ec -> Some ec
        | None -> tryCreateEu bizId id

    | _ -> None
