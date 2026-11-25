Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795641432;
	b=Lri0tbHPVZ6oW13tBhepwu2BWGLC6GsLFs37cvEeKw6P7hs89otHK2kLG+JQLt0Uz9DL
	 HJJ2PDM0L+Af5lxLIqIXlMcKlcODGtyrqtg5H4zpRzul0uSfk7HECBM6jU+CPug++mBI5
	 FLm22Zg9PgI8USRJ8RSxFWutRrxV35nSYZC4WtqNdtLHFV7U6GxP8KfPyn/c644/RsZoI
	 37/+DvI1Jvzjn0Z27sIzps6jSoiQJh9pS1g2gJgTOxfKaHqMAj3GKdStq7JYk/2teSFVp
	 M7tachTA+LJZ/dSg/Bu7WJfCXIyiF/UEmvmk65ihwgHyO1ZKzs8txlCojMKs8FchFLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795641432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
	b=H/D78N9gYeLe5s2NzfWbv73Myi1U6sLHb4HU1bvannztUnqnrN3rFTl0pAlZJk9Q3XNp
	 YfugCI0onsJxpR0lVt3BH6sCZz7z3wjy51PZT4y7A8KYrCRkbFPPOzxJ+I9HLcESYWTDY
	 H7xVDt6e3GqW/MW/xLasaXLrqJCltScCkVigDGICJ8hfrppRRYY3hE0jqovdgfnnA+Hm7
	 dKzifZHohadxmmRz30LA3qjyOUkr4bSU7RdKzhklcZS3nM4k6NlObwBr6m6SwuHBxfbUb
	 v0RCRhjVdF6amow+pr2dFxwTXoKPH8VY1LFPim9KjPZE9t5WXpd6243ebPOZLrdsYGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="ikCqdo/J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0E606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 21:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=ikCqdo/J
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4d07494b0so72957567b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 13:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795641430; cv=none;
        d=google.com; s=arc-20260327;
        b=PCmN5xZjtzNEWfCTyARhhkxzAiyJJKBre5ezHflqzJ6t8ejM/98XHqisjnb9U8JhoQ
         EaeZRyvdJRmKzOwmgJgRtcNKKQJELR7yG0to+NznHafBibQsZahznpLEXUPrMz0TulqI
         2hzdzZWe92dJLMMG6NpW6w1jezvCJWKVNZEvillmJRu4Rk06Kr5yNlhxWWPo/Tsmtshw
         S3rTJyW22cOAdKddxv/gLWxBrv9tIHBTBtRv71QKjd46MlQLPwc/3K5XLzA9o7OGIlzd
         LstTYLUpnMVC85WnB69gGUq+cNGbnkkPrn64+0NRRhjhEnTIKCckRyIB4AVF6iI8eJAh
         sKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        fh=1tb8+ZcFurCLqrcx6hZehPK45kkVEECH2xBW7M4rEF0=;
        b=RSN2C8BM9MClROoX05du7n54IiXNpaDeV4a/AzwKa6kmn/ptdnrKOnhkEqSLORnray
         sntJ3tfbcRVaXPxeD6QP1WFCWox2H1LV2pEA4v5uaXM8arS4/t00Sq84Bt7Z7ZomfF99
         Kl5gpg7jbE2PGJf6U9oXUscAvwLeIb6QER7rKJ1EXc1Uv7t8GHDWPBJLtumz2CFuPSn0
         0VffRFG3JKPNHjRZEDBDj2Cn+n5/vK+46KdjOMzX9E1gA7nU5jPb+J5+TQEuHIsVFF3e
         3OEd8r/e2QGejTju5TsLcPibtFzIXe/YyRguoDhT2o07KkJ0Y60Ik7Ou9XosoExl5Geb
         WmIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795641430; x=1796246230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=ikCqdo/Js06OZnjno0W+kIv1CiD0oR8ObGMHXOscIUzGqP28wgQViOHE7omuITw0BX
         0k6cs0KjS+RXzmw6xE3ijiInaPQr2YTNUkoruz+Xsr5SXXKxLYZsAHzv/bm/il9q5gD7
         hd+2fQw+XlkJZL1mT+6udr4PlowS0oxRoTFtBpOFHp5ZCTuFSxpI9tH1kYrhjWRUC+Op
         LsBmuYcllItowU4p2kLnw+34e7kDcgDwdlGhTL+r2AIPOoNm25DfC5QaHYR6/00Dke38
         oh3XTh0v2gEbor9gNFvPrq4rZGrpFqfZH+KDVveZM2Mj4dQB27ephNT789CrGGk0cooX
         LjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795641430; x=1796246230;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xpq+0pwaGJzipp07jmvO3ANvw3Qwr0iR1BtMYGqpL5Y=;
        b=S5qo5Lrf6axKYOXkpzSslRiKvG9zh3wuU5vQLqGaTWLe/8zKePWeoW49rO2x4ynar6
         2zSdwCyq/1+G8HCn96dRWKSonsS+k1ez46wJg/g5xwGSFSOxpqS3wbXQzZEKeuaKeV6s
         lzvV+FoyghO2qFNiyLw0ERjhYNp9fGEB4D6dtrHAnTq4tUx6zUaU5gF8xuSMWZsF9AfY
         QJK7+HXuxOc96++DzSu1X2qpydLAVyEZ8OlSySx9UufIjxbNQFum4KA7AjyavWuvUQns
         pbwzJgKCdwNLGskhJ/PV2/lWIMxEct2t7bX+ZFlYXKx2E2Dy30NHpTwHZXEbafM0JCyo
         BzAw==
