Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F4366821
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773090506; cv=none; b=g3wAyTdq76OlB7EzDGSwZGWZGfNYBFar1F3PjtT515m/pKaB1tueTmhEgS6BbOnvu+rFx6ojADJtqB1+FpW9MFcb4aU5xFtvbjrg47C67xdJo+UAluLsV0ZhfEIhoAsq2oUvPFe9NPxdXDsAXbtg1NY7pqKJm7F+Qh0RzsnqG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773090506; c=relaxed/simple;
	bh=AAEnVusCWjAu6kaeT1Evg43XXo1koxjTykrLqENhNmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9VE7JYVEiZ5YshgUeo22wGd6C36sInZS5rZZYKVMRHws7ggwcdDmzSLQ76eeHmdtyfHcBDvxVpnvGy6SaZajlNYmA5u5nXjgAG7++NFA2qoaOrqmdJ0+y4IS80umkAVpoDA/FCWIAK121YNsDe6yoNcp3CZY+vKB9jc/rWn5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nplfjnct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJVZuILH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nplfjnct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJVZuILH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBsZu2427675
	for <linux-kselftest@vger.kernel.org>; Mon, 9 Mar 2026 21:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nSbzkDwBPRaYpRnCfxJmoB29
	DAa3utuyviPQ9bddc+A=; b=nplfjnct7T5BY07oCd9rLA9MHC9/oWckJDTOb3Uo
	cLigm7RZLTG1/2RYGl+HxMOrwiVIlmsfct8Plleo0oHCGnnT/sywHEzDQ6Ndu1vb
	5r+Y167t7c8UPHF1DidARzicVi25hIhb/G/inphILEYHN/rVi+CTaH2bjytYfW8A
	/SCKYSDORCGI9aYYs7enVVZBmRDx8hLcet0+R1MYhFpOnH/XfrzNmOJGfIKNxsRc
	BDZozzaR5CidCsNXt90TyVhe5PZgKOnuQj0+x0vkNTX5BX4vun6kq0nJUXobB9MS
	R8AjEGvjbxNcjNDE1JN7RsTv/Ps+N78J91l52mU+g2qzrA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks0fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 21:08:24 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4670a0ad001so4852990b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773090504; x=1773695304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSbzkDwBPRaYpRnCfxJmoB29DAa3utuyviPQ9bddc+A=;
        b=GJVZuILHVv7RJttjxAGm8kXMaSZTxocyaoRJDSuXrKHIIvW497AdTjC+WCcQMGB73z
         noDMZcqdGk/DAoE52HhIS0mllhqm0Y7ZzC3b1WAEcAO+OLqRmM/60KesZkbvVXb85O0n
         +2c5XHajzLhH0gfbBTnmZEEq5l07L3b4iykFl2Z4ITernNHUnpXmTVnFrM4Btavtn/7e
         a9Vz/xXi6vHmEd5/6/JhxuTXKfpdIzliF/8D7WADDxHknvdqVemQg9wsd8R7Okxpc3ku
         byAOif3pEocsfNNGuy9Ftf+fi0EtgSAJL8BMsVgwT/SDfywqkLKjKV8Vw9SecxQRXA9s
         wFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773090504; x=1773695304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSbzkDwBPRaYpRnCfxJmoB29DAa3utuyviPQ9bddc+A=;
        b=Nk+gnrNMMeMXJmpO41VsXWh5kYeKxnb6ZgX6P6HsHzg4PFIEOOGmZKtET5oABx4Urf
         ZXowKh2fiBWziQcZTnxK2K4iAY5RelezyLnielLaUtuu2H6yRnOpmfAueDELNgzNlqVi
         fSJQKe/6vd0im0hIkJ7wwvyD8OWdEf93ndQhWm2H75UM3aAPEJSR0bmAMqYgFzsH274g
         +S8JbqxmI4O5dQyVPe9h3h5TXToyDCRZ41MrJZG1WmXzA7E9MusMtc/shSumhq2bFoYt
         DkmQiTyA7E2W0T8Bl9Gh0IFlF2PoJt3RNlMfMdHy/zJzdbBS1JudJwhPXEdTPJXwzfBH
         WH3A==
