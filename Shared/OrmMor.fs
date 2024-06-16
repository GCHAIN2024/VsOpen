module Shared.OrmMor

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

open System.Data.SqlClient
open System.Threading
open Util.Bin
open Shared.OrmTypes
open Shared.Types

// [ADDRESS] Structure

let pADDRESS__bin (bb:BytesBuilder) (p:pADDRESS) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binLine1 = p.Line1 |> Encoding.UTF8.GetBytes
    binLine1.Length |> BitConverter.GetBytes |> bb.append
    binLine1 |> bb.append
    
    let binLine2 = p.Line2 |> Encoding.UTF8.GetBytes
    binLine2.Length |> BitConverter.GetBytes |> bb.append
    binLine2 |> bb.append
    
    let binState = p.State |> Encoding.UTF8.GetBytes
    binState.Length |> BitConverter.GetBytes |> bb.append
    binState |> bb.append
    
    let binCounty = p.County |> Encoding.UTF8.GetBytes
    binCounty.Length |> BitConverter.GetBytes |> bb.append
    binCounty |> bb.append
    
    let binTown = p.Town |> Encoding.UTF8.GetBytes
    binTown.Length |> BitConverter.GetBytes |> bb.append
    binTown |> bb.append
    
    let binContact = p.Contact |> Encoding.UTF8.GetBytes
    binContact.Length |> BitConverter.GetBytes |> bb.append
    binContact |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    let binEmail = p.Email |> Encoding.UTF8.GetBytes
    binEmail.Length |> BitConverter.GetBytes |> bb.append
    binEmail |> bb.append
    
    let binZip = p.Zip |> Encoding.UTF8.GetBytes
    binZip.Length |> BitConverter.GetBytes |> bb.append
    binZip |> bb.append
    
    p.City |> BitConverter.GetBytes |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    let binRemarks = p.Remarks |> Encoding.UTF8.GetBytes
    binRemarks.Length |> BitConverter.GetBytes |> bb.append
    binRemarks |> bb.append

let ADDRESS__bin (bb:BytesBuilder) (v:ADDRESS) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pADDRESS__bin bb v.p

let bin__pADDRESS (bi:BinIndexed):pADDRESS =
    let bin,index = bi

    let p = pADDRESS_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Line1 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Line1 <- Encoding.UTF8.GetString(bin,index.Value,count_Line1)
    index.Value <- index.Value + count_Line1
    
    let count_Line2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Line2 <- Encoding.UTF8.GetString(bin,index.Value,count_Line2)
    index.Value <- index.Value + count_Line2
    
    let count_State = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.State <- Encoding.UTF8.GetString(bin,index.Value,count_State)
    index.Value <- index.Value + count_State
    
    let count_County = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.County <- Encoding.UTF8.GetString(bin,index.Value,count_County)
    index.Value <- index.Value + count_County
    
    let count_Town = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Town <- Encoding.UTF8.GetString(bin,index.Value,count_Town)
    index.Value <- index.Value + count_Town
    
    let count_Contact = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Contact <- Encoding.UTF8.GetString(bin,index.Value,count_Contact)
    index.Value <- index.Value + count_Contact
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    let count_Email = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Email <- Encoding.UTF8.GetString(bin,index.Value,count_Email)
    index.Value <- index.Value + count_Email
    
    let count_Zip = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Zip <- Encoding.UTF8.GetString(bin,index.Value,count_Zip)
    index.Value <- index.Value + count_Zip
    
    p.City <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Remarks = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Remarks <- Encoding.UTF8.GetString(bin,index.Value,count_Remarks)
    index.Value <- index.Value + count_Remarks
    
    p

let bin__ADDRESS (bi:BinIndexed):ADDRESS =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pADDRESS bi }

let pADDRESS__json (p:pADDRESS) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Line1",p.Line1 |> Json.Str)
        ("Line2",p.Line2 |> Json.Str)
        ("State",p.State |> Json.Str)
        ("County",p.County |> Json.Str)
        ("Town",p.Town |> Json.Str)
        ("Contact",p.Contact |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Zip",p.Zip |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Remarks",p.Remarks |> Json.Str) |]
    |> Json.Braket

let ADDRESS__json (v:ADDRESS) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Line1",p.Line1 |> Json.Str)
        ("Line2",p.Line2 |> Json.Str)
        ("State",p.State |> Json.Str)
        ("County",p.County |> Json.Str)
        ("Town",p.Town |> Json.Str)
        ("Contact",p.Contact |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Zip",p.Zip |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Remarks",p.Remarks |> Json.Str) |]
    |> Json.Braket

let ADDRESS__jsonTbw (w:TextBlockWriter) (v:ADDRESS) =
    json__str w (ADDRESS__json v)

let ADDRESS__jsonStr (v:ADDRESS) =
    (ADDRESS__json v) |> json__strFinal


let json__pADDRESSo (json:Json):pADDRESS option =
    let fields = json |> json__items

    let p = pADDRESS_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Line1 <- checkfieldz fields "Line1" 300
    
    p.Line2 <- checkfieldz fields "Line2" 300
    
    p.State <- checkfieldz fields "State" 16
    
    p.County <- checkfieldz fields "County" 16
    
    p.Town <- checkfieldz fields "Town" 16
    
    p.Contact <- checkfieldz fields "Contact" 64
    
    p.Tel <- checkfieldz fields "Tel" 20
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Zip <- checkfieldz fields "Zip" 16
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Remarks <- checkfield fields "Remarks"
    
    p |> Some
    

let json__ADDRESSo (json:Json):ADDRESS option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pADDRESS_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Line1 <- checkfieldz fields "Line1" 300
    
    p.Line2 <- checkfieldz fields "Line2" 300
    
    p.State <- checkfieldz fields "State" 16
    
    p.County <- checkfieldz fields "County" 16
    
    p.Town <- checkfieldz fields "Town" 16
    
    p.Contact <- checkfieldz fields "Contact" 64
    
    p.Tel <- checkfieldz fields "Tel" 20
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Zip <- checkfieldz fields "Zip" 16
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Remarks <- checkfield fields "Remarks"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [BIZ] Structure

let pBIZ__bin (bb:BytesBuilder) (p:pBIZ) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Parent |> BitConverter.GetBytes |> bb.append
    
    p.BasicAcct |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binWebsite = p.Website |> Encoding.UTF8.GetBytes
    binWebsite.Length |> BitConverter.GetBytes |> bb.append
    binWebsite |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.City |> BitConverter.GetBytes |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.IsSocial |> BitConverter.GetBytes |> bb.append
    
    p.IsCmsSource |> BitConverter.GetBytes |> bb.append
    
    p.IsPay |> BitConverter.GetBytes |> bb.append
    
    p.MomentLatest |> BitConverter.GetBytes |> bb.append
    
    p.CountFollowers |> BitConverter.GetBytes |> bb.append
    
    p.CountFollows |> BitConverter.GetBytes |> bb.append
    
    p.CountMoments |> BitConverter.GetBytes |> bb.append
    
    p.CountViews |> BitConverter.GetBytes |> bb.append
    
    p.CountComments |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbUps |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbDns |> BitConverter.GetBytes |> bb.append
    
    p.IsCrawling |> BitConverter.GetBytes |> bb.append
    
    p.IsGSeries |> BitConverter.GetBytes |> bb.append
    
    let binRemarksCentral = p.RemarksCentral |> Encoding.UTF8.GetBytes
    binRemarksCentral.Length |> BitConverter.GetBytes |> bb.append
    binRemarksCentral |> bb.append
    
    p.Agent |> BitConverter.GetBytes |> bb.append
    
    let binSiteCats = p.SiteCats |> Encoding.UTF8.GetBytes
    binSiteCats.Length |> BitConverter.GetBytes |> bb.append
    binSiteCats |> bb.append
    
    let binConfiguredCats = p.ConfiguredCats |> Encoding.UTF8.GetBytes
    binConfiguredCats.Length |> BitConverter.GetBytes |> bb.append
    binConfiguredCats |> bb.append

let BIZ__bin (bb:BytesBuilder) (v:BIZ) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pBIZ__bin bb v.p

let bin__pBIZ (bi:BinIndexed):pBIZ =
    let bin,index = bi

    let p = pBIZ_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Parent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BasicAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_Website = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Website <- Encoding.UTF8.GetString(bin,index.Value,count_Website)
    index.Value <- index.Value + count_Website
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.City <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IsSocial <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsCmsSource <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsPay <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.MomentLatest <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollowers <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollows <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountMoments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountViews <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountComments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbUps <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbDns <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.IsCrawling <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsGSeries <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_RemarksCentral = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RemarksCentral <- Encoding.UTF8.GetString(bin,index.Value,count_RemarksCentral)
    index.Value <- index.Value + count_RemarksCentral
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_SiteCats = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.SiteCats <- Encoding.UTF8.GetString(bin,index.Value,count_SiteCats)
    index.Value <- index.Value + count_SiteCats
    
    let count_ConfiguredCats = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ConfiguredCats <- Encoding.UTF8.GetString(bin,index.Value,count_ConfiguredCats)
    index.Value <- index.Value + count_ConfiguredCats
    
    p

let bin__BIZ (bi:BinIndexed):BIZ =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pBIZ bi }

let pBIZ__json (p:pBIZ) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Website",p.Website |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("IsSocial",if p.IsSocial then Json.True else Json.False)
        ("IsCmsSource",if p.IsCmsSource then Json.True else Json.False)
        ("IsPay",if p.IsPay then Json.True else Json.False)
        ("MomentLatest",p.MomentLatest.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("IsCrawling",if p.IsCrawling then Json.True else Json.False)
        ("IsGSeries",if p.IsGSeries then Json.True else Json.False)
        ("RemarksCentral",p.RemarksCentral |> Json.Str)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("SiteCats",p.SiteCats |> Json.Str)
        ("ConfiguredCats",p.ConfiguredCats |> Json.Str) |]
    |> Json.Braket

let BIZ__json (v:BIZ) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Parent",p.Parent.ToString() |> Json.Num)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Website",p.Website |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("City",p.City.ToString() |> Json.Num)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("IsSocial",if p.IsSocial then Json.True else Json.False)
        ("IsCmsSource",if p.IsCmsSource then Json.True else Json.False)
        ("IsPay",if p.IsPay then Json.True else Json.False)
        ("MomentLatest",p.MomentLatest.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("IsCrawling",if p.IsCrawling then Json.True else Json.False)
        ("IsGSeries",if p.IsGSeries then Json.True else Json.False)
        ("RemarksCentral",p.RemarksCentral |> Json.Str)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("SiteCats",p.SiteCats |> Json.Str)
        ("ConfiguredCats",p.ConfiguredCats |> Json.Str) |]
    |> Json.Braket

let BIZ__jsonTbw (w:TextBlockWriter) (v:BIZ) =
    json__str w (BIZ__json v)

let BIZ__jsonStr (v:BIZ) =
    (BIZ__json v) |> json__strFinal


let json__pBIZo (json:Json):pBIZ option =
    let fields = json |> json__items

    let p = pBIZ_empty()
    
    p.Code <- checkfieldz fields "Code" 256
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Website <- checkfieldz fields "Website" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.IsSocial <- checkfield fields "IsSocial" = "true"
    
    p.IsCmsSource <- checkfield fields "IsCmsSource" = "true"
    
    p.IsPay <- checkfield fields "IsPay" = "true"
    
    p.MomentLatest <- checkfield fields "MomentLatest" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.IsCrawling <- checkfield fields "IsCrawling" = "true"
    
    p.IsGSeries <- checkfield fields "IsGSeries" = "true"
    
    p.RemarksCentral <- checkfield fields "RemarksCentral"
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.SiteCats <- checkfield fields "SiteCats"
    
    p.ConfiguredCats <- checkfield fields "ConfiguredCats"
    
    p |> Some
    

let json__BIZo (json:Json):BIZ option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pBIZ_empty()
    
    p.Code <- checkfieldz fields "Code" 256
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Website <- checkfieldz fields "Website" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.City <- checkfield fields "City" |> parse_int64
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.IsSocial <- checkfield fields "IsSocial" = "true"
    
    p.IsCmsSource <- checkfield fields "IsCmsSource" = "true"
    
    p.IsPay <- checkfield fields "IsPay" = "true"
    
    p.MomentLatest <- checkfield fields "MomentLatest" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.IsCrawling <- checkfield fields "IsCrawling" = "true"
    
    p.IsGSeries <- checkfield fields "IsGSeries" = "true"
    
    p.RemarksCentral <- checkfield fields "RemarksCentral"
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.SiteCats <- checkfield fields "SiteCats"
    
    p.ConfiguredCats <- checkfield fields "ConfiguredCats"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CRY] Structure

let pCRY__bin (bb:BytesBuilder) (p:pCRY) =

    
    let binCode2 = p.Code2 |> Encoding.UTF8.GetBytes
    binCode2.Length |> BitConverter.GetBytes |> bb.append
    binCode2 |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binFullname = p.Fullname |> Encoding.UTF8.GetBytes
    binFullname.Length |> BitConverter.GetBytes |> bb.append
    binFullname |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    p.Cur |> BitConverter.GetBytes |> bb.append
    
    p.Capital |> BitConverter.GetBytes |> bb.append
    
    p.Place |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append

let CRY__bin (bb:BytesBuilder) (v:CRY) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCRY__bin bb v.p

let bin__pCRY (bi:BinIndexed):pCRY =
    let bin,index = bi

    let p = pCRY_empty()
    
    let count_Code2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code2 <- Encoding.UTF8.GetString(bin,index.Value,count_Code2)
    index.Value <- index.Value + count_Code2
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Fullname = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Fullname <- Encoding.UTF8.GetString(bin,index.Value,count_Fullname)
    index.Value <- index.Value + count_Fullname
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    p.Cur <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Capital <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Place <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__CRY (bi:BinIndexed):CRY =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCRY bi }

let pCRY__json (p:pCRY) =

    [|
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Fullname",p.Fullname |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Cur",p.Cur.ToString() |> Json.Num)
        ("Capital",p.Capital.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num) |]
    |> Json.Braket

let CRY__json (v:CRY) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Fullname",p.Fullname |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Cur",p.Cur.ToString() |> Json.Num)
        ("Capital",p.Capital.ToString() |> Json.Num)
        ("Place",p.Place.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num) |]
    |> Json.Braket

let CRY__jsonTbw (w:TextBlockWriter) (v:CRY) =
    json__str w (CRY__json v)

let CRY__jsonStr (v:CRY) =
    (CRY__json v) |> json__strFinal


let json__pCRYo (json:Json):pCRY option =
    let fields = json |> json__items

    let p = pCRY_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Fullname <- checkfieldz fields "Fullname" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    p.Cur <- checkfield fields "Cur" |> parse_int64
    
    p.Capital <- checkfield fields "Capital" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p |> Some
    

let json__CRYo (json:Json):CRY option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCRY_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Fullname <- checkfieldz fields "Fullname" 256
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Tel <- checkfieldz fields "Tel" 4
    
    p.Cur <- checkfield fields "Cur" |> parse_int64
    
    p.Capital <- checkfield fields "Capital" |> parse_int64
    
    p.Place <- checkfield fields "Place" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CUR] Structure

let pCUR__bin (bb:BytesBuilder) (p:pCUR) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Hidden |> BitConverter.GetBytes |> bb.append
    
    p.IsSac |> BitConverter.GetBytes |> bb.append
    
    p.IsTransfer |> BitConverter.GetBytes |> bb.append
    
    p.IsCash |> BitConverter.GetBytes |> bb.append
    
    p.EnableReward |> BitConverter.GetBytes |> bb.append
    
    p.EnableOTC |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.CurType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Dec |> BitConverter.GetBytes |> bb.append
    
    p.AnchorRate |> BitConverter.GetBytes |> bb.append
    
    p.Freezable |> BitConverter.GetBytes |> bb.append
    
    p.Authorizable |> BitConverter.GetBytes |> bb.append
    
    let binChaninID = p.ChaninID |> Encoding.UTF8.GetBytes
    binChaninID.Length |> BitConverter.GetBytes |> bb.append
    binChaninID |> bb.append
    
    let binChaninName = p.ChaninName |> Encoding.UTF8.GetBytes
    binChaninName.Length |> BitConverter.GetBytes |> bb.append
    binChaninName |> bb.append
    
    let binContractAddress = p.ContractAddress |> Encoding.UTF8.GetBytes
    binContractAddress.Length |> BitConverter.GetBytes |> bb.append
    binContractAddress |> bb.append
    
    let binWalletAddress = p.WalletAddress |> Encoding.UTF8.GetBytes
    binWalletAddress.Length |> BitConverter.GetBytes |> bb.append
    binWalletAddress |> bb.append
    
    p.BaseRate |> BitConverter.GetBytes |> bb.append

let CUR__bin (bb:BytesBuilder) (v:CUR) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCUR__bin bb v.p

let bin__pCUR (bi:BinIndexed):pCUR =
    let bin,index = bi

    let p = pCUR_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Hidden <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsSac <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsTransfer <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsCash <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.EnableReward <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.EnableOTC <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.CurType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Dec <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.AnchorRate <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Freezable <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.Authorizable <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_ChaninID = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ChaninID <- Encoding.UTF8.GetString(bin,index.Value,count_ChaninID)
    index.Value <- index.Value + count_ChaninID
    
    let count_ChaninName = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ChaninName <- Encoding.UTF8.GetString(bin,index.Value,count_ChaninName)
    index.Value <- index.Value + count_ChaninName
    
    let count_ContractAddress = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ContractAddress <- Encoding.UTF8.GetString(bin,index.Value,count_ContractAddress)
    index.Value <- index.Value + count_ContractAddress
    
    let count_WalletAddress = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.WalletAddress <- Encoding.UTF8.GetString(bin,index.Value,count_WalletAddress)
    index.Value <- index.Value + count_WalletAddress
    
    p.BaseRate <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__CUR (bi:BinIndexed):CUR =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCUR bi }

