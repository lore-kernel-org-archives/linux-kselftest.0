Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792563469;
	b=0JcibwEUYr4nq7d1Oo84ypVDiteFAP17efnRG6Yd60kDh+2tgNCbA5AMue2FS+SjFpeC
	 eGIdEDhKhQfG55ZXWu2PhZI+k7WMWK3nlxrh6eCJ8MN3IAT/4FBomwMmkWJwYGvWVRboM
	 dWaw4Pjs5lzKonNLQePFUita244HGoVd/Ugq3sb7+GONQ7xDlYNypFZIozEm57MU9dFbJ
	 XR881cZf15nsrBftvg5ERiZY1/M8ri6+MB44PWClFEOPf7YWUqX2m67nqWRMm0YyBkoPF
	 J+3Ks12bgRlHVAuL1TsJhppXUC467LfQgmAOo10Eq2ja5O6PJprl7ZYtABj4DvP+HWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
	b=s2+dsweQq4tLQ0g6vw4DWq6wg7QDxp9tgEMLjXLR6eFADeyeq++KjE36NnoHHWlQJQ+K
	 +hi+Z3ibM5KaHQIeyKnrJlROnWlI93rhEDTIHZY7vXZwltRmBZbjgNPj906bYkYJW5JGr
	 7eRo5MYveWlK+ws30eWM+GTcTAnBrTDTuVj1gvtjLsiuGkoQM/dWwZq4p26ALiKKcKopu
	 qXTGJlY/Lan49z2YkwFxnd4GYgfMAGyu335KVIRrxZsneTJnZS2d+bCeameAEwCwaJVqC
	 8hTjpJvD9fhfQMPCcYjUr1BSypuH8W1AAqgk9XcZh/I6CAYte0NGIblQOB6MAEWlkUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pQIPJhuw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220F606A337
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 06:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F220F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pQIPJhuw
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so7542a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 23:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792563467; cv=none;
        d=google.com; s=arc-20260327;
        b=sy/e16KEtI+3bzcrlC9ONvKZiihl7NYIqJBpNC1shtJeOdLM1gETUG7JdflfTkBXO4
         arLKX1FA+AzgI5CiD4z4AmSdxYtx0EimMIWr5wNPX6P66s3jZ23nIXWPLGLQgRsS9+Ip
         YqSlDG7ckUL06xPFDR0eeByx0j3gP+NVxgyTFrCYMhuKDfjPdxOrKg/NzwBwJ4hbetKJ
         0/0s0QpUvxGWCbXIyJODKh8izU+YBw1xRUD/13UpiaR6/Ag/ksqToRh7Vt0aOn4zin7M
         p56iG3JWgW4fGwlfNFN0wZmDGkNR8L+7r1d3ePIdIGXcAeNysSRH4cd9txkvCXNQKNuG
         Zbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        fh=ik5+ne/wCQ2uxhhmhbNB2Vwnv/s93bZKa8+RSoxOGYg=;
        b=MCJsZ33bcF1v13cDDamHa190//WAdRzSSzyqeUZ6xK4sgsoYyaXdXBj0EUJ1yUIklW
         GZmUBXjr/IqdmhsISZpV+rFy6T4JK5D0OmMvy3SybY0qXHj9oZLbZaDz/Nb544EanWMI
         tTQWJHkRQzCPcU0n7Cj/6AGqV2g4y41PFotxsy9RedDEkTQzMhbGEo7Ybt769LIrlk0j
         0mspE2r0h1Kn//qAK/ZOLr0hcLR5sitHrUV9M0Z2wIvVjUnHC4tNnHujzBf6AKdXGaXX
         E1btz4VIsoh/WRi/QPpcQZgdvs6DAe9LCbXALUxn+slB+hhr2zGGeSTjma1guwStMVCx
         l/qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792563467; x=1793168267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=pQIPJhuwRgwitqjGA3ItWVLOGRQSBJ2UxZPYrPAWnSbOgQb7bum+xLkiJsThMZqhOH
         dwhP0Tb7gfDJbRLLmYO0L58nN/lbc0ijCbj7vD9/AsO9AN+96fT1k2yklolZXbSXuPwo
         LvDI+a8olKugTFENbi6HjsCC3zDMl6Iz1h6NBkZRClcTcPd8ggh/X4oK3qTp3lqZ6g+A
         1/vCcb7V+C3SGzXl2pN5Qza6vN7p6/inIC4foXEFviRK7uLerabWIo3jtiqgZBXKVU0E
         35IRXsTcGT6NK/j4Qt7Yug3jaRtwJPct+J6CNc9iCK/DHqCogYkMU/l3zqzSbvR0IHLw
         KzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563467; x=1793168267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=sCRicazIwe+vqkSpKNXvY/8m88o7AggVV6+3AH1nvbX5SLwpnoaw46jcjYzRl/4qCg
         d9JuzdzpID9dI/HEg3DzOxI3M4u65D86MoaX2jp7URuLzeqRdxBjbqid2Jyf0jgzl/+b
         HJB1cfHvGV795LG79SwX+8S0zHbMNLbmYcQTSA1FHZE+7s93K89UwPWFKGMustammBeh
         FFZgOYnF+u0D0Ay5xXtufLIJ2oIudNDtdnMPWoAOg7wV3pOu98pDjjkGStDB9/GgBjl2
         JSQieLDdTZbbtnxSWdV8Kd+75YWDJPS4brUvUp6L9t2zs+x4PEE1r4pbN7Xuxx5HJ42N
         Laxw==
