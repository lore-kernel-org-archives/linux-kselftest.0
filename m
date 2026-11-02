Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650074;
	b=uIKqEKyUi9jO3hZcte26s6UXNHAoQ+CQVIKC9lIqt5nZDvF6lpxC1lj+ufDJeA3OW77o
	 BwCk5dSNqCP9tCfWPDavPCgjk0K9U2Ty1TAm0odp796LJyWL1Dgj+MN1rJo6bNJblVKAp
	 xGeANNaAEeNxT/MCIloSguYJlaD0bfR15PzVQ2Er9iGUskPWGU6/+brmb2AEbc6920m2f
	 vC11jwrRxdWC9pfaMqvjjxJcBlLDXzCrlQDc+1JS0x4sRMTp5abar0SB7g07L+T2qvTvB
	 qAhV7reQahvCVvjfB/su8wk2rfh1KEH+joW2bpgGZRda4ilbTe7/joRpXTUyqMubl6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
	b=DS+L2nhRa+FUYt8r8NwbItckU1tB347o6NbGOjH41LLEyf2LPCBcrrDPIRXOMApz9moG
	 C2aEsUiSqSy2CzfkWSaIm2wvC2HjuEEv48bnFmjtfwOLIou2H9flX2spPjIMOaInIS8tI
	 aKUIwNbzfgHkoI+DIQdWR3d1EPWabe4Im2IMtt8g5gwgnZuSPDus7+K6OGdsewKhyqwmU
	 cavDyvIFYJCabI74v7leTJzyVmB7qEoKkH0tfNASj87AqeVphU3nTzT3PSukazmp3m5OS
	 +l5QSNUMYU/SWJFccI2BpfoReCmHYmT+XQdjqrmnAQNIVLJQKuf5QAchh7mds/R/eUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5724606A32C
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5724606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so1783a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 12:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650067; cv=none;
        d=google.com; s=arc-20260327;
        b=nQIp0zDoFoyaOYkccNOrwq2aZRQbA1wi6cfOEF0P5erfg6x/K9ViJuJkgLEEuz+GBZ
         qVqZGHzL1WU0eJ5qEzz1dUj0lr0JOYxpDRvqi75W8qTFj4025RMcVZ5fPm44MJRowUrr
         asnnka5DIvG/MUvIg+DZD5O450Eene2gYdLZW/1bDyjwse+Ozao6ASTjkPCiSUYB+wzv
         UUeRn5v17GRTYthelji9h0Tg03PvyFUV9QryM8uk8k13w78RKvXsriQ1M0iHSIQ5GrcK
         dTSVP7OSZm13ouVElvx/RlgTe85RaAw10apk6Y9Zl65FchwcBriKfWry8Abo3mWv5bwA
         VYXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        fh=m/jHjRArWJsvu9FJanDbeisR45Lbuf4CGNiuE14AC9Q=;
        b=Nsk8xDFmYRPoqUu61k61AqcA3WBPo366c3bUaSdGlY1WjTGR3nVb/MsnjB2ZGCmA++
         YN3gRgwHlPQuBdim72XHZ5UySSNi4eKfbJzwZzbfOoP9Mmhj6hptb+FO28mgF4/ym4p1
         BVLvM/8DNV61QuO0EFvwyaVpa1+pZ5qill02V0KqzWODEQ/+amOAPWWQ1QGsvJVI2Hzi
         ZDJ5BszSG2HjEBkMpoFpZF1ce7Hf7ZYhzBEh98fbg8s/k1yiGr9i0xmlkZPXDt87TWhF
         dyneEqsnb8E29HNRcJ827ArjGLAyFosat/GrPeaTuibBxX4Qco+GNitNLFPAb7DfXMro
         mYlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650067; x=1794254867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=jk8TrkOlsW97Uh2N2lxEQCWSr5BDOlLraKDAJDImF5X93emauVjuWCB4kRG5DXJ2mg
         oXi8tL+XOW49nPtI2u2njp9hmZSDUMa6G/1KMaO9Q5qzNu07fJxBg+FGZwHSPkrB/3+p
         +n35tr9rPg7bWoPu4eX8xtne358FzfbxYLhTbxaih9uGNnm8EspyFlcWvKfSR929T1wP
         PdhuKIXNMBvyc8JGPZ0UjLnzK8d/ugvhnqcVfKUScJJXgrIRL8SofUmBK+358GTHLXn6
         4DOPImXL7BUxCQKWkh8a6VYnY27wG/hPyzEY2mSBDHGTrMVjqQIyvUjbN5Mtc+HYQcjd
         XJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650067; x=1794254867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=J0KPB/WXphZPZt9bp6mKbBr1SHsAgt8j4SbgHoY42cskIwS85kAUIbOoLMO892FcDJ
         9Xl3Vlve00b2L0t4k2LeHcOxqLKs6LfWyPy8IEgotshg0uKuEq0Ev1rKtYRzzZwewgBC
         RuhzUcIpE2AYw/SusqZt2nufiqYHFnPNTnPEdJ3GsERw/cZgpnG9Sn13GtMWxlE5tYAI
         3nAO1f4Arqp+SR3HA3AyojEehDRJznPeUQZ5DroRO8H6ZZhWU6G+WbMcyRXc2VxyxfzK
         DU+VqwlGOydR3/cr96nBWRWTasAJl+tbdbwey7O0/cwP3602Pf5B94PP5TFhD3fAdEDa
         96sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxe0o/PnHLccLzeoYrxzEVXed1PlEVwd39KJ5npGOcQSjORpZlJUifcwbvP5eS27Q8BK6X4wNF1ObwMIt1YMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VQNzjNN/bq1KDYUZQbN29HVyKVjYROyB2+m+6TfS5efMDO2DT
	WVvIG1orhWqG8mjMypkuSa3q5vthtBxu+qnJ0SwevEprYkU6iAPHBtReC17kr93ztKCyuQ9S8T3
	g4bZHWfUN4DbD9GEUoqGDa/be5yRoT8TIakjuad4n
