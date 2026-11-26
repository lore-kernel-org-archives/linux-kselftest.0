Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695119;
	b=XSPpWxbWLnMKT+Q6IpcCfUUL2Ov4TJ/EGyoyus25ozyWB4LU7Eszs2gqU5FzESNqoYxu
	 UZBfHsU7Hg3N8QOtx/pI9oImaYFzZ87kCr0wGbUtbHfDtQwMwsYDUNJj4p85HV7uje+0w
	 yv3IQ29TOBAzxxAoXSii690oS9JnKaTWklS8Xn06VwUhkbEnvKjHLFjQ0+3/FZ18979L5
	 OUBv7ZQ8FkvNqhXy8FTv8cWF5IsKFaYbjERhdnoqo4GMPl8uhVTV7fvtPOyLk7+gn6rdn
	 MBpHZojaqsLuINuD+gqKNqUmu3JFMbdsana80LV33ijzWj6Vza1WdWQrDBdgDJeQmjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
	b=SltRYodXC64wYtQMNHOEA2LZj2aEcECWrWA9AMutvVj3NDpkTbKYjF1CkIOWuA/ERASE
	 dCXIFIRn7lBqewRgYDue94iBsTtF0zlqKVPt0FL7c5omTGBD26gjM7YcEmgGTKvvFlXwv
	 JqLqhjvNR81Uc89R56QUD1Ju2x/ZJyf7DysbdCWY0vHB3iKk9kNvo9wygcSj3fTg+MHUe
	 Puw73LBYf5kGKK3BYmJTy7PJMqAUdTJ/2xFCS1wrdEvNcyuaezLZ2UkHOVVqGdPCTsQSo
	 3BOgDhVdJDoI8zyHejt3RghVRr8QFfpZpy9XrPx0lx/KQ+uBcEaTHHFuibJnnOXKrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nbyd56U3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVCvNa59;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B22606A338
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 12:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B22606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nbyd56U3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WVCvNa59
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVQBt2758188
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 12:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=; b=Nbyd56U394FEcm0A
	5AK/0bnI5rCiDxK1kRgxf1EFnMIYbBSq3cY7PUvKgnv61I8UoaKnCbq8RrKN+aXI
	ks8uaHQnFddA5OkIMEdYis9rIu1wI2HANgDqnM3DeCRa72abpzzl8OW1HuiS1SMX
	Vk1VGHKKXHubEZqvkY34K4yWrGmmWcv9pk0uLF/7bnb5IOIFRwbhyhfNTtgia4Pw
	0se4oUG1NrOmXCPJbY2BuSJdP16i6y7JD6MwC7wY//6HN82MSz4IIIJF8IK/CEiE
	BanoNMgI9xXLTwPM6niduhZxslJfMkEN8NVIBm8kEeQfoDtZ2t0P4LbD+dqYP70/
	wa4xYA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvbqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 12:11:58 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b51464f007so84616077b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695117; x=1796299917; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=WVCvNa59gvmNi9qUh0FXh0s3Kyc/csYxPgmGTZ1uSdtZHWlaU4DyyP8RL+facSn4xR
         zgQ5dzOxf2FGGvRTFE+paMyv8F6+EkerjiuS1VWMfnqbhOfCzkFWiuCj7HxUK2xnieMR
         goO89zjgtzL9fSA9K7jwzRfDpZctcrGvotKeurkKUJWXx8D2lqPLN7C9cecCNACTec3e
         bAQ0RcqfGD7pmBFH36gAGE3VTmXIy0ujaoxmqea84ir6lfaRnD036Q7ayzrWG3e3KmY0
         4CD4o99n2EaP1xW7OVRk+ttaGMrTwZkdIdgSgCwiS0UX6MjiXcGcmB5zv8A3xDlWhorJ
         CHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695117; x=1796299917;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oc0acx8maz+xPPTkV/fOdoAfKxTs10qf84BpUCm0ivw=;
        b=v6VAVD/ogcXfFp37t1GO3J6CARPcLWYc27TnqWWIolkybOHKHUzo668pLYEBZws28w
         34u7XHQ63CobSjyiYFNuADaL4LSPhNFyxwW2V4F/jhLKUDEWB75ivJinDi+Y5zBnepwi
         lK0nEdxZD0AOrg1+QwyrxkMS6u69sGuHMI4KQwRGSRHDCcDCRoN6Z1meN9oNwHRjuIDc
         i9Ll/3LNebJj34qD28MPbIl/w9orgNFNVgwFko7JExNjz5GfgSrtot9LGiSZdDXVnPfs
         TvTkCQlqQafagxJggBgYKO962F+/iszWXS7UvZtwXMtmQHkZrvOlMDblrD7M4qrjD0Qc
         T1vQ==
