Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793897088;
	b=cXDv4XtX2FQmt5QyC+moKqeQ4DhcZ1m92Rd8AvXhOymS2BKugTzbJEybaOYZH5MhTjhe
	 qjgM85LWCNijmQgOQsCOCOmmbwJFk0QLfPRB7dHPex9IIVJRyjBwvoZUjWg6XZfEAucXC
	 /Rc+jj3GhfS2EJ5HjrKhL20t7CLLN+hxsX6tcnMZZyApraEBucSIoDFIhUmGB9/rjGls2
	 tK90970cLkiplZGMtJAVRZnmEZ1XwcUL0wBoUEdN1Nfxq0aZKD5HDJGy8e2MFLwL08KBb
	 0Bc9saYbJhisc8MkJpSgz091u4vnKQwswHWs0YXjmtGuv1XaPK8/Poke6CmHM9UwsKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
	b=Cj/nVNDmqxCE89A8bQXqmTHwBTxA2maMmbc7Yizefh2/q9Ow1OJlfWLuqCo2ZkFgIG8Y
	 dyqhM1yxErZjWTuYYG4kFgKeTDfWSsW7eQ3lcMj1SvMunIX9zzMF2KLd1WWsoJwvt7OSN
	 ab+kMumM9vaBe6GWNIQojg92HK5+dkDCJlMl5Fok1LV6S5xg1YekFcXSBWxtDYFAuztsl
	 L+Ai/Ugsv1NTIG44OzcesH6r2Ye75DfCmele/fyBips4Oly4NaFkY88TlD8H1wssIcM9U
	 IDK/hp00aK0tixgogxCJBk9BFrBu5pjG5LBcP0OiZD3AuiLRLr/U+ngfjUdEo49Ayvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b01Rcwgg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00965606A902
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 16:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00965606A902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b01Rcwgg
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40e30c26a4so181642666b.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 08:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793897086; cv=none;
        d=google.com; s=arc-20260327;
        b=rsL6lCVkMsbejqIyFm4pHhKcf36uvaK2odNY9Oe9rMyDf4wx1RT3ylmkMpDTceVi9g
         2ja519+2hFcjrwzOnylZ7fhiengx4icJ8pDGwMv29VRLF3RqM0miqFWlnjxDQAsvHwaj
         mSzpIL9mwSvtcnQlIsvv0w6O91tMnRnRvx4xMZuZzg8UhhywSw94qrHmEIqYgWZcdLoI
         zjmhzsTB2cWFhIH+KaN0R2qUdKEzCj+YTQvvt0iQQPswKtRaXi4wvbpvgjWpdJLAhj52
         qZPHkk7pk/obVeXXLxoqf2oefu7SvrMolT7K1dO2CSz9HPc/gtE5AKpG3p4ML3BD32HF
         pvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        fh=6A5bh2Qea5ShgOQmgG+yCRkfvIh82kKv4si4VLPCRWQ=;
        b=mhtQ5ecmaUj0RrTGdDyWNoG6eCNJzdN2CxC0Iv+CMx0yobRh2dOWgXYBAS5SB7pe1K
         xu6UtKltHhWnPHt9uOp1pvsqXfjP769nYYCcB5FutnW/wbXXqrBIycMYCfJlG/Uhl51c
         BIcc4tCsrT09NZrhfpht2qScRQRV8WYBdHb5DO2Q4GeQP30iUi7h9txrXr0UpZmvLVx5
         ra+Hlf8OHJSp/0o/SO84KHOcssD6rHlKWOedg1SdVU2cCx4YM1X4BLA8w/1vYft4RUmP
         c7bS2JNmEFvIhq1AdPM9GXiMW4sj7L9MBa0nMIedUCw14ajRIsWZ2mw6xa/3AnLrlV3f
         yiTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897086; x=1794501886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        b=b01Rcwgg4xzxHkoGJsC9MswRqBWrzkxTQNBAVtIkQfYjPLLvI2QKHgosecpsHrTcn7
         PI8eXrcMKe0WT3HnhXDNHZit3ibYF1yx0BNyXAd8u0UqPg3XtBYsJQ/5CF6/utvJrC+2
         V02saf/O3u2/Qyor9iPiSwa0zGX9TZYQFBfIR5sHVlzcxG1i6eAfa3wLJLzPu+OCJRQJ
         9voFjAokw76fxBV2dnOXVZDaNbm0KYp5/dSdjPDMlORXFdzzLk+WHXYdgsqXwd18jLv3
         ATgv17clGJnQmIyBQfYC0hSCMQq0Gr9gCoc7h6P/ST8O8rfRw3aitX7oDWM8U09hekDx
         mcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897086; x=1794501886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqMiJDrBp9dqyb3cO42U+9O+NQ7NWtABCad+4xnCfR4=;
        b=ygDy66aEertf6aiePez6Vp6uiPdAVg+SNlh3c+kKV7VzEyiV9wlHYjNeSC+T2kFG5z
         nSh9pg2y5WBr9O1kNS6Eo3+UWXlptZQJX28P+epI2c+QWVSi/qcPjIeb0TxSaKg7/eOL
         5dPns1ES4u81ShgOhKvae/y2wh3/OGvD6A0ep0/zU2z+s06/bD87bDqJKmAKN2waJadI
         YDRM8IoxfULKnpGM2c/GldpaRnBjQS96R/6IC/9UDs9iJRAqqFplWjHRpYeEQJktuP99
         jHOp0B0RbKd6I6Ugo72oy1KFR+8KUTRT9UGse9AJHjlT1G4qBIRU+Z+wo/CJDgGQJkW1
         64dg==
