module Shared.Types

open System
open System.Text
open System.Collections.Generic

open Util.Text
open Util.Json

open Shared.OrmTypes

//[TypeManaged]{

type Er = 
| ApiNotExists
| InvalideParameter
| Internal

type EuComplex = {
eu: EU }

type BizComplex = {
biz: BIZ }

type Fact =
| Undefined

type Msg = 
| Heartbeat
| ApiRequest of Json
| ApiResponse of Json
| SingleFact of Fact
| MultiFact of Fact[]


//}


