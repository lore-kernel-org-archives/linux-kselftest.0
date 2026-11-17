Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794956107;
	b=r3OFimjnXsTHz8fSKiUxrCWnkTYQ8ZAaM7MslttXUbEvdv1RumfTXmdmxQUIqR1sCVZt
	 alAtjCxqcfDcyV7eR3ykG1wwmVFDZyQRhZ0gz/EtKsI/Dg0CRAsde/HIwgUhu0j7d6znh
	 K5CvQayM2VBo2HDLW7EUdQm4I71o/FeVVcHmxhbBwB0TD6UKmWb8br0zg4RF/vqZGTQxI
	 K2Sc021kxpl99FqncuJg90joZcPZtQvTBvhN1/USI/07lh0rPVvumP46xmulZxBeSaPCi
	 nZ6qfHFYQGTXYMBAKSwCSPRcxxOg54H2Eg7AkFVB9CQ/Ac0xuGSVDydEAqOw5tvCSUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
	b=pIo7mgU5QamtvO69oWwTYzrn9i7rx62FiEuAegs61nJOcsWIyHWM81hGvvuUzMVARGAJ
	 QN9hA6kli+u4tzNWreFA1UGL3LumjKBKUeM+ifLvSt3uJf2Dzm/PFDiF5C+lwfNW/Zoox
	 MIiL84hDmYsMT7bFAcsN5h6NlnkYlvnFHdsu0fWMx8d2eY+LwMb1bu7+dO8KfsW/iZmqg
	 5cOfJI4hd+4rliNei85TTrS1wDwoQn4IzMzgY9QRVRkAtvHhqOG1we1yRfmQ7bjnn+vqF
	 Jm/ZW3MtoAbl1TqkP5yBkjYUtXR+vNKTxI5cXfgUxyeHc/4OYHgi/3M3NSyER9DPsTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53387606A335
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53387606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=NPDWNUn6
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMfbZs2157456
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=XTWULvHY5M+
	9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=; b=NPDWNUn628COc0atYZ/CbMaWxG+
	0TNGfxRCGsv1WrYANoIZaC+tKoYjD5X8kNmyXR8dpBZayuNDuuUCja+hWrjMqbQc
	XxkpdvsWiVArTT9UJfikfZbnelRb/DRpVlYgtxXFa3XtPyVF0540TWjYmvrsqO+P
	R+hi3LRmruY6Y/3r56HGQKoFy0CaepMpMmZG4klMBviT1U+1fEaeySnvKUF8n+Z1
	Wfi1IZWcGzocGnaz/SNYLQqLT3qgJR8XlBsQ+qKgyEYQQVpJE2NW3vnlCVKHFSdC
	M3nFonl+TButab+DN9Vmtl2UIUTzMNzzvKDIVO34G60V2AXaydz6Pdka2IA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0yu605gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800 (PST)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so224983a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:55:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794956105; cv=none;
        d=google.com; s=arc-20260327;
        b=mfEfnMNx18KXRM2gfsZqm4zygHasyDjE/0Vu3aV777kS6waotaU7pECy9pocLdSjL2
         MEPWHusYQrbiu7fouTr/wzq1Ccj9Ux18sBISi7nVUigBIvyI0yPi9lICbFTN+2lUUEIi
         2addbFQDiCdwO2EGzVg2zguCVl6JdHLkW9sSyW/IQWK18yVenr3UP/XNjYQUIQ8NhG5S
         2MPch2fREwbsK9f/mKBgYaqfU8pU75OxwalR3+J4i+yVsrIzFJcazMj7F3btj+5wBBL4
         xWFllg7IeaACuHvrpdl55AUKIgsRGc1zfIXyosxr5jTKaXRakUKAUTBZgt2ta6I/o5t1
         /wRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        fh=jZIHJ0Y/heO7crXoYwyVhFsawbdl2lyisMGo3VeTwxU=;
        b=QtZy///sVrwGnopITkqfiah69lWEjaWvyeGUC5p0FEePtjxLslXabYAEJ7tr3O+n1T
         OM3LhEtTgVGIkThpk/GGrw+rAlBQuhzyo6Cun8+QPV82Dt1zf8bM79lZHnTxXtexCDRi
         TTmdICCbCpwp8KzCqjn3I8rLAt+J19+kGRXKPss1PVK8Z9i+8mjVtFPZ5/iF2H1BYpbp
         R3CTACyxmtsKEpyg5U5VKAYtwcEUj7zabf2RwC5Z+max6MeE5lUoXwvem1h+oVnv1mLp
         fHQz/PAIDFCBC0BYJXsEtunOa4mkJaQ9/ApzebT8TKacXxv1RzBrHqCzCeC/6W49zWRP
         tjgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956105; x=1795560905;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTWULvHY5M+9jFlLZATjLnhYmcapf/iX/XpM8N+MwzI=;
        b=iYNPx6rJl/zqx7crQgE8x3ucG39Xa25yzMFjuO+1coFmpNcRKgxsWIruyw0paxEwWy
         F6ErPA5OzvgT0NkbsuaQzY375qbqGNTBXZgZBSj7S9Wm9aRB2vGsdxZzklSbPDVTg+6B
         IeyE6MrDB7LtuUc2gk5DdNFQewIX4vfZGqAgOAzALhTOwHRCR9yXfaTjWRW1AdiqChaH
         CF9sPSr6RWVas97in/Dh6ZfvI48bRfUnrMHSVpRtHzddW+5f+j708aHMR/iFZOCQeV4d
         Jm1jNwH5r09b/Px9+3CrZtmoEVuLQzu4ZCKAE0pbU5c1TGMFI5u7nbxmGmLtCV7Ed8CS
         3DrQ==
