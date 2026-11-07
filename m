Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075934;
	b=e+tKvzzSI93UBs9jkoNhGPEDY/GO4EGgRCCwfcNs0ghF0PpUDFS415i3Nh1GITwzT9LE
	 DP6DPLwGVPLb9Eznenu+HnPkr7BX/8MF3xI1zhPIh2DiZ6HgGJ+X0gBOnX6cCSAxN0WKL
	 Yjvi4d2gbiog8FgyvpbyFnOCF3TyuUlCBKeO8UF/8mXIcm3JyVr0Dgrlz8++BIDtl7Xfm
	 +UbL8urxGCwCYHIw2phxmT6apbCnBvwFofCQIbS9TEIxppXS6L8snMUQ3WYqeQApwp9fR
	 2/hnc1Oy/6ksHyg5AfiYcNKgNYc1HbrLW9q1dyky/xxEkooOzfbtrtq9Oc9E3hGwESQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
	b=vfP9iHoKU3sz1+FVi1AvBHxr1KqGba7b/vJ0i29kl9XxUE/mXDm1WtWuJcEz5os7qzlK
	 j1KMSxa4lPjWfaNMYmX5tMEORPBZBeah9goc0MdRwntn0SnYV2L8DcuYl3KsE6Broz05P
	 n1wUv4zD3ZvVZLgsGfSEmjry9l8OtI/xBg+DiTMcprM5GerEGUO7csidVDPKw6Qr9crzT
	 o0y8SoLVF5hPwmg5B0f1q1cKIDQVVyhnV4uw5OZpRGz8ruHREa04AbSxDnSHpEBpLqRPR
	 xbw1lYF8nepXaZXnpjdN/eAwjyj4PPo86qLLo5cAOVLHzPZtAgHYZIJ/XFDlf+g/+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ZXFxPfbI;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904C606A326
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 18:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6904C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ZXFxPfbI
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d58c50743so49568066b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 10:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794075933; x=1794680733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
        b=ZXFxPfbIL1yDhO7eAFUmmD5GbEzTzeTMc45MKZEzL2A15eafYpnSeCWHdGS9HOYcDX
         UfifGvvj8hDRRsWB0ca7cSl0soaX2SEyWI4E/iykJiHosDG8fK12wSekdcoB/Ws9axGp
         1udECMKCzZZi/q9tpGpr5/naHelYTBh0JJCeSstKL9TlkU37DMWbx4i+jBVGgDwwLiti
         Adjl6GsUsd2IAOjOpIiRxpGhKdEYUHmef3yUR1vCWTttx8or9aSdBiR9f7/mFqu6uMCH
         UMTAc1dzDC1giOev7pL45ndBOaDrTIvqkuZK5BsNXdTbqEp7AQ1KOCP7rx2aOUi5AkIc
         xdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075933; x=1794680733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4KEBZgQa5HXSbmQneNQ9t8RBeb6quQFAx0lvX+O4LM=;
        b=1RrsxCkrTIgeKoYYlziy8EtnscpRoRAhTpCsva4onarBn3gLjDNhHZNmFZxmH32HWD
         bi+0qs04+LTxaQSWakaEfdvSgQ8GP4eF0VqvvNz4akMStStAQ9+OwT0fPC/l6RVlZx+0
         0ipHKqbg4fjioGo5nmHqGkzUb4lv6YtcE6QbMeEHeCns141yx/PL7RLOatKxw/pL8O9S
         C6Eza0RBbf/js/qE/dmY/kvASay0mboRDurQqFzlyPCE6wHszXC5BT4+h35HacdFB5Lt
         +6xETWvceJJlFc1OLPTNo/miittGm06l/f4cGa7f53juEs2puFIml/9JYf+0XDxlBLPy
         biWA==
X-Forwarded-Encrypted: i=1; AL+hErGK5FAosveUsuAQQsLFpGX8uOH/4WK42ra3aI/9ghHPAe6BqYjYMQ3K4DEPxj2fxTxFdSzWZl21pf0PgcIIzqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s4YE6kII6Plt6NLZ/VXsPQbNew8HXkUx0UHcbd4ZHgjn6lZ2T
	780WcNLzhB+b4kupxPFdpivlHUYzZKf0rpnYzmcqei5637ivbRy+AGHsiMhVgVt3GAg=
