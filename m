Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86291438478;
	Tue, 11 Aug 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786445134; cv=none; b=QKFx31nnhM9F491fBXjglUhkqQ9LIrlpkUsofvuDUQQDP+nWTo2KfGIDWxL5jr+I6BGCygIlk/QRMDHhMUXfy7QHhY/V3Ge0na7EfO9Fq5RrEtHu9MZAaq2amIgAFwqrFP3VsN6CwcjUsv/c75N7hA6Y7Wq6Gfl1Fuz/4sarheY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786445134; c=relaxed/simple;
	bh=XDe+OzTEShYpwzZw71sAnZLiED5TP0/3ChFs4D3wiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igB7OPF6L7LdXQYTWWK1oqih3+9srPlH3wyH4Fr0RxhMppNhukTHsvlKHWmsRq1qFUBlxPNPD2WJMXmx5yJexL0Db2H0TiYtkmtFoRamAuVc6qvp+4qJD8fmwYCPEVD9L6PtEmEp37l6fTguVoq/4MN7A/AQtHdoEtomR/Peah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net; spf=pass smtp.mailfrom=queasysnail.net; dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b=IZRfM9I8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YRT9Qzym; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=queasysnail.net header.i=@queasysnail.net header.b="IZRfM9I8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YRT9Qzym"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 46B027A0115;
	Tue, 11 Aug 2026 06:45:30 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 11 Aug 2026 06:45:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786445130; x=
	1786531530; bh=RGDeTJLMFgZOusS15+9aVNQP/TeeRU41XDCmbuDB164=; b=I
	ZRfM9I8K3XivyQDoekLueMe48IWBIr/oBSrOMoxlTI5tPQlJeXXtYjCqySrEiNmI
	k2MSLJSsNrPLC/sszdZEU1jdLwO7SGI0gSMJySvyiusw7wZ9l36fsEQq62oUELf9
	m5hvTMOeXrqcIjLJEnQCPNXA4SRVWxgHCusLEwv5SlV8SHC0fZfg6fRtb+NntJEg
	WitAhVKzaWz8my5e5F84ekuBepVrZR+GsZtTRK7vhU1MiTMR7L8N2GEdkj3my0PQ
	SVi25DBL0zjgtkvvkvn5wMxEH4MNG/WBKAyhYBspuly7PwC2dGVwUY+eFwsCR2mH
	W5j/mPWkOFxmdv1CA5wcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786445130; x=1786531530; bh=RGDeTJLMFgZOusS15+9aVNQP/TeeRU41XDC
	mbuDB164=; b=YRT9QzymeOO6zELz/35q/CXNhwNyvCz6LceG/9AWd2OpM3oxiJ5
	imKlVsC3Ez7xbp+V/pv6mIBnpnadaVyWMUOCmDqu+JpIR91IVC4HgG9b/kX5oAEs
	kHeZqzfUP3dexvA/xb6gH5O0IGfOg/klzQHySglZrYUSfFlDf9Og3Yq0uM0ldsmA
	Gq7j/LU70XhAv+pG7mm+9yJCL2+C1WPP3GuvdOtUUoxLpNtCjQG5zW0Tyu/Czh1E
	KVtpEwuElks3jth544T0z04D8S02iD21XmFl8gbvxgoHiA17xnkbfjqNwHJ9Ndoa
	qb36ys/uwDP4XRLcqsrrIrD3wRaZM5i0sSg==
X-ME-Sender: <xms:Sv16an4V-fQSy2Qiqb8w7wMbSJ8t6ZfEv4WFiIaaHLNNxzIR9tvO6w>
    <xme:Sv16aowtaiKITAZ7lENNaMoedj9FEASGJKh96NhIxNYtKxbXT9a7WdERWHOg8E8HS
    7rjRRdHxMjcEUPu9-It04BjkHg_yutYn41O10wJFIA17LuC-vIFtw>
X-ME-Received: <xmr:Sv16ardH_EA1mJKx9ycnwdIgN96zJR_jIWtD9FhUSbE7dewLnGEdSeeNdwM>
X-ME-Proxy-Cause: dmFkZTFHfvZoUdfu8oKWje9ufN8AFSWAswEitTXWlZgWeBi+jwhxu5ILCOKpzs5lI1qaED
    TiSA/r5u/cpuVDX7ABkUD1+cRl1wuIxXDL+smkcTG85Z0er/LYdP/xg1lDtYYM3w8DqHuO
    xwe4QogrIjzjyOfhYqzzaP7IoU/n6s2obWDhG03te1KoEhteGk/sAbtfpyc64mg+mlKBn4
    4gsG+VLX6QktKqLdZcnsYst1cYkDmbg05XW/CM0fvIBysgyeYYiZHq7vpOSuJrb6ebdyza
    jIwufUESgFpEAmHOdEUEaORb9tdeKGSFtQLS/mjrgowyeiiJjMCB84oJJnaXCibQGXLmq4
    M+pNyutbo/WS+qO5VGJKJeO/wg1/HoksBOSwZdMVur7dKVcFzsoxS6Nmt4FXnfmCBY6cca
    zgvy0orCoiOIs4cKBmvlr5HSXjn8pjLd1mZYCqXf+GJwa9+fnilBJcG2ilAzm7UF6gQgrw
    VlWqt3NMwWiekdxhoQ8nYF3CtZ6Jjwpqvt/kExyJpXWGrcvjXymJaDaPCVh58rfqoAQHeq
    xZlaO+jQlzMsLs2GAxSH2X71Ax3ab7MhImZBfGq+Auz1hYU4yjhGOnRQLCTzVpfITmUjoK
    ru1lJPNjtAYbEe0NpUbSJXFOtOlWT2QW6RU7oANvusL0OLtyuAXzFCvcU5Mw
