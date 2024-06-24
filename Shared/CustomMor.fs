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

// [Er] Structure

let Er__bin (bb:BytesBuilder) (v:Er) =

    match v with
    | Er.ApiNotExists ->
        int32__bin bb 0
    | Er.InvalideParameter ->
        int32__bin bb 1
    | Er.Unauthorized ->
        int32__bin bb 2
    | Er.Internal ->
        int32__bin bb 3

let bin__Er (bi:BinIndexed):Er =
    let bin,index = bi

    match bin__int32 bi with
    | 3 -> Er.Internal
    | 2 -> Er.Unauthorized
    | 1 -> Er.InvalideParameter
    | _ -> Er.ApiNotExists

let Er__json (v:Er) =

    let items = new List<string * Json>()

    match v with
    | Er.ApiNotExists ->
        ("enum",int32__json 0) |> items.Add
    | Er.InvalideParameter ->
        ("enum",int32__json 1) |> items.Add
    | Er.Unauthorized ->
        ("enum",int32__json 2) |> items.Add
    | Er.Internal ->
        ("enum",int32__json 3) |> items.Add

    items.ToArray() |> Json.Braket

let Er__jsonTbw (w:TextBlockWriter) (v:Er) =
    json__str w (Er__json v)

let Er__jsonStr (v:Er) =
    (Er__json v) |> json__strFinal


let json__Ero (json:Json):Er option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Er.ApiNotExists |> Some
            | 1 -> Er.InvalideParameter |> Some
            | 2 -> Er.Unauthorized |> Some
            | 3 -> Er.Internal |> Some
            | _ -> None
        | None -> None
    | None -> None

// [EuComplex] Structure

let EuComplex__bin (bb:BytesBuilder) (v:EuComplex) =

    Dictionary__bin (int64__bin) (CLINK__bin) bb v.clinks
    EU__bin bb v.eu

let bin__EuComplex (bi:BinIndexed):EuComplex =
    let bin,index = bi

    {
        clinks =
            bi
            |> (fun bi ->
                let v = new Dictionary<int64,CLINK>()
                bin__Dictionary (bin__int64) (bin__CLINK) v bi
                v)
        eu =
            bi
            |> bin__EU
    }

let EuComplex__json (v:EuComplex) =

    [|  ("clinks",Dictionary__json (int64__json) (CLINK__json) v.clinks)
        ("eu",EU__json v.eu)
         |]
    |> Json.Braket

let EuComplex__jsonTbw (w:TextBlockWriter) (v:EuComplex) =
    json__str w (EuComplex__json v)

let EuComplex__jsonStr (v:EuComplex) =
    (EuComplex__json v) |> json__strFinal


let json__EuComplexo (json:Json):EuComplex option =
    let fields = json |> json__items

    let mutable passOptions = true

    let clinkso =
        match json__tryFindByName json "clinks" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> (fun json ->
                json__Dictionaryo (json__int64o) (json__CLINKo) (new Dictionary<int64,CLINK>()) json) with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    let euo =
        match json__tryFindByName json "eu" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__EUo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            clinks = clinkso.Value
            eu = euo.Value} |> Some
    else
        None

// [BizComplex] Structure

let BizComplex__bin (bb:BytesBuilder) (v:BizComplex) =

    BIZ__bin bb v.biz

let bin__BizComplex (bi:BinIndexed):BizComplex =
    let bin,index = bi

    {
        biz =
            bi
            |> bin__BIZ
    }

let BizComplex__json (v:BizComplex) =

    [|  ("biz",BIZ__json v.biz)
         |]
    |> Json.Braket

let BizComplex__jsonTbw (w:TextBlockWriter) (v:BizComplex) =
    json__str w (BizComplex__json v)

let BizComplex__jsonStr (v:BizComplex) =
    (BizComplex__json v) |> json__strFinal


