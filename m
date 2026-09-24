Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2D47FAE8;
	Thu, 24 Sep 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246686; cv=none; b=WuhFT37WcLB/TMMK+EBV3rycnrvQXQ4cuSQJmX6yWFii5koScbpcrpEsc4sBg5+xOksRtSk/h67nv8x/tr5dml3nN71YZRSlM6Gk4IErz1CG6WRhYFdYEPGtWy+mLWnRYUL5xNbVn/1ShBDwkepd9fNjDE5UHFqbK3C6X9LPxww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246686; c=relaxed/simple;
	bh=CQvwkh5BoBqOptC3jmeHHr75AY7Ra5g3ZWNC1CyfAPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rNIdm++/3uSvrVSx88p4ILQ+SLsLeUlFSnGpo7VSpGx6RgDmerwog9Vkgc7+vxvs6FMuPvFwbj4t4NT5HOZFzjWcPUV/vAAgg8KQk7Ph0XBlCPEiW3IwSXxobdeWLwIRjIpjXPYBg0ZSw+KctSL7otBkWQ8Yx2EUgmqk7PFLp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=dle3YnZ+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D3fAX2wf; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="dle3YnZ+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D3fAX2wf"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2A7357A00AD;
	Thu, 24 Sep 2026 06:44:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Thu, 24 Sep 2026 06:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1790246682; x=
	1790333082; bh=2pYdRHz16MeVkko3MZGz6tzvnD2/4VNwL82lLyG4YqY=; b=d
	le3YnZ+RjDgnJMmSgj6mQJD33q+GZMF6YnLVrMCRuFpnGnGD+HhvkB7xTt1/RHId
	6wYFYAiJr4NST8Qt8bfok0JnG3teovdHL35fyg/ZCGd06ytmL3ik8c/CU7XOFUNU
	vxJCJQu2+ainCTEPInBekBX0tiHvkJcYROlDTgZumoPksYDMEKfgoJ9NoeKWYbil
	0xbT0MTjhf3Os6vZ4Q9D+cokV+tfy6/v+3pvQ4jLNb1l4fMutOQvuu4CM6d/efzm
	n1niAruNnZ84R90rZzqraNBPBWv77VRXwJqi4kMCEVGUSPmKNFZ/GHjjLKbUb6sS
	W9JLTvN4T1EY1mveSLenA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790246682; x=1790333082; bh=2pYdRHz16MeVkko3MZGz6tzvnD2/4VNwL82
	lLyG4YqY=; b=D3fAX2wfMVGIPKQIL79/QGbDv4q5KG82YDhSAw9+Wok/VHf6v7e
	irWil+KhRiEccnB7AF+2lEab+W5JNGmL5BR61s1Xl4Ao+0liDTbudL/+eHFEPDFZ
	wwmhaGjpFGjyTd0AUDxVP9a2AWGMOkkVXYreu0N3f6gQm4ZFMsMc9h2seWJf/wVd
	38YB0uEXgSGtAJtYWxKHSUhsFdFegetzeNtIgnd1SoPxPqc++ftKlVzpbCFm3Ifz
	4HZYCpNDiaOBXtGYlJXKaoLMI66wFC8N1kRRyVb+Jqq5KO9TutaH375jy/wDT+9K
	1E0bLG/wo4Hs7u85VFnShQlMwVhpsg+bNjA==
X-ME-Sender: <xms:GP-0anR3IgnZGmF7SBC4-vnZwju-GFg8loFUNg6DfGf26dDq1Romrg>
    <xme:GP-0akvTM9stM5qvprPjxarLjm16-9G4_fvpDQbdCBsDvcWy9aoLsaIhp4cD98Co3
    BDmyFSdf8lV_T8HtqTMG3PgmPB-SLCWxoMufi8IUM9uwwTv1EJVeRom>
