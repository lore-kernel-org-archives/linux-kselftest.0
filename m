Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97339F17E
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784214; cv=none; b=UUIjj036Gh57obojjVEfBVnupiLAN6Uh1wnkGL7zne+1C67LMh5ShC1yjGv8ukFeTZUkkQ4fVjllW40VpO8eBiN9dAH2sGaWta2ydQCoOwcRpr7DJ8ecXe5APLRWJzTbWQcSqEFOV1a5XnIYdLgkXCio3WbD+IjNU2As5CY3eV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784214; c=relaxed/simple;
	bh=dPbNCzf9KCRMLpqX405TL92VnoYbLgcOy7+YnXmORW0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=N8eIL6js/wIpY7Y/2PxUFaZqHDDT/yBZmBwoBd2esZZBEt7ItZirFJPPmhEoXBmiE0EaAvAHz75lgH3LZKu9fnIEXvTIGhTXN9zbvzEN+XhzoaLsB3zj+YtsJZKc/df1IDhZx365rv7p6dXo46gLu453sRnCq4gPmI9xq/3wv2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gHG8ygjN; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gHG8ygjN"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7e3a5fc58feso11993701a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784209; x=1779389009; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKsaF96H0ao5LtAeB6Jowvi3N+dV7tElJWwhr8XO8PU=;
        b=gHG8ygjN6KVe96b1O0qaH0wfffMLPwV9dRHqox23374jYMuOrPuyAD+Sk8Bx23L5bw
         IQDvdHHWOytxyV6X0PdI3Gzrdse8Ku9EjQdsyCSyaCmIehozsFHt8HAzhacSC2nv1kzB
         wUhHEsPFCUlGR/E5qiOgtcqHkTVkZTO4ITzn9RW/4CS/Gmc+HhEcE2g3NrmnOa7wGpZ1
         VlOO3ihjbxvnATVDF81i+vKK5kbu6vLkcqXJr5rdelOSB8Rni7Acbd5xCELoyu3erXWu
         sMAJz9e1xK1+FdjBrJg50/6qO+fRFDfEAMTeoEIYucdXltIvt2Z+KI+z8mrLONsp0gVE
         WkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784209; x=1779389009;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKsaF96H0ao5LtAeB6Jowvi3N+dV7tElJWwhr8XO8PU=;
        b=cCIlVop7MmhCVmu3I0j889BOT0MK4e0yAo39xhZhLi4ep4ZsS6nL6PSYFCUeoIrSvy
         ch0xjtnlvirVrTZ3C6W07LKH+746IImGYyu1so0voO2uZUKumpMvDdi569qXIyBSARBq
         7kmhIX9sN3R0cxWuCUb0sU4tJKbpUwypqLgUWX34RIgr9sLCT/xoljM+5CYzgoWY9ARZ
         2rP/08VctM3wiJipbWw+nSAm5ugXeQCrksmoi1dQIegpmK+WLenMX1lOk7rwris2e6tb
         k78L+/vFP+3pn2IE0n7T/xIruphEV4q9MSDtiaVZxC8LR8L1N244TfGWDLZVGIchw+ub
         qe5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9BMW9y0o2kj1lD6CaXWjcmTu8hcE6ZLlycbWIh8OVrjTBSIjuu34hAEVTAgexQRXdNhV+I9H3lsotZg3n/AJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww0vOkqlkd4leCY85aUyEZ5a0xcLYPA2fl7KNlkFXn2U5t34/W
	noUqdRPvx44Ix9eNUaKpMB3aTreah8iuY7vHjFgIu6wP7oNxaa1RfH1XL1spGCbYEH2IfdBzlaK
	PZ+lNdWB3XK9zEHu8d0dzNNcbPg==
X-Received: from ioym2.prod.google.com ([2002:a05:6602:3142:b0:964:6792:360])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1795:b0:694:9a67:edf6 with SMTP id 006d021491bc7-69c942ffd04mr447091eaf.17.1778784209181;
 Thu, 14 May 2026 11:43:29 -0700 (PDT)
