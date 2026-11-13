Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794596939;
	b=TJKARMmisWAgog/h/48plI8NYxetNy8xwTXAljxtpBzRyQnvlSwbxhspgA7wnjFg/1aG
	 5mclRL/BONuz6WgIFVH59Ppjo2xxNpyk0/KM6cl/wuAsCJfeBhc+5AbXrNbN6q55+BZxY
	 +I81eYFwDLz4AsAVe7gVTGgUonY3EFEKBTEVdPccUPn7OqprS+oJsAAmb4lWQOgjlwp0K
	 hzGmEjybVitezMglABUC/Jia0Tcx67ZiTFIu/rw9gSm8Uxnc61rFzzAnwbHLm2nAb+orP
	 jJuAe5twTQVk1IrcZGbxX/0A+1XZrpkuKoyYSmFRr2Y1LF3+MlMjTcacQQZv7yR6qrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596939;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
	b=rJE3g52rszgq73rvaWTez57xdbLpNzqW44OS+4PAiJeOYC5htcknnpktPlTFI+Y/Gsgv
	 VAZFq5XKLyjA1BYNLcx8ihpWZCBF6WxipR1Ns7DQ6i7PmK9Kcyo2qzFqlteATdudSwVY8
	 3K/5fuYYSqzKzyveZXXF1dDnQYp8/zE9nIiHa75BfaoEyghmmOeF33WI8he7TmY+zk9B7
	 DoMB+pUOw5mTr1y+zyWAalPgH+kHg3Y+ke5Gsg54NKx/FlEiiT5tQteQXj46OsmmQiStR
	 8vlrXzYcZczvTZayIo0PzDRAJ+sUxZmBXuFYVZSPbjvl88cfGrgOLBtycGPXBqII1XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F78606A334
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F78606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=nOONlcMC
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADIwt8Q2476624
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=wMGf9TKkw2d
	AolbYMMRxX3h85UEtf4o2yarI4oY4daU=; b=nOONlcMC8i4eL5z9MdkEXEZlwOx
	Vrvx+jYuO0AU7xRzGRrS3LpEi73YXmUwnlC/dOM+wJ1ODaYOk7bl6zGXh9sfmJfw
	MKNO6Sg6FOBmO6fyVJijB2yweyStubRKYP+YC5sRD+08HFJSgTDbMn2V2e8elqHY
	cir6/wisuzYvGcarXU8Wim98GEnpbLytImhbK0UaDptgWMMAdVa2EzVnCL0Fdt4P
	C8CwU6njpzc16OA1dki1A/QVsYaa2fr1OOoMTrn0yofhzM7HL6RF2Wow7f2tRuaJ
	2PYNcqU0vefF9VfhQZZYt3fhB3NxmITWzERS0MJE8hSc3pgEiPS+lD+uMlQ==
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hwj8cg70b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd70so9427195e9.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 11:08:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794596937; cv=none;
        d=google.com; s=arc-20260327;
        b=ql6RPB6XpU4E2ezm66ujYgfOKS4aLHt5OGI4QYMPVgQVADCgNRS+tdYCxgK9jfPw7M
         brvXqJt7Gi/JBO8fM8D3Qgq6prZUB+v6zehZhKEYQKG1fq+Istffbcmp5cNAh3c4eaYa
         KdYr9nd2zRdn0MK8qHJUyhXdNB6/nWvEP8IcHlJbChgAGAdnO3pQgt7xp6fxIJKc9m8i
         j4d3muTOFwQM+PkPK0dKy7kBth+Rmo8u7yNv4AcSsbeitykqgOIggJj+mcgzR6fa5Tvj
         A346H7bSeIrDePJvvSSqNeBp+TqclhD+t587/lqtUVGv6vLHiYbQ8jBoxb7/HrV0yuXy
         V67w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        fh=CSTm/6CBbVt6pdu8AoX3a5Q5eCxh28FPbvEHl007Egk=;
        b=YZjmXoDkmhn+2vnxFHeAQalCnDsb4i4ZYstbOStG4rovMOgyKzG+e921gF8ifMzwzc
         SFqikN196Ttx0nIV8r8Mb7fBT6Fx8x6uE/MnIkcnQMgMFskn9F8r3gACzHIgs2kEDqFX
         0ooGRIe9VkX+gKjvKC+8Sw2jx0ZdBSrI16kbFFEyYWz+c1vA5K6doEuoXz39sdlQc63E
         xbmAgSwc5H4QmsEi25zRRYqZ8qYefHljsamsrHRqI4pXq6fPnd3N6kerUrIKImsPgDgt
         NdDr+f9YopTPdoweDX9dgW8ITs443DEDfzVd1J3uDbQtfuaY6nYSYpFlLz/A6aAqPY7k
         1WnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596937; x=1795201737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMGf9TKkw2dAolbYMMRxX3h85UEtf4o2yarI4oY4daU=;
        b=S0wuTPF+o4ZrTlLGW5SXhmJMTiP45j5LKAf58FpsOs9mAv/O7Go5SUE5j+jTs6+zTN
         /g11kthw5fDK7GaDN/gJtwBqYgFEX2Qs+ncFZmdPtfJsUOX/mO5F3hy8wuKaXht7qS8w
         zPXw5QP8YsQSzmPIc4tZUzswjP4jhgFMJ5xm5jtg5WK6wtD6eeiUoY2hZEv8yQBYMeG4
         AzcbuN9NsvtC4J2USGjsrEUUS8Zp3DeY4HSwleuuVI1m8TCZJwfCubtxBVqGc/VbP41L
         jdQPqeV2dPY/Zl/0x6YJfs6ECfWWEjuGtOdFFUhzzsQ8buhmEEmiYZ6lQZou1A2g24pa
         +YSA==
