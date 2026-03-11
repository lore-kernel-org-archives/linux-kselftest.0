Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE183D1704
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230447; cv=none; b=qBJ3dW2BrhOi8pNqaFiKtHaTgHrYKTTHyzpBHP7KOu09Sx3P8KrO2j+C8YU0nFkR60esqpXiwiNQhhRq0gz/MgoQTw0SLA4vHaPjB1nKk7duOSm2RGIO/Zob3cMy5lYZxJNCb6gP1D6YOYbKbTnC2HrXEO9nLL13xa/Uv1aSDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230447; c=relaxed/simple;
	bh=E92Lh4tvjrSsBZrvXHil80NIkNaNGxC/VtXNxe44axA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tu5n4LgTIxuA7uItjxzajQFdIdUQ392riDoJXKAdf8phADUnq+2BwO5YY99iQPbtlpbV8bRJGXkOuPOqXBpObJOyPQw7Hgxlrp62lmdm9Ni475QH6iYExTsDs8aJ/BQfiQbHk0B1iuJHifCHxlbF1bR7Ahzhk26CHfjiqpXqZQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6wX26v9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6wX26v9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso28200315e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230444; x=1773835244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=g6wX26v9+yQvJb3F8Phow6poKPlg3nGTyaNtQdwwjFyIgN8T1fGypOfR16znLPAo8Y
         E7FIrpiPTJbS3z0AeS1WTEU8UZA1CsoJUb/ZBwliNXUEF1FCKiCvxc5yEJKqX/v7rPvn
         z3Jo/EalJ9Wc6qe4j7xrU3NiCl+qwh07n6zG4jgd4K5EXTuL05IRZvZWfkWo1UdrHX65
         2kv0K5v0dmvT8417Au+ZB6jSU3lk/8J1WoP8dtvenDMog2TeZ38wO9X8y7xdxMotdX40
         yybsDoRB2OMx1kuQKW+XZy5oAMqleMn3GChsiomjtthkdNIKPYC1nMGOWNJkJSWZ/sM/
         fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230444; x=1773835244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=CFhrZgL0FcppN4H6KVbLS3ij5MUE3TVNiigGT/s2WDQmAtCrbTYQ/owe3oECqyvxPx
         bkieLzMDCKC6+b+ypV388Pv+MJxK/qZwLg7wpLT+J2tXl8vxX4l7ehngnf69hV+knTpw
         unhW9qpZcU5MJBtETIFf8Xdmq+Dt22VSVx4V9agxlI/n3ON4FHrUFpERuRFfXCkjuTGj
         s0sTcXCZs7FSQIzZeBYIPAOLnU1MlCy+xYLhv2gv2sPOy4W4sPDvOeSp54GjEn+wCxgF
         brnjwzdij6CyUTScsKa/R10SaHqOQIzeEBMjNRTPD3P1BZsYRtwDBqAL7+LQf8E5OLGq
         i07Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi19QHvz9qtnjBSBL2t4haa3RX/1ph1VX1hwJdcEqdZt2K7PrJUSBwYIxr/w9M61xygPrMMYucMXYvrZwrCKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMyt4Fm7ZQzBteed0nnDkr252fHDwUWe6ff2nTGMZVp/0JHp6
	dyd7t2t1OlCkKM9nuRqVobL65fG/8DD6kqBJ4/7eSgdyCGKXkwMEeMr1I+KwcgEq+tg=
X-Gm-Gg: ATEYQzyIVahqyKkxuIb4Qam4T3/2s1/MvafSTwnZedZTeyOyVGWXmAvlSia+M7uET5f
	ysKle3mJE3E8sxX5gC0+9MvRHDLVXuMe2XBG+0DP8ZWtlD/ukl4PXSObbIri34gSlSZdVF3xMse
	cruOKLgYU5FAZypTJbzaMdpX1Yv2XAdCJXyR2dwNo2DuvRuNKA+j5P7mU3diO99TOAAojzbrdg+
	pqxLBIrUekQ/PXRBwTQ/vZWThi0S250pVC9eSsuRPLQJppzNlaXQM124/uWivtF3P8Ep69JaQgQ
	aoZNLNIu+YOsjbE9CamtiK0A6bvq5nxDgQ0hmD7/rTp1GM4iKiHKhe2xE4FO69vS+imLVV3zuHu
	25GqC0ezU0VDm5uRCKOfpyndIph8Z9rS+ejBmdmrP218ykvbsvl3G+C4URfVB5/xMUnRK69kkpr
	QZkgQO58X7HsN+Ls6mHKf6A2b2hBNw
X-Received: by 2002:a05:600c:3b1c:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4854b123903mr37819645e9.24.1773230443521;
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm6957985f8f.6.2026.03.11.05.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Message-ID: <1e97d367-ae01-4cd2-8005-f690e6d7f72d@linaro.org>
Date: Wed, 11 Mar 2026 12:00:42 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] perf: arm_pmuv3: Keep out of guest counter
 partition
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
 <20260209221414.2169465-7-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-7-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2026 10:14 pm, Colton Lewis wrote:
> If the PMU is partitioned, keep the driver out of the guest counter
> partition and only use the host counter partition.
> 
> Define some functions that determine whether the PMU is partitioned
> and construct mutually exclusive bitmaps for testing which partition a
> particular counter is in. Note that despite their separate position in
> the bitmap, the cycle and instruction counters are always in the guest
> partition.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h | 18 +++++++
>   arch/arm64/kvm/pmu-direct.c      | 86 ++++++++++++++++++++++++++++++++
>   drivers/perf/arm_pmuv3.c         | 40 +++++++++++++--
>   include/kvm/arm_pmu.h            | 24 +++++++++
>   4 files changed, 164 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 154503f054886..bed4dfa755681 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -231,6 +231,24 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   }
>   
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
> +static inline void kvm_pmu_host_counters_enable(void) {}
> +static inline void kvm_pmu_host_counters_disable(void) {}
> +
> +static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	return false;
> +}
> +
> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
> +static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
>   
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 74e40e4915416..05ac38ec3ea20 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -5,6 +5,8 @@
>    */
>   
>   #include <linux/kvm_host.h>
> +#include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
>   
> @@ -20,3 +22,87 @@ bool has_host_pmu_partition_support(void)
>   	return has_vhe() &&
>   		system_supports_pmuv3();
>   }
> +
> +/**
> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Determine if given PMU is partitioned by looking at hpmn field. The
> + * PMU is partitioned if this field is less than the number of
> + * counters in the system.
> + *
> + * Return: True if the PMU is partitioned, false otherwise
> + */
> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	if (!pmu)
> +		return false;
> +
> +	return pmu->max_guest_counters >= 0 &&
> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
> +}
> +
> +/**
> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the host-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in HPMN..N
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
> +
> +	if (!kvm_pmu_is_partitioned(pmu))
> +		return ARMV8_PMU_CNT_MASK_ALL;
> +
> +	return GENMASK(nr_counters - 1, pmu->max_guest_counters);
> +}
> +
> +/**
> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the guest-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in 0..HPMN and the cycle and instruction counters.
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ARMV8_PMU_CNT_MASK_C & GENMASK(pmu->max_guest_counters - 1, 0);

This should be an | instead of an & otherwise it's always zero. None of 
the passed through counters count anything with it like this, although 
the cycle counter always worked even with this issue.

I'm not sure if the selftests that you added catch this? I didn't try 
running them but seems like checking for non zero counter values is a 
very easy thing to test.



