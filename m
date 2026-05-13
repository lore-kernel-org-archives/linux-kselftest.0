Received: from mail-oo1-f73.google.com (mail-oo1-f73.google.com [209.85.161.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1D34D90DD
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 16:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690760; cv=none; b=Z4tzN0jrnnpdyQqqysJf1HUArUkWj0jjO8WsoBRKXlzT3eNRn+n7tblRp4c2kv+2wcF8hVjhiGk1+scJkzFzp/I+kq6L8Ih7Py6bynsIcCyDwvSCJ9TvmvFAwT4EJBFybt1Qb0TvxOsQ0pNh7qX9dAz1JDDNgu953xF4o1255O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690760; c=relaxed/simple;
	bh=DlqmTumaylv3bvg7/UQlSYJC7l+houNcv4Gm+3/w3ps=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=ogctPHZ+CyQlcQPyBtbQfWOu2ijYAvZjXXrjKU4WqA/Qz+OAeOPgvRXjP95MkTwW4WDqT7GxVVxnPNHx+5iPwItC3LarpDEjhFnFvd2ezo4cfPcogi76cVahUMxIA183RGMZcOjkCyRBmok13BXYhs1IMffmZmeoJBNi8s/dnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aoxgs6gv; arc=none smtp.client-ip=209.85.161.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aoxgs6gv"
Received: by mail-oo1-f73.google.com with SMTP id 006d021491bc7-696906dddbbso8094131eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778690758; x=1779295558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aW/nYEiFxMS2z4I6C0K281BV66W1OxrZ+NF6ey1g5Rg=;
        b=aoxgs6gvKs1RbOgz0yN2UTq99fHyTq1CcdpccRYrBzCfb2IG+ptK0oyMOxdKoqkjzA
         EqXPC+YvjcPgUF+b4JjzE7XNuFRkrA6Wbn/NPWJKXPcqEtqqmANFGsilN7hKf+xepqmk
         V+7y2UrrOsi0PfO7RBUVMReThDPHFBrHso85Td9ziQqrtlCxZfPKJ7wtf1gmZ6mazBOW
         O0A78cKUHMxPWVMH7n0PzR1oZKfg9qDT7coy4oBfJM9rv48dGACL6QiddvjhOAWej7vb
         1WVj/tO5L3cBUTRn2dK8pWx7V/0Qrp/2iwxia4tjzHvd9Nvro4jqw3K5TQ7VpSG4Eepe
         3v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690758; x=1779295558;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aW/nYEiFxMS2z4I6C0K281BV66W1OxrZ+NF6ey1g5Rg=;
        b=g6D02swOBWuGIOndvJ+9iHEdC+eYdV5IQhdySIfU5VfyIQWjo/chvSSh73tlKfKCTJ
         i5ajv3I1HFApZYTFbTq8ZDx/KVQClGGz5iTDzQmAqAVozhdVSKeUsF5T+SnL1VqXNPqn
         w57SKu1AtnUVK2sCu3iy6kPo6VWcpNZGoYuFZaVpmnnotR17zqzqzFFDxg1Svgrv2mRr
         VFS4ytm9aYD3WBM0NF0P6mhSw+gdIlLoPrYtvls7T3zmr6p0+9K+tcZE+RO67Exhm4/5
         25zBD2Yqj+MzjVtqn5TDloHKmWPnNplXjTbFh5hA7+lsu89wW6edrzGpjQ3NSumdwpxw
         hoAQ==
X-Forwarded-Encrypted: i=1; AFNElJ88fDaxBQJxxtVHCdGiCoRcgbkiR8HDKjoDo3rFORi5l7Fw3jrchM3UVkApNnVtQpCO2VJ9CT5P7iU0IsBMmSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGwoj77NoloYCr7gdIheAsNvXfdCb76eoHehy52m0fi977vv7
	qrSFesAosPNikd3y0Le7DEwVU3j4PmipzswfKjLUPqyBgzwYr25oeqm9AlWbHoSsOr6ojsJgfqE
	PUXDLQskZ4Hk+JUu49fJVRIX4sQ==
X-Received: from jabfq5.prod.google.com ([2002:a05:6638:6505:b0:5de:63f7:b7f9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:2113:b0:696:6440:9e2a with SMTP id 006d021491bc7-69b78dd2cf7mr2147234eaf.29.1778690757861;
 Wed, 13 May 2026 09:45:57 -0700 (PDT)
Date: Wed, 13 May 2026 16:45:57 +0000
In-Reply-To: <e2a7679d-e61a-43ac-a1d7-72f7e815c400@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:47:54 +0100)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntzf23b6m2.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 13/20] KVM: arm64: Apply dynamic guest counter reservations
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

James Clark <james.clark@linaro.org> writes:

> On 04/05/2026 10:18 pm, Colton Lewis wrote:
>> Apply dynamic guest counter reservations by checking if the requested
>> guest mask collides with any events the host has scheduled and calling
>> pmu_perf_resched_update() with a hook that updates the mask of
>> available counters in between schedule out and schedule in.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    arch/arm64/kvm/pmu-direct.c  | 69 ++++++++++++++++++++++++++++++++++++
>>    include/linux/perf/arm_pmu.h |  1 +
>>    2 files changed, 70 insertions(+)

>> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
>> index 2252d3b905db9..14cc419dbafad 100644
>> --- a/arch/arm64/kvm/pmu-direct.c
>> +++ b/arch/arm64/kvm/pmu-direct.c
>> @@ -100,6 +100,73 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>>    	return *host_data_ptr(nr_event_counters);
>>    }

>> +/* Callback to update counter mask between perf scheduling */
>> +static void kvm_pmu_update_mask(struct pmu *pmu, void *data)
>> +{
>> +	struct arm_pmu *arm_pmu = to_arm_pmu(pmu);
>> +	unsigned long *new_mask = data;
>> +
>> +	bitmap_copy(arm_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>> +}
>> +
>> +/**
>> + * kvm_pmu_set_guest_counters() - Handle dynamic counter reservations
>> + * @cpu_pmu: struct arm_pmu to potentially modify
>> + * @guest_mask: new guest mask for the pmu
>> + *
>> + * Check if guest counters will interfere with current host events and
>> + * call into perf_pmu_resched_update if a reschedule is required.
>> + */
>> +static void kvm_pmu_set_guest_counters(struct arm_pmu *cpu_pmu, u64  
>> guest_mask)
>> +{
>> +	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>> +	DECLARE_BITMAP(guest_bitmap, ARMPMU_MAX_HWEVENTS);
>> +	DECLARE_BITMAP(new_mask, ARMPMU_MAX_HWEVENTS);
>> +	bool need_resched = false;
>> +
>> +	bitmap_from_arr64(guest_bitmap, &guest_mask, ARMPMU_MAX_HWEVENTS);
>> +	bitmap_copy(new_mask, cpu_pmu->hw_cntr_mask, ARMPMU_MAX_HWEVENTS);
>> +
>> +	if (guest_mask) {
>> +		/* Subtract guest counters from available host mask */
>> +		bitmap_andnot(new_mask, new_mask, guest_bitmap, ARMPMU_MAX_HWEVENTS);
>> +
>> +		/* Did we collide with an active host event? */
>> +		if (bitmap_intersects(cpuc->used_mask, guest_bitmap,  
>> ARMPMU_MAX_HWEVENTS)) {
>> +			int idx;
>> +
>> +			need_resched = true;
>> +			cpuc->host_squeezed = true;
>> +
>> +			/* Look for pinned events that are about to be preempted */
>> +			for_each_set_bit(idx, guest_bitmap, ARMPMU_MAX_HWEVENTS) {
>> +				if (test_bit(idx, cpuc->used_mask) && cpuc->events[idx] &&
>> +				    cpuc->events[idx]->attr.pinned) {
>> +					pr_warn_ratelimited("perf: Pinned host event squeezed out by KVM  
>> guest PMU partition\n");

> Hi Colton,

> I get "perf: Pinned host event squeezed out by KVM guest PMU partition"
> even with arm_pmuv3.reserved_host_counters=3 for example. I would have
> expected any non zero value to stop the warning.

> I think armv8pmu_get_single_idx() needs to be changed to allocate from
> the high end host counters first. A more complicated option would be
> checking to see if there are any non-pinned counters in the host
> reserved half when a new pinned counter is opened, then swapping the
> places of the new pinned and existing non-pinned counters so pinned
> always prefer being put into the host half. But it's probably not worth
> doing that.

> James


I agree it makes the most sense to allocate from the top, but I'm happy
the basic idea works.

>> +					break;
>> +				}
>> +			}
>> +		}
>> +	} else {
>> +		/*
>> +		 * Restoring to hw_cntr_mask.
>> +		 * Only resched if we previously squeezed an event.
>> +		 */
>> +		if (cpuc->host_squeezed) {
>> +			need_resched = true;
>> +			cpuc->host_squeezed = false;
>> +		}
>> +	}
>> +
>> +	if (need_resched) {
>> +		/* Collision: run full perf reschedule */
>> +		perf_pmu_resched_update(&cpu_pmu->pmu, kvm_pmu_update_mask, new_mask);
>> +	} else {
>> +		/* Host was never using guest counters anyway */
>> +		bitmap_copy(cpu_pmu->cntr_mask, new_mask, ARMPMU_MAX_HWEVENTS);
>> +	}
>> +}
>> +
>>    /**
>>     * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved  
>> counters
>>     * @pmu: Pointer to arm_pmu struct
>> @@ -218,6 +285,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)

>>    	pmu = vcpu->kvm->arch.arm_pmu;
>>    	guest_counters = kvm_pmu_guest_counter_mask(pmu);
>> +	kvm_pmu_set_guest_counters(pmu, guest_counters);
>>    	kvm_pmu_apply_event_filter(vcpu);

>>    	for_each_set_bit(i, &guest_counters, ARMPMU_MAX_HWEVENTS) {
>> @@ -319,5 +387,6 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
>>    	val = read_sysreg(pmintenset_el1);
>>    	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);

>> +	kvm_pmu_set_guest_counters(pmu, 0);
>>    	preempt_enable();
>>    }
>> diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
>> index f7b000bb3eca8..63f88fec5e80f 100644
>> --- a/include/linux/perf/arm_pmu.h
>> +++ b/include/linux/perf/arm_pmu.h
>> @@ -75,6 +75,7 @@ struct pmu_hw_events {

>>    	/* Active events requesting branch records */
>>    	unsigned int		branch_users;
>> +	bool host_squeezed;
>>    };

>>    enum armpmu_attr_groups {
