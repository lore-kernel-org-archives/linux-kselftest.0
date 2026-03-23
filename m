Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF9E37F75A;
	Mon, 23 Mar 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276115; cv=none; b=X3tBQRuf5pPsJWZBiWQAGqvK+qAU1SLzxbdyAxvrfNXXOwu6POJ5ri1F4wGxvC+7eRSrWbw22TfBL4+Q4fSvZxDZBqtz1gXHnFIL9sSEmKYoJluuTR6e5JK35Obt2EKkz1j/+ou37wQACxriUpzc6dr55Q7MHix8vjiHyRshs7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276115; c=relaxed/simple;
	bh=0vS3co51JvhHMZBfEHnnG7z168k2+9rr9N0ZDGNA9vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCGhUE3Fb5pKFoeQC6+UGN0c//rBEkRC0fpT2PrBKHxRCqbfUsRycfLFYNG1w5NzI4OL1CFzHpPi+dr95uPESjiCjxLhHOywgt2XI+hK3cJRdMQcWK1om0d6Z/mciTegxnd7bvYibkMdMcRglxCuWzV2dIOxVMZujed/v0MC3Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=pv2KIZWa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f4HVXWGo; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="pv2KIZWa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f4HVXWGo"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AED0A7A0196;
	Mon, 23 Mar 2026 10:28:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Mar 2026 10:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1774276112; x=
	1774362512; bh=SUMCS0C+SXCsiLX4wy4a/yPyeK+2xR3NytQxbpD70iI=; b=p
	v2KIZWatDbmN6fZOOJ2/4FXFEFvQk/afU1zxBPDuObqtQK4gdzNHmaDwnbu8dYqj
	e9noAYJ+aKKNMiLGFWJoCmQH5z4nqDnPIc6NUgA2Nnc6s1xtBXYVlNMCRZRDxQAH
	f5Fs3WyANPfALv3JbQa0ypsXJfEeLYSKaeNVWr1ZwvMl6SzlF1XcvyJn89tUUUNT
	xqW1xkyj/i1c5ttKqd30ytqvfWStBwqPWcBx7BiwbU91G3GZiTLvwAUG1lzeyeho
	QO2HkFWsuAISAcyoO6OYk0a+EOKZNpymw4dPUO4hQG5AVFDeu814R3VAGoAbTZ+L
	ua5AD+vo0feOhzlxo0pUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774276112; x=1774362512; bh=SUMCS0C+SXCsiLX4wy4a/yPyeK+2xR3NytQ
	xbpD70iI=; b=f4HVXWGoNvbPbX+AV4tPy7uJx8gH1yIY3i1lsynDxM0XOZuZRdx
	XZljkv1/JOnl/8oHTfKXOMYDYpw0avENPo/Bc07uGEEUqnWkI/1HdWzrIUsveB/m
	eJ/02wdVvw1Oi5KknLfThevSoSIxhqukBa2jNu/NxlJJ5nOPISdjfDlV6JiTL7qb
	gSdszMqx+xcIEqd6uCW2jkQ+lMtNAAmAsjnG5DDcYrQRJm/gOBOpzR8U2MXKHf+a
	8MPSOIXv6/H2cDO1HVAlGj4gjKXStARSivCzwCF/dEQxG6OTI2wti42Tya16bqgw
	8UI2kAenRpN7IzGz1/oHGT123OLYa0DbSuA==
X-ME-Sender: <xms:D07BaaLDxK2ISgWZ6Qs5fMnLLS8W__5I9iFUJD1h6OZuQMgF0vMk2Q>
    <xme:D07BaVPZV8quSxAvr8roy8fXXRPVSPLkKETyDynNH4I6f-AsUGudkje0Uqi7a3wS9
    4JZIbdKpaeoLhD0-QfpJcptsISycXiZncIQUL2h3cyRxLIoNcl2HY4>
X-ME-Received: <xmr:D07BaVXyScNBZcMuZQAdiZ9imSnt65F7h_IoyqZ52-u2yCFOYwP31XLPtYoV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefudekleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomhepufgrsghrihhn
    rgcuffhusghrohgtrgcuoehsugesqhhuvggrshihshhnrghilhdrnhgvtheqnecuggftrf
    grthhtvghrnhepuefhhfffgfffhfefueeiudegtdefhfekgeetheegheeifffguedvueff
    fefgudffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgusehquhgvrghshihsnhgrihhlrdhnvghtpdhnsggprhgtphhtthhopedutddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheptghrrghtihhusehnvhhiughirgdrtghomh
    dprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvh
    gvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepshhhuhgrhhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvh
    hgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:D07BabkDk4vOTAlwfzN-Ta5lhqcoOd1Cdz8qr6UGBiZ0hTH5D9_sOg>
    <xmx:EE7BacM0PfMHo8ZpYEaSPjq2yRprZp6ahrMfSkdMpHDx2OaobxFW5w>
    <xmx:EE7BabK5rA4vHcOBBK8t4sV77bTKTnaIH2uMIEEUut3KEiN2vACNqw>
    <xmx:EE7Bae2-84N-EpFLX001NSS09D3Pl88I1rd10Aylrf6xpo_WqFbItw>
    <xmx:EE7BaZzoitutENQfUPR264SnrCPVJF1t7Ad33PnDaryzYQYVKXWvNAHm>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Mar 2026 10:28:31 -0400 (EDT)
Date: Mon, 23 Mar 2026 15:28:30 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	Dragos Tatulea <dtatulea@nvidia.com>
Subject: Re: [PATCH net v5 0/3] macsec: Add support for VLAN filtering in
 offload mode
Message-ID: <acFODtfaa8LCKX4r@krikkit>
References: <20260323123633.756163-1-cratiu@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323123633.756163-1-cratiu@nvidia.com>

2026-03-23, 14:36:30 +0200, Cosmin Ratiu wrote:
> V4:
> - Migrated nsim-only macsec tests to Python, usable against real hw.
> - Ran these tests against both nsim and mlx5.
> - Gave up on nsim patches since the tests no longer use them.

Why not? Being able to test without accessing real HW is still useful.

-- 
Sabrina
