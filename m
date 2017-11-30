From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Thu, 30 Nov 2017 10:48:14 +0530
Subject: [Linux-kselftest-mirror] selftests: x86_64: kselftest
 mpx-mini-test_64 - no MPX support - failed - 3869 Aborted (core dumped)
In-Reply-To: <20171124114635.GB1916@kroah.com>
References: <CA+G9fYvishojFT=nAJ-ejrOo9KfsDKFOa=3Nzjep0H4E88fPJg@mail.gmail.com>
 <20171124111141.GA14922@kroah.com> <20171124111242.GA25106@kroah.com>
 <CA+G9fYuco-vArAVrNhzPZiOza7LNboM7c6qrZJ_q=_fMsGHidQ@mail.gmail.com>
 <20171124114635.GB1916@kroah.com>
Message-ID: <CA+G9fYsc5PPgduSJKQy7HkJUVHqXMUHW10K=BrU8UUe5970p+Q@mail.gmail.com>

+ x86
+ tglx

On 24 November 2017 at 17:16, Greg KH <greg at kroah.com> wrote:
> On Fri, Nov 24, 2017 at 04:52:22PM +0530, Naresh Kamboju wrote:
>> On 24 November 2017 at 16:42, Greg KH <greg at kroah.com> wrote:
>> > On Fri, Nov 24, 2017 at 12:11:41PM +0100, Greg KH wrote:
>> >> On Fri, Nov 24, 2017 at 04:32:42PM +0530, Naresh Kamboju wrote:
>> >> > Hi,
>> >> >
>> >> > We have found "no MPX support" bug while running kselftests on
>> >> > SuperServer 5019S-ML - x86_64 device.
>> >> > Please provide your comments to fix this bug.
>> >> >
>> >> > LKFT: 4.4-rc 4.9-rc 4.13-rc 4.14-rc: x86: kselftest mpx-mini-test_64 -
>> >> > no MPX support - failed - 3869 Aborted (core dumped) (edit)
>> >> > https://bugs.linaro.org/show_bug.cgi?id=3497
>> >> >
>> >> > NOTE:
>> >> > Please add your self to Bugzilla to add comments.
>> >>
>> >> Ugh, what?  Why not discuss it here, and provide the full log of what is
>> >> happening and what you think should be done to fix it.  Don't bury stuff
>> >> in some random bugzilla...
>> >>
>> >> Perhaps a simple abort once you determine that MPX is not supported?
>> >
>> > Wait, that is what the test is doing, so it's working properly.  Why is
>> > this an issue?
>>
>> seems to be that the hardware change in LAB brought up this failures
>> Here you could notice difference in test out on old and new machines.
>>
>> old machine:
>> ------------
>> processor lacks XSAVE, can not run MPX tests
>> selftests: mpx-mini-test_64 [PASS]
>>
>> New machine:
>> -------------
>> XSAVE is supported by HW & OS
>> XSAVE processor supported state mask: 0x1f
>> XSAVE OS supported state mask: 0x1f
>>  BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
>>   BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0
>> no MPX support
>> ./run_kselftest.sh: line 214:  3869 Aborted (core dumped) ./mpx-mini-test_64
>> selftests: mpx-mini-test_64 [FAIL]
>
> Yes, the tests runs differently on different hardware.
>
> So abort() should not happen if there is no MPX support, care to make up
> a patch and test it on your system?

In the first case,
The test case is detecting hardware has MPX feature supported or not.
and if it not exit gracefully.

In the second case,
Hardware have MPX support.
but test got Aborted.
The reason for abort to be investigated.

I am suspecting.
As a pre-requirement,
(For MPX to work, changes are required in the kernel, binutils and compiler.)
(GCC with -fmpx:  * enables annotation of code with MPX instructions
and prefixes)
Do the kernel to be re-compiled with -fmpx ?

Test source:
tools/testing/selftests/x86/mpx-mini-test.c

Ref:
Bugzilla link: https://bugs.linaro.org/show_bug.cgi?id=3497
https://www.kernel.org/doc/Documentation/x86/intel_mpx.txt

Please suggest a way forward to debug and resolve this issue.
Thanks in advance.

- Naresh

>
> thanks,
>
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
