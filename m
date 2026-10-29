Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273906;
	b=TeXVipzo2+l9NINks5oUHu9o+wdXR89bY1NaRVKrpa2Tnl282rfFGjLf3MlSyuHeDbDt
	 48bab7CyKuje/UztNNa9ycnZYIlqVSx9ePxLwXpxcbwTdiqwZf4qWY4ItHRRwyMxB7K1x
	 lfYFfJt3oFOsmgDGLVLBdY1DR6Str5hzdQZnsEnDO9lLKHxQWzKCYCA/FCK1R0JIi5GGX
	 o4iVXQCn+tQPoOGdacnjezaXQ5nnnj4trW3P0E36hm6mB2he/Jy+8IXL2gCyOEJNtbJtP
	 LWyDZ6bFFuhfrebzYIp45chLDeV0F/idF1zyB7kBHO2h4tset0auwKpM56Dq4ZeKy5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
	b=hJzC73LQP+4Xp9caSkTZml7+P6xVf+gkTHKZv9/C4EiZ7VIxHtAZL3t+ugf0YFHcjIpM
	 wlbcgVmgxKoyNIrGniksd7in/z/wGX9oaq86wiAc6hpESYtoZ4wkudwlaJAxrOCGsL/2I
	 2dFR0d5ctIR9diO4s754UoQJ7hW7y734pnu2D0TvJGmn/S1T9v1ChFaUC/njChhu5SeZ6
	 X9JxzjdF+D//841QAE4PFa48bmW39swuBiZdLg65axMPiwsDFUVeajCPdEzUvlv5kQDMq
	 enejmNjnN+ohjB4sT521Mf5QEEOQn/ARnDZ/8PoiclpOOKxkgwmDkT9V8mSV4ZTAduQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE56606A31E
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE56606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5ewi8Si;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ButymcXZ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vAf12273159
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+gMCI5zJ/0ncCjFjxtCwKE+
	NZWsbIHy4vH2hFbUCDM=; b=D5ewi8Si/yyUEb4CJLgr2xpoJW6pK614WmguzPBw
	J5FlTgxUj9XZAh+NE9KOm3uJhnohYq0oODVnzC0zXuWRlnWGEa0EpKshXqVexq/V
	YeIqos3s4ctK6PgTrZ6nDAyJaIyWu7IfJZ/H5eVqFhw8q/upJZft8UhNmy5g4gYs
	5v8oEy86bTKoZ6WTVHwQUa4cduU9NSj2a4xh3DaIcSJ5A2gq/4mbwNdYKh7xEi5s
	DKBN7/aB+9Nu0ERYvB0Gej2xy2JSoBHcXD0V+8L2FOtcQj8jg7gAI142AY7+jX4L
	45TLVh2VKZ9QfCGDALDlCzP6GcXAKCzO+bqGPqH3BCm1Ew==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0kvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 11:38:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4286221eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273904; cv=none;
        d=google.com; s=arc-20260327;
        b=Qz7NWoifYCEvB7/Fe2B25lBO9a9rfwn27LG9Ln0SulzG/TZS9RZLHKgeqs6KTEGtzD
         P8/+HQ3x+RCKEmQoC9TgI0yY3p/Tr1qU6yGIpuxt68YPk4O20JWX5NqpTVbVmIUP1Dhj
         SmkC8TcjmZgYvoH3W/6v8XJLzZVugtAeRY5Rxekhtkdz9H/gemZBFzpEAC30yLTl03sl
         LpaRusjvgLkoyGXq4M5xxzvv5Ne8JHBIbgAn3+sa1/QDYY5DP28633/lUPG/U/CzxoKK
         5UT6SiL3K/tUpW346CozszNFk2Q0V4QCmCJR34TSrXCFFRGKaE0sJvwRL2sKbYS0t1RL
         l9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        fh=6irWhFa5zlMcGNZc8H0EkvqyiTlwZ9iATm90xMXbVfc=;
        b=s1xSgsQPz/Qep0sOHQAHizDoeClpUt2Fj3fTiIWA4TcW3ZGqYuBNTT1/WXqO+UNx18
         mKcUdKkYVMjj1e9eyIgOG9oDP9RZQ28rT4wiKT2MH1NC9cUQHJIX+H6YMuumkV5BbbS5
         dSqmWwj/q2MorM/zgIxiApH/zrvzs0q3B4WEwTKu8wEHYvUFew2khnpPeMLmqPy45SMn
         Ic99SsdIxGjTdoYscLvTvTxzvffNliAVgmYhcbijMFY2gNlrnhiTUOmoxYH4/VJU1NVT
         7E4M5eqRUOTa1tZV94OJeaVyTlX78bhkgKyg9wT2IN8tvdEGSzUv05DqdBWdYIexCDGb
         1/Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793273904; x=1793878704; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=ButymcXZfc0Waii9DJ0T72l6Uvi/Zrzco27bvXxYF9jTsh9AYzmGH6HwTZ0sov38Uf
         aStY4Py+kaowk1I5SZUme7PVp7X6OZEHCG/L/8QcFF+YHrMpdbYF3NJwDau/uwcoX2a2
         ToOkgaXgM8eIpVjlvKRpRhyu7GEQ4GnkdYyQtmOwdzZavjJ+uk47K7vpYpdJWFieE3tD
         EM+W1arS2GQ60K8qYWJm+l/z1KzWIqKoaDKEW3f1+3Xkb1BwWTS1r/qlkN5WiX802hxc
         OJTGUtQ+XoBGWC6TAkt0IbIdmeud+Bw68m+BQ13lDMLX8urlhHmsVAl9gOr1qagk0mRz
         FeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273904; x=1793878704;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+gMCI5zJ/0ncCjFjxtCwKE+NZWsbIHy4vH2hFbUCDM=;
        b=amBzVhdUAXkE+K/ielbdAMHWj87QotmGQ3pyt5E8peyKupxS1MaqAM8b1wGG8POYE/
         3ssENixl7QcUh+oiDTdbmgF9Ebx/iBj8a4cG2vzlcsbXULqV27KYm5noA7i4qxhg+h7E
         L3TVI8xcETKnFOdmEqY02zrZsorJq2Tbs6yXeZsVwqpdoCzaC8Xe4gGS/hD7/o4nWBkO
         CmpnyA7MKfrtnGy8rVO+CRF8F8ZP855ccQvDjTpoXDXsJGZ/jmtiNjijJ7UuLOHI+zvZ
         7ohVi1ttFKNDHFvbrTrQKC8sp8b2YujmxyPp7QzQqM1lXvMwKiJhc2zvYRIkr9FujYi3
         r30A==