let pCUR__json (p:pCUR) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("IsSac",if p.IsSac then Json.True else Json.False)
        ("IsTransfer",if p.IsTransfer then Json.True else Json.False)
        ("IsCash",if p.IsCash then Json.True else Json.False)
        ("EnableReward",if p.EnableReward then Json.True else Json.False)
        ("EnableOTC",if p.EnableOTC then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("CurType",(p.CurType |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("AnchorRate",p.AnchorRate.ToString() |> Json.Num)
        ("Freezable",if p.Freezable then Json.True else Json.False)
        ("Authorizable",if p.Authorizable then Json.True else Json.False)
        ("ChaninID",p.ChaninID |> Json.Str)
        ("ChaninName",p.ChaninName |> Json.Str)
        ("ContractAddress",p.ContractAddress |> Json.Str)
        ("WalletAddress",p.WalletAddress |> Json.Str)
        ("BaseRate",p.BaseRate.ToString() |> Json.Num) |]
    |> Json.Braket

let CUR__json (v:CUR) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Hidden",if p.Hidden then Json.True else Json.False)
        ("IsSac",if p.IsSac then Json.True else Json.False)
        ("IsTransfer",if p.IsTransfer then Json.True else Json.False)
        ("IsCash",if p.IsCash then Json.True else Json.False)
        ("EnableReward",if p.EnableReward then Json.True else Json.False)
        ("EnableOTC",if p.EnableOTC then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("CurType",(p.CurType |> EnumToValue).ToString() |> Json.Num)
        ("Dec",p.Dec.ToString() |> Json.Num)
        ("AnchorRate",p.AnchorRate.ToString() |> Json.Num)
        ("Freezable",if p.Freezable then Json.True else Json.False)
        ("Authorizable",if p.Authorizable then Json.True else Json.False)
        ("ChaninID",p.ChaninID |> Json.Str)
        ("ChaninName",p.ChaninName |> Json.Str)
        ("ContractAddress",p.ContractAddress |> Json.Str)
        ("WalletAddress",p.WalletAddress |> Json.Str)
        ("BaseRate",p.BaseRate.ToString() |> Json.Num) |]
    |> Json.Braket

let CUR__jsonTbw (w:TextBlockWriter) (v:CUR) =
    json__str w (CUR__json v)

let CUR__jsonStr (v:CUR) =
    (CUR__json v) |> json__strFinal


let json__pCURo (json:Json):pCUR option =
    let fields = json |> json__items

    let p = pCUR_empty()
    
    p.Code <- checkfieldz fields "Code" 16
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.IsSac <- checkfield fields "IsSac" = "true"
    
    p.IsTransfer <- checkfield fields "IsTransfer" = "true"
    
    p.IsCash <- checkfield fields "IsCash" = "true"
    
    p.EnableReward <- checkfield fields "EnableReward" = "true"
    
    p.EnableOTC <- checkfield fields "EnableOTC" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 512
    
    p.CurType <- checkfield fields "CurType" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.AnchorRate <- checkfield fields "AnchorRate" |> parse_float
    
    p.Freezable <- checkfield fields "Freezable" = "true"
    
    p.Authorizable <- checkfield fields "Authorizable" = "true"
    
    p.ChaninID <- checkfieldz fields "ChaninID" 256
    
    p.ChaninName <- checkfieldz fields "ChaninName" 256
    
    p.ContractAddress <- checkfieldz fields "ContractAddress" 256
    
    p.WalletAddress <- checkfieldz fields "WalletAddress" 256
    
    p.BaseRate <- checkfield fields "BaseRate" |> parse_float
    
    p |> Some
    

let json__CURo (json:Json):CUR option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCUR_empty()
    
    p.Code <- checkfieldz fields "Code" 16
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Hidden <- checkfield fields "Hidden" = "true"
    
    p.IsSac <- checkfield fields "IsSac" = "true"
    
    p.IsTransfer <- checkfield fields "IsTransfer" = "true"
    
    p.IsCash <- checkfield fields "IsCash" = "true"
    
    p.EnableReward <- checkfield fields "EnableReward" = "true"
    
    p.EnableOTC <- checkfield fields "EnableOTC" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 512
    
    p.CurType <- checkfield fields "CurType" |> parse_int32 |> EnumOfValue
    
    p.Dec <- checkfield fields "Dec" |> parse_int64
    
    p.AnchorRate <- checkfield fields "AnchorRate" |> parse_float
    
    p.Freezable <- checkfield fields "Freezable" = "true"
    
    p.Authorizable <- checkfield fields "Authorizable" = "true"
    
    p.ChaninID <- checkfieldz fields "ChaninID" 256
    
    p.ChaninName <- checkfieldz fields "ChaninName" 256
    
    p.ContractAddress <- checkfieldz fields "ContractAddress" 256
    
    p.WalletAddress <- checkfieldz fields "WalletAddress" 256
    
    p.BaseRate <- checkfield fields "BaseRate" |> parse_float
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [EU] Structure

let pEU__bin (bb:BytesBuilder) (p:pEU) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binUsername = p.Username |> Encoding.UTF8.GetBytes
    binUsername.Length |> BitConverter.GetBytes |> bb.append
    binUsername |> bb.append
    
    let binEmail = p.Email |> Encoding.UTF8.GetBytes
    binEmail.Length |> BitConverter.GetBytes |> bb.append
    binEmail |> bb.append
    
    let binTel = p.Tel |> Encoding.UTF8.GetBytes
    binTel.Length |> BitConverter.GetBytes |> bb.append
    binTel |> bb.append
    
    p.Gender |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Status |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Admin |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Privilege |> BitConverter.GetBytes |> bb.append
    
    p.Verify |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binPwd = p.Pwd |> Encoding.UTF8.GetBytes
    binPwd.Length |> BitConverter.GetBytes |> bb.append
    binPwd |> bb.append
    
    p.Online |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    let binBackground = p.Background |> Encoding.UTF8.GetBytes
    binBackground.Length |> BitConverter.GetBytes |> bb.append
    binBackground |> bb.append
    
    p.BasicAcct |> BitConverter.GetBytes |> bb.append
    
    p.Citizen |> BitConverter.GetBytes |> bb.append
    
    let binRefer = p.Refer |> Encoding.UTF8.GetBytes
    binRefer.Length |> BitConverter.GetBytes |> bb.append
    binRefer |> bb.append
    
    p.Referer |> BitConverter.GetBytes |> bb.append
    
    let binDiscord = p.Discord |> Encoding.UTF8.GetBytes
    binDiscord.Length |> BitConverter.GetBytes |> bb.append
    binDiscord |> bb.append
    
    p.DiscordId |> BitConverter.GetBytes |> bb.append
    
    let binGoogle = p.Google |> Encoding.UTF8.GetBytes
    binGoogle.Length |> BitConverter.GetBytes |> bb.append
    binGoogle |> bb.append
    
    p.GoogleId |> BitConverter.GetBytes |> bb.append
    
    let binApple = p.Apple |> Encoding.UTF8.GetBytes
    binApple.Length |> BitConverter.GetBytes |> bb.append
    binApple |> bb.append
    
    p.AppleId |> BitConverter.GetBytes |> bb.append
    
    let binOAuthProvider = p.OAuthProvider |> Encoding.UTF8.GetBytes
    binOAuthProvider.Length |> BitConverter.GetBytes |> bb.append
    binOAuthProvider |> bb.append
    
    let binOAuthID = p.OAuthID |> Encoding.UTF8.GetBytes
    binOAuthID.Length |> BitConverter.GetBytes |> bb.append
    binOAuthID |> bb.append
    
    let binGTV = p.GTV |> Encoding.UTF8.GetBytes
    binGTV.Length |> BitConverter.GetBytes |> bb.append
    binGTV |> bb.append
    
    let binGettr = p.Gettr |> Encoding.UTF8.GetBytes
    binGettr.Length |> BitConverter.GetBytes |> bb.append
    binGettr |> bb.append
    
    p.Farm |> BitConverter.GetBytes |> bb.append
    
    p.CountFollows |> BitConverter.GetBytes |> bb.append
    
    p.CountFollowers |> BitConverter.GetBytes |> bb.append
    
    p.CountMoments |> BitConverter.GetBytes |> bb.append
    
    p.CountViews |> BitConverter.GetBytes |> bb.append
    
    p.CountComments |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbUps |> BitConverter.GetBytes |> bb.append
    
    p.CountThumbDns |> BitConverter.GetBytes |> bb.append
    
    p.Lang |> BitConverter.GetBytes |> bb.append
    
    p.BizOperator |> BitConverter.GetBytes |> bb.append
    
    let binUrl = p.Url |> Encoding.UTF8.GetBytes
    binUrl.Length |> BitConverter.GetBytes |> bb.append
    binUrl |> bb.append
    
    let binAbout = p.About |> Encoding.UTF8.GetBytes
    binAbout.Length |> BitConverter.GetBytes |> bb.append
    binAbout |> bb.append
    
    p.PublicPoints |> BitConverter.GetBytes |> bb.append
    
    let binJson = p.Json |> Encoding.UTF8.GetBytes
    binJson.Length |> BitConverter.GetBytes |> bb.append
    binJson |> bb.append
    
    p.Agentable |> EnumToValue |> BitConverter.GetBytes |> bb.append

let EU__bin (bb:BytesBuilder) (v:EU) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pEU__bin bb v.p

let bin__pEU (bi:BinIndexed):pEU =
    let bin,index = bi

    let p = pEU_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Username = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Username <- Encoding.UTF8.GetString(bin,index.Value,count_Username)
    index.Value <- index.Value + count_Username
    
    let count_Email = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Email <- Encoding.UTF8.GetString(bin,index.Value,count_Email)
    index.Value <- index.Value + count_Email
    
    let count_Tel = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Tel <- Encoding.UTF8.GetString(bin,index.Value,count_Tel)
    index.Value <- index.Value + count_Tel
    
    p.Gender <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Status <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Admin <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Privilege <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Verify <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Pwd = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Pwd <- Encoding.UTF8.GetString(bin,index.Value,count_Pwd)
    index.Value <- index.Value + count_Pwd
    
    p.Online <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    let count_Background = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Background <- Encoding.UTF8.GetString(bin,index.Value,count_Background)
    index.Value <- index.Value + count_Background
    
    p.BasicAcct <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Citizen <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Refer = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Refer <- Encoding.UTF8.GetString(bin,index.Value,count_Refer)
    index.Value <- index.Value + count_Refer
    
    p.Referer <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Discord = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Discord <- Encoding.UTF8.GetString(bin,index.Value,count_Discord)
    index.Value <- index.Value + count_Discord
    
    p.DiscordId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Google = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Google <- Encoding.UTF8.GetString(bin,index.Value,count_Google)
    index.Value <- index.Value + count_Google
    
    p.GoogleId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Apple = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Apple <- Encoding.UTF8.GetString(bin,index.Value,count_Apple)
    index.Value <- index.Value + count_Apple
    
    p.AppleId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_OAuthProvider = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OAuthProvider <- Encoding.UTF8.GetString(bin,index.Value,count_OAuthProvider)
    index.Value <- index.Value + count_OAuthProvider
    
    let count_OAuthID = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.OAuthID <- Encoding.UTF8.GetString(bin,index.Value,count_OAuthID)
    index.Value <- index.Value + count_OAuthID
    
    let count_GTV = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.GTV <- Encoding.UTF8.GetString(bin,index.Value,count_GTV)
    index.Value <- index.Value + count_GTV
    
    let count_Gettr = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Gettr <- Encoding.UTF8.GetString(bin,index.Value,count_Gettr)
    index.Value <- index.Value + count_Gettr
    
    p.Farm <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollows <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountFollowers <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountMoments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountViews <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountComments <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbUps <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.CountThumbDns <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lang <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BizOperator <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Url = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Url <- Encoding.UTF8.GetString(bin,index.Value,count_Url)
    index.Value <- index.Value + count_Url
    
    let count_About = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.About <- Encoding.UTF8.GetString(bin,index.Value,count_About)
    index.Value <- index.Value + count_About
    
    p.PublicPoints <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Json = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Json <- Encoding.UTF8.GetString(bin,index.Value,count_Json)
    index.Value <- index.Value + count_Json
    
    p.Agentable <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__EU (bi:BinIndexed):EU =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pEU bi }

let pEU__json (p:pEU) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Username",p.Username |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Gender",(p.Gender |> EnumToValue).ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Admin",(p.Admin |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Verify",(p.Verify |> EnumToValue).ToString() |> Json.Num)
        ("Pwd",p.Pwd |> Json.Str)
        ("Online",if p.Online then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Citizen",p.Citizen.ToString() |> Json.Num)
        ("Refer",p.Refer |> Json.Str)
        ("Referer",p.Referer.ToString() |> Json.Num)
        ("Discord",p.Discord |> Json.Str)
        ("DiscordId",p.DiscordId.ToString() |> Json.Num)
        ("Google",p.Google |> Json.Str)
        ("GoogleId",p.GoogleId.ToString() |> Json.Num)
        ("Apple",p.Apple |> Json.Str)
        ("AppleId",p.AppleId.ToString() |> Json.Num)
        ("OAuthProvider",p.OAuthProvider |> Json.Str)
        ("OAuthID",p.OAuthID |> Json.Str)
        ("GTV",p.GTV |> Json.Str)
        ("Gettr",p.Gettr |> Json.Str)
        ("Farm",p.Farm.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("BizOperator",p.BizOperator.ToString() |> Json.Num)
        ("Url",p.Url |> Json.Str)
        ("About",p.About |> Json.Str)
        ("PublicPoints",p.PublicPoints.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str)
        ("Agentable",(p.Agentable |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let EU__json (v:EU) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Username",p.Username |> Json.Str)
        ("Email",p.Email |> Json.Str)
        ("Tel",p.Tel |> Json.Str)
        ("Gender",(p.Gender |> EnumToValue).ToString() |> Json.Num)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Admin",(p.Admin |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Verify",(p.Verify |> EnumToValue).ToString() |> Json.Num)
        ("Pwd",p.Pwd |> Json.Str)
        ("Online",if p.Online then Json.True else Json.False)
        ("Icon",p.Icon |> Json.Str)
        ("Background",p.Background |> Json.Str)
        ("BasicAcct",p.BasicAcct.ToString() |> Json.Num)
        ("Citizen",p.Citizen.ToString() |> Json.Num)
        ("Refer",p.Refer |> Json.Str)
        ("Referer",p.Referer.ToString() |> Json.Num)
        ("Discord",p.Discord |> Json.Str)
        ("DiscordId",p.DiscordId.ToString() |> Json.Num)
        ("Google",p.Google |> Json.Str)
        ("GoogleId",p.GoogleId.ToString() |> Json.Num)
        ("Apple",p.Apple |> Json.Str)
        ("AppleId",p.AppleId.ToString() |> Json.Num)
        ("OAuthProvider",p.OAuthProvider |> Json.Str)
        ("OAuthID",p.OAuthID |> Json.Str)
        ("GTV",p.GTV |> Json.Str)
        ("Gettr",p.Gettr |> Json.Str)
        ("Farm",p.Farm.ToString() |> Json.Num)
        ("CountFollows",p.CountFollows.ToString() |> Json.Num)
        ("CountFollowers",p.CountFollowers.ToString() |> Json.Num)
        ("CountMoments",p.CountMoments.ToString() |> Json.Num)
        ("CountViews",p.CountViews.ToString() |> Json.Num)
        ("CountComments",p.CountComments.ToString() |> Json.Num)
        ("CountThumbUps",p.CountThumbUps.ToString() |> Json.Num)
        ("CountThumbDns",p.CountThumbDns.ToString() |> Json.Num)
        ("Lang",p.Lang.ToString() |> Json.Num)
        ("BizOperator",p.BizOperator.ToString() |> Json.Num)
        ("Url",p.Url |> Json.Str)
        ("About",p.About |> Json.Str)
        ("PublicPoints",p.PublicPoints.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str)
        ("Agentable",(p.Agentable |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let EU__jsonTbw (w:TextBlockWriter) (v:EU) =
    json__str w (EU__json v)

let EU__jsonStr (v:EU) =
    (EU__json v) |> json__strFinal


let json__pEUo (json:Json):pEU option =
    let fields = json |> json__items

    let p = pEU_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Username <- checkfieldz fields "Username" 64
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Tel <- checkfieldz fields "Tel" 32
    
    p.Gender <- checkfield fields "Gender" |> parse_int32 |> EnumOfValue
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Admin <- checkfield fields "Admin" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Verify <- checkfield fields "Verify" |> parse_int32 |> EnumOfValue
    
    p.Pwd <- checkfieldz fields "Pwd" 16
    
    p.Online <- checkfield fields "Online" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Citizen <- checkfield fields "Citizen" |> parse_int64
    
    p.Refer <- checkfieldz fields "Refer" 7
    
    p.Referer <- checkfield fields "Referer" |> parse_int64
    
    p.Discord <- checkfieldz fields "Discord" 64
    
    p.DiscordId <- checkfield fields "DiscordId" |> parse_int64
    
    p.Google <- checkfieldz fields "Google" 64
    
    p.GoogleId <- checkfield fields "GoogleId" |> parse_int64
    
    p.Apple <- checkfieldz fields "Apple" 64
    
    p.AppleId <- checkfield fields "AppleId" |> parse_int64
    
    p.OAuthProvider <- checkfieldz fields "OAuthProvider" 64
    
    p.OAuthID <- checkfieldz fields "OAuthID" 256
    
    p.GTV <- checkfieldz fields "GTV" 64
    
    p.Gettr <- checkfieldz fields "Gettr" 64
    
    p.Farm <- checkfield fields "Farm" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.BizOperator <- checkfield fields "BizOperator" |> parse_int64
    
    p.Url <- checkfield fields "Url"
    
    p.About <- checkfield fields "About"
    
    p.PublicPoints <- checkfield fields "PublicPoints" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p.Agentable <- checkfield fields "Agentable" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__EUo (json:Json):EU option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pEU_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Username <- checkfieldz fields "Username" 64
    
    p.Email <- checkfieldz fields "Email" 256
    
    p.Tel <- checkfieldz fields "Tel" 32
    
    p.Gender <- checkfield fields "Gender" |> parse_int32 |> EnumOfValue
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Admin <- checkfield fields "Admin" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Verify <- checkfield fields "Verify" |> parse_int32 |> EnumOfValue
    
    p.Pwd <- checkfieldz fields "Pwd" 16
    
    p.Online <- checkfield fields "Online" = "true"
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.Background <- checkfieldz fields "Background" 256
    
    p.BasicAcct <- checkfield fields "BasicAcct" |> parse_int64
    
    p.Citizen <- checkfield fields "Citizen" |> parse_int64
    
    p.Refer <- checkfieldz fields "Refer" 7
    
    p.Referer <- checkfield fields "Referer" |> parse_int64
    
    p.Discord <- checkfieldz fields "Discord" 64
    
    p.DiscordId <- checkfield fields "DiscordId" |> parse_int64
    
    p.Google <- checkfieldz fields "Google" 64
    
    p.GoogleId <- checkfield fields "GoogleId" |> parse_int64
    
    p.Apple <- checkfieldz fields "Apple" 64
    
    p.AppleId <- checkfield fields "AppleId" |> parse_int64
    
    p.OAuthProvider <- checkfieldz fields "OAuthProvider" 64
    
    p.OAuthID <- checkfieldz fields "OAuthID" 256
    
    p.GTV <- checkfieldz fields "GTV" 64
    
    p.Gettr <- checkfieldz fields "Gettr" 64
    
    p.Farm <- checkfield fields "Farm" |> parse_int64
    
    p.CountFollows <- checkfield fields "CountFollows" |> parse_int64
    
    p.CountFollowers <- checkfield fields "CountFollowers" |> parse_int64
    
    p.CountMoments <- checkfield fields "CountMoments" |> parse_int64
    
    p.CountViews <- checkfield fields "CountViews" |> parse_int64
    
    p.CountComments <- checkfield fields "CountComments" |> parse_int64
    
    p.CountThumbUps <- checkfield fields "CountThumbUps" |> parse_int64
    
    p.CountThumbDns <- checkfield fields "CountThumbDns" |> parse_int64
    
    p.Lang <- checkfield fields "Lang" |> parse_int64
    
    p.BizOperator <- checkfield fields "BizOperator" |> parse_int64
    
    p.Url <- checkfield fields "Url"
    
    p.About <- checkfield fields "About"
    
    p.PublicPoints <- checkfield fields "PublicPoints" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p.Agentable <- checkfield fields "Agentable" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FILE] Structure

let pFILE__bin (bb:BytesBuilder) (p:pFILE) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Content.Length |> BitConverter.GetBytes |> bb.append
    p.Content |> bb.append
    
    p.Encrypt |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binSHA256 = p.SHA256 |> Encoding.UTF8.GetBytes
    binSHA256.Length |> BitConverter.GetBytes |> bb.append
    binSHA256 |> bb.append
    
    p.Size |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.State |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Folder |> BitConverter.GetBytes |> bb.append
    
    p.FileType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binJSON = p.JSON |> Encoding.UTF8.GetBytes
    binJSON.Length |> BitConverter.GetBytes |> bb.append
    binJSON |> bb.append

let FILE__bin (bb:BytesBuilder) (v:FILE) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFILE__bin bb v.p

let bin__pFILE (bi:BinIndexed):pFILE =
    let bin,index = bi

    let p = pFILE_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let length_Content = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Content <- Array.sub bin index.Value length_Content
    index.Value <- index.Value + length_Content
    
    p.Encrypt <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_SHA256 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.SHA256 <- Encoding.UTF8.GetString(bin,index.Value,count_SHA256)
    index.Value <- index.Value + count_SHA256
    
    p.Size <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.State <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Folder <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.FileType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_JSON = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.JSON <- Encoding.UTF8.GetString(bin,index.Value,count_JSON)
    index.Value <- index.Value + count_JSON
    
    p

let bin__FILE (bi:BinIndexed):FILE =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFILE bi }

let pFILE__json (p:pFILE) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Content",p.Content |> Convert.ToBase64String |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("SHA256",p.SHA256 |> Json.Str)
        ("Size",p.Size.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Folder",p.Folder.ToString() |> Json.Num)
        ("FileType",(p.FileType |> EnumToValue).ToString() |> Json.Num)
        ("JSON",p.JSON |> Json.Str) |]
    |> Json.Braket

let FILE__json (v:FILE) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Content",p.Content |> Convert.ToBase64String |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("SHA256",p.SHA256 |> Json.Str)
        ("Size",p.Size.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("State",(p.State |> EnumToValue).ToString() |> Json.Num)
        ("Folder",p.Folder.ToString() |> Json.Num)
        ("FileType",(p.FileType |> EnumToValue).ToString() |> Json.Num)
        ("JSON",p.JSON |> Json.Str) |]
    |> Json.Braket

let FILE__jsonTbw (w:TextBlockWriter) (v:FILE) =
    json__str w (FILE__json v)

let FILE__jsonStr (v:FILE) =
    (FILE__json v) |> json__strFinal


let json__pFILEo (json:Json):pFILE option =
    let fields = json |> json__items

    let p = pFILE_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.SHA256 <- checkfield fields "SHA256"
    
    p.Size <- checkfield fields "Size" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Folder <- checkfield fields "Folder" |> parse_int64
    
    p.FileType <- checkfield fields "FileType" |> parse_int32 |> EnumOfValue
    
    p.JSON <- checkfield fields "JSON"
    
    p |> Some
    

let json__FILEo (json:Json):FILE option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFILE_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.SHA256 <- checkfield fields "SHA256"
    
    p.Size <- checkfield fields "Size" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.State <- checkfield fields "State" |> parse_int32 |> EnumOfValue
    
    p.Folder <- checkfield fields "Folder" |> parse_int64
    
    p.FileType <- checkfield fields "FileType" |> parse_int32 |> EnumOfValue
    
    p.JSON <- checkfield fields "JSON"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [FOLDER] Structure

let pFOLDER__bin (bb:BytesBuilder) (p:pFOLDER) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Encrypt |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Parent |> BitConverter.GetBytes |> bb.append

let FOLDER__bin (bb:BytesBuilder) (v:FOLDER) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pFOLDER__bin bb v.p

let bin__pFOLDER (bi:BinIndexed):pFOLDER =
    let bin,index = bi

    let p = pFOLDER_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Encrypt <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Parent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__FOLDER (bi:BinIndexed):FOLDER =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pFOLDER bi }

let pFOLDER__json (p:pFOLDER) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num) |]
    |> Json.Braket

let FOLDER__json (v:FOLDER) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Encrypt",(p.Encrypt |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Parent",p.Parent.ToString() |> Json.Num) |]
    |> Json.Braket

let FOLDER__jsonTbw (w:TextBlockWriter) (v:FOLDER) =
    json__str w (FOLDER__json v)

let FOLDER__jsonStr (v:FOLDER) =
    (FOLDER__json v) |> json__strFinal


let json__pFOLDERo (json:Json):pFOLDER option =
    let fields = json |> json__items

    let p = pFOLDER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    p |> Some
    

let json__FOLDERo (json:Json):FOLDER option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pFOLDER_empty()
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Encrypt <- checkfield fields "Encrypt" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Parent <- checkfield fields "Parent" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LANG] Structure

let pLANG__bin (bb:BytesBuilder) (p:pLANG) =

    
    let binCode2 = p.Code2 |> Encoding.UTF8.GetBytes
    binCode2.Length |> BitConverter.GetBytes |> bb.append
    binCode2 |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binNative = p.Native |> Encoding.UTF8.GetBytes
    binNative.Length |> BitConverter.GetBytes |> bb.append
    binNative |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.IsBlank |> BitConverter.GetBytes |> bb.append
    
    p.IsLocale |> BitConverter.GetBytes |> bb.append
    
    p.IsContent |> BitConverter.GetBytes |> bb.append
    
    p.IsAutoTranslate |> BitConverter.GetBytes |> bb.append
    
    p.TextDirection |> EnumToValue |> BitConverter.GetBytes |> bb.append

let LANG__bin (bb:BytesBuilder) (v:LANG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLANG__bin bb v.p

let bin__pLANG (bi:BinIndexed):pLANG =
    let bin,index = bi

    let p = pLANG_empty()
    
    let count_Code2 = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code2 <- Encoding.UTF8.GetString(bin,index.Value,count_Code2)
    index.Value <- index.Value + count_Code2
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Native = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Native <- Encoding.UTF8.GetString(bin,index.Value,count_Native)
    index.Value <- index.Value + count_Native
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.IsBlank <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsLocale <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsContent <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.IsAutoTranslate <- BitConverter.ToBoolean(bin,index.Value)
    index.Value <- index.Value + 1
    
    p.TextDirection <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__LANG (bi:BinIndexed):LANG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLANG bi }

