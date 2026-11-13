Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794537713;
	b=TURRf702REx+P0eC+SU6TEQ/U+3Dp81KTMF+seWS2bGjjFNWQ1DWKAUBlpiIV+b2xcyO
	 yRvoZJ/jgsoNflxIjcljpwTzO+3srjGkRaG+RJjzZuPI8jypP7q+XThTLTtI5FBA+pF7D
	 nHA7lhOPwiESd+EYCNBoU5ZGlyGZEYNckaPsRjsymptF5pxBOvWjySuh9Qc6fPkO0ub3G
	 NgcYOHrfMAukQtrQtIEFvZEMlr6fDSoC7ZS3iNXKNqVKXZF8K09ATakcdCQv+OZPuNOcK
	 xdEDy64UxV/Bdx0ofDYuuSqS4VXeyRggLXJ769yNN8IoGfkwn0/ddc9Ajl5IdUTJ28w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pdpzle6Pnt8E8dwB1kIvSCTQN8Cx81DzaLJMeHbIudE=;
	b=bxSE0PY9zukR17/Hu2ezwrna+aLd8WOsY9hWymVnI/mn+wVwUJXSVcQuvOA2PXaIX2L0
	 t+mEkdSIBprYrzXMqtoVKxuQ4Z+MynqgoNYxkqi/j38nfZmxITfjyLDvwd3YZIaa6mOvA
	 7RmaKfzCFmA3M4T0RAju+RkQkNHadOwdhyyJb2j7xz8KICR1Sg2VJ1kE8PSB7UIzRWOGg
	 NFCD/nXFYxVbt6hiWoy5t6AKDnMpjj0OCl+nf/e9xLQSVNtw8cbLqSoi4X3uEolo5cvOf
	 VcFTFXtVB5bzt9/IUVMoR26dz6pH0RQ2dkUTZ2PoE8CgkR5TfwRwrs4aKHHQ3X6uUcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NnrIOimF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5EC606A8B2
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 02:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5EC606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NnrIOimF
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so3027a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 18:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794537712; cv=none;
        d=google.com; s=arc-20260327;
        b=rf8g2eG0WCKhzWGqUwf84Eehs3IFyARKmpKR/mZdBpH0MGkCOrzbmpMQ69i2+W9J+y
         21DUv+EyKYWs6AGmmqKLoKZmaKEPri7Y9h1n1dEQ2yli+h96v/meTDbDASswx058Gc0H
         ShGdJKkvuYQE1bk3XgRsG9kn12uoxRVuWEBa4WESAs+4MNs9JUZYt2iu/v4YA4QQoHKj
         sZcGpWZ8ZlOKVZ/xuHeEtxx0ZGm+TCbg1/9pkqWMGOeKH0rcsdEjTSsx+lHVKr27iAnT
         RKe8p3fExS1hNPXEvXlHqGAH4y+mR+GgH4bxs/U0kaU1aNW37ixMkna4GvHamsohkIx/
         HY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pdpzle6Pnt8E8dwB1kIvSCTQN8Cx81DzaLJMeHbIudE=;
        fh=6nPIvtnCRceE0Cvl7NEFBB9+twvxOQ1VJpNabyubYzY=;
        b=OYCV9+7zrK96joBPDsRJWi3pu/skbUAmfWV2BzdyT6P0tLDRPXnr48D4JsCqYKIlPZ
         4QLW7QifcXDFMoQiVKk9l6ehONdX7aegkcPP2rvXu8/NDT8vpfFkaPwAwliUYRHyKk7S
         G2kqsTr6UQi8Neaja6DQkfxvkiw1cdEhyVo46wXui8aj8beOkhXLMMBnwbK+iXQzmj1S
         jdpF7YgI3NYnoWoMFomKMpFYzWRjkHduDHdUTTpFl/uE0i2izKhNUK/ndMyIs0UYqO8c
         Tv0Dp52MsXr0C8q/6WA5QPE6nw8YmHNw1ZN5hc1jwDVjgJZw4tyNeAtMyzgu3kR2mIKz
         N4Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794537712; x=1795142512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pdpzle6Pnt8E8dwB1kIvSCTQN8Cx81DzaLJMeHbIudE=;
        b=NnrIOimF3BI6vGC40SM09d5EV9oJFLM/21Pyes2NMjsOCDgrJIGlA3VWzfqmofzG+h
         cNelntrcx7+Tcc8TfhGlDqMrfc5CZCjuGIV7Cn7xiWVs4SK/V7lHWOzXaH0zHsqaGk/a
         QXQZrYGyMYw2pfI6B/xMhdYGacPetltGjTrzGB8bWLA3vylY8oHnk3rHVTtNBn/kCaSg
         Tgqfi8UnW1bOaplq002o6euKMEKO0m1OTVvOSE+njk8/HU/Pn5C/xROr9iEEMwb0u+xL
         n6FWevJeZbm49XDifK+VQAwfcNv9eEEXHld1FByXSuUDMBc6QXYUvkq4GhYfdMJJcq0n
         5lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537712; x=1795142512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdpzle6Pnt8E8dwB1kIvSCTQN8Cx81DzaLJMeHbIudE=;
        b=rkFcuIMScOuUOhvAAit8JHljsjJruLHmzKnpd2vFlojmQPqZX/7YO6oFdug2PXb3rr
         UlprjcoHjDAzEEscW3NLh2pVK3R7DDAat0vY92xkkSE2FxEYdjVPN0PrtbtkCfNS0cWt
         /r3Q4wA3Ub8VNvoCVpDBx/btLlxUVMYuSqK06dJfxfAgwBQCuNNEVPozEACFgawbZBbl
         6DuzlMolEAKCTCcROrONHX6otbNvVHB9d1sZygH945K74Y8HDcInUWfA8VRgyhhvnTq4
         71S2dyAJkAPob3+dYZnEsYmckYSUIy4di/tYMY6qYXER33yehxHYRHxG6+y6CiECDJFR
         FBag==
