Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95EA2C21F0
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409585; cv=none; b=BamxVAoCi4JkE5ew5yoZOiEcG6rTlLkP8dSsrn4Agup5I2IYqkFVj654CA30z8zNAdlj3hKn5ZDhfIu2GsEGI6xuNanzNwHzfCuII/NzAxyNeYzyKYPJflpNEyhO3yGRhhUh53pzgR1ZJQ5dLNZ9HqgWibfs4/juLNXOS/03Dag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409585; c=relaxed/simple;
	bh=rl6KcnqMpVW6Q7+xYl9EPXTTLFC4yDUwL8yz3YPkz+k=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=swUZzOTKTRlK0HKoHDfLbUa5PCmJwbDv8rPEROFVOplxSgETxFN5wAwqrpGOPHeCe83sZn6YH5S/GRirufETil0K0J9IYv/wbhbv2dwhxyVkfsqQyBAk0CVfdy515dz/mfKDn0CuOLCed4M5y7IUiknmJ4JkW/452+3pGD/ICvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNOLWocu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMH1zCr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNOLWocu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMH1zCr7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAn7mI2393503
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=; b=LNOLWocu4MuP/OQS
	jEmTj2CrWERHrbNAoxG40KFmyvHUAOcfLnNxCom1H0yTtsdf80KJ2VaDllPUepaD
	+U+3YPNcwCVdFS9MueQzv+9d5Tl7RQAiqsSBaYjU7ZASqqdayNPCD++hK2RUlIzc
	zSa9VGUDZXHI8qh/SSKhGCoIoTfG5O6bn6+TIh1dpuzeQpPGLb42CJ9u7ki/tALm
	1FjXiL7fCCZGJr8E643gE/nahHPrSufOieECPTfSuKHI35rOAEDbpxUvuWKtKdyg
	UwnSJHMR6t5cfv5SbKZGVRRxyJJZxSDY/y3ySl2f/Q3bAjXZqdQlXjFEysvC0YdA
	+817tQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh5m8hb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:46:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so1182212285a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409581; x=1774014381; darn=vger.kernel.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=eMH1zCr7svwDcsnAmtIWVGLn2IfLzY/we2SMbLc76UFJi4Ea3X2InTJgxe13JE1d1p
         5HVyMxsdaKr1bvfEM+SCt6pEf0/8kahOspYNZpjbqji7IkZbBx6y/yi/YGUqprDHZEZO
         qAhwSgBvdNLNmWhFVmnP1lUD4WouOqrm8SeLdytbdVruhYbirTyf2eN31qf5DsnXE26B
         G8TirPTRhi2cwv3b4Fr4DTHcxFwvJyVBh3LM/X7d2b0ss/0NcjX6EISjqmkLHJLPanxH
         I6DwYIUsZjKKwyky1g20TjskvVIkVDuRzGkBtmleluu0pb6eb8EqHSKCP7Bz3AJosTH2
         SJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409581; x=1774014381;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mLbDE+kOcqFsp0jigp+z0q5mHCpcZBoNcL1PBze/Ux8=;
        b=KT4Sqj3roUDRDz87Z5N3OjnaBxdsIggVmIH00he/V9mhOTAkraU4GQFEhrsutG3ogE
         Vv+Sd9Gh1sxC5l2A08/D0L/Y6Q55cAZ2H4J3HlrFqGXJiCvfOe8q+2Sf6vsmAjl9bM+T
         fJjjjG3FuCzbcFBRrMK7UsyAbrb3unc3fFfB3I3cx/xOUsXtPCnMAP1GbYXFTrjLD8Ir
         K3nbF40Ff0r3VOPCtQc+q/x/3yTm6X3wEY/jEP2grTZWh4SUboWNmi/qJ0Wi5mhFTwx1
         h70KMkB0RdDkXxaHF1KrAy9ozS2TurfATLfipJg8WQ8p4nfY41tYIJ6vvw1yleJmWFPI
         irWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1eOY9MmBvFHYjXU7O7pyHhaHaM+GBkXpBvTinzlEd5qakLsNaJaR25zyHyd/ACc9XLTHFo9gbYKwBntdLEn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6xb6JTxbjs1TCp0vB+lVHBf8sUO4J7TfbuwLVop3rpxYArT+
	iVLXCM1+PYTyMvGHwDz55PBTOLC+iO3xfD0ZBHZW/Gl5dQIslNagSEDnRa/5WpzF7scl/vbLy70
	XCBlW7I0MuVZvOnMAlbywfOGS2CIS6r2OALBLg1qGHycB/u71pBotTy2QvlgUtXPng446Nfc=
