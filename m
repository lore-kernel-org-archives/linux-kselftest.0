From: shuah@kernel.org (Shuah Khan)
Date: Fri, 21 Sep 2018 15:24:25 -0600
Subject: [PATCH v3 00/28] selftests/ftrace: Improve ftracetest with
 coverage check
In-Reply-To: <153563834333.29700.11242968505215651399.stgit@devbox>
References: <153563834333.29700.11242968505215651399.stgit@devbox>
Message-ID: <9cf69344-5dfc-4961-163e-1e14bbe80647@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180921212425.xiX_xKIdpedT8F6RnK7nRQN-CHyI2bbHhrAWTqXALZQ@z>

Hi Masami,

On 08/30/2018 08:12 AM, Masami Hiramatsu wrote:
> Hi,
> 
> Here is the 3rd version of the series for improving ftracetest
> testcase using gcov/lcov. In this version I just fixed some
> reported issues and dropped some tests which is not needed.
> I also dropped a testcase for blktrace from this version.
> It will be discussed separated thread.
> 
> Previous version is here;
> 
> https://lkml.org/lkml/2018/8/16/393
> 
> GCOV_PROFILE_FTRACE has already been merged through tracing
> tree.
> 
> Ftracetest framework improvements:
>  - Add --stop-fail for detecting failure soon.
>  - Add --console for interactively debugging a testcase by shell.
>  - Add testcase-number prefix to logfile for finding log easier.
>  - Improve general init function
>  - Add SPDX license identifiers
>  - Call general init function after all testcases.
>  - Remove init/cleanup code from all testcase (since general init
>    function will fixed it up)
> 
> Testcase fixes:
>  - Fix to check $comm availability.
>  - Make checkbashisms clean
> 
> Testcase improvements:
>  - Use loopback address instead of localhost
>  - Improve kprobe on module testcase to load/unload module
>  - Improve kprobe testcase to check log data
>  - Improve kretprobe testcase to check log data
>  - Test kprobe-event argument with various bitsize
>  - Check set_event_pid result
> 
> Adding testcases:
>  - Add kprobe event with $comm argument testcase
>  - Add kprobe profile testcase
>  - Add kprobe-event with symbol argument testcase
>  - Add trace_printk sample module testcase
>  - Add ringbuffer size changing testcase
>  - Add function profiling statistics testcase
>  - Add max stack tracer testcase
>  - Add function filter on module testcase
>  - Add trace_pipe testcase
>  - Add stacktrace ftrace filter command testcase
>  - Add wakeup tracer testcase
>  - Add wakeup_rt tracer testcase
>  - Add ftrace cpumask testcase
> 
> TBD:
> Following testcase improvements are remaining.
>  - Checking of various supported types (like u8, u64 etc.)
>    testcases
> 
> Tested on x86-64 qemu.
> 
> # of passed:  84
> # of failed:  0
> # of unresolved:  0
> # of untested:  0
> # of unsupported:  0
> # of xfailed:  0
> # of undefined(test bug):  0
> 
> Thank you,
> 

Thanks for the patches. Sorry for the delay. I am applying the series to linux-kselftest
next for 4.20 release.

thanks,
-- Shuah