X-Forwarded-Encrypted: i=1; AL+hErGOeA2leYtLvSuILFF8lAa+IEiBfHiUXT7fggAP0+dm8RGvucK0wiHUjvUMJ44eaRLiDUvZ7v2vOL/2z3CaFbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bWFpxUYXjC2dBJRmqc10VFVl676fnKDFDtPBAHj88mm7ctNhy
	33FmstA3MCKdTtKMrKtCvGsBQkxx8E2hyEjLJxUUtKdQ7g1LTWVw5FB3vopOfvSREMCrpMcAc+4
	OF7qFHAf36EfLT6XY7oykn5pdULGOw8ixYkzrPpO3
X-Gm-Gg: AYBFou0Kp0XoLh48NL9x7zky0RkKpQA+8Xy3lAiSIdR34286SkInUyBbjp0oGiSbxe7
	Z0h2QD3u1hnrLKgErmU2BRdGjPx5AmrDA+bwDLTLal3biAn8yDeNpeyS55qwEMkX2SoXi1KkqGk
	5w/uZT0PXnR93gvmcIpeDInNtyQh2FxBfBPrLXfPP+vt9CbeDMxldn6alf3oN9ierwsTCKrIW+l
	cjHXxJ8UDBi5PDNyz28SEEagNN93N5QoqgaXR6th0e6EDBxdWjWgVHGKXx0UnqWEri9W3peFfLn
	X3sSlRahqoMlTmVWLDf5guhF/6AdRgTKUOepTs6kPat+F8fmbFQCovuMfaUKgGGyc6fRxzOChjK
	JMMcjZknmf6Z+zpXBayimt91EW0CTzLPsG4c=
X-Received: by 2002:a05:6402:a552:20b0:6b6:ee14:5096 with SMTP id
 4fb4d7f45d1cf-6b7c82e0da5mr36007a12.10.1794537711496; Thu, 12 Nov 2026
 18:41:51 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111224740.2744522-1-sdf@fomichev.me> <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
 <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com> <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
