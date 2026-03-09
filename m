Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A38B36CDF2
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089656; cv=none; b=J40M4wawwXaFxB+maGEIuPNoBIiYEs6qWg+00RoSEEJERVjg+16n6feWwjNNnY8H2sibsCbiX9f0XyoFDDlopKr3CCv5kVE8bFfyZOp6noZdMzaMvpLxj7v45HObwXz8KYQ40GGcXOUczvZI71+HqJJFFJBdCTaT5UpRL8y67PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089656; c=relaxed/simple;
	bh=GzHkMvhSRHHLwHDe/m1bRB+w9Ae25JWE08kS9XZvRgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8miznml4NOgr3uOKFdNduv8Vy0c3SRr53pPKXPMBu8a+S2SYUSN/MK/OoFD1NuCKr03ZpKvY2p+Mz5G5KEdxNbPoy5R+vCfWXgHQ0tjESy4ktCh+O+Bfc3At3DVE/mPOCXJWFfdno5lnte212rzzcGdXJekB9v2hesSBQB1Bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XciWPys4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdZg6boB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XciWPys4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KdZg6boB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBu2B3148387
	for <linux-kselftest@vger.kernel.org>; Mon, 9 Mar 2026 20:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5Yxel5RfTwWI3HmsQZSOUpH
	h5+ctVGV60MhY1a/V6Y=; b=XciWPys4/QEXZc5CMdXL7PjvvEha2ikFmSqkSePB
	9Ws+UF/CEJpRVWplLxD3SSY9Wu668Ec6KV/Qdxf4/z9xexGLzRCxh8kR0AuOK02K
	6RH7gD4c2hU/bbST7HJXWXDJ/kQHlysyyW558OApJiJabh+MUuUq/TYI85nlrw9H
	6pM/huib93QoTtgia7g/iJaPx2EVmq/oW6z7inr0fckdwG76zF4Hwf0DscBVMUR2
	zW9B2pK7C9mOjL0rtefTzHKGjrEoxpbKYRwyHdAgNb1e5WjwcHvcnSbO/jzzdrfG
	cHI/y/l3P6iofRW8NT+Ff7hgqI0zBPqjYA1PJyCSXh76sw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5ua37w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 20:54:13 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463a075e177so55582387b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 13:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773089653; x=1773694453; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A5Yxel5RfTwWI3HmsQZSOUpHh5+ctVGV60MhY1a/V6Y=;
        b=KdZg6boB/WCfdi3I9znJWIhHMMQSNPmpWPtW7pfWYn3z0K3iR1HAjND/sxWU6yRhDm
         AFF7lb8m0c92GOPXVNoDWmJ6YxACktuvhQSq+NdSSDPFC56yiJFzEZPjHAH1ZPbQ6vWL
         Bf58APewOEbagYLe+dpn8SGYVeJuWiSAzuNbANdBssTRpGGYxulAs6eoLjblUvS5wMOd
         V9ji+sirSqb+3ffFZ3hOukAxLdhidMp3bI3X0S1F2aWh574Dtt9RIb/Q3CbZgH/fg0KO
         v84mEyiKivBUKcgUcDfUmUL3/iHkjews1Nmi/a7sWx107PMeYVfRFXt5hLvUvoWgD/kC
         o/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773089653; x=1773694453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5Yxel5RfTwWI3HmsQZSOUpHh5+ctVGV60MhY1a/V6Y=;
        b=kpuChZfftLnBpKaoAmpajs66Wg2/6OL8AbghTJAcNe7cQ5so3H99wfOry/Y7URk2Hq
         2b597MQDzaiAHyp4qdb1VUuJURHVQJpkmPyJDkyMFy9Kcg5yCUkE2YT1ldLSr3v5NaCy
         fqgbdxoVeCSlLhCrxaQDKt/JCP6FIsmWpHAtW0YZbBQG/yB7w9XuXbPm8nzC/Fni6+1X
         BPVfmfiKbHa/Q2ZL/V4sQ1v9Ajh5qfw9z84W9NHik/9+UCBf30rvE+tcIl2h3R8upeP8
         Etw0umBj2oIpzZdAglYPOcjE0zeyykgi6lxzc2dRw1q/CwxW/7IEkMqatZn2dnpCUvOV
         yMgA==
X-Forwarded-Encrypted: i=1; AJvYcCUJH79KgxAcAcxdbxckEya0fklmZbM39ZWSroxSfbmAik1XujQWGgI2wKP2DEEp2kVP5L0H+ONJ8pCJXqQs8dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycrzutdwB7Cqd1TpHkeFtg5hBbNuTkKTihG8wxHpZJESi5Ll3W
	OKO8gPZ3SGMOG1bMO+9j3AYYC8QCJCqhUvm3OJThVkK6PH/UUcGxVonAtW/RuM0Oe5eXKsb7Otb
	ZAhHYGNwVRHVxEED+lT9W7009aPezmDz1NYWVrJpYDSSyOboFPavql5G3EpkUHZICxrNNobE=
