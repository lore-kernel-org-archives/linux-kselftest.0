Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955620;
	b=isRNoA8TVscWHrIoyoutnE4DrQ1RDLijCfExdXhu4L29F6goEYtXtLyVhnM9485RLlVc
	 s9zBPawoSeiIXoGkn9AOzi36W5XSE8/Z1MHvrZCBl4Vjif78g96jsqFFqv45Jberr2VZD
	 WovaLn65/QJubF/2K9HerD8wR2G89rfCSnCzAphtppASRxnwEG675rggUJIZN808I0mT1
	 A1QFORNVHvMCU7qYPa5l8Bgf29SO4BrS8WwDp3pqjnwlWGjY+gtUXqBlVM6HkU51UTucf
	 3w22WHf2IQgAMVP6uX+TWe5qlFj47bmzbJ/zIkYfX8AQVDFNi1nQNXwZmfgM+K9CAiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
	b=j+uW+Ph5ahc/jxXMIL52sk71Iw+53qbIKGJuIfGqLjbgfozXkIvl3rMhKZB6Yc0m/lZN
	 YcgEJi/JErDZo0QvaRgA0jJyDGyWvrxstLzauSnpMLEz7blpW1VsEuCuOjZnzj7O4YC1T
	 /nSc0iyXo0ClmP1K35AofFVN+qc/DAgElQ2bioSSykGIS3cTF6B226FFSfXR5dkC0i0k2
	 8S3AYZxMuniCgWgdTRTyFe7m/WFagoo+nJe9B0yYx2WIVYD97YZLo1Q5ugkqrqnunXmSY
	 B5yg7CaESTNUidQbe8RpcpejRyXUtW8dNscI6YHgZXFY14ZryxEj0BqPU9F8C7Y8vNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E8606A335
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=OpD+6PDM
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMgFdo1839806
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:46:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=KSC81XL1+EQ
	pdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=; b=OpD+6PDMlyRVIQ4gUsxd1pQRiiY
	2xNljoVElEeEhFUiOG5Uk44VLPG4O4uXpXj0+j4jeDetx+c0P8e+noxSYq2lCh5W
	KHejIzt/I4UdTJmzw+Fg/nSj7cB1QTMx/l3bO+xrP+TSeATVVrDxWTZVHibCW5U+
	hjOQG+u9uC1e2kybz2OaCsXrkrsDWl9/U/SGRqGmJY0vG7rKiLXndtlvel7lQl55
	sdjYVggRIUMT42oLfV5wteJXfkuV+1P3ib3Fp4ylW8JJJGpvlzjjnP6mzY9S0HdJ
	AQ9e8xf/1KwJnz4XcYTaX6HmGdSH8UZ30qmpl1eTP9PIAKGbfG22H6j3L9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu883ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so150388a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:46:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955617; cv=none;
        d=google.com; s=arc-20260327;
        b=krdbqWzLseP5TrsMTGJrEN3UgwNorxWi0gVe8mqcCne8RSajcSUqy5wKUfjiE83Ekc
         +ts5TQkSNid3UNVuROTViMUvq6nI7ytr87S5r0Q/qkTl7MZNZZXfFp2fUtQQARITHT0a
         MX5xt0k0rcdc9ZVPYp/xoWx9KBLwu+DGuo9dWWWpqPqwY8CsQB6tKO7peAZ1ZQdQyv6g
         jr/BD8IcAqtoyCBP4Z4SlYUrLdVQJeaF0teMEX6hB50Xx5AiAKsdRhkoyQ9dUgr852L5
         0GnGha7fV/iTqfPIi8VnygR5Bwejm+eD+cviYtJXF6bBye8zWt/iF2XoAujWk5JNbD1e
         yj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        fh=rHj7ZLFc1eXzhGC+5yRMpkJ5diqXumAiXtdiFsZhhgc=;
        b=CkDGwRMo3slO604sy8l4BCp/x3S9EpfKkN9U2RUtoG2zyCfNkLnf1k+bmlLA37V7MU
         c7bYh7zQdNGeer/lvlwc7/Pslt2CO/ud6r3vGE9ZgXulRbiLetrCWcjSTle0nz6CdILa
         9giYpfGx6iJA+Txv/xQh3fS2tz55IO20v8GPJsvIHmMVG7Z1C0nZOabmMIkkjTfvt2O6
         LV5ZrKMkwCDut/1HmpFK8WqIIdiQtfE04a3C6bbJrabAjuYzuqAZPOxG10CbOZFmzB35
         3qDnUjHRx7TykZb//tAUEvNMtIpBdPKSm4O64CfLfE+TNFdGWqUb8kLpl/hn83lyST9R
         w+CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955617; x=1795560417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSC81XL1+EQpdKzjuyxfAuAaB+et2a6UKZ6CLWHqjqw=;
        b=em7sl91vQoguLCtFqLUchLtN/CdO6ofnBdkql5dnVb0WLvnTM9X0iuVOyiFxdalVds
         KLjXzOSgKV4fDYakEAYJoTdqwTdFxStY5eX09t/bmVAUEnasQRLYiOEdx3/499jjowqw
         RXFwvYixfowCAgU3xYjSPYeZRvRFqGFHAcHRGn2ywPM0lJ31TG/vr0bC+MXWsudQV2s8
         tCTux10W4xNaET1Zed++MA04FSyutqqWYME4DlxSTS3xg7dH3s7NvE9PWIscua63yypz
         8sjTtzwOVOsCK2xz2AVl5pr6GpZXD1Bb7fsQ/sObZYDN4pOPuapArDavQD2ESLAMnT/R
         9zAQ==
