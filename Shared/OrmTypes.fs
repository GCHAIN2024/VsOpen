module Shared.OrmTypes

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

// [Ca_Address] (ADDRESS)

type addressTypeEnum = 
| Default = 0 // 默认
| Biz = 1 // 机构
| EndUser = 2 // 用户

let addressTypeEnums = [| addressTypeEnum.Default; addressTypeEnum.Biz; addressTypeEnum.EndUser |]
let addressTypeEnumstrs = [| "addressTypeEnum"; "addressTypeEnum"; "addressTypeEnum" |]
let addressTypeNum = 3

let int__addressTypeEnum v =
    match v with
    | 0 -> Some addressTypeEnum.Default
    | 1 -> Some addressTypeEnum.Biz
    | 2 -> Some addressTypeEnum.EndUser
    | _ -> None

let str__addressTypeEnum s =
    match s with
    | "Default" -> Some addressTypeEnum.Default
    | "Biz" -> Some addressTypeEnum.Biz
    | "EndUser" -> Some addressTypeEnum.EndUser
    | _ -> None

let addressTypeEnum__caption e =
    match e with
    | addressTypeEnum.Default -> "默认"
    | addressTypeEnum.Biz -> "机构"
    | addressTypeEnum.EndUser -> "用户"
    | _ -> ""

type pADDRESS = {
mutable Caption: Caption
mutable Bind: Integer
mutable Type: addressTypeEnum
mutable Line1: Chars
mutable Line2: Chars
mutable State: Chars
mutable County: Chars
mutable Town: Chars
mutable Contact: Chars
mutable Tel: Chars
mutable Email: Chars
mutable Zip: Chars
mutable City: FK
mutable Country: FK
mutable Remarks: Text}


type ADDRESS = Rcd<pADDRESS>

let ADDRESS_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Bind],[Type],[Line1],[Line2],[State],[County],[Town],[Contact],[Tel],[Email],[Zip],[City],[Country],[Remarks]"

let pADDRESS_fieldordersArray = [|
    "Caption"
    "Bind"
    "Type"
    "Line1"
    "Line2"
    "State"
    "County"
    "Town"
    "Contact"
    "Tel"
    "Email"
    "Zip"
    "City"
    "Country"
    "Remarks" |]

let ADDRESS_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Bind]=@Bind,[Type]=@Type,[Line1]=@Line1,[Line2]=@Line2,[State]=@State,[County]=@County,[Town]=@Town,[Contact]=@Contact,[Tel]=@Tel,[Email]=@Email,[Zip]=@Zip,[City]=@City,[Country]=@Country,[Remarks]=@Remarks"

let pADDRESS_fields = [|
    Caption("Caption", 256)
    Integer("Bind")
    SelectLines("Type", [| ("Default","默认");("Biz","机构");("EndUser","用户") |])
    Chars("Line1", 300)
    Chars("Line2", 300)
    Chars("State", 16)
    Chars("County", 16)
    Chars("Town", 16)
    Chars("Contact", 64)
    Chars("Tel", 20)
    Chars("Email", 256)
    Chars("Zip", 16)
    FK("City")
    FK("Country")
    Text("Remarks") |]

let pADDRESS_empty(): pADDRESS = {
    Caption = ""
    Bind = 0L
    Type = EnumOfValue 0
    Line1 = ""
    Line2 = ""
    State = ""
    County = ""
    Town = ""
    Contact = ""
    Tel = ""
    Email = ""
    Zip = ""
    City = 0L
    Country = 0L
    Remarks = "" }

let ADDRESS_id = ref 0L
let ADDRESS_count = ref 0
let ADDRESS_table = "Ca_Address"

// [Ca_Biz] (BIZ)

type pBIZ = {
mutable Code: Chars
mutable Caption: Caption
mutable Parent: FK
mutable BasicAcct: FK
mutable Desc: Text
mutable Website: Link
mutable Icon: Link
mutable City: FK
mutable Country: FK
mutable Lang: FK
mutable IsSocial: Boolean
mutable IsCmsSource: Boolean
mutable IsPay: Boolean
mutable MomentLatest: FK
mutable CountFollowers: Integer
mutable CountFollows: Integer
mutable CountMoments: Integer
mutable CountViews: Integer
mutable CountComments: Integer
mutable CountThumbUps: Integer
mutable CountThumbDns: Integer
mutable IsCrawling: Boolean
mutable IsGSeries: Boolean
mutable RemarksCentral: Text
mutable Agent: FK
mutable SiteCats: Text
mutable ConfiguredCats: Text}


type BIZ = Rcd<pBIZ>

let BIZ_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Caption],[Parent],[BasicAcct],[Desc],[Website],[Icon],[City],[Country],[Lang],[IsSocial],[IsCmsSource],[IsPay],[MomentLatest],[CountFollowers],[CountFollows],[CountMoments],[CountViews],[CountComments],[CountThumbUps],[CountThumbDns],[IsCrawling],[IsGSeries],[RemarksCentral],[Agent],[SiteCats],[ConfiguredCats]"

let pBIZ_fieldordersArray = [|
    "Code"
    "Caption"
    "Parent"
    "BasicAcct"
    "Desc"
    "Website"
    "Icon"
    "City"
    "Country"
    "Lang"
    "IsSocial"
    "IsCmsSource"
    "IsPay"
    "MomentLatest"
    "CountFollowers"
    "CountFollows"
    "CountMoments"
    "CountViews"
    "CountComments"
    "CountThumbUps"
    "CountThumbDns"
    "IsCrawling"
    "IsGSeries"
    "RemarksCentral"
    "Agent"
    "SiteCats"
    "ConfiguredCats" |]

let BIZ_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Caption]=@Caption,[Parent]=@Parent,[BasicAcct]=@BasicAcct,[Desc]=@Desc,[Website]=@Website,[Icon]=@Icon,[City]=@City,[Country]=@Country,[Lang]=@Lang,[IsSocial]=@IsSocial,[IsCmsSource]=@IsCmsSource,[IsPay]=@IsPay,[MomentLatest]=@MomentLatest,[CountFollowers]=@CountFollowers,[CountFollows]=@CountFollows,[CountMoments]=@CountMoments,[CountViews]=@CountViews,[CountComments]=@CountComments,[CountThumbUps]=@CountThumbUps,[CountThumbDns]=@CountThumbDns,[IsCrawling]=@IsCrawling,[IsGSeries]=@IsGSeries,[RemarksCentral]=@RemarksCentral,[Agent]=@Agent,[SiteCats]=@SiteCats,[ConfiguredCats]=@ConfiguredCats"

let pBIZ_fields = [|
    Chars("Code", 256)
    Caption("Caption", 256)
    FK("Parent")
    FK("BasicAcct")
    Text("Desc")
    Link("Website", 256)
    Link("Icon", 256)
    FK("City")
    FK("Country")
    FK("Lang")
    Boolean("IsSocial")
    Boolean("IsCmsSource")
    Boolean("IsPay")
    FK("MomentLatest")
    Integer("CountFollowers")
    Integer("CountFollows")
    Integer("CountMoments")
    Integer("CountViews")
    Integer("CountComments")
    Integer("CountThumbUps")
    Integer("CountThumbDns")
    Boolean("IsCrawling")
    Boolean("IsGSeries")
    Text("RemarksCentral")
    FK("Agent")
    Text("SiteCats")
    Text("ConfiguredCats") |]

let pBIZ_empty(): pBIZ = {
    Code = ""
    Caption = ""
    Parent = 0L
    BasicAcct = 0L
    Desc = ""
    Website = ""
    Icon = ""
    City = 0L
    Country = 0L
    Lang = 0L
    IsSocial = true
    IsCmsSource = true
    IsPay = true
    MomentLatest = 0L
    CountFollowers = 0L
    CountFollows = 0L
    CountMoments = 0L
    CountViews = 0L
    CountComments = 0L
    CountThumbUps = 0L
    CountThumbDns = 0L
    IsCrawling = true
    IsGSeries = true
    RemarksCentral = ""
    Agent = 0L
    SiteCats = ""
    ConfiguredCats = "" }

let BIZ_id = ref 75865464L
let BIZ_count = ref 0
let BIZ_table = "Ca_Biz"

// [Ca_Country] (CRY)

type pCRY = {
mutable Code2: Chars
mutable Caption: Chars
mutable Fullname: Chars
mutable Icon: Link
mutable Tel: Chars
mutable Cur: FK
mutable Capital: FK
mutable Place: FK
mutable Lang: FK}


type CRY = Rcd<pCRY>

let CRY_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code2],[Caption],[Fullname],[Icon],[Tel],[Cur],[Capital],[Place],[Lang]"

let pCRY_fieldordersArray = [|
    "Code2"
    "Caption"
    "Fullname"
    "Icon"
    "Tel"
    "Cur"
    "Capital"
    "Place"
    "Lang" |]

let CRY_sql_update = "[Updatedat]=@Updatedat,[Code2]=@Code2,[Caption]=@Caption,[Fullname]=@Fullname,[Icon]=@Icon,[Tel]=@Tel,[Cur]=@Cur,[Capital]=@Capital,[Place]=@Place,[Lang]=@Lang"

let pCRY_fields = [|
    Chars("Code2", 2)
    Chars("Caption", 64)
    Chars("Fullname", 256)
    Link("Icon", 256)
    Chars("Tel", 4)
    FK("Cur")
    FK("Capital")
    FK("Place")
    FK("Lang") |]

let pCRY_empty(): pCRY = {
    Code2 = ""
    Caption = ""
    Fullname = ""
    Icon = ""
    Tel = ""
    Cur = 0L
    Capital = 0L
    Place = 0L
    Lang = 0L }

let CRY_id = ref 1001L
let CRY_count = ref 0
let CRY_table = "Ca_Country"

// [Ca_Cur] (CUR)

type curCurTypeEnum = 
| Legal = 0 // 法币
| Crypto = 1 // 数字币

let curCurTypeEnums = [| curCurTypeEnum.Legal; curCurTypeEnum.Crypto |]
let curCurTypeEnumstrs = [| "curCurTypeEnum"; "curCurTypeEnum" |]
let curCurTypeNum = 2

let int__curCurTypeEnum v =
    match v with
    | 0 -> Some curCurTypeEnum.Legal
    | 1 -> Some curCurTypeEnum.Crypto
    | _ -> None

let str__curCurTypeEnum s =
    match s with
    | "Legal" -> Some curCurTypeEnum.Legal
    | "Crypto" -> Some curCurTypeEnum.Crypto
    | _ -> None

let curCurTypeEnum__caption e =
    match e with
    | curCurTypeEnum.Legal -> "法币"
    | curCurTypeEnum.Crypto -> "数字币"
    | _ -> ""

type pCUR = {
mutable Code: Chars
mutable Caption: Caption
mutable Hidden: Boolean
mutable IsSac: Boolean
mutable IsTransfer: Boolean
mutable IsCash: Boolean
mutable EnableReward: Boolean
mutable EnableOTC: Boolean
mutable Icon: Link
mutable CurType: curCurTypeEnum
mutable Dec: Integer
mutable AnchorRate: Float
mutable Freezable: Boolean
mutable Authorizable: Boolean
mutable ChaninID: Chars
mutable ChaninName: Chars
mutable ContractAddress: Chars
mutable WalletAddress: Chars
mutable BaseRate: Float}


type CUR = Rcd<pCUR>

let CUR_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Caption],[Hidden],[IsSac],[IsTransfer],[IsCash],[EnableReward],[EnableOTC],[Icon],[CurType],[Dec],[AnchorRate],[Freezable],[Authorizable],[ChaninID],[ChaninName],[ContractAddress],[WalletAddress],[BaseRate]"

