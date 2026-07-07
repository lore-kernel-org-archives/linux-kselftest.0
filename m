Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F697275AFD
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 02:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783392412; cv=none; b=IFKU41LzQD0nrLTfJ3CDQwtwWmaKtG6hgEpVh57jcegcUUn+WY27n8u/OjdO7YJhO3EF3ngAR4nA75k66hD1QYqY8AZma59o3A0rqEFU8UTov4MRpedNKmjm0pijXHGOzzGBnBnuRXwMPy2isPlbkdUaMiGiFyg3B8zIuwX5Xgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783392412; c=relaxed/simple;
	bh=lRiqjFf04MnEC+CrmqPUzkUqYQMTfmDEzEzuWOONfT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpIf51dANKibrOSsr1PxvRkuzXHKH3LBipLAXx565TbQi7xAjJO4ZJAkuQ2gVUAVPYFmPw3+7D8zWxuzesyQa6tw/tCHaLq86vNY6JwlpeCeirJn6lPyNuBnrzbZTp79cyK0x6tMyrKVxZwh59fvdicnTLrVkmBD43TgnFjf4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSOK6d5w; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSOK6d5w"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacd69a9c0so31182335ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783392411; x=1783997211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=PSOK6d5wToBiMcKpKbNuQ+9ANwLjDKobuGTLUdt8rcbGNp8m7u6Kw44JfQqbA9DV66
         GROu19/9jbCuGNw0maxjp1GKRjnxHHwRuUjxXJUMssoJIqCUIJt9g25ZqJimYzIkKWKD
         EgoJrOJ/zqB+NBqICoK9kC7Gp729c0W2ljJQsVVU3Rym5ITUubfhtn++9nt0tFiQIkGr
         HhPaxNAr25g+9x+dWq2CCFTFpAin+iFSxeHupOh8xCARfmZC+9M2UkFSyfaEssIi/kJ3
         /a5QIMDwwJBK40xsW03XLxGXAumJy3ly3VDFELKdoCQ/f13doW6FTzI4f+Vw9TBWajc6
         oS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783392411; x=1783997211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=TZc3RtHuBHfRdHLtPvlN7Yttz8jbkzU/K8kV1hSJplrjgckAIFZtWrqAaqSyyKNoTN
         B3dOgP14NEeUhdklC8d97oLOeZwFQXL2ZjQ0HwKhsa9w1cAW7nt9HvMd0vpUKSr8wrzV
         IojvssZpV3Mr7sLjWuJvsgk5NWJ046jQKHNyBJaxMRoxE/TjI/Cry5lVqKnDoaS7oXEC
         RavNOFQImIKFmIGPkBJ+m6gD2rXZN6eSnInJAheDyiP5nxonW0qfQeu3D3o+U4LztHAD
         IuAguhPtkkl6kPqZPEC/0VgaVBS8Otjo246WR5wZzvec+Y0nt74Sixecw+om+FBkGNMf
         ShbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbyoDypg/tnR+3bzyiqiwQzF6m+dmPFjhWO51qr2Ic2ye9Omn4nES1adrijgYzclCG4DWP5g2ifwQvyTHgVs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AgLPwK36zm+aNfBl4JuJhCn7PyxYUQATY7HRfmALJX5RFBKE
	wsKZ+JO17LpqEhxBBWnttyA3fx0c/5QCLfxCZkglI1HOJRjv/fg2Ly49
X-Gm-Gg: AfdE7cnWWGBD1QoySSVqAGE5VS6oYhdOHR4xWdfXJ5wQvxhsZ9TDXFjdV/2EfIz8VuC
	pZ81rNjwXJe3mGyUnB7ohdqs9riQ1dEi9XEIVIG3xe2e5JysTybKwI6fw7/VZmR6Ae3DWmOGikv
	dDDUeTalpEV26b7mUk45eSrAvvzfAfH3gNCUmnfOi39rv7IOtYxULItwFhe6KyqmzajVWIr8Jp3
	Tbieeuc99yu8WyTkRMwAf5DC9wK6UWj/VsllGx/Xyd2ZQAGA3Q/BHaznNDHjf/w9YuTQcCXrXn+
	bYQ2NA7yQNrp338G8dhoYQYpJ9pYaH2r/YyDekbEp/tx2BtyQHAulYt+0uYdHNECf/Upkw/uwAp
	9D6C/EcnmRWEic1KmdyEtbWkSEIx3vvdkckVCn6o+cTMx0D8H5CM9mLwWsw7qAIWA