X-Forwarded-Encrypted: i=1; AL+hErFpuF3RdnJfY0HgepfajqGAFMosas8dSsN73zPDWaY5pc9fwMW5u426cnuo38u0mAwXpl3xbJNXFyV1wVCYBY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XGBrxkQlLdb7AKgmIhdAJQ+XFuI76hEw+snYiJVWhtDkd8QNG
	SSfhUTmgwOcwZaPpjnQOl3SWpZcEQztcZUTGGmjveCN3xJgR6ThnPQRSyShEnHG32l4L/zjlERX
	6wRperDroVbQ8Xq0vqvrkN2fjAxBZNA/c7GmqXCeZwmAzXBJfK109F5r1jmsbMFGKZejUvqZKHI
	WNDF5O7ySCVBHkZpGS4qz5O7ICrQT1sFKTP6J1TyGXXRM=
X-Gm-Gg: AZFdTZcdVWfwjZvAw5gQMZfoG/8O+2n1dj14PVMnkAfi5C5189F5MxNGZa+8rUi3McT
	0Sp/9Vm+5kOaUOdKipQI5zn/x3PgBINSOQ7IJWbCLZW+rKBt8sjCUtxRJLi86WUy3UljaN320Qa
	vdlTKUOEI870q3/cOE9QVDsPPO+j+VddMxgY+asRpwj00HmUBcQNXn8R4dPhiKOmXE0Ns0Pdp/I
	zaaG/15yh9kG1ZcqYtOejh0QI/exOg4PFr63N0NNX1npgNOGQM=
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id 98e67ed59e1d1-3b3d07a212dmr710193a91.13.1794955617309;
        Tue, 17 Nov 2026 14:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:2fc8:b0:3b3:c3b9:7de6 with SMTP id
 98e67ed59e1d1-3b3d07a212dmr710167a91.13.1794955616819; Tue, 17 Nov 2026
 14:46:56 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-10-toddfreed@meta.com> <179471270451.2199510.14795764193886368841@kernel.org>