let pCUR_fieldordersArray = [|
    "Code"
    "Caption"
    "Hidden"
    "IsSac"
    "IsTransfer"
    "IsCash"
    "EnableReward"
    "EnableOTC"
    "Icon"
    "CurType"
    "Dec"
    "AnchorRate"
    "Freezable"
    "Authorizable"
    "ChaninID"
    "ChaninName"
    "ContractAddress"
    "WalletAddress"
    "BaseRate" |]

let CUR_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Caption]=@Caption,[Hidden]=@Hidden,[IsSac]=@IsSac,[IsTransfer]=@IsTransfer,[IsCash]=@IsCash,[EnableReward]=@EnableReward,[EnableOTC]=@EnableOTC,[Icon]=@Icon,[CurType]=@CurType,[Dec]=@Dec,[AnchorRate]=@AnchorRate,[Freezable]=@Freezable,[Authorizable]=@Authorizable,[ChaninID]=@ChaninID,[ChaninName]=@ChaninName,[ContractAddress]=@ContractAddress,[WalletAddress]=@WalletAddress,[BaseRate]=@BaseRate"

let pCUR_fields = [|
    Chars("Code", 16)
    Caption("Caption", 64)
    Boolean("Hidden")
    Boolean("IsSac")
    Boolean("IsTransfer")
    Boolean("IsCash")
    Boolean("EnableReward")
    Boolean("EnableOTC")
    Link("Icon", 512)
    SelectLines("CurType", [| ("Legal","法币");("Crypto","数字币") |])
    Integer("Dec")
    Float("AnchorRate")
    Boolean("Freezable")
    Boolean("Authorizable")
    Chars("ChaninID", 256)
    Chars("ChaninName", 256)
    Chars("ContractAddress", 256)
    Chars("WalletAddress", 256)
    Float("BaseRate") |]

let pCUR_empty(): pCUR = {
    Code = ""
    Caption = ""
    Hidden = true
    IsSac = true
    IsTransfer = true
    IsCash = true
    EnableReward = true
    EnableOTC = true
    Icon = ""
    CurType = EnumOfValue 0
    Dec = 0L
    AnchorRate = 0.0
    Freezable = true
    Authorizable = true
    ChaninID = ""
    ChaninName = ""
    ContractAddress = ""
    WalletAddress = ""
    BaseRate = 0.0 }

let CUR_id = ref 1001L
let CUR_count = ref 0
let CUR_table = "Ca_Cur"

// [Ca_EndUser] (EU)

type euGenderEnum = 
| Unknown = 0 // 未知
| Male = 1 // 男
| Female = 2 // 女

let euGenderEnums = [| euGenderEnum.Unknown; euGenderEnum.Male; euGenderEnum.Female |]
let euGenderEnumstrs = [| "euGenderEnum"; "euGenderEnum"; "euGenderEnum" |]
let euGenderNum = 3

let int__euGenderEnum v =
    match v with
    | 0 -> Some euGenderEnum.Unknown
    | 1 -> Some euGenderEnum.Male
    | 2 -> Some euGenderEnum.Female
    | _ -> None

let str__euGenderEnum s =
    match s with
    | "Unknown" -> Some euGenderEnum.Unknown
    | "Male" -> Some euGenderEnum.Male
    | "Female" -> Some euGenderEnum.Female
    | _ -> None

let euGenderEnum__caption e =
    match e with
    | euGenderEnum.Unknown -> "未知"
    | euGenderEnum.Male -> "男"
    | euGenderEnum.Female -> "女"
    | _ -> ""

type euStatusEnum = 
| Normal = 0 // 正常
| Frozen = 1 // 冻结
| Terminated = 2 // 注销

let euStatusEnums = [| euStatusEnum.Normal; euStatusEnum.Frozen; euStatusEnum.Terminated |]
let euStatusEnumstrs = [| "euStatusEnum"; "euStatusEnum"; "euStatusEnum" |]
let euStatusNum = 3

let int__euStatusEnum v =
    match v with
    | 0 -> Some euStatusEnum.Normal
    | 1 -> Some euStatusEnum.Frozen
    | 2 -> Some euStatusEnum.Terminated
    | _ -> None

let str__euStatusEnum s =
    match s with
    | "Normal" -> Some euStatusEnum.Normal
    | "Frozen" -> Some euStatusEnum.Frozen
    | "Terminated" -> Some euStatusEnum.Terminated
    | _ -> None

let euStatusEnum__caption e =
    match e with
    | euStatusEnum.Normal -> "正常"
    | euStatusEnum.Frozen -> "冻结"
    | euStatusEnum.Terminated -> "注销"
    | _ -> ""

type euAdminEnum = 
| None = 0 // 无
| Admin = 1 // 管理员

let euAdminEnums = [| euAdminEnum.None; euAdminEnum.Admin |]
let euAdminEnumstrs = [| "euAdminEnum"; "euAdminEnum" |]
let euAdminNum = 2

let int__euAdminEnum v =
    match v with
    | 0 -> Some euAdminEnum.None
    | 1 -> Some euAdminEnum.Admin
    | _ -> None

let str__euAdminEnum s =
    match s with
    | "None" -> Some euAdminEnum.None
    | "Admin" -> Some euAdminEnum.Admin
    | _ -> None

let euAdminEnum__caption e =
    match e with
    | euAdminEnum.None -> "无"
    | euAdminEnum.Admin -> "管理员"
    | _ -> ""

type euVerifyEnum = 
| Normal = 0 // 常规
| Verified = 1 // 认证

let euVerifyEnums = [| euVerifyEnum.Normal; euVerifyEnum.Verified |]
let euVerifyEnumstrs = [| "euVerifyEnum"; "euVerifyEnum" |]
let euVerifyNum = 2

let int__euVerifyEnum v =
    match v with
    | 0 -> Some euVerifyEnum.Normal
    | 1 -> Some euVerifyEnum.Verified
    | _ -> None

let str__euVerifyEnum s =
    match s with
    | "Normal" -> Some euVerifyEnum.Normal
    | "Verified" -> Some euVerifyEnum.Verified
    | _ -> None

let euVerifyEnum__caption e =
    match e with
    | euVerifyEnum.Normal -> "常规"
    | euVerifyEnum.Verified -> "认证"
    | _ -> ""

type euAgentableEnum = 
| No = 0 // 否
| Yes = 1 // 可

let euAgentableEnums = [| euAgentableEnum.No; euAgentableEnum.Yes |]
let euAgentableEnumstrs = [| "euAgentableEnum"; "euAgentableEnum" |]
let euAgentableNum = 2

let int__euAgentableEnum v =
    match v with
    | 0 -> Some euAgentableEnum.No
    | 1 -> Some euAgentableEnum.Yes
    | _ -> None

let str__euAgentableEnum s =
    match s with
    | "No" -> Some euAgentableEnum.No
    | "Yes" -> Some euAgentableEnum.Yes
    | _ -> None

let euAgentableEnum__caption e =
    match e with
    | euAgentableEnum.No -> "否"
    | euAgentableEnum.Yes -> "可"
    | _ -> ""

type pEU = {
mutable Caption: Caption
mutable Username: Caption
mutable Email: Chars
mutable Tel: Chars
mutable Gender: euGenderEnum
mutable Status: euStatusEnum
mutable Admin: euAdminEnum
mutable Privilege: Integer
mutable Verify: euVerifyEnum
mutable Pwd: Chars
mutable Online: Boolean
mutable Icon: Link
mutable Background: Link
mutable BasicAcct: FK
mutable Citizen: FK
mutable Refer: Caption
mutable Referer: FK
mutable Discord: Caption
mutable DiscordId: Integer
mutable Google: Caption
mutable GoogleId: Integer
mutable Apple: Caption
mutable AppleId: Integer
mutable OAuthProvider: Caption
mutable OAuthID: Caption
mutable GTV: Caption
mutable Gettr: Caption
mutable Farm: FK
mutable CountFollows: Integer
mutable CountFollowers: Integer
mutable CountMoments: Integer
mutable CountViews: Integer
mutable CountComments: Integer
mutable CountThumbUps: Integer
mutable CountThumbDns: Integer
mutable Lang: FK
mutable BizOperator: FK
mutable Url: Text
mutable About: Text
mutable PublicPoints: Integer
mutable Json: Text
mutable Agentable: euAgentableEnum}


type EU = Rcd<pEU>

let EU_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Username],[Email],[Tel],[Gender],[Status],[Admin],[Privilege],[Verify],[Pwd],[Online],[Icon],[Background],[BasicAcct],[Citizen],[Refer],[Referer],[Discord],[DiscordId],[Google],[GoogleId],[Apple],[AppleId],[OAuthProvider],[OAuthID],[GTV],[Gettr],[Farm],[CountFollows],[CountFollowers],[CountMoments],[CountViews],[CountComments],[CountThumbUps],[CountThumbDns],[Lang],[BizOperator],[Url],[About],[PublicPoints],[Json],[Agentable]"

let pEU_fieldordersArray = [|
    "Caption"
    "Username"
    "Email"
    "Tel"
    "Gender"
    "Status"
    "Admin"
    "Privilege"
    "Verify"
    "Pwd"
    "Online"
    "Icon"
    "Background"
    "BasicAcct"
    "Citizen"
    "Refer"
    "Referer"
    "Discord"
    "DiscordId"
    "Google"
    "GoogleId"
    "Apple"
    "AppleId"
    "OAuthProvider"
    "OAuthID"
    "GTV"
    "Gettr"
    "Farm"
    "CountFollows"
    "CountFollowers"
    "CountMoments"
    "CountViews"
    "CountComments"
    "CountThumbUps"
    "CountThumbDns"
    "Lang"
    "BizOperator"
    "Url"
    "About"
    "PublicPoints"
    "Json"
    "Agentable" |]

let EU_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Username]=@Username,[Email]=@Email,[Tel]=@Tel,[Gender]=@Gender,[Status]=@Status,[Admin]=@Admin,[Privilege]=@Privilege,[Verify]=@Verify,[Pwd]=@Pwd,[Online]=@Online,[Icon]=@Icon,[Background]=@Background,[BasicAcct]=@BasicAcct,[Citizen]=@Citizen,[Refer]=@Refer,[Referer]=@Referer,[Discord]=@Discord,[DiscordId]=@DiscordId,[Google]=@Google,[GoogleId]=@GoogleId,[Apple]=@Apple,[AppleId]=@AppleId,[OAuthProvider]=@OAuthProvider,[OAuthID]=@OAuthID,[GTV]=@GTV,[Gettr]=@Gettr,[Farm]=@Farm,[CountFollows]=@CountFollows,[CountFollowers]=@CountFollowers,[CountMoments]=@CountMoments,[CountViews]=@CountViews,[CountComments]=@CountComments,[CountThumbUps]=@CountThumbUps,[CountThumbDns]=@CountThumbDns,[Lang]=@Lang,[BizOperator]=@BizOperator,[Url]=@Url,[About]=@About,[PublicPoints]=@PublicPoints,[Json]=@Json,[Agentable]=@Agentable"

