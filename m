From: shuah@kernel.org (Shuah Khan)
Date: Fri, 11 May 2018 08:43:18 -0600
Subject: selftests: kvm tests need config file.
In-Reply-To: <2890615a-1f55-48a6-b939-3977d0161846@redhat.com>
References: <CA+G9fYvfp9zfWSB92ZzAk23=x28Hx_H4y8ugMsaoQ=tZJxhe9A@mail.gmail.com>
 <2890615a-1f55-48a6-b939-3977d0161846@redhat.com>
Message-ID: <a493daa1-446a-7726-fa41-51312dd616c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511144318.91KDrk4yZ6hbQn4hTg88EHEgk-k6AFRRCh-NwQgPzYQ@z>

On 05/11/2018 05:50 AM, Paolo Bonzini wrote:
> On 11/05/2018 12:19, Naresh Kamboju wrote:
>> I have two questions,
>>
>> 1.
>> selftests: kvm tests failed.
>> Seems like missing pre-requirement of Kconfigs.
>>
>> Please add required configs in a "config" file in the path.
>> The kernel build will merge those configs at the time of building.
>> Example: selftests/net/config
> 
> Ok, I will.

Thanks.

> 
>> 2.
>> Do you have a plan to make it work for arm /arm64 ?
> 
> Not me directly, but compared to Google's original submission I have
> already taken some steps to separate the architecture-independent parts
> from the x86-specific ones.  So, patches are welcome! :)

I second that. Patches will be great.
> 
>> Test log,
>>
>> Running tests in kvm
>> ========================================
>> selftests: kvm: set_sregs_test
>> ==== Test Assertion Failure ====
>>   lib/kvm_util.c:95: kvm_fd >= 0
>>   pid=5611 tid=5611 - No such file or directory
>>      1 0x0000000000401e8e: ?? ??:0
>>      2 0x00000000004064b9: ?? ??:0
>>      3 0x0000000000400f51: ?? ??:0
>>      4 0x00007f74923d1290: ?? ??:0
>>      5 0x0000000000401039: ?? ??:0
>>   open /dev/kvm failed, rc: -1 errno: 2
>> not ok 1..1 selftests: kvm: set_sregs_test [FAIL]
>> se[  201.324786] kselftest: Running tests in membarrier
>> lftests: kvm: sync_regs_test
>> ==== Test Assertion Failure ====
>>   lib/kvm_util.c:54: kvm_fd >= 0
>>   pid=5617 tid=5617 - No such file or directory
>>      1 0x0000000000401deb: ?? ??:0
>>      2 0x0000000000400f52: ?? ??:0
>>      [  201.350386] kselftest: Running tests in memfd
>> 3 0x00007f9f2c5eb290: ?? ??:0
>>      4 0x00000000004014e9: ?? ??:0
>>   open /dev/kvm failed, rc: -1 errno: 2
>> not ok 1..2 selftests: kvm: sync_regs_test [FAIL]
>> selftests: kvm: vmx_tsc_adjust_test
>> ==== Test Assertion Failure ====
>>   lib/kvm_util.c:422: kvm_fd >= 0
>>   pid=5623 tid=5623 - No such file or directory
>>      1 0x00000000004018fa: ?? ??:0
>>      2 0x0000000000401d02: ?? ??:0
>>      3 0x0000000000400ef8: ?? ??:0
>>      4 0x00007f3e65a59290: ?? ??:0
>>      5 0x0000000000401119: ?? ??:0
>>   open /dev/kvm failed, rc: -1 errno: 2
>> not ok 1..3 selftests: kvm: vmx_tsc_adjust_test [FAIL]
>>
>> Ref bugs:
>> LKFT: next: arm32 and arm64: kselftest kvm test case build failed
>> https://bugs.linaro.org/show_bug.cgi?id=3826
>>
>> LKFT: linux-next: kvm vmx_tsc_adjust_test failed on all devices
>> https://bugs.linaro.org/show_bug.cgi?id=3780

I see that you are testing the skip, override cleanups, and test patches
I applied. Thanks for doing that and reporting results/problems.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
