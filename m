From: mathieu.desnoyers at efficios.com (Mathieu Desnoyers)
Date: Thu, 4 Oct 2018 13:25:55 -0400 (EDT)
Subject: selftests/rseq: run_param_test.sh runs long
In-Reply-To: <CA+G9fYt-rZ-aYdZZ8hDXHi_uB2C27VqVMn0Qxs6CJ3EFDVQTVA@mail.gmail.com>
References: <CA+G9fYt-rZ-aYdZZ8hDXHi_uB2C27VqVMn0Qxs6CJ3EFDVQTVA@mail.gmail.com>
Message-ID: <1350032918.3214.1538673955923.JavaMail.zimbra@efficios.com>

Hi Naresh,

----- On Oct 4, 2018, at 5:34 AM, naresh kamboju naresh.kamboju at linaro.org wrote:

> Restart able sequences test "run_param_test.sh" test case running long
> on target devices. I have listed test duration on x86_64, arm64 and
> arm32.

Considering that failures only happen randomly when the scheduler
preempts threads running in a rseq critical section, we need to have
some amount of repetition in there.

There are however other aspects that we might want to tweak based on the
detected system configuration.

As a baseline, run_param_test.sh completes in 3m49s on my 16-core x86-64
(+hyperthreading).

I see that your x86-64 completes in 10m. We might want to tweak the number of
threads used in each test (currently always at its default of 200) based on the
number of detected cpus. The formula nr_cpus * 5 is an estimate that would
be close to the 200 threads that are configured to run in about 4m on my
main test system. It can be specified to param_test with the following
option:

	[-t N] Number of threads (default 200)

The goal behind having 5 threads per cpu is to ensure the scheduler will preempt
the running threads frequently enough.

I am really tempted to adapt the number of threads based on the number of
detected cpus rather than make the number of loops smaller, so we can keep
the current amount of work per cpu (and therefore likelihood to trigger a
rseq failure scenario).

Thoughts ?

Thanks,

Mathieu


> 
> Steps:
> # cd selftests/rseq
> # time ./run_param_test.sh
> 
> x86_64:
> real 10m7.311s
> user 3m5.740s
> sys 20m11.961s
> 
> Juno-r2 (arm64):
> real 26m33.530s
> user 13m40.909s
> sys 116m52.032s
> 
> Dragonboard-410c (arm64):
> More than hour and counting
> 
> Beagleboard x15 (arm32):
> More than hour and counting
> 
> Full test job on Juno (arm64):
> https://lkft.validation.linaro.org/scheduler/job/451267#L1331
> 
> Full test job on x15 (arm32):
> https://lkft.validation.linaro.org/scheduler/job/451310
> 
> 
> Any chance we could reduce the number of loops (REPS=1000) ?
> or
> Is it more of bench marking performance test case than functional test case ?
> 
> Single test case running more than hour on device under testing (DUT)
> is not a great idea for testing per commit / push. Your feedback is
> appreciated on running or skipping (exclude from default run) this
> test case from selftest full run.
> 
> Thank you.
> 
> Best regards
> Naresh Kamboju

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
