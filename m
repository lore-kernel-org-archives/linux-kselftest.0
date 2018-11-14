From: drjones@redhat.com (Andrew Jones)
Date: Wed, 14 Nov 2018 19:08:07 +0100
Subject: KVM selftests are failing
In-Reply-To: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
References: <CANBxJ=EQOt1t=PkLsMvtfB2SbiLMPeGvFxB7SJXf7m3OkcionQ@mail.gmail.com>
Message-ID: <20181114180807.6crs7awhvo26ldbr@hawk.localdomain>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181114180807.COo0zOjoF8uCuRC5bLv5eXlRvHAiS1o9lFM3e6t_yWM@z>

On Wed, Nov 14, 2018@05:30:28PM +0200, Ahmed Soliman wrote:
> Hello,
> 
> KVM Self tests located at tools/testing/selftests/kvm seams to be failing.
> I have tried:
>  - dirty_log_test
>  - x86_64/cr4_cpuid_sync_test
>  - x86_64/evmcs_test
>  - x86_64/platform_info_test
>  - x86_64/set_sregs_test
>  - x86_64/state_test
>  - x86_64/sync_regs_test
>  - x86_64/vmx_tsc_adjust_test
> 
> All of them triggered the following assert:
> 
>         ==== Test Assertion Failure ====
>         lib/kvm_util.c:596: ret == 0
>         pid=24507 tid=24507 - Invalid argument
>             1  0x000056360774e468: ?? ??:0
>             2  0x000056360774e609: ?? ??:0
>             3  0x00005636077537a0: ?? ??:0
>             4  0x000056360774d35e: ?? ??:0
>             5  0x00007f3117571ae6: ?? ??:0
>             6  0x000056360774d4a9: ?? ??:0
>         madvise failed,
>         addr: 0x7f3117350000
>         length: 0x200000
>         src_type: 0
> 
> I have tried the tests on both kvm(next) branch
> commit 22a7cdcae6a4a3c89748 as well as
> torvald's master  4.20-rc2.

Hi Ahmed,

I couldn't reproduce this on a Westmere. Are you sure you're testing
a clean compilation? Can you bisect the kernel?

Thanks,
drew