In-Reply-To: <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 18:41:40 -0800
X-Gm-Features: AclHuK-OyJCj_r8mEljFvPh0-So51lXB-i51m2hOI2a_HBIhEdaQi3z8QXgIG40
Message-ID: <CAHS8izOp2BpO7WnrNZRUryGQg=L3xreF8nSFp5S2_sO8HGhqpg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>, Octavian Purdila <tavip@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, shuah@kernel.org, sdf@fomichev.me, leitao@debian.org, 
	dtatulea@nvidia.com, asml.silence@gmail.com, bobbyeshleman@meta.com, 
	daniel@iogearbox.net, razor@blackwall.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:42=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 11/12, Stanislav Fomichev wrote:
> > On 11/12, Paolo Abeni wrote:
> > > Hi,
> > >
> > > A few (late) questions/comments to check I'm not missing relevant
> > > points,
> > >
> > > On 11/11/26 23:47, Stanislav Fomichev wrote:
> > > > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page=
.
> > > > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at ab=
out
> > > > 68KB, which makes BIG TCP ineffective for devmem TX.
> > >
> > > ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> > > ~180K...
> > > > This series picks the TX net_iov size from the dmabuf sg table inst=
ead:
> > > > the largest power of 2, up to 2MB, which aligns every DMA segment. =
With
> > > > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. Ther=
e's
> > > > no UAPI change since TX addresses are dmabuf offsets.
> > >
> > > ... still this option should be more effective because the limit woul=
d be
> > > higher and the skb would use less cachelines for the shared_info,
> > >
> > > I'm wondering if making a comparison vs MAX_SKB_FRAGS=3D=3D45 would b=
e
> > > complex and if you could do that, too.
> >
> > Originally I did not want to include bigtcp to keep it apples to apples=
:
> > same tso size, just 16 frags in skb vs 1 (in ideal case).
> >
> > I just tried running mlx5 with 45 frags configured and it fails to star=
t with
> > the following error:
> > mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: =
16, needed 23" and returns -EIO.
> >
> > (fwiw quick review with llm claims that mlx5 only supports up to 20 skb=
 frags)
> >
> > What I also tried just now is `gso_max_size 524280` (on top of this ser=
ies)
> > and it ups single flow throughput from 200Gbps to 240Gbps (presumably
> > by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
> > the sender softirq..
> >
> > I hope this gives you more data, not sure running with 20 frags is wort=
h
> > it (vs 16)? LMK if you disagree or want me to run something else.
>
> Fun fact, also setting gro_max_size on the receiver gets line rate over
> single flow:
>
> I   client.c: Connected 1:cpu 39 | 1:cpu 118
> client: =3D=3D Source 2401:db00:255a:4a:bace::b
> client:   Tx389.448 Gbps (2921248849920 bytes in 60008026 usec)
> client:   Rx  0.000 Gbps (0 bytes in 60008026 usec)
> client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> client:             2   125  86      2    0 15300608 10142
> client:   net CPU 39: usr: 0.03% sys: 0.06% idle:67.39% iow: 0.00% irq: 5=
.69% sirq:26.81%
> client:   app CPU 40: usr: 0.05% sys: 2.91% idle:95.67% iow: 0.00% irq: 0=
.21% sirq: 1.14%
> client: =3D=3D Target 2401:db00:255a:44:bace::b
> client:   Tx  0.000 Gbps (0 bytes in 60009306 usec)
> client:   Rx389.438 Gbps (2921238435008 bytes in 60009306 usec)
> client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
> client:             0     0 210    122    0  999424   10
> client:   net CPU118: usr: 0.00% sys: 0.00% idle: 1.60% iow: 0.00% irq: 0=
.33% sirq:98.05%
> client:   app CPU119: usr: 2.75% sys:77.46% idle:18.95% iow: 0.00% irq: 0=
.47% sirq: 0.34%
>
> 4200MTU, 32K rx-buf-len, this patch series, gso/gro_mas_size of 524280,
> still the default number of frags (enough on rx to fill 512K GRO with 32K
> chunks).

With 'devmem' over udmabuf? Is this possible without devmem on your
setup? How much is devmem helping I wonder.


--=20
Thanks,
Mina
