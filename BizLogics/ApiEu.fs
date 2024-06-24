

module BizLogics.ApiEu

open System
open System.Text

open Util.Text
open Util.Json
open Util.HttpClient

open UtilWebServer.Json
open UtilWebServer.Api
open UtilWebServer.Open

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Auth


let api_Eu_MyClinks ec x =

    ec.clinks.Values
    |> Seq.toArray
    |> Array.map CLINK__json
    |> wrapOkAry
