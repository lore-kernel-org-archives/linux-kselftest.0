From: mathieu.desnoyers@efficios.com (Mathieu Desnoyers)
Date: Thu, 4 Oct 2018 13:35:15 -0400 (EDT)
Subject: selftests/rseq: run_param_test.sh runs long
In-Reply-To: <1350032918.3214.1538673955923.JavaMail.zimbra@efficios.com>
References: <CA+G9fYt-rZ-aYdZZ8hDXHi_uB2C27VqVMn0Qxs6CJ3EFDVQTVA@mail.gmail.com>
 <1350032918.3214.1538673955923.JavaMail.zimbra@efficios.com>
Message-ID: <495519547.3218.1538674515422.JavaMail.zimbra@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181004173515.lN5FNJQrlKgVZoOV33rlMZWgIoRMUlJMYyWzP5IgjVw@z>

----- On Oct 4, 2018,@1:25 PM, Mathieu Desnoyers mathieu.desnoyers@efficios.com wrote:

> Hi Naresh,
> 
> ----- On Oct 4, 2018, at 5:34 AM, naresh kamboju naresh.kamboju at linaro.org
> wrote:
> 
>> Restart able sequences test "run_param_test.sh" test case running long
>> on target devices. I have listed test duration on x86_64, arm64 and
>> arm32.
> 
> Considering that failures only happen randomly when the scheduler
> preempts threads running in a rseq critical section, we need to have
> some amount of repetition in there.
> 
> There are however other aspects that we might want to tweak based on the
> detected system configuration.
> 
> As a baseline, run_param_test.sh completes in 3m49s on my 16-core x86-64
> (+hyperthreading).
> 
> I see that your x86-64 completes in 10m. We might want to tweak the number of
> threads used in each test (currently always at its default of 200) based on the
> number of detected cpus. The formula nr_cpus * 5 is an estimate that would
> be close to the 200 threads that are configured to run in about 4m on my
> main test system. It can be specified to param_test with the following
> option:
> 
>	[-t N] Number of threads (default 200)
> 
> The goal behind having 5 threads per cpu is to ensure the scheduler will preempt
> the running threads frequently enough.
> 
> I am really tempted to adapt the number of threads based on the number of
> detected cpus rather than make the number of loops smaller, so we can keep
> the current amount of work per cpu (and therefore likelihood to trigger a
> rseq failure scenario).
> 
> Thoughts ?

Something like the following diff:

diff --git a/tools/testing/selftests/rseq/run_param_test.sh b/tools/testing/selftests/rseq/run_param_test.sh
index 3acd6d75ff9f..e426304fd4a0 100755
--- a/tools/testing/selftests/rseq/run_param_test.sh
+++ b/tools/testing/selftests/rseq/run_param_test.sh
@@ -1,6 +1,8 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0+ or MIT
 
+NR_CPUS=`grep '^processor' /proc/cpuinfo | wc -l`
+
 EXTRA_ARGS=${@}
 
 OLDIFS="$IFS"
@@ -28,15 +30,16 @@ IFS="$OLDIFS"
 
 REPS=1000
 SLOW_REPS=100
+NR_THREADS=$((6*${NR_CPUS}))
 
 function do_tests()
 {
        local i=0
        while [ "$i" -lt "${#TEST_LIST[@]}" ]; do
                echo "Running test ${TEST_NAME[$i]}"
-               ./param_test ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
+               ./param_test ${TEST_LIST[$i]} -r ${REPS} -t ${NR_THREADS} ${@} ${EXTRA_ARGS} || exit 1
                echo "Running compare-twice test ${TEST_NAME[$i]}"
-               ./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} ${@} ${EXTRA_ARGS} || exit 1
+               ./param_test_compare_twice ${TEST_LIST[$i]} -r ${REPS} -t ${NR_THREADS} ${@} ${EXTRA_ARGS} || exit 1
                let "i++"
        done
 }

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
