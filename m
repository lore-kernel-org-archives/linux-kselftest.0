Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D102571DA;
	Wed,  8 Apr 2026 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686595; cv=none; b=AYzt2fwDn2TeM6PIUXF8e3WOKanbXmDQvEwUdU2Q6WRcyiSikn9TLW6/paWlRB/NKFPoYV1f5rbHc1z2eFNLpCGY7tlgL/47oDsmXoRqwtAY29wPLDyQjzIMXcWOnv+ohjTBv/40C+rG4LMck4Bo/JWbxX978gi0BI98Y9qWqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686595; c=relaxed/simple;
	bh=0+J3IYB3aNodRqQVrRrJt+Pdsn3mtQGDNDYqyNOjiOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPnUFWwR1lLfikzupbB0HbD2GhlQ29cFjFM1iXASiI2silfrSW3KQ57SwWtUfNVVTZIrqzK/uyDocBkA/mgIFiVNdaDFuWd1EV2OndkvLihphwrd8ns3pKeTh+eM0Tq2u78o+KULmj6sNu+hLtruKaFOd2mpzq5dzbpPUyt4tIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=AXHs5g+Z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RM8lr8NW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="AXHs5g+Z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RM8lr8NW"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 118D87A0182;
	Wed,  8 Apr 2026 18:16:30 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 08 Apr 2026 18:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1775686590; x=
	1775772990; bh=/+eD3ldF3JTu1CTwAC7ReNDh4/mqbvqHSFGL+a+6e6A=; b=A
	XHs5g+Z4dxlpvq+uwM7JQDKqjjAbLWzjE04lotYPgwxhmdNVMKU7PcelbkqVK7AG
	V5TOaMbbOlZi1c25YEYLT+hyfqJuog0bjO3Th4eTXSh25GxjtQyCCU3sGN0PiN06
	yLlLVCO9b5WqWHQGIuC08QS5QTp+Ez3Ab7h+oKOznfPDL49NH2KXcDET4tVTaGcx
	l2z81W609kBmfs6sQ+p6PtVk9er7NNYFuIQW17BvRWicWgv1a7HM1OlTBNWtCVT7
	p2Y4Uxw6QgFuxTXcAepV3tw8mUQTimJTUyP6v0wgZtPtZDXJ94qXEQ/9cZkmPLXM
	J76X1VbzcUe81DSXcHU8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775686590; x=1775772990; bh=/+eD3ldF3JTu1CTwAC7ReNDh4/mqbvqHSFG
	L+a+6e6A=; b=RM8lr8NWI89vQrS+5RyZBlQ45wdoOesPg5l40DuIqgJlJMtjB7W
	PQ8lCTKHHOeXaTWr2eBS75pxzDeFALoiY//bXUpiZguIn4rVovbOgZZ7CWTFQ34S
	lIkHJTE4UHxKGUUczMrH6gCYI/3RQ1DmNREf2yP43tvmHQKlo8fH/VhaNgMm6JJJ
	1I6GsdxY+v5wkm9ZUx6GFgUht6SIABbd+ra7hzbiHZ87i0JwFmnJhY4jSOV9qEeJ
	CfzE4pC2OzQkYtgIySURlAqwkFWGQgccccO/lWvvwo8YuQmxmH/35i9RGW1e18rK
	UfLJ/OIixliPq9J/cYk/XdloXbiJW/IVezQ==
X-ME-Sender: <xms:vtPWaQORkyJKIcNi896dLzmZgojFPuQN43cU_XdKGys21-i6QhKdIw>
    <xme:vtPWaRB7yy6ejSI-TZ_CCH3srifQnfME7JepwIt1iRhLALBU_PgrZ0Sobjj0IwAzO
    PlmW5XGVrPjnA6ZU6Kom3gtbSsLrTcZTgApKtchQcoRX_O5aW0_czI>