X-ME-Proxy: <xmx:Sv16atBdvt-ITCxnAr2X7Fv860fsOvh9v2e3KjcNU7KoZncoNAPh9g>
    <xmx:Sv16av4KaPDfQC0L_emrbNX4AK9-kBQtbQD9AKCjkrDF_aFPbYdNXg>
    <xmx:Sv16amcfA2_oCIawlI_-eeW3qmbIlBZsEAsr1bksF-QEJxXs3mJGtQ>
    <xmx:Sv16alt_CZ7zi8XHyWZKGydvrXgf9K2JG9aWt5FDYOiyKvH74FNOFA>
    <xmx:Sv16aksCxuPOvTvT2ICuERjJGDg23L_7MSM2TUiwoS-UyK5oivzPIgzL>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 06:45:29 -0400 (EDT)
Date: Tue, 11 Aug 2026 12:45:27 +0200
From: Sabrina Dubroca <sd@queasysnail.net>
To: Chuck Lever <cel@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 2/2] selftests: tls: cover splice after a failed
 decrypt
Message-ID: <anr9R3FfLC_Kug8m@krikkit>
References: <20260806-tls-splice-crypto-fix-v1-0-a2624005a286@kernel.org>
 <20260806-tls-splice-crypto-fix-v1-2-a2624005a286@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806-tls-splice-crypto-fix-v1-2-a2624005a286@kernel.org>

2026-08-06, 20:44:08 -0400, Chuck Lever wrote:
> Nothing in this file splices a socket whose last decrypt failed, so
> the check that fails tls_sw_splice_read() on a broken connection can
> be removed without a test noticing. Such a splice hands the
> application plaintext that recvmsg() and read_sock() already refuse
> to return.
> 
> Extend the bad_auth pattern. Corrupt an authenticated record, confirm
> recvmsg() reports EBADMSG, then splice the same socket and require
> EBADMSG again. A synchronous decrypt fails again on the still-queued
> record, so only an async decrypt reaches EBADMSG through the
> recorded-failure check alone.
> 
> bad_auth builds the same corrupted record, so its construction moves
> into a helper the two tests share.
> 
> Signed-off-by: Chuck Lever <cel@kernel.org>
> ---
>  tools/testing/selftests/net/tls.c | 75 +++++++++++++++++++++++++++++++++------
>  1 file changed, 65 insertions(+), 10 deletions(-)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>


(just one nit:)

> +/* cfd carries a byte stream, so one recv() can return part of a
> + * record. Take the fragment length from the record header and wait
> + * for the remainder.
> + */

I understand what the function does, but it took me a while to parse
this comment. Now I see it applies more to the
"MSG_WAITALL/len/MSG_WAITALL" construct than to the overall function
(the function's name gives a good enough description of what it does).

> +static void tls_send_bad_auth(struct __test_metadata *_metadata,
> +			      int fd, int cfd, int fd2)
> +{
> +	char buf[128];
> +	int len;
> +
> +	memrnd(buf, sizeof(buf) / 2);
> +	ASSERT_EQ(send(fd, buf, sizeof(buf) / 2, 0), sizeof(buf) / 2);
> +
> +	ASSERT_EQ(recv(cfd, buf, TLS_HDR_LEN, MSG_WAITALL), TLS_HDR_LEN);
> +
> +	len = ((unsigned char)buf[3] << 8) | (unsigned char)buf[4];
> +	ASSERT_GT(len, 0);
> +	ASSERT_LE(len, (int)sizeof(buf) - TLS_HDR_LEN);
> +
> +	ASSERT_EQ(recv(cfd, buf + TLS_HDR_LEN, len, MSG_WAITALL), len);
> +
> +	buf[TLS_HDR_LEN + len - 1]++;
> +
> +	ASSERT_EQ(send(fd2, buf, TLS_HDR_LEN + len, 0), TLS_HDR_LEN + len);
> +}

-- 
Sabrina
