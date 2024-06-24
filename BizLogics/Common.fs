module BizLogics.Common

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

let domain = "gcha.in"
let site = "GCHA.IN"

let defaultHost() = {
    zmq = true
    port = 80
    conn = "server=.; database=GCHAIN; Trusted_Connection=True;"
    defaultHtml = "index.html"

    openDiscordAppId = 
        [|  "1254790111"
            "913181274" |]
        |> String.Concat
    openDiscordPubKey = 
        [|  "e0300e71e2dc"
            "94ec42425c"
            "eea8faed6b6"
            "172158dbbc1"
            "b882fa2750f"
            "b55dec22a" |]
        |> String.Concat
    openDiscordSecret = 
        [|  "YwZeJGUrR"
            "JwL3E7V"
            "cwlgtvJ_"
            "oeT01nom" |]
        |> String.Concat

    fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }

type Session = SessionTemplate<EuComplex,unit>
type Sessions = SessionsTemplate<EuComplex,unit>

type RuntimeData = {
langs: ConcurrentDictionary<string,LANG>
domainnames: ConcurrentDictionary<string,DOMAINNAME>
hashFull__clinks: ConcurrentDictionary<string,CLINK>
tiny__full: ConcurrentDictionary<string,string>
bcs: ConcurrentDictionary<string,BizComplex>
bizowners: ConcurrentDictionary<int64,BIZOWNER> }

type Runtime = RuntimeTemplate<EuComplex,unit,RuntimeData>

type X = UtilWebServer.Api.ApiCtx<Runtime,Session,Er>

type HostEnum = 
| Prod
| ProdLinux
| RevengeDev

let hostEnum = 
    match Environment.MachineName with
    | "MAIN" -> RevengeDev
    | "ikaubuntu" -> ProdLinux
    | _ -> Prod

let host e = 

    let h = defaultHost()

    match e with
    | Prod -> 
        h.zmq <- false
        h.port <- 11781
    | ProdLinux ->
        h.zmq <- false
        h.conn <- "server=10.0.0.14;database=GCHAIN;Trusted_Connection=False;User ID=sa;Password=GCHAIN"
        h.port <- 11781
        h.fsDir <- System.IO.Path.Combine("/home", "dev", "GCHAIN2024", "GChainVsOpen", "Deploy")
    | RevengeDev -> 
        h.zmq <- false

    h

let runtime = 
    let host = host hostEnum

    {
        host = host
        data = {
            langs = new ConcurrentDictionary<string,LANG>()
            domainnames = new ConcurrentDictionary<string,DOMAINNAME>()
            hashFull__clinks = new ConcurrentDictionary<string,CLINK>()
            tiny__full = new ConcurrentDictionary<string,string>()
            bcs = new ConcurrentDictionary<string,BizComplex>()
            bizowners = new ConcurrentDictionary<int64,BIZOWNER>() }
        users = new ConcurrentDictionary<int64,EuComplex>()
        sessions = new ConcurrentDictionary<string,Session>()
        output = output }

