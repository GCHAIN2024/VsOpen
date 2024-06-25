module BizLogics.Auth

open System
open System.Text
open System.Collections.Generic
open System.Collections.Concurrent

open Util.Cat
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
open UtilWebServer.Session
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
    p__complex = fun eu -> { 
        clinks = new Dictionary<int64,CLINK>()
        eu = eu }
    complex__ids = fun ec -> (ec.eu.p.SocialAuthBiz,ec.eu.p.SocialAuthId)
    conn = conn }

let tryFindExistingx = tryFindExisting ap runtime.users
let tryCreateUserx = tryCreateUser ap runtime.users

let checkoutEu bizCode id = 

    let bizId = 
        if runtime.data.bcs.ContainsKey bizCode then
            runtime.data.bcs[bizCode].biz.ID
        else
            0L

    match bizCode with
    | "DISCORD" -> 
        tryFindExistingx bizId id
        |> optionProcessNone (fun _ -> tryCreateUserx bizId id)

    | _ -> None


let auth: X -> ApiReturn =
    socialAuth
        (Er.Internal,Er.InvalideParameter)
        (runtime.host.openDiscordAppId,runtime.host.openDiscordSecret)        
        runtime
        checkoutEu
        EuComplex__json

let checkSession: X -> CtxWrappedX = checkRuntimeSession Er.Unauthorized runtime.sessions

let checkSessionEu x = 
    match x.sessiono.Value.identity with
    | Some eu -> Suc x
    | _ -> Fail(Er.Unauthorized,x)
