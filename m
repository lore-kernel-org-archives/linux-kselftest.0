Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351296;
	b=A6np793J3YHLrMThFZHpa6dktJAJVWQ3lF0Ki3bW94p2c6q0iNBf+KCh+UzS224xdx+I
	 mCdNx9wII7kp1He8JMMOBp65zXtrNnMsXwai3FVtzcHwEgUrSA7eC0fYS3d8dTXfrBHMI
	 bT/G2ozXZ64EK+MRfZ2p4lmuHO51ACbriojjWiLyC79iG5vcpJ/z5Ox36tvAB0EU1ixxT
	 ZPDDrx3f8QRzFD9AImQ8tUyNMWmbsyvfwJk2GSg6cYKfM1FlXj4BxkxAnh7oly/fhBC7c
	 nfu8Y7MJr5tTL4SYbTWwuKR8rMYxpxYzNN5Ag+/TH2GrO9e6eNTogvPnp9dnXthnf+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
	b=yqW5uJPGUug1KTQ2In8MY/ule19H+nM3KPvq1ySJSR7RaueVmvlUIvL9J3D+XRzDP1xZ
	 QjNbfG8Gnkm1RL4gcg0iaosoPvEJb8jFqK72Emi+mIOzQiTagzBhAiGCBRomk9l0ju2zD
	 tgW34R7b0thLb+rSGY0MGzGRZ6U6oRhSAzkEnuwCdFU/cLHTOgiqNrE3yrBPF0OjeGXKY
	 uTxgjqTq35jccaouirBz73rEhvRM05dBS2tfrkpNyv8dOo/tY/8vAs/6HcEsiL5eH2gAQ
	 xywsmvWlGYOoXQ+ZwsaQx/azn90Xqo+eTjRNm/66vK5QME4jWU5iZzVyweWwL05RscQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrxmNSFp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJd6il8e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F2C606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 09:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F2C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NrxmNSFp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJd6il8e
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8Esxu3737729
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 09:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=; b=NrxmNSFp/6jYfrCQ
	W0SKdq0iENifrZ2kakeGMvw1r30bn2bhEUUQwcaZi2jMaXyRSn2KEeBlWXiMzxjg
	CMBUhqWeBJ7gWH4j57WlubsDcFq+euiYsN83xvZtB5sfGl2ybVJ97dTI4b6jz17k
	da8FVh3pzXFrhHJetTbyhyJS35azfqh+f6zDSnZEncEDEqZAn2vEmgz0PIMLDruB
	kKNaA9zygzwnNHXBm0A5EUVxACQUGDOCfxCjVfqUmpPgYFUFsLxGVKbSdoJ+wOnY
	cuwurmhTmVRUKG/+dcf/OF/kEdXmRSFxZZoBAv72JcBVCxd45lRF8JsxhA7ManHb
	Absefw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme7523h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 09:08:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91785bd637bso18095896d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793351294; x=1793956094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=aJd6il8e6NzT11JJtFCQWc20+yhRPE8TcTdJsdVw9st9l0ek1hSCJt44f4j4vpoNcg
         U4u5ua+4PSXh62m9j7d7i9NRLP2DomR0mzlDaCfeMGu7SXNXqmKv88LDMvhBPFOs/wQP
         Vwue2g0M5gNfcuRWxANpYKYEpyTuqPo2V/NSia6CZ9w3cIratQDkR3jdPbbIl4i898vF
         d1nOqN8kSGj0GZ5o8HcRdE0LcE1fpbQ8BZW0d+Un0dz/uENw3fYFztrCvaBxVoEjGkQx
         JAjxhufc5tswuYAGNulyStMzhUkp1hin2KcnFjLZnQ9MUO/8bgl0EBTindkNXyJhUyg1
         HedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351294; x=1793956094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1m4Wpp1H40EG28ghxN4iiP4fGlSbQfXytaT04yu47n0=;
        b=oK4c9S/ADKPDFFVa+rpMC3i28/rH4gOUAGPu+laOsj+AFv6VBU36BkcjqvS43MeP0p
         TV9ELnu//Q+JyatAnzZw9tciXVW2wrVwXAVJvwYZmyz8dIkc393xavtqRGI3at/ESwwG
         YWOnwvsGXtWV/LnG05htxo5Ykrj3w324eJTkXGHRA85PUtEdwWw2UEczB1jcwIO3r3dL
         ygyJZhkszjxDmhfdlc5YwpPXsFUu91vC52XRB/I465LnFRiWywowwiejnjd6Yj+xrfvq
         haalKluryWmiyx9l+B84ADVykmBu+A5cKih3YFKbIPL2InJNAMYCCeZO5/PItXWghcjS
         lghQ==
