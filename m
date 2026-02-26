Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DE4657F8
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772135829; cv=none; b=qj9iBjL7tCWxuiqkDGBG1xZ8NjEj+yFjJCq+eWIPP6eEBtADpXnh3uKY6DNP3AXP4gXYhZY5Y8akUshB81Ns5owcErof7JFUpUQE2Ku4aiPm53I09muIOw/84AbW9qWI/6oIhdOMzBtCWv7DCaRHQYrUzVCmAD4KYn+llj34kJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772135829; c=relaxed/simple;
	bh=SiuvbzDLjYJ34WrOYg7+5Z9QXufJQMzvQ+vyXzqtH2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAO52jAfHbwlGDQwjChryQQHBLSs1Hilskp4rzPshIIfqaOyZHsEogZsm2+dxS5wwGk+Br0FpUixUG65rvHWZfBBG6vinjWztluWMEjY2qHWOnrZ6pzPEsPrXQYJM5cmqGLItfzWs3MBV66S1QihdNk8idDix5GcMB8XFuwG3FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1D30GlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/xdPTYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1D30GlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/xdPTYe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEkHA3277381
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e9T0r9qPbJXEHEbE1DDUwuy1
	sFl7CYMlXpPV3+ZDZi4=; b=T1D30GlWpBTy7Fw5YVU5jHPnPcoQFM1DW5bOlomS
	G7W2fA8KNbLusn4Qm442rSpHBAYDx9aibSMdsziJ2WvVDYfAFzBPzTUsWmVe6V9l
	GJIQMqvHKa3Jo052jZirdYeWDM1RqDSMEvejXg3D8uvyMSePW51AYIKrShf+bLqB
	J+Wah9TMbrRt/JKsxaHj/K2mseAquS6wmKUlP57UUI2QH1ctwHvaR4tQoU6TLcYE
	qvoVVQz5nFb28OId1e2Rd9LLXVZk1kTBuG5aClPpZFNRPg6XTy7sarFi9ObtfdLd
	PodhJWY20rkoq+08ayYZUN70ITDaGQjGrcD/9R5C9Rk4rQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8da3rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 19:57:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-126e8ee6227so2546590c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Feb 2026 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135823; x=1772740623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=D/xdPTYeByPqyI3xsGcdMn8rDt2MiDsnMV6PaAXrB+yZ0jqOw7VMr1IhJnUZFXIVFi
         wTSqGZidPAz2qxO5ROhknNjPF8fKgEi8svOAp2rNNwhf+WEacbcIe7l2785rCBBlvsw6
         Wb7KguC6WpMViMvewJxKc2xL6M9Wf4xjVF8WSsQFNdOa98q4h5cjXdkI1T874g49yHu0
         nz2MMaq/DJs9qD+XlyL2mWLN3nv/s2EZRlUiCDhN35vNGATBXNxpt2sfRw4OEIR4YoOP
         CS2Zg4IN5B1uK6qbRfb+NsmE6QamIxk7HViGrqR0vzIc48yk5Y6I0AKLnrRY9bzsNXDZ
         AkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135823; x=1772740623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=FaEXK3kdRJ+xfrpayJE60BpFqOr1b8pVWuQYKsDeaEwJWcMyIC1lPwoz4B/QkjD+nG
         WCR/EAu9X8FravekOHYINn5St3wDNWOVY1QTQ1D21ym39WgUtOTRzatxDR9Cz/hGiUig
         rZKMo0TtVQMx8M4EjkGv/UZ++dm/zqVG2ksp0it6xglzhwCIv7ZlLq3QWRFTw8wZhb6A
         VAm2mBLvuRADHlM2NScm2iQ+1e4DLUNipe24hz9SKUd6SJFMdyXhs39wxmEda8e5lIyY
         wAvMOyMkMSoVtD2oMiVHsKccmE7CgSfY+Rx13x0JmpYEKoN/CpKSBtiorKJ8W63GTUWk
         yE0g==
X-Forwarded-Encrypted: i=1; AJvYcCVbfTfKj8TAQxCtexXVYXKoKt4hC3YDD4eTgYLxSwGhjOOLr8+s3XlQ3f4WQryipzrMbis4bQDJIb/OMebOdjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjbhFMI1Uv8EeotZf2OCWhOG31pb427e/SInOA0J8EeVLjWC4y
	RfFXddCGoSQXT6lcSj0Qj93h8xGVzc/LcT/QuKc9WS4r1o4DfCGAfmE/A8jcEeTs9/Km/3Kuj0C
	Ux/U1VisJYRzOmxmib9TC9ox6k46uDoMZTE22pmUbUDZisdBatywjHn6bEnpEI2c9VLYvQe8=
