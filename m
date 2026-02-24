Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB334B404
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771972561; cv=none; b=Iy2SSNNawzrjory1NH7qpTRsE1AI27Xl14qLd9Ydm8gMXQVsyqNy1MEjFLD+2PqXWFPFh5orKiy/LMC3u116ASFaQLtGXOLFKIyoCMZuxW+x+P54h9NnLxeLyPsqbV9J/l3z4PkDOjfp9z0Wki6ryZRLNqfWUMbrPiU4UGALvN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771972561; c=relaxed/simple;
	bh=7EwQ6oQQyIRq85yz5opuGyABoTjNzwzriqGwJQ6cioo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/p/pR7qwfcPOcfkJw477qzwffJ3p2BwVb2gjAHgwnsFhoqLRti7Omqk7C/mEA+BcdkUiqjUgDAvfpW+RxXLRVw7zt/Ivgj9dLq9Nz5z8AxKgTDy6Co7TMv3ma8Ta66oRNy2R56btMis6bIiXTumBy585hRai5+d87+NH0CQJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XX7g7Ft0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Is9jJrgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX7g7Ft0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Is9jJrgE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OI0uUM2006547
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jl3/kGLy/uiPn4E9pCww6rxR
	H2A13SEeo46Ae3ywkm8=; b=XX7g7Ft0xLvppEfCX8r7ER8OMh4f6cTzRW7dZQh4
	mdVLfHdvzZ4Jm0VmMGs8S9EI/Y4DHbe+bTNRbQ19fQMgyH5CpiCyPjfFuMxuABHD
	Y+2AuJ2RnGRO5Zuj6YZ2kw+kocvRKVcnmxMDub3GHTYW9JIwaknLrLFqaQaq33Px
	8iZomqe07aMpgVANr0o5rXVVmWycHRPgu21YvPrlx9DAxvyaACW1w0rGd/pamkWD
	e3EAoijW0pBfyEBlmqhQjggxFPHqdeLBvsYaFO/ibdLuHgqc30E8qeVAwsFxgb9w
	3GaMKCADAWcLiQ4n6lGVSB2mWQQno3Hftd5NcV706zjxgQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch456ber7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:35:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bd2a2028c5so8851397eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771972557; x=1772577357; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=Is9jJrgE3WnHdcO6sropwSKdQe95qwSAzscLMyWlRWZ0YZ3mCPTWnWpkBnwf/AHJja
         ccKfX/OK92sMVvGrWQXGLSreRWjjnqF4fnQy5GFonfOSN/cCA60qIOVhqFmEoPlbCOMn
         VH2D+zEfJyX8bJYBQQ02r8f/rNW1iGswGmcPJ0Ibj8xXBxNq+LZsn1gz/6edhOzWgGfR
         ODTI/s23Hs6Uw/sAVTvwI9Z1YWSP0EGCMDN0SW/CJSpSIWVjgN81eAy9gpIvpU67QpkF
         Ut6KAtWfw4wYuHc3SC1o4xUEG8DyHNccIFfTOsMxMjEovD+QHWwbDEBaCyzJGI/HkyRg
         qpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771972557; x=1772577357;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jl3/kGLy/uiPn4E9pCww6rxRH2A13SEeo46Ae3ywkm8=;
        b=SbpZIkPCkkn2Z/rlMmUdtNXszpApyIVP50d0/IfpobHJwI07+fa+6LdAFQf3rz/OQ0
         RMFb3P7lIr6Aba/IRKYcxCrdcZeY1kVzSa6e5qxT6a8w7oPnJQxeh2bpeGbmkMHEo5IZ
         9nlf6C0cCHhepVcaMxhw+7iLH6rhOlEXBJmuA9NxPDfVF9pX0EcohAOLub0UGkhvthcZ
         cM77cAT0nRFfygLobuMtHFC6NTomeGhPN1Oksm2XJ1EwgT7C0MO5MTFht5b1lqliBI8L
         wwgWHrO1HUDMgtIuZSuDuEbxu7Ag3iUlrgwU0ATX/8mAtY8VyUyZdjXQw08qlDuOc0om
         w14w==
X-Forwarded-Encrypted: i=1; AJvYcCWSZUHGHkaIn4RTbkNWTv7Ys3iBe/7U0bVlG9xpXDy0nyb2v8BHrKFVWOCxWTrdAjnnvJdOPNB2u/pSmcE/BNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YypORuEXz/m0fT43KU6pvwO2umM+Wp0p2RCoHKn7Q7reseIhRFS
	5894S8AGlkYrFmmPYgErr58kj6GIrJqM18NciYsZaMVtV+5aDqKGx3iSqJn7N6gU//K22HxQLi9
	dRabivW5lApQQLVU1zsOBLClFcQy0KHiAtvltNHA0DC6PIWrXSL8UNWgHbyCfE+vOK0DZuns=
