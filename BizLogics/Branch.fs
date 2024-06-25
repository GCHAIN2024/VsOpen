module BizLogics.Branch

open System
open System.Text

open Util.Cat
open Util.Perf
open Util.Text
open Util.Json
open Util.HttpClient

open UtilWebServer.Json
open UtilWebServer.Api
open UtilWebServer.Auth
open UtilWebServer.Open

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Auth
open BizLogics.ApiPublic
open BizLogics.ApiEu



let branching (x:X) = 

    let bindx p = 
        x.proco <- Some p
        Suc x

    match x.service with
    | "public" -> 
        match x.api with
        | "ping" -> bindx api_Public_Ping
        | "auth" -> bindx auth
        | "listBiz" -> bindx api_Public_ListBiz
        | "loadCryptoLink" -> bindx api_Public_LoadCryptoLink
        | "checkoutCryptoLink" -> bindx api_Public_CheckoutCryptoLink
        | _ -> Fail(Er.ApiNotExists,x)
    | "eu" -> 
        
        let ec = x.sessiono.Value.identity.Value
        match x.api with
        | "myProfile" -> bindx (api_Eu_MyProfile ec)
        | "myClinks" -> bindx (api_Eu_MyClinks ec)
        | _ -> Fail(Er.ApiNotExists,x)

    | "admin" -> Fail(Er.ApiNotExists,x)
    | "open" -> Fail(Er.ApiNotExists,x)
    | _ -> Fail(Er.ApiNotExists,x)


let branch service api json = 

    use cw = new CodeWrapper("Server.WebHandler.branch")

    let mutable x = incoming__x runtime service api "" json
    
    match service with
    | "eu" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu
    | "admin" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu
    | "open" ->
        x <- 
            x 
            |> bind checkSession
            |> bind checkSessionEu

    | _ -> ()

    match
        x
        |> bind branching with
    | Suc x -> 
        use cw = new CodeWrapper("branch.exe")

        match x.proco with
        | Some p ->
            use cw = new CodeWrapper("Api." + x.api)
            p x
        | None -> [| ok |]
    | Fail(e,x) -> er e