In-Reply-To: <179471270451.2199510.14795764193886368841@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:46:45 -0800
X-Gm-Features: AclHuK_60Rb9y_3QFrgeQGfRKqUkPpfoiUhcDbbJP8UTYE_KV9Woof2OdSMKaMY
Message-ID: <CADh2yMwGN64zEVedBhYbMDcsyPjSJ90tyPz7evJ6x7B9pAk3TQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 09/15] net/sched: add act_psp for psp
 transport mode
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
        bjorn@kernel.org, bpf@vger.kernel.org, daniel@iogearbox.net,
        daniel.zahka@gmail.com, donald.hunter@gmail.com, edumazet@kernel.org,
        kuba@kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
        john.fastabend@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, martin.lau@linux.dev, pabeni@redhat.com,
        saeedm@nvidia.com, horms@kernel.org, tariqt@nvidia.com,
        weiwan@google.com, willemdebruijn.kernel@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfXynEkttPrFSFr
 IPzaSqrtR314E1p9xXNMr28+FQ93hjSR87A4E107BiAH5DgSOvPaeakbsRuegH5o2Y5OKDe8d7m
 Br1JDzz2H1Hbg4iFjXo++0MdZsVQ0XQ=
X-Proofpoint-GUID: -l_oCapvCNQDjATyQNt3tgfSuPhys9GG
X-Authority-Analysis: v=2.4 cv=aLRlOr9m c=1 sm=1 tr=0 ts=6afcd962 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=DHOIGP5XwAi4GC-hQCcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: -l_oCapvCNQDjATyQNt3tgfSuPhys9GG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MCBTYWx0ZWRfX/9kkdQojetdE
 EW1uv5Duv2+KNL+ZFpHceJk8RcC0/C3eSuS0hecL8/99rJc5T6zNFZjBzLS8u5Se01167B6stAv
 TtPRNOqdkCYgtiFEFvLkiTtqXcTrMQpP10282P6PscmLtE+WNCS3AJViRimgMiiRnM9U4yUN7mZ
 ommV4WI8NnQZxUhFsYtV8nDXRNPKiF6dpsrRL4Rkp1FDFG0kCmK4nAZCRe+CbU+wDjg2K7UI9Wh
 3Mba2uidA0oyR0JbuFknZngoZvuEw9ApBtLlocbJb9wiBlPEnDeqbNLJC2gjDsiXwz3szvB6t0c
 lZjvEvJwmxnm3sc8mLvfeOiH6gi8q5S9jkOUbDstKdhcLcvVFOpN6h5/zseLZq5kKvMGolge+i2
 XdG0jV75hm5vCUDbUI7iTGItsp6VuBP59n+DgJuW8tQCGkgZGRmNiOa+pB7vhT2CqEUzXCqUQFY
 f7nz+/SorZewpPKdOzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Can the METADATA_PSP dst and skb->decrypted get separated after this
> point?
>
> The commit message relies on skb->decrypted as the backstop: "on egress,
> encap sets skb->decrypted, so that sk_validate_xmit_skb() drops the packet
> if it loses the METADATA_PSP dst on the way". The egress to ingress guards
> in mirred and bpf also check only the decrypted bit:
>
> One path where this happens, on a non-PSP netdev's clsact egress:
>
>   act_ct (defrag, sets tc_skb_cb(skb)->mru)
>   -> psp encap (the reassembled packet is not a fragment, so it is accepted)
>   -> mirred egress redirect to the PSP netdev
>
> tcf_dev_queue_xmit()
>   sch_frag_xmit_hook()
>     sch_fragment()
>       ip_do_fragment(net, skb->sk, skb, sch_frag_xmit)
>
> sch_frag_xmit() then puts the original dst back on each fragment:
>
>         __skb_dst_copy(skb, data->dst);
>
> As a result, every fragment carries the association but has
> decrypted == 0.

The fragment path is handled by "net: don't fragment decrypted skbs" in the
net series,

https://lore.kernel.org/netdev/20261117203137.804424-4-toddfreed@meta.com

This causes the skbs to simply be dropped instead of being fragmented.

> Would it make sense to do one or more of the following?
>
> - propagate decrypted in ip_copy_metadata() and ip6_copy_metadata()

Conceptually it makes sense. But because of the fix above, that would be
dead code. Furthermore, they still couldn't be sent. skbs which are to be
encrypted on tx (ktls, psp) need the L4 header, and non-initial fragments
do not have it.

> - also test skb_psp_md() in the mirred/bpf guards and in the cleartext
>   backstop
>
> - have decap refuse packets that carry a METADATA_PSP dst

In both cases, these guards would be dead code.There's no way for these
to happen once the fragment path is closed.

-Todd