X-Gm-Gg: ATEYQzxN7pOPZtuoz3SazXyANetbsz207e/vWbyDavLkuZzAaHrlvvzjZ4QCBKrCPQO
	hn9z9+M1EFvyFeQty6xtK+0FrQsk6LKRj7TnZgtFcqHFlxX+5WkE2Mwa9KAmAbZWVI5YTatqNBH
	oS2cOGO8S//lh0EFYZfC3IBnBCz9++ftN66SvmkLHoHKxUJdEAzKGyQMUujHXuF13EiWm6nmO1f
	T3eeJIvqQcExaCaB71WMjqynIQ58L1+apnNYd9yw3JyVNfDX33ok8OAf5EkokgJrnC6GKBdXYi6
	9PjNvl4xpR6IVbwNUAyplnH+Q9gNdC87yLQYjSZZ7foM55q/FsjHXhNBcAObEBxmjDiFncOr9Ox
	p+DbZ4F9QW9qDxdH7SQSAN3fO2dsmGxUPKozA0yMb1U1LoU4sU5PtIK7dYK0P
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446722185a.54.1773409581043;
        Fri, 13 Mar 2026 06:46:21 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cdb5b4d7ccmr446717985a.54.1773409580598;
        Fri, 13 Mar 2026 06:46:20 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm551207205e9.10.2026.03.13.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 14:46:18 +0100
Message-Id: <DH1P89I0A7GY.3K7UNNNSS7LT@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 08/27] RISC-V: KVM: Factor-out VCPU config into separate
 sources
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-9-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UQRf1iFLLfa5Gfvz3xDBrLaHdGc-GE8B
X-Proofpoint-GUID: UQRf1iFLLfa5Gfvz3xDBrLaHdGc-GE8B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX1F8//qyqRBZK
 Vf3TWmWY9PlQinHPvuwV4WeEC+MhWbw3iNpCmD3rxC7kII+dqHXC1FmBIq8b9ZYYrza1vrmn2oB
 umyzVjgp4UrQABGF/DjX1+NPf0p696pu8H3fe2QSljZuQejBVKf0pGpJYEd1rHmPt1xeRNdsuKx
 xdpP3l2tpWNUmLNSMW2XJybOWbitECkwEIOd8jth/lp/4x70GfKBGRzMDCaXB6uOpPsvvy0QGsg
 Rk4i/lvSTCQHCBLbh9OabG1IhjPai/6dpSRfHV/5VDmo0l0YuVV5yCRQ7bHdWYnpuHaQlnEeiO0
 OT3RQorOkOolAO0GfuQYYWCJZz4VmvxRoZTh0//i+nEdxIyYRIEMk4ZemghCBqUHA0RUvD0RIuL
 AuG37Sn/74SzpFyUG+wsoeP8YBQ7kIzFT/pmA4qgf/ME6c+iHph1FXd+wmuneQIi2lnV2x4ZdMM
 /G/R4JEdTovWR24UYtQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=69b4152d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109

2026-01-20T13:29:54+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> The VCPU config deals with hideleg, hedeleg, henvcfg, and hstateenX
> CSR configuration for each VCPU. Factor-out VCPU config into separate
> sources so that VCPU config can do things differently for guest HS-mode
> and guest VS/VU-mode.
>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -871,7 +820,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	struct kvm_run *run =3D vcpu->run;
> =20
>  	if (!vcpu->arch.ran_atleast_once)
> -		kvm_riscv_vcpu_setup_config(vcpu);
> +		kvm_riscv_vcpu_config_ran_once(vcpu);
> =20
>  	/* Mark this VCPU ran at least once */
>  	vcpu->arch.ran_atleast_once =3D true;
> diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
> +void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)

ran_once is a bit awkward name since it hasn't ran once...
Maybe _once or _first_run?  Not that it matters,

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>