X-Forwarded-Encrypted: i=1; AL+hErHkFUDLPcwiLcOsFz7e6NZRYlpcTWbpP5mbl8ha/XOEsYBVmGl7imLdrqXYlg1FWtvZ4iPI4CBZtpcvoptq9Eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I33SmRlPdc/HyrGl5IGqlAzX5BOMV2gviuulem2bDxYVZacy/
	ERGo+kKW0VMLZPCWDSxGdU1t5ZxZc4iyRTTuSqvYQPuJKGaJyYbUf8953TctsJGsFh+bmY+iXcn
	EppWjf0UNsEf3jY4dR9mqFDuelDY4rPxy2rzLJ9vtDA==
X-Gm-Gg: AZFdTZdkSLzzhzTHBB/yR9072M5Z65Fmjzv5WheMGsgvH8BVdfW1bk/eDI/hKE6XQB9
	0DYcula4I+Cgj/HyDPBDhOjTJ1Ps8ZvK4ipUvwaK1t+sC81fOurBnDy3vBoeyhtduTfgfJcoVzq
	LQ/0O9Oih9bBv0JSEMxIcpxUQDJokrq3LB/ypPQAN/YgBiD2phGclNV/4CUJWQyWAmwChah8fxo
	TGhgCAMQWEyM1qU5ZMjocfJb1gdbSOOJ8wpJc03gjCr1Sd69q1LJKs6ezZ/K6VXDWaIPg+iXWWL
	mY1CQoVjpjTQLWsTCq0ht96sDeR+tM4n79PyoLkJZiobBfqrXYp5Wgo8RwDm7cGTY1JUHUD74CG
	VGKaqLxFYXRjY2/7wRhOPg1b2/hDReE5EPYpgD4pKKDOf5SWWspk6+5DF9zJhz7j5XnW4
X-Received: by 2002:a05:690c:6e8b:b0:8b4:c69d:17e3 with SMTP id
 00721157ae682-8b520501322mr76798817b3.32.1795641430719; Wed, 25 Nov 2026
 13:17:10 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-tcp-l3mdev-exempt-ports-v1-2-ccc2a3a6cd09@nexthop.ai> <179556272812.3135.6671930746959900620@kernel.org>
In-Reply-To: <179556272812.3135.6671930746959900620@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Wed, 25 Nov 2026 14:17:00 -0700
X-Gm-Features: Aa3M54qAjb6VOUA_FXJBwfwYAI4hdIT50Z_FnPsv-oL5ve_wAb0briVt4LVCUPY
Message-ID: <CAAv61uR_cfj-tcqjf2q1KYDVxENmwJmjfR0M08Jk65iiQaj2Mw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] selftests: net: add tcp_l3mdev_exempt_ports test
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 4:25=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] vrf_and_unbound_listeners() in
>   tools/testing/selftests/net/tcp_l3mdev_exempt_ports.sh waits for the=E2=
=80=A6
> - [Medium] selftests: net: missing VRF and l3mdev prerequisite checks in
>   setup()
> - [Low] The negative checks treat any non-zero exit from nettest as the
>   expected 'did not get the connection' result.
> - [Low] In unbound_listener()'s 'exempt, VRF conn to unbound listener
>   rejected' subtest (lines 117-125), the server is started in the=E2=80=
=A6
> - [Low] selftests: net: tcp_l3mdev_exempt_ports.sh bypasses lib.sh
>   helpers
>

Thanks. All of these are fixed in v2: the test waits for the listeners
with ss, skips when VRF is not supported, fails if setup fails, requires
a timeout from the listener that must not get the connection, and uses
ALL_TESTS and check_gen_prog.
