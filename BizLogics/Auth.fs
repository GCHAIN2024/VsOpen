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

let ap = {
    getSocialAuthBiz = fun p -> p.SocialAuthBiz
    setSocialAuthBiz = fun p v -> p.SocialAuthBiz <- v
    getSocialAuthId = fun p -> p.SocialAuthId
    setSocialAuthId = fun p v -> p.SocialAuthId <- v
    metadata = EU_metadata
    p__complex = fun eu -> { eu = eu }
    complex__ids = fun ec -> (ec.eu.p.SocialAuthBiz,ec.eu.p.SocialAuthId)
    conn = conn }

let tryFindExistingx = tryFindExisting ap runtime.ecs
let tryCreateUserx = tryCreateUser ap runtime.ecs

let checkoutEu bizCode id = 

    let bizId = 
        if runtime.bcs.ContainsKey bizCode then
            runtime.bcs[bizCode].biz.ID
        else
            0L

    match bizCode with
    | "DISCORD" -> 
        tryFindExistingx bizId id
        |> optionProcessNone (fun _ -> tryCreateUserx bizId id)

    | _ -> None


let auth =
    socialAuth
        (Er.Internal,Er.InvalideParameter)
        (runtime.host.openDiscordAppId,runtime.host.openDiscordSecret)        
        checkoutEu
        EuComplex__json

