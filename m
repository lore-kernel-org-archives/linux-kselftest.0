Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F529386C1B
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230491; cv=none; b=l/j05PrcpbDHZiSae2C1BTVrBSmEss0MK/DBgmjAUMd9baS+0XMkKuww4JxlxH0fyoqynQ+J/xhod7k6Pob0qvJlE+9uI106q4XblmMU/SoqDrHh/QmfJHWl520C+V2Xet/WYddcEfxfghibon8hu0uykXzfuMsTqYrq5PpUbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230491; c=relaxed/simple;
	bh=lfabr63jQizVnrBI1g724BS3W85SNOmSpAe5IvwLLaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVvwq8rfuAKNNgFqFMlNuvGebUfuD5LUJ0yfwOwf8AwyRN9aqtzJsFCtro2K+3tQRU/SGy01TiR4RqzR1fdjHNYOFthEhOSpUGiR5wuqatWMkKkVEjBAIZSekDxPtp4Xw9s2Zjdjbi/MRCHZqlxJi2iB4QHwVN3gAU/POAK3+/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBOTH5US; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBOTH5US"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66132b22182so8157503a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230488; x=1773835288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSs03vKecjzDF1VoMO+y/2LecDhgaBTeL52G3xYHcfk=;
        b=uBOTH5US3UAb9axODqSebwAJpaiEH8Kw/HdYHtvIkp0GKqvV1JWCOlDy2bPoQANegr
         JeQ/3oanQW33n6AB8i9+8P1WZ8GE/9k85mxrN/cG59j5v8iWi2rB4AYU/JN2zK1Xo6TJ
         rhuqSwWIRQqzJd6vwt5SmVKrTBubGlHtwDPQW+4cMvZ4SzL3YrbgzI+8cQ02B45DN5Bv
         L/VHesA5PCdIv6kHryCPdcNhz1h9Ej8wNf49BEc5sq1nI6Yf4poggmo32t0WLOACGM++
         xMn3xQ2h6xP12wkgvA+qChGlgyDKgRuynZ3PvzC0Fs7MLCyyL0h3v6pbRFkqzwb/iFnG
         MpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230488; x=1773835288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSs03vKecjzDF1VoMO+y/2LecDhgaBTeL52G3xYHcfk=;
        b=Lg6EFFqpGmfzIc0+W0btNGzH6zLo2jRZHgCeRgz2Nxo/xd2WJtYFaCsebcJDIv9dBU
         o0uqO0JjJNXUHLSTcsqmA7EWFwsiPygkiEKhVnTdaJ5YbAL960/Ddxdjyrl2qqkwm3n3
         VeHQk/shS5+gOQtOlFkqhQ8n4Dz+6mfduWYO9sY2dyyJG516FgNRTVZfK44/4XBJervp
         rRMNm6Dh+6j8FWrJ8TKvPOXmObWcUIyHZrKUun0OBa+2H5bMpNBwVsb7JpmOEfLVg6Ce
         XeZbl1V/Ujsg42PFoibpXTmPbD9YZbVoHjSq6PHnAI3HDyE8yulH/GGF1nCfwpbUDk4N
         W4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXnpS80l12ISUraT8J7OkkcMep0xkpaw1qOrr41OzmP3Bub4Mx8EUUtoiYOXPl9LPEw37PJtoMhW319+Rgim6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAC7+h+u0D8IS1+SkYjo+kmk8cmVZr6bEDERxEYEdNmRPg3yJ
	eqkYDpmZDeEHRZGV2bicFqhIxhL4faHluT6ANY/cZaU8i7jtWHo2fZWVXpj3fHuqAIg=
X-Gm-Gg: ATEYQzwHwa9oDkiwibC+4zEobGEUiCCnyrj4ujPo+wnGyQ5Ew4eRePKDFCH9PNG224L
	dXLXfuYgZbIO1FeF3ugk1wJ5LxXTRoJ7jOkGmvckNa3dz6p9FSXCUgc4LIjrz0knZ5TNJLrxI+J
	xKwGs70LYVou3ji3MMBNEwfZBB52qPmZSdfk43IFbBy0LsnyaVtA810wQQBpxzMez6arxzbt2sg
	FXULs0DkuII5KjHTMySZSgx1LpMJX0fUs82ozPfc9ELOcEZ7ukcDa9kT1oqhHKbPKsWTuw8CvUK
	aQkxCbHdu/1Kq2UHR37Hzyagq7O3e8fhvMTTEysjpDyy/4emyL6NxW1A8ZYT/zPWJRwJ7nntR2G
	zGFLTFh6IW4nuRbsKKGraJth7llp0JL9j24/os0DhXF8GCGUEZpgfmtHSw70VIGYE5UkGh1yxSx
	rRTtnAUlz9pCDT3BKQf0Rk4y5mUK5D