X-Forwarded-Encrypted: i=1; AL+hErGrKpqJ6SbkrpB99IG7JKXzsNaU9t5N6HYpnFRBiMhbN/QJOc6XNMdTzM39skgQKzGB3Eo2IIizfWUOGUNnFJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hdTV11mLa+FxpW4NiGv1BA39kruvdS0chAEiTHFVz/HnlES0r
	Jhi1f1u01PBfKtahQAYe8EP0Z0JOZ1V8t/Ov4k0yZnVM4YFspT/IV4fF9AcgszVctuRKrgwdD25
	k3NvsVmmBKDW3VAG7FmjbFPn7SzQOfzoFsW3PktdDVyyLJic8+vjqF63VMSTG+Al5sr7ijYL/LD
	kRjZ93QnjJ
X-Gm-Gg: AZFdTZdk5JeGmcX/57LST9QyLXaI//lTTB6GDsX6RvO39Rtn27hE8BaDEsmorn9oGgn
	i7A0+gBf3T0s9G+fseayJGGTB3FMtjcDGRpecz707M7uxLFZQOSSL4sC1WafsLmDlR876d297Bt
	SuSWDdujORSAMqvPsfOeKRpP2tQFHOxkEsNJo+e/IAm4aj0CfcKhO90Lc+Ekbs27WZF9+eQaQYR
	7PULb/fCak8k5MtFAGETGaEfaDaM69yuVuqU3MinbLkdmuKBP8wl+38eGXkY/r3KgeYO5yaDOZh
	CvhpQgaagXq5xmF7MeyGooZUeLyxCHGU6gPN56ZBQSE5nvntN48Jp4XgsRA8zahZeSIvs8Y5KYw
	L5oqIsbKVr3sDmfRnY1Vj5Z+gkCrX0NJydggSqr5+MUF5yTYNj7tiIqzg0wzYPbrAezRZwV/vk7
	Gv7YzPETLGEQ==
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066567b3.67.1795695117120;
        Thu, 26 Nov 2026 04:11:57 -0800 (PST)
X-Received: by 2002:a05:690c:e3cf:b0:8b5:6bf:c396 with SMTP id 00721157ae682-8b52051dd1dmr79066347b3.67.1795695116506;
        Thu, 26 Nov 2026 04:11:56 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202cb0b0sm85825557b3.23.2026.11.26.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:55 -0800 (PST)
