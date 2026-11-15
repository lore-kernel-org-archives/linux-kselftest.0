Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785807;
	b=f0E3u/ogHhyIL5XTCEdniJo1W1/LS/bpH8Ce2cyrc2EvSk7x0PGX2B1tAReaxaagy9Yz
	 fLA1ZaM7ZIHexpBBSrj5RoOdokaSFBZAoqki7W/gr/mIwmX9O5qBrleeRoN1Xfgg7GDLb
	 Hb5imAkr5LRWCYnOGuFzxV8f1g0OITXX6F4d32Ikn/ZhIYmknCebGAXgNVsS58y+N+C5s
	 UAsqlHekJsVSDSxCrckyuxgbyP5DSAsMzesLGuihmvXP+M2U4w/ZaAdXoONUwb4gZDIvW
	 rjxAF98D3sUkxTdiM2JJtuQ9sWEb/kABq99N24kWvVUYXMXSKZXkv34UwgWhJ0RMoMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
	b=1dm5mmsIVDCu5NORl6mDAfyh9r6rWXH/47BlCU9OkuFdH8+Ce7FB4t0fiJHZT8VlgbAf
	 B1p+UxP6eDXRY0ROEMYCQZWasplGyJmmzJxqhPg2V+TofsxVMuLiDokrDNd1CAUv8Uxa2
	 Coiv27Rt5UKVIBJDTVqHZzaNQ4FC/ttFZFVk22SumjXBZFVeJn4tm7ybvsULCa3nbHk61
	 Zdf1v3W1hTov5/uzAHDzOa8hzHA5nqaXpZzMkmHNo3Y+WmfJZpWJfa1ms+yr0iDvfzH9/
	 fO3JTPVBbfBdvE8a26icU8fsh60SPa7QLBq8qjuDFH6qA5bfEp/GgSQxH+nU+InyU6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB704606A32F
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 23:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB704606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Zmpxi2jL
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f1fso3295667eaf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 15:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785805; cv=none;
        d=google.com; s=arc-20260327;
        b=A/FVtkMqYbVWAs41baYLkEZ+WX7d2a+oS27mbVmq8ZPkBET1/7bjWEsGJMbLyIidKr
         7rVk8N8IQQEosuhuahipo3AnUolUInuKLmY7rL4EcF/O35S/EliIpvgD80Xn6R9USRoH
         XIrAfY4IoaWg0e7bJpGpOQBS2LYYd+o93sEhEoXibKwnNErgF8Ze6+rWzPCahuqKJmzk
         gU5GkeuH/Xe+BH3gLbD3kLJaz9nmjsMK31ebM+QrjjiT3ptHaPXDQqndFSotgWpPze96
         lzaBvxeSizAeXPFHVjLw/k7pLbzTM3SoCzVP/F+7EHkxkRjGlCuBOSsfIc+QAPZhb4Za
         N8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        fh=es+0EV+Zls89nLoolZzUAzweu+VtvG9j76zDxe0W9SE=;
        b=kIJdJeWITklzLIluYX76oXeThTx0Dzpqvv1B7R2wIKKRUJ+uJe6jkJGZjK2TnP/SkH
         NEO2ED17hNSwrbfKheCFKooo0iAcUNi49XMx3F5OAd+e5i6xfsB8noiMA7Mpvu90L8CE
         7DY4KrMJW6QtkdVSUvoEv5KCMf1kWDDbJiTlzDso3T/reSm2ll/VP3ilb1Rqjns80jB7
         ymy7w+O7VEKFfAt1WLyz6d8dMWlv1wmBbCCJiiofsSl8BFFKs9yv5BIJWS1+CE/nfkR0
         dZcQH9JJTDMAEE483BeVFoOldJ22TPK5tK4egsji3oZRnY7hszu1UVB9q0Iar/1Hd1Cz
         f5UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794785805; x=1795390605; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=Zmpxi2jLhXSm+xCyJlTdzyhYrYxOhwtwnZiPPOViT6SmtKy4Igqbe58in1dXdljPa5
         odULis3BU8aEvIzMrkCPSOWvtShZW07qQQKGRG/uCEK40LNJvS9VS1MHC+1cK5cE+88x
         Wkakd87wbsOKtHD+85cG9Y8BDYm21VJUwuormhJMhBg6ms6ZqxN7bKewkahZAArP4k5U
         4iyaONp5TNg1pYjLWDT0L0NCPwogNvCbKN8doTyDHkmy/1O8TDtKGuMR+ZhV1GvB4GjX
         YNF9M/z+z1n0JUvO57uhcw7KQgxPFjtEqMAGWnxKoh3OFvh6kp8Z0a12mv3XIxy+drs8
         59Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785805; x=1795390605;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eiEJgJLTePDasa4fCxlIDYNvy/YXg5RoYnLKMhW0V1k=;
        b=drj2Tq0fXiosIBvHAQGnBroSGVKrzuMUUE59UyHJSeE1DjJFtXzYSTJOONPbGGaQ2G
         g453lkCD0yJv4Q2RydziRZmHm/ZmFq03Mca1nS+P21ogN8fVkY/5NwFVqwxvdidrHiYk
         JwTSl+K3UQ56aWtvrze1LXoMdempx1pYgecDgckFnaxQu7XSuPo5JRcxtP23b/hSE83s
         4jYelUQ9gspo6U8+Nz/sPqRdywUqfZkKKCV84GDLMA1C8ZpYhFGQTCkg60WQmQIj/dL5
         Hz6EWjyaz7QwoiZ0uvhp8fvlwbamwXYKjqiXjYYVcafIkcF7r5bHljtNTCTLonH6tKVQ
         2axQ==