X-Forwarded-Encrypted: i=1; AKwUvBx7hjYUv3ohK1h+jwuoTUgoLoppkZrdDPPP8Unt6WHbvNGIbHuBc5t2j2/4kTiWRwVEs3uyRHcpgEbSGHGSEuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/irHtUIsw4kpWuGQRA0DGwMnZai9izUIB7cyKCDXPRMFyW5+qL
	sI4e0YOLQ5uGohD/G1yq3BuazZHW7YH5I7nk+IFjydFo/iswzo6x21P6DBSYpYn40UHxh6eni4a
	a99/2JiZIWym+aKjroAztd+xE8W9muCk=
X-Gm-Gg: AYBFou1FB3rF99FhnVPmqzxkE/RpehARKzT5CzL+WyFcrrm4rmyIdMNBbY2dHq+4moM
	6fb8mvrD9nR9WIo3XHVbXLcCtWyqwsJac3dhwdSE7tDD9e3Jw8c8vW7BP03n+asuEMzNAstLk0+
	9QpEZ5slib0L6+cMmeceWvIPVcMs3z8OoNcFNSzZzTj6wUIZzqOTOUo3A03hBov/T4yQGy+FLYn
	Z1A6Vy02ypk9IBL4AQ+gfEMMm9h6m3z+jQRz9wv9ATFIKk6sczryt1u4aZqcewFEyzTl94Ofurv
	F/gdqySYx1XCnG+q9oBHdkizdqFpW1WkztRKK3iiKb8geszIEMRAwglXGtWkNox84R1b4GQz+By
	0kOBlwF3nc81Flo1WjXFlveMFkfH76chibgj9kNTsKxNQIDd2pCObOMA63UH11KQQiR50H7xQyn
	DcB61y2FM65DTJ0NP7LajkZpA1h0BYiLdvYB+lL6hX4Ne3LixWCZhifgAkynrDqtPz83/TWa7ND
	EoZXW4o6hqnTY/dhw==
X-Received: by 2002:a17:907:6d20:b0:c2e:204d:9490 with SMTP id
 a640c23a62f3a-c4d206eeb04mr289874166b.17.1793897086336; Thu, 05 Nov 2026
 08:44:46 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 08:44:43 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 08:44:43 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Florin Badita-Nistor <baditaflorin@gmail.com>
In-Reply-To: <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
 <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com> <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
Date: Thu, 5 Nov 2026 08:44:43 -0800
X-Gm-Features: AclHuK8kDXY8JI8yzjWMA1cEKLPpuiBD7I5EcwcGty_AjuJnIHOuzNY_Tlbm3_g
Message-ID: <CADnh+D3faqV0QBm5tnqpTCoU9ugX_5j0mbkzKae7GT0hhgOU4Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: avoid false bind exhaustion with odd-sized
 port ranges
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

