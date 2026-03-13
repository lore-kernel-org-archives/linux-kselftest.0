Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA1395D9B
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408444; cv=none; b=u6/cxagw86JEUk8B0Y9XZbINYI24x5po55Wa8xr/SRLdZ3PFhJnGnRgpV8uieXCuhJ9H2zTnQ9mo8ftN3HVulzXDGKktIGSCd+q9v2Ptxa4CZTT3AyAHiW19ll/T72KCByOefnJ7MYbYx4iDuV5mvjG+x7t3cXpkJb/eIGD7+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408444; c=relaxed/simple;
	bh=6Iz8o+kd5kPHF9Z4Rn/7ET4kYHk2hfmYcVmjca1abUA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=R9y+0LCh85ismQ4cQcm9dzvmuX6Ty4iv1+/DGcndfb3mggf2KGueueAd+GoN/d1CmGxNZJ3+mKWNGGNhRiLcSDdD3wxqzQV1kL457QES6mgEcoxOTRGXtvaCsHuflwV2+GYjQVdNG3oyG3r3BjPnejfH48BJrvxyZaD8afWlvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+ZaNBCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ld6ApV7f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+ZaNBCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ld6ApV7f"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DC6rr23229964
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=; b=Y+ZaNBCQfFQuQhBo
	6p1N4DaISDil9CT8DRrLzQLJ1xsdyP1T9f8tpL7qVgwl8wwjq3yGeQWew4lQ7rO9
	I0BnNBvdxN+qjWkkby8onSiinQSsyp5cl11WdGnDbVLxdJPjHlAhP0eUG7KBb64T
	yr8FuoluaAhmgHc7GpDxTYrgrg9TRYwXs4W5l0QJfeC/8hCsmsKmpwZJ98MY/fIv
	ZyF0g/UDtgkcZE6qpa7uO3NDB7ybHwTIRGTeR9ApSABL48t6zfG9rsncNEfp6hvk
	pK3nttJexlTW3kX37DE1LoXdZfAyKX9kFZ0ncQ5t9XiBG4fbRwsskoa3HXyQtJ+p
	P7jFYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7ja4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7ea0bb20so1196371885a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408442; x=1774013242; darn=vger.kernel.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=Ld6ApV7fmCRdhcWEOAnM9ACuyIH3vM78/MWosanHeeL46IKYZUK80JB3mMBxNrkzb0
         mktNdWAQh3K0Fp+R3dobyOWAA9COB2ztdDg5eaCaHb6uKcR3mkE9PABfY7LzSSZArKL+
         M86gyb7Z2yrYTaUBLVBYUp2mAI6ut1dAR9MDCBjkCR0HHiGCp602cTbXvnKNxoTpC0EZ
         lGsEVh9YMpPd31R1g2hLSUiDwO+NZwAlwnmnRLcMZiuvEZTuT/DMzxMzKWMLcPLpa0oN
         vhNCXAqD5UXLtL267vZm1T8izBHwriwrjByIYqDmf4UB1Wv08QxpE4QqD1woL0VjphaK
         YDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408442; x=1774013242;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=NBkMcTgvEkZSO7LFKaFqU5Bo04iFAxTvhPkCIyrj/BuQavRBSrNwU9uaiy4VDSln32
         S/BQki7uWHZMNxA+ZsOB8D406IG/uJlQelZ1arAyEBuwDaq1R9uGYK10PhEU+D3vLnMh
         TcwVXQKq2+Ld+SVKojnpC5AHN+2MZikPjCUlyjdHksJfF2RVytNibUEGVbY3/Z2Cwv4N
         sU8il4LK7V0v+N7D9IE2suRgsrdWMikoZmy+RKGXg8K+LOJHRiKMGedQa17xisV/hd86
         7PLxAXFo+zQ8iE7LAOYow7UQZ3zUrX8X8rMmTVV5FPQTgak++P2h3htYZeMBMwaD6rRC
         rM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj59dMNE1XGYfUP4R5lQb57TERXNiA4G2yT5LPxnC9l3V3lnUj8P4EUCxE8aMlMxHmCk/PMxO42NSI2/306ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YykOweKGo+sZfQ2ObQrjWJYUAFnBFHo+IYJzU10ggPw7oFMIMY1
	sfBEEGNBQ0CvS7EFrzDVTcnKoLtv1zx0SDcwgb3OYmV4SoFKmwOEXMK+Kf/12Ao2yAI3nV9CtJ+
	mLRqgQDvR/JQBFBrOXc7q6jkFhVCbaZfYV6wBNfhUnF9fS66Jl6S0SP2pRRPOPQBML6SFBKQ=