let pEU_fields = [|
    Caption("Caption", 64)
    Caption("Username", 64)
    Chars("Email", 256)
    Chars("Tel", 32)
    SelectLines("Gender", [| ("Unknown","未知");("Male","男");("Female","女") |])
    SelectLines("Status", [| ("Normal","正常");("Frozen","冻结");("Terminated","注销") |])
    SelectLines("Admin", [| ("None","无");("Admin","管理员") |])
    Integer("Privilege")
    SelectLines("Verify", [| ("Normal","常规");("Verified","认证") |])
    Chars("Pwd", 16)
    Boolean("Online")
    Link("Icon", 256)
    Link("Background", 256)
    FK("BasicAcct")
    FK("Citizen")
    Caption("Refer", 7)
    FK("Referer")
    Caption("Discord", 64)
    Integer("DiscordId")
    Caption("Google", 64)
    Integer("GoogleId")
    Caption("Apple", 64)
    Integer("AppleId")
    Caption("OAuthProvider", 64)
    Caption("OAuthID", 256)
    Caption("GTV", 64)
    Caption("Gettr", 64)
    FK("Farm")
    Integer("CountFollows")
    Integer("CountFollowers")
    Integer("CountMoments")
    Integer("CountViews")
    Integer("CountComments")
    Integer("CountThumbUps")
    Integer("CountThumbDns")
    FK("Lang")
    FK("BizOperator")
    Text("Url")
    Text("About")
    Integer("PublicPoints")
    Text("Json")
    SelectLines("Agentable", [| ("No","否");("Yes","可") |]) |]

let pEU_empty(): pEU = {
    Caption = ""
    Username = ""
    Email = ""
    Tel = ""
    Gender = EnumOfValue 0
    Status = EnumOfValue 0
    Admin = EnumOfValue 0
    Privilege = 0L
    Verify = EnumOfValue 0
    Pwd = ""
    Online = true
    Icon = ""
    Background = ""
    BasicAcct = 0L
    Citizen = 0L
    Refer = ""
    Referer = 0L
    Discord = ""
    DiscordId = 0L
    Google = ""
    GoogleId = 0L
    Apple = ""
    AppleId = 0L
    OAuthProvider = ""
    OAuthID = ""
    GTV = ""
    Gettr = ""
    Farm = 0L
    CountFollows = 0L
    CountFollowers = 0L
    CountMoments = 0L
    CountViews = 0L
    CountComments = 0L
    CountThumbUps = 0L
    CountThumbDns = 0L
    Lang = 0L
    BizOperator = 0L
    Url = ""
    About = ""
    PublicPoints = 0L
    Json = ""
    Agentable = EnumOfValue 0 }

let EU_id = ref 54367576L
let EU_count = ref 0
let EU_table = "Ca_EndUser"

// [Ca_File] (FILE)

type fileEncryptEnum = 
| None = 0 // 未加密
| Sys = 1 // 系统加密
| Usr = 2 // 用户加密

let fileEncryptEnums = [| fileEncryptEnum.None; fileEncryptEnum.Sys; fileEncryptEnum.Usr |]
let fileEncryptEnumstrs = [| "fileEncryptEnum"; "fileEncryptEnum"; "fileEncryptEnum" |]
let fileEncryptNum = 3

let int__fileEncryptEnum v =
    match v with
    | 0 -> Some fileEncryptEnum.None
    | 1 -> Some fileEncryptEnum.Sys
    | 2 -> Some fileEncryptEnum.Usr
    | _ -> None

let str__fileEncryptEnum s =
    match s with
    | "None" -> Some fileEncryptEnum.None
    | "Sys" -> Some fileEncryptEnum.Sys
    | "Usr" -> Some fileEncryptEnum.Usr
    | _ -> None

let fileEncryptEnum__caption e =
    match e with
    | fileEncryptEnum.None -> "未加密"
    | fileEncryptEnum.Sys -> "系统加密"
    | fileEncryptEnum.Usr -> "用户加密"
    | _ -> ""

type fileBindTypeEnum = 
| Sys = 0 // 系统
| EndUser = 1 // 用户
| Biz = 2 // 机构
| Group = 3 // 群

let fileBindTypeEnums = [| fileBindTypeEnum.Sys; fileBindTypeEnum.EndUser; fileBindTypeEnum.Biz; fileBindTypeEnum.Group |]
let fileBindTypeEnumstrs = [| "fileBindTypeEnum"; "fileBindTypeEnum"; "fileBindTypeEnum"; "fileBindTypeEnum" |]
let fileBindTypeNum = 4

let int__fileBindTypeEnum v =
    match v with
    | 0 -> Some fileBindTypeEnum.Sys
    | 1 -> Some fileBindTypeEnum.EndUser
    | 2 -> Some fileBindTypeEnum.Biz
    | 3 -> Some fileBindTypeEnum.Group
    | _ -> None

let str__fileBindTypeEnum s =
    match s with
    | "Sys" -> Some fileBindTypeEnum.Sys
    | "EndUser" -> Some fileBindTypeEnum.EndUser
    | "Biz" -> Some fileBindTypeEnum.Biz
    | "Group" -> Some fileBindTypeEnum.Group
    | _ -> None

let fileBindTypeEnum__caption e =
    match e with
    | fileBindTypeEnum.Sys -> "系统"
    | fileBindTypeEnum.EndUser -> "用户"
    | fileBindTypeEnum.Biz -> "机构"
    | fileBindTypeEnum.Group -> "群"
    | _ -> ""

type fileStateEnum = 
| Normal = 0 // 正常
| Canceled = 1 // 已取消
| Uploading = 2 // 上传中
| PendingTranscode = 3 // 待媒体转码
| PendingBlockchain = 4 // 待区块链同步
| Deleted = 5 // 已删除

let fileStateEnums = [| fileStateEnum.Normal; fileStateEnum.Canceled; fileStateEnum.Uploading; fileStateEnum.PendingTranscode; fileStateEnum.PendingBlockchain; fileStateEnum.Deleted |]
let fileStateEnumstrs = [| "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum"; "fileStateEnum" |]
let fileStateNum = 6

let int__fileStateEnum v =
    match v with
    | 0 -> Some fileStateEnum.Normal
    | 1 -> Some fileStateEnum.Canceled
    | 2 -> Some fileStateEnum.Uploading
    | 3 -> Some fileStateEnum.PendingTranscode
    | 4 -> Some fileStateEnum.PendingBlockchain
    | 5 -> Some fileStateEnum.Deleted
    | _ -> None

let str__fileStateEnum s =
    match s with
    | "Normal" -> Some fileStateEnum.Normal
    | "Canceled" -> Some fileStateEnum.Canceled
    | "Uploading" -> Some fileStateEnum.Uploading
    | "PendingTranscode" -> Some fileStateEnum.PendingTranscode
    | "PendingBlockchain" -> Some fileStateEnum.PendingBlockchain
    | "Deleted" -> Some fileStateEnum.Deleted
    | _ -> None

let fileStateEnum__caption e =
    match e with
    | fileStateEnum.Normal -> "正常"
    | fileStateEnum.Canceled -> "已取消"
    | fileStateEnum.Uploading -> "上传中"
    | fileStateEnum.PendingTranscode -> "待媒体转码"
    | fileStateEnum.PendingBlockchain -> "待区块链同步"
    | fileStateEnum.Deleted -> "已删除"
    | _ -> ""

type fileFileTypeEnum = 
| Default = 0 // 默认
| Text = 1 // 文本
| Bin = 2 // 二进制
| Img = 3 // 图片
| Video = 4 // 视频

let fileFileTypeEnums = [| fileFileTypeEnum.Default; fileFileTypeEnum.Text; fileFileTypeEnum.Bin; fileFileTypeEnum.Img; fileFileTypeEnum.Video |]
let fileFileTypeEnumstrs = [| "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum"; "fileFileTypeEnum" |]
let fileFileTypeNum = 5

let int__fileFileTypeEnum v =
    match v with
    | 0 -> Some fileFileTypeEnum.Default
    | 1 -> Some fileFileTypeEnum.Text
    | 2 -> Some fileFileTypeEnum.Bin
    | 3 -> Some fileFileTypeEnum.Img
    | 4 -> Some fileFileTypeEnum.Video
    | _ -> None

let str__fileFileTypeEnum s =
    match s with
    | "Default" -> Some fileFileTypeEnum.Default
    | "Text" -> Some fileFileTypeEnum.Text
    | "Bin" -> Some fileFileTypeEnum.Bin
    | "Img" -> Some fileFileTypeEnum.Img
    | "Video" -> Some fileFileTypeEnum.Video
    | _ -> None

let fileFileTypeEnum__caption e =
    match e with
    | fileFileTypeEnum.Default -> "默认"
    | fileFileTypeEnum.Text -> "文本"
    | fileFileTypeEnum.Bin -> "二进制"
    | fileFileTypeEnum.Img -> "图片"
    | fileFileTypeEnum.Video -> "视频"
    | _ -> ""

type pFILE = {
mutable Caption: Caption
mutable Content: Bin
mutable Encrypt: fileEncryptEnum
mutable SHA256: Text
mutable Size: Integer
mutable Bind: Integer
mutable BindType: fileBindTypeEnum
mutable State: fileStateEnum
mutable Folder: FK
mutable FileType: fileFileTypeEnum
mutable JSON: Text}


type FILE = Rcd<pFILE>

let FILE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Content],[Encrypt],[SHA256],[Size],[Bind],[BindType],[State],[Folder],[FileType],[JSON]"

let pFILE_fieldordersArray = [|
    "Caption"
    "Content"
    "Encrypt"
    "SHA256"
    "Size"
    "Bind"
    "BindType"
    "State"
    "Folder"
    "FileType"
    "JSON" |]

let FILE_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Content]=@Content,[Encrypt]=@Encrypt,[SHA256]=@SHA256,[Size]=@Size,[Bind]=@Bind,[BindType]=@BindType,[State]=@State,[Folder]=@Folder,[FileType]=@FileType,[JSON]=@JSON"

let pFILE_fields = [|
    Caption("Caption", 256)
    Bin("Content")
    SelectLines("Encrypt", [| ("None","未加密");("Sys","系统加密");("Usr","用户加密") |])
    Text("SHA256")
    Integer("Size")
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","系统");("EndUser","用户");("Biz","机构");("Group","群") |])
    SelectLines("State", [| ("Normal","正常");("Canceled","已取消");("Uploading","上传中");("PendingTranscode","待媒体转码");("PendingBlockchain","待区块链同步");("Deleted","已删除") |])
    FK("Folder")
    SelectLines("FileType", [| ("Default","默认");("Text","文本");("Bin","二进制");("Img","图片");("Video","视频") |])
    Text("JSON") |]

let pFILE_empty(): pFILE = {
    Caption = ""
    Content = [||]
    Encrypt = EnumOfValue 0
    SHA256 = ""
    Size = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    State = EnumOfValue 0
    Folder = 0L
    FileType = EnumOfValue 0
    JSON = "" }

let FILE_id = ref 65464758L
let FILE_count = ref 0
let FILE_table = "Ca_File"

// [Ca_Folder] (FOLDER)

type folderEncryptEnum = 
| None = 0 // 未加密
| Sys = 1 // 系统加密
| Usr = 2 // 用户加密

let folderEncryptEnums = [| folderEncryptEnum.None; folderEncryptEnum.Sys; folderEncryptEnum.Usr |]
let folderEncryptEnumstrs = [| "folderEncryptEnum"; "folderEncryptEnum"; "folderEncryptEnum" |]
let folderEncryptNum = 3

let int__folderEncryptEnum v =
    match v with
    | 0 -> Some folderEncryptEnum.None
    | 1 -> Some folderEncryptEnum.Sys
    | 2 -> Some folderEncryptEnum.Usr
    | _ -> None

let str__folderEncryptEnum s =
    match s with
    | "None" -> Some folderEncryptEnum.None
    | "Sys" -> Some folderEncryptEnum.Sys
    | "Usr" -> Some folderEncryptEnum.Usr
    | _ -> None

let folderEncryptEnum__caption e =
    match e with
    | folderEncryptEnum.None -> "未加密"
    | folderEncryptEnum.Sys -> "系统加密"
    | folderEncryptEnum.Usr -> "用户加密"
    | _ -> ""

type folderBindTypeEnum = 
| Sys = 0 // 系统
| EndUser = 1 // 用户
| Biz = 2 // 机构
| Group = 3 // 群