X-ME-Received: <xmr:GP-0ai_163r4KNfrBPwoLaWMfEERLL0eZ1WRx2cAFMfus1mp0pOrJiJ58tbD>
X-ME-Proxy-Cause: dmFkZTGJMECWZhmiH3U0xi2HTX13DSCC2vekGqn1EXXXdBRS9zoHf3nJFjAr4qzg933TeX
    ReNQueoOdiZFep1TXS6JC+dNuykmciug+Zsi7xUl0RyAwWv57uh/yQRUKiQTONsBIik00O
    0CRz5slM/U7uMWOEQEd530APzHAPynAwfuKRwugds5+oZl1RTEKDQebSJ933W/ey6HFkvu
    RUJ1fcspTYSEA5aZ94x0pisGJlBYoKAWDWgVhzh5krjleFkiKWZs/aKXhl0X6LkxGEGxoa
    9ZW/aPKqkSp9QcCXqyAB59VRAieDxcNQ/dEtBWjXZBjDRAVzj4zJP6OSTZCeTDD1TB5kaf
    lqjbbIVdupI9uGajAu/LhvanwZ7XX3UuNQKLvRFbDx6G9Gxa+z404xty/ZxAd1d2gYILyc
    y60hcRnSylKmx71R0vosbkm7w1EwCnnvgUrmFE+kI9qeSVw8hOCCTGJnZkeB6s/S4txWkh
    sieNraLhrOC+dgQRnPEh1TsElx7cVh7NCki6LttofyEgWzmlrnLnZb5G2crwoPfPV8rXfg
    yPIGCBuqCCOJkhjsAO4ymdKevsQvluHYrGnyja9xxRE7Bi3Zta9AK0dqRW/TqdPX06DGhW
    MLjbajFadZ5jYYpTz46rXoHVj+o1URS4hL5Jf13x6u+rqVBZpDjnmcNrRBtQ
X-ME-Proxy: <xmx:GP-0atZ3uUBNZlh_eEnGWwI-p_pVOSIioq8i1k00NcGSeUzemFkIkw>
    <xmx:GP-0aur8qUqAglKpNMlhnjCOyZPGvu3_M0RQye6injjCzBiWawqvAQ>
    <xmx:GP-0alaHezSp6M7P3EkC-N0R1eb4Z7DV_uRew-2Bdy_LYkAJgpgk-Q>
    <xmx:GP-0ah4DF_a5CO5AkPE1yjn-9PcuIb4jSLLhYYE8YueALIQAbBNOFQ>
    <xmx:Gv-0ahgNGTIL4ejuZXuSQDd0pwYZMDzNGqzgQIxvUk-NW6wAiT8cDM3j>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 06:44:39 -0400 (EDT)
Date: Thu, 24 Sep 2026 12:44:38 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Antony Antony <antony.antony@secunet.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Jamal Hadi Salim <hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Yan Yan <evitayan@google.com>,
	Tobias Brunner <tobias@strongswan.org>,
	Florian Westphal <fw@strlen.de>, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH ipsec v2 1/6] xfrm: state: exact mark/mask match for
 SPI-keyed control-plane SA lookups
Message-ID: <arTzfowpbZXFIBGx@krikkit>
References: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
 <migrate-state-fixes-v2-1-c3e2767f0d96@secunet.com>
 <arEw6qLcr_YEI8Wl@krikkit>
 <arGTH94PM_oswTpF@bern>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arGTH94PM_oswTpF@bern>

(sorry, this got caught by my mail provider's spam filter so I only
saw it today)

2026-09-21, 22:27:11 +0200, root wrote:
> On Mon, Sep 21, 2026 at 03:28:10PM +0200, Sabrina Dubroca wrote:
> > 2026-09-08, 08:48:45 +0200, Antony Antony wrote:
> > > Add __xfrm_state_lookup_exact(); wire it into DELSA/GETSA
> > 
> > On the "other proto" branch of xfrm_user_state_lookup(), we call
> > xfrm_state_lookup_byaddr() -> __xfrm_state_lookup_byaddr(), which
> > still does a "loose" mark match:
> > 
> > 		if ((mark & x->mark.m) != x->mark.v)
> > 			continue;
> > 
> > Is that ok?
> 
> I think so. I felt byaddr is not used and aslo since there is no unique spi
> if touch it dragons may wake up:) most used cases with SPI.

Ok.

> > That's the only thing I've noticed in the series.
> > 
> > 
> > I guess someone could claim that this patch changes behavior, but if a
> > user somewhere notices it, I think that would mean they were relying
> > on insertion order to delete/etc the right SA.
> 
> yes that is a risk. I tried find use cases and got nowhere. 
> And concluded it was an oversight. Also note the
> cover letter, "policy" had similar change a while ago.
> No one complained yet?

Yeah, I agree. Just maybe worth mentioning briefly in the commit
message, and adding a reference the policy patch.

-- 
Sabrina
