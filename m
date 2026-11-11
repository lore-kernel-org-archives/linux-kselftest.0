Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435917;
	b=vaHSbYjk8/OQRVD1MRYo4LATQ4jneYu1rgfJthw77dFQzT/icYsFCHu2+CXsix0dMMSt
	 7tzo048OXSkTemh1AntfjLgbKBqQ9TbrwusPFXQA3fws36sugIZhX+ehkJ2eeokN4MBNN
	 5NVh2MvMxF7xH4XL1O2o0Y4YDNUoeSsyi7uTcDmcykkqrMr3b9MUe027P4HN59wv6S8vQ
	 f6zxRNemCgxcMT1+bea93B4NHO/uVXpFAbe1FuCISAYONel3EykhieR318eXFdiXD97cQ
	 y06k7ssQBU3lUEb/BgY5pKoq/exJ2ui1wHd8Ra1nKo9xQjXscHuf77xBiERyPjfpbHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
	b=052/Xaa0LcAIG2O0UKI7qNZPPQ67pTFf5HPyF7L55fgnvOzcInDHXJbb4KK1B/NhdnDc
	 w7fzeOIoflMe/6uP1lLeaLV1sGpNn+ic897J1oxhOcYIZMkEdWUgvKzjrHKBtfEjwR/8A
	 uGsgM89P28tMzbcN6+s16eOSJ+1F71K+aC4WGb+Ph+mcT/2dMGea3Kt+afNMlvPXmu5t5
	 iE64CFqWOpu6zuj18rNBMnDWS4fjPPulzV5jIZqJAqWc4iPwlX2I60suts7mlD9ObVtMv
	 r8JOpXoncrcLZlz4Uc5NebhQS4/I6ptNcEpLELkkpUEnfshJQAEGgsSVhUz6GZ6PqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WRxwN8/y";
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D93606A324
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D93606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WRxwN8/y
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so971638c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435916; x=1795040716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
        b=WRxwN8/yRQXnBMs79H4zEYpeGEdBg8BnKhaHIb1pRpEfUeouvtNDop9d5/n4XDIsTE
         bS+RCTNz2dFaoNvhaPgORvboxzRWa6ylYl/nYhEZ5DewOd9+xQHb3ySenQgqSb3A3aAB
         EQy827yfXzHAx0VVyQT/26oNznABcK6D66SnLGHhy387O11NbSMNyPxIFHGmHX1Mix2l
         6mNwh1bPwiaWQ0K4p5tC9qsb/pgi0MigrZTf6G2BFqiTQ/4H1N8FfNfOVZccC6GSxP3g
         +lo10dqt1ZyMjXI9qhOjp9SauzZgLfWXaLHu1tPrqDh+qWL6hHkpxkqYzy3Mq2Asx7sU
         qu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435916; x=1795040716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcIgSNREManU20T5ds32E1qosC1xbF0e9vbPmoZw/SM=;
        b=K+EJ8UIz2lVfy4vp3qT4SAgA5XX/fqnAr+qsgVcv/QJLvntP+gSAPq4SYjoL5bduSP
         Q88pR1/G0Lu89tbgrvxxCEv8a0gEFDdIdYUIvlA6FD7HcvOaJUXhq4pKiKJZLpPqLPf/
         7gKFRrSqYxrsVRh9l+t6QGczDjJLYhGDVvdmCSXFPlHDIDuDQCHBEFl62CXUevrF7V0z
         dIQR2Xz2OexeEH6rVuFqMW2jEdWl9HRN/V5oWlFdCEbjPVhLdwvh9NCNCQEXW8z+u4CY
         FITQx+2fQ42PYPUPzdIS8J4qLvxvxdnY+8PbwGbP28nNYtc5oTAO/nEFhZF0oWVme69P
         myKw==
X-Forwarded-Encrypted: i=1; AL+hErGZQtVZ2C8LhD3ksg+ZUsBC1n/3vu2vGokW3sIqVrH3+HkXF4xb4TXjTPZgsRVzA6wDhP2aVCe/OTGHKMPp4bo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ildcCtG+kQwBq3V5dCvn/v+GMYsFS3TIttumS5SKO0cuppQzo
	/rhHB5IbwOYyOKTQWHeqvFCWVQZOABhkVHsfdoP3CNs7B1Q2wJFcgYz7
