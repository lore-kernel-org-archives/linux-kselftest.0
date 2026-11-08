Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794118923;
	b=itJ9c9YRrzn3XqwUjoRk6qiriB/soArlGjq+u/o/dCatZKSYPT3knRDjG04durKj2WFm
	 TrpQ7iKkswQhy3zXaJcjSMU+x18RihJC7Hn5IcUXcbKC/3dXB0d86Uo4yFWTulLOWErmE
	 HToiQNvXF8HN4CzRAg0i3nAnYM29MLCFNmftiMV1RrFXulXKqHMbW9fTtCQc5oM0nX8/L
	 dF2mRl6FPYy5ROaMB6Q+7z2glzhy6pKudbBUoel0Ia8GxSu5lFr7D6rvhyJ9epBmvlXII
	 t3EghD3y9Ehkthy6GNaZR4Wmdr1oidB4DLeX5jc6H0jRLuOFPieUEB8N9ntKLf+5pYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
	b=3xJtvWa+WneFeWRcw3TCumI+7RTXx3kqctFPb/OnrM7qGE4cpVN4D16VVSaZugObNg5m
	 OqDf/WQezGHLu14y/7quTtoYVcOnJwe7qdcM0UtsSPB9Xly2qkcI+KQTcEG2mfkfJ8Q91
	 AN83pZ/DBAXa8zOXAPcwsdwzSLboOCSjp5CkiNcfg3SSwgLvzfUtiuwQ46bgbwNRQLtJc
	 iUUstJlplvY5Rgd95p26d7VPyyAlO3UgLAjGamzQF44NuJ9GWlBAA5TnsHeq0UxTzOcRq
	 7cXidAh/B0Vo0YM0NQ42HG0BL7ILDtGec40Mrqun0BJbINxAeC8S6tacn/h/8QBLIdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1B606A321
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 06:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0D1B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hUgHyzbh
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso144a12.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 22:22:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794118920; cv=none;
        d=google.com; s=arc-20260327;
        b=eaBd8Pp9SWYzyPuy0gbDoVKJyKdZYBidiSk1HoQVU1xZVpiv0cyuKaDU84glKX6GUe
         Ct/Qoq+wVj9WxPICMDNi2Bj98M87MKs3sDUwmhH4MQZwwcMEjqBd5kDj24NtmzplP/ws
         JZnluQR7o855MnPXF2EgHwhn3eWNm1sRXpBBA7tyDpqUEaKJILqhtcoPpTIr/qqhrACC
         bj1ciaMSrBa2k7zFQJkhjpS7Il+0xijTSADWisLHat5u5LAepH3kJ/H7Aa8O5G9fbddm
         KaWUR5WaA964NWGl0xYID9e/hpHQFogS/hjzm7EXiajo7ss4gynxhyq/sRMq0SFx7Rir
         I0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        fh=S1P5T8ukByy3dGSOsoTkumA4MG10tBjqb7vsmwuNzWU=;
        b=WPfBJrcOP+UCqkwZ/34o9fE/GAY9Iaan185IG1MOL5PvLl08q9/I+y8jYgwi3onrGi
         kE/8KaW3KepSuw6fNm7SVCRRSg/Nn8QC6jvTkd/ASj3OsRnokgPsmImTnNUwCOSfAJIG
         tvhVr1UcdkLoI4EaBtWe8pyjpawEtgmoUIFcp/kHJpUPLuLjwDZLPIzQU8jG3NRk0hlU
         5Vjrgx+76w/2adhRH5Mm5PR0kHPsy35+pxSckuCK1dZHmoEAz8K5EKgNQnIgllvu1LDF
         Q3XHaPmAHn5P+aK66W0WQ21mLkEb+sqZu4VcWr2JLO+bg2Exr2AedCPg4jHZ8Qh6HDgq
         M2vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794118920; x=1794723720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=hUgHyzbhHHaa3x0MGZHtZ50WogQLFlCdZt/lmpI5crcqaTYEzBLVvoJT+z9qJrP+mN
         2zbgqjLjweGNemctefm1fEFSRBhgSp3oao5JaYrbL794p9RQwLH8IbD03A1vfK9G8Hgn
         xU6BgmL/ohZrkZkQyqHOCeP1wKoEuHAy+mrlzWmeCsJ2azmakD7HX9Dv1qYjRCWTRvml
         +A31W1Sdhj137368ySt2DvScSVHTeX6n1V3A5imgT+udmv2EDO5fo8gOJEOirBFNfme2
         CiOhPNFnNc+LyuKNTbG/oQjABYDT9OeAE1XRKctqmZGWr4uzP4FMUjddZw6ab+cFyo3z
         Mnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794118920; x=1794723720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2XprYGCXtRTCuqB4/wKtddK9ZYd1kM+u1y6WT6JlOc=;
        b=pEZWes1FGmDr121nN0MoJVMY0xyq3mxB61gTMFZlo1DYub+6xI7eo5uNj0CmuFdsHh
         e9TT2DiVS/jAixQMcXNJ58hpj+eapZ16PmSnQZP7i/T68LJRE6s3eCdeFRyPyHWWChwm
         rPI8bucZ33GwC2E74S600SokTewGEi6mhk2y+n7StFJrB/bxl3azo5bbTPwl3jIZru2x
         hvFmqKpBY8b34+UzSEQs0CLCfbAVoWq60iIvF+KVIzghLh/hOFU4YDRJ8LVPHnXpPrCA
         wfTWhugBpXHnxfCO1I8S24P1uS3aSovMKYhCluaYdeV3d++jeST1ysB1KQ6cO6aCpX6v
         jAvw==
