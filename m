Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423678;
	b=cV3zE9aeY0wnivS7vtCKdl6X/TuhUuo5mxZu6ZmkiJqrUQDYIn/3weGjcJetzeBq99rZ
	 YKfWAls30SIXSl6nTNtY6F8ASLkbyvWfFfe7ksjJlUwFFAw9glgD9BC946+Mzeu9d5JER
	 qDRZOS5LSUQ2mq1O/cQBNF9tSu3NrSS9bq7G1tpyiFtUygc8rrBPi3o+9feKYD+ynFBMe
	 zOmg8ZEdtiVBKmdcPgeDWQDiDiRsY/iI7ORMZNiATkeEEK/8x1bc4wuqQMMtAicCbubJX
	 kPoHxDIX6qK+QNy0Vsc+frIpYwjo1TCvFAMIsSkBW2dcdbi5Lf1AWI4SetDewjc6yAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
	b=reSSyHdmbIG6AOvJGarFhlZlXR++nZ9wS/iYK1ONfiPLSyWP5hGNNyGVSfUEbhGHkgAc
	 1fGK3VeKK+vlatRStjwhzo4TcvrK/+StpJJIgru96BvoaboGz0oUTxIhyk4SQK8Z/ouHt
	 3ZemNnNf73JTf+8sSEkxTnRF7SbRADVv5nUpg4fm7lrRa+C22gV2D71K8blC42P2Izf+r
	 wKudHc4xdw51+6I5Dcv/dQ3QtWtcWY2SQsGTzmI2bE39oUpoGw13FZW/MrTYG34wnSgRN
	 1dd1vfsvpr0BrR2RQhZavn0TdlfGTAlDZL0B1Kndrux6n18hIG3jNwn8sBf5mN9M80A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHkRigWs;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD8B606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 19:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHkRigWs
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f1cf92c9eso337137785a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 11:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423677; x=1795028477; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
        b=LHkRigWscoO1IXIQFs6/S7w1FUhRnu66lP+me1F9tp+woQK1t61v4UNNSyggqb4mOX
         hkOb5/IVXmfs4ZveeHLDMgbH2NVuzIEY/J/WPy/shFxDKAiXJz6IbXyPUV4ckFZ+CsC+
         c9gkmXH6qx8NuT+7knfat6nN41LKdJI5AqHmXOuhg18s+O76DdTa+1UL8roEbcvId/Ns
         kTG/VWDpa7xwT+xoPmwPqh3uf6iTwuE9zBLajqn7CgcAuA/eMNIzXPPLnoO373jqfflo
         BWXGJsKWiNERilvEBM6NM78A4lF9eT8HO6VECVYKCKap11URDX6Ewiu7J/Bp2B4VyeQc
         r7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423677; x=1795028477;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mcdsvysa9luSuezEbeTLmuh15u7mjwAepQLZ7oOKD4=;
        b=xQkkvGLSpVuvSTOyj1Cs6MYzdbHG73wai+PZFPtx7jz1XtPTG3LKBJ49gMHJCqRmzA
         Al8fIVpvOC3vAOIwGXecVYgGaF8ZzzsMJIWpiFIJWXeYJ1o/SBsooLU0TGyKK9b2vfS6
         o3cXOmzQQmKNamoFj1Ibq5FLJpSLoZusS/uRawGv92Btl4HWVq+/mufoR18RQfxyd7w3
         er9ylpCtsWqszmZOxSE3YytLKF4pKxyrq83I78ebsewFkpGcBaAnp/TJxrBypDSu25t4
         ImHzdKj8sHi6426D978nu5Qir85lUCt1KwVQjgjPaHKghVgS+XRN4U8+N6KxKgpMVI+l
         jBtg==
X-Forwarded-Encrypted: i=1; AL+hErHIxbsoENv/2Gjf+qXatQ+XmMmZJ1BeftdW/5ZuSCMEdkP7ABt9TwPcAC+HHTGKp0nvKr8iSXHGNzrV9xTBlr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XkixEPl+cFmLoSPG+KAyV2Flp9QunXUJYU1VjRLkMhMnQFrOi
	XD5ZZ/WW3LQ6q1kX3NUw7PL+syeowx3nUUDIj7DeK1M5aEBrM+UFIgCH
