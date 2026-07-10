Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790FA3C13F8
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718800; cv=fail; b=Y25gmYNaOVXb9H1TtbtKOLpJI4NDtF357Qnam4ZZBLf6mvq7N5nLhYO3/TD2J/tEj3OIRk9Lj6AvY/5Qs3PG26vE9gdQe5k/qi5X+KKR/sw6wIviIZebdBn9jw8bXmU5k3zjMahA1OGehiUrP4bYnLghguJprp4yvzelurY32XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718800; c=relaxed/simple;
	bh=VkC6ASY6hMpcb2N3FQ3m7UCF3tlkExQIcMsQcc5KFgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TvPL6mOiEuncIn4Arcna1rORbxDxyBAIdU5jr5iDMB1yw8980sXUVtGhZSrfmBQ1scHXI269xf2NffmclnlYa9DUFv0nCCyU5g51wCig2jCBwJ/ZTZf//oJIcW7TlMguU3Wm02eKMpxM4sn+N31odOc+To76wZ3v18Fa+/Y0UjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=MHyYFJ8T; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="MHyYFJ8T"
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AK2fGP2468858
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:26:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=4rVTCVe8LWbzPm0wjrSAG/mKG3KG/lwpsyIV2TiZsYM=; b=MHyYFJ8T0cAB
	L2thTi2mW0tU4fKtEkEPlTuNlGSYNbAUHm2cGN71mq4XJ4e9JRvXbECAO+LUE4wt
	K1IoCs6xDb82FhZ25qMZbkgIExbpGLxJb+j7vZQklv61ikYvgVa3EdM8bUKoN2kn
	qVAEIzWte1NFNwu9+oa2TdM0NR/dky97cKPGNGaJFWix6NXSrHe/BFvk2SDDVAKM
	E9UpXcQv9/N0fhLIFCRg7OHIzQeeZ6I1uG2uWvQ0XeZG1mAzAhXXnkNT0bLeIzcc
	ALSpjILyQaLkuXvHF8KPQQBD1/CJXMd9rnIQNZB/myvXMIMoLEeh/K7YDpFPbdMZ
	F1lIpqYrqg==
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fa8q93h5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:26:33 -0700 (PDT)
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15c32294e1so134481366b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 14:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783718792; cv=none;
        d=google.com; s=arc-20260327;
        b=GRbpRDv648kg/7kQaVuS7tbod8uo0LCeU7a4NgIZal23YdtYF+qCZrpMl7/BfJpguh
         pBkUxbEehe8R/9x+lXFcCmDUbl02qsYUtFLdPw2x7yPsz1FlJtDZCLQuG4SUydQJf2FI
         caYjdeNunAmppCGL4O/XIC31fYsVc9XhJ/WwzqIxI99edDTtaCHsvbcFYamP4BYFZD7j
         Kz5KIbfhLIUseyfW2WGdW4RZy31h8+Ruzc8sIazSXLjYMlvsS/n4Pra5lJUX5JfShE/B
         rULhgI7nR9IhmL6OAMEYZ90rr/hsDPeYBbytXS/+3k+a74fynO/3GDZUzgH4OFJCF8rF
         Aozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=FNJYGUchRZc+yyibQEoFJBWXm2WlrbE2kAvLAMOngVI=;
        fh=csfodUZ1WADaDb9ID+FMr6ReBWQj6YhEjka9vV0qcB8=;
        b=V9V92V34XrSxITUO/Om55w48kpcmdAZbISwPPnzBt6VzH3pJmGE8qHZQ7/6OyV0BER
         MsyQIGqyRLW+IpLBTbejGpl2jaxzqUjKMmh2d5x5dJDBnsc7nzLR2+xi33R34Zu//dVA
         Qg0HJpI7K8nFmv5tdwVX/yYp43hGdXPf954Do0evgw4SkaSYsbZlTKT1+Yy+HpB00VtO
         F7XEIcT4kZ3ZiXy3yLk71PuqsA/uAbx5F3Mx4aZ0tOm5XwjLQQ3txhJAGWV3lS/fKzZX
         5/fafvIfKtpAfk4f2fQ/LxDH6N0VRvhCtI4Fq4+vMwvbqLptPTdPGFJ/kwL03SoMTYPo
         enuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718792; x=1784323592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNJYGUchRZc+yyibQEoFJBWXm2WlrbE2kAvLAMOngVI=;
        b=Rd9L5M6/nd+Mgqm3rqDqsjBPo+rx/ts1nT+3+zv7im7x+oi9LuxFXm29qnPYmC35fe
         Z17ygcmPraloatSpNBhsmZvWHBRNfMzCBIjZ+efqTO1RP+iumz+PGawd1pTMPKfW5jNQ
         wLgCZ8vvO59C2oAo3LALs13dtRYtjKzb1is8kLi71wR7uLfO7rRvVz9lSRsERfvXd+9l
         n8+yGr78mS+sYsoP4CP5tAd+4bgoTAwiAwa0XntqvFz/+Bw2usYl+SHI4UkPFJrypYcL
         rpoF9XCJCD8+JshrDhkprUvA4RCSi/1g1eebGMeFE8ofVTSFwfvgyWbkHjdSGQGhVcDQ
         30Fw==
