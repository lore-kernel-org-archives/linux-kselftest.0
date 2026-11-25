Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624800;
	b=hMMtj9mYRhI9c17W3oVfawEtjUJ8IToFR0QsH/5qX/PDI9sBy68RCH7tYMEBw+/4qjQy
	 Waes9ac0fFRpq+HQgBgH/xvtw+GIbjvE+FOBCf4nfXxSSe+6rkqHZokPzzdvbCeUAWCj4
	 Wt7FCLlyuIGUNpVefXtHD3vyxAoj2uvrOI7obz20EfcZT/LYxCrcC3I58aGMqZlB0smuV
	 StklyhfMjtexm9XRueUShGW/gga1f+qxYDyOGk6TMCVeojPHzfY6IYdfDSHRYg3kvlhMS
	 7Yy4qTgguT+RPxY7JyX0oxQ9Cttf5aZJoQblc5zoCcNAUJO4yjcFjeoHTT++j1ZEfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624800;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=g3enkNkjVyBvG0MHM+KWIa1N7BGaXbJaNRt9VzjWX80=;
	b=vGpVB+kwBeidcsgknQAW9kXRZCsXjpFFjDWo1wFXtEUNs+e3DasEj3WGcNG5Qe4pN/4U
	 4yF5WDTy2eRHGp6JzXIIgXUTNjCgPhMQwdiY5txhWYw+JcLs6cz4s6OEra/+W/jwIK5K+
	 plE5eYAT0eQLpblP0NWhD3b/MesGy3AHbW0vCj8gXnxOEbiOxa4dEdFTXWFdKqDYyZ+FU
	 f9jzLo+IXP5fhbETGCwGBZh1PuY0JHUvHSCFrxwx1Z2TP2ifErHHm7u8sUboZ4ZRd4UBl
	 mbLrvSUvWgFsGYsQ207osbqrcrQoCSpb6urIY8p06XubFDPXh7hnfuuRyogqOCDZGLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=XNDHqpA8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="YcwCiXb/";
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3519B606A681
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 16:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3519B606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=XNDHqpA8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YcwCiXb/
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id ABE161D0053F
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:39:59 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 25 Nov 2026 11:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795624797; x=
	1795711197; bh=g3enkNkjVyBvG0MHM+KWIa1N7BGaXbJaNRt9VzjWX80=; b=X
	NDHqpA8OBmHA39syNiqFLQowcg2z3/AUs0x0LxBbTrHx2Te9BUlc7PLNcDIWI8oq
	QR0mN6g8Rpm8IQ+KS8Kdu8H0gOaVc41ibJdZZCOKS8gsP7Jpq6PO1YlL0OnoEEHA
	khMBhztDyGw2PQBRMURvD6bsWlxYEtRR5vfybcqD79KNlQeSATLSW3h6GUEv1MSz
	n0HezIi2wzskzZzPNSB7WKz1APmXbMyRtRLxLGW8j7DSKI4NPT3AX+2h/kyoxKH9
	J2iutpQrz2faCDBh9hfwxR+E3jvDk0k/38+7/soKzM6Eea2ELV8NgjFubgs9gCmR
	8V4gbhsX32zoKjbo0Q5Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795624797; x=1795711197; bh=g3enkNkjVyBvG0MHM+KWIa1N7BGaXbJaNRt
	9VzjWX80=; b=YcwCiXb/P9fn4srv59kljyBYSTJn6S7c0xfmeLHYYRj1Gs4ukEQ
	Ts+FShPo8/6F4OvZFWkGH/OYTcvQUKo4D2leiuqyUsRavsywU6LLJQDcUHCz/CmG
	4g9ZMMibm8nlvLwPhdZRs0JMLw71RHDNoLM36ZDeCXOrxMbnis9pzI+sH6JwCNzI
	HTx/5BeZ4faoFHpBA2oDmpjGomG2nqISTw+4NHksPAL8JnkEXWtgq5u6VoGfZe9L
	xRrgT2XqTxanhRPVodf4kcIAUwBCItiTFPPoITOdH27uO2xbZbvHjPjf9xDHoI7q
	cvBNWCM+kwlilsGovj17zItnFuneuEIcMTw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795624797; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:bWI8Kfn3W/Dxhq6Gj4T7fXz8i0mHCYiioYaC4JKjI2ly9bb
	d8W7jv2nyezmmIhJHpnaHx4wTZOAPgWMNlKFGRCZZvxsEKslSu1cj6AAFn1m+DML
	1ubx9SI0R2ZlrjFjMD1RpE7OB/4Hthj2nmcrezg9p06xevEHu96km/SBBambbyz4
	r2XijtQhGmsNSnJyGkLvtot/hlFXwEQ+T77Fa5BhL2y/NErQGHBhr2LbLXY+1ADW
	Z1yyXFmjRIcYr7fbOKyE3+lbqM631UEcqV8ooQLpDpGKgzorT6u035Ax9WjKGgMm
	Tf3QAW7TfzVodm/AVC5H/GbW0b2uQsgfaLGrEAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JUaZbP33mWNJ24OlGyehRVTiNbe7qyoaI3RQT3g4FcI=:3V7oVBdpGfdrkhgSI2whlAULFrAHua2VShOVgC0hzJY=;