X-Forwarded-Encrypted: i=1; AKwUvBwc1MYZ4VpohLcnFq47a2GqJvRnP/OHcsYDuL+SqppS8LUWqO/ov/FEoKnH7nKx2u750g08emZDTg24fFyGxTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtG7sDdZdLsW+byZwTQPQMA8vtdFb+G8SfsjgNZ4Kt2U99L5jV
	vkD73BKBKZLBK0vnOqVxQmoLXJyu4rSekdaKqs00g0X9tqY4RBm7dAIx922utT3dCPmmFJ2BmuP
	TvRycKd5gjJ7fOtHKXK6P9y14AZnwXrR7/+zVTVT7JvoA0s8uE3imWfBPQYJXzmIKPo58YFqsHs
	Vc9K54avSZwRuOl4+EtUxFXFNNAcQjN1k9ipi9JkMsfqFXpg==
X-Gm-Gg: AYBFou36x7Iad2UUgSqJByT90sVKcFArcOdgBmVzBSDuAQaaK5wr/ZUO+fePkDiU/3X
	wRLedr5vGh361z9f6Xrs8gaPgdiFa1Mlwy0ilIyIXsEblRs5pZiVSDSe3QcC5kyEE1TqU172jiw
	hj+cVAzj83MKBJMveejh37AFVxEFB12VEaDz+ZdiWfYYB3Mpeo0yoFhRPzww==
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id 5a478bee46e88-36a20440ab1mr6660872eec.30.1793273904009;
        Thu, 29 Oct 2026 04:38:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1888:b0:369:e930:6bc4 with SMTP id
 5a478bee46e88-36a20440ab1mr6660831eec.30.1793273903447; Thu, 29 Oct 2026
 04:38:23 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:08:11 +0530
X-Gm-Features: AclHuK9mkpiY9HLm48B-7iSzfqzEzMPXUUWrIwq3MFK1djLB6MzLTJk2GLxddQQ
Message-ID: <CA+Ht8=YtrKJxr7YLO2z1389NPDnws8hSppAzVnYYJp5K1duvOw@mail.gmail.com>
Subject: Re: [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
        yuanzhu@bytedance.com, yang.yicong@picoheart.com,
        yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX3mRQbXZolc28
 654DIMlMVcFbKWAApg0dhosE8cIuEO+niW65xxhBBW/VD61A7AboeiP305miiR58Vp4Gcs+XVey
 fPt/a3ZJemi1HMHvo7t2MiYOy+nlJG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfXz7Ercyrgvsea
 0yvIp892qozhfR/DfnO7Tg5B15ycRUliDJC7/TQV7IrwLJiSZXXzDcoTjl9kCUScGHdHWZViCKm
 AebX7OvPtJGBrKoGb/Wm7h9DscV29NPqhWBP41/BMsJ/cXBe9D2DbYiX9m2WxiEEv5Oy7pecE6M
 Ho8tQPxMNQ4b13biD61Qk3Mn3usVGHl8ScW8cluogURi7ylEVm9IKYXyI2adVN517PL7XudiS+t
 qmX9+OjCkz5BxPODGAQFGO5kRNKe6g4AhrimT7SbEsSpQYj2sc0YVckv8jM2JEqgxOCEQUFQDQf
 ZteIp5aAYGbeuQNZ7WRJAmfDmBePhwSfk+wekrYMkckrUk9UZRZRGLc+Q8nKcp8UnTLU0Fjplim
 Kryw03yQXVKViMEJXmszlCzOTWqaOiQpctf5+HRHANIqlKdRXsO/28by2LhlAMA4T6HVc7EYiux
 Yr6GXDfXac0crB320Qw==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae33030 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ojhntA04eiNvkV59mfQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KFL7qq-GkYuqu5k8jr2UKcUaB_c9WdL4
X-Proofpoint-ORIG-GUID: KFL7qq-GkYuqu5k8jr2UKcUaB_c9WdL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290045

Hi Zhanpeng,

> [PATCH v12 00/11] riscv: add SBI Supervisor Software Events support

I See only 8 patches out of 11.

Regards
Himanshu