X-Forwarded-Encrypted: i=1; AHgh+RotpkUeQfev8OJU6G3XUfrtBQwmRPxksuYcS/3KkU3CpInSrgXHwjX6ugtsAV/8ULfjNfYwxrFiS2edaXq3SHs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2mgYWm7+2bKEAfuOcn/ArOJFjWC4v2patOg/m6NMDHJLnjV0O
	TU5qHwdw4UKamis2/XSCZYklBqyBfL6R2SbDPTtoa5K0itWyONpv0aS3iJ4xlG7M4+c03a1IDMM
	dGsQokw1NAPblfwvaeXkgDsVc9JmnpG6LCxw4J9Q8X/iVYz1S3vFFzZPkOqZH5oT++FYKGVD182
	4k7iTjtvo05VbICRsAIVxR95w4q/x17QtWi0LkgbzeZA==
X-Gm-Gg: AfdE7clYLLB7ZgG2gl7uNzTCGx1WFmXlsMUeFy5qVrh/ICGZwmyCbNFDHhoohnm7Mws
	CZzJg9kcs62JK4KahGCtjwH9GpiffZJOOUfIj3ZWaSCWzy88qk8qOXjQHleEuC4GsIOSwJ0jl82
	5dSEahjbF1yC3FI+LPriuZiR5qI0BjbNIdDm+p+3WzMAvNHWenE1IJg5HxIcg7W+1COusGjvKO
X-Received: by 2002:a17:907:c084:b0:c0e:883e:93fd with SMTP id a640c23a62f3a-c161ea934b9mr22612566b.48.1783718792375;
        Fri, 10 Jul 2026 14:26:32 -0700 (PDT)
X-Received: by 2002:a17:907:c084:b0:c0e:883e:93fd with SMTP id
 a640c23a62f3a-c161ea934b9mr22610966b.48.1783718791996; Fri, 10 Jul 2026
 14:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org> <20260710-net-sft-fix-containers-v1-6-a2915c294ef5@kernel.org>
In-Reply-To: <20260710-net-sft-fix-containers-v1-6-a2915c294ef5@kernel.org>
From: Wei Wang <weibunny@meta.com>
Date: Fri, 10 Jul 2026 14:26:20 -0700
X-Gm-Features: AVVi8CfAds6-1QvMPvHqFEOGQj6cDhKRwM4ua7wpqufDJTfdW3NOUKcxL1Pga9E
Message-ID: <CADe0Y=tMSQerM4or_QNO6tjc6GaEiysaGpmcHnWhaDKQocN86w@mail.gmail.com>
Subject: Re: [PATCH net 6/7] selftests: drv-net: add missing kconfig for psp.py
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Mohsin Bashir <mohsin.bashr@gmail.com>, David Wei <dw@davidwei.uk>,
        Wei Wang <weibunny@fb.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX//9yQtkrbR3J
 ZkJayOO/3Om28J+3QtCTBDIS6wvS//+oJYtzuuOUuEbfBvh38qHvar2Lm4pAA876TfegnQWvYhf
 3rcDDO0QaFPcR6x1NnJ+f4KNCJGPWWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxNCBTYWx0ZWRfX3AE8YiIZ/A7t
 /lt0D7IGmvSSQmucYVXtPiXVnPbaD8gTwoaSZZJUSPFS8WsknWDxNcCP/iguUatF5SZCrdbsJ6P
 +lzJMHGCsTWxOSNzMQg/K/K6DzMTxNV7CSSDG/8qTFg2scO/A6Iz9oFUOeCEyp0lcvr/X2+YLEn
 PAjte4TeYnMLvD19rmFVD3XAnoTb3yUN7s/VFfnWT1jD3MoUcRF0elai6emkEUIENgz4wp6+Dmz
 Z9ubf7a/RT38WMYD7sRWVRTEdRtXNDA56pRM/6dPMPx1VAaER0wMYTfzDKdhB12g9+UpC8q10Ld
 LJQMM80eFa1t4ZIeyKjxa4X67/LzLV6umLix3ftQBFtXjmhzNLz2jDf9kdaYaXXrjO/uIxNaVuC
 SF91TUyXGT3z5mM4Owr9H8J8D22FhYnR6q56nnle7YH1hijgU/esSOUBESd1BRHxAgEniq659YG
 lkXQYS9F1FwAeUNcaNw==