let folderBindTypeEnums = [| folderBindTypeEnum.Sys; folderBindTypeEnum.EndUser; folderBindTypeEnum.Biz; folderBindTypeEnum.Group |]
let folderBindTypeEnumstrs = [| "folderBindTypeEnum"; "folderBindTypeEnum"; "folderBindTypeEnum"; "folderBindTypeEnum" |]
let folderBindTypeNum = 4

let int__folderBindTypeEnum v =
    match v with
    | 0 -> Some folderBindTypeEnum.Sys
    | 1 -> Some folderBindTypeEnum.EndUser
    | 2 -> Some folderBindTypeEnum.Biz
    | 3 -> Some folderBindTypeEnum.Group
    | _ -> None

let str__folderBindTypeEnum s =
    match s with
    | "Sys" -> Some folderBindTypeEnum.Sys
    | "EndUser" -> Some folderBindTypeEnum.EndUser
    | "Biz" -> Some folderBindTypeEnum.Biz
    | "Group" -> Some folderBindTypeEnum.Group
    | _ -> None

let folderBindTypeEnum__caption e =
    match e with
    | folderBindTypeEnum.Sys -> "系统"
    | folderBindTypeEnum.EndUser -> "用户"
    | folderBindTypeEnum.Biz -> "机构"
    | folderBindTypeEnum.Group -> "群"
    | _ -> ""

type pFOLDER = {
mutable Caption: Caption
mutable Encrypt: folderEncryptEnum
mutable Bind: Integer
mutable BindType: folderBindTypeEnum
mutable Parent: FK}


type FOLDER = Rcd<pFOLDER>

let FOLDER_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Encrypt],[Bind],[BindType],[Parent]"

let pFOLDER_fieldordersArray = [|
    "Caption"
    "Encrypt"
    "Bind"
    "BindType"
    "Parent" |]

let FOLDER_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Encrypt]=@Encrypt,[Bind]=@Bind,[BindType]=@BindType,[Parent]=@Parent"

let pFOLDER_fields = [|
    Caption("Caption", 256)
    SelectLines("Encrypt", [| ("None","未加密");("Sys","系统加密");("Usr","用户加密") |])
    Integer("Bind")
    SelectLines("BindType", [| ("Sys","系统");("EndUser","用户");("Biz","机构");("Group","群") |])
    FK("Parent") |]

let pFOLDER_empty(): pFOLDER = {
    Caption = ""
    Encrypt = EnumOfValue 0
    Bind = 0L
    BindType = EnumOfValue 0
    Parent = 0L }

let FOLDER_id = ref 54665847L
let FOLDER_count = ref 0
let FOLDER_table = "Ca_Folder"

// [Ca_Lang] (LANG)

type langTextDirectionEnum = 
| Default = 0 // 默认
| RightToLeft = 1 // 从右往左排

let langTextDirectionEnums = [| langTextDirectionEnum.Default; langTextDirectionEnum.RightToLeft |]
let langTextDirectionEnumstrs = [| "langTextDirectionEnum"; "langTextDirectionEnum" |]
let langTextDirectionNum = 2

let int__langTextDirectionEnum v =
    match v with
    | 0 -> Some langTextDirectionEnum.Default
    | 1 -> Some langTextDirectionEnum.RightToLeft
    | _ -> None

let str__langTextDirectionEnum s =
    match s with
    | "Default" -> Some langTextDirectionEnum.Default
    | "RightToLeft" -> Some langTextDirectionEnum.RightToLeft
    | _ -> None

let langTextDirectionEnum__caption e =
    match e with
    | langTextDirectionEnum.Default -> "默认"
    | langTextDirectionEnum.RightToLeft -> "从右往左排"
    | _ -> ""

type pLANG = {
mutable Code2: Chars
mutable Caption: Chars
mutable Native: Chars
mutable Icon: Link
mutable IsBlank: Boolean
mutable IsLocale: Boolean
mutable IsContent: Boolean
mutable IsAutoTranslate: Boolean
mutable TextDirection: langTextDirectionEnum}


type LANG = Rcd<pLANG>

let LANG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code2],[Caption],[Native],[Icon],[IsBlank],[IsLocale],[IsContent],[IsAutoTranslate],[TextDirection]"

let pLANG_fieldordersArray = [|
    "Code2"
    "Caption"
    "Native"
    "Icon"
    "IsBlank"
    "IsLocale"
    "IsContent"
    "IsAutoTranslate"
    "TextDirection" |]

let LANG_sql_update = "[Updatedat]=@Updatedat,[Code2]=@Code2,[Caption]=@Caption,[Native]=@Native,[Icon]=@Icon,[IsBlank]=@IsBlank,[IsLocale]=@IsLocale,[IsContent]=@IsContent,[IsAutoTranslate]=@IsAutoTranslate,[TextDirection]=@TextDirection"

let pLANG_fields = [|
    Chars("Code2", 2)
    Chars("Caption", 64)
    Chars("Native", 64)
    Link("Icon", 256)
    Boolean("IsBlank")
    Boolean("IsLocale")
    Boolean("IsContent")
    Boolean("IsAutoTranslate")
    SelectLines("TextDirection", [| ("Default","默认");("RightToLeft","从右往左排") |]) |]

let pLANG_empty(): pLANG = {
    Code2 = ""
    Caption = ""
    Native = ""
    Icon = ""
    IsBlank = true
    IsLocale = true
    IsContent = true
    IsAutoTranslate = true
    TextDirection = EnumOfValue 0 }

let LANG_id = ref 1001L
let LANG_count = ref 0
let LANG_table = "Ca_Lang"

// [Ca_WebCredential] (CWC)

type pCWC = {
mutable Caption: Caption
mutable ExternalId: Integer
mutable Icon: Link
mutable EU: FK
mutable Biz: FK
mutable Json: Text}


type CWC = Rcd<pCWC>

let CWC_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[ExternalId],[Icon],[EU],[Biz],[Json]"

let pCWC_fieldordersArray = [|
    "Caption"
    "ExternalId"
    "Icon"
    "EU"
    "Biz"
    "Json" |]

let CWC_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[ExternalId]=@ExternalId,[Icon]=@Icon,[EU]=@EU,[Biz]=@Biz,[Json]=@Json"

let pCWC_fields = [|
    Caption("Caption", 64)
    Integer("ExternalId")
    Link("Icon", 256)
    FK("EU")
    FK("Biz")
    Text("Json") |]

let pCWC_empty(): pCWC = {
    Caption = ""
    ExternalId = 0L
    Icon = ""
    EU = 0L
    Biz = 0L
    Json = "" }

let CWC_id = ref 0L
let CWC_count = ref 0
let CWC_table = "Ca_WebCredential"

// [Sys_ApiLog] (APILOG)

type pAPILOG = {
mutable Location: Text
mutable ApiKey: Text
mutable IP: Text
mutable Session: Chars
mutable Biz: FK
mutable BizCode: Chars
mutable Api: Text
mutable Request: Text
mutable RequestHex: Text
mutable RequestJson: Text
mutable Response: Text
mutable ResponseJson: Text
mutable Content: Text
mutable Eu: FK
mutable Agent: FK
mutable Data: FK}


type APILOG = Rcd<pAPILOG>

let APILOG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Location],[ApiKey],[IP],[Session],[Biz],[BizCode],[Api],[Request],[RequestHex],[RequestJson],[Response],[ResponseJson],[Content],[Eu],[Agent],[Data]"

let pAPILOG_fieldordersArray = [|
    "Location"
    "ApiKey"
    "IP"
    "Session"
    "Biz"
    "BizCode"
    "Api"
    "Request"
    "RequestHex"
    "RequestJson"
    "Response"
    "ResponseJson"
    "Content"
    "Eu"
    "Agent"
    "Data" |]

let APILOG_sql_update = "[Updatedat]=@Updatedat,[Location]=@Location,[ApiKey]=@ApiKey,[IP]=@IP,[Session]=@Session,[Biz]=@Biz,[BizCode]=@BizCode,[Api]=@Api,[Request]=@Request,[RequestHex]=@RequestHex,[RequestJson]=@RequestJson,[Response]=@Response,[ResponseJson]=@ResponseJson,[Content]=@Content,[Eu]=@Eu,[Agent]=@Agent,[Data]=@Data"

let pAPILOG_fields = [|
    Text("Location")
    Text("ApiKey")
    Text("IP")
    Chars("Session", 64)
    FK("Biz")
    Chars("BizCode", 16)
    Text("Api")
    Text("Request")
    Text("RequestHex")
    Text("RequestJson")
    Text("Response")
    Text("ResponseJson")
    Text("Content")
    FK("Eu")
    FK("Agent")
    FK("Data") |]

let pAPILOG_empty(): pAPILOG = {
    Location = ""
    ApiKey = ""
    IP = ""
    Session = ""
    Biz = 0L
    BizCode = ""
    Api = ""
    Request = ""
    RequestHex = ""
    RequestJson = ""
    Response = ""
    ResponseJson = ""
    Content = ""
    Eu = 0L
    Agent = 0L
    Data = 0L }

let APILOG_id = ref 72597L
let APILOG_count = ref 0
let APILOG_table = "Sys_ApiLog"

// [Sys_Authorization] (AUTH)

type authAdminTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构

let authAdminTypeEnums = [| authAdminTypeEnum.EndUser; authAdminTypeEnum.Biz |]
let authAdminTypeEnumstrs = [| "authAdminTypeEnum"; "authAdminTypeEnum" |]
let authAdminTypeNum = 2

let int__authAdminTypeEnum v =
    match v with
    | 0 -> Some authAdminTypeEnum.EndUser
    | 1 -> Some authAdminTypeEnum.Biz
    | _ -> None

let str__authAdminTypeEnum s =
    match s with
    | "EndUser" -> Some authAdminTypeEnum.EndUser
    | "Biz" -> Some authAdminTypeEnum.Biz
    | _ -> None

let authAdminTypeEnum__caption e =
    match e with
    | authAdminTypeEnum.EndUser -> "用户"
    | authAdminTypeEnum.Biz -> "机构"
    | _ -> ""

type pAUTH = {
mutable Admin: FK
mutable Role: FK
mutable Desc: Text
mutable Profile: Text
mutable AdminType: authAdminTypeEnum}


type AUTH = Rcd<pAUTH>

let AUTH_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Admin],[Role],[Desc],[Profile],[AdminType]"

let pAUTH_fieldordersArray = [|
    "Admin"
    "Role"
    "Desc"
    "Profile"
    "AdminType" |]

let AUTH_sql_update = "[Updatedat]=@Updatedat,[Admin]=@Admin,[Role]=@Role,[Desc]=@Desc,[Profile]=@Profile,[AdminType]=@AdminType"

let pAUTH_fields = [|
    FK("Admin")
    FK("Role")
    Text("Desc")
    Text("Profile")
    SelectLines("AdminType", [| ("EndUser","用户");("Biz","机构") |]) |]

let pAUTH_empty(): pAUTH = {
    Admin = 0L
    Role = 0L
    Desc = ""
    Profile = ""
    AdminType = EnumOfValue 0 }

let AUTH_id = ref 0L
let AUTH_count = ref 0
let AUTH_table = "Sys_Authorization"

// [Sys_Config] (CONFIG)

type pCONFIG = {
mutable Caption: Caption
mutable Code: Caption
mutable Value: Text
mutable Desc: Text}


type CONFIG = Rcd<pCONFIG>

let CONFIG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Caption],[Code],[Value],[Desc]"

let pCONFIG_fieldordersArray = [|
    "Caption"
    "Code"
    "Value"
    "Desc" |]

let CONFIG_sql_update = "[Updatedat]=@Updatedat,[Caption]=@Caption,[Code]=@Code,[Value]=@Value,[Desc]=@Desc"