X-Forwarded-Encrypted: i=1; AL+hErFJQCmVWu9MgBnKBhM6OYdiWi7sCTqGfHmWm7pncN0SdemjItfv22kVmOgUnTElSOkZX18oJnLeP+YajQWmLqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AJs5h5UmEOAwfgTmehHKnOeHzc+qegbG0ASyYWydMSxO3hTAY
	DH1MSCHS55lM+6TMKERpppzFQW4smi1n9yEZfzYF7RuSTCUZDOe7nLe9oR7I8fpRgulS2fnmV0v
	9VQyl3JwWZOiw0lXNi73atSJsFDFGf472g8WJBmK9kF6A1cN5TSO6AyDZBBtpFBKqL/TPFtnwx4
	m3TBxpFhEmr8mSdCcx9lkwvTavHhQe5x7FdbSXse+EWzs=
X-Gm-Gg: AZFdTZdDcr2o4+3EpSfErH7EeXcIvNpFDvBaSFVi/RY0Nkqm9Mp4oCFzyxDKz4CK3+8
	Q/Z2Ts0N4zVKcyR2nfPjbJWD8c3YrltvuOp3X+rdnYpPBh31KRFYL4ZZioHnUEtaCUq+uQlBcT6
	13ZNZpYgDfngBE3J0zOXjt8DzYDeW8spxbeWORN7ATsTTO3/xQowDwKGJZszig4BJ6p9uAWEtvq
	2psQM/V3PsKW5vNGoBwDswnxCrknkSqJbfUTCOItd2NgXKZvmQ=
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3b3d0640f3bmr891143a91.6.1794956105111;
        Tue, 17 Nov 2026 14:55:05 -0800 (PST)
X-Received: by 2002:a17:90b:5390:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b3d0640f3bmr891106a91.6.1794956104611; Tue, 17 Nov 2026
 14:55:04 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-11-toddfreed@meta.com> <179471270629.2199510.9480561958902023552@kernel.org>
In-Reply-To: <179471270629.2199510.9480561958902023552@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:54:52 -0800
X-Gm-Features: Aa3M54pEdqPp10DAjnIjgsYaaHWMRisY79HeZKYFQbRbnu5DENxcJuo9y0o8SvU
Message-ID: <CADh2yMxPrJZNtVdCgQWkHsKBk0cnAZ-0RiVaCMquQNSH8K32Mw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 10/15] net/sched: flower: add psp_spi,
 psp_ver, and psp_dev matches
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
X-Proofpoint-GUID: RO3vTOwZICXU8RHW2BbhmZWcw3jRP7Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX3oCJdhEIzZgF
 ID0cWcLf68HoBaETvwpziGXos7qTO7rCuCQLsDgmKoHFNrOxgiHOrIUrm3A5BIzBKrCE//DEZig
 AZavW9QXU0HhtkGcSUFQHlfGdyfpybr6GPX9c7H0uY8+K3vH38rKwPfzGMEJ6RCqs9B88XaSbSM
 vDM38aoe7YQF50l0o/SYvx5amZD8Ppb3guv9ehXdYEiMchIKMysZacaFOAxznumpuFAy1G7I7lV
 fZ63iwzN2yYx6kPplK9YM+e0f8sh4gB6BRZndyUsH/rJTu2MtVspLrvdn4HfAjc4oCLmB01IXG0
 ufJg6nwfh0925W8ZBsmkJuGvR0fpfTAC6ICtFLWR1rEDeiw2VxVJ3bIgRraucM0SGzAw8XEhpFt
 WtundRVyQlQBapedSkAwkXJRcbmdzehUM5AohfhskqgntNzXsWBhZOjaHxGqwJoDGnry24sA1v2
 n/y0+vIKdMx5ckY9YqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX4ypJAwkhNTc7
 Q/fAeRrTFxtnz1DV6ZBWUgd9/EGfXpwF7SbTP3FZAlRXP+l4db0ogjq1tgarVtdz9FO7FEgHcXV
 7dDJm+ft7mFY0snIRoQlmq3BzRUWWqM=
X-Proofpoint-ORIG-GUID: RO3vTOwZICXU8RHW2BbhmZWcw3jRP7Ka
X-Authority-Analysis: v=2.4 cv=Mfz5KJ/f c=1 sm=1 tr=0 ts=6afcdb4a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=e8l9bKk9WhIOE85pT1MA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01

> [Severity: Medium]
> Does the commit message describe the right failure mode for rules that
> are still installed after two key rotations?
>
> The commit message says:
>
>   Together these matches tie a rule to one association, ...
>
> and:
>
>   this means that a rule matching packets that correspond to an rx
>   association which is stale (two rotations have passed), can still match.
>
> The "Socket-less associations" text that a later patch in this series
> adds to Documentation/networking/psp.rst has the same gap. It only says
> userspace should replace such rules before two rotations, and it repeats
> that the matches tie a decap rule to one Rx association. No later patch
> in the series adds a generation match or any enforcement.
>
> Could the commit message and the documentation say that a stale rule can
> end up matching a different association that reused the SPI, rather
> than the stale association itself?

In v2, there are no Rx associations. It will be more clear that matches tie a
rule to a SPI not to an association. And the reliance on userspace to replace
rules before that SPI could be re-used, will be further highlighted.

-Todd