X-Gm-Gg: AYBFou1TJPnpsbDoE78GxguwsripfKqYTXZ3Rz+hEwqHI8MBZgRELevDDTAMMMM88L5
	nkd58tCwbElJfIe1Ao2pH1mYxl797Nd8N074dODNxtx32sjBrklIXB561lYEAC+ifYaisTfmPVp
	xiK0KsJSubWQPpo1bJJVHtPyOUVWgHewNOZJCmoU6nNsY6Np8Ju2v90H0jbmOPoaENRAeshsBgL
	UrXMpvNbLeLLvbTaKMp9f8S0VQwD7z0FTgRmj3owqM4S0wKBnj/MDZsqAWGQw5e5y8ZOAXia6VV
	EHJf5G0d5zKUenx+gfItmQzIVHkVxl3zlN9iiOkFMyj/yAsDTA5+ON29OAVf1MRUSSxChHF61D1
	Cm1pl0nOexCzsLXLwYGs2eRh0YBRwJgTPsLtMh9cUn++cdKwTXpIFXutOd/FCDS4fgWD0GzJARA
	1yIqsTHhO6gof3
X-Received: by 2002:aa7:d752:0:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b539cf7661mr6374a12.5.1793650066614; Mon, 02 Nov 2026 12:07:46
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:07:34 -0800
X-Gm-Features: AclHuK9gfr07IGAAZ9tA7d9yIuAWy2wfQLlcGX2KzOTTr8xZ9Khn8LIVGKzus2g
Message-ID: <CAHS8izPAaA5fNGmA6TTAuo7z8T4-+1xmR0yF=OZH6EAcQEF-RA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
>
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
>
> TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
> A single frag can now be as large as the skb, which matters for
> NETMEM_TX drivers with tso_max_size above 64KB:
> - mlx5: 32-bit length per data segment
> - gve: splits frags into 16KB descriptors
> - fbnic: keeps the default 64KB tso_max_size
> - bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
>   per-device limit
>
> Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> kernel on the sender only. 4 flows, MTU 4200, 6 x 60s runs, medians
> (CPU over the 3 runs where every flow got its own CPUs):
>
>                               before    after
>   frags per skb (sender)       16-17      1-2
>   throughput (Gb/s)            389.6    389.6
>   sender sendmsg CPU (sys)     12.0%     6.7%   (-44%)
>
> The link is the bottleneck, so the gain is CPU, not throughput.
>

I mean, test single flow please so we see the throughput gain. But
CPU% reduction is good enough reason to merge I guess too.

--=20
Thanks,
Mina
