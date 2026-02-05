Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7E31D725
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Feb 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770305398; cv=none; b=BSvPa+waHlDf/RVjNEwiXUqR3aJw/1VeotjVCi2hIe5bY/HrZC6gJId55DS/yQDuJipl8tIiNRP3aXyUX3ZxEiVgWpgv5l5eFLZYnX25o30fHNpMAbRZqfV/SCrA6JCcCGbqeTT8OnRYuvo0hofK7F4w2rDbjoOY1tAYEwKJZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770305398; c=relaxed/simple;
	bh=qJ1IoJrLaDLj41deaaBjJa8sn2zNujuIb/CrmnDqtiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIX70MmhVZTXFyNZGRzleBhdtQ+rFGL/q4tby8BzXQaCXjcDs0WosGDjpaUxG1oVxJfudKFLBCQbU6R96N+QreFU761KK8IxBq19z3Inhmnxtm2lxSYBrFmCa7qhW6pIVyvyhGMFJrurZaOpOieW5EpN46/anIwrJqRRLXG7CUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU35dBE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqH150lc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU35dBE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqH150lc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615EONoh4126461
	for <linux-kselftest@vger.kernel.org>; Thu, 5 Feb 2026 15:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cRJydN6XhmQwgdowUHd7ChTT
	rTbeIpI6IAID2mzzwGs=; b=KU35dBE8bwyUOW9VZSSEqC5HMrNA/wuXACQj6795
	zvdsS6+Pb0H9CAptu1SwDfntMKDOv8Rnv6uZFcrsxiFP1vpmqmkN2/6s21nWH2Kt
	fZPbvr9dYRhPE0toxed61NGV2Epni4Q5d4T67HtkQeWAD1XGPBwuZGhLxEXpww1q
	GQVlmvK5VSDbSxtyNuBGnYp5TAMTV1i07zxNzD9KMvkE+QfJCsm4w+eihPmSojFT
	JTe0ACLX6I4RYOLr01tFraq61Gwq4miX0yV0TGx3vu9amOuPqXowvxK5jwSKCC7l
	CL/MupKKfp6ThJhDQMiR7sqxKiqVqLQhFQ5HL/dV99vRBw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4vxhr6vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 15:29:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso1405255eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Feb 2026 07:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770305396; x=1770910196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRJydN6XhmQwgdowUHd7ChTTrTbeIpI6IAID2mzzwGs=;
        b=kqH150lcnrdL2PGVk1CNH0wQzaFoMnZP6PdbdSPZtqAQaez9V+BEsusIoRF0KuWaHc
         lnce3WZRXLMx+8oA9zvPiv1Q6jIdSZ/MJNosXDGf/zTlOAnfXgI+t9CAf6vMDgLiDgVg
         C3QAje5xhNnwKCJKR1e1pchVTStJiAFItPclBaurNKyibK9tJBE8iiVAHwGcu9HpqEvh
         ntmwPw0aEwbSAQDyBdCn1Pp5Fl5gWi4j2E7C5nIdSPpVDL9twZJiQy/Dw5sIaHoM3qSe
         ebSp5N2Zzq60gIau+9TQT3xksXaBpey1+P8FHw+by7H4cCnRYmu6KkYWItPVWNvEGiRo
         6zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770305396; x=1770910196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRJydN6XhmQwgdowUHd7ChTTrTbeIpI6IAID2mzzwGs=;
        b=XrZLYtv396zayiE7XCV6GI3UcgYb+/wkqjbIQKrV2gkveInHQ0gIxRWCOLDXmAfows
         bW4F5jbPvqWelNkKEXYtRTRHL0ex5M4atm+mJgfqNmZAlHZdItqFPXXDN22z+XCbVlvv
         7WVp+cF52VyD9E4sPDnnl5fmwpubZc56ZEU3wyUZc8UVEnXgeZjGG+92R/xQmSl4gQH1
         yWSHI2HuKhzg56KHejFG9EvnKHjDOSxjHo9O1bHfnABaecH+mmdoqWmxNsk/uhpWpye5
         7F5K8vcziC+wEHVHSk5zwoJ37IFLuouN4O7nupIXy1OdFgSiLPauY4JPxCNW3SBPe0MD
         CSCA==
X-Forwarded-Encrypted: i=1; AJvYcCXHfPnCua3AaRDPFsBr5KNryeuqo+1MnY5SbGhi62yRj+l9v7v8bFPZph+/b/MzE3uIYqEnfp6z9lHq2TyONyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDOMwXaYA1anRDL3mc9OJje2qVq9cLSXPwBqqCarXeYkAa1pvi
	/juEORj78okIHpQRek9/Wry/eZGL3XjDm/QTwubOHH16EcJfcHLkMKOta0fGsqvgWMMTKfHynmx
	6GRko+g0dsy+XVQ/wYYULvIbHwK3r+1nAO0XMA5Dm56xpXbI4OqjPSrtRA/IxY+F5ZP7baL8=
X-Gm-Gg: AZuq6aIT4yPlRW9LRXsDatc0ss18/Zxw+I5GxuPUO1zcDFGQUk9laJ11BBz4+2Jq5bs
	jzd613madNK3KDjOqrujA+s9LrGbE75NLi6wuszH2F0z6i7yxf5cCA/iaKhEozebvRcZ+j0uQtI
	Cyl6sw8oPyD93tiSjWJbdWpyxZ5kfiYSRs9MZoaCdMKEyeLwwOxMP9+qpRKcExfFm74QkxTyV2c
	tNp5LgUOejUAMtwjGP1HZn9ObozLxCXhaOBQXBWMPheAwC9NYrCViaGufrxVX20fvdrrngP7CRF
	cbv9wpL8Ku7GzOv3KY1jR0oanNcoVdlq3+YCqeJmPyr4Jkjf3aKvtCTueQduBwS+r10i32JGp8S
	VUWTDP3Wmq80iZoz6rlw=