X-Forwarded-Encrypted: i=1; AKwUvBxosoa43RVXgq7d6UBPKUTDXZa1kF7j/odgsGq2ItJiQRWKbp950CfsWkwv6Bq2VN6VOFbnKgH4/qViX0hTQGc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+fyxWRlIG8GaqU4XQDsMQPG4a72fNTC8JFnckuf0p+fYqoeLL
	MH7W6YnvwdKjg843l7kY1vJSvIRAvYyrvU2WdPPkQuHsmhafkd/QK2qGJHR0h8BBGlETpqyq0SI
	fnpDb+DgVT7LjqRA8EJBgkRdK/0DfSZUkwn3S/32MosAjsieR9100MJYeDagUOMIq2lVitls=
X-Gm-Gg: AYBFou21Ewny+E5Dgpt5FMymmWla4GOXWydIpUydoYkbHKOKtDvUX2/f/2u6P1ZbFdV
	BYPIAMaLHbONfy8eMNRDSVYT8ptIQJkRmkSwMTg48Sw4PvcgxJn2p3UDXgx1MKrAoXPVFiL3OZ8
	XKit1TlGxYvAvBbgrwLVNkoZkHYfI4myOHg1ZRKKUoCZWRitVmu5gD4GnJjs1aIHGjOd5rOjR7A
	HtSfnd7bF+ZhRU4Bn3yCvFwlNPSIm8ueQ0o0PtAqcl9YPBnDiMvP//0esmNC/ry5YipUKSyJeK6
	1t96Y5M/IaaPUuiFYXv3lFoBewcwv7Qv5MPmf54swrf7LSiiAI5LOvHp2thmGYqM56aLrBQVLVy
	5QG6exaMs+jF2Ad/RqddYWPGBpRZJ45pqCLQziSH+d2bshADuyKMExNZD+CTDn+UZQ+3cmTHdWT
	LQNRSXzmREC9tJq0pRc45Rr9i/SOjOaynk6TE=
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277396085a.46.1793351294032;
        Fri, 30 Oct 2026 02:08:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr277392185a.46.1793351293464;
        Fri, 30 Oct 2026 02:08:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm1958499f8f.25.2026.10.30.02.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 02:08:12 -0700 (PDT)
Message-ID: <62826ebf-d5cb-4a94-942f-76afa97b3e09@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:08:12 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] powercap: Add generic hierarchy support and
 convert DTPM
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6aXc5ZzJhI5JCJulOh_G6Ca3OvrHKJ4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX79OvfZ3STi9c
 IIMMpRWLpsB8ePyFu1f5L7pFBMW6Gpgy3St6U0P8uGxfXyTH3eV6J5HWPRSq/q8bV6Mq70KA4eM
 IyE0gv6ufD/SKDc+PZs0xxQ0+/aWy7fSxeogiZZs+GIVdLF9T1doxK3jmFCQkLxNv7Kq9fnvZcO
 oEPeBNJWag9i4aDExkek1sCCaUu89L8irRGL2n7Zenvkzfv43wrGxTUTVuwFeLs4Q6vSneiIGKi
 hhNS7a00U+qcL/sKexxlNql/qRdg8GzuXBXo61WdTb/UralS6aQl9WstTFY2PjW2aOZlVBQOhUE
 Ziw1LJYzF2sN4WdEeybor3rt3o4u0AY4yV2UQJaZZ9F6Gn7LziABDKA2iibOsl7tE2b9T4fgjsS
 Wgj4ovS90Tbe7+D8ZUH1Vb03m9Y5g8Cj/UtzxCj8MDBmem7NMpdKbCWxtBXrbObsOAGZXlKaIcY
 /vyNmJkgz1jSuAkp+fA==
X-Proofpoint-ORIG-GUID: 6aXc5ZzJhI5JCJulOh_G6Ca3OvrHKJ4D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNiBTYWx0ZWRfX14hzIfyZRdd1
 7u/TVH3jSzi9Upgcb7vXjP+pbSFbt7Y/x3tVkZrJXTHdsRJL1dcQrjdv/GaA07Ej9aDZhROrIz9
 /UZZfJbgn3fei/P6WlqF1/WPyoNTfVY=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae45e7f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=h4SK1RYChiWzJ0aczLUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300036


Hi,

On 10/29/26 17:56, Daniel Lezcano wrote:

[ ... ]

> Changes in v4 (since v3):
> - Rebase on v7.3.
> - Address the selftest issues reported by Sashiko:
>    - Add a kselftest config fragment requesting CONFIG_POWERCAP,
>      CONFIG_MODULES and CONFIG_MODULE_UNLOAD, guard the module build with
>      CONFIG_POWERCAP, and skip building when prerequisites or Module.symvers
>      are missing instead of failing at modpost.
>    - Resolve the kernel output directory and pass absolute O=,
>      KBUILD_OUTPUT and module-output paths to Kbuild so cleanup works when
>      a relative O= is inherited from the parent selftest make invocation.
>    - Keep the statically initialized mutex in permanent module data so its
>      lockdep key does not point into freed module init memory. Retain a
>      separate init-only description for the hierarchy duplication test.
>    - Return KSFT_SKIP when powercap sysfs support or the test module is
>      unavailable, while retaining failures for actual module-load errors.


Just a heads up to say the series passed sashiko

Thanks

   -- Daniel