X-Forwarded-Encrypted: i=1; AJvYcCWvrM+2PhbiBCQQ2CXuv7wd86cdXZBCEvTT7Q7M4HHA32A9GjAcwxrE7W7CEGDePYNlAsQclMb4Jl3cdIAY9Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDq44hmg0IRJUhgWXz0MLUROFyRe+BRD3CkKcsWg0UzjvAV0Df
	dK2sqZIN9zA/sJ1yMKZon0pY6d9MIOoxOSUL+lr8wgiZJfObBd6f25MqFiGfPDcciZpSWmuU1iX
	p/JhErmx+0eCqPySaNElet8r89iJbEDGYXh5iHa+0vuucWk8PWTRiuvcSSu1f9tWwgMFLzCU=
X-Gm-Gg: ATEYQzxHElbH643rvgPfSyt3WFf/ggUIdKt5us1nl0Jxhs696aAQU5oKZ9HdEdoyNaL
	6WQNQP4Pre827Dl4cIub5H26gf+aulS9Zksz/WoIzObMWwuhb+300HJ/M91w9MQ5xJ9cb7d0V5A
	a6ZCjIevgvVIkOS2MDdSKoDe8U/G4ThnSJxezTnWTwwxlrKFFDUQvvV+22+4MMt8YZkgTD7WIeN
	h06rJeHzz3ojE5sRQ9mPGXux/iJHNY3uJEMWHCm2YQc4jdo8MmCcMNJhwXca5tpbS96FRob+MmV
	HG7wb5o1/g5UzxoKrP1EVPK+7mdLavF0NGyUlYw3lHbqXifCSu+f7ALdPfRKi4IeO6r7KpSTiWo
	H7E/Jsmu5flufGPHSlAZs5kO73IUDr38=
X-Received: by 2002:a05:6808:13d2:b0:44f:ec23:2375 with SMTP id 5614622812f47-466dc9f4904mr6094421b6e.3.1773090503798;
        Mon, 09 Mar 2026 14:08:23 -0700 (PDT)
X-Received: by 2002:a05:6808:13d2:b0:44f:ec23:2375 with SMTP id 5614622812f47-466dc9f4904mr6094396b6e.3.1773090503364;
        Mon, 09 Mar 2026 14:08:23 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756ac68a0sm732921fac.1.2026.03.09.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:08:22 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:08:22 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: selftests: Fix firmware counter read
 in sbi_pmu_test
Message-ID: <xugt36h4v3ub7jfhvn22jyos7qiiujxg4bjfaf7djx26qbdwv5@w6nqwxbnr6tw>
References: <20260308023803.4001232-1-xujiakai2025@iscas.ac.cn>
 <20260308023803.4001232-3-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308023803.4001232-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: f0YIrs1nzj9MZY3-Sg51XYV00CqSbLC5
X-Proofpoint-ORIG-GUID: f0YIrs1nzj9MZY3-Sg51XYV00CqSbLC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfXw0197GeInkWW
 bA9o9n+xTAL9la6rqio7CQY7K9xUq/1Tacjewv7xuXMqS9Z9woCaKSgGQ/4fF0Fa5+Xa9A66EF4
 wcJl5OOnN+t9MrL4TPmBCpnQFk9cim1iWtosaPSirLbJnou6bjR0jP+xRKbSu/bPoTpaL5HgHYB
 mSSBxUHuqc8mQs1c2LgAnM35DnH207KOE57sjMWBDIrQm52pOv8ZZH0zQEgnilY9TuI7jtV6J6z
 Jjx3EQoEs2Vap/uzA3yS23DbfWY9rA7q4ppzWWNWIWMCvig+SFVAP7vu6g/o8fxGhsFq/cUARoL
 RDyX+ME4Mmfouc3YaPMuxvpo782QR3C1mTzx0GDo4JRFnyuHhJM/JQiK8d0kWfReBjN0MXi8fU4
 EU8eA5bXeH4xAb6JtDiIIJxdq99n9FEjc4p6xjpkYd5RX3hQbvHlLrILqBJzgMvTzu5wfXwD0+7
 +O/IAmuHpWLqtpFni7A==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af36c8 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=NAliUCYIZW1AzauYvT4A:9 a=CjuIK1q_8ugA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090188