let json__BizComplexo (json:Json):BizComplex option =
    let fields = json |> json__items

    let mutable passOptions = true

    let bizo =
        match json__tryFindByName json "biz" with
        | None ->
            passOptions <- false
            None
        | Some v -> 
            match v |> json__BIZo with
            | Some res -> Some res
            | None ->
                passOptions <- false
                None

    if passOptions then
        {
            biz = bizo.Value} |> Some
    else
        None

// [Fact] Structure

let Fact__bin (bb:BytesBuilder) (v:Fact) =

    match v with
    | Fact.Undefined ->
        int32__bin bb 0

let bin__Fact (bi:BinIndexed):Fact =
    let bin,index = bi

    match bin__int32 bi with
    | _ -> Fact.Undefined

let Fact__json (v:Fact) =

    let items = new List<string * Json>()

    match v with
    | Fact.Undefined ->
        ("enum",int32__json 0) |> items.Add

    items.ToArray() |> Json.Braket

let Fact__jsonTbw (w:TextBlockWriter) (v:Fact) =
    json__str w (Fact__json v)

let Fact__jsonStr (v:Fact) =
    (Fact__json v) |> json__strFinal


let json__Facto (json:Json):Fact option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Fact.Undefined |> Some
            | _ -> None
        | None -> None
    | None -> None

// [Msg] Structure

let Msg__bin (bb:BytesBuilder) (v:Msg) =

    match v with
    | Msg.Heartbeat ->
        int32__bin bb 0
    | Msg.ApiRequest v ->
        int32__bin bb 1
        json__bin bb v
    | Msg.ApiResponse v ->
        int32__bin bb 2
        json__bin bb v
    | Msg.SingleFact v ->
        int32__bin bb 3
        Fact__bin bb v
    | Msg.MultiFact v ->
        int32__bin bb 4
        
        array__bin (Fact__bin) bb v

let bin__Msg (bi:BinIndexed):Msg =
    let bin,index = bi

    match bin__int32 bi with
    | 4 -> bin__array (bin__Fact) bi |> Msg.MultiFact
    | 3 -> bin__Fact bi |> Msg.SingleFact
    | 2 -> bin__json bi |> Msg.ApiResponse
    | 1 -> bin__json bi |> Msg.ApiRequest
    | _ -> Msg.Heartbeat

let Msg__json (v:Msg) =

    let items = new List<string * Json>()

    match v with
    | Msg.Heartbeat ->
        ("enum",int32__json 0) |> items.Add
    | Msg.ApiRequest v ->
        ("enum",int32__json 1) |> items.Add
        ("ApiRequest", v) |> items.Add
    | Msg.ApiResponse v ->
        ("enum",int32__json 2) |> items.Add
        ("ApiResponse", v) |> items.Add
    | Msg.SingleFact v ->
        ("enum",int32__json 3) |> items.Add
        ("SingleFact",Fact__json v) |> items.Add
    | Msg.MultiFact v ->
        ("enum",int32__json 4) |> items.Add
        ("MultiFact",
        array__json (Fact__json) v) |> items.Add

    items.ToArray() |> Json.Braket

let Msg__jsonTbw (w:TextBlockWriter) (v:Msg) =
    json__str w (Msg__json v)

let Msg__jsonStr (v:Msg) =
    (Msg__json v) |> json__strFinal


let json__Msgo (json:Json):Msg option =
    let fields = json |> json__items

    match json__tryFindByName json "enum" with
    | Some json ->
        match json__int32o json with
        | Some i ->
            match i with
            | 0 -> Msg.Heartbeat |> Some
            | 1 -> 
                match Some json with
                | Some v -> v |> Msg.ApiRequest |> Some
                | None -> None
            | 2 -> 
                match Some json with
                | Some v -> v |> Msg.ApiResponse |> Some
                | None -> None
            | 3 -> 
                match json__Facto json with
                | Some v -> v |> Msg.SingleFact |> Some
                | None -> None
            | 4 -> 
                match json__arrayo (json__Facto) json with
                | Some v -> v |> Msg.MultiFact |> Some
                | None -> None
            | _ -> None
        | None -> None
    | None -> None