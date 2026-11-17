Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953064;
	b=kEV4IyQD+ZpmKV1LFHTNA1px+0TIVcnZshEYreo7h/ECaem1w849kZZlsTVxPCx/rxEW
	 DfAQ9WrVIvX0WdjjgZfn4xjNBIQi7FNnxTrTpHTtontJXBVZrFkQdLStCOI/bOwJy9Sd7
	 dR28ahK9ueYpQzrewIdFUFPvdNy2RqfWq0C2DGt69FSffJYQyrR056JASIxH+BRNgInON
	 llpzMrN+XWgwT22O1ATux5FazDGXP5SuSepzshijNDSg795fGrMkwoPF3kiRCBvs4bSEf
	 fC0EkEP1++EIruVj+NPlyni1rlW533Je2FiNDhKAfUpr0CugAQn51ROAJPhojyIyoaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
	b=dnW0lf4WGKATL6y4hW025M4wszUBWKR8EULX4NjQcUjN6qTpptC5Xya9szrWIE9/E3XZ
	 Wnx4W0nj3/5GOJ08eyn+x1Ll1jD3yC5U4h4EOfKk/k0ucsj+9+zbsBUdXLXvZxm1+nHQL
	 bUXayv6H/86jpl6fxBCPaE73neZAYwUVmb2PxWDqOLC6jRzQ38M8kUAqjROArx0oAjmsd
	 6vy2tWeE0Kp2GhPqJsHVXxsQYiRYXEpkE43kbZTd1utb9rMTTmR702sA8cBGGxS9uYJlV
	 5goCSrRXW4JBsoK+uo3ZmMw/OsNUgyqgg79Vxd6nJI+j+tuYrDOByicwn051XoXEX1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE1606A331
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 22:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDE1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=l7uGjHqQ
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHM1qSs2806596
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=F0h8eziyjQa
	KcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=; b=l7uGjHqQiohs5ekfiARvjRSqonZ
	vfWTdNRDAMTgYbwgHd2DiCaSQiby1P8w8eUQPRR+TIo9nRLlBQFNdDnVag4VjV5v
	zrbZw23J8ETzA0nATXP0IVDkySa05zQZtoRlDwRuy1a2ZoxUH4Pp1yJR43RsCUgv
	tl+xcJlH6woyek733bANbYzH8HReXmgA4za22Txg6BnnOkOdLsXPCv3qcCky4PEl
	oTyV9zDt2xSDfhUpHFVmZaywQ69nMGDlbBxkhLjsgqHBVVkUhwg+7DJBMhDNzWHE
	pFQ8H/gSSYpsYTJQrKrhs1zeRTZ+DY87ItQdcFZRO3NzTPrKdYV1xdB2t8g==
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j0y9502tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:04:23 -0800 (PST)
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df02b91f9so766353f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 14:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953061; cv=none;
        d=google.com; s=arc-20260327;
        b=LtABIF7GjA4CGA/Gc9cSZhnEdvV9hGtuz4+dGCcYB2PWWQHIz2jDF/dLmGLMq6yXhj
         6h1k2dFS2VNqjOlEl7Giao6kALyZMaWwC1sa4EZt45lPgoLDpM2fNoiUxHlpsNgdrmKp
         7wl8pnFA24O0g8NOvw2HtGeaW7LodiColokV0vh8qt8QCnkRI0Kcx0NBqRBvUTa+mihw
         CulFmCygYuhWz1pncvcjYjE8e5CMA9f3mLitJDmcmwGmBaBqD5lMxAq5XKphD3CwGz4a
         ptOzfavL68fAMOdrmRmuLKWg7UPktojnO70RF2bJbvhnzag/BmKs2kzq8FHYWlK78ZGg
         zQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        fh=NpKlqIWjLuWIIGDRshN/gKSuT1A08dlGsK6WWi6WqMs=;
        b=HXry+OJzFb1dPkz9r+caRxwH4nSjS6D5kOf7DqNUyoVyhrhCw1Ku1cVppxyNFImXN+
         Gx6J3CoR4KWAr24qTrL+c3mSb9By3HQTV4HcSFlb7+Lu+7brcw5KM7Y9OvArRs7lTDT4
         XhYxZsSABoeyXcEvQmU+43UWaWtlG4SlTLLb0LHGzVY8qzzPrqiWfguoW6Bcfus+ZUST
         RXCSu8mg99DqCShgIxdF3ouBmT3/uQAPeTpX3/J1JiQK7fSS8XZNbuFhslHiR82ZoHqa
         rNswgAIqRXNBwKTNp4ta8mshJw+xNYvlTxfxH59uy/pITOzPS/qylT/wN7uym1PW4UIc
         isqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953061; x=1795557861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F0h8eziyjQaKcApZn3rXwi6/D2KTrjlf79mLv/zsAlo=;
        b=UVacD1BD91rhwG3NIcwzTAnPtpGxCfqQZik6NOakFKBnNnMt9Yhqn2tPam0JuR6YNl
         xDqTG7dY1Am4dQ84mstrG5UD+TQQWAzIPyGqqBupL2BZFycUg9bG2ZByeXeSDPmsKS5w
         0AExha9GDFaw9h9gjEiVFeUsldFBxptnoKBzYjX7G5+DgsiDWL5SUK+YkZ8sU3OI/kka
         cTQcANk6y5bK4kKgotyWX61LPpv0KyoJ/un+tzyYmenSCMHz8Nd7cGgDRCJPzgZ2ncrJ
         o5J4pzCE6HFoaHXwiKK4yyo/C8FTwwFB6XRMj86JT+A4eY7YUYOYE6PUI4ppi5KIcy1v
         e4+A==
