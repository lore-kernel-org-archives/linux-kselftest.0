Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795029316;
	b=nL66NO0rLPUHn0duK3PA8sR/8DriZ6N2byVnGrve7VJrt+K85O8gjohNSjVJX0AcY72I
	 WW1I/d5SbaJ0cCMEGX0Al1uqQTsDk/yjXKOk918wMc26SzkMmErZR0oJ2Jn+MiN/uafFH
	 QhLCVkqfHDBvFxx2xnYAKp5w3ouN8zIYkZ9W/QcNCbwVvhWrUz6s1pMbFjNWSpXr/QHpv
	 3OKSvTrP+Iqr4Y/7ZkvoZy5R42vnwAAZm3MAAU30WtrcU4Z64hN13HhGVsn1KEXbNSYkC
	 FlzXqi8ldiMnye5OP1p9gcf9JWJ2afiqPyAqKM2qkqTsjwvLNj9t8ZpZAyjiGJP8d9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
	b=vF4KnrwFAxZB6eT+CTRfWx+ThW+x5TihW61SRjIe1cpVAYYn/bsPm9TF4aSJh7UDxQ/v
	 9mANAL098gA1CC0zONc5B+fdFstTS33+nPWYBAOO9L7EFNvmY6L/ZLWMdVttUugNZN62D
	 Dwi5NIvFgSMrIvACUlpPwDHck1W7FTzmRhHfPH8hZDCjCK+DSxGadblGtXKFpvIOJ+XYw
	 8bIu56g5EqIb6En98bsonwP/WgbHKbLrMa72x3jAHMJqZbM7hxB54Jqf57qFCHWT6sFzF
	 vSW3EOWgc/XsNqleNF+KvVyfvU7xVG9FBMEOaECTuQ8A8PwJuPSwOmoYmE0TunYrxrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BA3606A336
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 19:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BA3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CI0coo5M
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGGZf154199
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=+xA+qBnR4Dh
	GTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=; b=CI0coo5MCl6PeMetoQwNQwkRIbu
	JiJgmxit9cRt2nDJWrdAARftxPhoMHNyIVJskaAed9S2yJwVu7Ra0ZkweQuyB5yF
	guA6b+B7Ror/Ay/Qt7H0gVuOq2ynwudmNifTkBxQAYnk71ts4xr1AaSkk4W+eOa8
	idyTtCCV0m4sS5SbBYGeYAKxD77vl1xiK52a0aXDUovzXZHhLZIrtRdrfVhCe76Q
	12cyZpAXp16EprTl+WZPucOgkRXsuml9kXyb/gOq3sIF+GsDHZrnxqsx5q2OGKk9
	Lta3g/1SFu0Ht7eUlEGwKj9v2nyojzUDtpEBFE/6gMcWgBLoOUalALEMPcw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu808a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso1026469b3a.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:15:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029314; cv=none;
        d=google.com; s=arc-20260327;
        b=PrWtVJGVoGy4HQS0fee0slFgVVlfjp/Wx9kA45RqOFgDlB/1beqNTfNwBd2hBZFzle
         Og5cMxSKgOS0MYDdYK1yJTZcAr+0jo4bE/5yOxajpi2XXSErrtai3CUIq/i2YHoaMzsK
         n8mb1x+OKF9Fhlh0YJB3qHJsrWj046WCjVwS+zz4rPkiwnpPk5JnBUXtvcEqP3g2Ovi8
         z9IanMAVrelCHFVCDVhlN4zEfmRYjMbmSRME3AyH9b8is490cHv/ioAZLTrZx6EZ0Cyh
         3c28rtEXeqAeU/gOkUFYixTqgEXaA00EmFZXtrsqjT7FY6hn4kcyQ9ooMzm3iUp3k0CJ
         0iPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        fh=ghSVdlOGgagj5+D8QignteGgAFai+uN0YSWC4FVIres=;
        b=JTYr8C23ln74NBjmWQj8EbP5DwD/KOKmQY2Ii4HPMobNakYBHwRet0H/hzy9vfqU4Z
         siFYFiOaHgq8nLCvfaz43e2+budQjS6q1Kqn4By6kFpn6oV85h5paLSKiOu+4SyJ2VDG
         /kBdAJSxCzk7qxNo8T50ZlqhAMDr8kWTUNhrVWveqzyCMy8p8aHSQUOvrikhK8g54KvM
         E1sBzZT3IT0gMqahGfA+dkCPhTQC2SJ+TKR7JyUo0U84rEDxrDinv79DyKV42dH82gMc
         mPAmDC8h9snkfipF98P6Yv6w7fYDWpHLpAhtbRHArVYNOOuFrHT8fy1m434nyyY0vCx8
         l9sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029314; x=1795634114;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+xA+qBnR4DhGTpzy0NbqbmSwtcknsJxtpzKOLUxHJh8=;
        b=D0QMO83XGKtKgn2cKnJ/iuJgajf3m+Ox4bgtZhOGhFkIPf2GEhm44BMJbp6zRmFObQ
         yYwM4z8LLS9NynNoys7vFr+me6/zdIJO2WxJnrlU5A49aEzWWe29QUdEDOGxD1YzTLnI
         Bj+zqew9Q4pWpnBLjXgFl0E0yEC6WQWbXPp6mc+bJsBYGeqzljdQJ+5BkZJEfHV2XvWM
         3ye9IG2SGHMUIPDD2PoJQ5+ZRXV5iCznUjPL6fBhQt8W+KmSqMzYWD/qXsuUxuAEFVSA
         GmGQwTefWBJ0dVtKKr3/lXZmw2klaZbktbfCN5eE/wsjyTg7f9lGLq5b36+dizBJ7VLN
         V04A==