On Sun, Mar 08, 2026 at 02:38:03AM +0000, Jiakai Xu wrote:
> The current sbi_pmu_test attempts to read firmware counters without
> configuring them first with SBI_EXT_PMU_COUNTER_CFG_MATCH.
> 
> Previously this did not fail because KVM incorrectly allowed the read
> and accessed fw_event[] with an out-of-bounds index when the counter
> was unconfigured. After fixing that bug, the read now correctly returns
> SBI_ERR_INVALID_PARAM, causing the selftest to fail.
> 
> Update the test to configure a firmware event before reading the
> counter. Also add a negative test to ensure that attempting to read an
> unconfigured firmware counter fails gracefully.
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  .../testing/selftests/kvm/include/riscv/sbi.h | 28 +++++++++++++++++++
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 16 ++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> index 046b432ae896..8c172422f386 100644
> --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -97,6 +97,34 @@ enum sbi_pmu_hw_generic_events_t {
>  	SBI_PMU_HW_GENERAL_MAX,
>  };
>  
> +enum sbi_pmu_fw_generic_events_t {
> +	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
> +	SBI_PMU_FW_MISALIGNED_STORE	= 1,
> +	SBI_PMU_FW_ACCESS_LOAD		= 2,
> +	SBI_PMU_FW_ACCESS_STORE		= 3,
> +	SBI_PMU_FW_ILLEGAL_INSN		= 4,
> +	SBI_PMU_FW_SET_TIMER		= 5,
> +	SBI_PMU_FW_IPI_SENT		= 6,
> +	SBI_PMU_FW_IPI_RCVD		= 7,
> +	SBI_PMU_FW_FENCE_I_SENT		= 8,
> +	SBI_PMU_FW_FENCE_I_RCVD		= 9,
> +	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
> +	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
> +	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
> +
> +	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
> +	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> +	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> +
> +	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
> +	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> +	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> +	SBI_PMU_FW_MAX,
> +};
> +
>  /* SBI PMU counter types */
>  enum sbi_pmu_ctr_type {
>  	SBI_PMU_CTR_TYPE_HW = 0x0,
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 924a335d2262..9b7e28bec435 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -461,7 +461,21 @@ static void test_pmu_basic_sanity(void)
>  			pmu_csr_read_num(ctrinfo.csr);
>  			GUEST_ASSERT(illegal_handler_invoked);
>  		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> -			read_fw_counter(i, ctrinfo);
> +			/* Read without configure should fail */
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
> +					i, 0, 0, 0, 0, 0);
> +			GUEST_ASSERT(ret.error == SBI_ERR_INVALID_PARAM);
> +
> +			/*
> +			 * Try to configure with a common firmware event.
> +			 * If configuration succeeds, verify we can read it.
> +			 */
> +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> +					i, 1, 0, SBI_PMU_FW_ACCESS_LOAD, 0, 0);
> +			if (ret.error == 0 &&
> +				ret.value < RISCV_MAX_PMU_COUNTERS &&
> +				(BIT(ret.value) & counter_mask_available))
> +				read_fw_counter(i, ctrinfo);

We don't need the 'BIT(ret.value) & counter_mask_available' test. Instead
we should assert that ret.value == i.

  if (ret.error == 0) {
     GUEST_ASSERT(ret.value == i);
     read_fw_counter(i, ctrinfo);
  }

Thanks,
drew