X-Received: by 2002:a05:7022:6a5:b0:11d:fd41:62c8 with SMTP id a92af1059eb24-126fc2ef50bmr1459940c88.13.1770305396385;
        Thu, 05 Feb 2026 07:29:56 -0800 (PST)
X-Received: by 2002:a05:7022:6a5:b0:11d:fd41:62c8 with SMTP id a92af1059eb24-126fc2ef50bmr1459922c88.13.1770305395713;
        Thu, 05 Feb 2026 07:29:55 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503087esm4715815c88.12.2026.02.05.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:29:54 -0800 (PST)
Date: Thu, 5 Feb 2026 09:29:53 -0600
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
Subject: Re: [PATCH v6 1/2] RISC-V: KVM: Validate SBI STA shmem alignment in
  kvm_sbi_ext_sta_set_reg()
Message-ID: <zudnvpsirxbfjwh6plmj5utumgvj4tmzdddegneu3f22vfxdz3@dza2x6bur6pb>
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-2-xujiakai2025@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205010502.2554381-2-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=6984b775 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=9wIPkYZYpLDyJTQGRwgA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: iwFEH-HqPquR6n4vlmwziFYc5wB_6hd-
X-Proofpoint-ORIG-GUID: iwFEH-HqPquR6n4vlmwziFYc5wB_6hd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDExNiBTYWx0ZWRfX3EfUX8zrv2tP
 WT7MyjcJ9B+hY0qd7c31Ze3yv57UEPCfGulXQ5LbIguA/a5NaSAzeKJJmg9PE47hsQlXWNI/gA0
 rj8M6hPLsxm70fVbRWnitMEEJIAQ268auLIfA46LVRFtov5d1lt8xjPcWEBQiCCm6PZLpzwEOB5
 dhIEBjTSHjwpnTXhsOhEJDT3AfO/0V3HYdd29e7LSXZlsosF9bM/oIdKxQDoqRia4gnYjLIf24X
 LCSh/ngmRJShVGqyma37e0XXuYAzccETipybAmxvr/o3JSiOoXqTbHIB7uAiH9H7bLBUAzOax7u
 EyeDQN8zz0hilMzW1s8v3jse69C0V8wXWndBsHUk3EGzk8UxfK/wX6q+DMqgsSRAvG4p1VAu6LV
 LBjy7V1jyLyD44ckXuWs4xRmttUCtuyd/2fqxASqg/DAJJNnydC92hYXh7umIWGF2nY7uQ7Ke1L
 NwD2uaVbqWa8pWgGW5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050116

On Thu, Feb 05, 2026 at 01:05:01AM +0000, Jiakai Xu wrote:
> The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
> memory physical address to be 64-byte aligned, or set to all-ones to
> explicitly disable steal-time accounting.
> 
> KVM exposes the SBI STA shared memory configuration to userspace via
> KVM_SET_ONE_REG. However, the current implementation of
> kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
> shared memory address. As a result, userspace can install a misaligned
> shared memory address that violates the SBI specification.
> 
> Such an invalid configuration may later reach runtime code paths that
> assume a valid and properly aligned shared memory region. In particular,
> KVM_RUN can trigger the following WARN_ON in
> kvm_riscv_vcpu_record_steal_time():
> 
>   WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
>   kvm_riscv_vcpu_record_steal_time
> 
> WARN_ON paths are not expected to be reachable during normal runtime
> execution, and may result in a kernel panic when panic_on_warn is enabled.
> 
> Fix this by validating the computed shared memory GPA at the
> KVM_SET_ONE_REG boundary. A temporary GPA is constructed and checked
> before committing it to vcpu->arch.sta.shmem. The validation allows
> either a 64-byte aligned GPA or INVALID_GPA (all-ones), which disables
> STA as defined by the SBI specification.
> 
> This prevents invalid userspace state from reaching runtime code paths
> that assume SBI STA invariants and avoids unexpected WARN_ON behavior.
> 
> Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V5 -> V6: Initialized new_shmem to INVALID_GPA as suggested.
> V4 -> V5: Added parentheses to function name in subject.
> V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
>           Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
>           Added blank lines per review feedback.
> V2 -> V3: Added parentheses to function name in subject.
> V1 -> V2: Added Fixes tag.
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index afa0545c3bcfc..3b834709b429f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -181,6 +181,7 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  				   unsigned long reg_size, const void *reg_val)
>  {
>  	unsigned long value;
> +	gpa_t new_shmem = INVALID_GPA;
>  
>  	if (reg_size != sizeof(unsigned long))
>  		return -EINVAL;
> @@ -191,18 +192,18 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = value;
> -			vcpu->arch.sta.shmem |= hi << 32;
> +			new_shmem = value;
> +			new_shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = value;
> +			new_shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
> -			vcpu->arch.sta.shmem |= lo;
> +			new_shmem = ((gpa_t)value << 32);
> +			new_shmem |= lo;
>  		} else if (value != 0) {
>  			return -EINVAL;
>  		}
> @@ -211,6 +212,11 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		return -ENOENT;
>  	}
>  
> +	if (new_shmem != INVALID_GPA && !IS_ALIGNED(new_shmem, 64))
> +		return -EINVAL;
> +
> +	vcpu->arch.sta.shmem = new_shmem;
> +
>  	return 0;
>  }
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