X-Forwarded-Encrypted: i=1; AL+hErGbKWjPwFGUgXm3Q3ua/vUoTqa9wXIdxIlho36AUpL59QsQ2/mQ9g+ZSKh7yxcxc74C6Ckuke3m9DIA8GWrdlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fcClx/HirBBC0V3OuuNWuDC9YIEclvksPUumzwQq8HcZjS/qx
	5jQmvUUICSGAvZcFzuNISN3anFMSgRamlSI1khzw0Pp4gvaRGKEngQ67xoqF03YJE0Gm2RxuM6g
	mDu3Mplv4LSSzRFLcEfRWnLY11DX88W51oVtFcjU/nNnwwcN9n0zlCwW6aWEIvTdnkf7Asrp+Jn
	L0BulGIB0tkT1dSeJvNVCzYeU76lLx89I8s0uYa8i6afw=
X-Gm-Gg: AYBFou2rWGnaNnj0q+4DlUBqCkZ16J1D3vL7DgpYiYTnCq99/o3fKDdMfSgFtyV3omF
	bXVYl3dWrBKFApcxDKRVSP9GdaZZZaG7C1twoQDz1gxEK1+ZlG9Lg3gFOtOVTKDwqav++1F5Je0
	WoN/Lov7By3oQ9M2qCZXXqGS0DPknT+IbUk8rU6dVWzUsroK/ez3KeVmx6j3UHyWI/6zvkM+Y/I
	cjnRt6zv327uptT0G85AxBCbZXxCQmT
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id d2e1a72fcca58-8c5d46deeffmr3344611b3a.55.1795029313724;
        Wed, 18 Nov 2026 11:15:13 -0800 (PST)
X-Received: by 2002:a05:6a00:32c7:b0:880:e4a7:b1aa with SMTP id
 d2e1a72fcca58-8c5d46deeffmr3344573b3a.55.1795029313133; Wed, 18 Nov 2026
 11:15:13 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-8-toddfreed@meta.com>
 <ea8a18e0-12cc-48e0-903e-325a8ece5a0f@iogearbox.net> <CADh2yMxffQ3cywT3aNg3SkVfog5CFnUSp34F1esyun-xUBVa9g@mail.gmail.com>
 <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
