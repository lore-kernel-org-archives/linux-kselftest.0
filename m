From: shuah at kernel.org (shuah)
Date: Sat, 2 Mar 2019 11:31:16 -0700
Subject: [PATCH] selftests: x86: add version check in test_syscall_vdso
In-Reply-To: <20190302091047.GA14963@kroah.com>
References: <20190301001806.154271-1-smuckle@google.com>
 <CALCETrUcH9R62gDdiG-EGTfSt2kQktv-0+bYmPcLn4PWNMrHSQ@mail.gmail.com>
 <20190302091047.GA14963@kroah.com>
Message-ID: <b9805f57-5fc8-454e-c1c8-c06dab86e863@kernel.org>

On 3/2/19 2:10 AM, Greg KH wrote:
> On Fri, Mar 01, 2019 at 11:59:24AM -0800, Andy Lutomirski wrote:
>>> On Feb 28, 2019, at 4:18 PM, Steve Muckle <smuckle at google.com> wrote:
>>>
>>> Since 4.17 registers r8-r11 are not clobbered/zeroed by a 64-bit kernel
>>> handling a 32-bit syscall and this behavior is enforced by the
>>> test_syscall_vdso testcase. See commit 8bb2610bc496
>>> ("x86/entry/64/compat: Preserve r8-r11 in int $0x80").
>>>
>>> Permit the old behavior in the testcase for kernels prior to 4.17.
>>
>> NAK.  If you want an old buggy kernel to pass a test, please either
>> patch the kernel or run an old test.
> 
> Yeah, this isn't ok, especially as you might have 4.14 or 4.9 kernels
> that can pass the test if the needed patches were backported.  Checking
> kernel version numbers should never be used for anything.
> 

Also, this test failure can tell us if we should backport important
fixes. I have had requests to add kernel version checking in tests
before and the recommendation is "don't check kernel versions and
reply on feature type checks". In the case of fixes like this one,
it is better for the test to fail than make us feel warm and fuzzy
by making it pass.

thanks,
-- Shuah