X-Forwarded-Encrypted: i=1; AL+hErF7uU0GJCFBN01x59IOz7KTNIlsF4Mmi9RyRxcYH0po7QU2hkXyHcQVIfBZtNcQy+3xct7DNuYTDdRi3NGHSkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1wlOjHuQbJuEOe6/b5hTzp3EfZmqXtUeoZHMpgJDXOmEwhBHr
	b0J1BM82P2ca+ohsofZ22EhjPUcvEaICIUdD1ib2s47PjB+LyaXgcIp8W1AbbwkJqLuS5rhVb1g
	KSRM3ypegwzUJ1cukFU8GT11rRXbc4vL8vZ6sJGVIJPL/oCMJXWwQznDlXYxsl0MujwLI9+yyUQ
	pe3jYhpks16Qk2V0DuHQScT0M6ZGnFdym/0x4n/QzoBbU=
X-Gm-Gg: AZFdTZdjkmyeXXmFBGcxtUwFkyRdxIUH3efEVak435vw4DCKtIM8htTofBznLqAwD58
	0mWz0QWsUFAUYc1H0Sk4nPV27ZobdrxPmUpuMNKwuclJ6b7c+W9vEguYYqyS++fmUl8FRdjIkdi
	u78le06mBM1kl5XOC70RmkQPL10j/ku1b9NZrAsrtH45VfYVhbLVD7dJS36Ec01dcmdEZ8x/N2n
	BTDIVxvq/s6yodFUEW5dvYjq4ykNV3Kt6GGvMnLuGaWKlDKJ2o=
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id ffacd0b85a97d-4a377f4f68bmr8136036f8f.30.1794953061554;
        Tue, 17 Nov 2026 14:04:21 -0800 (PST)
X-Received: by 2002:a05:6000:4213:b0:49a:94e6:378d with SMTP id
 ffacd0b85a97d-4a377f4f68bmr8135992f8f.30.1794953061161; Tue, 17 Nov 2026
 14:04:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-9-toddfreed@meta.com> <179471270271.2199510.4403404984222798506@kernel.org>
In-Reply-To: <179471270271.2199510.4403404984222798506@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 17 Nov 2026 14:04:09 -0800
X-Gm-Features: Aa3M54r8wXLJNYnHzeKDYLuWuEkGFgDFBdsvsZ-D9Jbgov-qnF9vSIAxOghmZf8
Message-ID: <CADh2yMyL_SSJqD4=H4zkzmUCJCL4OwxeY+iPq5FQrBZyCb8+tg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 08/15] psp: only give time-wait sockets of psp
 connections a validator
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
X-Authority-Analysis: v=2.4 cv=Ts5zFzXh c=1 sm=1 tr=0 ts=6afccf67 cx=c_pps
 a=I6ewnrIBtnKHmb6SxpX7Vg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=kH2YsCX8xyqK-3fOXDQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=MqNruPmfsT8GavliLQMe:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfXxHPkOaxVIrrm
 Vi2lBBAA6vTQl17vAZ8zTHV5U2Kw3ZodE22K2GYO8IFZogc7FckaIC62wxZXzt9Nn6AaXvkHShx
 xaevoCmR9DybIjN+KFDpmg692fqHCax0QdUQax+dIlpY3smrtd5mHPKrbZrnkuUd1XeljcuLssU
 jE0ZscG2xF3eZ3M8m/3vzCjdSQHQyBiAMcdFNkueCNYeKhRghCLDAEYJ1jQDqFpPfx36n2YKXRw
 jpcWg3xLXSnm2fRbfvXs4JoePggrCl+w0Qv8uzKzbW3N5cWth5EJXRVVaEUW58IrSLMoEaPJxyC
 GajBphIRSAgK42s0fjhAoQCjHhv3MqqioLrSfbgVaa0swcY36D/55KV+eK9Lq+lK4IFR2aSxD0z
 RIR8UwOrB5yz6bvhi/bIOUWRkuLSy0Uf1VvqKzMwOogGq6IC2BqZgeHDGQbbDwsnGEsc53CTGlg
 Z1SHwFC6BLTI3Ib7sUw==
X-Proofpoint-ORIG-GUID: PQMFhsIKY--xJFlx_atuyHqWMY3oGpxe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4NyBTYWx0ZWRfXypA7sKBvNwi0
 Tq286k9nO/n70oYsGL/9biqCkgZxLpk0noYk9kCiVH3opQ6POi6v7kl9bPIghsKgu1UV0hxIuPg
 pn08FPTYHRk/Qt8HMuxCiMfZ36Y3WgU=
X-Proofpoint-GUID: PQMFhsIKY--xJFlx_atuyHqWMY3oGpxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01

> [Severity: High]
> Should this also check pas->tx.spi? As written, an Rx-only association
> (pas->tx.spi == 0) also gets the validator here.

This patch has been re-posted to net, as patch 3 in the series "net: don't
redirect decrypted skbs to ingress, psp time-wait validator".

It is now checking pas->tx.spi, as suggested here.

-Todd
