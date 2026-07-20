Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0347D3BD225
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565990; cv=none; b=LDyLemMWzIl/Kl1sTlZnBlPl3up7+o/3L3x0xZehFezWnWwulKPNRyKJGAp3ZPehKO5mD386zBrmFF6gbeRr0RLqYDRMw8FfWcMEYMzREAXXqW6uAQqltDexUyZI/WxRm/SMRLaXvS+fWTlCLjYJwwxK4/sStrotMd37HGE7bpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565990; c=relaxed/simple;
	bh=23neV0u7FET9/z9SJJoTk52Qf6X3eq3Lrj2Yn79kENk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5GgAkGHEdjIVLVwPA+Q4ApDQWnVMRmkHmSLpKmhrtho7HP11iD9416vY0d/AJqhXfHH6+WvPYMUYnFgvwF3iJl7WJTfrm5vyZWj+WoJeKD2LghAhJO9B61I2pjX3FSexkOzTCPy7ee+aBCGCHolVSlVOXTdpgsAkeUcv/amIqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXUL2ylB; arc=none smtp.client-ip=74.125.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXUL2ylB"
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-49556ce3549so6053955e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 09:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784565982; x=1785170782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwqLdIDEx0RhLN1mKUdDDLnyo1kDLj53Ia9+5Bri/iU=;
        b=NXUL2ylBVy0zYszEGkllWUKIsSS2GR3qSdU2kf3lQAzE047hcCUbn9WRdaJcLP9y/v
         pdErZxUxm5CsfrKGDNoTu3dfl4I2ZG3guFh4qZEnBpCDnqzF6uG1Jc6C6+sm+rKB6a0O
         IroupVPe3oSW/hRaDVLPfnA1QjLEa08M/a8MXF/fDB/WyK20js9CIXjlSsY95UUuWLgo
         q4KF80D/it7tOlYJogLn0LrmZZZExqr6EXZdTbaUOgOfhi4k3WU0jRsnwJlWn9hZd1bP
         fulRrB0D5I+pGnLdjPCRANhpqony+UxftG/xP/wfRMW86LbX6buQIJJ3BaMf9NNYD1si
         Ki9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565982; x=1785170782;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwqLdIDEx0RhLN1mKUdDDLnyo1kDLj53Ia9+5Bri/iU=;
        b=qE1cHaA7JRagCNVgnIUx1OoQc42cmTGym2tVeUPUakO64N+6+479lPb1I2rqAdppSE
         q4AMrxfH3+genszo9+NPmUGeIjTtX+qnljHSEU5WFG73inycEcMx8zvT+Fz9L7byNrzY
         xSKczMGjAdgEoSMISIUMOD/Cl475EvqzU9dlB+KMZKHsutuQjSUsqsK/Hpg8nXu8IFqy
         wJXgbZ21Rbbusv34NDY8a4ptap36qAPzntRlijzv8ZrOo9jr2x1VzJ4V3I6xmOvsrwEV
         V8LXuKXuv311x8iX9ViTaT+ay+L9y3S29eNaFp/6GaQSONFLARVeSeKYsK1lBrwX8+A2
         uknA==
X-Forwarded-Encrypted: i=1; AHgh+RoRSjqBpKZ6JoLnuxw+jD9gD9rjuse0SbJduBPbh37cckAWOxEsgW7+BvaasuM58UFoQPpMdog0ZF1Lhny0IB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxArjbKbVqibGmODcqTCgW5U/smkhozAMBGyNDc0ISp/lXafyY7
	pJYQZSAF6nnXKvGYcBHq1FV+2sA9kjVdkE8joPLqnMj8eSy5SOCqT5rPV05487wTgn8=
X-Gm-Gg: AfdE7ckveFuiM3QkaTKNFovvCAYtuMd/uFLPfQZZ3JKU5qhFk5z2Q2nM9MKwvLxvQKb
	vPJzrM24vHtbHIhHz+dMm9CwF81G3TLHEEkdrA+g54QOYdL4F4SJkRohz9iCYZEr+yVMTEyo3Mo
	DGw8HpWVf0zO91v/CgE0nvUNogk+NIHLpiuQKINCZ525Mz/f5RjbnOZkkF7XXqpp4kyFYGHGLPj
	hGaM+vPS5Dm4lVjxwbXWi5L3y60o+1r/IwuJ5N47p1QAIjkvOwEqbJ1L34rxM0rxJGeWcFVtSn7
	dqj2MOT9E7k3HxZjMe499EaHFG/KFPw60j3r8CrmYwfD/XotOq3NcCI2yy4xiOsuTNrqKJtqrse
	afJsrGjU/T8S5DI23nG6DqTBv5tmU9QRqUWVnHE4Ov5d6n/NMV4BWrJbowqPPxqzv62Wgc2C4JK
	ExTLdrMqE=
X-Received: by 2002:a05:600c:4505:b0:493:f176:dc69 with SMTP id 5b1f17b1804b1-4954a413087mr159328555e9.37.1784565982263;
        Mon, 20 Jul 2026 09:46:22 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653d38dbsm1517285e9.15.2026.07.20.09.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:46:21 -0700 (PDT)
