From: liuwl.fnst at cn.fujitsu.com (Liu, Wenlong)
Date: Fri, 30 Nov 2018 02:51:02 +0000
Subject: seccomp/seccomp_bpf: test terminated by the not expected behavior
Message-ID: <F40213214988A94A9DDBFC5F7146FC5E01AF2E2998@G08CNEXMBPEKD01.g08.fujitsu.local>

Hi,

The test outputs of those failures in seccomp_bpf as below:
---
m3ulcb:/opt/kselftest/seccomp# ./seccomp_bpf 61
[ RUN      ] global.syscall_restart
seccomp_bpf.c:2754:global.syscall_restart:Expected 0x200 (512) == msg (256)
global.syscall_restart: Test terminated by assertion
[     FAIL ] global.syscall_restart
m3ulcb:/opt/kselftest/seccomp# seccomp_bpf.c:2685:global.syscall_restart:Expected 0 (0) == nanosleep(&timeout, ((void *)0)) (-1)
seccomp_bpf.c:2686:global.syscall_restart:Call to nanosleep() failed (errno 38)
seccomp_bpf.c:2690:global.syscall_restart:Expected 1 (1) == read(pipefd[0], &buf, 1) (0)
seccomp_bpf.c:2691:global.syscall_restart:Failed final read() from parent
seccomp_bpf.c:2693:global.syscall_restart:Expected '!' (33) == buf (46)
seccomp_bpf.c:2694:global.syscall_restart:Failed to get final data from read()

m3ulcb:/opt/kselftest/seccomp# ./seccomp_bpf 53
[ RUN      ] global.detect_seccomp_filter_flags
seccomp_bpf.c:2104:global.detect_seccomp_filter_flags:Expected 14 (14) == (*__errno_location ()) (22)
seccomp_bpf.c:2106:global.detect_seccomp_filter_flags:Failed to detect that a known-good filter flag (0x4) is supported!
seccomp_bpf.c:2115:global.detect_seccomp_filter_flags:Expected 14 (14) == (*__errno_location ()) (22)
seccomp_bpf.c:2117:global.detect_seccomp_filter_flags:Failed to detect that all known-good filter flags (0x7) are supported!
global.detect_seccomp_filter_flags: Test failed at step #6
[     FAIL ] global.detect_seccomp_filter_flags

m3ulcb:/opt/kselftest/seccomp# ./seccomp_bpf 64
[ RUN      ] global.get_metadata
seccomp_bpf.c:2914:global.get_metadata:Expected sizeof(md) (16) == ptrace(0x420d, pid, sizeof(md), &md) (-1)
global.get_metadata: Test terminated by assertion
[     FAIL ] global.get_metadata

---
Although I am not so familiar with SECCOMP and BPF, I checked some related documents and codes.
About the failures above, what the most confused me is that why it always give ENOSYS.

Am I missing something?
Thanks in advance.

PS:
I didn't run "make kselftest-merge" before compiling the kernel that I'm using.

---
The Test Environment:
- Kernel version: v4.14.0

The following configs were enabled.
- CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
- CONFIG_SECCOMP_FILTER=y
- CONFIG_SECCOMP=y

Best regards
Liu
