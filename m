Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4D641A77C;
	Tue, 11 Aug 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444869; cv=none; b=nTh3F15IgY3Y10iUaP4HKy6QpkcuGl0XT7ld0khBVSxCNfwbXVVsoNdOjQnitS0/m/R/MVZ0S5qGW125gJyix0fUz5TW1fhJnQJgCiuiQqqbr1egg5Xpsc17pwy2hIV7ZARQ09NcZCPwD+2l6NxAfotzJf2HX5lXuVzEE3f/7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444869; c=relaxed/simple;
	bh=tyclHrYDCHhWuufJXIrjBWusfgADQYoFaERR+jCpDKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyWB4SLSxsoFqxediFelChnyoU4RO8tmkweB7Au1ZkFmBO7VflPe9OaQ1oWcf65m4qXGLOxxCWE+1acXLcJSWDnBPidJJjq3BZuYvNK5jV1tHNSYOqkQ8cz4vozQj8Psvrym9CUspVIS5SJYgPFegvkcyRePwl9QNNYTqa2GnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=VO5F2StU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kA4+/zAY; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="VO5F2StU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kA4+/zAY"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F1C767A0148;
	Tue, 11 Aug 2026 06:41:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 11 Aug 2026 06:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786444863; x=
	1786531263; bh=LhfTMBV0u5ndx99DLMPhYIAC66Bi8zfIMpwTBOVt0wA=; b=V
	O5F2StUknBK9oZiR760IyT1PghodioaXSxnYVlYbeDM5rXY9HRu1AE9sG6KGQpI2
	fXZ23btKvWHDOIH/+tg/j/4mmp9G39OPVUeBtxh2SQO3ututKnaeEnjkdUXPXiK/
	9W8wKpS1Fwuktc3hAC/PFnwiH+3BMe2sdab1Vpj3QUErR8slb8swbkr9W2IYswvK
	kRDc1m5BFjisfcW+Ls1xAO9km1GjGn1ElOT6NhU0hTdfLuA8eHOJQo423w7ROX3K
	9mQXxAp8RE9E83uxNLpCzYseLYa2FqScN+2fhHLVgnSyvg2XSUKw40Mq5fwEeH4f
	2eiR0/a8ZV0n0wLnF1PzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786444863; x=1786531263; bh=LhfTMBV0u5ndx99DLMPhYIAC66Bi8zfIMpw
	TBOVt0wA=; b=kA4+/zAYRbaM86lWsXdChPAG+znmYTXO3/vAIOhqUCDhp0GlxwG
	/9u+TldD0sQAcA3Ax31MxdE+C6l9QUARKHu8YZkchREL88NoQsXSdIu2nwoIUVNk
	fTeU2MYpvW4Fx51oEPsONG74Er8Ovi8bdYvp+rSL/xvZAL+r+FBGpsdFtr62ufEl
	4nDkug4eb2p2Rxf6IX79c3T4xifJ2DgOP47qFxrkzUvHTShOfHbDn0maGrimzl1W
	w1z8ehgladpPecr/jPQ15UxRaB3r2n3qwWHv5YPhNj6Pli8/5OujX9OKF85Ewuld
	ZmuEnYB/iVTYmLt6nUb9G41ny37hqqigBLQ==
X-ME-Sender: <xms:P_x6arQE4CmZQeV3AfuIvJZO1LeAPbv7Bn0mI27PeAjVmMIaNVGNYg>
    <xme:P_x6aoqLcH1JifPHM9fcTm74_QH797mCfiTcSl9OepiSPfc5iOMUkVTlChH1_LF8E
    9aA5YN7UGGDevHjzhWARNZpPj4CUISEDBb-uDM-pJ5euSL4Cgce8A>