let pCONFIG_fields = [|
    Caption("Caption", 64)
    Caption("Code", 64)
    Text("Value")
    Text("Desc") |]

let pCONFIG_empty(): pCONFIG = {
    Caption = ""
    Code = ""
    Value = ""
    Desc = "" }

let CONFIG_id = ref 0L
let CONFIG_count = ref 0
let CONFIG_table = "Sys_Config"

// [Sys_EuSession] (EUSESS)

type pEUSESS = {
mutable EU: FK
mutable IP: Caption
mutable Session: Caption
mutable App: Caption}


type EUSESS = Rcd<pEUSESS>

let EUSESS_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EU],[IP],[Session],[App]"

let pEUSESS_fieldordersArray = [|
    "EU"
    "IP"
    "Session"
    "App" |]

let EUSESS_sql_update = "[Updatedat]=@Updatedat,[EU]=@EU,[IP]=@IP,[Session]=@Session,[App]=@App"

let pEUSESS_fields = [|
    FK("EU")
    Caption("IP", 64)
    Caption("Session", 64)
    Caption("App", 64) |]

let pEUSESS_empty(): pEUSESS = {
    EU = 0L
    IP = ""
    Session = ""
    App = "" }

let EUSESS_id = ref 0L
let EUSESS_count = ref 0
let EUSESS_table = "Sys_EuSession"

// [Sys_EuToken] (EUTOK)

type pEUTOK = {
mutable EU: FK
mutable IP: Caption
mutable Session: Caption
mutable Token: Caption
mutable App: Caption}


type EUTOK = Rcd<pEUTOK>

let EUTOK_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EU],[IP],[Session],[Token],[App]"

let pEUTOK_fieldordersArray = [|
    "EU"
    "IP"
    "Session"
    "Token"
    "App" |]

let EUTOK_sql_update = "[Updatedat]=@Updatedat,[EU]=@EU,[IP]=@IP,[Session]=@Session,[Token]=@Token,[App]=@App"

let pEUTOK_fields = [|
    FK("EU")
    Caption("IP", 64)
    Caption("Session", 64)
    Caption("Token", 64)
    Caption("App", 64) |]

let pEUTOK_empty(): pEUTOK = {
    EU = 0L
    IP = ""
    Session = ""
    Token = ""
    App = "" }

let EUTOK_id = ref 0L
let EUTOK_count = ref 0
let EUTOK_table = "Sys_EuToken"

// [Sys_Log] (LOG)

type logLevelEnum = 
| Fatal = 0 // Fatal
| Severe = 1 // Severe
| Normal = 2 // Normal
| Debug = 3 // Debug

let logLevelEnums = [| logLevelEnum.Fatal; logLevelEnum.Severe; logLevelEnum.Normal; logLevelEnum.Debug |]
let logLevelEnumstrs = [| "logLevelEnum"; "logLevelEnum"; "logLevelEnum"; "logLevelEnum" |]
let logLevelNum = 4

let int__logLevelEnum v =
    match v with
    | 0 -> Some logLevelEnum.Fatal
    | 1 -> Some logLevelEnum.Severe
    | 2 -> Some logLevelEnum.Normal
    | 3 -> Some logLevelEnum.Debug
    | _ -> None

let str__logLevelEnum s =
    match s with
    | "Fatal" -> Some logLevelEnum.Fatal
    | "Severe" -> Some logLevelEnum.Severe
    | "Normal" -> Some logLevelEnum.Normal
    | "Debug" -> Some logLevelEnum.Debug
    | _ -> None

let logLevelEnum__caption e =
    match e with
    | logLevelEnum.Fatal -> "Fatal"
    | logLevelEnum.Severe -> "Severe"
    | logLevelEnum.Normal -> "Normal"
    | logLevelEnum.Debug -> "Debug"
    | _ -> ""

type pLOG = {
mutable Desc: Caption
mutable Location: Text
mutable Content: Text
mutable Sql: Text
mutable Level: logLevelEnum}


type LOG = Rcd<pLOG>

let LOG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Desc],[Location],[Content],[Sql],[Level]"

let pLOG_fieldordersArray = [|
    "Desc"
    "Location"
    "Content"
    "Sql"
    "Level" |]

let LOG_sql_update = "[Updatedat]=@Updatedat,[Desc]=@Desc,[Location]=@Location,[Content]=@Content,[Sql]=@Sql,[Level]=@Level"

let pLOG_fields = [|
    Caption("Desc", 64)
    Text("Location")
    Text("Content")
    Text("Sql")
    SelectLines("Level", [| ("Fatal","Fatal");("Severe","Severe");("Normal","Normal");("Debug","Debug") |]) |]

let pLOG_empty(): pLOG = {
    Desc = ""
    Location = ""
    Content = ""
    Sql = ""
    Level = EnumOfValue 0 }

let LOG_id = ref 0L
let LOG_count = ref 0
let LOG_table = "Sys_Log"

// [Sys_Notification] (NOTIFICATION)

type notificationBindTypeEnum = 
| EndUser = 0 // 用户
| Biz = 1 // 机构

let notificationBindTypeEnums = [| notificationBindTypeEnum.EndUser; notificationBindTypeEnum.Biz |]
let notificationBindTypeEnumstrs = [| "notificationBindTypeEnum"; "notificationBindTypeEnum" |]
let notificationBindTypeNum = 2

let int__notificationBindTypeEnum v =
    match v with
    | 0 -> Some notificationBindTypeEnum.EndUser
    | 1 -> Some notificationBindTypeEnum.Biz
    | _ -> None

let str__notificationBindTypeEnum s =
    match s with
    | "EndUser" -> Some notificationBindTypeEnum.EndUser
    | "Biz" -> Some notificationBindTypeEnum.Biz
    | _ -> None

let notificationBindTypeEnum__caption e =
    match e with
    | notificationBindTypeEnum.EndUser -> "用户"
    | notificationBindTypeEnum.Biz -> "机构"
    | _ -> ""

type notificationSrcTypeEnum = 
| Sys = 0 // 系统消息
| EndUser = 1 // 终端用户

let notificationSrcTypeEnums = [| notificationSrcTypeEnum.Sys; notificationSrcTypeEnum.EndUser |]
let notificationSrcTypeEnumstrs = [| "notificationSrcTypeEnum"; "notificationSrcTypeEnum" |]
let notificationSrcTypeNum = 2

let int__notificationSrcTypeEnum v =
    match v with
    | 0 -> Some notificationSrcTypeEnum.Sys
    | 1 -> Some notificationSrcTypeEnum.EndUser
    | _ -> None

let str__notificationSrcTypeEnum s =
    match s with
    | "Sys" -> Some notificationSrcTypeEnum.Sys
    | "EndUser" -> Some notificationSrcTypeEnum.EndUser
    | _ -> None

let notificationSrcTypeEnum__caption e =
    match e with
    | notificationSrcTypeEnum.Sys -> "系统消息"
    | notificationSrcTypeEnum.EndUser -> "终端用户"
    | _ -> ""

type notificationTypeEnum = 
| Default = 0 // 默认
| Follow = 1 // 关注
| Reward = 2 // 打赏
| ThumbUp = 3 // 点赞
| ThumbDn = 4 // 点踩
| Comment = 5 // 评论
| Reply = 6 // 回复
| Bookmark = 7 // 收藏
| Share = 8 // 转发
| Download = 9 // 下载
| Transfer = 10 // 转账
| OTCContract = 11 // otc购买合同

let notificationTypeEnums = [| notificationTypeEnum.Default; notificationTypeEnum.Follow; notificationTypeEnum.Reward; notificationTypeEnum.ThumbUp; notificationTypeEnum.ThumbDn; notificationTypeEnum.Comment; notificationTypeEnum.Reply; notificationTypeEnum.Bookmark; notificationTypeEnum.Share; notificationTypeEnum.Download; notificationTypeEnum.Transfer; notificationTypeEnum.OTCContract |]
let notificationTypeEnumstrs = [| "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum"; "notificationTypeEnum" |]
let notificationTypeNum = 12

let int__notificationTypeEnum v =
    match v with
    | 0 -> Some notificationTypeEnum.Default
    | 1 -> Some notificationTypeEnum.Follow
    | 2 -> Some notificationTypeEnum.Reward
    | 3 -> Some notificationTypeEnum.ThumbUp
    | 4 -> Some notificationTypeEnum.ThumbDn
    | 5 -> Some notificationTypeEnum.Comment
    | 6 -> Some notificationTypeEnum.Reply
    | 7 -> Some notificationTypeEnum.Bookmark
    | 8 -> Some notificationTypeEnum.Share
    | 9 -> Some notificationTypeEnum.Download
    | 10 -> Some notificationTypeEnum.Transfer
    | 11 -> Some notificationTypeEnum.OTCContract
    | _ -> None

let str__notificationTypeEnum s =
    match s with
    | "Default" -> Some notificationTypeEnum.Default
    | "Follow" -> Some notificationTypeEnum.Follow
    | "Reward" -> Some notificationTypeEnum.Reward
    | "ThumbUp" -> Some notificationTypeEnum.ThumbUp
    | "ThumbDn" -> Some notificationTypeEnum.ThumbDn
    | "Comment" -> Some notificationTypeEnum.Comment
    | "Reply" -> Some notificationTypeEnum.Reply
    | "Bookmark" -> Some notificationTypeEnum.Bookmark
    | "Share" -> Some notificationTypeEnum.Share
    | "Download" -> Some notificationTypeEnum.Download
    | "Transfer" -> Some notificationTypeEnum.Transfer
    | "OTCContract" -> Some notificationTypeEnum.OTCContract
    | _ -> None

let notificationTypeEnum__caption e =
    match e with
    | notificationTypeEnum.Default -> "默认"
    | notificationTypeEnum.Follow -> "关注"
    | notificationTypeEnum.Reward -> "打赏"
    | notificationTypeEnum.ThumbUp -> "点赞"
    | notificationTypeEnum.ThumbDn -> "点踩"
    | notificationTypeEnum.Comment -> "评论"
    | notificationTypeEnum.Reply -> "回复"
    | notificationTypeEnum.Bookmark -> "收藏"
    | notificationTypeEnum.Share -> "转发"
    | notificationTypeEnum.Download -> "下载"
    | notificationTypeEnum.Transfer -> "转账"
    | notificationTypeEnum.OTCContract -> "otc购买合同"
    | _ -> ""

type notificationDataTypeEnum = 
| Default = 0 // 默认
| EndUser = 1 // 用户
| Biz = 2 // 机构
| Moment = 3 // 动态
| Comment = 4 // 评论
| Message = 5 // 消息
| OTCContract = 6 // otc购买合同

let notificationDataTypeEnums = [| notificationDataTypeEnum.Default; notificationDataTypeEnum.EndUser; notificationDataTypeEnum.Biz; notificationDataTypeEnum.Moment; notificationDataTypeEnum.Comment; notificationDataTypeEnum.Message; notificationDataTypeEnum.OTCContract |]
let notificationDataTypeEnumstrs = [| "notificationDataTypeEnum"; "notificationDataTypeEnum"; "notificationDataTypeEnum"; "notificationDataTypeEnum"; "notificationDataTypeEnum"; "notificationDataTypeEnum"; "notificationDataTypeEnum" |]
let notificationDataTypeNum = 7

let int__notificationDataTypeEnum v =
    match v with
    | 0 -> Some notificationDataTypeEnum.Default
    | 1 -> Some notificationDataTypeEnum.EndUser
    | 2 -> Some notificationDataTypeEnum.Biz
    | 3 -> Some notificationDataTypeEnum.Moment
    | 4 -> Some notificationDataTypeEnum.Comment
    | 5 -> Some notificationDataTypeEnum.Message
    | 6 -> Some notificationDataTypeEnum.OTCContract
    | _ -> None