> Please mention the side effect: with an odd @remaining, the wrap
> (port -=3D remaining) flips parity, so the first scan is no longer
> restricted to odd offsets.

Agreed. I will state that wrapping an odd-sized range can select ports
of the parity preferred by __inet_hash_connect(), while even-sized
candidate sequences remain unchanged.

> Also note that __inet_hash_connect() has the same rounding for
> netns-wide ranges, so connect() still misses a port there.

Understood. I will make the scope explicitly bind() allocation only.
The netns-wide connect() behavior remains unchanged; I will not suggest
that odd-sized namespace ranges are fully handled.

> This has been there since 2016 and needs an odd-sized range, I would
> target net-next and drop the stable Cc.

I will retarget both patches to net-next and remove the stable Cc.

> Both patches are mangled by your mailer [...] Please use
> git send-email for v2.
>
> Also, please trim the cover letter to the problem and the test
> results.

Sorry for the malformed patches. The raw Sent copies applied locally,
but that did not establish that the copies received by the list were
intact. I will use git send-email for v2 and verify the received copies.
I will also shorten the cover letter to the problem and test results.

I will allow at least 24 hours from v1 for further feedback before
posting v2 as a new thread, with a link to v1.

Thanks for reviewing the change.

Florin


On Thu, 05 Nov 2026 12:17:56 +0100, Eric Dumazet <edumazet@kernel.org> wrot=
e:
> Le jeu. 5 nov. 2026 =C3=A0 12:04, Florin Badita-Nistor
> <baditaflorin@gmail.com> a =C3=A9crit :
> >
> > inet_csk_find_open_port() rounds the range length down to an even
> > number but keeps the original exclusive upper bound for wrapping.
> > For an odd-sized range, the two scans can therefore miss a valid port
> > and return EADDRINUSE while an eligible port remains free.
> >
> > For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002=
]
> > and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
> > although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
> > MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
> > also trigger the failure without a per-socket range setting.
> >
> > Keep the full length for the scan bound and wrapping. The two scans
> > then cover every candidate in an odd-sized range, with at most one
> > repeated candidate when exhausted. Even-sized candidate sequences
> > remain unchanged.
> >
>
> Please mention the side effect: with an odd @remaining, the wrap
> (port -=3D remaining) flips parity, so the first scan is no longer
> restricted to odd offsets. For odd-sized ranges, bind() will now pick
> ports of the parity __inet_hash_connect() prefers.
>
> I think this is fine: same-parity netns ranges already trigger
> "ip_local_port_range: prefer different parity for start/end values",
> and __inet_hash_connect() ignores parity (step =3D=3D 1) for per-socket
> IP_LOCAL_PORT_RANGE. But the changelog should say so.
>
> Also note that __inet_hash_connect() has the same rounding for
> netns-wide ranges, so connect() still misses a port there. This is
> fine since the sysctl already warns about this setup, but the
> changelog should not suggest netns-wide odd ranges are now fully
> handled.
>
>
> > The issue was triggered while developing port-range selftests with
> > Codex assistance, then confirmed using userspace reproducers on
> > unmodified kernels. No kernel instrumentation or fault injection was
> > needed. Booted x86-64 KVM kernels were tested against the regression
> > selftest, the full ip_local_port_range suite, and a Go net.Listen
> > reproducer. The Go reproducer fails 100/100 times per IP version before
> > the fix and 0/100 afterwards with a three-port namespace range and two
> > listeners occupying its first two ports.
> >
> > Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()=
")
> > Cc: stable@vger.kernel.org
>
> This has been there since 2016 and needs an odd-sized range, I would
> target net-next and drop the stable Cc.
>
> > Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
> > ---
> >  net/ipv4/inet_connection_sock.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection=
_sock.c
> > index e56beec43..755fcea35 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk,
> > struct inet_bind_bucket **tb_ret,
>
> Both patches are mangled by your mailer (wrapped hunk header here,
> wrapped diff --git line in 2/2), they do not apply. Please use
> git send-email for v2.
>
> Also, please trim the cover letter to the problem and the test
> results.
>
> The code change itself looks good to me.
>
> pw-bot:cr
