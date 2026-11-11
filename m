Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794440811;
	b=RXcyUOWocgl51MKXzLhfInFCC4tVBpR63fwooNkI5BR9DRWeUuRxU3BOX9VXOKWlfYJA
	 lQ9FEadKxz3U+ksiQTCYWeyLj8VgraYS9IjVnV8MzixKaJDX1+SDlRmHrC/4FsQT4g4bF
	 GojnGaLP2ti6UefYD+rvTvoJyxhxYDqzkLv4X+GETw6i/kywkBJxTRFPmoJaPMvgplNTD
	 Yo8siUrH/W2FzOOiyYXpiyssmpx24/tsjRGc63dTJEFKv3F70oI2WnbycCGto6NW72mwq
	 IkTvgaKEyvM//j21hPnqTfi2yigESTqxh2K8m3JpZntjN8+jUv44h4C3DPT3ho4JzqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
	b=Xi/DG+cpxK5MKzfC/L0Ya2PV1d/SjCy9Sxfub0F3BMiS5Qf+b3VR0nkChMd8wJ+dzUis
	 k1AV4ecRzs7I6UEkPAK0M8IreQX4R5VXh8cBaQhY/ldb7YprINJsFHXn9fndbcHW5putO
	 U+IAGdm/UUCmRnyiM5pZzqlFbXlNG8q0ycCHom635L90vHEwNxzFXW++vyw/Rc/jIt4mL
	 5NgHBWNWQkB6iRAkzK9d93F5dG1UtOYhR2DwI0O8MMXTku4LOjHc3Dnxk46FbgO0rsFgm
	 UQ+qHTqvSreRB9x3M/vi/hZ/AhmsZ5D2nvnZayMlmN4vJdy2REQKAAeE9TVMjCfLFwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NMzD0TqQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4448E606A888
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 23:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4448E606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NMzD0TqQ
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-716c0217635so371302eaf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 15:46:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794440810; cv=none;
        d=google.com; s=arc-20260327;
        b=MbLULjk9SQCxHVme1Zej8J/BeTFgJj+W32wqXcmEOydy/ayghLP8cKRjoKH3KoL49H
         xiFgOSBqaP7uo6/p5TcEbGYr/r6wIrJ3eO9xjW1/7yOhEB1E3etVawn7Xr7rERNMqB3m
         XFoZIA33z3jaopyi6MPb6E8P2JDXaQWRPo1nAkGWfAdK7nVwm/MZATL2XPkzpxN+yS4i
         E9ZscWBPl1BKqOHl+GkVYUmy5UV2Hp2DPrQ40CX2fb+BiB6mXssmG622rowkhOSZ73an
         vt00qkgmUK57llb63t7HAUnt1b4KIWpKFDx641nu7XqMv0YAIalA6/5seONJwO4NKKob
         wF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        fh=jlZ+jbzYGlXFDoGvLlvFlEAoSNPiScZIf67IZVQPSVg=;
        b=ME/TSnnYBYCJIO1sogOaQ66BqIi28fEHakpayKYrHZ5gbrBzHJ6M1gm2kx/+wpnsF2
         XhKsnKEOyPO3zd+RMd3RLmEf8478UWRFN9hB7e/aDd6SIpmFsVv0aJQfkuzvFpFD02xA
         F/7cbFxtlhqsLkNNZ9uQogkObDZp5OmUwnkMjXQo9Eox8kS9wxwIyzACygmQdKO7ORt+
         o0vWOXlSaDgN8UKXNkmVUcdDOCgY5bUS9eKDVc19cmlNebbgqpU4raUWi+LkfaJGmE3K
         buxCeR6KwrpVnQ7RljuPCv2SbSYtG9RJwyQGY+jpB5lPj/dhJHK9KMeDQa6uE3Dx/lVZ
         3z+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794440810; x=1795045610; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=NMzD0TqQuwQhNFF7aHIeC3SA22YiAV6mClPOc6MrGmoClNILecdh5gv9EaYatBhdKE
         S1H4sFNblnlve+OJ5uv+CLBpCh3zyK3uPT9kEdQN0l12HoIbPqEJlOF9UoFWSkvyP+rJ
         3mNTQlsFv1mTjxeytumNxJdr4WJuHO33aTEDzdBhhksudoGOfutqWottdoB1bfhO6aSd
         y367fAjCvv3590WzqeHb+Op5WihluIRpLNtFeGoYDaTL1OBZfeAsuyTJH/7XQqQHlccp
         0Hkjf03LWm6Ft/NQ3NDaVlRkGHvuDpIkm3elkOCI9vAVjkFFQnT19iVmrD5Rtd8pjCBp
         EfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794440810; x=1795045610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qNTqvp880V1AzQPjbJWvL9f9zomucT2LF6ZlJcI1BTI=;
        b=PVnjQFMQL7AHEvEIsx7CZKJ2QGTKBSljYknKG21xUkepIE0KgNUjPbfPXzRip6JBA8
         OGroZiMsiO3o6G3zfMldQElqp2FmSgj7jSysxoS6+1OTwQuvnQu4gJDcDkND81eOZSAr
         phsdB4lbrdtxgdYLk+L9NgFLbB5kIMQ7oe1K+jjD6Zdc/iegyifril1RJvaaD/+GvKac
         bZgwxxY361UE2H0CZBTotpRGu7AbMaT3S9QvKGu8GdZI1yEmJ90C1lhU616b9QX1DpI7
         fPDyq12evaIF2ZcibKwyHgfeDEDrmHz2WdJVp7o/sVGi6Wg33/ZTVUjYKuM4TWFqKQgC
         QoHQ==