Date: Thu, 26 Nov 2026 07:11:51 -0500
Message-ID: <da5af153e664e882654e7f6068ea7105.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Andrew Jones <andrew.jones@linux.dev>
Subject: Re: [PATCH v9 3/4] riscv: hwprobe: Introduce rva23u64 base behavior
In-Reply-To: <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
 <20261109-rva23u64-hwprobe-v2-v9-3-ae846c5c7178@oss.qualcomm.com>
 <DMXIDXA2V2S5.M1C8TT9U62FQ@qti.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: su6kiaRw08MiMlJ59OOnGWh8Re63p7OE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX4SUclnFnPE2T
 vrjN35E+O/6GSBUqRGDvgsMPUMfujPvvz01/MWyufWp9cPer4fCe9/F532izjZDBd+gRUUFUxr3
 1/wNYU6T3nlb4g67XA+I7KiJ8zUuex8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX7odr7tei1pnd
 iNJAHbRk1oPUyrpj+BqjGvr+4WyVOt10eC61dzK4ZXg1bcJp8BMqN1k1VFdehnMEUA90f1tKkfj
 g9s5JXkqlwxkAmEA0lZiGVp0Tvge+uqOdbwDwxvhZo/aS3k2qo6H+da0P7W1tOpM0p8ZwQUobj7
 8qdGnCnZ2jN69b+9TEiyQYwfa98auH50lmgBBST4fNsLsUtuBcRilK5A0OkpLhTwYQafRiK5Tv6
 qfHwjI8xOnvpYnPD5TWw+EWmJ09pwG5rhIilWFQ+w85d9UKliuF2B3vMgwBZwpQn24KhS2DK7Ro
 w7oPUKA/ftK3wSpSbM2VUy3Yee0nzbmsV/SBQ4sU1QxeBbJ350p//SWGq6NIUjEmVHrZS5p9l/R
 CMeZgkFQgiPomPyq6RUgf2Pn/rWZsyEcZZkEDhHC8yeY6KkuzIN00jMVSfHj4RMNPXKSUFfpBCR
 48JBc8KatqwAsRIQDwA==
X-Proofpoint-ORIG-GUID: su6kiaRw08MiMlJ59OOnGWh8Re63p7OE
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b08220e cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=r1R2P697X4eI0gH+iewh9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nOXyh_yiW3yAi_GNl5kA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Hi Radim,

On Tue, 17 Nov 2026 13:09:47 +0000, Radim Krcmar wrote:
> 2026-11-09T07:47:36-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:

[...]

> > +static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
> > +{
> > +	int cpu;
> > +
> > +	/*
> > +	 * F, D, C, V, Zicbom and Zicboz are RVA23U64 mandatory extensions
> > +	 * that the kernel enables for user mode only when every hart has
> > +	 * them, partly because their enable bits (sstatus.FS/VS,
> > +	 * senvcfg.CBCFE/CBZE) are managed across all harts rather than
> > +	 * per hart.
> > +	 */
> > +	if (base == RISCV_ISA_BASE_RVA23U64 &&
> > +	    !(has_fpu() &&
> > +	      riscv_isa_extension_available(NULL, C) &&
> > +	      has_vector() && riscv_isa_extension_available(NULL, V) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOM) &&
> > +	      riscv_isa_extension_available(NULL, ZICBOZ)))
> > +		return false;
> > +
>
> Looking at the condition, I feel a bit uneasy about code duplication...

Thanks for the review. I had the same feeling, and I agree. I had
considered moving these host-wide checks into a static helper shared
with hwprobe_isa_ext0(), but ...

> > +	for_each_cpu(cpu, cpus) {
> > +		if (!riscv_isa_base_available(hart_isa[cpu].isa_bases, base))
> > +			return false;
> > +	}
>
> Could we avoid the isa_bases here and just report the base as a function
> of other hwprobe bits (and the awkward PMLEN)?
>
> I think something like the following would directly make use of any
> fixes we apply to the detection of hwprobe features:
>
>   static bool hwprobe_has_rva23u64(const struct cpumask *cpus) {
>   	/* IMA extensions are required by the kernel. */
>   	return riscv_have_user_pmlen(7) &&
>   	       hwprobe_ext0_has(cpus, RVA23U64_EXT0) &&
>   	       hwprobe_ext1_has(cpus, RVA23U64_EXT1); }
>
> Where the two RVA23U64_EXT are hardcoded bitmasks of RVA32U64 extensions
> and hwprobe_ext_has is tweaked slightly to accept a bitmask and return
> true iff all extensions match.

Your suggestion is better. I will take it in v10.

One small concern is the two hardcoded masks, RVA23U64_EXT0 and
RVA23U64_EXT1: a similar exhaustive list already exists in
riscv_set_isa_bases() in cpufeature.c (patch 1). Merging the two into
one source is not straightforward.

Then again, RVA23 is ratified and the list will not change, so that is
probably acceptable, unless somebody wants to avoid even that level of
duplication, which may not be worth the effort.

Guodong