X-Received: by 2002:a05:6402:3514:b0:662:bb58:602c with SMTP id 4fb4d7f45d1cf-66319ee3efdmr1270923a12.29.1773230487607;
        Wed, 11 Mar 2026 05:01:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6631503c903sm476518a12.20.2026.03.11.05.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:01:27 -0700 (PDT)
Message-ID: <68a93eb5-24df-4b73-bd1e-798dc32b7e86@linaro.org>
Date: Wed, 11 Mar 2026 12:01:26 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] KVM: arm64: Context swap Partitioned PMU guest
 registers
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260209221414.2169465-1-coltonlewis@google.com>
 <20260209221414.2169465-12-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-12-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2026 10:14 pm, Colton Lewis wrote:
> Save and restore newly untrapped registers that can be directly
> accessed by the guest when the PMU is partitioned.
> 
> * PMEVCNTRn_EL0
> * PMCCNTR_EL0
> * PMSELR_EL0
> * PMCR_EL0
> * PMCNTEN_EL0
> * PMINTEN_EL1
> 
> If we know we are not partitioned (that is, using the emulated vPMU),
> then return immediately. A later patch will make this lazy so the
> context swaps don't happen unless the guest has accessed the PMU.
> 
> PMEVTYPER is handled in a following patch since we must apply the KVM
> event filter before writing values to hardware.
> 
> PMOVS guest counters are cleared to avoid the possibility of
> generating spurious interrupts when PMINTEN is written. This is fine
> because the virtual register for PMOVS is always the canonical value.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/kvm/arm.c        |   2 +
>   arch/arm64/kvm/pmu-direct.c | 123 ++++++++++++++++++++++++++++++++++++
>   include/kvm/arm_pmu.h       |   4 ++
>   3 files changed, 129 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 620a465248d1b..adbe79264c032 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -635,6 +635,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   		kvm_vcpu_load_vhe(vcpu);
>   	kvm_arch_vcpu_load_fp(vcpu);
>   	kvm_vcpu_pmu_restore_guest(vcpu);
> +	kvm_pmu_load(vcpu);
>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>   
> @@ -676,6 +677,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   	kvm_timer_vcpu_put(vcpu);
>   	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
> +	kvm_pmu_put(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index f2e6b1eea8bd6..b07b521543478 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -9,6 +9,7 @@
>   #include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
> +#include <asm/kvm_emulate.h>
>   
>   /**
>    * has_host_pmu_partition_support() - Determine if partitioning is possible
> @@ -163,3 +164,125 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>   
>   	return *host_data_ptr(nr_event_counters);
>   }
> +
> +/**
> + * kvm_pmu_load() - Load untrapped PMU registers
> + * @vcpu: Pointer to struct kvm_vcpu
> + *
> + * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
> + * to only bits belonging to guest-reserved counters and leave
> + * host-reserved counters alone in bitmask registers.
> + */
> +void kvm_pmu_load(struct kvm_vcpu *vcpu)
> +{
> +	struct arm_pmu *pmu;
> +	unsigned long guest_counters;
> +	u64 mask;
> +	u8 i;
> +	u64 val;
> +
> +	/*
> +	 * If we aren't guest-owned then we know the guest isn't using
> +	 * the PMU anyway, so no need to bother with the swap.
> +	 */
> +	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
> +		return;
> +
> +	preempt_disable();
> +
> +	pmu = vcpu->kvm->arch.arm_pmu;
> +	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +
> +	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> +		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
> +
> +		write_sysreg(i, pmselr_el0);
> +		write_sysreg(val, pmxevcntr_el0);

This needs to have a special case for ARMV8_PMU_CYCLE_IDX because you 
can't use pmxevcntr_el0 to read or write PMCCNTR_EL0:

D24.5.22:

   SEL 0b11111      Select the cycle counter, PMCCNTR_EL0:

                    MRS and MSR of PMXEVCNTR_EL0 are CONSTRAINED
                    UNPREDICTABLE.

There are 3 separate instances of the same thing in the patches. I was 
getting undefined instruction errors on my Radxa O6 board until they 
were all fixed.