In-Reply-To: <4d271539-b2f5-4fb9-a4dd-32becd02ce5e@iogearbox.net>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 18 Nov 2026 11:15:02 -0800
X-Gm-Features: AclHuK-4R9Nf7O3FLY7hrUyXB1KdmwvUFFQk3aRrICEDQQcjmr2v5AAMDg1nX5s
Message-ID: <CADh2yMyo1VCNKC58oJiOLJ2NtGqAFQfxLY3iNbP5mtQhaFsR0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 07/15] bpf: don't redirect decrypted skbs from
 egress to ingress
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: U0pmC-HR8QSo-jcrUYO6hqlSfff8Q7vN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX35mgBIedPiq6
 cVPPA4+GpIKcCnsXNZeOApgZh5HzrfKlkApA6m5C6K3N0AszctM7Cs+Qulr+aYv72F2jGmtgSr5
 u7COy0BoBPQH0hhQ/Y+oy772JFJvDSM=
X-Proofpoint-GUID: U0pmC-HR8QSo-jcrUYO6hqlSfff8Q7vN
X-Authority-Analysis: v=2.4 cv=MvDHeGae c=1 sm=1 tr=0 ts=6afdf943 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=xtH7KyWI9dI7BmFOsl-x:22
 a=DIuMb9_t4Eg30DVr1XQA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX4K/9zMIiO3C5
 uqyhukgnTB/NAsUd+aEHUojsfX2zYbfUDxHNCktcsl//DmDyjeHhTReVCdVa65SIty7BOKImxzN
 ugoFgYYiQbdYBu5CvANRTE7sU59A6PXYBn5Impjc9kbOnTlqbQuhUQ/0KxiA//vgkPyLCumRTwq
 0HC37HwK/PKjxoRdjDMKwTmHSocnQqJncIl2SyrJbTUEsio6Dij8cUQR1fssmOctoGyxzIxd+8h
 ZlVT2VOiKbglRt60vBkNzxb/gXn275rcjt35c2AsAuSodMwVYpqo5cmGJ5KNat8Iw5p2n27jbfR
 SmmkfPIw/mFSQmOIqPoi9aidEqbuo9c/2HMzS2H4xulrBNhZWm5BOv14ZRw5BWq4wamif4eUtWy
 U1u8tRUNjYoJz7+vrxv9SHcyFzgeztK1mMhtT8DhPnzQOwLHPpLTmSwEf2ZylK3CKyq4c3SI9gH
 taOmpN0FqG7sQNgC+4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01

> But why under skb_do_redirect? I meant just here:
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 532405988fd9..ba112111de22 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -2471,6 +2471,8 @@ BPF_CALL_3(bpf_clone_redirect, struct sk_buff *, skb, u32, ifindex, u64, flags)
>
>          if (unlikely(flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL)))
>                  return -EINVAL;
> +       if (...cond...)
> +               return -EOPNOTSUPP;

Yep we are on the same page for this one.

>          /* BPF test infra's convert___skb_to_skb() can create type-less
>           * GSO packets. gso_features_check() will detect this as a bad
> @@ -2563,6 +2565,8 @@ BPF_CALL_2(bpf_redirect, u32, ifindex, u64, flags)
>          if (unlikely(!bpf_net_ctx_get() ||
>                       (flags & (~(BPF_F_INGRESS) | BPF_F_REDIRECT_INTERNAL))))
>                  return TC_ACT_SHOT;
> +       if (...cond...)
> +               return TC_ACT_SHOT;

bpf_redirect() does not see the skb, so it can't check skb->decrypted.
After the program has returned TC_ACT_REDIRECT and
skb_do_redirect() is called, is the earliest point at which the policy
can be enforced.

-Todd