X-Gm-Gg: ATEYQzy2YrK8y6dOutdpMQ57Z+CYAFxqLrvcyczFIBZUCbYshAAUQiyiyCYoN+vILiH
	alkmjCoeNbBCTPIV6Hn7zrTcSthkMJkekTk7kqAM3FVd9zBDm9f7O4JPzzPZB7Vazpi/1/IxcSG
	JwwbLCVEgcjXqnZfpE8/TKXGVRiUAE7WlL7SoolARJh2Xi5CVVcKNsvJrzH4eedfdwI7wWMy7dU
	zWEv47TNsiP78N69y0N6qQwqkUMt50q1VPq4I1pWc7YD6uN8x8NOBw4gfzV2e6blVIvxfJuQ/iR
	Gr9tHpAM+aYsHXDZ0Ew61zggZ6P5x0s8Jko3IGTD7hsNShgKXC2wApC/CTt+nM3jeN0Sfy4hFpl
	LknVA+9SPpQ+OuOxbwJtPlkjc4VvwVDA=
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50760eec.12.1771972557378;
        Tue, 24 Feb 2026 14:35:57 -0800 (PST)
X-Received: by 2002:a05:7301:1e92:b0:2ba:9115:2fab with SMTP id 5a478bee46e88-2bdc31a9008mr50743eec.12.1771972556842;
        Tue, 24 Feb 2026 14:35:56 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm8327254eec.20.2026.02.24.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:35:55 -0800 (PST)
Date: Tue, 24 Feb 2026 16:35:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v7 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <7spmby7jcusyegus2knlhb7nvnyk5c3yz4z5luu6piymj6rwsv@zgktge5bmgd5>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
 <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: aIb0nJKnruGl5SSr73taKPxvV5MzKylZ
X-Proofpoint-ORIG-GUID: aIb0nJKnruGl5SSr73taKPxvV5MzKylZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5NyBTYWx0ZWRfXyTInzIroi5o1
 xbYJzgjbbkRHtuxs/qEzUuVfCpu4Ac/xLuoA/j1wuT9wgCpacvqd9sn+JUsQ3S54Q/qqIOkEyz8
 NWvXQ8AS2UYy1mviVgX6xPg4TCoWsa7GQESWWrud2qeoAyKnq6qj8+6nCGxwD0AlLzTKfOn4ZtI
 e8YQ6xJ6DKIdxP/Mpb7EmhetoaVN8o+GdreWEwKtRuj3OoVZ+dKNSH3oT+Pf5cq0E0CqwoNIMJv
 6s7pflfL37k4rWSCidsmodzoXx5PhQQKBzleIZziG5BgavLKo5Fnn7FN1SL8uGquhlFZxsG5NuN
 ANIPCudllxLYiTnFJaK7NqyLBsm7oyNk+MrsyHFPAVOammRgDirIXa4M50PTotP0aCAJ7ba9r/L
 nWohT9M26Q0zTxkpuQ+r/bE7kJAJEaIJjWcqsFGGpEAToq8EtONyWXtPxqMv6fhTq6/75+kp3UE
 gbZNjty06vzrvb+PlOQ==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699e27ce cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=9ujUvY2DB1qyNZ7L-csA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240197

On Fri, Feb 13, 2026 at 10:35:57AM +0000, Jiakai Xu wrote:
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
> V6 -> V7: 
> - Removed RISCV_SBI_STA_REG() macro addition and used existing 
> KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
> - Refined assertion messages per review feedback.
> - Split into two patches per Andrew Jones' suggestion:
>     Refactored UAPI tests from steal_time_init() into dedicated 
>     check_steal_time_uapi() function and added empty stub for 
>     RISC-V.
>     Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  tools/testing/selftests/kvm/steal_time.c | 26 +++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index a814f6f3f8b41..2af7fd7513d55 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -233,6 +233,7 @@ static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  
>  /* SBI STA shmem must have 64-byte alignment */
>  #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
> +#define INVALID_GPA (~(u64)0)

This belongs in kvm_util_types.h

>  
>  static vm_paddr_t st_gpa[NR_VCPUS];
>  
> @@ -327,7 +328,30 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> -	/* RISC-V UAPI tests will be added in a subsequent patch */
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	/* Case 1: misaligned GPA */
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	/* Case 2: 64-byte aligned GPA */
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	/* Case 3: INVALID_GPA disables STA */
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }

I'd remove the 'Case 1', 'Case 2', text from the comments because it'll
be a pain to maintain when people want to add/remove test cases.

Thanks,
drew