X-Received: by 2002:a17:903:1a0e:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2ccbe618242mr29826855ad.20.1783392410361;
        Mon, 06 Jul 2026 19:46:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm3388815ad.30.2026.07.06.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 19:46:49 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Deepak Gupta <debug@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Message-ID: <akxm_sT7R9u4OIXo@inochi.infowork>
References: <20260706022046.214956-1-inochiama@gmail.com>
 <20260706022046.214956-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706022046.214956-2-inochiama@gmail.com>

On Mon, Jul 06, 2026 at 10:20:37AM +0800, Inochi Amaoto wrote:
> Hardware updating of PTE A/D bits is controlled through ADUE bit in
> henvcfg Expose the feature only if both Svadu and Svade are supported
> for VS-mode.
> 
> Allow the VMM to enable/disable this feature by change the ISA
> extension state in the guest.
> 
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c    | 77 +++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 504e73305343..7bbea8812d92 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
>  struct kvm_riscv_sbi_fwft {
>  	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
>  	struct kvm_riscv_sbi_fwft_feature pointer_masking;
> +	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
>  };
>  
>  /* If you need to interpret the index values, here is the key: */
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index ab39ac464ffd..01db40b53295 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -11,6 +11,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/cpufeature.h>
>  #include <asm/sbi.h>
> +#include <asm/kvm_nacl.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  
> @@ -94,6 +95,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>  	return false;
>  }
>  
> +static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
> +					       u64 flag)
> +{
> +	vcpu->arch.cfg.henvcfg &= ~flag;
> +}
> +
> +static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long value, u64 flag)
> +{
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
> +
> +	if (value == 0)
> +		cfg->henvcfg &= ~flag;
> +	else if (value == 1)
> +		cfg->henvcfg |= flag;
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if (!one_reg_access) {
> +		ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			ncsr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
> +	}
> +
> +	return SBI_SUCCESS;
> +}
> +

Hi, Anup,

The sashiko bot point out calling NACL helper is not safe here as
preemption is not allowed when calling this_cpu_ptr() and it is 
used by the NACL helper. Since I have no idea about how to fix it,
is it acceptable to use csr read/write directly here as other FWFT
feature?

Regards,
Inochi


The original reply from the bot is 

Is it safe to call ncsr_write() here without preemption disabled?

KVM handles SBI ecalls with preemption enabled. The ncsr_write() macro
evaluates nacl_shmem(), which relies on this_cpu_ptr(). Using this_cpu_ptr()
with preemption enabled will trigger a CONFIG_DEBUG_PREEMPT warning.

Could the thread be migrated to another CPU after computing the pointer but
before writing to it, resulting in per-CPU memory corruption by writing to
the NACL shared memory of another physical CPU?

Additionally, when NACL is disabled, it falls back to csr_write(), which
writes directly to the physical CPU's host CSRs (CSR_HENVCFG). Could this
leave the host with modified hardware state if the vCPU thread migrates?


> +static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long *value, u64 flag)
> +{
> +	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
>  {
>  	return misaligned_traps_can_delegate();
> @@ -137,6 +177,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
>  	return SBI_SUCCESS;
>  }
>  
> +static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
> +{
> +	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
> +		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
> +}
> +
> +static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
> +		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long value)
> +{
> +	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long *value)
> +{
> +	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
>  #ifndef CONFIG_32BIT
>  
>  static bool try_to_set_pmm(unsigned long value)
> @@ -246,6 +314,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  		.set = kvm_sbi_fwft_set_misaligned_delegation,
>  		.get = kvm_sbi_fwft_get_misaligned_delegation,
>  	},
> +	{
> +		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
> +		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
> +				 sizeof(unsigned long),
> +		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
> +		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
> +		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
> +		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
> +	},
>  #ifndef CONFIG_32BIT
>  	{
>  		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
> -- 
> 2.55.0
> 