X-ME-Sender: <xms:XQ8HawK-A6iufDAXnzN4_tyHixX1tN2GQDu7OHzhKLG4rF8KKfwxyw>
    <xme:XQ8Ha-rwq6txJBvJAYha8t5KZK9CeRkO-3BiB66lJ3TQOhmuPmbX4ZrC44ql7WjUz
    XCtzEbIwj7z7eDtYF3Jx7PPgmr0ixW43uiNGPLaaEgIiXTMgvGo8OW4>
X-ME-Received: <xmr:XQ8Ha3jrWwzzJddeSLiQ-Q7OTr8PlMsI0Sw69oya_8T1w3v_GVWJQyNHk3o>
X-ME-Proxy-Cause: dmFkZTG1AIosMnXXQ3TVkZAM1xBtIcV0Q0klgVHxTUYZGoQ/5iae4eFVyvEAuo5L4ttIbh
    85f0rterZnIAh6hOrrvviw2meX8naOhQKHUzQrqrt7pAwf4isXtdCJxwDxcsDtZsSKvxaP
    +TCT1wfxIlw7GAEq30JaW4u8rk66lQdoshbKm751QX3Uu2JS0YCLP+4Ybcjg3m/mZOY7aR
    /dy3nOnInYehqXtB+1vtcoDO0As8D4uQoUR9DiImcD8G0TbSHcAMwEYBd/Chy6BTxj12w3
    6LL/A9pLtQUPIgqRkG4aG4uh6mk3n+h2cTqG+MmIst645q5BQ9nyX4AXkw8k/lfTJvvNag
    NDOyLAS1dYqDWuFy+NyTSdg6wsvS3YC/3AHPFUB/BxpdRqAa8mJnbgf7T/TOUE91hW9T0i
    DHjNsdzGAyOmErwcEz6VwlvFeWHTTnVqaGg4/bvYAEUvhMRrnZjbuJa8UscXWyezML2d8L
    Lmx1vL1b6fNk3NBwNoud4HxSFY01lpXpm/NkDaPQGCgBcj25iCE9YkPH85No+uJmK6gNhG
    3p5NbeFDAjR2M8E6XwCPF9B0CChmr2v4vC1q4tiYB6vZGh7tPY/km/KAf6AZExButntxSz
    7pJd9glblPYAa5SpFAyChpwpzdgBJiCfm2sAQQpkYNQ2BmR3rgUXSY/yAsCQ
X-ME-Proxy: <xmx:XQ8Ha9Zdt8xPjvupPtFXIC3Tor3p62JzssrTCoxO6g4MxatgZo5jhg>
    <xmx:XQ8Ha_l1qM3kKSpL-Vdlau1UUyh-M-L69E23I3VA9tCwqJzcdKxNGA>
    <xmx:XQ8HazxvfNa_1lwmwfR4OefL3jV7N_mY3ZnuaA8IBhJsQ3jEQ21RLA>
    <xmx:XQ8Ha19K6JD0LkBCN1GmgOUgFxgik3WYPlhbuyoPvylmqqpAeEuSMQ>
    <xmx:XQ8HawZdunWInBQdCc9j3Q376fTVDzUrzLMF-XQDe-ywPXxk6zoZDWSY>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 11:39:56 -0500 (EST)
Date: Wed, 25 Nov 2026 17:39:54 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Felipe Pereira Stival via B4 Relay <devnull+v0idpwn.gmail.com@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Felipe Pereira Stival <v0idpwn@gmail.com>
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
Message-ID: <awcPWkEtU8rgPAz-@krikkit>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com>

2026-11-18, 17:35:48 -0300, Felipe Pereira Stival via B4 Relay wrote:
> From: Felipe Pereira Stival <v0idpwn@gmail.com>
> 
> When application data and a KeyUpdate are both queued, the recv() for
> the data can also decrypt the KeyUpdate. That makes a rekey pending,
> and the KeyUpdate is left on rx_list because its record type differs.
> tls_sk_poll() reports no read events while a rekey is pending, so the
> socket doesn't poll readable although a recvmsg() would return the
> KeyUpdate. A reader that waits for a read event before each recv()
> never reads it, never provides the new key and receives nothing more.
> 
> Report read events for records on rx_list while a rekey is pending,
> since they are already decrypted. Keep ignoring the records still in
> the strparser, so once the KeyUpdate has been read there are no read
> events until the new key is provided, as before. Update the
> documentation to say so.
> 
> Found with a level-triggered epoll reader that does one recv() per
> read event. Without this patch it gets the data and then no read event
> for the KeyUpdate; with it, the KeyUpdate is reported and the rekey
> completes.
> 
> Fixes: 47069594e67e ("tls: implement rekey for TLS1.3")
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Felipe Pereira Stival <v0idpwn@gmail.com>
> ---
>  Documentation/networking/tls.rst | 7 ++++---
>  net/tls/tls_main.c               | 6 +++---
>  2 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Sabrina Dubroca <sd@queasysnail.net>

-- 
Sabrina