let str__notificationDataTypeEnum s =
    match s with
    | "Default" -> Some notificationDataTypeEnum.Default
    | "EndUser" -> Some notificationDataTypeEnum.EndUser
    | "Biz" -> Some notificationDataTypeEnum.Biz
    | "Moment" -> Some notificationDataTypeEnum.Moment
    | "Comment" -> Some notificationDataTypeEnum.Comment
    | "Message" -> Some notificationDataTypeEnum.Message
    | "OTCContract" -> Some notificationDataTypeEnum.OTCContract
    | _ -> None

let notificationDataTypeEnum__caption e =
    match e with
    | notificationDataTypeEnum.Default -> "默认"
    | notificationDataTypeEnum.EndUser -> "用户"
    | notificationDataTypeEnum.Biz -> "机构"
    | notificationDataTypeEnum.Moment -> "动态"
    | notificationDataTypeEnum.Comment -> "评论"
    | notificationDataTypeEnum.Message -> "消息"
    | notificationDataTypeEnum.OTCContract -> "otc购买合同"
    | _ -> ""

type notificationStatusEnum = 
| Default = 0 // 默认
| Unread = 1 // 未读
| Read = 2 // 已读

let notificationStatusEnums = [| notificationStatusEnum.Default; notificationStatusEnum.Unread; notificationStatusEnum.Read |]
let notificationStatusEnumstrs = [| "notificationStatusEnum"; "notificationStatusEnum"; "notificationStatusEnum" |]
let notificationStatusNum = 3

let int__notificationStatusEnum v =
    match v with
    | 0 -> Some notificationStatusEnum.Default
    | 1 -> Some notificationStatusEnum.Unread
    | 2 -> Some notificationStatusEnum.Read
    | _ -> None

let str__notificationStatusEnum s =
    match s with
    | "Default" -> Some notificationStatusEnum.Default
    | "Unread" -> Some notificationStatusEnum.Unread
    | "Read" -> Some notificationStatusEnum.Read
    | _ -> None

let notificationStatusEnum__caption e =
    match e with
    | notificationStatusEnum.Default -> "默认"
    | notificationStatusEnum.Unread -> "未读"
    | notificationStatusEnum.Read -> "已读"
    | _ -> ""

type pNOTIFICATION = {
mutable BindType: notificationBindTypeEnum
mutable Bind: Integer
mutable SrcType: notificationSrcTypeEnum
mutable Src: Integer
mutable Type: notificationTypeEnum
mutable Entity: Integer
mutable DataType: notificationDataTypeEnum
mutable Data: Integer
mutable Msg: Text
mutable Status: notificationStatusEnum
mutable Readdat: Timestamp}


type NOTIFICATION = Rcd<pNOTIFICATION>

let NOTIFICATION_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[BindType],[Bind],[SrcType],[Src],[Type],[Entity],[DataType],[Data],[Msg],[Status],[Readdat]"

let pNOTIFICATION_fieldordersArray = [|
    "BindType"
    "Bind"
    "SrcType"
    "Src"
    "Type"
    "Entity"
    "DataType"
    "Data"
    "Msg"
    "Status"
    "Readdat" |]

let NOTIFICATION_sql_update = "[Updatedat]=@Updatedat,[BindType]=@BindType,[Bind]=@Bind,[SrcType]=@SrcType,[Src]=@Src,[Type]=@Type,[Entity]=@Entity,[DataType]=@DataType,[Data]=@Data,[Msg]=@Msg,[Status]=@Status,[Readdat]=@Readdat"

let pNOTIFICATION_fields = [|
    SelectLines("BindType", [| ("EndUser","用户");("Biz","机构") |])
    Integer("Bind")
    SelectLines("SrcType", [| ("Sys","系统消息");("EndUser","终端用户") |])
    Integer("Src")
    SelectLines("Type", [| ("Default","默认");("Follow","关注");("Reward","打赏");("ThumbUp","点赞");("ThumbDn","点踩");("Comment","评论");("Reply","回复");("Bookmark","收藏");("Share","转发");("Download","下载");("Transfer","转账");("OTCContract","otc购买合同") |])
    Integer("Entity")
    SelectLines("DataType", [| ("Default","默认");("EndUser","用户");("Biz","机构");("Moment","动态");("Comment","评论");("Message","消息");("OTCContract","otc购买合同") |])
    Integer("Data")
    Text("Msg")
    SelectLines("Status", [| ("Default","默认");("Unread","未读");("Read","已读") |])
    Timestamp("Readdat") |]

let pNOTIFICATION_empty(): pNOTIFICATION = {
    BindType = EnumOfValue 0
    Bind = 0L
    SrcType = EnumOfValue 0
    Src = 0L
    Type = EnumOfValue 0
    Entity = 0L
    DataType = EnumOfValue 0
    Data = 0L
    Msg = ""
    Status = EnumOfValue 0
    Readdat = DateTime.MinValue }

let NOTIFICATION_id = ref 0L
let NOTIFICATION_count = ref 0
let NOTIFICATION_table = "Sys_Notification"

// [Sys_PageLog] (PLOG)

type plogLocEnum = 
| Default = 0 // 默认
| MomentView = 1 // 动态
| Word = 2 // 词条

let plogLocEnums = [| plogLocEnum.Default; plogLocEnum.MomentView; plogLocEnum.Word |]
let plogLocEnumstrs = [| "plogLocEnum"; "plogLocEnum"; "plogLocEnum" |]
let plogLocNum = 3

let int__plogLocEnum v =
    match v with
    | 0 -> Some plogLocEnum.Default
    | 1 -> Some plogLocEnum.MomentView
    | 2 -> Some plogLocEnum.Word
    | _ -> None

let str__plogLocEnum s =
    match s with
    | "Default" -> Some plogLocEnum.Default
    | "MomentView" -> Some plogLocEnum.MomentView
    | "Word" -> Some plogLocEnum.Word
    | _ -> None

let plogLocEnum__caption e =
    match e with
    | plogLocEnum.Default -> "默认"
    | plogLocEnum.MomentView -> "动态"
    | plogLocEnum.Word -> "词条"
    | _ -> ""

type plogDeviceEnum = 
| Default = 0 // 默认
| Web = 1 // 浏览器
| iOS = 2 // iOS
| Android = 3 // Android

let plogDeviceEnums = [| plogDeviceEnum.Default; plogDeviceEnum.Web; plogDeviceEnum.iOS; plogDeviceEnum.Android |]
let plogDeviceEnumstrs = [| "plogDeviceEnum"; "plogDeviceEnum"; "plogDeviceEnum"; "plogDeviceEnum" |]
let plogDeviceNum = 4

let int__plogDeviceEnum v =
    match v with
    | 0 -> Some plogDeviceEnum.Default
    | 1 -> Some plogDeviceEnum.Web
    | 2 -> Some plogDeviceEnum.iOS
    | 3 -> Some plogDeviceEnum.Android
    | _ -> None

let str__plogDeviceEnum s =
    match s with
    | "Default" -> Some plogDeviceEnum.Default
    | "Web" -> Some plogDeviceEnum.Web
    | "iOS" -> Some plogDeviceEnum.iOS
    | "Android" -> Some plogDeviceEnum.Android
    | _ -> None

let plogDeviceEnum__caption e =
    match e with
    | plogDeviceEnum.Default -> "默认"
    | plogDeviceEnum.Web -> "浏览器"
    | plogDeviceEnum.iOS -> "iOS"
    | plogDeviceEnum.Android -> "Android"
    | _ -> ""

type pPLOG = {
mutable Url: Text
mutable Page: Text
mutable IP: Text
mutable Lng: Float
mutable Lat: Float
mutable City: Text
mutable Country: FK
mutable Session: Chars
mutable EndUser: FK
mutable App: Chars
mutable Loc: plogLocEnum
mutable Bind: Integer
mutable Device: plogDeviceEnum
mutable ReferCode: Chars
mutable Referrer: FK
mutable ReferApp: Caption
mutable Platform: FK
mutable Request: Text
mutable RequestHex: Text
mutable Response: Text
mutable Desc: Text
mutable InnerReferCode: Caption
mutable ReferrerUrl: Text
mutable PromotionType: Caption
mutable Promotion: Caption
mutable Domainname: FK
mutable Agent: FK}


type PLOG = Rcd<pPLOG>

let PLOG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Url],[Page],[IP],[Lng],[Lat],[City],[Country],[Session],[EndUser],[App],[Loc],[Bind],[Device],[ReferCode],[Referrer],[ReferApp],[Platform],[Request],[RequestHex],[Response],[Desc],[InnerReferCode],[ReferrerUrl],[PromotionType],[Promotion],[Domainname],[Agent]"

let pPLOG_fieldordersArray = [|
    "Url"
    "Page"
    "IP"
    "Lng"
    "Lat"
    "City"
    "Country"
    "Session"
    "EndUser"
    "App"
    "Loc"
    "Bind"
    "Device"
    "ReferCode"
    "Referrer"
    "ReferApp"
    "Platform"
    "Request"
    "RequestHex"
    "Response"
    "Desc"
    "InnerReferCode"
    "ReferrerUrl"
    "PromotionType"
    "Promotion"
    "Domainname"
    "Agent" |]

let PLOG_sql_update = "[Updatedat]=@Updatedat,[Url]=@Url,[Page]=@Page,[IP]=@IP,[Lng]=@Lng,[Lat]=@Lat,[City]=@City,[Country]=@Country,[Session]=@Session,[EndUser]=@EndUser,[App]=@App,[Loc]=@Loc,[Bind]=@Bind,[Device]=@Device,[ReferCode]=@ReferCode,[Referrer]=@Referrer,[ReferApp]=@ReferApp,[Platform]=@Platform,[Request]=@Request,[RequestHex]=@RequestHex,[Response]=@Response,[Desc]=@Desc,[InnerReferCode]=@InnerReferCode,[ReferrerUrl]=@ReferrerUrl,[PromotionType]=@PromotionType,[Promotion]=@Promotion,[Domainname]=@Domainname,[Agent]=@Agent"

let pPLOG_fields = [|
    Text("Url")
    Text("Page")
    Text("IP")
    Float("Lng")
    Float("Lat")
    Text("City")
    FK("Country")
    Chars("Session", 64)
    FK("EndUser")
    Chars("App", 256)
    SelectLines("Loc", [| ("Default","默认");("MomentView","动态");("Word","词条") |])
    Integer("Bind")
    SelectLines("Device", [| ("Default","默认");("Web","浏览器");("iOS","iOS");("Android","Android") |])
    Chars("ReferCode", 16)
    FK("Referrer")
    Caption("ReferApp", 256)
    FK("Platform")
    Text("Request")
    Text("RequestHex")
    Text("Response")
    Text("Desc")
    Caption("InnerReferCode", 256)
    Text("ReferrerUrl")
    Caption("PromotionType", 256)
    Caption("Promotion", 256)
    FK("Domainname")
    FK("Agent") |]

let pPLOG_empty(): pPLOG = {
    Url = ""
    Page = ""
    IP = ""
    Lng = 0.0
    Lat = 0.0
    City = ""
    Country = 0L
    Session = ""
    EndUser = 0L
    App = ""
    Loc = EnumOfValue 0
    Bind = 0L
    Device = EnumOfValue 0
    ReferCode = ""
    Referrer = 0L
    ReferApp = ""
    Platform = 0L
    Request = ""
    RequestHex = ""
    Response = ""
    Desc = ""
    InnerReferCode = ""
    ReferrerUrl = ""
    PromotionType = ""
    Promotion = ""
    Domainname = 0L
    Agent = 0L }