X-Forwarded-Encrypted: i=1; AKwUvBz2fqqEeMKG1rQ9lVZ1ZcmQ9Pu6LJYbNjpKDgljk8gkTcERulIqmtojnr8qpkGi6BYtzzcRpghTNVWTNVjCR74=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm0zH0lL7liePtibp/bb4bP26rG+Sf6Pv5lawyO68C+73OZTj0
	2JKXaIXxH9anERpmywx43v3qgiK3pZ1M0y/frfKObNrs6AHLKetsNFXGxihPtaOor3CTxqIvEzs
	Ad/8PnHQtESKpFR3xeMTDuxolLhwM0PNWonLp3MJdvJTFptWRnEcKakDN
X-Gm-Gg: AYBFou25HrIRZ3u0umDxESB/oodKBbWuH0kaFPdomq46wIuLPbp6TiJ1ND7J7Edvf1v
	lE2XxsFjbq8IiIvrGeXRf+ZCVRJY/C8JiZmv6XBHWK+YlrGF11E/WW+4kpRIxR8/aiucjmjPR7m
	pO7ayO2GCsKzImpATNx7mIw/g9/hVb32Ph/xkFW9m9beQtUWtT3t25JseoceI0saghDV26cEac2
	8J/VP9hEyHh3k/XUNQh+fKjQq3JtPYUa7cy/IGRfMALUuIltaSdQHaYzWEs7dDVAZhPV1sxI8d/
	jDHKqYJj839Xs7vYCKxute5G/XeC0fz4xlEioFRU6hISGxEf7L5bbPGPco2+M4HUIPz5fmRwwww
	L3OI83w2sgBQaKXnd8anBo0zQFA8lDDbBdw==
X-Received: by 2002:a05:6402:4050:20b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b3e77153d8mr91222a12.12.1792563466679; Tue, 20 Oct 2026
 23:17:46 -0700 (PDT)
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
In-Reply-To: <20261020121858.3b9107c5@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 23:17:34 -0700
X-Gm-Features: AclHuK9x4qWdNnjJvUjsI2EHUcAIAKj09plc1NcLTKxrSfCtCSi6D5JlUi63xuU
Message-ID: <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 12:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 15 Oct 2026 16:39:14 +0000 Mina Almasry wrote:
> > Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
> > netdevsim net_device, and configure page_pool instances with
> > PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
> > PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
> > bind-tx netlink operations can be tested against netdevsim in software
> > selftests.
>
> Slightly worried this will bring a bunch of maintenance burden and
> "bugs" in netdevsim. IOW that this will be more pain than gain.

I felt the same way when I noticed many reported bugs against this
series because I didn't add proper support.

But on the other hand the test coverage is nice, and maybe one day if
we add enough devmem support in netdevsim we'll be able to fuzz the
data path or something. Is there a way to get the best of both worlds?
Like put a comment on top of netdevsim that this is test simulator
device and any missing functionality and/or bugs in it should be
medium criticality max or something? Or is it too much trouble and I
should drop the netdevsim support and tests?

--
Thanks,
Mina
