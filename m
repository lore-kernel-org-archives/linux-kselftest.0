From: naresh.kamboju at linaro.org (Naresh Kamboju)
Date: Fri, 18 Jan 2019 13:39:24 +0530
Subject: selftests/bpf/test_netcnt failed on i386 - ibbpf: failed to create
 map (name: 'percpu_netcnt'): Invalid argument
Message-ID: <CA+G9fYu-ku4dCOnUReot5jz3X18P1dWKiZCnnZaAJJt+p_HNjQ@mail.gmail.com>

Newly added test case bpf test_netcnt failed on i386 and qemu_i386 on
mainline and -next kernel.
Here we are running i386 kernel on x86_64 device.
Pass on x86_64, arm64 and arm.

Am i missing any pre required Kconfigs ?

Test output log,
selftests: bpf: test_netcnt
libbpf: failed to create map (name: 'percpu_netcnt'): Invalid argument
libbpf: failed to load object './netcnt_prog.o'
Failed to load bpf program
not ok 1.. selftests: bpf: test_netcnt [FAIL]
selftests: bpf_test_netcnt [FAIL]

Full test log,
https://lkft.validation.linaro.org/scheduler/job/574652#L2903

Kernel Config,
http://snapshots.linaro.org/openembedded/lkft/rocko/intel-core2-32/lkft/linux-mainline-ddiaz/52/config

Test results comparison of arm64, arm, x86_64 and i386 (kernel running
on x86_64 machine).
https://qa-reports.linaro.org/_/comparetest/?project=22&project=6&suite=kselftest&test=bpf_test_netcnt

Best regards
Naresh Kamboju