X-Forwarded-Encrypted: i=1; AL+hErGxz+s0dLF8rWNFraYGvfj76lNOMXIcbKVsDk8rUWHmrfbQx0GaquGQVIQSpCf4mCIJmY/hDgFF4ZN4owcPBG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rr9KtpoNMQpfLN1jDBkPlDhUkIyBVAEcSX15amAWScxeiTotu
	h02o+w7fW+4yJeLls9ctz1LkSOP9/gFhyDeBuFdSE15QGCs2gIpwrLySjCwqL8/IsubnuSAeLYx
	VE5KTvAVAtfxnS8rNGSXA3IYXy/McWaNA3GpHk2+D
X-Gm-Gg: AYBFou30hGTW888Zw3WIRwJIp6WSWa7rKSpr03DVNIrf1NSxg506ikmT39mGJHdWfIr
	SityU/xqVVpv1QImkrELCMTMLvD5OT7UTcQleyQkTUxIoI38aDxuEoC568pTomsCYqLt1w4uFxB
	P+TwMHSibyks8PkGyF1za7Uzx/u4d/mJRnEIaIwIq7CzhtZh20brCcWH7owilvxpK8NgV8nRbdt
	PPFH+0vsq/DxCaGbUa0nzhU7Ge6Ya26uYPS/mqFFvkVByyAsaLMZXfJQItmlf7rrCYj9W5X5oJc
	iZ0P6n6DbxqiAN2RWIrdPzrJBSs8vCNZIv6jvsIJqHXdqDaXgxaHkBiORdtX244tyyl5ScwmQp7
	mySSXZvKhECG+WiwEEuxVOuDry2HmNt03BocyviXmiTQIyiPrU4Ejpw3jqQ==
X-Received: by 2002:a05:6402:c502:20b0:6aa:128c:36ad with SMTP id
 4fb4d7f45d1cf-6b6fef8853fmr25733a12.10.1794118919631; Sat, 07 Nov 2026
 22:21:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sat, 7 Nov 2026 22:21:48 -0800
X-Gm-Features: AclHuK84A9Z4KJMCekRVvO906KgemJ7leA4F7qgUGSEUquHWR-U_KufDY8SuGMQ
Message-ID: <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

Hi Jakub,

So I started looking into whether we can improve test and fuzz
coverage with an improved netdevsim. My LLM prototyped full datapath
(with devmem) and offload support in netdevsim so the hardware
selftests and packetdrill run and pass in a plain VM without physical
NICs. I posted the branch at:

https://github.com/mina/linux/tree/nsim-devmem-rx-tx

The main problem is the total LLM generated diff to netdevsim: 62
files changed with 5,525 additions and 672 deletions :( So it's a big
change.

But with this, we can do pretty cool things:

- All 36/36 drivers/net/hw/ tests, 18/18 drivers/net/ tests, and
164/164 net/packetdrill/ tests now pass on a linked netdevsim pair,
without needing real hardware. This is significant because a lot of
these 'driver' tests also actually tested unique code paths in core
like devmem.

- NIPA can now (I think) run all these netdev driver tests and
packetdrills without real hardware:
https://github.com/mina/patches/tree/nipa-nsim-hw-and-packetdrill

- Packetdrill can now run on netdevsim:
https://github.com/mina/patches/tree/packetdrill-nsim-default

-(best part) Syzkaller can now fuzz live devmem/zcrx datapath &
offload netlink APIs:
https://github.com/mina/patches/tree/syzkaller-nsim-full-net-coverage

You asked me to do add syzkaller devmem support before, but adding
devmem support to netdevsim was too hard. With LLMs, it's almost
trivial, but it involves a lot of generated code.

Do you think this (or a subset) is valuable to post upstream to add to
netdevsim?

--=20
Thanks,
Mina
