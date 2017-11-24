From: naresh.kamboju@linaro.org (Naresh Kamboju)
Date: Fri, 24 Nov 2017 16:52:22 +0530
Subject: [Linux-kselftest-mirror] selftests: x86_64: kselftest
 mpx-mini-test_64 - no MPX support - failed - 3869 Aborted (core dumped)
In-Reply-To: <20171124111242.GA25106@kroah.com>
References: <CA+G9fYvishojFT=nAJ-ejrOo9KfsDKFOa=3Nzjep0H4E88fPJg@mail.gmail.com>
 <20171124111141.GA14922@kroah.com> <20171124111242.GA25106@kroah.com>
Message-ID:
 <CA+G9fYuco-vArAVrNhzPZiOza7LNboM7c6qrZJ_q=_fMsGHidQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20171124112222.ERQaXJ5n54x-JfF3fntV0wugiMdKc_cahuFdDac8cZ8@z>

On 24 November 2017@16:42, Greg KH <greg@kroah.com> wrote:
> On Fri, Nov 24, 2017@12:11:41PM +0100, Greg KH wrote:
>> On Fri, Nov 24, 2017@04:32:42PM +0530, Naresh Kamboju wrote:
>> > Hi,
>> >
>> > We have found "no MPX support" bug while running kselftests on
>> > SuperServer 5019S-ML - x86_64 device.
>> > Please provide your comments to fix this bug.
>> >
>> > LKFT: 4.4-rc 4.9-rc 4.13-rc 4.14-rc: x86: kselftest mpx-mini-test_64 -
>> > no MPX support - failed - 3869 Aborted (core dumped) (edit)
>> > https://bugs.linaro.org/show_bug.cgi?id=3497
>> >
>> > NOTE:
>> > Please add your self to Bugzilla to add comments.
>>
>> Ugh, what?  Why not discuss it here, and provide the full log of what is
>> happening and what you think should be done to fix it.  Don't bury stuff
>> in some random bugzilla...
>>
>> Perhaps a simple abort once you determine that MPX is not supported?
>
> Wait, that is what the test is doing, so it's working properly.  Why is
> this an issue?

seems to be that the hardware change in LAB brought up this failures
Here you could notice difference in test out on old and new machines.

old machine:
------------
processor lacks XSAVE, can not run MPX tests
selftests: mpx-mini-test_64 [PASS]

New machine:
-------------
XSAVE is supported by HW & OS
XSAVE processor supported state mask: 0x1f
XSAVE OS supported state mask: 0x1f
 BNDREGS: size: 64 user: 1 supervisor: 0 aligned: 0
  BNDCSR: size: 64 user: 1 supervisor: 0 aligned: 0
no MPX support
./run_kselftest.sh: line 214:  3869 Aborted (core dumped) ./mpx-mini-test_64
selftests: mpx-mini-test_64 [FAIL]

code snippet:
--------------
bool process_specific_init(void)
{
<>
if (prctl(43, 0, 0, 0, 0)) {
printf("no MPX support\n");
abort();
return false;
}
return true;
}

bool process_specific_finish(void)
{
if (prctl(44)) {
printf("no MPX support\n");
return false;
}
return true;
}


Source code:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/tree/tools/testing/selftests/x86/mpx-mini-test.c?h=next


Additional information,

1)
The processor have Memory Protection Extensions (MPX) capability.
boot log,
<>
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating
point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
<>

2)
The processor flags shows MPX capability
# cat /proc/cpuinfo | grep ' mpx '

flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq
dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm
pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave
avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb intel_pt
tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle
avx2 smep bmi2 erms invpcid rtm mpx rdseed adx smap clflushopt
xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify
hwp_act_window hwp_epp

3)
For MPX to work, changes are required in the kernel, binutils and compiler.
No source changes are required for applications, just a recompile.

4)
GCC with -fmpx:
 * enables annotation of code with MPX instructions and prefixes

Ref:
https://www.kernel.org/doc/Documentation/x86/intel_mpx.txt

- Naresh

>
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