X-Forwarded-Encrypted: i=1; AL+hErG2B5gsrrSNSbR51PMKHdgpyIxj3FIQ6F1vmYwM2DCK2iDH0FGv+pZrIbNakpgIAlR/GrhH23j9ssQwNSW2IWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MhLDsiw+i+105e9VPHe1FDgUxwofXed7khPeoCUIzSokwIzWX
	EiYDRIdjjjiVvGHmyoR1VfVTESQmss+OF/i2irE+gm7znFmtsXWmNX81M2KbXd9UKy4h2Qr5vTk
	zAFY7/9kuTl7ASk/14dIDgkRaeHVTbUI2C08GYHwdD2UBl8AyNwhg3L6MwSeG9AL/ODoqXWXiuM
	/B1M/sydvAhiWPEfTvaslkRprNvHhwEtApEHT3umofIQQ=
X-Gm-Gg: AYBFou0FZy5hquRiQikpA4lGf2TaLVemJsfjSwaNoJWWo7TDDJMW5eOrmKg7NSrKkO7
	okyB5/bEqLCAlPcjFQq5jLwhQnBYx74xzJFl0/Qyxn71iwVUDX7I41yJCAwwWzkeHL6EvGRtKoA
	kWvA2yNvzro13v4BVX6IinIZud/5nhmdqS0Gok45PRnh7Vcz+ChvVmQodhKkuc424oppHe/Fsjb
	fyg7QJFiwJhR4UT7+mNEXxDPAG/K3BFvFYy3kSTH/vSfDFG2oU=
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id 5b1f17b1804b1-4bb5f071385mr25701325e9.21.1794596937156;
        Fri, 13 Nov 2026 11:08:57 -0800 (PST)
X-Received: by 2002:a05:600c:c172:b0:4bb:5f07:10d3 with SMTP id
 5b1f17b1804b1-4bb5f071385mr25700845e9.21.1794596936812; Fri, 13 Nov 2026
 11:08:56 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <CAM0EoMnPM54re5-WKyWgwyoz0cn1uGT6=E96OBG2-4m7M+kx7g@mail.gmail.com>
 <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
In-Reply-To: <CAM0EoMmrRrmPdXPKyiQgEHQSb=mq3uYfNc69hEKw+Rw1EQAzmw@mail.gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 13 Nov 2026 11:08:44 -0800
X-Gm-Features: AclHuK-U0ThzUJNaBNSfjppeRsNnyfVDY_cTKL9afgrilY3k6R5ZNeb33jtLtAI
Message-ID: <CADh2yMyJ7Fgtv2BAyNpKFkBC6YRC=Z7kOHSiBcH6kTqcriWL4A@mail.gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less associations
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Daniel Zahka <daniel.zahka@gmail.com>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXwPv92sDsZv48
 hFQnH8+6EB1wd3083Eh4zQN/lRLANFNAcZL3X2MO4AEKXPv+KdpwjprEMmveU2LU3ga1d+1xL8d
 J7M0j3qUakq+HoXsemiAyxQ2DHyCTruXgDw2RrxppUXbyCS2mn23a57VKElwy0ytxJqAFOZEygD
 HMMxFkI6nNpqHQsR+VOdvmOrQA4uOyX52Ea2j8uCcVffNwaKzZ6a+G5m8y1Jyc4S6hcevsQdoTG
 jERc9XTKYfgwdhpmFFeocliI3bFvgZpJ1HA5lR1cYdgYyLtTGF66c1hGu0wHbGHepz5Zp1mdzIG
 A1uQNUUAYK/oE1Gkw7kEe4hHiu1mhUEbESe34KJ8Y0S04OiY7Gpdfojy1cCr4j0IKCYnkH3zflf
 rNdVuO6c6JjmoSf0fp49eWS8/Tx7qnsklVP/H7FAl2NQNXCU4fQoWzP9+UnS8oVxl21H0MH01KV
 KX1S+1T28VKAfty0afA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfX/UvXicXolvYp
 +U7qu+N7nhBqASBCSwlGJNBITAu7PRJZ2z1SsOixBL3U05Ccn6yurz2zkdWZkKTH9RaSVfkMMcd
 GJN8dT0ojXz49Gyzzhkm9HYxzTE0suA=
X-Authority-Analysis: v=2.4 cv=DuvDa2/+ c=1 sm=1 tr=0 ts=6af7604a cx=c_pps
 a=Q4jRaax7EcWM5fECTC1wcQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=c92rfblmAAAA:8 a=VabnemYjAAAA:8 a=V8I_lJ-4SMfPdcaXHV4A:9 a=QEXdDO2ut3YA:10
 a=nJq5_VNI1X7IEIKzvdHs:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: Rdlh_HSYQm1ACdAv2uF_Qu47BNu93eU2
X-Proofpoint-ORIG-GUID: Rdlh_HSYQm1ACdAv2uF_Qu47BNu93eU2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01

> My bad - only one of the sashikos (gemini) responded. I suggest you
> wait for the second one. I think it watches this gemini sashiko and
> tries to come up with more clever findings.

Ok, I will wait for that before posting v2. What is the best way to know
if that has happened? This posting is from 3 days ago so I would have
expected all the sashiko reviews to be complete by now. Let me know
if I should adjust my expectation.

I think this is the right place to look

https://sashiko.dev/#/patchset/20261111005533.6436-1-toddfreed%40meta.com

-Todd