X-Forwarded-Encrypted: i=1; AL+hErFnC7wn6i2jdy0ZcmWSUgVPWlePX751L4jsCsjx7u4kYGFFww/pDdHrAxT9u8VzH4qZGLUUbKy05o70ohNW3PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AFsXyjrdkQUbXbXAGeobkZnYXrgJmmOdA7CsZ2vzzdR1EozVh
	TJcuOS0X+/L9DolTfr6Agb9325Li6Z2NCHP3cXctDcZFYow6R2hcuvEnCvASW+oaXheeumTvMlF
	YkAhvS51FGVxdENTxZPdFF97ijmarab5HBomx4O9ToA==
X-Gm-Gg: AYBFou3oPgkpA9jozyRqD4r0ib2XvAWo11jA5hD/mLk/q/1rM4shK6RLjWj8lr3q3bE
	ZfShwN4s4FT5ojnL7+w2CBW8kFTTIKu8IvPjCZl67LKETLTv4+nh/kkT4Fj5ChW3cyfxpEcl9Jg
	aNiGNc9CWoxN9LJwGNrfEZoELOzG8RuHk+6qGGmii4lwIrgRlTP6JtCTV3hUmniUDmxLyVxlTSQ
	ih+rW3wtx0zwCnpIXretReMb7kMBd2JBCRJlkmXpfX3KH0PxqQzsm/9SXCmu0p+lYqwNoOFVcir
	OAVLV3cjqjw6fWcjhAYPK4EveYaEG2M2tBy3vf516RznxnUfsiqCoOA4x496ZFmqP0U46y+QV2a
	sb1HNskLwMPQdiwUXMPpGb7RtJ39pL/7v6XwCYkjCBcbaJ91T3/K/Jw4WBNQrj/Kac+5YNSY96p
	b1/dV48WcubyWdunXtGIGfz02mnkolUB8=
X-Received: by 2002:a05:6820:3411:20b0:71a:f794:49af with SMTP id
 006d021491bc7-71af7944afamr223598eaf.56.1794785805311; Sun, 15 Nov 2026
 15:36:45 -0800 (PST)
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
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com> <20261115113902.4834dda6@kernel.org>
In-Reply-To: <20261115113902.4834dda6@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 23:36:34 +0000
X-Gm-Features: AclHuK-Ta2Fkr4hOVhZX_y8Xr7mXxa9_sbD5R_U1pL1RP64y3ME0zGRwgXOH1aQ
Message-ID: <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 11:39:02 -0800 Jakub Kicinski wrote:
> On Wed, 11 Nov 2026 01:07:46 +0000 Tianyi Gao wrote:
> > - On veth, an XDP program removes software GSO from the peer, limits
> >   its MTU, and can copy skbs from the peer.
>
> Could you remind us why you XDP_REDIRECT xdp_frames to the veth
> if you end up allocating the skb on the veth, anyway?
>
> I thought that was to let veth run its own prog before skb is allocated
> but you're saying that you want to avoid veth having a prog, so clearly
> it's not that.

Thank you for your comment!

XDP_REDIRECT into a veth without a program on it has been supported
since commit 0e672f306a28 ("veth: check for NAPI instead of xdp_prog
before xmit of XDP frame"). There is demand for it [1].

With or without a program on the veth, and on cpumap, this series
keeps the RX metadata from the NIC until the skb is built.

[1] https://lore.kernel.org/all/20210416175929.35c3c389@carbon/

Thanks,
Tianyi