Message-ID: <515af040-deec-471f-92df-ca3e4e91e789@linaro.org>
Date: Mon, 20 Jul 2026 17:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/21] ARM64 PMU Partitioning
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
References: <20260612192909.1153907-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2026 8:28 pm, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> An overview of what this series accomplishes was presented at KVM
> Forum 2025. Slides [1] and video [2] are linked below.
> 
> The kernel command line parameter for the driver still exists, but now
> only defines an upper limit of counters the guest might use rather
> than taking those counters from the host permanently.
> 
> I would appreciate any discussion on whether that parameter should
> still exist as it's an inconvenient enabling gate on the feature that
> is no longer required. The question comes down to what, if any, guards
> we want against a guest monopolizing all counters on a system.
> 

Hi Colton,

The existence of the parameter makes sense, but can't the default be 
arm_pmuv3.reserved_host_counters=0 instead of -1 (partition disabled)? 
It's still a bit fiddly having to do two things to make it work, and 
there's no documentation about what the defaults or other prerequisites 
are. IMO it's not even trivial to work out that you need to prefix it 
with "arm_pmuv3.", which documentation would improve.

Testing the whole set I ran into a few issues:

This warn is hit when there is some kind of interaction with sleeping. I 
tried to bisect it but it only appears on the last commit when the 
option to enable partitioning is added.

	/*
	 * ARM pmu always has to reprogram the period, so ignore
	 * PERF_EF_RELOAD, see the comment below.
	 */
	if (flags & PERF_EF_RELOAD)
		WARN_ON_ONCE(!(hwc->state & PERF_HES_UPTODATE));

Steps to reproduce:

Host (arm_pmuv3.reserved_host_counters=0):
  $ sudo perf stat -C 2 -e \
    'branches,branches,branches,branches,branches,branches'
  $ sudo taskset --cpu-list 2 ./lkvm run --kernel \
    /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu

Guest:
  $ sleep 1

   WARNING: drivers/perf/arm_pmu.c:302 at cpu_pm_pmu_notify+0x278/0x2c0, 
CPU#2: swapper/2/0
    Call trace:
   cpu_pm_pmu_notify+0x278/0x2c0 (P)
   notifier_call_chain+0x84/0x1d0
   raw_notifier_call_chain+0x24/0x38
   cpu_pm_exit+0x34/0x68
   acpi_processor_ffh_lpi_enter+0x40/0x78
   acpi_idle_lpi_enter+0x54/0x78
   cpuidle_enter_state+0xb4/0x248
   cpuidle_enter+0x44/0x68
   do_idle+0x21c/0x300
   cpu_startup_entry+0x40/0x50
   secondary_start_kernel+0x120/0x150
   __secondary_switched+0xc0/0xc8


When running the guest on a single CPU I get different counts for the 
same event for a single process, although this never happens on a host. 
I think there might even be some Perf tests which expect them to be the 
same, and this doesn't depend on whether any events are running on the 
host or not. Not sure if you ran all the Perf selftests in a guest or not?

I'm not sure if the exception level filtering isn't working or there is 
something wrong with freezing. Doesn't the host PMU driver need to 
freeze with HPME? I see it's still doing it with PMCR_EL0.E which 
freezes the guest's counters now doesn't it?

Host (arm_pmuv3.reserved_host_counters=0):
  $ sudo taskset --cpu-list 2 ./lkvm run --kernel \
    /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu

Guest:
  $ perf stat -e branches,branches true

   Performance counter stats for 'true':

             167963      branches 

             160925      branches


  $ perf stat -e branches,branches,branches,branches,branches true

   Performance counter stats for 'true':

             164425      branches 

             164425      branches 

             164425      branches 

             157743      branches 

             157743      branches


When running the guest on two CPUs I just get zeros. Do the kvm 
selftests not catch this? Or is it something to do with my setup:

Host (arm_pmuv3.reserved_host_counters=0):
  $ sudo taskset --cpu-list 2-3 ./lkvm run --kernel \
    /boot/vmlinux-7.1.0-rc7+ -m 1024 -c 1 --pmu

Guest:
  $ perf stat -e branches,branches true

  Performance counter stats for 'true':

                  0      branches 

                  0      branches

I also noticed I get the "squeezed" warning printed after launching the 
guest but not using Perf. This comment implies that not using counters 
makes it a nop:

  	/*
	 * If we aren't guest-owned then we know the guest isn't using
	 * the PMU anyway, so no need to bother with the swap.
	 */
	if (vcpu->arch.pmu.access != VCPU_PMU_ACCESS_GUEST_OWNED)
		return;

But maybe linux is touching them in a way that makes them guest owned, 
even on probe? Or is the guest/host ownership tracking not working, I 
didn't look too hard.

Finally I think there are 3 critical Sashiko comments on this version. 
If they're false positives, then maybe some comments in the code or 
commit messages could reassure it.

Thanks
James