let pLANG__json (p:pLANG) =

    [|
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Native",p.Native |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("IsBlank",if p.IsBlank then Json.True else Json.False)
        ("IsLocale",if p.IsLocale then Json.True else Json.False)
        ("IsContent",if p.IsContent then Json.True else Json.False)
        ("IsAutoTranslate",if p.IsAutoTranslate then Json.True else Json.False)
        ("TextDirection",(p.TextDirection |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LANG__json (v:LANG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code2",p.Code2 |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Native",p.Native |> Json.Str)
        ("Icon",p.Icon |> Json.Str)
        ("IsBlank",if p.IsBlank then Json.True else Json.False)
        ("IsLocale",if p.IsLocale then Json.True else Json.False)
        ("IsContent",if p.IsContent then Json.True else Json.False)
        ("IsAutoTranslate",if p.IsAutoTranslate then Json.True else Json.False)
        ("TextDirection",(p.TextDirection |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LANG__jsonTbw (w:TextBlockWriter) (v:LANG) =
    json__str w (LANG__json v)

let LANG__jsonStr (v:LANG) =
    (LANG__json v) |> json__strFinal


let json__pLANGo (json:Json):pLANG option =
    let fields = json |> json__items

    let p = pLANG_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Native <- checkfieldz fields "Native" 64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.IsBlank <- checkfield fields "IsBlank" = "true"
    
    p.IsLocale <- checkfield fields "IsLocale" = "true"
    
    p.IsContent <- checkfield fields "IsContent" = "true"
    
    p.IsAutoTranslate <- checkfield fields "IsAutoTranslate" = "true"
    
    p.TextDirection <- checkfield fields "TextDirection" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__LANGo (json:Json):LANG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLANG_empty()
    
    p.Code2 <- checkfieldz fields "Code2" 2
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Native <- checkfieldz fields "Native" 64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.IsBlank <- checkfield fields "IsBlank" = "true"
    
    p.IsLocale <- checkfield fields "IsLocale" = "true"
    
    p.IsContent <- checkfield fields "IsContent" = "true"
    
    p.IsAutoTranslate <- checkfield fields "IsAutoTranslate" = "true"
    
    p.TextDirection <- checkfield fields "TextDirection" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CWC] Structure

let pCWC__bin (bb:BytesBuilder) (p:pCWC) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.ExternalId |> BitConverter.GetBytes |> bb.append
    
    let binIcon = p.Icon |> Encoding.UTF8.GetBytes
    binIcon.Length |> BitConverter.GetBytes |> bb.append
    binIcon |> bb.append
    
    p.EU |> BitConverter.GetBytes |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append
    
    let binJson = p.Json |> Encoding.UTF8.GetBytes
    binJson.Length |> BitConverter.GetBytes |> bb.append
    binJson |> bb.append

let CWC__bin (bb:BytesBuilder) (v:CWC) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCWC__bin bb v.p

let bin__pCWC (bi:BinIndexed):pCWC =
    let bin,index = bi

    let p = pCWC_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.ExternalId <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Icon = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Icon <- Encoding.UTF8.GetString(bin,index.Value,count_Icon)
    index.Value <- index.Value + count_Icon
    
    p.EU <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Json = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Json <- Encoding.UTF8.GetString(bin,index.Value,count_Json)
    index.Value <- index.Value + count_Json
    
    p

let bin__CWC (bi:BinIndexed):CWC =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCWC bi }

let pCWC__json (p:pCWC) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("ExternalId",p.ExternalId.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("EU",p.EU.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str) |]
    |> Json.Braket

let CWC__json (v:CWC) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("ExternalId",p.ExternalId.ToString() |> Json.Num)
        ("Icon",p.Icon |> Json.Str)
        ("EU",p.EU.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("Json",p.Json |> Json.Str) |]
    |> Json.Braket

let CWC__jsonTbw (w:TextBlockWriter) (v:CWC) =
    json__str w (CWC__json v)

let CWC__jsonStr (v:CWC) =
    (CWC__json v) |> json__strFinal


let json__pCWCo (json:Json):pCWC option =
    let fields = json |> json__items

    let p = pCWC_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.ExternalId <- checkfield fields "ExternalId" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    p |> Some
    

let json__CWCo (json:Json):CWC option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCWC_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.ExternalId <- checkfield fields "ExternalId" |> parse_int64
    
    p.Icon <- checkfieldz fields "Icon" 256
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.Json <- checkfield fields "Json"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [APILOG] Structure

let pAPILOG__bin (bb:BytesBuilder) (p:pAPILOG) =

    
    let binLocation = p.Location |> Encoding.UTF8.GetBytes
    binLocation.Length |> BitConverter.GetBytes |> bb.append
    binLocation |> bb.append
    
    let binApiKey = p.ApiKey |> Encoding.UTF8.GetBytes
    binApiKey.Length |> BitConverter.GetBytes |> bb.append
    binApiKey |> bb.append
    
    let binIP = p.IP |> Encoding.UTF8.GetBytes
    binIP.Length |> BitConverter.GetBytes |> bb.append
    binIP |> bb.append
    
    let binSession = p.Session |> Encoding.UTF8.GetBytes
    binSession.Length |> BitConverter.GetBytes |> bb.append
    binSession |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append
    
    let binBizCode = p.BizCode |> Encoding.UTF8.GetBytes
    binBizCode.Length |> BitConverter.GetBytes |> bb.append
    binBizCode |> bb.append
    
    let binApi = p.Api |> Encoding.UTF8.GetBytes
    binApi.Length |> BitConverter.GetBytes |> bb.append
    binApi |> bb.append
    
    let binRequest = p.Request |> Encoding.UTF8.GetBytes
    binRequest.Length |> BitConverter.GetBytes |> bb.append
    binRequest |> bb.append
    
    let binRequestHex = p.RequestHex |> Encoding.UTF8.GetBytes
    binRequestHex.Length |> BitConverter.GetBytes |> bb.append
    binRequestHex |> bb.append
    
    let binRequestJson = p.RequestJson |> Encoding.UTF8.GetBytes
    binRequestJson.Length |> BitConverter.GetBytes |> bb.append
    binRequestJson |> bb.append
    
    let binResponse = p.Response |> Encoding.UTF8.GetBytes
    binResponse.Length |> BitConverter.GetBytes |> bb.append
    binResponse |> bb.append
    
    let binResponseJson = p.ResponseJson |> Encoding.UTF8.GetBytes
    binResponseJson.Length |> BitConverter.GetBytes |> bb.append
    binResponseJson |> bb.append
    
    let binContent = p.Content |> Encoding.UTF8.GetBytes
    binContent.Length |> BitConverter.GetBytes |> bb.append
    binContent |> bb.append
    
    p.Eu |> BitConverter.GetBytes |> bb.append
    
    p.Agent |> BitConverter.GetBytes |> bb.append
    
    p.Data |> BitConverter.GetBytes |> bb.append

let APILOG__bin (bb:BytesBuilder) (v:APILOG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pAPILOG__bin bb v.p

let bin__pAPILOG (bi:BinIndexed):pAPILOG =
    let bin,index = bi

    let p = pAPILOG_empty()
    
    let count_Location = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Location <- Encoding.UTF8.GetString(bin,index.Value,count_Location)
    index.Value <- index.Value + count_Location
    
    let count_ApiKey = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ApiKey <- Encoding.UTF8.GetString(bin,index.Value,count_ApiKey)
    index.Value <- index.Value + count_ApiKey
    
    let count_IP = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.IP <- Encoding.UTF8.GetString(bin,index.Value,count_IP)
    index.Value <- index.Value + count_IP
    
    let count_Session = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Session <- Encoding.UTF8.GetString(bin,index.Value,count_Session)
    index.Value <- index.Value + count_Session
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_BizCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.BizCode <- Encoding.UTF8.GetString(bin,index.Value,count_BizCode)
    index.Value <- index.Value + count_BizCode
    
    let count_Api = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Api <- Encoding.UTF8.GetString(bin,index.Value,count_Api)
    index.Value <- index.Value + count_Api
    
    let count_Request = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Request <- Encoding.UTF8.GetString(bin,index.Value,count_Request)
    index.Value <- index.Value + count_Request
    
    let count_RequestHex = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RequestHex <- Encoding.UTF8.GetString(bin,index.Value,count_RequestHex)
    index.Value <- index.Value + count_RequestHex
    
    let count_RequestJson = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RequestJson <- Encoding.UTF8.GetString(bin,index.Value,count_RequestJson)
    index.Value <- index.Value + count_RequestJson
    
    let count_Response = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Response <- Encoding.UTF8.GetString(bin,index.Value,count_Response)
    index.Value <- index.Value + count_Response
    
    let count_ResponseJson = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ResponseJson <- Encoding.UTF8.GetString(bin,index.Value,count_ResponseJson)
    index.Value <- index.Value + count_ResponseJson
    
    let count_Content = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Content <- Encoding.UTF8.GetString(bin,index.Value,count_Content)
    index.Value <- index.Value + count_Content
    
    p.Eu <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Data <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__APILOG (bi:BinIndexed):APILOG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pAPILOG bi }

let pAPILOG__json (p:pAPILOG) =

    [|
        ("Location",p.Location |> Json.Str)
        ("ApiKey",p.ApiKey |> Json.Str)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("BizCode",p.BizCode |> Json.Str)
        ("Api",p.Api |> Json.Str)
        ("Request",p.Request |> Json.Str)
        ("RequestHex",p.RequestHex |> Json.Str)
        ("RequestJson",p.RequestJson |> Json.Str)
        ("Response",p.Response |> Json.Str)
        ("ResponseJson",p.ResponseJson |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Eu",p.Eu.ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("Data",p.Data.ToString() |> Json.Num) |]
    |> Json.Braket

let APILOG__json (v:APILOG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Location",p.Location |> Json.Str)
        ("ApiKey",p.ApiKey |> Json.Str)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("BizCode",p.BizCode |> Json.Str)
        ("Api",p.Api |> Json.Str)
        ("Request",p.Request |> Json.Str)
        ("RequestHex",p.RequestHex |> Json.Str)
        ("RequestJson",p.RequestJson |> Json.Str)
        ("Response",p.Response |> Json.Str)
        ("ResponseJson",p.ResponseJson |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Eu",p.Eu.ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num)
        ("Data",p.Data.ToString() |> Json.Num) |]
    |> Json.Braket

let APILOG__jsonTbw (w:TextBlockWriter) (v:APILOG) =
    json__str w (APILOG__json v)

let APILOG__jsonStr (v:APILOG) =
    (APILOG__json v) |> json__strFinal


let json__pAPILOGo (json:Json):pAPILOG option =
    let fields = json |> json__items

    let p = pAPILOG_empty()
    
    p.Location <- checkfield fields "Location"
    
    p.ApiKey <- checkfield fields "ApiKey"
    
    p.IP <- checkfield fields "IP"
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.BizCode <- checkfieldz fields "BizCode" 16
    
    p.Api <- checkfield fields "Api"
    
    p.Request <- checkfield fields "Request"
    
    p.RequestHex <- checkfield fields "RequestHex"
    
    p.RequestJson <- checkfield fields "RequestJson"
    
    p.Response <- checkfield fields "Response"
    
    p.ResponseJson <- checkfield fields "ResponseJson"
    
    p.Content <- checkfield fields "Content"
    
    p.Eu <- checkfield fields "Eu" |> parse_int64
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.Data <- checkfield fields "Data" |> parse_int64
    
    p |> Some
    

let json__APILOGo (json:Json):APILOG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pAPILOG_empty()
    
    p.Location <- checkfield fields "Location"
    
    p.ApiKey <- checkfield fields "ApiKey"
    
    p.IP <- checkfield fields "IP"
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.BizCode <- checkfieldz fields "BizCode" 16
    
    p.Api <- checkfield fields "Api"
    
    p.Request <- checkfield fields "Request"
    
    p.RequestHex <- checkfield fields "RequestHex"
    
    p.RequestJson <- checkfield fields "RequestJson"
    
    p.Response <- checkfield fields "Response"
    
    p.ResponseJson <- checkfield fields "ResponseJson"
    
    p.Content <- checkfield fields "Content"
    
    p.Eu <- checkfield fields "Eu" |> parse_int64
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p.Data <- checkfield fields "Data" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [AUTH] Structure

let pAUTH__bin (bb:BytesBuilder) (p:pAUTH) =

    
    p.Admin |> BitConverter.GetBytes |> bb.append
    
    p.Role |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binProfile = p.Profile |> Encoding.UTF8.GetBytes
    binProfile.Length |> BitConverter.GetBytes |> bb.append
    binProfile |> bb.append
    
    p.AdminType |> EnumToValue |> BitConverter.GetBytes |> bb.append

let AUTH__bin (bb:BytesBuilder) (v:AUTH) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pAUTH__bin bb v.p

let bin__pAUTH (bi:BinIndexed):pAUTH =
    let bin,index = bi

    let p = pAUTH_empty()
    
    p.Admin <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Role <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_Profile = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Profile <- Encoding.UTF8.GetString(bin,index.Value,count_Profile)
    index.Value <- index.Value + count_Profile
    
    p.AdminType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__AUTH (bi:BinIndexed):AUTH =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pAUTH bi }

let pAUTH__json (p:pAUTH) =

    [|
        ("Admin",p.Admin.ToString() |> Json.Num)
        ("Role",p.Role.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Profile",p.Profile |> Json.Str)
        ("AdminType",(p.AdminType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let AUTH__json (v:AUTH) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Admin",p.Admin.ToString() |> Json.Num)
        ("Role",p.Role.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Profile",p.Profile |> Json.Str)
        ("AdminType",(p.AdminType |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let AUTH__jsonTbw (w:TextBlockWriter) (v:AUTH) =
    json__str w (AUTH__json v)

let AUTH__jsonStr (v:AUTH) =
    (AUTH__json v) |> json__strFinal


let json__pAUTHo (json:Json):pAUTH option =
    let fields = json |> json__items

    let p = pAUTH_empty()
    
    p.Admin <- checkfield fields "Admin" |> parse_int64
    
    p.Role <- checkfield fields "Role" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Profile <- checkfield fields "Profile"
    
    p.AdminType <- checkfield fields "AdminType" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__AUTHo (json:Json):AUTH option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pAUTH_empty()
    
    p.Admin <- checkfield fields "Admin" |> parse_int64
    
    p.Role <- checkfield fields "Role" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Profile <- checkfield fields "Profile"
    
    p.AdminType <- checkfield fields "AdminType" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [CONFIG] Structure

let pCONFIG__bin (bb:BytesBuilder) (p:pCONFIG) =

    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binValue = p.Value |> Encoding.UTF8.GetBytes
    binValue.Length |> BitConverter.GetBytes |> bb.append
    binValue |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append

let CONFIG__bin (bb:BytesBuilder) (v:CONFIG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pCONFIG__bin bb v.p

let bin__pCONFIG (bi:BinIndexed):pCONFIG =
    let bin,index = bi

    let p = pCONFIG_empty()
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Value = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Value <- Encoding.UTF8.GetString(bin,index.Value,count_Value)
    index.Value <- index.Value + count_Value
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p

let bin__CONFIG (bi:BinIndexed):CONFIG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pCONFIG bi }

let pCONFIG__json (p:pCONFIG) =

    [|
        ("Caption",p.Caption |> Json.Str)
        ("Code",p.Code |> Json.Str)
        ("Value",p.Value |> Json.Str)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let CONFIG__json (v:CONFIG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Code",p.Code |> Json.Str)
        ("Value",p.Value |> Json.Str)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let CONFIG__jsonTbw (w:TextBlockWriter) (v:CONFIG) =
    json__str w (CONFIG__json v)

let CONFIG__jsonStr (v:CONFIG) =
    (CONFIG__json v) |> json__strFinal


let json__pCONFIGo (json:Json):pCONFIG option =
    let fields = json |> json__items

    let p = pCONFIG_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Value <- checkfield fields "Value"
    
    p.Desc <- checkfield fields "Desc"
    
    p |> Some
    

let json__CONFIGo (json:Json):CONFIG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pCONFIG_empty()
    
    p.Caption <- checkfieldz fields "Caption" 64
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Value <- checkfield fields "Value"
    
    p.Desc <- checkfield fields "Desc"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [EUSESS] Structure

let pEUSESS__bin (bb:BytesBuilder) (p:pEUSESS) =

    
    p.EU |> BitConverter.GetBytes |> bb.append
    
    let binIP = p.IP |> Encoding.UTF8.GetBytes
    binIP.Length |> BitConverter.GetBytes |> bb.append
    binIP |> bb.append
    
    let binSession = p.Session |> Encoding.UTF8.GetBytes
    binSession.Length |> BitConverter.GetBytes |> bb.append
    binSession |> bb.append
    
    let binApp = p.App |> Encoding.UTF8.GetBytes
    binApp.Length |> BitConverter.GetBytes |> bb.append
    binApp |> bb.append

let EUSESS__bin (bb:BytesBuilder) (v:EUSESS) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pEUSESS__bin bb v.p

let bin__pEUSESS (bi:BinIndexed):pEUSESS =
    let bin,index = bi

    let p = pEUSESS_empty()
    
    p.EU <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_IP = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.IP <- Encoding.UTF8.GetString(bin,index.Value,count_IP)
    index.Value <- index.Value + count_IP
    
    let count_Session = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Session <- Encoding.UTF8.GetString(bin,index.Value,count_Session)
    index.Value <- index.Value + count_Session
    
    let count_App = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.App <- Encoding.UTF8.GetString(bin,index.Value,count_App)
    index.Value <- index.Value + count_App
    
    p

let bin__EUSESS (bi:BinIndexed):EUSESS =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pEUSESS bi }

let pEUSESS__json (p:pEUSESS) =

    [|
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("App",p.App |> Json.Str) |]
    |> Json.Braket

let EUSESS__json (v:EUSESS) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("App",p.App |> Json.Str) |]
    |> Json.Braket

let EUSESS__jsonTbw (w:TextBlockWriter) (v:EUSESS) =
    json__str w (EUSESS__json v)

let EUSESS__jsonStr (v:EUSESS) =
    (EUSESS__json v) |> json__strFinal


let json__pEUSESSo (json:Json):pEUSESS option =
    let fields = json |> json__items

    let p = pEUSESS_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.App <- checkfieldz fields "App" 64
    
    p |> Some
    

let json__EUSESSo (json:Json):EUSESS option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pEUSESS_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.App <- checkfieldz fields "App" 64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [EUTOK] Structure

let pEUTOK__bin (bb:BytesBuilder) (p:pEUTOK) =

    
    p.EU |> BitConverter.GetBytes |> bb.append
    
    let binIP = p.IP |> Encoding.UTF8.GetBytes
    binIP.Length |> BitConverter.GetBytes |> bb.append
    binIP |> bb.append
    
    let binSession = p.Session |> Encoding.UTF8.GetBytes
    binSession.Length |> BitConverter.GetBytes |> bb.append
    binSession |> bb.append
    
    let binToken = p.Token |> Encoding.UTF8.GetBytes
    binToken.Length |> BitConverter.GetBytes |> bb.append
    binToken |> bb.append
    
    let binApp = p.App |> Encoding.UTF8.GetBytes
    binApp.Length |> BitConverter.GetBytes |> bb.append
    binApp |> bb.append

let EUTOK__bin (bb:BytesBuilder) (v:EUTOK) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pEUTOK__bin bb v.p

let bin__pEUTOK (bi:BinIndexed):pEUTOK =
    let bin,index = bi

    let p = pEUTOK_empty()
    
    p.EU <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_IP = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.IP <- Encoding.UTF8.GetString(bin,index.Value,count_IP)
    index.Value <- index.Value + count_IP
    
    let count_Session = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Session <- Encoding.UTF8.GetString(bin,index.Value,count_Session)
    index.Value <- index.Value + count_Session
    
    let count_Token = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Token <- Encoding.UTF8.GetString(bin,index.Value,count_Token)
    index.Value <- index.Value + count_Token
    
    let count_App = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.App <- Encoding.UTF8.GetString(bin,index.Value,count_App)
    index.Value <- index.Value + count_App
    
    p

let bin__EUTOK (bi:BinIndexed):EUTOK =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pEUTOK bi }

let pEUTOK__json (p:pEUTOK) =

    [|
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("Token",p.Token |> Json.Str)
        ("App",p.App |> Json.Str) |]
    |> Json.Braket

let EUTOK__json (v:EUTOK) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Session",p.Session |> Json.Str)
        ("Token",p.Token |> Json.Str)
        ("App",p.App |> Json.Str) |]
    |> Json.Braket

let EUTOK__jsonTbw (w:TextBlockWriter) (v:EUTOK) =
    json__str w (EUTOK__json v)

let EUTOK__jsonStr (v:EUTOK) =
    (EUTOK__json v) |> json__strFinal


let json__pEUTOKo (json:Json):pEUTOK option =
    let fields = json |> json__items

    let p = pEUTOK_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.Token <- checkfieldz fields "Token" 64
    
    p.App <- checkfieldz fields "App" 64
    
    p |> Some
    

let json__EUTOKo (json:Json):EUTOK option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pEUTOK_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.Token <- checkfieldz fields "Token" 64
    
    p.App <- checkfieldz fields "App" 64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LOG] Structure

let pLOG__bin (bb:BytesBuilder) (p:pLOG) =

    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binLocation = p.Location |> Encoding.UTF8.GetBytes
    binLocation.Length |> BitConverter.GetBytes |> bb.append
    binLocation |> bb.append
    
    let binContent = p.Content |> Encoding.UTF8.GetBytes
    binContent.Length |> BitConverter.GetBytes |> bb.append
    binContent |> bb.append
    
    let binSql = p.Sql |> Encoding.UTF8.GetBytes
    binSql.Length |> BitConverter.GetBytes |> bb.append
    binSql |> bb.append
    
    p.Level |> EnumToValue |> BitConverter.GetBytes |> bb.append

let LOG__bin (bb:BytesBuilder) (v:LOG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLOG__bin bb v.p

let bin__pLOG (bi:BinIndexed):pLOG =
    let bin,index = bi

    let p = pLOG_empty()
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_Location = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Location <- Encoding.UTF8.GetString(bin,index.Value,count_Location)
    index.Value <- index.Value + count_Location
    
    let count_Content = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Content <- Encoding.UTF8.GetString(bin,index.Value,count_Content)
    index.Value <- index.Value + count_Content
    
    let count_Sql = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Sql <- Encoding.UTF8.GetString(bin,index.Value,count_Sql)
    index.Value <- index.Value + count_Sql
    
    p.Level <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p

let bin__LOG (bi:BinIndexed):LOG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLOG bi }

let pLOG__json (p:pLOG) =

    [|
        ("Desc",p.Desc |> Json.Str)
        ("Location",p.Location |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Sql",p.Sql |> Json.Str)
        ("Level",(p.Level |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LOG__json (v:LOG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Location",p.Location |> Json.Str)
        ("Content",p.Content |> Json.Str)
        ("Sql",p.Sql |> Json.Str)
        ("Level",(p.Level |> EnumToValue).ToString() |> Json.Num) |]
    |> Json.Braket

let LOG__jsonTbw (w:TextBlockWriter) (v:LOG) =
    json__str w (LOG__json v)

let LOG__jsonStr (v:LOG) =
    (LOG__json v) |> json__strFinal


let json__pLOGo (json:Json):pLOG option =
    let fields = json |> json__items

    let p = pLOG_empty()
    
    p.Desc <- checkfieldz fields "Desc" 64
    
    p.Location <- checkfield fields "Location"
    
    p.Content <- checkfield fields "Content"
    
    p.Sql <- checkfield fields "Sql"
    
    p.Level <- checkfield fields "Level" |> parse_int32 |> EnumOfValue
    
    p |> Some
    

let json__LOGo (json:Json):LOG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLOG_empty()
    
    p.Desc <- checkfieldz fields "Desc" 64
    
    p.Location <- checkfield fields "Location"
    
    p.Content <- checkfield fields "Content"
    
    p.Sql <- checkfield fields "Sql"
    
    p.Level <- checkfield fields "Level" |> parse_int32 |> EnumOfValue
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [NOTIFICATION] Structure

let pNOTIFICATION__bin (bb:BytesBuilder) (p:pNOTIFICATION) =

    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.SrcType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Src |> BitConverter.GetBytes |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Entity |> BitConverter.GetBytes |> bb.append
    
    p.DataType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Data |> BitConverter.GetBytes |> bb.append
    
    let binMsg = p.Msg |> Encoding.UTF8.GetBytes
    binMsg.Length |> BitConverter.GetBytes |> bb.append
    binMsg |> bb.append
    
    p.Status |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Readdat.Ticks |> BitConverter.GetBytes |> bb.append

let NOTIFICATION__bin (bb:BytesBuilder) (v:NOTIFICATION) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pNOTIFICATION__bin bb v.p

let bin__pNOTIFICATION (bi:BinIndexed):pNOTIFICATION =
    let bin,index = bi

    let p = pNOTIFICATION_empty()
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.SrcType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Src <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Entity <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.DataType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Data <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Msg = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Msg <- Encoding.UTF8.GetString(bin,index.Value,count_Msg)
    index.Value <- index.Value + count_Msg
    
    p.Status <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Readdat <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    p

let bin__NOTIFICATION (bi:BinIndexed):NOTIFICATION =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pNOTIFICATION bi }

let pNOTIFICATION__json (p:pNOTIFICATION) =

    [|
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("SrcType",(p.SrcType |> EnumToValue).ToString() |> Json.Num)
        ("Src",p.Src.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Entity",p.Entity.ToString() |> Json.Num)
        ("DataType",(p.DataType |> EnumToValue).ToString() |> Json.Num)
        ("Data",p.Data.ToString() |> Json.Num)
        ("Msg",p.Msg |> Json.Str)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Readdat",(p.Readdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num) |]
    |> Json.Braket

let NOTIFICATION__json (v:NOTIFICATION) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("SrcType",(p.SrcType |> EnumToValue).ToString() |> Json.Num)
        ("Src",p.Src.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Entity",p.Entity.ToString() |> Json.Num)
        ("DataType",(p.DataType |> EnumToValue).ToString() |> Json.Num)
        ("Data",p.Data.ToString() |> Json.Num)
        ("Msg",p.Msg |> Json.Str)
        ("Status",(p.Status |> EnumToValue).ToString() |> Json.Num)
        ("Readdat",(p.Readdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num) |]
    |> Json.Braket

let NOTIFICATION__jsonTbw (w:TextBlockWriter) (v:NOTIFICATION) =
    json__str w (NOTIFICATION__json v)

let NOTIFICATION__jsonStr (v:NOTIFICATION) =
    (NOTIFICATION__json v) |> json__strFinal


let json__pNOTIFICATIONo (json:Json):pNOTIFICATION option =
    let fields = json |> json__items

    let p = pNOTIFICATION_empty()
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.SrcType <- checkfield fields "SrcType" |> parse_int32 |> EnumOfValue
    
    p.Src <- checkfield fields "Src" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Entity <- checkfield fields "Entity" |> parse_int64
    
    p.DataType <- checkfield fields "DataType" |> parse_int32 |> EnumOfValue
    
    p.Data <- checkfield fields "Data" |> parse_int64
    
    p.Msg <- checkfield fields "Msg"
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Readdat <- checkfield fields "Readdat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p |> Some
    

let json__NOTIFICATIONo (json:Json):NOTIFICATION option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pNOTIFICATION_empty()
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.SrcType <- checkfield fields "SrcType" |> parse_int32 |> EnumOfValue
    
    p.Src <- checkfield fields "Src" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Entity <- checkfield fields "Entity" |> parse_int64
    
    p.DataType <- checkfield fields "DataType" |> parse_int32 |> EnumOfValue
    
    p.Data <- checkfield fields "Data" |> parse_int64
    
    p.Msg <- checkfield fields "Msg"
    
    p.Status <- checkfield fields "Status" |> parse_int32 |> EnumOfValue
    
    p.Readdat <- checkfield fields "Readdat" |> parse_int64 |> Util.Time.unixtime__wintime
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [PLOG] Structure

let pPLOG__bin (bb:BytesBuilder) (p:pPLOG) =

    
    let binUrl = p.Url |> Encoding.UTF8.GetBytes
    binUrl.Length |> BitConverter.GetBytes |> bb.append
    binUrl |> bb.append
    
    let binPage = p.Page |> Encoding.UTF8.GetBytes
    binPage.Length |> BitConverter.GetBytes |> bb.append
    binPage |> bb.append
    
    let binIP = p.IP |> Encoding.UTF8.GetBytes
    binIP.Length |> BitConverter.GetBytes |> bb.append
    binIP |> bb.append
    
    p.Lng |> BitConverter.GetBytes |> bb.append
    
    p.Lat |> BitConverter.GetBytes |> bb.append
    
    let binCity = p.City |> Encoding.UTF8.GetBytes
    binCity.Length |> BitConverter.GetBytes |> bb.append
    binCity |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    let binSession = p.Session |> Encoding.UTF8.GetBytes
    binSession.Length |> BitConverter.GetBytes |> bb.append
    binSession |> bb.append
    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    let binApp = p.App |> Encoding.UTF8.GetBytes
    binApp.Length |> BitConverter.GetBytes |> bb.append
    binApp |> bb.append
    
    p.Loc |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.Device |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binReferCode = p.ReferCode |> Encoding.UTF8.GetBytes
    binReferCode.Length |> BitConverter.GetBytes |> bb.append
    binReferCode |> bb.append
    
    p.Referrer |> BitConverter.GetBytes |> bb.append
    
    let binReferApp = p.ReferApp |> Encoding.UTF8.GetBytes
    binReferApp.Length |> BitConverter.GetBytes |> bb.append
    binReferApp |> bb.append
    
    p.Platform |> BitConverter.GetBytes |> bb.append
    
    let binRequest = p.Request |> Encoding.UTF8.GetBytes
    binRequest.Length |> BitConverter.GetBytes |> bb.append
    binRequest |> bb.append
    
    let binRequestHex = p.RequestHex |> Encoding.UTF8.GetBytes
    binRequestHex.Length |> BitConverter.GetBytes |> bb.append
    binRequestHex |> bb.append
    
    let binResponse = p.Response |> Encoding.UTF8.GetBytes
    binResponse.Length |> BitConverter.GetBytes |> bb.append
    binResponse |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binInnerReferCode = p.InnerReferCode |> Encoding.UTF8.GetBytes
    binInnerReferCode.Length |> BitConverter.GetBytes |> bb.append
    binInnerReferCode |> bb.append
    
    let binReferrerUrl = p.ReferrerUrl |> Encoding.UTF8.GetBytes
    binReferrerUrl.Length |> BitConverter.GetBytes |> bb.append
    binReferrerUrl |> bb.append
    
    let binPromotionType = p.PromotionType |> Encoding.UTF8.GetBytes
    binPromotionType.Length |> BitConverter.GetBytes |> bb.append
    binPromotionType |> bb.append
    
    let binPromotion = p.Promotion |> Encoding.UTF8.GetBytes
    binPromotion.Length |> BitConverter.GetBytes |> bb.append
    binPromotion |> bb.append
    
    p.Domainname |> BitConverter.GetBytes |> bb.append
    
    p.Agent |> BitConverter.GetBytes |> bb.append

let PLOG__bin (bb:BytesBuilder) (v:PLOG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pPLOG__bin bb v.p

let bin__pPLOG (bi:BinIndexed):pPLOG =
    let bin,index = bi

    let p = pPLOG_empty()
    
    let count_Url = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Url <- Encoding.UTF8.GetString(bin,index.Value,count_Url)
    index.Value <- index.Value + count_Url
    
    let count_Page = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Page <- Encoding.UTF8.GetString(bin,index.Value,count_Page)
    index.Value <- index.Value + count_Page
    
    let count_IP = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.IP <- Encoding.UTF8.GetString(bin,index.Value,count_IP)
    index.Value <- index.Value + count_IP
    
    p.Lng <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lat <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_City = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.City <- Encoding.UTF8.GetString(bin,index.Value,count_City)
    index.Value <- index.Value + count_City
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Session = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Session <- Encoding.UTF8.GetString(bin,index.Value,count_Session)
    index.Value <- index.Value + count_Session
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_App = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.App <- Encoding.UTF8.GetString(bin,index.Value,count_App)
    index.Value <- index.Value + count_App
    
    p.Loc <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Device <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_ReferCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ReferCode <- Encoding.UTF8.GetString(bin,index.Value,count_ReferCode)
    index.Value <- index.Value + count_ReferCode
    
    p.Referrer <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_ReferApp = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ReferApp <- Encoding.UTF8.GetString(bin,index.Value,count_ReferApp)
    index.Value <- index.Value + count_ReferApp
    
    p.Platform <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Request = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Request <- Encoding.UTF8.GetString(bin,index.Value,count_Request)
    index.Value <- index.Value + count_Request
    
    let count_RequestHex = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.RequestHex <- Encoding.UTF8.GetString(bin,index.Value,count_RequestHex)
    index.Value <- index.Value + count_RequestHex
    
    let count_Response = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Response <- Encoding.UTF8.GetString(bin,index.Value,count_Response)
    index.Value <- index.Value + count_Response
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_InnerReferCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.InnerReferCode <- Encoding.UTF8.GetString(bin,index.Value,count_InnerReferCode)
    index.Value <- index.Value + count_InnerReferCode
    
    let count_ReferrerUrl = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ReferrerUrl <- Encoding.UTF8.GetString(bin,index.Value,count_ReferrerUrl)
    index.Value <- index.Value + count_ReferrerUrl
    
    let count_PromotionType = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.PromotionType <- Encoding.UTF8.GetString(bin,index.Value,count_PromotionType)
    index.Value <- index.Value + count_PromotionType
    
    let count_Promotion = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Promotion <- Encoding.UTF8.GetString(bin,index.Value,count_Promotion)
    index.Value <- index.Value + count_Promotion
    
    p.Domainname <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Agent <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__PLOG (bi:BinIndexed):PLOG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pPLOG bi }

let pPLOG__json (p:pPLOG) =

    [|
        ("Url",p.Url |> Json.Str)
        ("Page",p.Page |> Json.Str)
        ("IP",p.IP |> Json.Str)
        ("Lng",p.Lng.ToString() |> Json.Num)
        ("Lat",p.Lat.ToString() |> Json.Num)
        ("City",p.City |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Session",p.Session |> Json.Str)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("App",p.App |> Json.Str)
        ("Loc",(p.Loc |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Device",(p.Device |> EnumToValue).ToString() |> Json.Num)
        ("ReferCode",p.ReferCode |> Json.Str)
        ("Referrer",p.Referrer.ToString() |> Json.Num)
        ("ReferApp",p.ReferApp |> Json.Str)
        ("Platform",p.Platform.ToString() |> Json.Num)
        ("Request",p.Request |> Json.Str)
        ("RequestHex",p.RequestHex |> Json.Str)
        ("Response",p.Response |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("InnerReferCode",p.InnerReferCode |> Json.Str)
        ("ReferrerUrl",p.ReferrerUrl |> Json.Str)
        ("PromotionType",p.PromotionType |> Json.Str)
        ("Promotion",p.Promotion |> Json.Str)
        ("Domainname",p.Domainname.ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num) |]
    |> Json.Braket

let PLOG__json (v:PLOG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Url",p.Url |> Json.Str)
        ("Page",p.Page |> Json.Str)
        ("IP",p.IP |> Json.Str)
        ("Lng",p.Lng.ToString() |> Json.Num)
        ("Lat",p.Lat.ToString() |> Json.Num)
        ("City",p.City |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("Session",p.Session |> Json.Str)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("App",p.App |> Json.Str)
        ("Loc",(p.Loc |> EnumToValue).ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("Device",(p.Device |> EnumToValue).ToString() |> Json.Num)
        ("ReferCode",p.ReferCode |> Json.Str)
        ("Referrer",p.Referrer.ToString() |> Json.Num)
        ("ReferApp",p.ReferApp |> Json.Str)
        ("Platform",p.Platform.ToString() |> Json.Num)
        ("Request",p.Request |> Json.Str)
        ("RequestHex",p.RequestHex |> Json.Str)
        ("Response",p.Response |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("InnerReferCode",p.InnerReferCode |> Json.Str)
        ("ReferrerUrl",p.ReferrerUrl |> Json.Str)
        ("PromotionType",p.PromotionType |> Json.Str)
        ("Promotion",p.Promotion |> Json.Str)
        ("Domainname",p.Domainname.ToString() |> Json.Num)
        ("Agent",p.Agent.ToString() |> Json.Num) |]
    |> Json.Braket

let PLOG__jsonTbw (w:TextBlockWriter) (v:PLOG) =
    json__str w (PLOG__json v)

let PLOG__jsonStr (v:PLOG) =
    (PLOG__json v) |> json__strFinal


let json__pPLOGo (json:Json):pPLOG option =
    let fields = json |> json__items

    let p = pPLOG_empty()
    
    p.Url <- checkfield fields "Url"
    
    p.Page <- checkfield fields "Page"
    
    p.IP <- checkfield fields "IP"
    
    p.Lng <- checkfield fields "Lng" |> parse_float
    
    p.Lat <- checkfield fields "Lat" |> parse_float
    
    p.City <- checkfield fields "City"
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.App <- checkfieldz fields "App" 256
    
    p.Loc <- checkfield fields "Loc" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Device <- checkfield fields "Device" |> parse_int32 |> EnumOfValue
    
    p.ReferCode <- checkfieldz fields "ReferCode" 16
    
    p.Referrer <- checkfield fields "Referrer" |> parse_int64
    
    p.ReferApp <- checkfieldz fields "ReferApp" 256
    
    p.Platform <- checkfield fields "Platform" |> parse_int64
    
    p.Request <- checkfield fields "Request"
    
    p.RequestHex <- checkfield fields "RequestHex"
    
    p.Response <- checkfield fields "Response"
    
    p.Desc <- checkfield fields "Desc"
    
    p.InnerReferCode <- checkfieldz fields "InnerReferCode" 256
    
    p.ReferrerUrl <- checkfield fields "ReferrerUrl"
    
    p.PromotionType <- checkfieldz fields "PromotionType" 256
    
    p.Promotion <- checkfieldz fields "Promotion" 256
    
    p.Domainname <- checkfield fields "Domainname" |> parse_int64
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    p |> Some
    

let json__PLOGo (json:Json):PLOG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pPLOG_empty()
    
    p.Url <- checkfield fields "Url"
    
    p.Page <- checkfield fields "Page"
    
    p.IP <- checkfield fields "IP"
    
    p.Lng <- checkfield fields "Lng" |> parse_float
    
    p.Lat <- checkfield fields "Lat" |> parse_float
    
    p.City <- checkfield fields "City"
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.Session <- checkfieldz fields "Session" 64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.App <- checkfieldz fields "App" 256
    
    p.Loc <- checkfield fields "Loc" |> parse_int32 |> EnumOfValue
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.Device <- checkfield fields "Device" |> parse_int32 |> EnumOfValue
    
    p.ReferCode <- checkfieldz fields "ReferCode" 16
    
    p.Referrer <- checkfield fields "Referrer" |> parse_int64
    
    p.ReferApp <- checkfieldz fields "ReferApp" 256
    
    p.Platform <- checkfield fields "Platform" |> parse_int64
    
    p.Request <- checkfield fields "Request"
    
    p.RequestHex <- checkfield fields "RequestHex"
    
    p.Response <- checkfield fields "Response"
    
    p.Desc <- checkfield fields "Desc"
    
    p.InnerReferCode <- checkfieldz fields "InnerReferCode" 256
    
    p.ReferrerUrl <- checkfield fields "ReferrerUrl"
    
    p.PromotionType <- checkfieldz fields "PromotionType" 256
    
    p.Promotion <- checkfieldz fields "Promotion" 256
    
    p.Domainname <- checkfield fields "Domainname" |> parse_int64
    
    p.Agent <- checkfield fields "Agent" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [PRIVILEGE] Structure

let pPRIVILEGE__bin (bb:BytesBuilder) (p:pPRIVILEGE) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Cat |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binApiFullname = p.ApiFullname |> Encoding.UTF8.GetBytes
    binApiFullname.Length |> BitConverter.GetBytes |> bb.append
    binApiFullname |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    p.Scope |> BitConverter.GetBytes |> bb.append

let PRIVILEGE__bin (bb:BytesBuilder) (v:PRIVILEGE) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pPRIVILEGE__bin bb v.p

let bin__pPRIVILEGE (bi:BinIndexed):pPRIVILEGE =
    let bin,index = bi

    let p = pPRIVILEGE_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Cat <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_ApiFullname = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ApiFullname <- Encoding.UTF8.GetString(bin,index.Value,count_ApiFullname)
    index.Value <- index.Value + count_ApiFullname
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p.Scope <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__PRIVILEGE (bi:BinIndexed):PRIVILEGE =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pPRIVILEGE bi }

let pPRIVILEGE__json (p:pPRIVILEGE) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Cat",(p.Cat |> EnumToValue).ToString() |> Json.Num)
        ("ApiFullname",p.ApiFullname |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Scope",p.Scope.ToString() |> Json.Num) |]
    |> Json.Braket

let PRIVILEGE__json (v:PRIVILEGE) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Caption",p.Caption |> Json.Str)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Cat",(p.Cat |> EnumToValue).ToString() |> Json.Num)
        ("ApiFullname",p.ApiFullname |> Json.Str)
        ("Desc",p.Desc |> Json.Str)
        ("Scope",p.Scope.ToString() |> Json.Num) |]
    |> Json.Braket

let PRIVILEGE__jsonTbw (w:TextBlockWriter) (v:PRIVILEGE) =
    json__str w (PRIVILEGE__json v)

let PRIVILEGE__jsonStr (v:PRIVILEGE) =
    (PRIVILEGE__json v) |> json__strFinal


let json__pPRIVILEGEo (json:Json):pPRIVILEGE option =
    let fields = json |> json__items

    let p = pPRIVILEGE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Cat <- checkfield fields "Cat" |> parse_int32 |> EnumOfValue
    
    p.ApiFullname <- checkfieldz fields "ApiFullname" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Scope <- checkfield fields "Scope" |> parse_int64
    
    p |> Some
    

let json__PRIVILEGEo (json:Json):PRIVILEGE option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pPRIVILEGE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Cat <- checkfield fields "Cat" |> parse_int32 |> EnumOfValue
    
    p.ApiFullname <- checkfieldz fields "ApiFullname" 64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Scope <- checkfield fields "Scope" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [PLINK] Structure

let pPLINK__bin (bb:BytesBuilder) (p:pPLINK) =

    
    p.Expiry.Ticks |> BitConverter.GetBytes |> bb.append
    
    let binHashFull = p.HashFull |> Encoding.UTF8.GetBytes
    binHashFull.Length |> BitConverter.GetBytes |> bb.append
    binHashFull |> bb.append
    
    let binHashTiny = p.HashTiny |> Encoding.UTF8.GetBytes
    binHashTiny.Length |> BitConverter.GetBytes |> bb.append
    binHashTiny |> bb.append
    
    let binSrc = p.Src |> Encoding.UTF8.GetBytes
    binSrc.Length |> BitConverter.GetBytes |> bb.append
    binSrc |> bb.append
    
    p.Promoter |> BitConverter.GetBytes |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append

let PLINK__bin (bb:BytesBuilder) (v:PLINK) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pPLINK__bin bb v.p

let bin__pPLINK (bi:BinIndexed):pPLINK =
    let bin,index = bi

    let p = pPLINK_empty()
    
    p.Expiry <- BitConverter.ToInt64(bin,index.Value) |> DateTime.FromBinary
    index.Value <- index.Value + 8
    
    let count_HashFull = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.HashFull <- Encoding.UTF8.GetString(bin,index.Value,count_HashFull)
    index.Value <- index.Value + count_HashFull
    
    let count_HashTiny = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.HashTiny <- Encoding.UTF8.GetString(bin,index.Value,count_HashTiny)
    index.Value <- index.Value + count_HashTiny
    
    let count_Src = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Src <- Encoding.UTF8.GetString(bin,index.Value,count_Src)
    index.Value <- index.Value + count_Src
    
    p.Promoter <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p

let bin__PLINK (bi:BinIndexed):PLINK =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pPLINK bi }

let pPLINK__json (p:pPLINK) =

    [|
        ("Expiry",(p.Expiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HashFull",p.HashFull |> Json.Str)
        ("HashTiny",p.HashTiny |> Json.Str)
        ("Src",p.Src |> Json.Str)
        ("Promoter",p.Promoter.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num) |]
    |> Json.Braket

let PLINK__json (v:PLINK) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Expiry",(p.Expiry |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("HashFull",p.HashFull |> Json.Str)
        ("HashTiny",p.HashTiny |> Json.Str)
        ("Src",p.Src |> Json.Str)
        ("Promoter",p.Promoter.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num) |]
    |> Json.Braket

let PLINK__jsonTbw (w:TextBlockWriter) (v:PLINK) =
    json__str w (PLINK__json v)

let PLINK__jsonStr (v:PLINK) =
    (PLINK__json v) |> json__strFinal


let json__pPLINKo (json:Json):pPLINK option =
    let fields = json |> json__items

    let p = pPLINK_empty()
    
    p.Expiry <- checkfield fields "Expiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HashFull <- checkfieldz fields "HashFull" 64
    
    p.HashTiny <- checkfieldz fields "HashTiny" 7
    
    p.Src <- checkfield fields "Src"
    
    p.Promoter <- checkfield fields "Promoter" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p |> Some
    

let json__PLINKo (json:Json):PLINK option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pPLINK_empty()
    
    p.Expiry <- checkfield fields "Expiry" |> parse_int64 |> Util.Time.unixtime__wintime
    
    p.HashFull <- checkfieldz fields "HashFull" 64
    
    p.HashTiny <- checkfieldz fields "HashTiny" 7
    
    p.Src <- checkfield fields "Src"
    
    p.Promoter <- checkfield fields "Promoter" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [ROLE] Structure

let pROLE__bin (bb:BytesBuilder) (p:pROLE) =

    
    let binCode = p.Code |> Encoding.UTF8.GetBytes
    binCode.Length |> BitConverter.GetBytes |> bb.append
    binCode |> bb.append
    
    p.Inherit |> BitConverter.GetBytes |> bb.append
    
    let binCaption = p.Caption |> Encoding.UTF8.GetBytes
    binCaption.Length |> BitConverter.GetBytes |> bb.append
    binCaption |> bb.append
    
    p.Cat |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append

let ROLE__bin (bb:BytesBuilder) (v:ROLE) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pROLE__bin bb v.p

let bin__pROLE (bi:BinIndexed):pROLE =
    let bin,index = bi

    let p = pROLE_empty()
    
    let count_Code = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Code <- Encoding.UTF8.GetString(bin,index.Value,count_Code)
    index.Value <- index.Value + count_Code
    
    p.Inherit <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Caption = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Caption <- Encoding.UTF8.GetString(bin,index.Value,count_Caption)
    index.Value <- index.Value + count_Caption
    
    p.Cat <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p

let bin__ROLE (bi:BinIndexed):ROLE =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pROLE bi }

let pROLE__json (p:pROLE) =

    [|
        ("Code",p.Code |> Json.Str)
        ("Inherit",p.Inherit.ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Cat",(p.Cat |> EnumToValue).ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let ROLE__json (v:ROLE) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Code",p.Code |> Json.Str)
        ("Inherit",p.Inherit.ToString() |> Json.Num)
        ("Caption",p.Caption |> Json.Str)
        ("Cat",(p.Cat |> EnumToValue).ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let ROLE__jsonTbw (w:TextBlockWriter) (v:ROLE) =
    json__str w (ROLE__json v)

let ROLE__jsonStr (v:ROLE) =
    (ROLE__json v) |> json__strFinal


let json__pROLEo (json:Json):pROLE option =
    let fields = json |> json__items

    let p = pROLE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Inherit <- checkfield fields "Inherit" |> parse_int64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Cat <- checkfield fields "Cat" |> parse_int32 |> EnumOfValue
    
    p.Desc <- checkfield fields "Desc"
    
    p |> Some
    

let json__ROLEo (json:Json):ROLE option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pROLE_empty()
    
    p.Code <- checkfieldz fields "Code" 64
    
    p.Inherit <- checkfield fields "Inherit" |> parse_int64
    
    p.Caption <- checkfieldz fields "Caption" 256
    
    p.Cat <- checkfield fields "Cat" |> parse_int32 |> EnumOfValue
    
    p.Desc <- checkfield fields "Desc"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [ROLEASSIGN] Structure

let pROLEASSIGN__bin (bb:BytesBuilder) (p:pROLEASSIGN) =

    
    p.Role |> BitConverter.GetBytes |> bb.append
    
    p.Type |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Privilege |> BitConverter.GetBytes |> bb.append
    
    p.Workflow |> BitConverter.GetBytes |> bb.append
    
    p.WorkflowTransit |> BitConverter.GetBytes |> bb.append
    
    p.WorkflowState |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append
    
    let binProfile = p.Profile |> Encoding.UTF8.GetBytes
    binProfile.Length |> BitConverter.GetBytes |> bb.append
    binProfile |> bb.append

let ROLEASSIGN__bin (bb:BytesBuilder) (v:ROLEASSIGN) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pROLEASSIGN__bin bb v.p

let bin__pROLEASSIGN (bi:BinIndexed):pROLEASSIGN =
    let bin,index = bi

    let p = pROLEASSIGN_empty()
    
    p.Role <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Type <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Privilege <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Workflow <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.WorkflowTransit <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.WorkflowState <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    let count_Profile = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Profile <- Encoding.UTF8.GetString(bin,index.Value,count_Profile)
    index.Value <- index.Value + count_Profile
    
    p

let bin__ROLEASSIGN (bi:BinIndexed):ROLEASSIGN =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pROLEASSIGN bi }

let pROLEASSIGN__json (p:pROLEASSIGN) =

    [|
        ("Role",p.Role.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Workflow",p.Workflow.ToString() |> Json.Num)
        ("WorkflowTransit",p.WorkflowTransit.ToString() |> Json.Num)
        ("WorkflowState",p.WorkflowState.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Profile",p.Profile |> Json.Str) |]
    |> Json.Braket

let ROLEASSIGN__json (v:ROLEASSIGN) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("Role",p.Role.ToString() |> Json.Num)
        ("Type",(p.Type |> EnumToValue).ToString() |> Json.Num)
        ("Privilege",p.Privilege.ToString() |> Json.Num)
        ("Workflow",p.Workflow.ToString() |> Json.Num)
        ("WorkflowTransit",p.WorkflowTransit.ToString() |> Json.Num)
        ("WorkflowState",p.WorkflowState.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str)
        ("Profile",p.Profile |> Json.Str) |]
    |> Json.Braket

let ROLEASSIGN__jsonTbw (w:TextBlockWriter) (v:ROLEASSIGN) =
    json__str w (ROLEASSIGN__json v)

let ROLEASSIGN__jsonStr (v:ROLEASSIGN) =
    (ROLEASSIGN__json v) |> json__strFinal


let json__pROLEASSIGNo (json:Json):pROLEASSIGN option =
    let fields = json |> json__items

    let p = pROLEASSIGN_empty()
    
    p.Role <- checkfield fields "Role" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Workflow <- checkfield fields "Workflow" |> parse_int64
    
    p.WorkflowTransit <- checkfield fields "WorkflowTransit" |> parse_int64
    
    p.WorkflowState <- checkfield fields "WorkflowState" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Profile <- checkfield fields "Profile"
    
    p |> Some
    

let json__ROLEASSIGNo (json:Json):ROLEASSIGN option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pROLEASSIGN_empty()
    
    p.Role <- checkfield fields "Role" |> parse_int64
    
    p.Type <- checkfield fields "Type" |> parse_int32 |> EnumOfValue
    
    p.Privilege <- checkfield fields "Privilege" |> parse_int64
    
    p.Workflow <- checkfield fields "Workflow" |> parse_int64
    
    p.WorkflowTransit <- checkfield fields "WorkflowTransit" |> parse_int64
    
    p.WorkflowState <- checkfield fields "WorkflowState" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p.Profile <- checkfield fields "Profile"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [SLOG] Structure

let pSLOG__bin (bb:BytesBuilder) (p:pSLOG) =

    
    p.EU |> BitConverter.GetBytes |> bb.append
    
    let binIP = p.IP |> Encoding.UTF8.GetBytes
    binIP.Length |> BitConverter.GetBytes |> bb.append
    binIP |> bb.append
    
    p.Lng |> BitConverter.GetBytes |> bb.append
    
    p.Lat |> BitConverter.GetBytes |> bb.append
    
    let binCity = p.City |> Encoding.UTF8.GetBytes
    binCity.Length |> BitConverter.GetBytes |> bb.append
    binCity |> bb.append
    
    p.Country |> BitConverter.GetBytes |> bb.append
    
    let binCookieIn = p.CookieIn |> Encoding.UTF8.GetBytes
    binCookieIn.Length |> BitConverter.GetBytes |> bb.append
    binCookieIn |> bb.append
    
    let binCookieOut = p.CookieOut |> Encoding.UTF8.GetBytes
    binCookieOut.Length |> BitConverter.GetBytes |> bb.append
    binCookieOut |> bb.append
    
    p.Agent |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Act |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.WebCrential |> BitConverter.GetBytes |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append
    
    p.SessionCount |> BitConverter.GetBytes |> bb.append
    
    let binDesc = p.Desc |> Encoding.UTF8.GetBytes
    binDesc.Length |> BitConverter.GetBytes |> bb.append
    binDesc |> bb.append

let SLOG__bin (bb:BytesBuilder) (v:SLOG) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pSLOG__bin bb v.p

let bin__pSLOG (bi:BinIndexed):pSLOG =
    let bin,index = bi

    let p = pSLOG_empty()
    
    p.EU <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_IP = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.IP <- Encoding.UTF8.GetString(bin,index.Value,count_IP)
    index.Value <- index.Value + count_IP
    
    p.Lng <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Lat <- BitConverter.ToDouble(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_City = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.City <- Encoding.UTF8.GetString(bin,index.Value,count_City)
    index.Value <- index.Value + count_City
    
    p.Country <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_CookieIn = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.CookieIn <- Encoding.UTF8.GetString(bin,index.Value,count_CookieIn)
    index.Value <- index.Value + count_CookieIn
    
    let count_CookieOut = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.CookieOut <- Encoding.UTF8.GetString(bin,index.Value,count_CookieOut)
    index.Value <- index.Value + count_CookieOut
    
    p.Agent <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Act <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.WebCrential <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.SessionCount <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_Desc = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Desc <- Encoding.UTF8.GetString(bin,index.Value,count_Desc)
    index.Value <- index.Value + count_Desc
    
    p

let bin__SLOG (bi:BinIndexed):SLOG =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pSLOG bi }

let pSLOG__json (p:pSLOG) =

    [|
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Lng",p.Lng.ToString() |> Json.Num)
        ("Lat",p.Lat.ToString() |> Json.Num)
        ("City",p.City |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("CookieIn",p.CookieIn |> Json.Str)
        ("CookieOut",p.CookieOut |> Json.Str)
        ("Agent",(p.Agent |> EnumToValue).ToString() |> Json.Num)
        ("Act",(p.Act |> EnumToValue).ToString() |> Json.Num)
        ("WebCrential",p.WebCrential.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("SessionCount",p.SessionCount.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let SLOG__json (v:SLOG) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("EU",p.EU.ToString() |> Json.Num)
        ("IP",p.IP |> Json.Str)
        ("Lng",p.Lng.ToString() |> Json.Num)
        ("Lat",p.Lat.ToString() |> Json.Num)
        ("City",p.City |> Json.Str)
        ("Country",p.Country.ToString() |> Json.Num)
        ("CookieIn",p.CookieIn |> Json.Str)
        ("CookieOut",p.CookieOut |> Json.Str)
        ("Agent",(p.Agent |> EnumToValue).ToString() |> Json.Num)
        ("Act",(p.Act |> EnumToValue).ToString() |> Json.Num)
        ("WebCrential",p.WebCrential.ToString() |> Json.Num)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("SessionCount",p.SessionCount.ToString() |> Json.Num)
        ("Desc",p.Desc |> Json.Str) |]
    |> Json.Braket

let SLOG__jsonTbw (w:TextBlockWriter) (v:SLOG) =
    json__str w (SLOG__json v)

let SLOG__jsonStr (v:SLOG) =
    (SLOG__json v) |> json__strFinal


let json__pSLOGo (json:Json):pSLOG option =
    let fields = json |> json__items

    let p = pSLOG_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Lng <- checkfield fields "Lng" |> parse_float
    
    p.Lat <- checkfield fields "Lat" |> parse_float
    
    p.City <- checkfield fields "City"
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.CookieIn <- checkfieldz fields "CookieIn" 64
    
    p.CookieOut <- checkfieldz fields "CookieOut" 64
    
    p.Agent <- checkfield fields "Agent" |> parse_int32 |> EnumOfValue
    
    p.Act <- checkfield fields "Act" |> parse_int32 |> EnumOfValue
    
    p.WebCrential <- checkfield fields "WebCrential" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.SessionCount <- checkfield fields "SessionCount" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    p |> Some
    

let json__SLOGo (json:Json):SLOG option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pSLOG_empty()
    
    p.EU <- checkfield fields "EU" |> parse_int64
    
    p.IP <- checkfieldz fields "IP" 64
    
    p.Lng <- checkfield fields "Lng" |> parse_float
    
    p.Lat <- checkfield fields "Lat" |> parse_float
    
    p.City <- checkfield fields "City"
    
    p.Country <- checkfield fields "Country" |> parse_int64
    
    p.CookieIn <- checkfieldz fields "CookieIn" 64
    
    p.CookieOut <- checkfieldz fields "CookieOut" 64
    
    p.Agent <- checkfield fields "Agent" |> parse_int32 |> EnumOfValue
    
    p.Act <- checkfield fields "Act" |> parse_int32 |> EnumOfValue
    
    p.WebCrential <- checkfield fields "WebCrential" |> parse_int64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.SessionCount <- checkfield fields "SessionCount" |> parse_int64
    
    p.Desc <- checkfield fields "Desc"
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

// [LINKTRACK] Structure

let pLINKTRACK__bin (bb:BytesBuilder) (p:pLINKTRACK) =

    
    let binApp = p.App |> Encoding.UTF8.GetBytes
    binApp.Length |> BitConverter.GetBytes |> bb.append
    binApp |> bb.append
    
    p.Biz |> BitConverter.GetBytes |> bb.append
    
    p.EndUser |> BitConverter.GetBytes |> bb.append
    
    p.Bind |> BitConverter.GetBytes |> bb.append
    
    p.BindType |> EnumToValue |> BitConverter.GetBytes |> bb.append
    
    p.Visitor |> BitConverter.GetBytes |> bb.append
    
    let binVisitorApp = p.VisitorApp |> Encoding.UTF8.GetBytes
    binVisitorApp.Length |> BitConverter.GetBytes |> bb.append
    binVisitorApp |> bb.append
    
    let binShortLink = p.ShortLink |> Encoding.UTF8.GetBytes
    binShortLink.Length |> BitConverter.GetBytes |> bb.append
    binShortLink |> bb.append
    
    let binReferrerUrl = p.ReferrerUrl |> Encoding.UTF8.GetBytes
    binReferrerUrl.Length |> BitConverter.GetBytes |> bb.append
    binReferrerUrl |> bb.append
    
    let binInnerRefCode = p.InnerRefCode |> Encoding.UTF8.GetBytes
    binInnerRefCode.Length |> BitConverter.GetBytes |> bb.append
    binInnerRefCode |> bb.append
    
    let binPromotionType = p.PromotionType |> Encoding.UTF8.GetBytes
    binPromotionType.Length |> BitConverter.GetBytes |> bb.append
    binPromotionType |> bb.append
    
    let binPromotion = p.Promotion |> Encoding.UTF8.GetBytes
    binPromotion.Length |> BitConverter.GetBytes |> bb.append
    binPromotion |> bb.append

let LINKTRACK__bin (bb:BytesBuilder) (v:LINKTRACK) =
    v.ID |> BitConverter.GetBytes |> bb.append
    v.Sort |> BitConverter.GetBytes |> bb.append
    DateTime__bin bb v.Createdat
    DateTime__bin bb v.Updatedat
    
    pLINKTRACK__bin bb v.p

let bin__pLINKTRACK (bi:BinIndexed):pLINKTRACK =
    let bin,index = bi

    let p = pLINKTRACK_empty()
    
    let count_App = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.App <- Encoding.UTF8.GetString(bin,index.Value,count_App)
    index.Value <- index.Value + count_App
    
    p.Biz <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.EndUser <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.Bind <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    p.BindType <- BitConverter.ToInt32(bin,index.Value) |> EnumOfValue
    index.Value <- index.Value + 4
    
    p.Visitor <- BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let count_VisitorApp = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.VisitorApp <- Encoding.UTF8.GetString(bin,index.Value,count_VisitorApp)
    index.Value <- index.Value + count_VisitorApp
    
    let count_ShortLink = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ShortLink <- Encoding.UTF8.GetString(bin,index.Value,count_ShortLink)
    index.Value <- index.Value + count_ShortLink
    
    let count_ReferrerUrl = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.ReferrerUrl <- Encoding.UTF8.GetString(bin,index.Value,count_ReferrerUrl)
    index.Value <- index.Value + count_ReferrerUrl
    
    let count_InnerRefCode = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.InnerRefCode <- Encoding.UTF8.GetString(bin,index.Value,count_InnerRefCode)
    index.Value <- index.Value + count_InnerRefCode
    
    let count_PromotionType = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.PromotionType <- Encoding.UTF8.GetString(bin,index.Value,count_PromotionType)
    index.Value <- index.Value + count_PromotionType
    
    let count_Promotion = BitConverter.ToInt32(bin,index.Value)
    index.Value <- index.Value + 4
    p.Promotion <- Encoding.UTF8.GetString(bin,index.Value,count_Promotion)
    index.Value <- index.Value + count_Promotion
    
    p

let bin__LINKTRACK (bi:BinIndexed):LINKTRACK =
    let bin,index = bi

    let ID = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Sort = BitConverter.ToInt64(bin,index.Value)
    index.Value <- index.Value + 8
    
    let Createdat = bin__DateTime bi
    
    let Updatedat = bin__DateTime bi
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = bin__pLINKTRACK bi }

let pLINKTRACK__json (p:pLINKTRACK) =

    [|
        ("App",p.App |> Json.Str)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Visitor",p.Visitor.ToString() |> Json.Num)
        ("VisitorApp",p.VisitorApp |> Json.Str)
        ("ShortLink",p.ShortLink |> Json.Str)
        ("ReferrerUrl",p.ReferrerUrl |> Json.Str)
        ("InnerRefCode",p.InnerRefCode |> Json.Str)
        ("PromotionType",p.PromotionType |> Json.Str)
        ("Promotion",p.Promotion |> Json.Str) |]
    |> Json.Braket

let LINKTRACK__json (v:LINKTRACK) =

    let p = v.p
    
    [|  ("id",v.ID.ToString() |> Json.Num)
        ("sort",v.Sort.ToString() |> Json.Num)
        ("createdat",(v.Createdat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("updatedat",(v.Updatedat |> Util.Time.wintime__unixtime).ToString() |> Json.Num)
        ("App",p.App |> Json.Str)
        ("Biz",p.Biz.ToString() |> Json.Num)
        ("EndUser",p.EndUser.ToString() |> Json.Num)
        ("Bind",p.Bind.ToString() |> Json.Num)
        ("BindType",(p.BindType |> EnumToValue).ToString() |> Json.Num)
        ("Visitor",p.Visitor.ToString() |> Json.Num)
        ("VisitorApp",p.VisitorApp |> Json.Str)
        ("ShortLink",p.ShortLink |> Json.Str)
        ("ReferrerUrl",p.ReferrerUrl |> Json.Str)
        ("InnerRefCode",p.InnerRefCode |> Json.Str)
        ("PromotionType",p.PromotionType |> Json.Str)
        ("Promotion",p.Promotion |> Json.Str) |]
    |> Json.Braket

let LINKTRACK__jsonTbw (w:TextBlockWriter) (v:LINKTRACK) =
    json__str w (LINKTRACK__json v)

let LINKTRACK__jsonStr (v:LINKTRACK) =
    (LINKTRACK__json v) |> json__strFinal


let json__pLINKTRACKo (json:Json):pLINKTRACK option =
    let fields = json |> json__items

    let p = pLINKTRACK_empty()
    
    p.App <- checkfieldz fields "App" 64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Visitor <- checkfield fields "Visitor" |> parse_int64
    
    p.VisitorApp <- checkfieldz fields "VisitorApp" 64
    
    p.ShortLink <- checkfieldz fields "ShortLink" 64
    
    p.ReferrerUrl <- checkfield fields "ReferrerUrl"
    
    p.InnerRefCode <- checkfieldz fields "InnerRefCode" 64
    
    p.PromotionType <- checkfieldz fields "PromotionType" 256
    
    p.Promotion <- checkfieldz fields "Promotion" 256
    
    p |> Some
    

let json__LINKTRACKo (json:Json):LINKTRACK option =
    let fields = json |> json__items

    let ID = checkfield fields "id" |> parse_int64
    let Sort = checkfield fields "sort" |> parse_int64
    let Createdat = checkfield fields "createdat" |> parse_int64 |> DateTime.FromBinary
    let Updatedat = checkfield fields "updatedat" |> parse_int64 |> DateTime.FromBinary
    
    let p = pLINKTRACK_empty()
    
    p.App <- checkfieldz fields "App" 64
    
    p.Biz <- checkfield fields "Biz" |> parse_int64
    
    p.EndUser <- checkfield fields "EndUser" |> parse_int64
    
    p.Bind <- checkfield fields "Bind" |> parse_int64
    
    p.BindType <- checkfield fields "BindType" |> parse_int32 |> EnumOfValue
    
    p.Visitor <- checkfield fields "Visitor" |> parse_int64
    
    p.VisitorApp <- checkfieldz fields "VisitorApp" 64
    
    p.ShortLink <- checkfieldz fields "ShortLink" 64
    
    p.ReferrerUrl <- checkfield fields "ReferrerUrl"
    
    p.InnerRefCode <- checkfieldz fields "InnerRefCode" 64
    
    p.PromotionType <- checkfieldz fields "PromotionType" 256
    
    p.Promotion <- checkfieldz fields "Promotion" 256
    
    {
        ID = ID
        Sort = Sort
        Createdat = Createdat
        Updatedat = Updatedat
        p = p } |> Some
    

let mutable conn = ""

let db__pADDRESS(line:Object[]): pADDRESS =
    let p = pADDRESS_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Bind <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.Line1 <- string(line.[7]).TrimEnd()
    p.Line2 <- string(line.[8]).TrimEnd()
    p.State <- string(line.[9]).TrimEnd()
    p.County <- string(line.[10]).TrimEnd()
    p.Town <- string(line.[11]).TrimEnd()
    p.Contact <- string(line.[12]).TrimEnd()
    p.Tel <- string(line.[13]).TrimEnd()
    p.Email <- string(line.[14]).TrimEnd()
    p.Zip <- string(line.[15]).TrimEnd()
    p.City <- if Convert.IsDBNull(line.[16]) then 0L else line.[16] :?> int64
    p.Country <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.Remarks <- string(line.[18]).TrimEnd()

    p

let pADDRESS__sps (p:pADDRESS) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Line1", p.Line1)
    new SqlParameter("Line2", p.Line2)
    new SqlParameter("State", p.State)
    new SqlParameter("County", p.County)
    new SqlParameter("Town", p.Town)
    new SqlParameter("Contact", p.Contact)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Email", p.Email)
    new SqlParameter("Zip", p.Zip)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Remarks", p.Remarks) |]

let db__ADDRESS = db__Rcd db__pADDRESS

let ADDRESS_wrapper item: ADDRESS =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pADDRESS_clone (p:pADDRESS): pADDRESS = {
    Caption = p.Caption
    Bind = p.Bind
    Type = p.Type
    Line1 = p.Line1
    Line2 = p.Line2
    State = p.State
    County = p.County
    Town = p.Town
    Contact = p.Contact
    Tel = p.Tel
    Email = p.Email
    Zip = p.Zip
    City = p.City
    Country = p.Country
    Remarks = p.Remarks }

let ADDRESS_update_transaction output (updater,suc,fail) (rcd:ADDRESS) =
    let rollback_p = rcd.p |> pADDRESS_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,ADDRESS_table,ADDRESS_sql_update,pADDRESS__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let ADDRESS_update output (rcd:ADDRESS) =
    rcd
    |> ADDRESS_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let ADDRESS_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment ADDRESS_id
    let ctime = DateTime.UtcNow
    match create (conn,output,ADDRESS_table,pADDRESS__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> ADDRESS_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let ADDRESS_create output p =
    ADDRESS_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__ADDRESSo id: ADDRESS option = id__rcd(conn,ADDRESS_fieldorders,ADDRESS_table,db__ADDRESS) id

let ADDRESS_metadata = {
    fieldorders = ADDRESS_fieldorders
    db__rcd = db__ADDRESS 
    wrapper = ADDRESS_wrapper
    sps = pADDRESS__sps
    id = ADDRESS_id
    id__rcdo = id__ADDRESSo
    clone = pADDRESS_clone
    empty__p = pADDRESS_empty
    rcd__bin = ADDRESS__bin
    bin__rcd = bin__ADDRESS
    sql_update = ADDRESS_sql_update
    rcd_update = ADDRESS_update
    table = ADDRESS_table
    shorthand = "address" }

let ADDRESSTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Address' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Address ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Bind]
    ,[Type]
    ,[Line1]
    ,[Line2]
    ,[State]
    ,[County]
    ,[Town]
    ,[Contact]
    ,[Tel]
    ,[Email]
    ,[Zip]
    ,[City]
    ,[Country]
    ,[Remarks])
    END
    """


let db__pBIZ(line:Object[]): pBIZ =
    let p = pBIZ_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Parent <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BasicAcct <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Desc <- string(line.[8]).TrimEnd()
    p.Website <- string(line.[9]).TrimEnd()
    p.Icon <- string(line.[10]).TrimEnd()
    p.City <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Country <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[13]) then 0L else line.[13] :?> int64
    p.IsSocial <- if Convert.IsDBNull(line.[14]) then false else line.[14] :?> bool
    p.IsCmsSource <- if Convert.IsDBNull(line.[15]) then false else line.[15] :?> bool
    p.IsPay <- if Convert.IsDBNull(line.[16]) then false else line.[16] :?> bool
    p.MomentLatest <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.CountFollowers <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.CountFollows <- if Convert.IsDBNull(line.[19]) then 0L else line.[19] :?> int64
    p.CountMoments <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.CountViews <- if Convert.IsDBNull(line.[21]) then 0L else line.[21] :?> int64
    p.CountComments <- if Convert.IsDBNull(line.[22]) then 0L else line.[22] :?> int64
    p.CountThumbUps <- if Convert.IsDBNull(line.[23]) then 0L else line.[23] :?> int64
    p.CountThumbDns <- if Convert.IsDBNull(line.[24]) then 0L else line.[24] :?> int64
    p.IsCrawling <- if Convert.IsDBNull(line.[25]) then false else line.[25] :?> bool
    p.IsGSeries <- if Convert.IsDBNull(line.[26]) then false else line.[26] :?> bool
    p.RemarksCentral <- string(line.[27]).TrimEnd()
    p.Agent <- if Convert.IsDBNull(line.[28]) then 0L else line.[28] :?> int64
    p.SiteCats <- string(line.[29]).TrimEnd()
    p.ConfiguredCats <- string(line.[30]).TrimEnd()

    p

let pBIZ__sps (p:pBIZ) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Parent", p.Parent)
    new SqlParameter("BasicAcct", p.BasicAcct)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Website", p.Website)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("IsSocial", p.IsSocial)
    new SqlParameter("IsCmsSource", p.IsCmsSource)
    new SqlParameter("IsPay", p.IsPay)
    new SqlParameter("MomentLatest", p.MomentLatest)
    new SqlParameter("CountFollowers", p.CountFollowers)
    new SqlParameter("CountFollows", p.CountFollows)
    new SqlParameter("CountMoments", p.CountMoments)
    new SqlParameter("CountViews", p.CountViews)
    new SqlParameter("CountComments", p.CountComments)
    new SqlParameter("CountThumbUps", p.CountThumbUps)
    new SqlParameter("CountThumbDns", p.CountThumbDns)
    new SqlParameter("IsCrawling", p.IsCrawling)
    new SqlParameter("IsGSeries", p.IsGSeries)
    new SqlParameter("RemarksCentral", p.RemarksCentral)
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("SiteCats", p.SiteCats)
    new SqlParameter("ConfiguredCats", p.ConfiguredCats) |]

let db__BIZ = db__Rcd db__pBIZ

let BIZ_wrapper item: BIZ =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pBIZ_clone (p:pBIZ): pBIZ = {
    Code = p.Code
    Caption = p.Caption
    Parent = p.Parent
    BasicAcct = p.BasicAcct
    Desc = p.Desc
    Website = p.Website
    Icon = p.Icon
    City = p.City
    Country = p.Country
    Lang = p.Lang
    IsSocial = p.IsSocial
    IsCmsSource = p.IsCmsSource
    IsPay = p.IsPay
    MomentLatest = p.MomentLatest
    CountFollowers = p.CountFollowers
    CountFollows = p.CountFollows
    CountMoments = p.CountMoments
    CountViews = p.CountViews
    CountComments = p.CountComments
    CountThumbUps = p.CountThumbUps
    CountThumbDns = p.CountThumbDns
    IsCrawling = p.IsCrawling
    IsGSeries = p.IsGSeries
    RemarksCentral = p.RemarksCentral
    Agent = p.Agent
    SiteCats = p.SiteCats
    ConfiguredCats = p.ConfiguredCats }

let BIZ_update_transaction output (updater,suc,fail) (rcd:BIZ) =
    let rollback_p = rcd.p |> pBIZ_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,BIZ_table,BIZ_sql_update,pBIZ__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let BIZ_update output (rcd:BIZ) =
    rcd
    |> BIZ_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let BIZ_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment BIZ_id
    let ctime = DateTime.UtcNow
    match create (conn,output,BIZ_table,pBIZ__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> BIZ_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let BIZ_create output p =
    BIZ_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__BIZo id: BIZ option = id__rcd(conn,BIZ_fieldorders,BIZ_table,db__BIZ) id

let BIZ_metadata = {
    fieldorders = BIZ_fieldorders
    db__rcd = db__BIZ 
    wrapper = BIZ_wrapper
    sps = pBIZ__sps
    id = BIZ_id
    id__rcdo = id__BIZo
    clone = pBIZ_clone
    empty__p = pBIZ_empty
    rcd__bin = BIZ__bin
    bin__rcd = bin__BIZ
    sql_update = BIZ_sql_update
    rcd_update = BIZ_update
    table = BIZ_table
    shorthand = "biz" }

let BIZTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Biz' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Biz ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Caption]
    ,[Parent]
    ,[BasicAcct]
    ,[Desc]
    ,[Website]
    ,[Icon]
    ,[City]
    ,[Country]
    ,[Lang]
    ,[IsSocial]
    ,[IsCmsSource]
    ,[IsPay]
    ,[MomentLatest]
    ,[CountFollowers]
    ,[CountFollows]
    ,[CountMoments]
    ,[CountViews]
    ,[CountComments]
    ,[CountThumbUps]
    ,[CountThumbDns]
    ,[IsCrawling]
    ,[IsGSeries]
    ,[RemarksCentral]
    ,[Agent]
    ,[SiteCats]
    ,[ConfiguredCats])
    END
    """


let db__pCRY(line:Object[]): pCRY =
    let p = pCRY_empty()

    p.Code2 <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Fullname <- string(line.[6]).TrimEnd()
    p.Icon <- string(line.[7]).TrimEnd()
    p.Tel <- string(line.[8]).TrimEnd()
    p.Cur <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.Capital <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.Place <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64

    p

let pCRY__sps (p:pCRY) = [|
    new SqlParameter("Code2", p.Code2)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Fullname", p.Fullname)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Cur", p.Cur)
    new SqlParameter("Capital", p.Capital)
    new SqlParameter("Place", p.Place)
    new SqlParameter("Lang", p.Lang) |]

let db__CRY = db__Rcd db__pCRY

let CRY_wrapper item: CRY =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCRY_clone (p:pCRY): pCRY = {
    Code2 = p.Code2
    Caption = p.Caption
    Fullname = p.Fullname
    Icon = p.Icon
    Tel = p.Tel
    Cur = p.Cur
    Capital = p.Capital
    Place = p.Place
    Lang = p.Lang }

let CRY_update_transaction output (updater,suc,fail) (rcd:CRY) =
    let rollback_p = rcd.p |> pCRY_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CRY_table,CRY_sql_update,pCRY__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CRY_update output (rcd:CRY) =
    rcd
    |> CRY_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CRY_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CRY_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CRY_table,pCRY__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CRY_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CRY_create output p =
    CRY_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CRYo id: CRY option = id__rcd(conn,CRY_fieldorders,CRY_table,db__CRY) id

let CRY_metadata = {
    fieldorders = CRY_fieldorders
    db__rcd = db__CRY 
    wrapper = CRY_wrapper
    sps = pCRY__sps
    id = CRY_id
    id__rcdo = id__CRYo
    clone = pCRY_clone
    empty__p = pCRY_empty
    rcd__bin = CRY__bin
    bin__rcd = bin__CRY
    sql_update = CRY_sql_update
    rcd_update = CRY_update
    table = CRY_table
    shorthand = "cry" }

let CRYTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Country' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Country ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code2]
    ,[Caption]
    ,[Fullname]
    ,[Icon]
    ,[Tel]
    ,[Cur]
    ,[Capital]
    ,[Place]
    ,[Lang])
    END
    """


let db__pCUR(line:Object[]): pCUR =
    let p = pCUR_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Hidden <- if Convert.IsDBNull(line.[6]) then false else line.[6] :?> bool
    p.IsSac <- if Convert.IsDBNull(line.[7]) then false else line.[7] :?> bool
    p.IsTransfer <- if Convert.IsDBNull(line.[8]) then false else line.[8] :?> bool
    p.IsCash <- if Convert.IsDBNull(line.[9]) then false else line.[9] :?> bool
    p.EnableReward <- if Convert.IsDBNull(line.[10]) then false else line.[10] :?> bool
    p.EnableOTC <- if Convert.IsDBNull(line.[11]) then false else line.[11] :?> bool
    p.Icon <- string(line.[12]).TrimEnd()
    p.CurType <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.Dec <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.AnchorRate <- if Convert.IsDBNull(line.[15]) then 0.0 else line.[15] :?> float
    p.Freezable <- if Convert.IsDBNull(line.[16]) then false else line.[16] :?> bool
    p.Authorizable <- if Convert.IsDBNull(line.[17]) then false else line.[17] :?> bool
    p.ChaninID <- string(line.[18]).TrimEnd()
    p.ChaninName <- string(line.[19]).TrimEnd()
    p.ContractAddress <- string(line.[20]).TrimEnd()
    p.WalletAddress <- string(line.[21]).TrimEnd()
    p.BaseRate <- if Convert.IsDBNull(line.[22]) then 0.0 else line.[22] :?> float

    p

let pCUR__sps (p:pCUR) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Hidden", p.Hidden)
    new SqlParameter("IsSac", p.IsSac)
    new SqlParameter("IsTransfer", p.IsTransfer)
    new SqlParameter("IsCash", p.IsCash)
    new SqlParameter("EnableReward", p.EnableReward)
    new SqlParameter("EnableOTC", p.EnableOTC)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("CurType", p.CurType)
    new SqlParameter("Dec", p.Dec)
    new SqlParameter("AnchorRate", p.AnchorRate)
    new SqlParameter("Freezable", p.Freezable)
    new SqlParameter("Authorizable", p.Authorizable)
    new SqlParameter("ChaninID", p.ChaninID)
    new SqlParameter("ChaninName", p.ChaninName)
    new SqlParameter("ContractAddress", p.ContractAddress)
    new SqlParameter("WalletAddress", p.WalletAddress)
    new SqlParameter("BaseRate", p.BaseRate) |]

let db__CUR = db__Rcd db__pCUR

let CUR_wrapper item: CUR =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCUR_clone (p:pCUR): pCUR = {
    Code = p.Code
    Caption = p.Caption
    Hidden = p.Hidden
    IsSac = p.IsSac
    IsTransfer = p.IsTransfer
    IsCash = p.IsCash
    EnableReward = p.EnableReward
    EnableOTC = p.EnableOTC
    Icon = p.Icon
    CurType = p.CurType
    Dec = p.Dec
    AnchorRate = p.AnchorRate
    Freezable = p.Freezable
    Authorizable = p.Authorizable
    ChaninID = p.ChaninID
    ChaninName = p.ChaninName
    ContractAddress = p.ContractAddress
    WalletAddress = p.WalletAddress
    BaseRate = p.BaseRate }

let CUR_update_transaction output (updater,suc,fail) (rcd:CUR) =
    let rollback_p = rcd.p |> pCUR_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CUR_table,CUR_sql_update,pCUR__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CUR_update output (rcd:CUR) =
    rcd
    |> CUR_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CUR_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CUR_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CUR_table,pCUR__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CUR_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CUR_create output p =
    CUR_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CURo id: CUR option = id__rcd(conn,CUR_fieldorders,CUR_table,db__CUR) id

let CUR_metadata = {
    fieldorders = CUR_fieldorders
    db__rcd = db__CUR 
    wrapper = CUR_wrapper
    sps = pCUR__sps
    id = CUR_id
    id__rcdo = id__CURo
    clone = pCUR_clone
    empty__p = pCUR_empty
    rcd__bin = CUR__bin
    bin__rcd = bin__CUR
    sql_update = CUR_sql_update
    rcd_update = CUR_update
    table = CUR_table
    shorthand = "cur" }

let CURTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Cur' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Cur ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Caption]
    ,[Hidden]
    ,[IsSac]
    ,[IsTransfer]
    ,[IsCash]
    ,[EnableReward]
    ,[EnableOTC]
    ,[Icon]
    ,[CurType]
    ,[Dec]
    ,[AnchorRate]
    ,[Freezable]
    ,[Authorizable]
    ,[ChaninID]
    ,[ChaninName]
    ,[ContractAddress]
    ,[WalletAddress]
    ,[BaseRate])
    END
    """


let db__pEU(line:Object[]): pEU =
    let p = pEU_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Username <- string(line.[5]).TrimEnd()
    p.Email <- string(line.[6]).TrimEnd()
    p.Tel <- string(line.[7]).TrimEnd()
    p.Gender <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)
    p.Status <- EnumOfValue(if Convert.IsDBNull(line.[9]) then 0 else line.[9] :?> int)
    p.Admin <- EnumOfValue(if Convert.IsDBNull(line.[10]) then 0 else line.[10] :?> int)
    p.Privilege <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Verify <- EnumOfValue(if Convert.IsDBNull(line.[12]) then 0 else line.[12] :?> int)
    p.Pwd <- string(line.[13]).TrimEnd()
    p.Online <- if Convert.IsDBNull(line.[14]) then false else line.[14] :?> bool
    p.Icon <- string(line.[15]).TrimEnd()
    p.Background <- string(line.[16]).TrimEnd()
    p.BasicAcct <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.Citizen <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.Refer <- string(line.[19]).TrimEnd()
    p.Referer <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.Discord <- string(line.[21]).TrimEnd()
    p.DiscordId <- if Convert.IsDBNull(line.[22]) then 0L else line.[22] :?> int64
    p.Google <- string(line.[23]).TrimEnd()
    p.GoogleId <- if Convert.IsDBNull(line.[24]) then 0L else line.[24] :?> int64
    p.Apple <- string(line.[25]).TrimEnd()
    p.AppleId <- if Convert.IsDBNull(line.[26]) then 0L else line.[26] :?> int64
    p.OAuthProvider <- string(line.[27]).TrimEnd()
    p.OAuthID <- string(line.[28]).TrimEnd()
    p.GTV <- string(line.[29]).TrimEnd()
    p.Gettr <- string(line.[30]).TrimEnd()
    p.Farm <- if Convert.IsDBNull(line.[31]) then 0L else line.[31] :?> int64
    p.CountFollows <- if Convert.IsDBNull(line.[32]) then 0L else line.[32] :?> int64
    p.CountFollowers <- if Convert.IsDBNull(line.[33]) then 0L else line.[33] :?> int64
    p.CountMoments <- if Convert.IsDBNull(line.[34]) then 0L else line.[34] :?> int64
    p.CountViews <- if Convert.IsDBNull(line.[35]) then 0L else line.[35] :?> int64
    p.CountComments <- if Convert.IsDBNull(line.[36]) then 0L else line.[36] :?> int64
    p.CountThumbUps <- if Convert.IsDBNull(line.[37]) then 0L else line.[37] :?> int64
    p.CountThumbDns <- if Convert.IsDBNull(line.[38]) then 0L else line.[38] :?> int64
    p.Lang <- if Convert.IsDBNull(line.[39]) then 0L else line.[39] :?> int64
    p.BizOperator <- if Convert.IsDBNull(line.[40]) then 0L else line.[40] :?> int64
    p.Url <- string(line.[41]).TrimEnd()
    p.About <- string(line.[42]).TrimEnd()
    p.PublicPoints <- if Convert.IsDBNull(line.[43]) then 0L else line.[43] :?> int64
    p.Json <- string(line.[44]).TrimEnd()
    p.Agentable <- EnumOfValue(if Convert.IsDBNull(line.[45]) then 0 else line.[45] :?> int)

    p

let pEU__sps (p:pEU) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Username", p.Username)
    new SqlParameter("Email", p.Email)
    new SqlParameter("Tel", p.Tel)
    new SqlParameter("Gender", p.Gender)
    new SqlParameter("Status", p.Status)
    new SqlParameter("Admin", p.Admin)
    new SqlParameter("Privilege", p.Privilege)
    new SqlParameter("Verify", p.Verify)
    new SqlParameter("Pwd", p.Pwd)
    new SqlParameter("Online", p.Online)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("Background", p.Background)
    new SqlParameter("BasicAcct", p.BasicAcct)
    new SqlParameter("Citizen", p.Citizen)
    new SqlParameter("Refer", p.Refer)
    new SqlParameter("Referer", p.Referer)
    new SqlParameter("Discord", p.Discord)
    new SqlParameter("DiscordId", p.DiscordId)
    new SqlParameter("Google", p.Google)
    new SqlParameter("GoogleId", p.GoogleId)
    new SqlParameter("Apple", p.Apple)
    new SqlParameter("AppleId", p.AppleId)
    new SqlParameter("OAuthProvider", p.OAuthProvider)
    new SqlParameter("OAuthID", p.OAuthID)
    new SqlParameter("GTV", p.GTV)
    new SqlParameter("Gettr", p.Gettr)
    new SqlParameter("Farm", p.Farm)
    new SqlParameter("CountFollows", p.CountFollows)
    new SqlParameter("CountFollowers", p.CountFollowers)
    new SqlParameter("CountMoments", p.CountMoments)
    new SqlParameter("CountViews", p.CountViews)
    new SqlParameter("CountComments", p.CountComments)
    new SqlParameter("CountThumbUps", p.CountThumbUps)
    new SqlParameter("CountThumbDns", p.CountThumbDns)
    new SqlParameter("Lang", p.Lang)
    new SqlParameter("BizOperator", p.BizOperator)
    new SqlParameter("Url", p.Url)
    new SqlParameter("About", p.About)
    new SqlParameter("PublicPoints", p.PublicPoints)
    new SqlParameter("Json", p.Json)
    new SqlParameter("Agentable", p.Agentable) |]

let db__EU = db__Rcd db__pEU

let EU_wrapper item: EU =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pEU_clone (p:pEU): pEU = {
    Caption = p.Caption
    Username = p.Username
    Email = p.Email
    Tel = p.Tel
    Gender = p.Gender
    Status = p.Status
    Admin = p.Admin
    Privilege = p.Privilege
    Verify = p.Verify
    Pwd = p.Pwd
    Online = p.Online
    Icon = p.Icon
    Background = p.Background
    BasicAcct = p.BasicAcct
    Citizen = p.Citizen
    Refer = p.Refer
    Referer = p.Referer
    Discord = p.Discord
    DiscordId = p.DiscordId
    Google = p.Google
    GoogleId = p.GoogleId
    Apple = p.Apple
    AppleId = p.AppleId
    OAuthProvider = p.OAuthProvider
    OAuthID = p.OAuthID
    GTV = p.GTV
    Gettr = p.Gettr
    Farm = p.Farm
    CountFollows = p.CountFollows
    CountFollowers = p.CountFollowers
    CountMoments = p.CountMoments
    CountViews = p.CountViews
    CountComments = p.CountComments
    CountThumbUps = p.CountThumbUps
    CountThumbDns = p.CountThumbDns
    Lang = p.Lang
    BizOperator = p.BizOperator
    Url = p.Url
    About = p.About
    PublicPoints = p.PublicPoints
    Json = p.Json
    Agentable = p.Agentable }

let EU_update_transaction output (updater,suc,fail) (rcd:EU) =
    let rollback_p = rcd.p |> pEU_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,EU_table,EU_sql_update,pEU__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let EU_update output (rcd:EU) =
    rcd
    |> EU_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let EU_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment EU_id
    let ctime = DateTime.UtcNow
    match create (conn,output,EU_table,pEU__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> EU_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let EU_create output p =
    EU_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__EUo id: EU option = id__rcd(conn,EU_fieldorders,EU_table,db__EU) id

let EU_metadata = {
    fieldorders = EU_fieldorders
    db__rcd = db__EU 
    wrapper = EU_wrapper
    sps = pEU__sps
    id = EU_id
    id__rcdo = id__EUo
    clone = pEU_clone
    empty__p = pEU_empty
    rcd__bin = EU__bin
    bin__rcd = bin__EU
    sql_update = EU_sql_update
    rcd_update = EU_update
    table = EU_table
    shorthand = "eu" }

let EUTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_EndUser' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_EndUser ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Username]
    ,[Email]
    ,[Tel]
    ,[Gender]
    ,[Status]
    ,[Admin]
    ,[Privilege]
    ,[Verify]
    ,[Pwd]
    ,[Online]
    ,[Icon]
    ,[Background]
    ,[BasicAcct]
    ,[Citizen]
    ,[Refer]
    ,[Referer]
    ,[Discord]
    ,[DiscordId]
    ,[Google]
    ,[GoogleId]
    ,[Apple]
    ,[AppleId]
    ,[OAuthProvider]
    ,[OAuthID]
    ,[GTV]
    ,[Gettr]
    ,[Farm]
    ,[CountFollows]
    ,[CountFollowers]
    ,[CountMoments]
    ,[CountViews]
    ,[CountComments]
    ,[CountThumbUps]
    ,[CountThumbDns]
    ,[Lang]
    ,[BizOperator]
    ,[Url]
    ,[About]
    ,[PublicPoints]
    ,[Json]
    ,[Agentable])
    END
    """


let db__pFILE(line:Object[]): pFILE =
    let p = pFILE_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Content <- line.[5] :?> byte[]
    p.Encrypt <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.SHA256 <- string(line.[7]).TrimEnd()
    p.Size <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[10]) then 0 else line.[10] :?> int)
    p.State <- EnumOfValue(if Convert.IsDBNull(line.[11]) then 0 else line.[11] :?> int)
    p.Folder <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.FileType <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.JSON <- string(line.[14]).TrimEnd()

    p

let pFILE__sps (p:pFILE) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Content", p.Content)
    new SqlParameter("Encrypt", p.Encrypt)
    new SqlParameter("SHA256", p.SHA256)
    new SqlParameter("Size", p.Size)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("State", p.State)
    new SqlParameter("Folder", p.Folder)
    new SqlParameter("FileType", p.FileType)
    new SqlParameter("JSON", p.JSON) |]

let db__FILE = db__Rcd db__pFILE

let FILE_wrapper item: FILE =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFILE_clone (p:pFILE): pFILE = {
    Caption = p.Caption
    Content = p.Content
    Encrypt = p.Encrypt
    SHA256 = p.SHA256
    Size = p.Size
    Bind = p.Bind
    BindType = p.BindType
    State = p.State
    Folder = p.Folder
    FileType = p.FileType
    JSON = p.JSON }

let FILE_update_transaction output (updater,suc,fail) (rcd:FILE) =
    let rollback_p = rcd.p |> pFILE_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FILE_table,FILE_sql_update,pFILE__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FILE_update output (rcd:FILE) =
    rcd
    |> FILE_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FILE_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FILE_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FILE_table,pFILE__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FILE_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FILE_create output p =
    FILE_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FILEo id: FILE option = id__rcd(conn,FILE_fieldorders,FILE_table,db__FILE) id

let FILE_metadata = {
    fieldorders = FILE_fieldorders
    db__rcd = db__FILE 
    wrapper = FILE_wrapper
    sps = pFILE__sps
    id = FILE_id
    id__rcdo = id__FILEo
    clone = pFILE_clone
    empty__p = pFILE_empty
    rcd__bin = FILE__bin
    bin__rcd = bin__FILE
    sql_update = FILE_sql_update
    rcd_update = FILE_update
    table = FILE_table
    shorthand = "file" }

let FILETxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_File' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_File ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Content]
    ,[Encrypt]
    ,[SHA256]
    ,[Size]
    ,[Bind]
    ,[BindType]
    ,[State]
    ,[Folder]
    ,[FileType]
    ,[JSON])
    END
    """


let db__pFOLDER(line:Object[]): pFOLDER =
    let p = pFOLDER_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Encrypt <- EnumOfValue(if Convert.IsDBNull(line.[5]) then 0 else line.[5] :?> int)
    p.Bind <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.Parent <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64

    p

let pFOLDER__sps (p:pFOLDER) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Encrypt", p.Encrypt)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("Parent", p.Parent) |]

let db__FOLDER = db__Rcd db__pFOLDER

let FOLDER_wrapper item: FOLDER =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pFOLDER_clone (p:pFOLDER): pFOLDER = {
    Caption = p.Caption
    Encrypt = p.Encrypt
    Bind = p.Bind
    BindType = p.BindType
    Parent = p.Parent }

let FOLDER_update_transaction output (updater,suc,fail) (rcd:FOLDER) =
    let rollback_p = rcd.p |> pFOLDER_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,FOLDER_table,FOLDER_sql_update,pFOLDER__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let FOLDER_update output (rcd:FOLDER) =
    rcd
    |> FOLDER_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let FOLDER_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment FOLDER_id
    let ctime = DateTime.UtcNow
    match create (conn,output,FOLDER_table,pFOLDER__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> FOLDER_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let FOLDER_create output p =
    FOLDER_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__FOLDERo id: FOLDER option = id__rcd(conn,FOLDER_fieldorders,FOLDER_table,db__FOLDER) id

let FOLDER_metadata = {
    fieldorders = FOLDER_fieldorders
    db__rcd = db__FOLDER 
    wrapper = FOLDER_wrapper
    sps = pFOLDER__sps
    id = FOLDER_id
    id__rcdo = id__FOLDERo
    clone = pFOLDER_clone
    empty__p = pFOLDER_empty
    rcd__bin = FOLDER__bin
    bin__rcd = bin__FOLDER
    sql_update = FOLDER_sql_update
    rcd_update = FOLDER_update
    table = FOLDER_table
    shorthand = "folder" }

let FOLDERTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Folder' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Folder ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Encrypt]
    ,[Bind]
    ,[BindType]
    ,[Parent])
    END
    """


let db__pLANG(line:Object[]): pLANG =
    let p = pLANG_empty()

    p.Code2 <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Native <- string(line.[6]).TrimEnd()
    p.Icon <- string(line.[7]).TrimEnd()
    p.IsBlank <- if Convert.IsDBNull(line.[8]) then false else line.[8] :?> bool
    p.IsLocale <- if Convert.IsDBNull(line.[9]) then false else line.[9] :?> bool
    p.IsContent <- if Convert.IsDBNull(line.[10]) then false else line.[10] :?> bool
    p.IsAutoTranslate <- if Convert.IsDBNull(line.[11]) then false else line.[11] :?> bool
    p.TextDirection <- EnumOfValue(if Convert.IsDBNull(line.[12]) then 0 else line.[12] :?> int)

    p

let pLANG__sps (p:pLANG) = [|
    new SqlParameter("Code2", p.Code2)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Native", p.Native)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("IsBlank", p.IsBlank)
    new SqlParameter("IsLocale", p.IsLocale)
    new SqlParameter("IsContent", p.IsContent)
    new SqlParameter("IsAutoTranslate", p.IsAutoTranslate)
    new SqlParameter("TextDirection", p.TextDirection) |]

let db__LANG = db__Rcd db__pLANG

let LANG_wrapper item: LANG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLANG_clone (p:pLANG): pLANG = {
    Code2 = p.Code2
    Caption = p.Caption
    Native = p.Native
    Icon = p.Icon
    IsBlank = p.IsBlank
    IsLocale = p.IsLocale
    IsContent = p.IsContent
    IsAutoTranslate = p.IsAutoTranslate
    TextDirection = p.TextDirection }

let LANG_update_transaction output (updater,suc,fail) (rcd:LANG) =
    let rollback_p = rcd.p |> pLANG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LANG_table,LANG_sql_update,pLANG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LANG_update output (rcd:LANG) =
    rcd
    |> LANG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LANG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LANG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LANG_table,pLANG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LANG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LANG_create output p =
    LANG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LANGo id: LANG option = id__rcd(conn,LANG_fieldorders,LANG_table,db__LANG) id

let LANG_metadata = {
    fieldorders = LANG_fieldorders
    db__rcd = db__LANG 
    wrapper = LANG_wrapper
    sps = pLANG__sps
    id = LANG_id
    id__rcdo = id__LANGo
    clone = pLANG_clone
    empty__p = pLANG_empty
    rcd__bin = LANG__bin
    bin__rcd = bin__LANG
    sql_update = LANG_sql_update
    rcd_update = LANG_update
    table = LANG_table
    shorthand = "lang" }

let LANGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_Lang' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_Lang ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code2]
    ,[Caption]
    ,[Native]
    ,[Icon]
    ,[IsBlank]
    ,[IsLocale]
    ,[IsContent]
    ,[IsAutoTranslate]
    ,[TextDirection])
    END
    """


let db__pCWC(line:Object[]): pCWC =
    let p = pCWC_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.ExternalId <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Icon <- string(line.[6]).TrimEnd()
    p.EU <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Biz <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Json <- string(line.[9]).TrimEnd()

    p

let pCWC__sps (p:pCWC) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("ExternalId", p.ExternalId)
    new SqlParameter("Icon", p.Icon)
    new SqlParameter("EU", p.EU)
    new SqlParameter("Biz", p.Biz)
    new SqlParameter("Json", p.Json) |]

let db__CWC = db__Rcd db__pCWC

let CWC_wrapper item: CWC =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCWC_clone (p:pCWC): pCWC = {
    Caption = p.Caption
    ExternalId = p.ExternalId
    Icon = p.Icon
    EU = p.EU
    Biz = p.Biz
    Json = p.Json }

let CWC_update_transaction output (updater,suc,fail) (rcd:CWC) =
    let rollback_p = rcd.p |> pCWC_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CWC_table,CWC_sql_update,pCWC__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CWC_update output (rcd:CWC) =
    rcd
    |> CWC_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CWC_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CWC_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CWC_table,pCWC__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CWC_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CWC_create output p =
    CWC_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CWCo id: CWC option = id__rcd(conn,CWC_fieldorders,CWC_table,db__CWC) id

let CWC_metadata = {
    fieldorders = CWC_fieldorders
    db__rcd = db__CWC 
    wrapper = CWC_wrapper
    sps = pCWC__sps
    id = CWC_id
    id__rcdo = id__CWCo
    clone = pCWC_clone
    empty__p = pCWC_empty
    rcd__bin = CWC__bin
    bin__rcd = bin__CWC
    sql_update = CWC_sql_update
    rcd_update = CWC_update
    table = CWC_table
    shorthand = "cwc" }

let CWCTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Ca_WebCredential' AND xtype='U')
    BEGIN

        CREATE TABLE Ca_WebCredential ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[ExternalId]
    ,[Icon]
    ,[EU]
    ,[Biz]
    ,[Json])
    END
    """


let db__pAPILOG(line:Object[]): pAPILOG =
    let p = pAPILOG_empty()

    p.Location <- string(line.[4]).TrimEnd()
    p.ApiKey <- string(line.[5]).TrimEnd()
    p.IP <- string(line.[6]).TrimEnd()
    p.Session <- string(line.[7]).TrimEnd()
    p.Biz <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.BizCode <- string(line.[9]).TrimEnd()
    p.Api <- string(line.[10]).TrimEnd()
    p.Request <- string(line.[11]).TrimEnd()
    p.RequestHex <- string(line.[12]).TrimEnd()
    p.RequestJson <- string(line.[13]).TrimEnd()
    p.Response <- string(line.[14]).TrimEnd()
    p.ResponseJson <- string(line.[15]).TrimEnd()
    p.Content <- string(line.[16]).TrimEnd()
    p.Eu <- if Convert.IsDBNull(line.[17]) then 0L else line.[17] :?> int64
    p.Agent <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.Data <- if Convert.IsDBNull(line.[19]) then 0L else line.[19] :?> int64

    p

let pAPILOG__sps (p:pAPILOG) = [|
    new SqlParameter("Location", p.Location)
    new SqlParameter("ApiKey", p.ApiKey)
    new SqlParameter("IP", p.IP)
    new SqlParameter("Session", p.Session)
    new SqlParameter("Biz", p.Biz)
    new SqlParameter("BizCode", p.BizCode)
    new SqlParameter("Api", p.Api)
    new SqlParameter("Request", p.Request)
    new SqlParameter("RequestHex", p.RequestHex)
    new SqlParameter("RequestJson", p.RequestJson)
    new SqlParameter("Response", p.Response)
    new SqlParameter("ResponseJson", p.ResponseJson)
    new SqlParameter("Content", p.Content)
    new SqlParameter("Eu", p.Eu)
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("Data", p.Data) |]

let db__APILOG = db__Rcd db__pAPILOG

let APILOG_wrapper item: APILOG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pAPILOG_clone (p:pAPILOG): pAPILOG = {
    Location = p.Location
    ApiKey = p.ApiKey
    IP = p.IP
    Session = p.Session
    Biz = p.Biz
    BizCode = p.BizCode
    Api = p.Api
    Request = p.Request
    RequestHex = p.RequestHex
    RequestJson = p.RequestJson
    Response = p.Response
    ResponseJson = p.ResponseJson
    Content = p.Content
    Eu = p.Eu
    Agent = p.Agent
    Data = p.Data }

let APILOG_update_transaction output (updater,suc,fail) (rcd:APILOG) =
    let rollback_p = rcd.p |> pAPILOG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,APILOG_table,APILOG_sql_update,pAPILOG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let APILOG_update output (rcd:APILOG) =
    rcd
    |> APILOG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let APILOG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment APILOG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,APILOG_table,pAPILOG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> APILOG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let APILOG_create output p =
    APILOG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__APILOGo id: APILOG option = id__rcd(conn,APILOG_fieldorders,APILOG_table,db__APILOG) id

let APILOG_metadata = {
    fieldorders = APILOG_fieldorders
    db__rcd = db__APILOG 
    wrapper = APILOG_wrapper
    sps = pAPILOG__sps
    id = APILOG_id
    id__rcdo = id__APILOGo
    clone = pAPILOG_clone
    empty__p = pAPILOG_empty
    rcd__bin = APILOG__bin
    bin__rcd = bin__APILOG
    sql_update = APILOG_sql_update
    rcd_update = APILOG_update
    table = APILOG_table
    shorthand = "apilog" }

let APILOGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_ApiLog' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_ApiLog ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Location]
    ,[ApiKey]
    ,[IP]
    ,[Session]
    ,[Biz]
    ,[BizCode]
    ,[Api]
    ,[Request]
    ,[RequestHex]
    ,[RequestJson]
    ,[Response]
    ,[ResponseJson]
    ,[Content]
    ,[Eu]
    ,[Agent]
    ,[Data])
    END
    """


let db__pAUTH(line:Object[]): pAUTH =
    let p = pAUTH_empty()

    p.Admin <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.Role <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Desc <- string(line.[6]).TrimEnd()
    p.Profile <- string(line.[7]).TrimEnd()
    p.AdminType <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)

    p

let pAUTH__sps (p:pAUTH) = [|
    new SqlParameter("Admin", p.Admin)
    new SqlParameter("Role", p.Role)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Profile", p.Profile)
    new SqlParameter("AdminType", p.AdminType) |]

let db__AUTH = db__Rcd db__pAUTH

let AUTH_wrapper item: AUTH =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pAUTH_clone (p:pAUTH): pAUTH = {
    Admin = p.Admin
    Role = p.Role
    Desc = p.Desc
    Profile = p.Profile
    AdminType = p.AdminType }

let AUTH_update_transaction output (updater,suc,fail) (rcd:AUTH) =
    let rollback_p = rcd.p |> pAUTH_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,AUTH_table,AUTH_sql_update,pAUTH__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let AUTH_update output (rcd:AUTH) =
    rcd
    |> AUTH_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let AUTH_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment AUTH_id
    let ctime = DateTime.UtcNow
    match create (conn,output,AUTH_table,pAUTH__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> AUTH_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let AUTH_create output p =
    AUTH_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__AUTHo id: AUTH option = id__rcd(conn,AUTH_fieldorders,AUTH_table,db__AUTH) id

let AUTH_metadata = {
    fieldorders = AUTH_fieldorders
    db__rcd = db__AUTH 
    wrapper = AUTH_wrapper
    sps = pAUTH__sps
    id = AUTH_id
    id__rcdo = id__AUTHo
    clone = pAUTH_clone
    empty__p = pAUTH_empty
    rcd__bin = AUTH__bin
    bin__rcd = bin__AUTH
    sql_update = AUTH_sql_update
    rcd_update = AUTH_update
    table = AUTH_table
    shorthand = "auth" }

let AUTHTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Authorization' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Authorization ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Admin]
    ,[Role]
    ,[Desc]
    ,[Profile]
    ,[AdminType])
    END
    """


let db__pCONFIG(line:Object[]): pCONFIG =
    let p = pCONFIG_empty()

    p.Caption <- string(line.[4]).TrimEnd()
    p.Code <- string(line.[5]).TrimEnd()
    p.Value <- string(line.[6]).TrimEnd()
    p.Desc <- string(line.[7]).TrimEnd()

    p

let pCONFIG__sps (p:pCONFIG) = [|
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Code", p.Code)
    new SqlParameter("Value", p.Value)
    new SqlParameter("Desc", p.Desc) |]

let db__CONFIG = db__Rcd db__pCONFIG

let CONFIG_wrapper item: CONFIG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pCONFIG_clone (p:pCONFIG): pCONFIG = {
    Caption = p.Caption
    Code = p.Code
    Value = p.Value
    Desc = p.Desc }

let CONFIG_update_transaction output (updater,suc,fail) (rcd:CONFIG) =
    let rollback_p = rcd.p |> pCONFIG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,CONFIG_table,CONFIG_sql_update,pCONFIG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let CONFIG_update output (rcd:CONFIG) =
    rcd
    |> CONFIG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let CONFIG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment CONFIG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,CONFIG_table,pCONFIG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> CONFIG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let CONFIG_create output p =
    CONFIG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__CONFIGo id: CONFIG option = id__rcd(conn,CONFIG_fieldorders,CONFIG_table,db__CONFIG) id

let CONFIG_metadata = {
    fieldorders = CONFIG_fieldorders
    db__rcd = db__CONFIG 
    wrapper = CONFIG_wrapper
    sps = pCONFIG__sps
    id = CONFIG_id
    id__rcdo = id__CONFIGo
    clone = pCONFIG_clone
    empty__p = pCONFIG_empty
    rcd__bin = CONFIG__bin
    bin__rcd = bin__CONFIG
    sql_update = CONFIG_sql_update
    rcd_update = CONFIG_update
    table = CONFIG_table
    shorthand = "config" }

let CONFIGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Config' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Config ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Caption]
    ,[Code]
    ,[Value]
    ,[Desc])
    END
    """


let db__pEUSESS(line:Object[]): pEUSESS =
    let p = pEUSESS_empty()

    p.EU <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.IP <- string(line.[5]).TrimEnd()
    p.Session <- string(line.[6]).TrimEnd()
    p.App <- string(line.[7]).TrimEnd()

    p

let pEUSESS__sps (p:pEUSESS) = [|
    new SqlParameter("EU", p.EU)
    new SqlParameter("IP", p.IP)
    new SqlParameter("Session", p.Session)
    new SqlParameter("App", p.App) |]

let db__EUSESS = db__Rcd db__pEUSESS

let EUSESS_wrapper item: EUSESS =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pEUSESS_clone (p:pEUSESS): pEUSESS = {
    EU = p.EU
    IP = p.IP
    Session = p.Session
    App = p.App }

let EUSESS_update_transaction output (updater,suc,fail) (rcd:EUSESS) =
    let rollback_p = rcd.p |> pEUSESS_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,EUSESS_table,EUSESS_sql_update,pEUSESS__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let EUSESS_update output (rcd:EUSESS) =
    rcd
    |> EUSESS_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let EUSESS_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment EUSESS_id
    let ctime = DateTime.UtcNow
    match create (conn,output,EUSESS_table,pEUSESS__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> EUSESS_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let EUSESS_create output p =
    EUSESS_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__EUSESSo id: EUSESS option = id__rcd(conn,EUSESS_fieldorders,EUSESS_table,db__EUSESS) id

let EUSESS_metadata = {
    fieldorders = EUSESS_fieldorders
    db__rcd = db__EUSESS 
    wrapper = EUSESS_wrapper
    sps = pEUSESS__sps
    id = EUSESS_id
    id__rcdo = id__EUSESSo
    clone = pEUSESS_clone
    empty__p = pEUSESS_empty
    rcd__bin = EUSESS__bin
    bin__rcd = bin__EUSESS
    sql_update = EUSESS_sql_update
    rcd_update = EUSESS_update
    table = EUSESS_table
    shorthand = "eusess" }

let EUSESSTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_EuSession' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_EuSession ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EU]
    ,[IP]
    ,[Session]
    ,[App])
    END
    """


let db__pEUTOK(line:Object[]): pEUTOK =
    let p = pEUTOK_empty()

    p.EU <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.IP <- string(line.[5]).TrimEnd()
    p.Session <- string(line.[6]).TrimEnd()
    p.Token <- string(line.[7]).TrimEnd()
    p.App <- string(line.[8]).TrimEnd()

    p

let pEUTOK__sps (p:pEUTOK) = [|
    new SqlParameter("EU", p.EU)
    new SqlParameter("IP", p.IP)
    new SqlParameter("Session", p.Session)
    new SqlParameter("Token", p.Token)
    new SqlParameter("App", p.App) |]

let db__EUTOK = db__Rcd db__pEUTOK

let EUTOK_wrapper item: EUTOK =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pEUTOK_clone (p:pEUTOK): pEUTOK = {
    EU = p.EU
    IP = p.IP
    Session = p.Session
    Token = p.Token
    App = p.App }

let EUTOK_update_transaction output (updater,suc,fail) (rcd:EUTOK) =
    let rollback_p = rcd.p |> pEUTOK_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,EUTOK_table,EUTOK_sql_update,pEUTOK__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let EUTOK_update output (rcd:EUTOK) =
    rcd
    |> EUTOK_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let EUTOK_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment EUTOK_id
    let ctime = DateTime.UtcNow
    match create (conn,output,EUTOK_table,pEUTOK__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> EUTOK_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let EUTOK_create output p =
    EUTOK_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__EUTOKo id: EUTOK option = id__rcd(conn,EUTOK_fieldorders,EUTOK_table,db__EUTOK) id

let EUTOK_metadata = {
    fieldorders = EUTOK_fieldorders
    db__rcd = db__EUTOK 
    wrapper = EUTOK_wrapper
    sps = pEUTOK__sps
    id = EUTOK_id
    id__rcdo = id__EUTOKo
    clone = pEUTOK_clone
    empty__p = pEUTOK_empty
    rcd__bin = EUTOK__bin
    bin__rcd = bin__EUTOK
    sql_update = EUTOK_sql_update
    rcd_update = EUTOK_update
    table = EUTOK_table
    shorthand = "eutok" }

let EUTOKTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_EuToken' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_EuToken ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EU]
    ,[IP]
    ,[Session]
    ,[Token]
    ,[App])
    END
    """


let db__pLOG(line:Object[]): pLOG =
    let p = pLOG_empty()

    p.Desc <- string(line.[4]).TrimEnd()
    p.Location <- string(line.[5]).TrimEnd()
    p.Content <- string(line.[6]).TrimEnd()
    p.Sql <- string(line.[7]).TrimEnd()
    p.Level <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)

    p

let pLOG__sps (p:pLOG) = [|
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Location", p.Location)
    new SqlParameter("Content", p.Content)
    new SqlParameter("Sql", p.Sql)
    new SqlParameter("Level", p.Level) |]

let db__LOG = db__Rcd db__pLOG

let LOG_wrapper item: LOG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLOG_clone (p:pLOG): pLOG = {
    Desc = p.Desc
    Location = p.Location
    Content = p.Content
    Sql = p.Sql
    Level = p.Level }

let LOG_update_transaction output (updater,suc,fail) (rcd:LOG) =
    let rollback_p = rcd.p |> pLOG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LOG_table,LOG_sql_update,pLOG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LOG_update output (rcd:LOG) =
    rcd
    |> LOG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LOG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LOG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LOG_table,pLOG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LOG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LOG_create output p =
    LOG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LOGo id: LOG option = id__rcd(conn,LOG_fieldorders,LOG_table,db__LOG) id

let LOG_metadata = {
    fieldorders = LOG_fieldorders
    db__rcd = db__LOG 
    wrapper = LOG_wrapper
    sps = pLOG__sps
    id = LOG_id
    id__rcdo = id__LOGo
    clone = pLOG_clone
    empty__p = pLOG_empty
    rcd__bin = LOG__bin
    bin__rcd = bin__LOG
    sql_update = LOG_sql_update
    rcd_update = LOG_update
    table = LOG_table
    shorthand = "log" }

let LOGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Log' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Log ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Desc]
    ,[Location]
    ,[Content]
    ,[Sql]
    ,[Level])
    END
    """


let db__pNOTIFICATION(line:Object[]): pNOTIFICATION =
    let p = pNOTIFICATION_empty()

    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[4]) then 0 else line.[4] :?> int)
    p.Bind <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.SrcType <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.Src <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)
    p.Entity <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.DataType <- EnumOfValue(if Convert.IsDBNull(line.[10]) then 0 else line.[10] :?> int)
    p.Data <- if Convert.IsDBNull(line.[11]) then 0L else line.[11] :?> int64
    p.Msg <- string(line.[12]).TrimEnd()
    p.Status <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.Readdat <- DateTime.FromBinary(if Convert.IsDBNull(line.[14]) then DateTime.MinValue.Ticks else line.[14] :?> int64)

    p

let pNOTIFICATION__sps (p:pNOTIFICATION) = [|
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("SrcType", p.SrcType)
    new SqlParameter("Src", p.Src)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Entity", p.Entity)
    new SqlParameter("DataType", p.DataType)
    new SqlParameter("Data", p.Data)
    new SqlParameter("Msg", p.Msg)
    new SqlParameter("Status", p.Status)
    new SqlParameter("Readdat", p.Readdat.Ticks) |]

let db__NOTIFICATION = db__Rcd db__pNOTIFICATION

let NOTIFICATION_wrapper item: NOTIFICATION =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pNOTIFICATION_clone (p:pNOTIFICATION): pNOTIFICATION = {
    BindType = p.BindType
    Bind = p.Bind
    SrcType = p.SrcType
    Src = p.Src
    Type = p.Type
    Entity = p.Entity
    DataType = p.DataType
    Data = p.Data
    Msg = p.Msg
    Status = p.Status
    Readdat = p.Readdat }

let NOTIFICATION_update_transaction output (updater,suc,fail) (rcd:NOTIFICATION) =
    let rollback_p = rcd.p |> pNOTIFICATION_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,NOTIFICATION_table,NOTIFICATION_sql_update,pNOTIFICATION__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let NOTIFICATION_update output (rcd:NOTIFICATION) =
    rcd
    |> NOTIFICATION_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let NOTIFICATION_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment NOTIFICATION_id
    let ctime = DateTime.UtcNow
    match create (conn,output,NOTIFICATION_table,pNOTIFICATION__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> NOTIFICATION_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let NOTIFICATION_create output p =
    NOTIFICATION_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__NOTIFICATIONo id: NOTIFICATION option = id__rcd(conn,NOTIFICATION_fieldorders,NOTIFICATION_table,db__NOTIFICATION) id

let NOTIFICATION_metadata = {
    fieldorders = NOTIFICATION_fieldorders
    db__rcd = db__NOTIFICATION 
    wrapper = NOTIFICATION_wrapper
    sps = pNOTIFICATION__sps
    id = NOTIFICATION_id
    id__rcdo = id__NOTIFICATIONo
    clone = pNOTIFICATION_clone
    empty__p = pNOTIFICATION_empty
    rcd__bin = NOTIFICATION__bin
    bin__rcd = bin__NOTIFICATION
    sql_update = NOTIFICATION_sql_update
    rcd_update = NOTIFICATION_update
    table = NOTIFICATION_table
    shorthand = "notification" }

let NOTIFICATIONTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Notification' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Notification ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[BindType]
    ,[Bind]
    ,[SrcType]
    ,[Src]
    ,[Type]
    ,[Entity]
    ,[DataType]
    ,[Data]
    ,[Msg]
    ,[Status]
    ,[Readdat])
    END
    """


let db__pPLOG(line:Object[]): pPLOG =
    let p = pPLOG_empty()

    p.Url <- string(line.[4]).TrimEnd()
    p.Page <- string(line.[5]).TrimEnd()
    p.IP <- string(line.[6]).TrimEnd()
    p.Lng <- if Convert.IsDBNull(line.[7]) then 0.0 else line.[7] :?> float
    p.Lat <- if Convert.IsDBNull(line.[8]) then 0.0 else line.[8] :?> float
    p.City <- string(line.[9]).TrimEnd()
    p.Country <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64
    p.Session <- string(line.[11]).TrimEnd()
    p.EndUser <- if Convert.IsDBNull(line.[12]) then 0L else line.[12] :?> int64
    p.App <- string(line.[13]).TrimEnd()
    p.Loc <- EnumOfValue(if Convert.IsDBNull(line.[14]) then 0 else line.[14] :?> int)
    p.Bind <- if Convert.IsDBNull(line.[15]) then 0L else line.[15] :?> int64
    p.Device <- EnumOfValue(if Convert.IsDBNull(line.[16]) then 0 else line.[16] :?> int)
    p.ReferCode <- string(line.[17]).TrimEnd()
    p.Referrer <- if Convert.IsDBNull(line.[18]) then 0L else line.[18] :?> int64
    p.ReferApp <- string(line.[19]).TrimEnd()
    p.Platform <- if Convert.IsDBNull(line.[20]) then 0L else line.[20] :?> int64
    p.Request <- string(line.[21]).TrimEnd()
    p.RequestHex <- string(line.[22]).TrimEnd()
    p.Response <- string(line.[23]).TrimEnd()
    p.Desc <- string(line.[24]).TrimEnd()
    p.InnerReferCode <- string(line.[25]).TrimEnd()
    p.ReferrerUrl <- string(line.[26]).TrimEnd()
    p.PromotionType <- string(line.[27]).TrimEnd()
    p.Promotion <- string(line.[28]).TrimEnd()
    p.Domainname <- if Convert.IsDBNull(line.[29]) then 0L else line.[29] :?> int64
    p.Agent <- if Convert.IsDBNull(line.[30]) then 0L else line.[30] :?> int64

    p

let pPLOG__sps (p:pPLOG) = [|
    new SqlParameter("Url", p.Url)
    new SqlParameter("Page", p.Page)
    new SqlParameter("IP", p.IP)
    new SqlParameter("Lng", p.Lng)
    new SqlParameter("Lat", p.Lat)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("Session", p.Session)
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("App", p.App)
    new SqlParameter("Loc", p.Loc)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("Device", p.Device)
    new SqlParameter("ReferCode", p.ReferCode)
    new SqlParameter("Referrer", p.Referrer)
    new SqlParameter("ReferApp", p.ReferApp)
    new SqlParameter("Platform", p.Platform)
    new SqlParameter("Request", p.Request)
    new SqlParameter("RequestHex", p.RequestHex)
    new SqlParameter("Response", p.Response)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("InnerReferCode", p.InnerReferCode)
    new SqlParameter("ReferrerUrl", p.ReferrerUrl)
    new SqlParameter("PromotionType", p.PromotionType)
    new SqlParameter("Promotion", p.Promotion)
    new SqlParameter("Domainname", p.Domainname)
    new SqlParameter("Agent", p.Agent) |]

let db__PLOG = db__Rcd db__pPLOG

let PLOG_wrapper item: PLOG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pPLOG_clone (p:pPLOG): pPLOG = {
    Url = p.Url
    Page = p.Page
    IP = p.IP
    Lng = p.Lng
    Lat = p.Lat
    City = p.City
    Country = p.Country
    Session = p.Session
    EndUser = p.EndUser
    App = p.App
    Loc = p.Loc
    Bind = p.Bind
    Device = p.Device
    ReferCode = p.ReferCode
    Referrer = p.Referrer
    ReferApp = p.ReferApp
    Platform = p.Platform
    Request = p.Request
    RequestHex = p.RequestHex
    Response = p.Response
    Desc = p.Desc
    InnerReferCode = p.InnerReferCode
    ReferrerUrl = p.ReferrerUrl
    PromotionType = p.PromotionType
    Promotion = p.Promotion
    Domainname = p.Domainname
    Agent = p.Agent }

let PLOG_update_transaction output (updater,suc,fail) (rcd:PLOG) =
    let rollback_p = rcd.p |> pPLOG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,PLOG_table,PLOG_sql_update,pPLOG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let PLOG_update output (rcd:PLOG) =
    rcd
    |> PLOG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let PLOG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment PLOG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,PLOG_table,pPLOG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> PLOG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let PLOG_create output p =
    PLOG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__PLOGo id: PLOG option = id__rcd(conn,PLOG_fieldorders,PLOG_table,db__PLOG) id

let PLOG_metadata = {
    fieldorders = PLOG_fieldorders
    db__rcd = db__PLOG 
    wrapper = PLOG_wrapper
    sps = pPLOG__sps
    id = PLOG_id
    id__rcdo = id__PLOGo
    clone = pPLOG_clone
    empty__p = pPLOG_empty
    rcd__bin = PLOG__bin
    bin__rcd = bin__PLOG
    sql_update = PLOG_sql_update
    rcd_update = PLOG_update
    table = PLOG_table
    shorthand = "plog" }

let PLOGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_PageLog' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_PageLog ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Url]
    ,[Page]
    ,[IP]
    ,[Lng]
    ,[Lat]
    ,[City]
    ,[Country]
    ,[Session]
    ,[EndUser]
    ,[App]
    ,[Loc]
    ,[Bind]
    ,[Device]
    ,[ReferCode]
    ,[Referrer]
    ,[ReferApp]
    ,[Platform]
    ,[Request]
    ,[RequestHex]
    ,[Response]
    ,[Desc]
    ,[InnerReferCode]
    ,[ReferrerUrl]
    ,[PromotionType]
    ,[Promotion]
    ,[Domainname]
    ,[Agent])
    END
    """


let db__pPRIVILEGE(line:Object[]): pPRIVILEGE =
    let p = pPRIVILEGE_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Caption <- string(line.[5]).TrimEnd()
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[6]) then 0 else line.[6] :?> int)
    p.Cat <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.ApiFullname <- string(line.[8]).TrimEnd()
    p.Desc <- string(line.[9]).TrimEnd()
    p.Scope <- if Convert.IsDBNull(line.[10]) then 0L else line.[10] :?> int64

    p

let pPRIVILEGE__sps (p:pPRIVILEGE) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Cat", p.Cat)
    new SqlParameter("ApiFullname", p.ApiFullname)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Scope", p.Scope) |]

let db__PRIVILEGE = db__Rcd db__pPRIVILEGE

let PRIVILEGE_wrapper item: PRIVILEGE =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pPRIVILEGE_clone (p:pPRIVILEGE): pPRIVILEGE = {
    Code = p.Code
    Caption = p.Caption
    Type = p.Type
    Cat = p.Cat
    ApiFullname = p.ApiFullname
    Desc = p.Desc
    Scope = p.Scope }

let PRIVILEGE_update_transaction output (updater,suc,fail) (rcd:PRIVILEGE) =
    let rollback_p = rcd.p |> pPRIVILEGE_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,PRIVILEGE_table,PRIVILEGE_sql_update,pPRIVILEGE__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let PRIVILEGE_update output (rcd:PRIVILEGE) =
    rcd
    |> PRIVILEGE_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let PRIVILEGE_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment PRIVILEGE_id
    let ctime = DateTime.UtcNow
    match create (conn,output,PRIVILEGE_table,pPRIVILEGE__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> PRIVILEGE_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let PRIVILEGE_create output p =
    PRIVILEGE_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__PRIVILEGEo id: PRIVILEGE option = id__rcd(conn,PRIVILEGE_fieldorders,PRIVILEGE_table,db__PRIVILEGE) id

let PRIVILEGE_metadata = {
    fieldorders = PRIVILEGE_fieldorders
    db__rcd = db__PRIVILEGE 
    wrapper = PRIVILEGE_wrapper
    sps = pPRIVILEGE__sps
    id = PRIVILEGE_id
    id__rcdo = id__PRIVILEGEo
    clone = pPRIVILEGE_clone
    empty__p = pPRIVILEGE_empty
    rcd__bin = PRIVILEGE__bin
    bin__rcd = bin__PRIVILEGE
    sql_update = PRIVILEGE_sql_update
    rcd_update = PRIVILEGE_update
    table = PRIVILEGE_table
    shorthand = "privilege" }

let PRIVILEGETxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Privilege' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Privilege ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Caption]
    ,[Type]
    ,[Cat]
    ,[ApiFullname]
    ,[Desc]
    ,[Scope])
    END
    """


let db__pPLINK(line:Object[]): pPLINK =
    let p = pPLINK_empty()

    p.Expiry <- DateTime.FromBinary(if Convert.IsDBNull(line.[4]) then DateTime.MinValue.Ticks else line.[4] :?> int64)
    p.HashFull <- string(line.[5]).TrimEnd()
    p.HashTiny <- string(line.[6]).TrimEnd()
    p.Src <- string(line.[7]).TrimEnd()
    p.Promoter <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.Biz <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64

    p

let pPLINK__sps (p:pPLINK) = [|
    new SqlParameter("Expiry", p.Expiry.Ticks)
    new SqlParameter("HashFull", p.HashFull)
    new SqlParameter("HashTiny", p.HashTiny)
    new SqlParameter("Src", p.Src)
    new SqlParameter("Promoter", p.Promoter)
    new SqlParameter("Biz", p.Biz) |]

let db__PLINK = db__Rcd db__pPLINK

let PLINK_wrapper item: PLINK =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pPLINK_clone (p:pPLINK): pPLINK = {
    Expiry = p.Expiry
    HashFull = p.HashFull
    HashTiny = p.HashTiny
    Src = p.Src
    Promoter = p.Promoter
    Biz = p.Biz }

let PLINK_update_transaction output (updater,suc,fail) (rcd:PLINK) =
    let rollback_p = rcd.p |> pPLINK_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,PLINK_table,PLINK_sql_update,pPLINK__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let PLINK_update output (rcd:PLINK) =
    rcd
    |> PLINK_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let PLINK_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment PLINK_id
    let ctime = DateTime.UtcNow
    match create (conn,output,PLINK_table,pPLINK__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> PLINK_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let PLINK_create output p =
    PLINK_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__PLINKo id: PLINK option = id__rcd(conn,PLINK_fieldorders,PLINK_table,db__PLINK) id

let PLINK_metadata = {
    fieldorders = PLINK_fieldorders
    db__rcd = db__PLINK 
    wrapper = PLINK_wrapper
    sps = pPLINK__sps
    id = PLINK_id
    id__rcdo = id__PLINKo
    clone = pPLINK_clone
    empty__p = pPLINK_empty
    rcd__bin = PLINK__bin
    bin__rcd = bin__PLINK
    sql_update = PLINK_sql_update
    rcd_update = PLINK_update
    table = PLINK_table
    shorthand = "plink" }

let PLINKTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_PromotedLink' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_PromotedLink ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Expiry]
    ,[HashFull]
    ,[HashTiny]
    ,[Src]
    ,[Promoter]
    ,[Biz])
    END
    """


let db__pROLE(line:Object[]): pROLE =
    let p = pROLE_empty()

    p.Code <- string(line.[4]).TrimEnd()
    p.Inherit <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.Caption <- string(line.[6]).TrimEnd()
    p.Cat <- EnumOfValue(if Convert.IsDBNull(line.[7]) then 0 else line.[7] :?> int)
    p.Desc <- string(line.[8]).TrimEnd()

    p

let pROLE__sps (p:pROLE) = [|
    new SqlParameter("Code", p.Code)
    new SqlParameter("Inherit", p.Inherit)
    new SqlParameter("Caption", p.Caption)
    new SqlParameter("Cat", p.Cat)
    new SqlParameter("Desc", p.Desc) |]

let db__ROLE = db__Rcd db__pROLE

let ROLE_wrapper item: ROLE =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pROLE_clone (p:pROLE): pROLE = {
    Code = p.Code
    Inherit = p.Inherit
    Caption = p.Caption
    Cat = p.Cat
    Desc = p.Desc }

let ROLE_update_transaction output (updater,suc,fail) (rcd:ROLE) =
    let rollback_p = rcd.p |> pROLE_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,ROLE_table,ROLE_sql_update,pROLE__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let ROLE_update output (rcd:ROLE) =
    rcd
    |> ROLE_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let ROLE_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment ROLE_id
    let ctime = DateTime.UtcNow
    match create (conn,output,ROLE_table,pROLE__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> ROLE_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let ROLE_create output p =
    ROLE_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__ROLEo id: ROLE option = id__rcd(conn,ROLE_fieldorders,ROLE_table,db__ROLE) id

let ROLE_metadata = {
    fieldorders = ROLE_fieldorders
    db__rcd = db__ROLE 
    wrapper = ROLE_wrapper
    sps = pROLE__sps
    id = ROLE_id
    id__rcdo = id__ROLEo
    clone = pROLE_clone
    empty__p = pROLE_empty
    rcd__bin = ROLE__bin
    bin__rcd = bin__ROLE
    sql_update = ROLE_sql_update
    rcd_update = ROLE_update
    table = ROLE_table
    shorthand = "role" }

let ROLETxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_Role' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_Role ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Code]
    ,[Inherit]
    ,[Caption]
    ,[Cat]
    ,[Desc])
    END
    """


let db__pROLEASSIGN(line:Object[]): pROLEASSIGN =
    let p = pROLEASSIGN_empty()

    p.Role <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.Type <- EnumOfValue(if Convert.IsDBNull(line.[5]) then 0 else line.[5] :?> int)
    p.Privilege <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.Workflow <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.WorkflowTransit <- if Convert.IsDBNull(line.[8]) then 0L else line.[8] :?> int64
    p.WorkflowState <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.Desc <- string(line.[10]).TrimEnd()
    p.Profile <- string(line.[11]).TrimEnd()

    p

let pROLEASSIGN__sps (p:pROLEASSIGN) = [|
    new SqlParameter("Role", p.Role)
    new SqlParameter("Type", p.Type)
    new SqlParameter("Privilege", p.Privilege)
    new SqlParameter("Workflow", p.Workflow)
    new SqlParameter("WorkflowTransit", p.WorkflowTransit)
    new SqlParameter("WorkflowState", p.WorkflowState)
    new SqlParameter("Desc", p.Desc)
    new SqlParameter("Profile", p.Profile) |]

let db__ROLEASSIGN = db__Rcd db__pROLEASSIGN

let ROLEASSIGN_wrapper item: ROLEASSIGN =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pROLEASSIGN_clone (p:pROLEASSIGN): pROLEASSIGN = {
    Role = p.Role
    Type = p.Type
    Privilege = p.Privilege
    Workflow = p.Workflow
    WorkflowTransit = p.WorkflowTransit
    WorkflowState = p.WorkflowState
    Desc = p.Desc
    Profile = p.Profile }

let ROLEASSIGN_update_transaction output (updater,suc,fail) (rcd:ROLEASSIGN) =
    let rollback_p = rcd.p |> pROLEASSIGN_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,ROLEASSIGN_table,ROLEASSIGN_sql_update,pROLEASSIGN__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let ROLEASSIGN_update output (rcd:ROLEASSIGN) =
    rcd
    |> ROLEASSIGN_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let ROLEASSIGN_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment ROLEASSIGN_id
    let ctime = DateTime.UtcNow
    match create (conn,output,ROLEASSIGN_table,pROLEASSIGN__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> ROLEASSIGN_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let ROLEASSIGN_create output p =
    ROLEASSIGN_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__ROLEASSIGNo id: ROLEASSIGN option = id__rcd(conn,ROLEASSIGN_fieldorders,ROLEASSIGN_table,db__ROLEASSIGN) id

let ROLEASSIGN_metadata = {
    fieldorders = ROLEASSIGN_fieldorders
    db__rcd = db__ROLEASSIGN 
    wrapper = ROLEASSIGN_wrapper
    sps = pROLEASSIGN__sps
    id = ROLEASSIGN_id
    id__rcdo = id__ROLEASSIGNo
    clone = pROLEASSIGN_clone
    empty__p = pROLEASSIGN_empty
    rcd__bin = ROLEASSIGN__bin
    bin__rcd = bin__ROLEASSIGN
    sql_update = ROLEASSIGN_sql_update
    rcd_update = ROLEASSIGN_update
    table = ROLEASSIGN_table
    shorthand = "roleassign" }

let ROLEASSIGNTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_RoleAssign' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_RoleAssign ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[Role]
    ,[Type]
    ,[Privilege]
    ,[Workflow]
    ,[WorkflowTransit]
    ,[WorkflowState]
    ,[Desc]
    ,[Profile])
    END
    """


let db__pSLOG(line:Object[]): pSLOG =
    let p = pSLOG_empty()

    p.EU <- if Convert.IsDBNull(line.[4]) then 0L else line.[4] :?> int64
    p.IP <- string(line.[5]).TrimEnd()
    p.Lng <- if Convert.IsDBNull(line.[6]) then 0.0 else line.[6] :?> float
    p.Lat <- if Convert.IsDBNull(line.[7]) then 0.0 else line.[7] :?> float
    p.City <- string(line.[8]).TrimEnd()
    p.Country <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.CookieIn <- string(line.[10]).TrimEnd()
    p.CookieOut <- string(line.[11]).TrimEnd()
    p.Agent <- EnumOfValue(if Convert.IsDBNull(line.[12]) then 0 else line.[12] :?> int)
    p.Act <- EnumOfValue(if Convert.IsDBNull(line.[13]) then 0 else line.[13] :?> int)
    p.WebCrential <- if Convert.IsDBNull(line.[14]) then 0L else line.[14] :?> int64
    p.Biz <- if Convert.IsDBNull(line.[15]) then 0L else line.[15] :?> int64
    p.SessionCount <- if Convert.IsDBNull(line.[16]) then 0L else line.[16] :?> int64
    p.Desc <- string(line.[17]).TrimEnd()

    p

let pSLOG__sps (p:pSLOG) = [|
    new SqlParameter("EU", p.EU)
    new SqlParameter("IP", p.IP)
    new SqlParameter("Lng", p.Lng)
    new SqlParameter("Lat", p.Lat)
    new SqlParameter("City", p.City)
    new SqlParameter("Country", p.Country)
    new SqlParameter("CookieIn", p.CookieIn)
    new SqlParameter("CookieOut", p.CookieOut)
    new SqlParameter("Agent", p.Agent)
    new SqlParameter("Act", p.Act)
    new SqlParameter("WebCrential", p.WebCrential)
    new SqlParameter("Biz", p.Biz)
    new SqlParameter("SessionCount", p.SessionCount)
    new SqlParameter("Desc", p.Desc) |]

let db__SLOG = db__Rcd db__pSLOG

let SLOG_wrapper item: SLOG =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pSLOG_clone (p:pSLOG): pSLOG = {
    EU = p.EU
    IP = p.IP
    Lng = p.Lng
    Lat = p.Lat
    City = p.City
    Country = p.Country
    CookieIn = p.CookieIn
    CookieOut = p.CookieOut
    Agent = p.Agent
    Act = p.Act
    WebCrential = p.WebCrential
    Biz = p.Biz
    SessionCount = p.SessionCount
    Desc = p.Desc }

let SLOG_update_transaction output (updater,suc,fail) (rcd:SLOG) =
    let rollback_p = rcd.p |> pSLOG_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,SLOG_table,SLOG_sql_update,pSLOG__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let SLOG_update output (rcd:SLOG) =
    rcd
    |> SLOG_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let SLOG_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment SLOG_id
    let ctime = DateTime.UtcNow
    match create (conn,output,SLOG_table,pSLOG__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> SLOG_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let SLOG_create output p =
    SLOG_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__SLOGo id: SLOG option = id__rcd(conn,SLOG_fieldorders,SLOG_table,db__SLOG) id

let SLOG_metadata = {
    fieldorders = SLOG_fieldorders
    db__rcd = db__SLOG 
    wrapper = SLOG_wrapper
    sps = pSLOG__sps
    id = SLOG_id
    id__rcdo = id__SLOGo
    clone = pSLOG_clone
    empty__p = pSLOG_empty
    rcd__bin = SLOG__bin
    bin__rcd = bin__SLOG
    sql_update = SLOG_sql_update
    rcd_update = SLOG_update
    table = SLOG_table
    shorthand = "slog" }

let SLOGTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_SignLog' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_SignLog ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[EU]
    ,[IP]
    ,[Lng]
    ,[Lat]
    ,[City]
    ,[Country]
    ,[CookieIn]
    ,[CookieOut]
    ,[Agent]
    ,[Act]
    ,[WebCrential]
    ,[Biz]
    ,[SessionCount]
    ,[Desc])
    END
    """


let db__pLINKTRACK(line:Object[]): pLINKTRACK =
    let p = pLINKTRACK_empty()

    p.App <- string(line.[4]).TrimEnd()
    p.Biz <- if Convert.IsDBNull(line.[5]) then 0L else line.[5] :?> int64
    p.EndUser <- if Convert.IsDBNull(line.[6]) then 0L else line.[6] :?> int64
    p.Bind <- if Convert.IsDBNull(line.[7]) then 0L else line.[7] :?> int64
    p.BindType <- EnumOfValue(if Convert.IsDBNull(line.[8]) then 0 else line.[8] :?> int)
    p.Visitor <- if Convert.IsDBNull(line.[9]) then 0L else line.[9] :?> int64
    p.VisitorApp <- string(line.[10]).TrimEnd()
    p.ShortLink <- string(line.[11]).TrimEnd()
    p.ReferrerUrl <- string(line.[12]).TrimEnd()
    p.InnerRefCode <- string(line.[13]).TrimEnd()
    p.PromotionType <- string(line.[14]).TrimEnd()
    p.Promotion <- string(line.[15]).TrimEnd()

    p

let pLINKTRACK__sps (p:pLINKTRACK) = [|
    new SqlParameter("App", p.App)
    new SqlParameter("Biz", p.Biz)
    new SqlParameter("EndUser", p.EndUser)
    new SqlParameter("Bind", p.Bind)
    new SqlParameter("BindType", p.BindType)
    new SqlParameter("Visitor", p.Visitor)
    new SqlParameter("VisitorApp", p.VisitorApp)
    new SqlParameter("ShortLink", p.ShortLink)
    new SqlParameter("ReferrerUrl", p.ReferrerUrl)
    new SqlParameter("InnerRefCode", p.InnerRefCode)
    new SqlParameter("PromotionType", p.PromotionType)
    new SqlParameter("Promotion", p.Promotion) |]

let db__LINKTRACK = db__Rcd db__pLINKTRACK

let LINKTRACK_wrapper item: LINKTRACK =
    let (i,c,u,s),p = item
    { ID = i; Createdat = c; Updatedat = u; Sort = s; p = p }

let pLINKTRACK_clone (p:pLINKTRACK): pLINKTRACK = {
    App = p.App
    Biz = p.Biz
    EndUser = p.EndUser
    Bind = p.Bind
    BindType = p.BindType
    Visitor = p.Visitor
    VisitorApp = p.VisitorApp
    ShortLink = p.ShortLink
    ReferrerUrl = p.ReferrerUrl
    InnerRefCode = p.InnerRefCode
    PromotionType = p.PromotionType
    Promotion = p.Promotion }

let LINKTRACK_update_transaction output (updater,suc,fail) (rcd:LINKTRACK) =
    let rollback_p = rcd.p |> pLINKTRACK_clone
    let rollback_updatedat = rcd.Updatedat
    updater rcd.p
    let ctime,res =
        (rcd.ID,rcd.p,rollback_p,rollback_updatedat)
        |> update (conn,output,LINKTRACK_table,LINKTRACK_sql_update,pLINKTRACK__sps,suc,fail)
    match res with
    | Suc ctx ->
        rcd.Updatedat <- ctime
        suc(ctime,ctx)
    | Fail(eso,ctx) ->
        rcd.p <- rollback_p
        rcd.Updatedat <- rollback_updatedat
        fail eso

let LINKTRACK_update output (rcd:LINKTRACK) =
    rcd
    |> LINKTRACK_update_transaction output ((fun p -> ()),(fun (ctime,ctx) -> ()),(fun dte -> ()))

let LINKTRACK_create_incremental_transaction output (suc,fail) p =
    let cid = Interlocked.Increment LINKTRACK_id
    let ctime = DateTime.UtcNow
    match create (conn,output,LINKTRACK_table,pLINKTRACK__sps) (cid,ctime,p) with
    | Suc ctx -> ((cid,ctime,ctime,cid),p) |> LINKTRACK_wrapper |> suc
    | Fail(eso,ctx) -> fail(eso,ctx)

let LINKTRACK_create output p =
    LINKTRACK_create_incremental_transaction output ((fun rcd -> ()),(fun (eso,ctx) -> ())) p
    

let id__LINKTRACKo id: LINKTRACK option = id__rcd(conn,LINKTRACK_fieldorders,LINKTRACK_table,db__LINKTRACK) id

let LINKTRACK_metadata = {
    fieldorders = LINKTRACK_fieldorders
    db__rcd = db__LINKTRACK 
    wrapper = LINKTRACK_wrapper
    sps = pLINKTRACK__sps
    id = LINKTRACK_id
    id__rcdo = id__LINKTRACKo
    clone = pLINKTRACK_clone
    empty__p = pLINKTRACK_empty
    rcd__bin = LINKTRACK__bin
    bin__rcd = bin__LINKTRACK
    sql_update = LINKTRACK_sql_update
    rcd_update = LINKTRACK_update
    table = LINKTRACK_table
    shorthand = "linktrack" }

let LINKTRACKTxSqlServer =
    """
    IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name]='Sys_TinyLinkTracking' AND xtype='U')
    BEGIN

        CREATE TABLE Sys_TinyLinkTracking ([ID] BIGINT NOT NULL
    ,[Createdat] BIGINT NOT NULL
    ,[Updatedat] BIGINT NOT NULL
    ,[Sort] BIGINT NOT NULL,
    ,[App]
    ,[Biz]
    ,[EndUser]
    ,[Bind]
    ,[BindType]
    ,[Visitor]
    ,[VisitorApp]
    ,[ShortLink]
    ,[ReferrerUrl]
    ,[InnerRefCode]
    ,[PromotionType]
    ,[Promotion])
    END
    """


type MetadataEnum = 
| ADDRESS = 0
| BIZ = 1
| CRY = 2
| CUR = 3
| EU = 4
| FILE = 5
| FOLDER = 6
| LANG = 7
| CWC = 8
| APILOG = 9
| AUTH = 10
| CONFIG = 11
| EUSESS = 12
| EUTOK = 13
| LOG = 14
| NOTIFICATION = 15
| PLOG = 16
| PRIVILEGE = 17
| PLINK = 18
| ROLE = 19
| ROLEASSIGN = 20
| SLOG = 21
| LINKTRACK = 22

let tablenames = [|
    ADDRESS_metadata.table
    BIZ_metadata.table
    CRY_metadata.table
    CUR_metadata.table
    EU_metadata.table
    FILE_metadata.table
    FOLDER_metadata.table
    LANG_metadata.table
    CWC_metadata.table
    APILOG_metadata.table
    AUTH_metadata.table
    CONFIG_metadata.table
    EUSESS_metadata.table
    EUTOK_metadata.table
    LOG_metadata.table
    NOTIFICATION_metadata.table
    PLOG_metadata.table
    PRIVILEGE_metadata.table
    PLINK_metadata.table
    ROLE_metadata.table
    ROLEASSIGN_metadata.table
    SLOG_metadata.table
    LINKTRACK_metadata.table |]

let init() =

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Address]") with
    | Some v ->
        let max = v :?> int64
        if max > ADDRESS_id.Value then
            ADDRESS_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Address]") with
    | Some v -> ADDRESS_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Biz]") with
    | Some v ->
        let max = v :?> int64
        if max > BIZ_id.Value then
            BIZ_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Biz]") with
    | Some v -> BIZ_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Country]") with
    | Some v ->
        let max = v :?> int64
        if max > CRY_id.Value then
            CRY_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Country]") with
    | Some v -> CRY_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Cur]") with
    | Some v ->
        let max = v :?> int64
        if max > CUR_id.Value then
            CUR_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Cur]") with
    | Some v -> CUR_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_EndUser]") with
    | Some v ->
        let max = v :?> int64
        if max > EU_id.Value then
            EU_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_EndUser]") with
    | Some v -> EU_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_File]") with
    | Some v ->
        let max = v :?> int64
        if max > FILE_id.Value then
            FILE_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_File]") with
    | Some v -> FILE_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Folder]") with
    | Some v ->
        let max = v :?> int64
        if max > FOLDER_id.Value then
            FOLDER_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Folder]") with
    | Some v -> FOLDER_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_Lang]") with
    | Some v ->
        let max = v :?> int64
        if max > LANG_id.Value then
            LANG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_Lang]") with
    | Some v -> LANG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Ca_WebCredential]") with
    | Some v ->
        let max = v :?> int64
        if max > CWC_id.Value then
            CWC_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Ca_WebCredential]") with
    | Some v -> CWC_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_ApiLog]") with
    | Some v ->
        let max = v :?> int64
        if max > APILOG_id.Value then
            APILOG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_ApiLog]") with
    | Some v -> APILOG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Authorization]") with
    | Some v ->
        let max = v :?> int64
        if max > AUTH_id.Value then
            AUTH_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Authorization]") with
    | Some v -> AUTH_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Config]") with
    | Some v ->
        let max = v :?> int64
        if max > CONFIG_id.Value then
            CONFIG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Config]") with
    | Some v -> CONFIG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_EuSession]") with
    | Some v ->
        let max = v :?> int64
        if max > EUSESS_id.Value then
            EUSESS_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_EuSession]") with
    | Some v -> EUSESS_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_EuToken]") with
    | Some v ->
        let max = v :?> int64
        if max > EUTOK_id.Value then
            EUTOK_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_EuToken]") with
    | Some v -> EUTOK_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Log]") with
    | Some v ->
        let max = v :?> int64
        if max > LOG_id.Value then
            LOG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Log]") with
    | Some v -> LOG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Notification]") with
    | Some v ->
        let max = v :?> int64
        if max > NOTIFICATION_id.Value then
            NOTIFICATION_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Notification]") with
    | Some v -> NOTIFICATION_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_PageLog]") with
    | Some v ->
        let max = v :?> int64
        if max > PLOG_id.Value then
            PLOG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_PageLog]") with
    | Some v -> PLOG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Privilege]") with
    | Some v ->
        let max = v :?> int64
        if max > PRIVILEGE_id.Value then
            PRIVILEGE_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Privilege]") with
    | Some v -> PRIVILEGE_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_PromotedLink]") with
    | Some v ->
        let max = v :?> int64
        if max > PLINK_id.Value then
            PLINK_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_PromotedLink]") with
    | Some v -> PLINK_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_Role]") with
    | Some v ->
        let max = v :?> int64
        if max > ROLE_id.Value then
            ROLE_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_Role]") with
    | Some v -> ROLE_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_RoleAssign]") with
    | Some v ->
        let max = v :?> int64
        if max > ROLEASSIGN_id.Value then
            ROLEASSIGN_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_RoleAssign]") with
    | Some v -> ROLEASSIGN_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_SignLog]") with
    | Some v ->
        let max = v :?> int64
        if max > SLOG_id.Value then
            SLOG_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_SignLog]") with
    | Some v -> SLOG_count.Value <- v :?> int32
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT MAX(ID) FROM [Sys_TinyLinkTracking]") with
    | Some v ->
        let max = v :?> int64
        if max > LINKTRACK_id.Value then
            LINKTRACK_id.Value <- max
    | None -> ()

    match singlevalue_query conn (str__sql "SELECT COUNT(ID) FROM [Sys_TinyLinkTracking]") with
    | Some v -> LINKTRACK_count.Value <- v :?> int32
    | None -> ()
    ()