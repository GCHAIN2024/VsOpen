module Shared.CustomMor

open LanguagePrimitives

open System
open System.Collections.Generic
open System.Text

open Util.Cat
open Util.Perf
open Util.Measures
open Util.Db
open Util.DbQuery
open Util.DbTx
open Util.Bin
open Util.Text
open Util.Json
open Util.Orm

open PreOrm

open Util.Bin
open Shared.OrmTypes
open Shared.Types
open Shared.OrmMor

// [TinyLink] Structure

let TinyLink__bin (bb:BytesBuilder) (v:TinyLink) =

    str__bin bb v.src
    str__bin bb v.dst

let bin__TinyLink (bi:BinIndexed):TinyLink =
    let bin,index = bi

    {
        src =
            bi
            |> bin__str
        dst =
            bi
            |> bin__str
    }

let TinyLink__json (v:TinyLink) =

    [|  ("src",str__json v.src)
        ("dst",str__json v.dst)
         |]
    |> Json.Braket

let TinyLink__jsonTbw (w:TextBlockWriter) (v:TinyLink) =
    json__str w (TinyLink__json v)

let TinyLink__jsonStr (v:TinyLink) =
    (TinyLink__json v) |> json__strFinal


let json__TinyLinko (json:Json):TinyLink option =
    let fields = json |> json__items

    let mutable passOptions = true

    let srco =
        match json__tryFindByName json "src" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__stro with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let dsto =
        match json__tryFindByName json "dst" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__stro with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            src = srco.Value
            dst = dsto.Value} |> Some
    else
        None