X-Gm-Gg: ATEYQzxnB0V5U7WwajZ7osb3RDhhduJ72UEl3Z6LbZTQVEd8pMk+nrlbd8MH73kc9+z
	NtWwyKn6TD3vOsSHMhqTmEQuOv07KmZ/fdbNIfbBCyWG4jzeo4rt0edFLZyfcrZuhByQZjwTdW6
	z86sdg/UkARKmnUKbfntX6aXy1oUSpbnvhZmg6T1tdFqa4jZkty82mBVIR/eGmhfqLz3P66C7TV
	6wJgJOiLW3sjhU+bpdWizudSx5acmJ3MhUcNySiCObcT2jr6MTKHG+Sjui6rOyaYnaxAgD3TRw5
	yAwTUkrQxwKdiCcpSlngiy+zqNzhdVTRhwT6JkKx+9sEV7IcVFnRR+tmt0Mxps2Km3MmlJne8wK
	qUTA6Mx8gnjqGYm7jRMhYe2F5mfuIaXA=
X-Received: by 2002:a05:6808:44:b0:466:fdd7:25d6 with SMTP id 5614622812f47-466fdd7380emr2624967b6e.43.1773089652896;
        Mon, 09 Mar 2026 13:54:12 -0700 (PDT)
X-Received: by 2002:a05:6808:44:b0:466:fdd7:25d6 with SMTP id 5614622812f47-466fdd7380emr2624903b6e.43.1773089647569;
        Mon, 09 Mar 2026 13:54:07 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-466df96b093sm6375170b6e.5.2026.03.09.13.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:54:07 -0700 (PDT)
Date: Mon, 9 Mar 2026 15:54:06 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read() and pmu_fw_ctr_read_hi()
Message-ID: <hsuzdri46cava2pjvxpqkbcr2mf32elky5d7bvk2jgg7szw2jb@aunkobbhz5fz>
References: <20260308023803.4001232-1-xujiakai2025@iscas.ac.cn>
 <20260308023803.4001232-2-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308023803.4001232-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: xYoG2UTKALPtWkTCXJe6Xol2I7lsXFt8
X-Proofpoint-ORIG-GUID: xYoG2UTKALPtWkTCXJe6Xol2I7lsXFt8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4NSBTYWx0ZWRfX+xCc0ajDaP7T
 NQmrYtGoQ6oPKfXAvTmp4N0JZ86tXGnOaMBXnrO4Na3hCAqNUeZdHnL55QT+2Heeifl3ZcdStap
 KWSR6xUbUZqWoU2Arpvz3Ub9IGe49OJkVYTkY0r+j+gclXBkXXBmu2l9PJMPbV2Ps8bm2uPrLUA
 KWJHwYerhQWSgz8cgRhQBfM8ysKEOxDX+TTUdeXqNtvwcDifLp3ekVy3lajqHqELWnOoNXBe/cN
 CN8aSIAgSx9kW8xUUckO+dwVGhn3+WipP/iTqRD4vTfeWzS/Oqdai7E5uSR0d8a+BvF2+0OFRD6
 1y7iLb5sClPzmmvth+O3jWpLkgJEBHjRx5gU/08b8xW27GzqNg25/4tF8hm6+ZIWACQ4CvywNLf
 CRaorm+q15EPsXNb+dorXMgsdHcSlgpJH2EQuHlRovyJSR+6opLRImUaCdQEAf4Z969p8g24YAR
 cktdt+bIvHpR344xSmQ==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af3375 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=8Yb5Ig-FQYYOffGBJ70A:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090185

On Sun, Mar 08, 2026 at 02:38:02AM +0000, Jiakai Xu wrote:
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
> Add a bounds check on fevent_code before accessing the fw_event array,
> returning -EINVAL for invalid event codes.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V1 -> V2:
> - Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
> commit.
> - Removed the pr_warn, simply returning -EINVAL instead.
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..2ab67f5b99dc 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -227,6 +227,8 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  		return -EINVAL;
>  
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (fevent_code >= SBI_PMU_FW_MAX)

A test of just 'pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID' should be
sufficient since we shouldn't have random values in pmc->event_idx. But,
some defensive coding here might be a good idea, so the way the patch
is written looks reasonable to me. Or, we could do something like

 if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID ||
     WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX))
    return -EINVAL;

to try and express the intent better.

Thanks,
drew

> +		return -EINVAL;
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
> @@ -252,6 +254,8 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (fevent_code >= SBI_PMU_FW_MAX)
> +			return -EINVAL;
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
> 