X-Gm-Gg: ATEYQzxyLngcX+MkCaOG3yKxAcrt41sxZxZ+XXSF2uAICQtIslx/PWx42rOMVu3/NXe
	8Z/PZvgB3e8XMpMPbRiSiVzC/1h7fDvBUEBMMXO2fGcMUmEJnB5r3tZ9p87dHjTJap3R4oTSrg6
	2jrOOLyUK66XT3AsQsTJKcZoo2LysBv+d9Sz1l/DXrjIGFQcYmIZ/2EGPWQYI8UPgcsOLZhwV+e
	0GX3hZzmJr82ja95TYNHREcpIdzKiHrls48k2trfbGJXyXmO6NLSPhLCWCT1imcqcxrpwgN1O3I
	8RxfBMfZ5MNJ6UGCTPZb9XPgI0ZMFSt/dbuRqVqINrJFR8E0KFJ8nviVviOhNJFUS0IhFw9aLiZ
	BBsSxYAXAgroinNywPYWslLsdLvrVuxJXqJXN8Mrlajm0QE4RsZDmiMsL54Tf
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450719585a.53.1773408441931;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450714985a.53.1773408441464;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm19683402f8f.39.2026.03.13.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 14:27:19 +0100
Message-Id: <DH1OTQ0FHZLN.1RCIA8ERD3VGF@oss.qualcomm.com>
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
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 09/27] RISC-V: KVM: Don't check hstateen0 when updating
 sstateen0 CSR
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n-gIplLYPcF7oHMezoyQB7DgYJ6I0SsP
X-Proofpoint-GUID: n-gIplLYPcF7oHMezoyQB7DgYJ6I0SsP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNyBTYWx0ZWRfX2nfBMI+kotsw
 gIdDpaYC/fJZcDlLNLJQwykGW/nD3PqRLDVqM8EQ3GZxP3sD1A3CMC41jwgGUxMfucyJF86T+S2
 OPVhMWLZMAS2J3oPEK0c/GtM5Tg8/CS91IXYW8xQ4rLE3gFFe/EWViQzgbWS18h8Whx0Fv6rE9g
 o0CeW3pkEDghf3Iwf/7JQjs7Pp0BWhYy5wo+tiIaKxi+m7CuwPuB9QRqxMu4g2h2id3bY3Q7rjM
 Wj/GAUWOeiUMcgm3lhjuRmeCWltv/0CjXEYR4/E7Ql9OzyfKnG+1u5GO3hsoxVWgrIvdbFa9EbZ
 s2yvgVPhunpWJ+CFecfyiN3GF6vfi9cjdRAAQfMI5xOfGLtmdUqxChRzKdlcK+8kX+CScWu8R/z
 n+DW63ZxfCZUgsKcVGi2EoYWuzk40vQ4yXI2eAGuK+1/RsTkK4bs9DKlmwsDOrQJ4+r9gC0b+HR
 iGoXSEIj6/osxF2UuFA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b410bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130107

2026-01-20T13:29:55+05:30, Anup Patel <anup.patel@oss.qualcomm.com>:
> The hstateen0 will be programmed differently for guest HS-mode
> and guest VS/VU-mode so don't check hstateen0.SSTATEEN0 bit when
> updating sstateen0 CSR in kvm_riscv_vcpu_swap_in_guest_state()
> and kvm_riscv_vcpu_swap_in_host_state().
>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -702,28 +702,22 @@ static __always_inline void kvm_riscv_vcpu_swap_in_=
guest_state(struct kvm_vcpu *
> -	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
> -	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
> -		vcpu->arch.host_sstateen0 =3D csr_swap(CSR_SSTATEEN0,
> -						     smcsr->sstateen0);
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
> +		vcpu->arch.host_sstateen0 =3D csr_swap(CSR_SSTATEEN0, smcsr->sstateen0=
);

This could even be considered as a fix, although there is no bug at the
moment (both host and guest sstateen are always 0).
In the future, execution of a guest might have been tampering with the
host sstateen, because sstateen is active even when hstateen.SE0=3D0.

Reviewed-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <radim.krcmar@oss.qualcomm.com>