X-Gm-Gg: ATEYQzzjCerbAQJvrJLRKw9IG5uPiKayYzCJrdycc4+zZWGMAwMNyFNGZg/+DQ6rfgz
	X1VimgWdEni94zTAFrweS0TrDzy3RxW9giWEij7/CFNIYxGENaSgAyMzZbt3vO7wH4iBjVZnt1C
	/Drs8QRMF/11Bo6oTK7k8ixhZPcUo4x105+IMd447r4O/6CtLqgc92qmGXsODTwceS6yRPGD4cq
	aqA6PE3TjveGmV1SekjPpLbyLTJ0PknlkvdO4rAVYQ/ewZCi0l38oJb7IJMzBzXJ+Rh2tGBYw1j
	3R3lMCeqKqxhfbczpXol9MCiPQ8bYjuHcI32eFEBqEkrZ5stOuJqZqmhAkfl6b37+3p6PmOAiIT
	hJYAfWZCCScdVOAnAHKj0tHcSL09coHA=
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58112c88.31.1772135823063;
        Thu, 26 Feb 2026 11:57:03 -0800 (PST)
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58096c88.31.1772135822464;
        Thu, 26 Feb 2026 11:57:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e04361sm2885359eec.14.2026.02.26.11.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:57:01 -0800 (PST)
Date: Thu, 26 Feb 2026 13:57:00 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <ywgpwvhzvtkmhw26exwwam5hfo5euhiewbrzyzh2uzkls2rkbe@g7p5kxnhtgso>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=QMtlhwLL c=1 sm=1 tr=0 ts=69a0a58f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=xMjqbsr0sL_NellN6QoA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: yJgt2RmOi6mH2n_PCyqpgLY7hYvouKn_
X-Proofpoint-ORIG-GUID: yJgt2RmOi6mH2n_PCyqpgLY7hYvouKn_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfX4Xm2WjR8hWtH
 k5KvnY88rSK8WgO8Xam3VEXdFlF0QE722c8rb2YZorqxBT1U8ifxkRyJhix8lyPGZXGam2zwKf/
 T3wzy6qfRqR0ygUz69vThw0Bd0WRgQQE8pdqXkVgnqqSouMrApvFQs+OLNiwFfYafTaT8d4vKui
 30JmD1WbeVttNcP4rpPiGTUHKYiYCA5gNyvXFegMsg5SPhtg/ZebXG9VdlmAXBA2hgwvrX69Dgy
 i3LIW4jaLpHHTtH9oVsInOsp8nahd7Gh9/TNU+KSXilPeqHyCB228aREL7iFcxQ04j3cICuhD7P
 A4JfoS6gS0Bp2Y5UtP1s0YntDT43bZGf9n4GaIDCt5sfwueSWQZemIL8ANOwAPjhcJDCNB/cH9g
 0HDywVLx9p6ugDwafnKDak2WaombYYAUo9Xqdvov7mbEmHLs24W40Q5yL7apwHNpiDGFyKYnk7+
 7fsoyMZeibAISIUcXjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182

On Thu, Feb 26, 2026 at 08:32:34AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  4 +++
>  tools/testing/selftests/kvm/steal_time.c      | 25 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
> index ec787b97cf184..90567f8243fe9 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_types.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
> @@ -17,4 +17,8 @@
>  typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
>  typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
>  
> +#if defined(__riscv)

Why this #if ? INVALID_GPA is common to all architectures (see
include/linux/kvm_types.h). That's why I suggested putting it in this
shared header.

> +#define INVALID_GPA (~(uint64_t)0)
> +#endif
> +
>  #endif /* SELFTEST_KVM_UTIL_TYPES_H */
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 6f77df4deaad3..e90aad9561ff7 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -324,6 +324,31 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV |
> +			 KVM_REG_SIZE_ULONG |
> +			 KVM_REG_RISCV_SBI_STATE |
> +			 KVM_REG_RISCV_SBI_STA |
> +			 KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }
>  
>  #endif
> -- 
> 2.34.1
>

Thanks,
drew
