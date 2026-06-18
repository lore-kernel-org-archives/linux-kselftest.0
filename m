Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF723D297
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781825553; cv=none; b=Ja2JZR8ba+IuZX/xQjwdcKlpiViZr0k5d5nxJ8bRaCgrsuyrG7G4oE3T9IFzKyeq9ZvkIrdTJEqJVRIivGC+LATzkgt64fI1qoWZzMcWTvs1ioyD7EBhI0Nc8/fkBF9DCH5WRDOKZvSjEEMa1aN8SrScgZKyUKGAlP/uh27zre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781825553; c=relaxed/simple;
	bh=aOBaHP4DOk4vq3tW3rv9yXUlZFd1+xiTupwDlFmXHKA=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Iul5TZW6saiORkbGTdVF8IsPG75jM55srYGNvFRKAPBXCrTS1/7UQaL+atf9oiyT7+ODDDEUv9MokdNDD9F4yyYO8mCrWpWE47bRpklOuoCpG9fihQWDb+R8KqVgPHSQ1DU4AdY2VQlkeylDI3ObfyMpYwaRh5omsSqOP5Q5Gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iIbBeGKA; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iIbBeGKA"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7e6e385508bso1928846a34.1
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 16:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781825552; x=1782430352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=iIbBeGKAiRPB/YS1s9Oxi9L0oJrB9PN4tcvDyNcyEHh2gMo04HY4O/S8d9I17GBaiL
         jOnq5tpDfWcB7mmRXo/w8BQB0rC2ZarKIr55zQ8wwaWcS4P1t7SwSa4/jJPjNgiyU/C8
         4EGaGPyLqA1RRcd/hrWwrCYkyJk+4B9AjU9T8utLbAqSn0agyfqEeCtm+DrbpF+mjg1h
         qlY+Q/e1epyuca6ImMUQVk8mBSHym0iEGD+TkJwq9YG2n27TjyE1oOT8XUqM33WiFLAY
         1U6cHnbugFtIQIBCHb69XVpK5Ozl+AFpMzeYVSDMi59Le3/wCpXGzzWeefGtbDx9BRi9
         KcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781825552; x=1782430352;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWYCnxdR0CMlBSotsz1RrmN4O2SDrdrRioZC+xeVso=;
        b=QqWyOVNfNgJdLzLp5UMt7vHpGI1LC2gnIytJ17kwCRTHo2rorHyo6cxUrT4bNmTXKl
         UkXlyCeos3O0B8MYn+UjCZlF6Z1hLmGTnPQ3W4k4QQECRV00RlZq4L8zuab+utCSzFQ6
         zphwb9YVshrtvK7ns4+i7VG5Sg8F9XP3s+vuoFl0AYiAiBoy15pTEkLav+BjGyC2m6+H
         073TaRWGBQaceLLAutIjcHda8l6+QBpRkdJzkFber76WX8t32s4YJ3WdB6hc8OFggz6A
         U9nAwf3dTqySkT0qy6GK5umWG3ksPaufHC9AsW/ZoE+ie1PlY56yUynSD+/RwqyTWUuH
         9kEw==
X-Forwarded-Encrypted: i=1; AFNElJ+QjLgRyHPtdpx6rj6HjfQNvFS/XUBEE7W3TuWoD+mFHfXV1m6RtXSg46yjLKY3tkqS4EfHeMadV/97DwA3NK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLsGq4U4RRdDzn0M+rggmT/IfdHo5mYlkxZ/bYFszMWaUlnqPH
	UMyhjdzszO8qbmBpXz+v6GZ+vzg2gwCfdTF1tEFaFnrPaUR6BVe6Iq8OYYAOMSFiUlF12B28yiA
	hAeeq4AmwMkHA0JCTo0/GQIYpGA==
X-Received: from ilbdv1-n1.prod.google.com ([2002:a05:6e02:4001:10b0:502:e73:d02b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1808:b0:46c:e542:cc25 with SMTP id 5614622812f47-489aeaa5634mr180520b6e.9.1781825551504;
 Thu, 18 Jun 2026 16:32:31 -0700 (PDT)
Date: Thu, 18 Jun 2026 23:32:30 +0000
In-Reply-To: <6dca2d6e-54d0-42c4-95df-45a30a473e0b@huawei.com> (message from
 wuyifan on Thu, 18 Jun 2026 09:53:15 +0800)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <gsntse6jctm9.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 15/20] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: wuyifan <wuyifan50@huawei.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangyushan12@huawei.com, 
	wangzhou1@hisilicon.com, xuwei5@huawei.com, prime.zeng@hisilicon.com, 
	fanghao11@huawei.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

wuyifan <wuyifan50@huawei.com> writes:

> Hi Colton,

> On 5/5/2026 5:18 AM, Colton Lewis wrote:
>>    static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
>>    {
>> -	u64 pmovsr;
>>    	struct perf_sample_data data;
>>    	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
>>    	struct pt_regs *regs;
>> +	u64 host_set = kvm_pmu_host_counter_mask(cpu_pmu);
>> +	u64 pmovsr;
> kvm_pmu_host_counter_mask() is called from armv8pmu_handle_irq(). This
> interrupt fires in both host and guest contexts.

> However, kvm_pmu_host_counter_mask() dereferences
> host_data_ptr(nr_event_counters). This indirection requires
> kvm_arm_hyp_percpu_base[cpu] to be initialized, which only happens during
> KVM hypervisor setup. When the interrupt fires in a guest kernel where
> KVM is
> compiled but not active, the per-CPU base is NULL and the dereference
> faults.

I will fix that.


> Thanks,
> Yifan
