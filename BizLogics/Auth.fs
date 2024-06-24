module BizLogics.Auth

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.ADT
open Util.Text
open Util.Json
open Util.Crypto
open Util.Db
open Util.DbTx
open Util.Orm
open Util.Zmq

open UtilWebServer.DbLogger
open UtilWebServer.Db
open UtilWebServer.Common
open UtilWebServer.Json
open UtilWebServer.Api
open UtilWebServer.Open
open UtilWebServer.Auth

open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor
open Shared.CustomMor

open BizLogics.Common
open BizLogics.Ca

let tryCreateEu bizId id = 
    (fun _ -> 
        let p = pEU_empty()
        p.SocialAuthBiz <- bizId
        p.SocialAuthId <- id
        p)
    |> tryCreateUser
        "BizLogics.Auth.tryCreateEu" 
        conn    
        EU_metadata
    |> optionProcessSome
        (fun rcd -> 
            let ec = { eu = rcd }
            runtime.ecs[rcd.ID] <- ec
            ec)

let tryFindExisting bizId id = 
    runtime.ecs.Values
    |> Seq.tryFind(fun ec -> ec.eu.p.SocialAuthBiz = bizId && ec.eu.p.SocialAuthId = id)

let checkoutEu bizCode id = 

    let bizId = 
        if runtime.bcs.ContainsKey bizCode then
            runtime.bcs[bizCode].biz.ID
        else
            0L

    match bizCode with
    | "DISCORD" -> 
        tryFindExisting bizId id
        |> optionProcess 
            (fun ec -> Some ec)
            (fun _ -> tryCreateEu bizId id)

    | _ -> None


let auth =
    socialAuth
        (Er.Internal,Er.InvalideParameter)
        (runtime.host.openDiscordAppId,runtime.host.openDiscordSecret)        
        checkoutEu
        EuComplex__json

