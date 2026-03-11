Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D900A3E122C
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247929; cv=none; b=Nc5mh9P5QmBSW/GEYz+JbjbLV2R8tDpgqz0mx03SqxAs+iZPJxvwMpiULSRoW20LaupT6B/8ooy/Pa5UiuKwkqcdcg2uVJaQpCcSlVGrqcMME4soIO0U3EutT/TUievn1OJbZxHvZW1ZuIcBJvPkoASNGH8YW0QjAvPjCtKcAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247929; c=relaxed/simple;
	bh=Q2RGr/uHujuBOsGY5DfP3vDJmdkb7/tC/cwQuB6iGc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF8XaECTiuXs43a3Yhs/26F9bf+O9Q5iDJgL0e3m/FkRXo+jWiOWmglH+9qv1Jc/MitVRH7Q9T0kIY7+aYvAAtKVgYgOO0MRoolrgs/pyADNDlBvKoCM7wk0KQ1qJnH/puRzJJY38jFS27k5y70w2vk7JwZMgLjWe8dwg//DpfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbSFXa8z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y3aqWP5N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbSFXa8z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y3aqWP5N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBb08E1439681
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y3/JAW+oGfTE3BgR575SvjKP
	t61kz+8CmpWiBiOLuUw=; b=nbSFXa8zbVW04UR3iGjV/y2nQU0cIJB5fIuIpNrB
	dB/eJOcWljGTnFzeLjAeI0ABRqyBIyUKFJ1wdq7yzWKgNsTeQKuigY1qdb5PmnaJ
	oZ3fcgf6bTe+BeXglfvEQDBY1CRAfnhkoX6n+HEfwXzGR2D3iK05JY5xHpIC1IHZ
	3v+uF8Ga++9meEkPQ1pIXuyMVfOnbBc1KGT8w9hbKrzbzG0mObW6re0Cpv+mo4yY
	W0bZ6qbz2x0yWT7eMpMpSlcKGYRCCx/0sIyYJuTFLmw8ndJnBHJ8P26gQVeHXLR+
	VD9KYFwPYSnusa3S81pVF341iRDPIVoGioWuqdadGkoP/g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu38yj8ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 16:52:06 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d73fc43561so1205081a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773247926; x=1773852726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=Y3aqWP5N0AFRw84C+vC1UvisLrhbLHqGeBsNFzYO3lZ3ybbnQC7Vmyn8uF2CW68tMj
         3HaYXeq7y+Lv2NO1Ao8OyaEuU7M6iaqFGJJRl/4P6biEmNna5FCPDyvGoMdon/qYEn3I
         aZyHoJf6KFd6C7yS6/rGDnfnJdI5R4IzAK7dAH588BjPf5dR/heJ2datowiueSN+mRtD
         3UfeAH0ZF9Q6KTkbQ+PTXaqtIcP5Q3SbyGJ1tMOGdhSl1quAJ2b9TYRWbrZ/Nvqee4Qu
         5hxE2xsT2arM0LEQg70fyu7jqRWmKCmx4f8RtUso4J4YSxzTQ5I1Q1KSowbXE2GXR6Zq
         WiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247926; x=1773852726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=DCyxV1QJHb8PmvuygOKqbAftv3CyQWZBFRseMY69mUxRLAS7b8PPBRnIE+1wkVR9M+
         oPyZN9Tg0Euii2sbk+EpCfr5O+zhp5dYz2C5jmxWr9ixfXkseSr60dqx2eHQpHQZtBs2
         SAjoP2kNZglCyKY+obEfY9Fd3e0cOnauAZx93usnfGkWsKBH/+VSnwc3wFEXCJQg0+OQ
         wHSFtNvUPMzCWMcD4zvQkBbmpw9jv8AEV/NB6mRhNFi2iMUBfhzpstP26rk3Z7Tt1zY7
         v24G0Wtm3OowWHMbhoNkrsu8OoELGFRcpSOFZoXTO4xvqOLSwJscT9BCokcVzxfbIAWe
         qK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSrfUiJ8IWnovq6K0malTLSlC6mNWAR2IdiRGtaErMCwRifzwBviGShig12ytkqOMfRSqFrm9oqxwIr40ef0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmWlizCW4ipXuAjDdY48KKJUNfS8JpwRO63Meqk71N+3TXCsXl
	Y2aEk3HuqSPJbTSX3ZbuSqrSa9pD4nMySac6SPhpJdzLuWrPYNUVHJDddli0URE+7FNQ9nw3j2D
	QEwKfedlGa9oyP4pNkWupe8jrTLggrB6QUybPIPHqbVDWfxPFyOA4caL4y4K5Vnv5ArZfy9+G7N
	Lh9Sw=