X-Forwarded-Encrypted: i=1; AL+hErGdVdRGE0ZbRfTG34dDRaanvsVm+sGN1RDfTlu7Z9rCF+qycCrycpgusIeM6tEEj3aO6/xkU/eVzl1ndoT3JSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6VKvPdoflQFvGUXXCql5c7I8ZsXfg+wvrGXbfo7RbOLcCcljj
	Q5T5/+k4xivvdLRzzwO/g6n4uwymGyNOtZa2FwwsIaIPun/ucQK0ZsDQ3vwa5CZ5vPnWXibtidU
	hgWMQRsfW6Aig8D2Et9x+UbCfSMAu2Q8/VoXReQEhWg==
X-Gm-Gg: AYBFou3aqZZYLImfDm/VgrgAIgQXksV61emcgH1jXh2ofocO7Dy+YMAuU/GHDDxeERJ
	/147N2pRztOYTIqVyPLJz2zqOhiTHF3FwAHUFpACzL4uvTbSYj2OBNoCFSTBLb0cA4Yz6v+f5Uz
	4N/b+0INf4bv3Slx9QRkzf+GrKgmJHLN57kwaZbJ36MUcyV4Duzrzh0jgVmXnW271zClYWxKTKz
	17s9NWWAQa5R/8XLnPndY2egMqS+wnHmyjQ03exuZ5gEBIhwRmAIGbmV4PnDAG2xdicXHwkX2HU
	n5j98kp34dM6ZKd8dcbGbCeiNb08DhhxVIMDWW2qcYgOny9kM8N29fv6fWkX+xlaFQJo+syPdn6
	R6KtToKD5zcwmBTDaYTgZE2vDY95RFI2iBbssU0ukA7gZ2HuqULeRg8vI7NShA9C0o6aFVXWbHk
	DcAVuyW1qtVw==
X-Received: by 2002:a05:6820:f004:b0:719:1627:6c16 with SMTP id
 006d021491bc7-7196b62ab2dmr743911eaf.12.1794440810117; Wed, 11 Nov 2026
 15:46:50 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
In-Reply-To: <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Wed, 11 Nov 2026 23:46:39 +0000
X-Gm-Features: AclHuK98I8l2CyqIug_hRhhYiDHFe7Xrim7_SwhM5rRiI9ms5coKAG0rV8Jl2JY
Message-ID: <CAG4wq-dw8VqiVTbi-fSJTnwj+amkfE_56ndKCYk4v31z2ppcTA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"

Hi Stanislav,

On 11/11, Stanislav Fomichev wrote:
> My main concern is that we are adding a lot of code and one more
> special way to plumb the metadata (and another metadata area), another
> set of kfuncs

The RX metadata can be stale on XDP_PASS and lost on XDP_REDIRECT.
There are already separate attempts to fix it:

- the RX hash and the VLAN tag [1],
- a checksum assertion [2],
- the checksum invalidation that you suggested [3].

For me, the question is not whether to plumb the metadata, but how.
It is not great to have fragmented mechanisms. The skb core extension
area aims to unify them.

That is my view. What do you think is the best way to solve these
problems?

> and slowly creeping more features into xdp making it
> more and more like skb.

I will leave this to Jesper.

> For containers in general, and for fast af_/xdp, we seem to have been
> moving into netkit with queue leasing. Maybe that's something that
> can help with your veth performance?

Thank you for the suggestion. Unfortunately, it does not fit our case.
Our XDP program decides where each packet goes, from the inner
headers after decap or even partial decryption [4]. Hardware queue
steering cannot do this.

This series also covers cases without containers: XDP_PASS on the NIC
and cpumap load balancing.

[1] https://lore.kernel.org/all/175146824674.1421237.18351246421763677468.stgit@firesoul/
[2] https://lore.kernel.org/all/20260630191510.81402-1-deliran@verdict.gg/
[3] https://lore.kernel.org/all/amEojEGsIGkUjIWn@devvm7509.cco0.facebook.com/
[4] https://lore.kernel.org/all/ca38f2ed-999f-4ce1-8035-8ee9247f27f2@kernel.org/

Cheers,
Tianyi