X-Gm-Gg: AYBFou3aOwG8mo5GVcHyOmLS+fy8+WSoli0Ym4KSB9r1mFOsCGlS2jJ8Meu/BXEMK9h
	DfPI+3CnGF4nWKRWfnUpNBaUXVG44RXuOrBzLDww1q1vvM0OKCkHrCjHKrZT1vpwAmoihPceFUk
	pkVoV8RsXlWxLRFnQx/Ao2X7TuG5dsSlhX1L5NtEKTQ/wONMx/GrnN+Dd7B9rLy+M30S6iDe09c
	YRot10JvG0uVr17cfg/I8s+gJDIw7s+YrDt+r1ZT+Fw9G7DgPAYIjp1nwEopIzrWetagL8OsIhm
	KG0PzHs0jnRMZdcCaU+Klyfz2mDRaoPWwI5j+Ekb1E9VOSr3KNzbx23mdnEMkhFlvY4aCbyqPZA
	f++VvevwCSraniiYWz8WedSoKXzskW4iF67VwZpuyWKzjfaP9Z45SMs5T6bBIcbL/amtaeXMGNz
	W3M5UqshG3p6ZDOglcc/oHlQ/kfY6dfdaQJDXtG+tM15e2zhobOQr3FNKxsAc7BRH57Ok/6d19W
	dGfx1tVcVU9um0XmII01xHkeUpnhS6U4/t0twhdQobbgR6TRhmfYwaUYuQLZM8Pm/DbVM7410yf
	0gH7+ehtnBUx3lj3ENY3uIOSRgJEFTXVLpp5Q9WOBvKBKrLHm2Ey8JQ=
X-Received: by 2002:a05:620a:2b96:b0:93f:53d1:54c7 with SMTP id af79cd13be357-947b00d141dmr521152085a.70.1794423676923;
        Wed, 11 Nov 2026 11:01:16 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm545314185a.10.2026.11.11.11.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:01:15 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 14:01:14 -0500
Message-Id: <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
Cc: <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Donald Hunter" <donald.hunter@gmail.com>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Jamal
 Hadi Salim" <jhs@mojatatu.com>, "Jiri Pirko" <jiri@resnulli.us>, "John
 Fastabend" <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Bert Freed" <toddfreed@meta.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
 <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com>
 <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
In-Reply-To: <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>

On Wed Nov 11, 2026 at 1:23 PM EST, Todd Bert Freed wrote:
>> I'm not sure the kernel actually needs any bookkeeping at all for these
>> generic rx spi allocations. You could probably just pass the spi, dev
>> id, key, and probably rotation count (as a device key generation of
>> sorts) to the user without creating a kernel object. For socket
>> psp_assocs, the rx state is consulted on the datapath before queueing to
>> the socket. For tx state in all psp_assocs, there is the possibility
>> that an SADB handle needs to be cleaned up. Neither of those apply here
>> or in the rest of the series as I understand it.
>>
>> I figure the tc ingress rule can just take the spi and dev id by value
>> rather than needing a reference to an object that we create here.
>
> That is how it works in this series. The tc psp decap rule (ingress) does=
 not
> make reference to an rx assoc ; instead, it should have flower matches on
> psp_spi, psp_ver, and psp_dev. That effectively ties it to packets from j=
ust
> one rx assoc.
>
> So why keep track of rx assoc objects at all? Two considerations.
>
> 1/ don't accept packets that correspond to a stale association. That is, =
even
> if the device decrypted the packet, it should be dropped if the device ke=
y
> which minted the assoc's SPI is two rotations behind. For psp socket offl=
oad
> that is enforced in __psp_sk_rx_policy_check() with the pas->generation
> check.
>

I asked why we needed to keep track of socketless rx assoc objects. The
above applies to the existing transport mode code, which is my point.
The rx state from the assoc is looked up from the datapath. It doesn't
seem like that is the case in this series.

> The spec permits SPIs to be reused immediately after two rotations. So th=
e
> device could decrypt a packet with a SPI that is more than two rotations =
old
> in that case, or if a previous packet is being replayed, for example.
>

A SPI that is two generations old will cause and auth error on rx. The
hazard is that an old tc rule with a SPI from two generations ago can
alias a different SPI from this generation. Userspace can just flush old
rules before doing a key rotation. That is why I suggested including a
'rotations' attribute, although that is probably not even necessary to
keep track of which rules need to be flushed.

> 2/ hardware offload. the solution to #1 should be able to be fully offloa=
ded
> to the device. psp tunnel mode will be hw offload only, and is implemente=
d
> in the eswitch with connect-x.
>
> We could add a psp_gen flower match to replicate the pas->generation
> check, but the device has no access to the pas and can't offload that.
>
> Keeping track of the rx assoc means that the kernel can take action on th=
e
> "this assoc is now stale" event. Possibly by enumerating the tc rules and
> either deleting them, or marking them stale for userspace to reap.
>

I think it makes more sense for userspace to just get rid of the rules
before rotating the keys.=20

> -Todd