X-Gm-Gg: ATEYQzx20pQIDAAwmDwKRUjMYCEgtfxsB5GI3LU9/0+Iwe01KBmyPv4CIxGU9rtYG8+
	pmJVQGauFCc30gdRZCA4ApZjWNVOqf9P37JAe+/ewg2IpCgOQCn6PwUhdZ7pwmlTYkWQtoQV5PS
	rt24EHAq3Gcy3I+fMR6AYTyx1UM/fMMvmFDSe5OawfxssP8ecFkSiKII4dNosEmXSBlnrrkinQU
	CDRqpB4dkWJr8pUwBNWffG6cLr0T3q/t+UFAIxSebO4BxNwOKKeIX8b1I1P+02rqlwz/wxWNUPx
	0X+lbYE+Tc11Yp2QUq86aC0NtIEo5ujqxqGEcwCtvHiCSuF31lPsD99HspSB986K8qkd6e8FNNe
	ZHqo4hwjizC1bkEG2mEmG1Ovz3+ucJVc=
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127319a34.35.1773247926099;
        Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127304a34.35.1773247925706;
        Wed, 11 Mar 2026 09:52:05 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7749f1f5csm389205a34.6.2026.03.11.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:52:04 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:52:03 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read() and pmu_fw_ctr_read_hi()
Message-ID: <2apicvahmomu57i7gjd2cgc5cakq4pxsbphz5xnl4cr2sqvp72@hqud4u6bo53b>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0MiBTYWx0ZWRfX9CMIIwaUbZ0g
 o1PxNY7W7QrUzP8OCfBW1+nLXL4/3UJX9k1SONQZBZCk37BI1ZR5UU4jji2FkAyCz1I1I/ebuwi
 ycUIgYt5fnQWXNzXvZxwO9xqLLJKJTbm1HGCLrVgrJ1+qIrvpRJ8YrxDiSRDqDkIyHKgh7RJC/5
 tIKH0L9kjW30fxLHI+mYi9AkHdsOu5qpUorOEgE5cnEGDRr0cWkxDAlr5Ga2iVNa+YuRDP7Tm7N
 hPwD2uoBi5pwEd87kiuEI7e8vVJMVvmlfrkfj+dUuoMPy63SAgF7fLCJgcmwBY2TwU79h6p+GOo
 4NWpq0VGXddwcSyz4ayXHshAUjR52IGAIkGpJXFPL5m+FoDAew6ovK5hZ/4q5BTHbBXkYqG18KF
 abFskrIA33h06nw98M6mJ1wWxHEqmBBsBkJJ88upL05+y/5e4Ffs8omBHvJhvn1UqqA7gInyIUo
 is/T5w5GGJzADFAHuTg==
X-Proofpoint-GUID: unGUsq3bjt93eos4-rPNc-ZNzuwOrFfz
X-Proofpoint-ORIG-GUID: unGUsq3bjt93eos4-rPNc-ZNzuwOrFfz
X-Authority-Analysis: v=2.4 cv=Cq+ys34D c=1 sm=1 tr=0 ts=69b19db6 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RS4Nko6ylG0vjQzhQroA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110142

On Tue, Mar 10, 2026 at 05:55:56AM +0000, Jiakai Xu wrote:
> When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ or
> SBI_EXT_PMU_COUNTER_FW_READ_HI on a firmware counter that has not been
> configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the pmc->event_idx remains
> SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
> lower 16 bits, yielding 0xFFFF (65535), which is then used to index into
> kvpmu->fw_event[]. Since fw_event is only RISCV_KVM_MAX_FW_CTRS (32)
> entries, this triggers an array-index-out-of-bounds:
> 
>   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
>   index 65535 is out of range for type 'kvm_fw_event [32]'
> 
> Add a check for the known unconfigured case (SBI_PMU_EVENT_IDX_INVALID)
> and a WARN_ONCE guard for any unexpected out-of-bounds event codes,
> returning -EINVAL in both cases.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V2 -> V3:
> - Added check for SBI_PMU_EVENT_IDX_INVALID.
> - Added WARN_ONCE for unexpected out-of-bounds event codes.
> V1 -> V2:
> - Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
> commit.
> - Removed the pr_warn, simply returning -EINVAL instead.
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..c87a7b0037cf 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -226,7 +226,14 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
>  		return -EINVAL;
>  
> +	if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +		return -EINVAL;
> +
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +				  "Invalid firmware event code: %d\n", fevent_code))

Align under previous parameter, not the >= operator

 if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
     "Invalid firmware event code: %d\n", fevent_code))

> +		return -EINVAL;
> +
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
> @@ -251,7 +258,14 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	pmc = &kvpmu->pmc[cidx];
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +		if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +			return -EINVAL;
> +
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +					  "Invalid firmware event code: %d\n", fevent_code))
> +			return -EINVAL;
> +
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
