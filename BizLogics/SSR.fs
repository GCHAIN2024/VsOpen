﻿module BizLogics.SSR

open System
open System.Text

open Util.Cat
open Util.Text
open Util.Json
open Util.Http
open Util.HttpServer

open UtilWebServer.Common
open UtilWebServer.Db
open UtilWebServer.Api
open UtilWebServer.Json
open UtilWebServer.SSR

open Shared.OrmTypes
open Shared.OrmMor
open Shared.Types
open Shared.CustomMor

open BizLogics.Common
open BizLogics.TinyLink
open BizLogics.Auth
open BizLogics.Branch


let hash1,hash2 = 
    runtime.host.fsDir + "\\" + runtime.host.defaultHtml
    |> vueIndexFile__hashes

let homePageNoscript = 
    """
  <div class="layout-banner">
    <div class="heading">
      GCHAIN is a revolutionary way to promote websites through a hierarchical referral program. 
    </div>
  </div>

  <div class="layout-body">
    <img class="logo" src="https://i.imgur.com/XpzVLGu.png" />
    <div>The concept</div>
    <img src="https://i.imgur.com/N3MaARt.jpg" />
  </div>

  <h1 id="link-1">GCHA.IN: Not just the Promotion Code, but the Promotion CHAIN.</h1>
  <p>GCHA.IN offers an innovative approach to website promotion using a multi-level referral system.</p>
  <p>By employing a structured, hierarchical referral program, it motivates users to invite others, who then invite
    more users, fostering exponential growth. </p>
  <p>This creates a cascading network of referrals, driving traffic and engagement across multiple tiers.</p>
  <h3 id="link-8">Website Integration for Business Owners:</h3>
  <p>As a website owner, you can integrate our service by embedding a simple JavaScript code. This allows your website
    users to share content via a sharing panel, similar to sharing through Google, Facebook, or Twitter.</p>
  <h3 id="link-11">Unique Sharing Mechanism</h3>
  <p>Our platform differs from traditional social media. When users click the "Share via GCHAIN" button, the request
    is directed to our platform. We verify if the user is a registered active promoter, then generate a unique
    promotional hyperlink. This link contains both your website's content information and the promoter's details.
    Users can then share this hyperlink on other social media or send it directly to friends.</p>
  <h3 id="link-14">For Influencers</h3>
  <p>If you're an influencer (e.g., a YouTuber) without technical control over your platform, you can still use our
    service. Simply copy the link you want to promote or use our browser extension. Once you have the target URL,
    follow the same sharing procedure by forwarding it to the GCHAIN platform.</p>
  <h3 id="link-17">Referral Tracking and Commissions</h3>
  <p>Our platform automatically tracks referral relationships. When you introduce a new promoter, who then introduces
    another, and so on, we record this chain. If a promoter in your network shares a hyperlink that leads to a
    recorded content consumption or e-commerce purchase, contributing value to the business website, that website
    provides commission information to our platform. This commission is then automatically distributed proportionally
    through the referral hierarchy. </p>
  <h3 id="link-20">Passive Income Potential</h3>
  <p>As an effective promoter with numerous downstream promoters, their performance contributes proportionally to
    yours. This system allows you to earn passive income based on your network's overall performance.</p>
</div>
    """

let ssrPageHome = {
    title = "GCHA.IN"
    desc = "GCHAIN is a revolutionary way to promote websites through a hierarchical referral program."
    image = "https://i.imgur.com/N3MaARt.jpg"
    url = runtime.host.url
    noscript = homePageNoscript }

let openJavaScript = 
    """
    var body = document.getelementbyid("body");
    // dom出来自己的一个div。 <div id="panel"></div>
    //然后直接dom进去一段css。<style />
    var panel = document.getelementbyid("panel");

    """

let r1 = string__regex @"\w+"


//  https://cha.in/t/a1Bz7wS
let hTinyLink req = 
    let m = 
        req.pathline.Substring 3
        |> regex_match r1

    if m.Length > 5 then
        if runtime.data.tiny__full.ContainsKey m then
            let hashFull = runtime.data.tiny__full[m]
            let clink = runtime.data.hashFull__clinks[hashFull]

            let p = 
                let p =  pCLOG_empty()
                p.Clink <- clink.ID
                p.HashTiny <- clink.p.HashTiny
                p

            p__createRcd p CLOG_metadata "BizLogics.SSR.hTinyLink" conn
            |> ignore

            let forward = false

            if forward then
                [|  
                    "HTTP/1.1 302 Found"
                    "Location: " + clink.p.Src
                    "Content-Length: 0"
                    "Date: Mon, 17 Jun 2024 12:00:00 GMT"
                    "Connection: close"
                    "" |]
                |> String.concat crlf
                |> Encoding.UTF8.GetBytes
            else
                clink
                |> clink__ssrPage
                |> render (hash1,hash2)
                |> bin__StandardResponse "text/html"
        else

            {
                title = "GCHAIN Crypto Link"
                desc = ""
                image = ""
                url = ""
                noscript = "" }
            |> render (hash1,hash2)
            |> bin__StandardResponse "text/html"

            //rep404
    else
        rep404

let echo req = 

    let h1 x = 
        let req = x.req
        if req.pathline.StartsWith "/gchain" then
            req.pathline <- req.pathline.Substring "/gchain".Length
        Suc x

    let h2 x = 
        let req = x.req
        if req.pathline = "/open.js" then
            x.rep <-
                openJavaScript
                |> str__StandardResponse "text/javascript"
                |> Some
            Suc x
        else
            Fail((),x)

    match 
        { req = req; rep = None}
        |> Suc
        |> bind h1
        |> bind h2
        |> bindFail (hHomepage (fun _ -> ssrPageHome |> render(hash1,hash2) ""))
        |> bindFail (hpattern "/t/" hTinyLink)
        |> bindFail (hapi echoApiHandler branch) with
    | Suc x -> x.rep
    | Fail(x,e) -> None

