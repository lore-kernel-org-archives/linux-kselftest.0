Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794511311;
	b=3MmaY2aZELu+9RL3ldIqE/sVvbKJIgp8gK64fmtF6WGUHYue4cgxmBnk7JTU4zgRelCa
	 4BwTPBpaCWTtaWxySKk3OBQqQZ0hgO0qhi1+r6ku87EUhVA21wlXHLTzCyBl+MuT95qCL
	 Xhoti2IysWi5tBPTjsXccFs1Dy8mc7sZP+0qSlWGwqZAeam/A6AdjAxrQGCt0pYwbhoi0
	 Zn3kMpO7FCvgIf/zZ5gK0M1oEmd6Rbsyo7b/AMuXs38KpPWzBYFuTDmnGTOvjVH+BVayK
	 ctW/7MZPCO5bryII7CeO2wMKa+JVGutbNcZPEoNkJ3/nEAz+MguQX6CRF8RAVP4Rw7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511311;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=NobLKQRfF1/w6GaXuludL/mp9U2ThflRSTiE/WAKENs=;
	b=Fjr8FUa8B2VyHrGMrc4yaahAKJWP+ZVS/rtpf4odG+JojDCSq8bPlI4oSwe8yxMh6Mef
	 p+RAAvhJ7LjtnGmvI4IHh6ev71v0fycc9ix9bLmIs8/0nnuU0yFhALETKrT5r+GwKVdav
	 uHyrcNX2YjW1HvW1rYLz2B7u9xKcv095BSRreMub5dpAnpwmBL2Rpbz19AopiohaXSj/H
	 8EZUun8KM/YddhX6oOBjie4hcvLgu/unuTTx+E6M1Q3Zc1CfSCpGduD5lPovB5M43tgD0
	 hs2Q65nxwXDUcvOMHXoScSZclAMbJe7jJeh/kxsphGR4G5awdmCYVdtc7Llmhgl54/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=iPMfg8G2;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AB6606A321
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 19:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=iPMfg8G2
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFai9e3764456
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:21:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=NobLKQRfF1/
	w6GaXuludL/mp9U2ThflRSTiE/WAKENs=; b=iPMfg8G2incL/QIalxtaalgsf+L
	gVeP8knU+DIk12TSbJ/Kv4xCSOEbPXwJAkn1oTLrqHlVDI/d9SNfr16HMTQbeRl1
	DeoHNGzbhD4VDRC9/JW/omfqz5rppZsXSZm36AG52Ae9FZtvhWuU1ORgZzj2Lxy+
	MZ2VIFTOzBis93SfJsrhOEdW8bZPA/1asfv0q92elyCiOGLS4lZ8LHRsnvzsbbVh
	P7bcYopkNS/Y871e6NFmPPGZ/xkxTv57MIJA4sb0b2vr8bSe4tfA1F5AdATE/JaJ
	nH2D/kQ4A6E2Z7g03wXr8iz0vR2ecb7miSBpscjqcuBoiIaRmdhRFNwHuWA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hw101y245-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:21:49 -0800 (PST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so1156075ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 11:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794511309; cv=none;
        d=google.com; s=arc-20260327;
        b=eBcW37ZY13CMVYpF8gVhnpSNvvXO75pBgTTPkr3hiClXGr9LNMU+AkpH7New/+0bR5
         M6MjhTbWxvqUf+XHapQDdoZIZOP95o6pZvNMWRjQ2bgl+286iVxvvheZ3BoleiipdE5a
         45hq5chM3yRzTf63T3I0jdSdDnbev2WflBsbpOsmhAZxiMTa9370Bv/51QuyYdUk817N
         txcR5/q3QcrfeIkw25xTDygpSSxKMaknm2KjcdwZzgHKNsapEBwOHctB0ZV187anyC53
         edIl+/dtLTZ4dmV1R0XiR/Q2LAz2T575xb3FPJ5BwhsrU/XA2YMiH6t6aRxtapUfKGdj
         QpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=NobLKQRfF1/w6GaXuludL/mp9U2ThflRSTiE/WAKENs=;
        fh=13pRiPCEeoPxkHu7qLw/bYKFgmWXJ5O5he0AS/tPtO4=;
        b=ZBY3iDQSsM4MmktfmQrKQRbnTAW+4XXtqa4gZXl31l0RCpRHRp//1I4EPqrJs6ZFVH
         9mlvOurSTkau7LclJ61sBmaSLLr+mcIvmRdiOmMXSeU2wCfBSWYJVWjEdT38QfoaUOzO
         8S2d0lXFVbNAu+8oQ3booGc4v+XjxFoEqUookpBK6d018yIozMG3+vbsXu2tjuscjkiA
         WgeHK+BOEQEmxVN5dCUzhlsC8rB+HGfDEnQKwyHZ7qNvz1qd/v8pLRirLLwPaDKaseTN
         DlBWOzsyAkY3HesoMWYU+c71nu25MJsZWwTRCIxyhl5zomFavASAI+dHU5Rnko1QUdPB
         B5nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511309; x=1795116109;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NobLKQRfF1/w6GaXuludL/mp9U2ThflRSTiE/WAKENs=;
        b=0GrKzW+Fu9SXLj2IBi3Ru1HhTe1RD/MfCorPWn+l1Nwswxfni4i/T4dRc0y4/Cy+BC
         WwvWOEJqnCtzBwiZAv3DskymUo9WQxF6z1ahq+sFGdJxmtX85+S1hmuFwigPEjOAPRyN
         CUfV/ugXUb/lQjj+/5JY149lu58xL0+SN2LqE2DhH7vZnUEEMslnJ4HxcKYQWnJxQM4N
         gzzqT6DpvjxdABgD5N9wYKObQDdbb2uV7IjSYMeOELukgaQWPCUPrVM77aO+ISjOFWM0
         9jpye4OAHYC+HmQnAAysaKcaFYmRJtBBqhu2ce376QLAoh6rXjqcJRAj9KvsEgu0Psqt
         acjQ==
X-Forwarded-Encrypted: i=1; AL+hErH0GyLx6EbIv1B3Gx1TYrq+/Meg5U8nF0UC0/AbH4LnLe6/EMU/7Au03pYOf8bszQwkTu+mQ4WQ7ezL9t9oCYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87WSBVCUNqMhhWIu10pfpWVuX0KB0hbfAqtWYDnl4El7xe/onv
	iExyt10KQB6fB2f6bWDtYvkJCfvg8+aGkyjYgi8o5vTrrld5zItCJGfgsSU1Pzju6uz5nz7dFvq
	J7E1fgPKrOvsrKvPRqmSBwQ9U1oRxiE3xgFVVccCHvWYtJVdKLmFux1htGdLciarvF0+eoKlSTC
	gr8vU4fFgaz38xGL+1FuHLRQ3VST3ZUaRwzXCPO0CG9VM=
X-Gm-Gg: AYBFou00WWv7hiaqG6CSBZbusgO5tmH6wlZWKyJfJ1iWSOr6SVl039fYJHpc5YGY+eJ
	7gmsp0b3yaZ4RHQB23dV7Mcb7ZSgq3qpfXjCXONj83u4yXJD2IV8MRVQEbTya0hBRR69ihe6/eJ
	fInc2zY6RO/ZnJ/r5xZrZXjXP2YTMrdV6+g3clpgyHuwu6t90sE+tITmLKw+nXRbe7FDxNu8sZC
	0PEO7PvaspcxVuObobdzhw8d+FDn6NW
X-Received: by 2002:a17:902:e80f:b0:2e9:5714:6079 with SMTP id d9443c01a7336-2ee0dad1376mr3591945ad.31.1794511309234;
        Thu, 12 Nov 2026 11:21:49 -0800 (PST)
X-Received: by 2002:a17:902:e80f:b0:2e9:5714:6079 with SMTP id
 d9443c01a7336-2ee0dad1376mr3591695ad.31.1794511308726; Thu, 12 Nov 2026
 11:21:48 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112001512.3598626-1-toddfreed@meta.com> <20261112001512.3598626-4-toddfreed@meta.com>
 <20261111170617.5fbde961@phoenix.local>
In-Reply-To: <20261111170617.5fbde961@phoenix.local>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 12 Nov 2026 11:21:37 -0800
X-Gm-Features: AclHuK-SPUaxeYSukQ-IF3nQ6z6jzUiWezCswtghbmEdFTqs9aFH1JUEyxZc-og
Message-ID: <CADh2yMxurkRB7BW9=-HikSYuHoC1VDk-uU10nWNjg2=N7t1idA@mail.gmail.com>
Subject: Re: [PATCH iproute2-next 3/3] tc: flower: add matches psp_spi,
 psp_ver and psp_dev
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX/q/fiDlvcylm
 ocF++UEW6O83zrXWd9vshCYSCNf5UnGU7Q9yBl0SNccNKFYxnjRl2eE47EpRYWOjtR+EmFavDS9
 KjcmasVGeJrcj/GyouUPRiFU93CMX5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3NyBTYWx0ZWRfX65KV6K5cWONI
 2yCPIUYxXi3lvLpMhSVMTaMniuM1tv3Xfb3HaR+BT1bxX3gw3UnczgpidvndugQ2ZnNEksp2vob
 2gxyS9gg/YgeBQpGZgYT4TvN0d/SYVWlRLWYRuTnoL7NDIo3tbv+3g6Th3+FbrxOQFJexNmNdn9
 RVpr/eOxTVG6HEQTixjhINPJdyOCs1HD9ZvGZe1eWCirv8Y0ZEDmz7EGunZUTgBJySOt49ZRGbb
 IutN/W/qhKXJ7iBCLHxJ1fyC+G1rc86oGmMYwqtTHMI/nkDFa5NSMy7mJTFxqiaty+LBiyU0ykT
 7KsAkw/EnQeXcMjhSCJ9xJjrlLuHUQS7Dc4C/Arpau5oxFBFbVS3Wz36Mau8L+NXV9SzWYScyu2
 45fN/D3ELCffw82bMLFgWFS6govxxXDQXGTIXLigNEwR9rbsCZ/yvNXRlkSomMzy7gSVFjb2FYN
 thsxkydXQoJz/N0jcXA==
X-Proofpoint-ORIG-GUID: LxYYxuuJLXBcVtragYjRSjW7lGr33vnV
X-Authority-Analysis: v=2.4 cv=HaaB3SE8 c=1 sm=1 tr=0 ts=6af611cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=tpM8CJlwf7uhpglF1g9U:22
 a=8lLDZMqfsaXpQLmpzUkA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LxYYxuuJLXBcVtragYjRSjW7lGr33vnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01

> get_u8/get_u32 use base 0 for psp_ver and psp_dev, so "psp_ver 010" is
> octal.  The man page documents plain numbers; base 10 would match.
> Otherwise this one looks fine.

I will fix this

-Todd