Date: Thu, 14 May 2026 18:43:28 +0000
In-Reply-To: <agQu9kLnbHjSni-C@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 00:57:42 -0700)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntqzndbzn3.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 09/20] KVM: arm64: Set up MDCR_EL2 to handle a
 Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:02PM +0000, Colton Lewis wrote:
>> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
>> index 3ad6b7c6e4ba7..0ab89c91e19cb 100644
>> --- a/arch/arm64/kvm/debug.c
>> +++ b/arch/arm64/kvm/debug.c
>> @@ -36,20 +36,43 @@ static int cpu_has_spe(u64 dfr0)
>>    */
>>   static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>>   {
>> +	int hpmn = kvm_pmu_hpmn(vcpu);
>> +
>>   	preempt_disable();

>>   	/*
>>   	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
>>   	 * to disable guest access to the profiling and trace buffers
>>   	 */
>> -	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
>> -					 *host_data_ptr(nr_event_counters));
>> +
>> +	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
>>   	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
>>   				MDCR_EL2_TPMS |
>>   				MDCR_EL2_TTRF |
>>   				MDCR_EL2_TPMCR |
>>   				MDCR_EL2_TDRA |
>> -				MDCR_EL2_TDOSA);
>> +				MDCR_EL2_TDOSA |
>> +				MDCR_EL2_HPME);
>> +
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
>> +		/*
>> +		 * Filtering these should be redundant because we trap
>> +		 * all the TYPER and FILTR registers anyway and ensure
>> +		 * they filter EL2, but set the bits if they are here.
>> +		 */
>> +		if (is_pmuv3p1(read_pmuver()))
>> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
>> +		if (is_pmuv3p5(read_pmuver()))
>> +			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;

> Neither of these controls are of any consequence on unsupported
> hardware (RES0). Set them unconditionally?

Sure.

>> +		/*
>> +		 * Take out the coarse grain traps if we are using
>> +		 * fine grain traps.
>> +		 */
>> +		if (kvm_vcpu_pmu_use_fgt(vcpu))

> I think open coding the check here would actually improve readability.

> 		if (cpus_have_final_cap(ARM64_HAS_FGT) &&
> 		    (cpus_have_final_cap(ARM64_HAS_HPMN0) ||
> 		     vcpu->kvm->arch.nr_pmu_counters != 0))
> 			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);

I disagree but I'll do it.

>> +
>> +/**
>> + * kvm_pmu_hpmn() - Calculate HPMN field value
>> + * @vcpu: Pointer to struct kvm_vcpu
>> + *
>> + * Calculate the appropriate value to set for MDCR_EL2.HPMN. If
>> + * partitioned, this is the number of counters set for the guest if
>> + * supported, falling back to max_guest_counters if needed. If we are  
>> not
>> + * partitioned or can't set the implied HPMN value, fall back to the
>> + * host value.
>> + *
>> + * Return: A valid HPMN value
>> + */
>> +u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
>> +{
>> +	u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
>> +
>> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)
>> +	    && !vcpu_on_unsupported_cpu(vcpu)
>> +	    && (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0))
>> +		return nr_guest_cntr;
>> +
>> +	return *host_data_ptr(nr_event_counters);
>> +}

> This helper isn't helpful. Just open code it in the place where we are
> computing MDCR_EL2.

I disagree but I'll do it.

>> @@ -542,6 +542,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
>>   		return 1;

>> +	/*
>> +	 * If partitioned then we are limited by the max counters in
>> +	 * the guest partition.
>> +	 */
>> +	if (kvm_pmu_is_partitioned(arm_pmu))
>> +		return arm_pmu->max_guest_counters;
>> +

> Ok, this is exactly what I was getting at earlier. What about a VM with
> an emulated PMU? It should use cntr_mask calculation, not the guest
> range.

True. I should use something different here.


> Thanks,
> Oliver
