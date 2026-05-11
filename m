Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C3E3FF8B9
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 14:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510880; cv=none; b=U98NYgLQ+455dEx5heeS15+ZjhQ+M8ntfL40ljQefaigU+VNqCCUS8pHkRr/q2LRxb8fSmv+23XTJbPTt98Bl5Ir9gGoxxrkv/BT0Um7c23BLWbr1BdQ4noTt2EP1ixDLXRqwnvpfpfYBScM+06p6xVyhk6U2M0E9zJ86U6D5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510880; c=relaxed/simple;
	bh=iKF8FSLbp1eeIBdEg7i1+8WB8ugyhMDzVMP2Z+x3cvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=foZRYTRtTXhGf3qQjCSIuOlUynUxjRPPmTxCZhn/xL7AvPykMZM4L+8ULHWbIR0hoqv0Joj09a6dPUT0u1grEDK9lc8CqOSveuZcJ7vTMPq35pZ3u7RCTgS3aA5MAHoRMqU9MY8ifdZCWGP91YMe2orsbrSYgBmmYlc82WgdM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3nzTDZM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3nzTDZM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-453903ee4adso3823594f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778510877; x=1779115677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaxiXYaFYeaH8Qp4J3ioh2j1XsATKbSVhM9o5LlP7fw=;
        b=I3nzTDZMC8S2vFjW7pWeKWwY2BN1aYsrT+UaZXS8L66mVzzuTVJXvKr9ZTpLetccxz
         czN6ZZ6y04Fo+gDpwNzYeYWSsQbDIXx8LUEFIB39SvViv/v7aRfk1COZ4sR9pvZD0D3D
         v8U9C3v2Icher8p52wUOa/ah7XE05PwdcsA5xRqpqCrR7tNqYSr8aRbtP3SsZ/4lTzQG
         R4xb+cvkBLJozHYoX97n8IDp19uvswB4GGGofNloHOHYlCfxDxdCnwFKexwPltVwJE7F
         b84w+BmRhfod3y2hDT44dANWULDPvJHtSMsoFb0JPUPmzwd1KnO2PtZriuhRzSEX9Yym
         ywmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510877; x=1779115677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaxiXYaFYeaH8Qp4J3ioh2j1XsATKbSVhM9o5LlP7fw=;
        b=tXKqjAIDdZ4EeC/gACUvQWjRsUoaFgA2aVIQLEnlg3tHj03c5iby0Pla/JxtTBey7N
         U/rp0+HBy9hup1yL1uceDftPzx9WwB1ZughJPFIO3a4qE3wlBD51JidYAp+H/TawR+Ts
         3J4WgqptullvX/dNNmiq5GMFh0acm+0IweSA7lw6KcRgDpxehPVhw04pvD0WIY7UkVdX
         ceZbrLAEjD2EQAy9KjiUKcG9N2ZrSzPrH34YEi6ffAkIU6oXQAmVSpWIMu2mqdp991MY
         /qrtOGtUZy+aHGnprjDBV8v7Fi36AjQcv5A6WZGqUeZp5u+R/8Och0hoUEUjhj8Nc9zH
         b60g==
X-Forwarded-Encrypted: i=1; AFNElJ8K43hkaTOtv/1KUXUFYLnosIHa3yQXNTXPLm+9fDnCpbNglC0iLjMnHKzI68GC9AE2BYYInSdXx70RILSbIzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqpjJpNqxfqOStvs+SVEsVgoUpNJjOrMkyYtIkMKh9hukAdJpz
	xANw0/4Tz9nsEgUHwWFCPyhmpX1l7F24CWPnVclKJKSGu+i5+ttTMS+kdjXTPdjwl8w=
X-Gm-Gg: Acq92OGXJtiMJVIHNMSl10By3ToP1Uq3kT7VVCKzFlquJga1MmqQkBXee1nN0E3tg5W
	X9VzfAcFsAr/3eAUBqgRKmWye9uIGWqb68spqWQ1q0HKnp60a+k41aMP6+usaOeYvMAiDZVybfd
	PealZkhUpFLLa6/y0fb7Vcq3bDP+wKhICId7Ukk7pW8XVPN6HM8u+O/iMs4NAeoBIjL3JsDhNQM
	XpoggSGm5LQnIs22eH6HOhDinPPI0NanNDqJIHA+bNMj8fzo+mDy/be+++0ZFI9xwQYBXLrAI/z
	23CBFIq3e2s7gFd+Bso7VkSKODba2qP0OXekdZeMI1zaXUYwJpVbMuMICbKg90/SHmhusldOfgo
	IvcZpzqKkw3Lu1poJHXCwx9wLSAXHK22WYg6kQMT7g3cCVXBegfq2g9/rUCIKy5by7bOtAFaVLW
	BGy4pi34Fml4MmxLxwQ/DEGkLg01IozjijQohJ+cqbWBaJiQ26jQ==
