Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792709006;
	b=m/DxfSu/63tApC+PY1927+jqLtmvVKlMt8u06OrX4HWE8p6jIHVCXiwF74kEQ5cZbDoG
	 FfeAw+jUrKy3GWwkI2IDKuNRDobiS47/cNwpq71ts/AzQClB80wMvH3aYVj4DOLnTCOFW
	 hXda1uWLs10ms+wfI2gsOKHN19+0JFbXsvr5X7cXjl3j5LyE3/7rIsv/YvFqQ9hTE7gd3
	 BEDegrUTQpiaERP0k1D4ERs2CptgC3a4WKCN18u7Y2DTUB5ApOiqufrofnZRFEw87O78c
	 1iIfWlOWkglItitFLmjqI05IiSoi7ox8r7tlJ4KNE1Jme/4ntLdz6sj5iQ26pXve/Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=OXHndlNEF0artUcG3fV3q/EzUZgO9d8Xzd3Y8yUkl8k=;
	b=wGnv1sIXC8gr2p4/3acv/tlngc86KXz9TPSmlYWzIv6e3Y2i8kWRN9rP0XvY76OJQIv2
	 cShPcRlbbAYtJCVH12/t7swYxS47vyhYGZ+J3ss4B7XtyHyzc8rYMjp+EgITGs71m3mBf
	 St22F0EJzrupygtHkXgkK+CMAcqzrJqpx4+tT6+bJ0LD1iUteAL2jVu89DJOoTrQAf1CT
	 WKPKMV+kmSHkdqj//2DWfjT6K8JfCE812Vj+OgeMIuNSQAksS7dY/Uur4MfNzhmQRIeiB
	 p05LhML5jajMacCh+oqFX0vqAMHQlENcA33hsaJXIBzFSY254pspq1r4JL+kzXw5xhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b="Q/W/ODGu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D203606A31A
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 22:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D203606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Q/W/ODGu
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MMUgAD852474
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:43:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=OXHndlNEF0a
	rtUcG3fV3q/EzUZgO9d8Xzd3Y8yUkl8k=; b=Q/W/ODGuIAc1/3Y3NB8YP//NjVK
	9Q/LDRk8a+jE4nNBOwb5MaN0DqDEW4K1+xRI1h3EjlnSJ34GziJ1aQ/hMGpxn8wL
	mWVFt2oNvBHPYGNzWRMW982XrHBUrU+usnBYSjGsvtRHtZ/+KIA9+oFvgwSrOcEf
	bk/dV2RZDQ/roPv6z3ulOtLpG2zw/H5yHpg2JTJXnMcQR/MO6U5X68pIXAEO9UTn
	80oaTn5aBul8FTnYAHfNgW6Uf7HMgupJ0YuKHQqGbBcSg+wWob+J1KlIppDe02k5
	hyfmvD4QmQvg1DKe+hRF/QJz2hrz7Go0Yqg6YuwEiuirEg71fIlSPi+w8xg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by m0089730.ppops.net (PPS) with ESMTPS id 4hf9c1y7r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:43:24 -0700 (PDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso2409985ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 15:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792709003; cv=none;
        d=google.com; s=arc-20260327;
        b=jeWfQESP6urEyOAa785nbzohy/cjWliGVzgbvz4wUPOs0Xus0IKCgX1VREpYARA+KC
         boscY2+XY9tmcuJGcrCj7KhOJyEOVsfRRYUOUz14IIZoBT4voB0VwZOFoFZYsOrPAPcy
         0/C4TXfPLKN+XuAuVyj1eZVOlE/FFgM06hzT2wXk3nsCCCUH3g+Y3qTcvaL6y3tTxNO2
         ETyHLVNrtKPqiBUdVqGEmjQsBs9JA3g8l8K/yPGBjEfQULRDCsA+79djfYGeiJ3JfWl6
         BDcrbbO3HY+UP1PBJBIeo5KTLQtAJIWKUQrmm6J0UsTqWNQgrP2K+AFWrql1I9WxeCA4
         i0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=OXHndlNEF0artUcG3fV3q/EzUZgO9d8Xzd3Y8yUkl8k=;
        fh=uq3Stx9kbtif+iNeslrVCIJ6OEu+kN0QhUhdagNV5dA=;
        b=d9T0Awz+Js/OuvCLcB9oh/0BwqtSYunpYNk/oDugPib+5cesdadI7/iTMGsKSBiLss
         Ardx/QCq34Q+VHq3yz/6LvTDlXCMRVZnIGSz17aEN/PEO9lQr/IqcGxN3yYbjWAiE0BD
         IO1ToiGDDVc5RwoawVhup0Btq7kDCxcG6N6V1VP5feKqjkULwwErpTiqMcMBDTesg0JZ
         QVV3CmRkU26tHrMKbxfZEvVsNDMydNGusAQt+n28zc09/nIx26w0WJ6W9YelG8CqCZcU
         a2qdiVWhMnE0o69UgWbPtgczPaEfpsV+hUa1rsgJ7I5wtSE67dMaNePQRbqSSWZ9u0Gr
         xccQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709003; x=1793313803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OXHndlNEF0artUcG3fV3q/EzUZgO9d8Xzd3Y8yUkl8k=;
        b=uNUx51P5+HSL0rHPZt1ZF3P7r5C/+pj6gtdFUQLfPRP1LZxxI/4VscACczZTS0aUSw
         /eqiyFc2DME20rwWvJKljDA0B+i3wg0jKm0yE05DAmNRpU5OQVq0W1UHOAhXNkVw5G+/
         jcAOtxs0U/HRVyR03nYaWMsHm049RhuDF+GD2GiF1GlTCvYp8IgQfUUjG92r5kjQIO8c
         CGBMJcnFVVF41qCTxFIH+bB1CtG37pSVgPC5JWiWwZoF3QUf4g9WjzkpqPR7IR9fVqEr
         jfnTYoEyL8eXmxtnkD+Dy7ojIXDqDlQMTgiMdfDoWNGh9CSROXuZYyORbsm8Cm0skkRs
         L/ug==
X-Forwarded-Encrypted: i=1; AKwUvBynSZLqOKrzD7iHU3PtB70Vb6uZlQ15NVAwoXjPIt3CwmBIJuKkmuME7x29VILP2wTfYcxRMlI8pRQQH+M6Iww=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBmSMaE9vbd54dwimOuvReHhnfJ/mSop0fOs9bT6O8PS67Kgtt
	PQK2EX5BXN/Ut+z3K4VEZuzdGkJ5qXprfUArrGgVpFTrUtH1ptVjzvgAH3czg5++5p82N1FRJJ8
	nNz5E1dEzPv0TYesA/I7rfDG+/13MIaxdurFdmOa9gNc5pNFvxrjX6PT8pxQAgxUthLzhlnkQf/
	R+nbhZoSdlNcLAGIrsDs1kdPi0klHg+QKL/YPYa4uXlXOlIo/6Dcm6aA==
X-Gm-Gg: AYBFou1m2iD9jQbMc7c8iUAFi7u0dHiW6FHEH8hqdsM7qmD53Iee8FGopZa4GPtH9mZ
	JgHhBwVm1a+h4faK5pg+riBYJqY7tyXiL/Eh6ZhSt4/KZOT7/mdaYj8c/f6lBvYgEH+PZc2z4bu
	Mx90uN7ZCI9RfjS1oHNF99l3+4YIl3IfBKVKg5IV8YoJedn4YcV0NGCjnQVti4X0MYZmuRTuQvP
	WO70O70ahUgihL0wU0JSiYxDTwkvC7O
X-Received: by 2002:a17:902:e74f:b0:2e8:e617:18 with SMTP id d9443c01a7336-2ea7cf1fc8amr5537675ad.48.1792709003165;
        Thu, 22 Oct 2026 15:43:23 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2e8:e617:18 with SMTP id
 d9443c01a7336-2ea7cf1fc8amr5537525ad.48.1792709002694; Thu, 22 Oct 2026
 15:43:22 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021210200.788191-1-toddfreed@meta.com> <DMAUWQVPIVKP.1QAK1YSA76EHJ@gmail.com>
 <CADh2yMypAdV07rRufDqj1aOdEzAqEaH2bDkJ2jYV_z1_9iXRkg@mail.gmail.com> <DMBCRFEQZ7D8.1SQ5SSTSTGZFR@gmail.com>
In-Reply-To: <DMBCRFEQZ7D8.1SQ5SSTSTGZFR@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 22 Oct 2026 15:43:11 -0700
X-Gm-Features: AclHuK9BlczNXHcXKf4MiL-vKXx0PhBMoAAl6NmibBaY74pzVNx35cRKB9OAkyI
Message-ID: <CADh2yMwCXLg1ZSKcvcxeHHY2VT37VnZ0wui1ntJzDFGs5O6HEQ@mail.gmail.com>
Subject: Re: [PATCH net 0/2] psp: drop packets with extension headers in
 transport mode
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Shuah Khan <shuah@kernel.org>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Raed Salem <raeds@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: vHc5nmze3hhHipYuL1z6S1CQnFIFe2qP
X-Authority-Analysis: v=2.4 cv=O/qsLx9W c=1 sm=1 tr=0 ts=6ada918c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=855S8uPTkML1Oy45N9_h:22
 a=1VPquFuFVG6CK8bRhQYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA5MCBTYWx0ZWRfX5SErDUoSJMWA
 rqqLrhmxdYgJg8/w2IujnmbC40s3INjdEQjl5wXVPQkHBBBmKZW944YhTLe9L8dARNaqdArCg1F
 wBRuXLrDjYgWhUrCFEd8HtKa1mgMOyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA5MCBTYWx0ZWRfX4uXdSr7W4w4T
 WQYWM6L3oPBQRNM3fACqHsYHa1M4tEVnUjkzOSANVKSCOz1JO+ipb2p1Jqu7wlmuwjj8II/yKfc
 WPxsx4SqZ2krd+JO30M+1tnHuaAaNhDQ5jAQBNp+SX98u5u1YdwRu3bipgl75M5i5z7gP2YQMyV
 VY/HvxGEmg7CBXPWjhc95bstHICyzeEovAE+JEWfvsJUkkZRBjkNUxutT/ZOApEFywXdmCAJll9
 XSNpsrXimONc6VVknx0Pn/iC2FnJ24pK2Etx8sPDZusYHWMJTEz0i1uwjHTZYpncFeX5wcIqXzZ
 JctiPW1Khf91IsbA3Ia6zNKEC7iYX9kJ+r6EdoaBN9QB8KVtaADNSJ8ZqVXF2YnryNer6zexudX
 C6HoceT1QlS3Olk84CdsX6bGGVlSmdyUGB0mOAR69ka0knyEELXDX7uESl4CUwZG9tZuTbvogxU
 dOBpzGOPWkCzwGkDexA==
X-Proofpoint-ORIG-GUID: vHc5nmze3hhHipYuL1z6S1CQnFIFe2qP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01

> > Explicitly dropping ipv6 packets with fragments is consistent with the
> > current behavior (it already doesn't work).
> >
> > -Todd
>
> I think walking the extension headers and inserting before the transport
> header is better than dropping. I agree with Bjorn that rejecting
> fragment header makes sense because the receiver can't decrypt the
> fragmented PSP payload.

Sounds good. Please see v2, where I have implemented this. After doing
more research today, I discovered reasons why routing headers will also
not cleanly work, so dropping those as well.

-Todd
