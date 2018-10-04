From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Thu, 4 Oct 2018 15:04:04 +0530
Subject: selftests/rseq: run_param_test.sh runs long
Message-ID: <CA+G9fYt-rZ-aYdZZ8hDXHi_uB2C27VqVMn0Qxs6CJ3EFDVQTVA@mail.gmail.com>

Restart able sequences test "run_param_test.sh" test case running long
on target devices. I have listed test duration on x86_64, arm64 and
arm32.

Steps:
# cd selftests/rseq
# time ./run_param_test.sh

x86_64:
real 10m7.311s
user 3m5.740s
sys 20m11.961s

Juno-r2 (arm64):
real 26m33.530s
user 13m40.909s
sys 116m52.032s

Dragonboard-410c (arm64):
More than hour and counting

Beagleboard x15 (arm32):
More than hour and counting

Full test job on Juno (arm64):
https://lkft.validation.linaro.org/scheduler/job/451267#L1331

Full test job on x15 (arm32):
https://lkft.validation.linaro.org/scheduler/job/451310


Any chance we could reduce the number of loops (REPS=1000) ?
or
Is it more of bench marking performance test case than functional test case ?

Single test case running more than hour on device under testing (DUT)
is not a great idea for testing per commit / push. Your feedback is
appreciated on running or skipping (exclude from default run) this
test case from selftest full run.

Thank you.

Best regards
Naresh Kamboju