X-Proofpoint-ORIG-GUID: tTcjUUAJVR6h5LnpaT2JqjGuYsDtuIZY
X-Proofpoint-GUID: tTcjUUAJVR6h5LnpaT2JqjGuYsDtuIZY
X-Authority-Analysis: v=2.4 cv=cJPQdFeN c=1 sm=1 tr=0 ts=6a516389 cx=c_pps
 a=D+UBI74RbQA8i2EYnbuvxw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VwQbUJbxAAAA:8 a=hWMQpYRtAAAA:8 a=pGLkceISAAAA:8 a=FOH2dFAWAAAA:8
 a=ctOhbmcJb_RA1L7furcA:9 a=QEXdDO2ut3YA:10 a=PsfoTyiJ_72bb7xyA04f:22
 a=KCsI-UfzjElwHeZNREa_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01

On Fri, Jul 10, 2026 at 11:05=E2=80=AFAM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> >
> This psp.py selftest was failing on my side when only using the
> drivers/net config file on top of the default one -- the recommended way
> to execute selftest targets.
>
> It looks like some kernel config are needed to execute the new tc
> commands.
>
> Note that this was not visible on NIPA, because these tests are executed
> with the drivers/net/hw ones, combining the two config files, and the hw
> one contains the missing ones.
>
> Fixes: 3f74d5bb807e ("selftests/net: Add env for container based tests")
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> ---
> To: Andrew Lunn <andrew+netdev@lunn.ch>
> To: Alexei Starovoitov <ast@kernel.org>
> To: Daniel Borkmann <daniel@iogearbox.net>
> To: Jesper Dangaard Brouer <hawk@kernel.org>
> To: John Fastabend <john.fastabend@gmail.com>
> To: Stanislav Fomichev <sdf@fomichev.me>
> To: Mohsin Bashir <mohsin.bashr@gmail.com>
> To: David Wei <dw@davidwei.uk>
> Cc: Wei Wang <weibunny@fb.com>
> Cc: bpf@vger.kernel.org
> ---

The fix makes sense to me.

Reviewed-by: Wei Wang <weibunny@fb.com>

>  tools/testing/selftests/drivers/net/config | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/s=
elftests/drivers/net/config
> index 91d4fd410914..2070e890e064 100644
> --- a/tools/testing/selftests/drivers/net/config
> +++ b/tools/testing/selftests/drivers/net/config
> @@ -4,6 +4,8 @@ CONFIG_DEBUG_INFO_BTF_MODULES=3Dn
>  CONFIG_INET_PSP=3Dy
>  CONFIG_IPV6=3Dy
>  CONFIG_MACSEC=3Dm
> +CONFIG_NET_CLS_ACT=3Dy
> +CONFIG_NET_CLS_BPF=3Dy
>  CONFIG_NETCONSOLE=3Dm
>  CONFIG_NETCONSOLE_DYNAMIC=3Dy
>  CONFIG_NETCONSOLE_EXTENDED_LOG=3Dy
> @@ -11,6 +13,7 @@ CONFIG_NETDEVSIM=3Dm
>  CONFIG_NETKIT=3Dy
>  CONFIG_NET_SCH_ETF=3Dm
>  CONFIG_NET_SCH_FQ=3Dm
> +CONFIG_NET_SCH_INGRESS=3Dy
>  CONFIG_PPP=3Dy
>  CONFIG_PPPOE=3Dy
>  CONFIG_VLAN_8021Q=3Dm
>
> --
> 2.53.0
>