> v8:
> 
> * Rebase on top of v7.1-rc7.
> 
> * Implement Oliver Upton's accessor proposal to centralize PMU
>    register access and simplify trap handlers. Instead of one singular
>    accessor, implement as two because the read and write paths are
>    always different anyway.
> 
> * Introduce the partitioning flag along with the
>    kvm_pmu_is_partitioned predicate
> 
> * Don't use ifdef for partitioning predicates as that can be handled
>    by has_vhe
> 
> * Clean up MDCR_EL2 handling by open-coding use_fgt and hpmn and
>    unconditionally setting RES0 bits.
> 
> * Use {read,write}_pmcrcntrn in context swaps
> 
> * Put operators on preceeding lines
> 
> * Rename hw_cntr_mask to hw_cntr_impl to clarify it tracks the number
>    of counters implemented by hardware
> 
> * Use GENMASK_ULL in mask functions returning u64
> 
> * warn_once when host events are squeezed out by guest counter
>    allocations.
> 
> * Address Sashiko AI Review findings:
> 
>    - Critical fixes for lazy PMU context swaps (ensuring guest state is
>      loaded on transition to GUEST_OWNED), PMSELR_EL0 trapping to
>      prevent stale selector index, and masking guest PMCR_EL0 writes to
>      prevent host reset.
> 
>    - High priority fixes for lock safety (disabling IRQs when acquiring
>      perf context lock), disabling guest counters on vCPU put,
>      preserving VHE host profiling in MDCR_EL2, waking halted vCPUs on
>      guest PMU interrupts, masking host configuration leaks, preemption
>      safety in per-CPU accesses, emulating PMCR.N reads, and preventing
>      data races in PMOVSSET_EL0 accesses.
> 
>    - Medium/Low fixes for user-access fallback safety, VM-wide state
>      modification restrictions, selftests type safety, and cleanup of
>      unused fields and typos.
> 
> v7:
> https://lore.kernel.org/kvmarm/20260504211813.1804997-1-coltonlewis@google.com/
> 
> v6:
> https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/
> 
> v5:
> https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/
> 
> v4:
> https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/
> 
> v3:
> https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/
> 
> v2:
> https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/
> 
> v1:
> https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/
> 
> [1] https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
> [2] https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9
> 
> Colton Lewis (20):
>    arm64: cpufeature: Add cpucap for HPMN0
>    KVM: arm64: Reorganize PMU functions
>    perf: arm_pmuv3: Generalize counter bitmasks
>    perf: arm_pmuv3: Check cntr_mask before using pmccntr
>    perf: arm_pmuv3: Allocate counter indices from high to low
>    perf: arm_pmuv3: Add method to partition the PMU
>    KVM: arm64: Set up FGT for Partitioned PMU
>    KVM: arm64: Add Partitioned PMU register trap handlers
>    KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
>    KVM: arm64: Context swap Partitioned PMU guest registers
>    KVM: arm64: Enforce PMU event filter at vcpu_load()
>    perf: Add perf_pmu_resched_update()
>    KVM: arm64: Apply dynamic guest counter reservations
>    KVM: arm64: Implement lazy PMU context swaps
>    perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
>    KVM: arm64: Detect overflows for the Partitioned PMU
>    KVM: arm64: Add vCPU device attr to partition the PMU
>    KVM: selftests: Add find_bit to KVM library
>    KVM: arm64: selftests: Add test case for Partitioned PMU
>    KVM: arm64: selftests: Relax testing for exceptions when partitioned
> 
> Marc Zyngier (1):
>    KVM: arm64: Reorganize PMU includes
> 
>   arch/arm/include/asm/arm_pmuv3.h              |  18 +
>   arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
>   arch/arm64/include/asm/kvm_host.h             |  17 +-
>   arch/arm64/include/asm/kvm_types.h            |   6 +-
>   arch/arm64/include/uapi/asm/kvm.h             |   2 +
>   arch/arm64/kernel/cpufeature.c                |  10 +-
>   arch/arm64/kvm/Makefile                       |   2 +-
>   arch/arm64/kvm/arm.c                          |   2 +
>   arch/arm64/kvm/config.c                       |  41 +-
>   arch/arm64/kvm/debug.c                        |  30 +-
>   arch/arm64/kvm/pmu-direct.c                   | 507 ++++++++++++
>   arch/arm64/kvm/pmu-emul.c                     | 684 +----------------
>   arch/arm64/kvm/pmu.c                          | 720 ++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c                     | 271 +++++--
>   arch/arm64/tools/cpucaps                      |   1 +
>   arch/arm64/tools/sysreg                       |   6 +-
>   drivers/perf/arm_pmuv3.c                      | 136 +++-
>   include/kvm/arm_pmu.h                         |  93 ++-
>   include/linux/perf/arm_pmu.h                  |   8 +
>   include/linux/perf/arm_pmuv3.h                |  14 +-
>   include/linux/perf_event.h                    |   3 +
>   kernel/events/core.c                          |  31 +-
>   tools/include/perf/arm_pmuv3.h                |  12 +-
>   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>   .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
>   tools/testing/selftests/kvm/lib/find_bit.c    |   2 +
>   26 files changed, 1918 insertions(+), 823 deletions(-)
>   create mode 100644 arch/arm64/kvm/pmu-direct.c
>   create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c
> 
> 
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48