let PLOG_id = ref 72597L
let PLOG_count = ref 0
let PLOG_table = "Sys_PageLog"

// [Sys_Privilege] (PRIVILEGE)

type privilegeTypeEnum = 
| Default = 0 // 默认
| API = 1 // API访问控制
| Frontend = 2 // 前端
| Backend = 3 // 后端
| Page = 4 // 页面

let privilegeTypeEnums = [| privilegeTypeEnum.Default; privilegeTypeEnum.API; privilegeTypeEnum.Frontend; privilegeTypeEnum.Backend; privilegeTypeEnum.Page |]
let privilegeTypeEnumstrs = [| "privilegeTypeEnum"; "privilegeTypeEnum"; "privilegeTypeEnum"; "privilegeTypeEnum"; "privilegeTypeEnum" |]
let privilegeTypeNum = 5

let int__privilegeTypeEnum v =
    match v with
    | 0 -> Some privilegeTypeEnum.Default
    | 1 -> Some privilegeTypeEnum.API
    | 2 -> Some privilegeTypeEnum.Frontend
    | 3 -> Some privilegeTypeEnum.Backend
    | 4 -> Some privilegeTypeEnum.Page
    | _ -> None

let str__privilegeTypeEnum s =
    match s with
    | "Default" -> Some privilegeTypeEnum.Default
    | "API" -> Some privilegeTypeEnum.API
    | "Frontend" -> Some privilegeTypeEnum.Frontend
    | "Backend" -> Some privilegeTypeEnum.Backend
    | "Page" -> Some privilegeTypeEnum.Page
    | _ -> None

let privilegeTypeEnum__caption e =
    match e with
    | privilegeTypeEnum.Default -> "默认"
    | privilegeTypeEnum.API -> "API访问控制"
    | privilegeTypeEnum.Frontend -> "前端"
    | privilegeTypeEnum.Backend -> "后端"
    | privilegeTypeEnum.Page -> "页面"
    | _ -> ""

type privilegeCatEnum = 
| Default = 0 // 默认
| SYS = 1 // 系统
| CA = 2 // 公共数据
| NFSC = 3 // 新中国联邦
| SCMS = 4 // 社交化内容管理系统
| FI = 5 // 财务

let privilegeCatEnums = [| privilegeCatEnum.Default; privilegeCatEnum.SYS; privilegeCatEnum.CA; privilegeCatEnum.NFSC; privilegeCatEnum.SCMS; privilegeCatEnum.FI |]
let privilegeCatEnumstrs = [| "privilegeCatEnum"; "privilegeCatEnum"; "privilegeCatEnum"; "privilegeCatEnum"; "privilegeCatEnum"; "privilegeCatEnum" |]
let privilegeCatNum = 6

let int__privilegeCatEnum v =
    match v with
    | 0 -> Some privilegeCatEnum.Default
    | 1 -> Some privilegeCatEnum.SYS
    | 2 -> Some privilegeCatEnum.CA
    | 3 -> Some privilegeCatEnum.NFSC
    | 4 -> Some privilegeCatEnum.SCMS
    | 5 -> Some privilegeCatEnum.FI
    | _ -> None

let str__privilegeCatEnum s =
    match s with
    | "Default" -> Some privilegeCatEnum.Default
    | "SYS" -> Some privilegeCatEnum.SYS
    | "CA" -> Some privilegeCatEnum.CA
    | "NFSC" -> Some privilegeCatEnum.NFSC
    | "SCMS" -> Some privilegeCatEnum.SCMS
    | "FI" -> Some privilegeCatEnum.FI
    | _ -> None

let privilegeCatEnum__caption e =
    match e with
    | privilegeCatEnum.Default -> "默认"
    | privilegeCatEnum.SYS -> "系统"
    | privilegeCatEnum.CA -> "公共数据"
    | privilegeCatEnum.NFSC -> "新中国联邦"
    | privilegeCatEnum.SCMS -> "社交化内容管理系统"
    | privilegeCatEnum.FI -> "财务"
    | _ -> ""

type pPRIVILEGE = {
mutable Code: Caption
mutable Caption: Caption
mutable Type: privilegeTypeEnum
mutable Cat: privilegeCatEnum
mutable ApiFullname: Caption
mutable Desc: Text
mutable Scope: FK}


type PRIVILEGE = Rcd<pPRIVILEGE>

let PRIVILEGE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Caption],[Type],[Cat],[ApiFullname],[Desc],[Scope]"

let pPRIVILEGE_fieldordersArray = [|
    "Code"
    "Caption"
    "Type"
    "Cat"
    "ApiFullname"
    "Desc"
    "Scope" |]

let PRIVILEGE_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Caption]=@Caption,[Type]=@Type,[Cat]=@Cat,[ApiFullname]=@ApiFullname,[Desc]=@Desc,[Scope]=@Scope"

let pPRIVILEGE_fields = [|
    Caption("Code", 64)
    Caption("Caption", 256)
    SelectLines("Type", [| ("Default","默认");("API","API访问控制");("Frontend","前端");("Backend","后端");("Page","页面") |])
    SelectLines("Cat", [| ("Default","默认");("SYS","系统");("CA","公共数据");("NFSC","新中国联邦");("SCMS","社交化内容管理系统");("FI","财务") |])
    Caption("ApiFullname", 64)
    Text("Desc")
    FK("Scope") |]

let pPRIVILEGE_empty(): pPRIVILEGE = {
    Code = ""
    Caption = ""
    Type = EnumOfValue 0
    Cat = EnumOfValue 0
    ApiFullname = ""
    Desc = ""
    Scope = 0L }

let PRIVILEGE_id = ref 0L
let PRIVILEGE_count = ref 0
let PRIVILEGE_table = "Sys_Privilege"

// [Sys_Role] (ROLE)

type roleCatEnum = 
| Default = 0 // 默认
| SYS = 1 // 系统
| CA = 2 // 公共数据
| NFSC = 3 // 新中国联邦
| SCMS = 4 // 社交化内容管理系统
| FI = 5 // 财务

let roleCatEnums = [| roleCatEnum.Default; roleCatEnum.SYS; roleCatEnum.CA; roleCatEnum.NFSC; roleCatEnum.SCMS; roleCatEnum.FI |]
let roleCatEnumstrs = [| "roleCatEnum"; "roleCatEnum"; "roleCatEnum"; "roleCatEnum"; "roleCatEnum"; "roleCatEnum" |]
let roleCatNum = 6

let int__roleCatEnum v =
    match v with
    | 0 -> Some roleCatEnum.Default
    | 1 -> Some roleCatEnum.SYS
    | 2 -> Some roleCatEnum.CA
    | 3 -> Some roleCatEnum.NFSC
    | 4 -> Some roleCatEnum.SCMS
    | 5 -> Some roleCatEnum.FI
    | _ -> None

let str__roleCatEnum s =
    match s with
    | "Default" -> Some roleCatEnum.Default
    | "SYS" -> Some roleCatEnum.SYS
    | "CA" -> Some roleCatEnum.CA
    | "NFSC" -> Some roleCatEnum.NFSC
    | "SCMS" -> Some roleCatEnum.SCMS
    | "FI" -> Some roleCatEnum.FI
    | _ -> None

let roleCatEnum__caption e =
    match e with
    | roleCatEnum.Default -> "默认"
    | roleCatEnum.SYS -> "系统"
    | roleCatEnum.CA -> "公共数据"
    | roleCatEnum.NFSC -> "新中国联邦"
    | roleCatEnum.SCMS -> "社交化内容管理系统"
    | roleCatEnum.FI -> "财务"
    | _ -> ""

type pROLE = {
mutable Code: Caption
mutable Inherit: FK
mutable Caption: Caption
mutable Cat: roleCatEnum
mutable Desc: Text}


type ROLE = Rcd<pROLE>

let ROLE_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Code],[Inherit],[Caption],[Cat],[Desc]"

let pROLE_fieldordersArray = [|
    "Code"
    "Inherit"
    "Caption"
    "Cat"
    "Desc" |]

let ROLE_sql_update = "[Updatedat]=@Updatedat,[Code]=@Code,[Inherit]=@Inherit,[Caption]=@Caption,[Cat]=@Cat,[Desc]=@Desc"

let pROLE_fields = [|
    Caption("Code", 64)
    FK("Inherit")
    Caption("Caption", 256)
    SelectLines("Cat", [| ("Default","默认");("SYS","系统");("CA","公共数据");("NFSC","新中国联邦");("SCMS","社交化内容管理系统");("FI","财务") |])
    Text("Desc") |]

let pROLE_empty(): pROLE = {
    Code = ""
    Inherit = 0L
    Caption = ""
    Cat = EnumOfValue 0
    Desc = "" }

let ROLE_id = ref 0L
let ROLE_count = ref 0
let ROLE_table = "Sys_Role"

// [Sys_RoleAssign] (ROLEASSIGN)

type roleassignTypeEnum = 
| Named = 0 // 命名
| WorkflowState = 1 // 工作流状态
| WorkflowTransit = 2 // 工作流转移
| Menu = 3 // 菜单

let roleassignTypeEnums = [| roleassignTypeEnum.Named; roleassignTypeEnum.WorkflowState; roleassignTypeEnum.WorkflowTransit; roleassignTypeEnum.Menu |]
let roleassignTypeEnumstrs = [| "roleassignTypeEnum"; "roleassignTypeEnum"; "roleassignTypeEnum"; "roleassignTypeEnum" |]
let roleassignTypeNum = 4

let int__roleassignTypeEnum v =
    match v with
    | 0 -> Some roleassignTypeEnum.Named
    | 1 -> Some roleassignTypeEnum.WorkflowState
    | 2 -> Some roleassignTypeEnum.WorkflowTransit
    | 3 -> Some roleassignTypeEnum.Menu
    | _ -> None

let str__roleassignTypeEnum s =
    match s with
    | "Named" -> Some roleassignTypeEnum.Named
    | "WorkflowState" -> Some roleassignTypeEnum.WorkflowState
    | "WorkflowTransit" -> Some roleassignTypeEnum.WorkflowTransit
    | "Menu" -> Some roleassignTypeEnum.Menu
    | _ -> None

let roleassignTypeEnum__caption e =
    match e with
    | roleassignTypeEnum.Named -> "命名"
    | roleassignTypeEnum.WorkflowState -> "工作流状态"
    | roleassignTypeEnum.WorkflowTransit -> "工作流转移"
    | roleassignTypeEnum.Menu -> "菜单"
    | _ -> ""

type pROLEASSIGN = {
mutable Role: FK
mutable Type: roleassignTypeEnum
mutable Privilege: FK
mutable Workflow: FK
mutable WorkflowTransit: FK
mutable WorkflowState: Integer
mutable Desc: Text
mutable Profile: Text}


type ROLEASSIGN = Rcd<pROLEASSIGN>

let ROLEASSIGN_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[Role],[Type],[Privilege],[Workflow],[WorkflowTransit],[WorkflowState],[Desc],[Profile]"

let pROLEASSIGN_fieldordersArray = [|
    "Role"
    "Type"
    "Privilege"
    "Workflow"
    "WorkflowTransit"
    "WorkflowState"
    "Desc"
    "Profile" |]

let ROLEASSIGN_sql_update = "[Updatedat]=@Updatedat,[Role]=@Role,[Type]=@Type,[Privilege]=@Privilege,[Workflow]=@Workflow,[WorkflowTransit]=@WorkflowTransit,[WorkflowState]=@WorkflowState,[Desc]=@Desc,[Profile]=@Profile"

let pROLEASSIGN_fields = [|
    FK("Role")
    SelectLines("Type", [| ("Named","命名");("WorkflowState","工作流状态");("WorkflowTransit","工作流转移");("Menu","菜单") |])
    FK("Privilege")
    FK("Workflow")
    FK("WorkflowTransit")
    Integer("WorkflowState")
    Text("Desc")
    Text("Profile") |]

