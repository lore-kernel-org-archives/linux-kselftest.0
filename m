Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4049E5D1;
	Mon, 21 Sep 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997300; cv=none; b=c7zzfiso0I1zsdaPuMoGn11oFnSJbg+O3f5Bln4tjf9UXWeW6u8LDSPLDrJdiEJjHod9k/1FEY97zVymzlJXbk24dBchn+Op6svYAsalTf5dG3nOeT4jbKOGk13oMNjxk7YlcvoBX3GAUhqRgXRl1OxCaxZPD1Na05nAdOVPN8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997300; c=relaxed/simple;
	bh=RW1YGZxqMA3BxKR446eKkO2tWZu1/Rk80FrvOSqtuwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQhf2oQTBfP9j/dkxYVF1giE6nN9dkIysVypFu4zPVM12MgwK1IKVAqBle09niLVqr2Fim3Priela0KhtKjt90voAlZD+VaLZ0GPBCRd1xHIx+aq6r6v8RqkZL0Br/cyEFg8cDnYNhsyNdg5jQl4Ycw+EwQwjK+KBBQTf5epH8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=MTw/8iKc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uPs8+tiq; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="MTw/8iKc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uPs8+tiq"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 71E0F7A0096;
	Mon, 21 Sep 2026 09:28:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 21 Sep 2026 09:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789997295; x=
	1790083695; bh=8zCf3uv1kJ23BTMvsNoYWXAI30eiZ3fDTG960OnbLqM=; b=M
	Tw/8iKcZxC8dUon+ZEGCiMLBOrpAwOXuYxFuSNzq7d6X0JEmi3Dnm0/IUXjUbRa+
	D8mS6wO7fLj67pjy9G+ciagL7BAI2OSNJC4a8tJEpGQS1cJ34m959UeOZQwGQd3Q
	3W+EkBWFCnLXPJYEjuWFGkigdsyC4kXv1RF/wFhDSwrp7llCuuVN3TlKkk84GQcE
	375IpUpYW3t5/CEaYpcFH6XeWmnkooT7qqzMIBFZJvH6Q4b8/Zl0Ynms+3Fey5s/
	yJr6iWGg+TdTDJN3tQ0imeaXaPB6hLOmLhT5JN5Z8JEcwN0qXNYrH1RThPVnKedf
	rqdfSQRfNAXF8hGsaqt/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789997295; x=1790083695; bh=8zCf3uv1kJ23BTMvsNoYWXAI30eiZ3fDTG9
	60OnbLqM=; b=uPs8+tiqvfYIQiqAJjQxADq5jt9/mCuMTGuNs70LUpLQ6oEicox
	R9wmK5Kg0gQsJVM63ASIxBjJgOYEsr6pr0W2AchyA1jAH8Ek+mscncGrYcnhfRC+
	QqEVlCwF/nAQbuxvwtf5Sz8LS8Kf3ISXFWQLbydI5+Ere2V8JZcfMaIzs8CqeUqG
	TSCv7ZBE8cFCpAd3VBGsJA8RpwOOproHVVqcbp4hdUBc4UWWH6KMIfLUTdX5oI9o
	Adft36v+eX+ewDfOKtc2CLJuXgj0BDmFr0b2fXK6iZs7zsxBWIzTPsUZYN3LLSmE
	pNPHKn2R0P28opKA4ysRXWiEpGwB96n2a3Q==
X-ME-Sender: <xms:7TCxakGnnyR868M28J0Q8yDknP0MJBSGQoTQVjkVV1h2DBlgpCaNYw>
    <xme:7TCxapRbb9-ErT-jwPItv1UXeUQD2fm66bVh-efol-IGqtjVY0sY1CkQt0pRZn-cu
    9BJLlNcqysHAIaPcYCW6gNdl5TiFhD5qm1uss6JG0FalnnISUT9blNc>
X-ME-Received: <xmr:7TCxakSSAraQKK5v_HyjS9SypoLFf5CoJYjtxHv_hdohrKZhuj9Yu4ulfOSO>
X-ME-Proxy-Cause: dmFkZTFJi6X8EXtz6VuhlJYgHc0myd9tNUnMA08kKDryRyNf1uHvqKyJi3Um+fcoVX+75J
    /Cp0sZB9NL40w+Ke2Qu0F1HY5SYioNVZXF2t/S+8eQfjeJlEm0RvS1IEGwfE7JvITfUbY8
    l4XH+zHLnLGvlMO6GvTbptotkuz/lxIytYj4iaW7Dw0eAq0JLxk1l3HMBl1NBKj6bkl8RZ
    13FDI+XgzKLOVpMAJCF3+Rj2VGzaW26t4guX5tlMt1IxsB/E2gSpIPJhjqmg5Hkz2Bw3ob
    +1r0/Igp/z6EetmtURRnvjQHACTqQ+ysSdaYgSjzB1G/tRs1BmNC44MFZcHsLvzPhb/WNP
    +c6EsaxdIAwunDBAIDWwUdBG5c9VRGwDbZg8qgehuYD9AOCXSa4G/9uCHPnOG0CdG3KH1e
    aQ9x+O1xKpRYo3iIEpxJSyr5bPkSIPuPz04RKTt0kkpZQvnn9EJhnC1deb4KrHR3gNVkGC
    116eBKfpa7FkO/qG0mD8Z2kNyxfIl2VtSZ8biDPBfb6G6in6d5RLOLBsgg7xg4M/vEVQje
    SSFvH+6awbX0rc5+AHBgGimkC7oZTXBOb6Y4RHF2ROi+5EtO5VaU3g1fZDCL3FGSjdTR2C
    3s5ZS4K934v9o0CfBTX1zmeUbSRU5PIhG8Zrdaqpo1vE35KrleyNsKFy/JIw
X-ME-Proxy: <xmx:7TCxasc317_wRhp3LeS3gnpj-RlPNvjrcAAixdyJoK0cVmL9muNxZQ>
    <xmx:7TCxaoc88xRcLy3kBDrDUksGJGOUi8mkpOKc4HEwBFqlGWB25pfFEA>
    <xmx:7TCxai-rju-xkhWqP5W2U30TTQBpex5GAw_RHoQ8Dd21lmcVf79DnA>
    <xmx:7TCxaoM8fgldCcLLyrXxDesV6_APuAD2AGPuv58q22G9I-RnJILfKQ>
    <xmx:7zCxaumV56FVrtN9ib1bLqTyoj518VHDBnIT2F1OmzzhSzrbHMklrc8w>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 09:28:12 -0400 (EDT)
Date: Mon, 21 Sep 2026 15:28:10 +0200
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
Message-ID: <arEw6qLcr_YEI8Wl@krikkit>
References: <migrate-state-fixes-v2-0-c3e2767f0d96@secunet.com>
 <migrate-state-fixes-v2-1-c3e2767f0d96@secunet.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <migrate-state-fixes-v2-1-c3e2767f0d96@secunet.com>

2026-09-08, 08:48:45 +0200, Antony Antony wrote:
> Add __xfrm_state_lookup_exact(); wire it into DELSA/GETSA

On the "other proto" branch of xfrm_user_state_lookup(), we call
xfrm_state_lookup_byaddr() -> __xfrm_state_lookup_byaddr(), which
still does a "loose" mark match:

		if ((mark & x->mark.m) != x->mark.v)
			continue;

Is that ok?
That's the only thing I've noticed in the series.


I guess someone could claim that this patch changes behavior, but if a
user somewhere notices it, I think that would mean they were relying
on insertion order to delete/etc the right SA.

-- 
Sabrina
