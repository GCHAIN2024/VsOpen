﻿module BizLogics.Common

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
    fsDir = @"C:\Dev\GCHAIN2024\GChainVsOpen\Deploy" }

type EuComplex = {
eu: EU }

type BizComplex = {
biz: BIZ }

type SessionRole =
| EndUser of EuComplex
| Visitor

type Session = UtilWebServer.Auth.Session<SessionRole,unit>

type Runtime = {
host: Host
langs: ConcurrentDictionary<string,LANG>
domainnames: ConcurrentDictionary<string,DOMAINNAME>
hashFull__clinks: ConcurrentDictionary<string,CLINK>
tiny__full: ConcurrentDictionary<string,string>
ecs: ConcurrentDictionary<int64,EuComplex>
bcs: ConcurrentDictionary<string,BizComplex>
bizowners: ConcurrentDictionary<int64,BIZOWNER>
sessions: ConcurrentDictionary<string,Session>
output: string -> unit }

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
        langs = new ConcurrentDictionary<string,LANG>()
        domainnames = new ConcurrentDictionary<string,DOMAINNAME>()
        hashFull__clinks = new ConcurrentDictionary<string,CLINK>()
        tiny__full = new ConcurrentDictionary<string,string>()
        ecs = new ConcurrentDictionary<int64,EuComplex>()
        bcs = new ConcurrentDictionary<string,BizComplex>()
        bizowners = new ConcurrentDictionary<int64,BIZOWNER>()
        sessions = new ConcurrentDictionary<string,Session>()
        output = output }