X-ME-Received: <xmr:P_x6at2ATKXhYGVNBVqhk--O1g58rs8etWNlgPu2qJSTqISh-5SrJN6tlXw>
X-ME-Proxy-Cause: dmFkZTGhtI7V57Fx6tcs3/GlFdg82lPItonlqnd7qTADeeqVJI2rylRDTox7wxzy3jmGcb
    zskKqqOUCs6zsYEloKJyLsHjh9Nyhap5U17NPmwsIT3XPpoWjFxfQXO4A7EUQaqKuzu9RA
    tZYrWQ+o0HcvLP+oItdeInO0MeR7KWXVk6cRkReQA1lj6ReD5D8DDw/DhglzdR8fGqs3cr
    PHFchAj6VI1G/PT6TxkBpx3uJ3nlunEzqnW5rRp14xngs+F7QTb0KzO9aZJe8cL/tHNmaQ
    9+hYiQCVN2xl9rRf+mK+dl7fzemUDRKdj1SlFgiR25x+LXYgtejS/SMz7lYycITlhj9crn
    irRziUIXmPE6dO89W8lszDp9mudAsDZPSzyk4WAbXDQtGA4SPLDXgOWpvpQHR1a2fJvFz5
    7WDzMWe3gFJJTfrOx2Y7Qw7dDTev/Td9Y6yYXMU/HIpy097VlXwmy3QrBf2SzIIkxzyk0c
    avy9RZEmNwV/9fdSr/jmxFABLvpthBrosfqLofiG7PIJpU0T76QzlVLrQ7S3E5jywgqrzo
    tDqXwF4ANY3MfFxAlm15RkSMTzk9UllyR2pYs+gjm4oBo+M2nBIR3irpcLzKNVZIsAONPs
    mClToD0YJ2xAF0GRTSEN+3pOjJD2VpLI3rG9wx6rQs0EeAjPlIeYCGlgPy+w
X-ME-Proxy: <xmx:P_x6av7WRkyTpxSxTsMk_7UyKP0Rtkq85rhSdfQ7QsmoPUH0-j4icw>
    <xmx:P_x6apT3yl2W4uZFTeVFgn-iHltNfKqBuOGKxYKYbv-5WW1M7q4GIQ>
    <xmx:P_x6akWf-BC9j-JPxasp4nuZYsI3DC9G8RgpA0SUuXUyPl0I8eoaVw>
    <xmx:P_x6auFkGolJNzQoxr_zIkp717X0Q9SPvFrql5EEZfnkyEyKYAstKw>
    <xmx:P_x6amk4LGpAR7t-e0flzdmRuwH2HrXZKx_8_KaQgKPD_WQBzCgST4Um>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 06:41:03 -0400 (EDT)
Date: Tue, 11 Aug 2026 12:41:01 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] net/tls: Fail tls_sw_splice_read() after a
 failed async decrypt
Message-ID: <anr8PY66jUrIWcvJ@krikkit>
References: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
 <20260806-tls-splice-crypto-fix-v1-1-a2624005a286@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806-tls-splice-crypto-fix-v1-1-a2624005a286@kernel.org>

2026-08-06, 20:44:07 -0400, Chuck Lever wrote:
> When an async decrypt fails, tls_decrypt_done() records the error in
> ctx->async_wait.err and calls tls_err_abort(), which stores it in
> sk_err. tls_sw_recvmsg() and tls_sw_read_sock() each read
> async_wait.err once they hold the reader lock and fail the call: a
> record that did not authenticate breaks the connection.
> 
> tls_sw_splice_read() has no such check, and sk_err does not stand in
> for one. tls_rx_rec_wait() tests sk_err only inside the loop it
> skips whenever a record is already parsed, and the first reader to
> reach sock_error() clears it, while async_wait.err persists. A
> splice therefore keeps delivering records on a connection that
> recvmsg() and read_sock() refuse to read.
> 
> Read async_wait.err in tls_sw_splice_read() as the other two readers
> do.
> 
> Fixes: f314bfee81b1 ("tls: rx: return the already-copied data on crypto error")
> Reviewed-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Chuck Lever <cel@kernel.org>

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