X-Gm-Gg: AYBFou2ftFMxOiOW8CWbOocaaJpbekJ96TRcobWXouRge4Gl7LzDFToOaZNqjRjPJSU
	Q/wCRogo8FZTgAATNBQsKJ/lHh93S53rXoBhkTqXNo+Ad2FkJhIF47pidm0CpYdTf0HXgTDE1TL
	jGjkNbn/fdVnWpYCYQDeo/w04zBkC+bN1cxV1sXi0iWAfc7EIC68SXWsyoMdcZ15ine16I5nivZ
	7YLTmrO+rTttK8+2jhRIpl5TC5fQ+WijgQwNRceeCrw8e8JCMHhr0tMYH1A4gpeiv0ig2n9FnRU
	Xr4AHJrc4GcWEqD5MJbBdQosqDx/l0KSdtuZjFKHhOfi98A4LUdEBi6sH1wFOHKNkYRvkHYtkoa
	HHdLKjudhYrRbvwsrK4Qy4SvxOv1iNxCaPVeXZww/QwlhyL6vSpoq1wXlLUli1dbdGkKEKU2Jfq
	79vZwQV1xAFFxTh6jo8cw/KSajJ5rKQNQ+V4rJXNULeNRdAxgzya9nd7Dq9uT6WRidkg0UoaHIV
	G4yv6cuMNra3KSr7zxDLB0b4MPCX5/Tv71Pyy5BerCqZCerfQD/ChYSKM7jeDwTAbIqIhViAVtr
	+cACtbTM0K8zOJxwiFg7WI+eJzh6J1xmaJFdtzQDemiBf1s+LVd6GKz4Hg==
X-Received: by 2002:a17:907:3f8f:b0:c49:4450:6248 with SMTP id a640c23a62f3a-c4d34b8d695mr429135066b.16.1794075932804;
        Sat, 07 Nov 2026 10:25:32 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999f00sm644066b.75.2026.11.07.10.25.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 10:25:32 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Sat,  7 Nov 2026 18:25:26 +0000
Message-ID: <20261107182526.69543-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <willemdebruijn.kernel.1d64e7848503b@gmail.com>
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com> <willemdebruijn.kernel.1d64e7848503b@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 09:51:07AM -0500, Willem de Bruijn wrote:
> Tianyi Gao wrote:
> > From: David Keogh <dkeogh@amazon.com>
> >
> > Add a tx_extra_headroom field to struct net_device for that purpose,
>
> Main high level concern is just adding an extra field. What's next,
> do we need to add a field extra_extra_headroom?

Thanks for the review.

A user needs more room either in every packet or only in new skbs.
needed_headroom covers the first case and tx_extra_headroom the
second. I do not see a third case.

needed_headroom does not only set the headroom of new skbs. It is also
the minimum that ip_finish_output2() and ip_forward() require of
existing skbs. Raising it for new skbs also raises that minimum. With
XDP on a veth peer and needed_headroom raised to 256, throughput drops
by 2.8% to 5.8% for local TCP and by 4.0% to 20.8% for forwarded
traffic. The cover letter has the detailed analysis. veth also cannot
set needed_headroom from user space today.

pahole on x86_64 (defconfig, net/core/dev.o) shows that the field fills
the 2-byte hole after needed_headroom, so struct net_device does not
grow:

before:
	unsigned short             needed_headroom;      /*    60     2 */
	/* XXX 2 bytes hole, try to pack */
	/* size: 2688, cachelines: 42, members: 187 */

after:
	unsigned short             needed_headroom;      /*    60     2 */
	unsigned short             tx_extra_headroom;    /*    62     2 */
	/* size: 2688, cachelines: 42, members: 188 */

arm64 defconfig gives the same offsets, and the size stays 2752 bytes.

> > together with LL_ALLOC_SPACE() and LL_ALLOC_SPACE_EX(). These add the
>
> Since this already changes callers from LL_RESERVED_SPACE to
> LL_ALLOC_SPACE, could this additional use case be integrated more in
> the struct fields and helpers that are already there?

Changing only the helpers does not help. Without a new field, the
helpers can only add a fixed amount, which every allocation on every
device then pays for. Or they can derive it from needed_headroom,
which brings back the regressions above.

hard_header_len cannot carry it, because AF_PACKET and header_ops use
it as the link-layer header length.

> > +#define LL_ALLOC_SPACE_EX(dev, hlen) \
> > +	LL_RESERVED_SPACE_EX(dev, (hlen) + READ_ONCE((dev)->tx_extra_headroom))
> > +#define LL_ALLOC_SPACE(dev) \
> > +	LL_ALLOC_SPACE_EX(dev, (dev)->hard_header_len)
>
> If having to modify/add these helpers, it's probably a good time to
> switch to actual, type safe and readable, functions instead.

Agreed. v2 will make the new helpers static inline functions.