X-ME-Received: <xmr:vtPWacMRnh2iyvdHIvsk2n7NYOJAhxi2Myq08CKHCcuM4vokmQLjDKe0BKge>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefurggsrhhinhgr
    ucffuhgsrhhotggruceoshgusehquhgvrghshihsnhgrihhlrdhnvghtqeenucggtffrrg
    htthgvrhhnpeeuhffhfffgfffhfeeuiedugedtfefhkeegteehgeehieffgfeuvdeuffef
    gfduffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsugesqhhuvggrshihshhnrghilhdrnhgvthdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegtrhgrthhiuhesnhhvihguihgrrdgtohhmpd
    hrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohho
    ghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhohhrmhhssehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsughfsehfohhmihgthhgvvhdrmhgv
X-ME-Proxy: <xmx:vtPWaQel9JNzJgzLSGC4RRMXbr7k5cI3nYQBJVwkxcuGlllmKxEgYA>
    <xmx:vtPWaV6BqJ0F-L5AE_g6iqetNg2qncEt5beoh8GBI3kfdkGsmH7GKA>
    <xmx:vtPWaaLWGBPc2nSzFwp_079r1JopfuhC7i-O_dWLUcRoiqWFr16Pnw>
    <xmx:vtPWaXU2QfwSSkWHQLNpCWjlEDkfD_nkPLwC0S4asz0X8mCOyJXOFw>
    <xmx:vtPWaUnvsxEJEGKhHzEO1R999brEydY4-hAyW4EbEaO13X4Y1Zkni7xo>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Apr 2026 18:16:29 -0400 (EDT)
Date: Thu, 9 Apr 2026 00:16:27 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, David Wei <dw@davidwei.uk>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net v8 4/4] macsec: Support VLAN-filtering lower devices
Message-ID: <adbTu8SClMtaSoxX@krikkit>
References: <20260408115240.1636047-1-cratiu@nvidia.com>
 <20260408115240.1636047-5-cratiu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408115240.1636047-5-cratiu@nvidia.com>

2026-04-08, 14:52:40 +0300, Cosmin Ratiu wrote:
> VLAN-filtering is done through two netdev features
> (NETIF_F_HW_VLAN_CTAG_FILTER and NETIF_F_HW_VLAN_STAG_FILTER) and two
> netdev ops (ndo_vlan_rx_add_vid and ndo_vlan_rx_kill_vid).
> 
> Implement these and advertise the features if the lower device supports
> them. This allows proper VLAN filtering to work on top of MACsec
> devices, when the lower device is capable of VLAN filtering.
> As a concrete example, having this chain of interfaces now works:
> vlan_filtering_capable_dev(1) -> macsec_dev(2) -> macsec_vlan_dev(3)
> 
> Before the mentioned commit this used to accidentally work because the
> MACsec device (and thus the lower device) was put in promiscuous mode
> and the VLAN filter was not used. But after commit [1] correctly made
> the macsec driver expose the IFF_UNICAST_FLT flag, promiscuous mode was
> no longer used and VLAN filters on dev 1 kicked in. Without support in
> dev 2 for propagating VLAN filters down, the register_vlan_dev ->
> vlan_vid_add -> __vlan_vid_add -> vlan_add_rx_filter_info call from dev
> 3 is silently eaten (because vlan_hw_filter_capable returns false and
> vlan_add_rx_filter_info silently succeeds).
> 
> For MACsec, VLAN filters are only relevant for offload, otherwise
> the VLANs are encrypted and the lower devices don't care about them. So
> VLAN filters are only passed on to lower devices in offload mode.
> Flipping between offload modes now needs to offload/unoffload the
> filters with vlan_{get,drop}_rx_*_filter_info().
> 
> To avoid the back-and-forth filter updating during rollback, the setting
> of macsec->offload is moved after the add/del secy ops. This is safe
> since none of the code called from those requires macsec->offload.
> 
> In case adding the filters fails, the added ones are rolled back and an
> error is returned to the operation toggling the offload state.
> 
> Fixes: 0349659fd72f ("macsec: set IFF_UNICAST_FLT priv flag")
> Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
> ---
>  drivers/net/macsec.c | 71 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 63 insertions(+), 8 deletions(-)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

Thanks Cosmin.

-- 
Sabrina