X-Gm-Gg: AYBFou3FTwqB8neb61BiwOjy+Yn6ErmWgl8yKBRQ91CVgkaY1iX0TttH3df22F8nmkD
	AdajwzL6gj3VWNWRvGRVTzGeDUVbT1cc5MjIsWvfgw5m/rPWa/tMViS6Nw/unDM4Rs9xgSthRqr
	5cFtN3olgsv+s8R/kiLF/r6LyA7I9Y50J5LxHiAZKybJT0ZNExP8yGrj3NgSPmhGaVXg5auRASo
	hyIflKzxUcwu/HqV+bF01O6rlAW3Mq2zon67dUf08R4mP+5IjgRtedYocKvvzVoq3N1/VcQFeVA
	xj4GTpEoxJ078Y8jbl2IsbuA9gsnGu5Sw/LnSKDwI/4+UAi+rhUJnxuHfB0+cnQjW785a6O9t2/
	4jksOdpha4RJUhIfBVpsRVkI9RiPrL8CJAB0BwP55PomdQsGcmgqlPKj6QLsdxcSe8DUR85jUku
	FSEC64UtWFdhq8hZ1YK1fSSTMM1RMZ+kXl9Snog5YY8//NdrNnzTP8BP1iassapbbbAOPEDT55A
	iT52uM7ZXbJ6FMNwKzmYUjI/xG8A64GOS1jWFTZWjIYOxFxSJn+KYtWd5OZXgiG4LvbIOSe5Rqa
	YlaeBtRGi3sNP92ivLAOEVo=
X-Received: by 2002:a05:7022:286:10b0:1b3:a23a:d1f3 with SMTP id a92af1059eb24-1b3c03037a9mr3351998c88.18.1794435915687;
        Wed, 11 Nov 2026 14:25:15 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:43::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm20682923c88.3.2026.11.11.14.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:25:15 -0800 (PST)
Date: Wed, 11 Nov 2026 14:25:09 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Vladimir Vdovin <deliran@verdict.gg>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, llvm@lists.linux.dev, kernel-team@cloudflare.com
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
Message-ID: <avTqb--WfUNBcEyN@devvm16445.scu0.facebook.com>
References: <cover.1794281983.git.tianyi@cloudflare.com>
 <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
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
In-Reply-To: <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>

On 11/11, Tianyi Gao wrote:
> Hi Stanislav,
> 
> On 11/10, Stanislav Fomichev wrote:
> > Awhile ago we discussed the alternative of adding setters for xdp
> > metadata. Then the veth (or whoever turns xdp frame into an skb) can
> > apply whatever metadata it needs (and there is some magic behind the
> > scenes that takes it into account when creating an skb). That keeps
> > the layout and most of the code outside of kernel. Have we considered
> > that here?
> 
> Thanks for the reminder. Yes, we considered [1] and [2], and took
> parts of them.
> 
> The alternative setter model in [1] requires a program on veth or
> cpumap to call the setters for the RX metadata. We want to avoid that:
> 
> - On veth, an XDP program removes software GSO from the peer, limits
>   its MTU, and can copy skbs from the peer.
> - On cpumap, each entry would need a program only for this.
> 
> This series achieves the same with only the XDP program on the NIC,
> which stores the values with kfuncs in the skb core extension area
> after the xdp_frame. cpumap and veth take this area into account when
> they create the skb, which is the "magic behind the scenes".
> 
> [1] https://lore.kernel.org/all/20250616145523.63bd2577@kernel.org/
> [2] https://lore.kernel.org/all/aGvcb53APFXR8eJb@mini-arch/

My main concern is that we are adding a lot of code and one more special
way to plumb the metadata (and another metadata area), another set
of kfuncs and slowly creeping more features into xdp making it more
and more like skb.

For containers in general, and for fast af_/xdp, we seem to have been
moving into netkit with queue leasing. Maybe that's something that
can help with your veth performance?