X-Received: by 2002:a05:6000:543:b0:456:e591:4b84 with SMTP id ffacd0b85a97d-456e5914b94mr9935298f8f.3.1778510876575;
        Mon, 11 May 2026 07:47:56 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm27064913f8f.8.2026.05.11.07.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:47:56 -0700 (PDT)
Message-ID: <e2a7679d-e61a-43ac-a1d7-72f7e815c400@linaro.org>
Date: Mon, 11 May 2026 15:47:54 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter
 reservations
To: Colton Lewis <coltonlewis@google.com>
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
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org
References: <20260504211813.1804997-1-coltonlewis@google.com>
 <20260504211813.1804997-14-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504211813.1804997-14-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/05/2026 10:18 pm, Colton Lewis wrote:
> Apply dynamic guest counter reservations by checking if the requested
> guest mask collides with any events the host has scheduled and calling
> pmu_perf_resched_update() with a hook that updates the mask of
> available counters in between schedule out and schedule in.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++++++
>   include/linux/perf/arm_pmu.h |  1 +
>   2 files changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 2252d3b905db9..14cc419dbafad 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>   	return *host_data_ptr(nr_event_counters);
>   }
>   
> +/* Callback to update counter mask between perf scheduling */
> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
> +{
> +	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
> +	unsigned long *new_mask = data;
> +
> +	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
> +}
> +
> +/**
> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
> + * @cpu_pmu: struct arm_pmu to potentially modify
> + * @guest_mask: new guest mask for the pmu
> + *
> + * Check if guest counters will interfere with current host events and
> + * call into perf_pmu_resched_update if a reschedule is required.
> + */
> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64 guest_mask)
> +{
> +	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
> +	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
> +	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
> +	bool need_resched = false;
> +
> +	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
> +	bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
> +
> +	if (guest_mask) {
> +		/* Subtract guest counters from available host mask */
> +		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
> +
> +		/* Did we collide with an active host event? */
> +		if (bitmap_intersects(cpuc->used_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS)) {
> +			int idx;
> +
> +			need_resched = true;
> +			cpuc->host_squeezed = true;
> +
> +			/* Look for pinned events that are about to be preempted */
> +			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
> +				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
> +				    cpuc->events[idx]->attr.pinned) {
> +					pr_warn_ratelimited("perf: Pinned host event squeezed out by KVM guest PMU partition\n");

Hi Colton,

I get "perf: Pinned host event squeezed out by KVM guest PMU partition" 
even with arm_pmuv3.reserved_host_counters=3 for example. I would have 
expected any non zero value to stop the warning.

I think armv8pmu_get_single_idx() needs to be changed to allocate from 
the high end host counters first. A more complicated option would be 
checking to see if there are any non-pinned counters in the host 
reserved half when a new pinned counter is opened, then swapping the 
places of the new pinned and existing non-pinned counters so pinned 
always prefer being put into the host half. But it's probably not worth 
doing that.

James

> +					break;
> +				}
> +			}
> +		}
> +	} else {
> +		/*
> +		 * Restoring to hw_cntr_mask.
> +		 * Only resched if we previously squeezed an event.
> +		 */
> +		if (cpuc->host_squeezed) {
> +			need_resched = true;
> +			cpuc->host_squeezed = false;
> +		}
> +	}
> +
> +	if (need_resched) {
> +		/* Collision: run full perf reschedule */
> +		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
> +	} else {
> +		/* Host was never using guest counters anyway */
> +		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
> +	}
> +}
> +
>   /**
>    * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
>    * @pmu: Pointer to arm_pmu struct
> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
>   
>   	pmu = vcpu->kvm->arch.arm_pmu;
>   	guest_counters = kvm_pmu_guest_counter_mask(pmu);
> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>   	kvm_pmu_apply_event_filter(vcpu);
>   
>   	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>   	val = read_sysreg(pmintenset_el1);
>   	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
>   
> +	kvm_pmu_set_guest_counters(pmu, 0);
>   	preempt_enable();
>   }
> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
> index f7b000bb3eca8..63f88fec5e80f 100644
> --- a/include/linux/perf/arm_pmu.h
> +++ b/include/linux/perf/arm_pmu.h
> @@ -75,6 +75,7 @@ struct pmu_hw_events {
>   
>   	/* Active events requesting branch records */
>   	unsigned int		branch_users;
> +	bool host_squeezed;
>   };
>   
>   enum armpmu_attr_groups {