let pROLEASSIGN_empty(): pROLEASSIGN = {
    Role = 0L
    Type = EnumOfValue 0
    Privilege = 0L
    Workflow = 0L
    WorkflowTransit = 0L
    WorkflowState = 0L
    Desc = ""
    Profile = "" }

let ROLEASSIGN_id = ref 0L
let ROLEASSIGN_count = ref 0
let ROLEASSIGN_table = "Sys_RoleAssign"

// [Sys_SignLog] (SLOG)

type slogAgentEnum = 
| Sys = 0 // 系统
| Web = 1 // 网页
| Android = 2 // 安卓
| iOS = 3 // iOS

let slogAgentEnums = [| slogAgentEnum.Sys; slogAgentEnum.Web; slogAgentEnum.Android; slogAgentEnum.iOS |]
let slogAgentEnumstrs = [| "slogAgentEnum"; "slogAgentEnum"; "slogAgentEnum"; "slogAgentEnum" |]
let slogAgentNum = 4

let int__slogAgentEnum v =
    match v with
    | 0 -> Some slogAgentEnum.Sys
    | 1 -> Some slogAgentEnum.Web
    | 2 -> Some slogAgentEnum.Android
    | 3 -> Some slogAgentEnum.iOS
    | _ -> None

let str__slogAgentEnum s =
    match s with
    | "Sys" -> Some slogAgentEnum.Sys
    | "Web" -> Some slogAgentEnum.Web
    | "Android" -> Some slogAgentEnum.Android
    | "iOS" -> Some slogAgentEnum.iOS
    | _ -> None

let slogAgentEnum__caption e =
    match e with
    | slogAgentEnum.Sys -> "系统"
    | slogAgentEnum.Web -> "网页"
    | slogAgentEnum.Android -> "安卓"
    | slogAgentEnum.iOS -> "iOS"
    | _ -> ""

type slogActEnum = 
| SignIn = 0 // 登录
| SignOut = 1 // 登出
| ExpiredCheckpoint = 2 // 自检超时
| ExpiredIncoming = 3 // 访问超时
| UnknowCookie = 4 // 未知Cookie
| AcctSignIn = 5 // 账户切换

let slogActEnums = [| slogActEnum.SignIn; slogActEnum.SignOut; slogActEnum.ExpiredCheckpoint; slogActEnum.ExpiredIncoming; slogActEnum.UnknowCookie; slogActEnum.AcctSignIn |]
let slogActEnumstrs = [| "slogActEnum"; "slogActEnum"; "slogActEnum"; "slogActEnum"; "slogActEnum"; "slogActEnum" |]
let slogActNum = 6

let int__slogActEnum v =
    match v with
    | 0 -> Some slogActEnum.SignIn
    | 1 -> Some slogActEnum.SignOut
    | 2 -> Some slogActEnum.ExpiredCheckpoint
    | 3 -> Some slogActEnum.ExpiredIncoming
    | 4 -> Some slogActEnum.UnknowCookie
    | 5 -> Some slogActEnum.AcctSignIn
    | _ -> None

let str__slogActEnum s =
    match s with
    | "SignIn" -> Some slogActEnum.SignIn
    | "SignOut" -> Some slogActEnum.SignOut
    | "ExpiredCheckpoint" -> Some slogActEnum.ExpiredCheckpoint
    | "ExpiredIncoming" -> Some slogActEnum.ExpiredIncoming
    | "UnknowCookie" -> Some slogActEnum.UnknowCookie
    | "AcctSignIn" -> Some slogActEnum.AcctSignIn
    | _ -> None

let slogActEnum__caption e =
    match e with
    | slogActEnum.SignIn -> "登录"
    | slogActEnum.SignOut -> "登出"
    | slogActEnum.ExpiredCheckpoint -> "自检超时"
    | slogActEnum.ExpiredIncoming -> "访问超时"
    | slogActEnum.UnknowCookie -> "未知Cookie"
    | slogActEnum.AcctSignIn -> "账户切换"
    | _ -> ""

type pSLOG = {
mutable EU: FK
mutable IP: Chars
mutable Lng: Float
mutable Lat: Float
mutable City: Text
mutable Country: FK
mutable CookieIn: Chars
mutable CookieOut: Chars
mutable Agent: slogAgentEnum
mutable Act: slogActEnum
mutable WebCrential: FK
mutable Biz: FK
mutable SessionCount: Integer
mutable Desc: Text}


type SLOG = Rcd<pSLOG>

let SLOG_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[EU],[IP],[Lng],[Lat],[City],[Country],[CookieIn],[CookieOut],[Agent],[Act],[WebCrential],[Biz],[SessionCount],[Desc]"

let pSLOG_fieldordersArray = [|
    "EU"
    "IP"
    "Lng"
    "Lat"
    "City"
    "Country"
    "CookieIn"
    "CookieOut"
    "Agent"
    "Act"
    "WebCrential"
    "Biz"
    "SessionCount"
    "Desc" |]

let SLOG_sql_update = "[Updatedat]=@Updatedat,[EU]=@EU,[IP]=@IP,[Lng]=@Lng,[Lat]=@Lat,[City]=@City,[Country]=@Country,[CookieIn]=@CookieIn,[CookieOut]=@CookieOut,[Agent]=@Agent,[Act]=@Act,[WebCrential]=@WebCrential,[Biz]=@Biz,[SessionCount]=@SessionCount,[Desc]=@Desc"

let pSLOG_fields = [|
    FK("EU")
    Chars("IP", 64)
    Float("Lng")
    Float("Lat")
    Text("City")
    FK("Country")
    Chars("CookieIn", 64)
    Chars("CookieOut", 64)
    SelectLines("Agent", [| ("Sys","系统");("Web","网页");("Android","安卓");("iOS","iOS") |])
    SelectLines("Act", [| ("SignIn","登录");("SignOut","登出");("ExpiredCheckpoint","自检超时");("ExpiredIncoming","访问超时");("UnknowCookie","未知Cookie");("AcctSignIn","账户切换") |])
    FK("WebCrential")
    FK("Biz")
    Integer("SessionCount")
    Text("Desc") |]

let pSLOG_empty(): pSLOG = {
    EU = 0L
    IP = ""
    Lng = 0.0
    Lat = 0.0
    City = ""
    Country = 0L
    CookieIn = ""
    CookieOut = ""
    Agent = EnumOfValue 0
    Act = EnumOfValue 0
    WebCrential = 0L
    Biz = 0L
    SessionCount = 0L
    Desc = "" }

let SLOG_id = ref 0L
let SLOG_count = ref 0
let SLOG_table = "Sys_SignLog"

// [Sys_TinyLink] (TINYLINK)

type pTINYLINK = {
mutable TinyLink: Caption
mutable OriginalLink: Caption
mutable Eu: FK}


type TINYLINK = Rcd<pTINYLINK>

let TINYLINK_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[TinyLink],[OriginalLink],[Eu]"

let pTINYLINK_fieldordersArray = [|
    "TinyLink"
    "OriginalLink"
    "Eu" |]

let TINYLINK_sql_update = "[Updatedat]=@Updatedat,[TinyLink]=@TinyLink,[OriginalLink]=@OriginalLink,[Eu]=@Eu"

let pTINYLINK_fields = [|
    Caption("TinyLink", 7)
    Caption("OriginalLink", 256)
    FK("Eu") |]

let pTINYLINK_empty(): pTINYLINK = {
    TinyLink = ""
    OriginalLink = ""
    Eu = 0L }

let TINYLINK_id = ref 0L
let TINYLINK_count = ref 0
let TINYLINK_table = "Sys_TinyLink"

// [Sys_TinyLinkTracking] (LINKTRACK)

type linktrackBindTypeEnum = 
| Undefined = 0 // 未定义
| Moment = 1 // 动态
| Comment = 2 // 评论

let linktrackBindTypeEnums = [| linktrackBindTypeEnum.Undefined; linktrackBindTypeEnum.Moment; linktrackBindTypeEnum.Comment |]
let linktrackBindTypeEnumstrs = [| "linktrackBindTypeEnum"; "linktrackBindTypeEnum"; "linktrackBindTypeEnum" |]
let linktrackBindTypeNum = 3

let int__linktrackBindTypeEnum v =
    match v with
    | 0 -> Some linktrackBindTypeEnum.Undefined
    | 1 -> Some linktrackBindTypeEnum.Moment
    | 2 -> Some linktrackBindTypeEnum.Comment
    | _ -> None

let str__linktrackBindTypeEnum s =
    match s with
    | "Undefined" -> Some linktrackBindTypeEnum.Undefined
    | "Moment" -> Some linktrackBindTypeEnum.Moment
    | "Comment" -> Some linktrackBindTypeEnum.Comment
    | _ -> None

let linktrackBindTypeEnum__caption e =
    match e with
    | linktrackBindTypeEnum.Undefined -> "未定义"
    | linktrackBindTypeEnum.Moment -> "动态"
    | linktrackBindTypeEnum.Comment -> "评论"
    | _ -> ""

type pLINKTRACK = {
mutable App: Caption
mutable Biz: FK
mutable EndUser: FK
mutable Bind: Integer
mutable BindType: linktrackBindTypeEnum
mutable Visitor: FK
mutable VisitorApp: Caption
mutable ShortLink: Caption
mutable ReferrerUrl: Text
mutable InnerRefCode: Caption
mutable PromotionType: Caption
mutable Promotion: Caption}


type LINKTRACK = Rcd<pLINKTRACK>

let LINKTRACK_fieldorders = "[ID],[Createdat],[Updatedat],[Sort],[App],[Biz],[EndUser],[Bind],[BindType],[Visitor],[VisitorApp],[ShortLink],[ReferrerUrl],[InnerRefCode],[PromotionType],[Promotion]"

let pLINKTRACK_fieldordersArray = [|
    "App"
    "Biz"
    "EndUser"
    "Bind"
    "BindType"
    "Visitor"
    "VisitorApp"
    "ShortLink"
    "ReferrerUrl"
    "InnerRefCode"
    "PromotionType"
    "Promotion" |]

let LINKTRACK_sql_update = "[Updatedat]=@Updatedat,[App]=@App,[Biz]=@Biz,[EndUser]=@EndUser,[Bind]=@Bind,[BindType]=@BindType,[Visitor]=@Visitor,[VisitorApp]=@VisitorApp,[ShortLink]=@ShortLink,[ReferrerUrl]=@ReferrerUrl,[InnerRefCode]=@InnerRefCode,[PromotionType]=@PromotionType,[Promotion]=@Promotion"

let pLINKTRACK_fields = [|
    Caption("App", 64)
    FK("Biz")
    FK("EndUser")
    Integer("Bind")
    SelectLines("BindType", [| ("Undefined","未定义");("Moment","动态");("Comment","评论") |])
    FK("Visitor")
    Caption("VisitorApp", 64)
    Caption("ShortLink", 64)
    Text("ReferrerUrl")
    Caption("InnerRefCode", 64)
    Caption("PromotionType", 256)
    Caption("Promotion", 256) |]

let pLINKTRACK_empty(): pLINKTRACK = {
    App = ""
    Biz = 0L
    EndUser = 0L
    Bind = 0L
    BindType = EnumOfValue 0
    Visitor = 0L
    VisitorApp = ""
    ShortLink = ""
    ReferrerUrl = ""
    InnerRefCode = ""
    PromotionType = ""
    Promotion = "" }

let LINKTRACK_id = ref 0L
let LINKTRACK_count = ref 0
let LINKTRACK_table = "Sys_TinyLinkTracking"
