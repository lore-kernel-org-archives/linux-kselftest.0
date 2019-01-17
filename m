From: shuah@kernel.org (shuah)
Date: Wed, 16 Jan 2019 17:01:32 -0700
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
Message-ID: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190117000132.xHTbsSUih5e1wZN1FrtxMQM1BeLLmRPOo0QUJaYwZwM@z>

Hi Kees and James,

seccomp_bpf test hangs right after the following test passes
with EBUSY. Please see log at the end.

/* Installing a second listener in the chain should EBUSY */
         EXPECT_EQ(user_trap_syscall(__NR_getpid,
                                     SECCOMP_FILTER_FLAG_NEW_LISTENER),
                   -1);
         EXPECT_EQ(errno, EBUSY);


The user_notification_basic test starts running I assume and then
the hang.

The only commit I see that could be suspect is the following as
it talks about adding SECCOMP_RET_USER_NOTIF

commit d9a7fa67b4bfe6ce93ee9aab23ae2e7ca0763e84
Merge: f218a29c25ad 55b8cbe470d1
Author: Linus Torvalds <torvalds at linux-foundation.org>
Date:   Wed Jan 2 09:48:13 2019 -0800

     Merge branch 'next-seccomp' of 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security

     Pull seccomp updates from James Morris:

      - Add SECCOMP_RET_USER_NOTIF

      - seccomp fixes for sparse warnings and s390 build (Tycho)

     * 'next-seccomp' of 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security:
       seccomp, s390: fix build for syscall type change
       seccomp: fix poor type promotion
       samples: add an example of seccomp user trap
       seccomp: add a return code to trap to userspace
       seccomp: switch system call argument type to void *
       seccomp: hoist struct seccomp_data recalculation higher


Any ideas on how to proceed? Here is the log. The following
reproduces the problem.

make -C tools/testing/selftests/seccomp/ run_tests


seccomp_bpf.c:2947:global.get_metadata:Expected 0 (0) == 
seccomp(SECCOMP_SET_MODE_FILTER, SECCOMP_FILTER_FLAG_LOG, &prog) 
(18446744073709551615)
seccomp_bpf.c:2959:global.get_metadata:Expected 1 (1) == read(pipefd[0], 
&buf, 1) (0)
global.get_metadata: Test terminated by assertion
[     FAIL ] global.get_metadata
[ RUN      ] global.user_notification_basic
seccomp_bpf.c:3036:global.user_notification_basic:Expected 0 (0) == 
WEXITSTATUS(status) (1)
seccomp_bpf.c:3039:global.user_notification_basic:Expected 
seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3040:global.user_notification_basic:Expected 
seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3041:global.user_notification_basic:Expected 
seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3042:global.user_notification_basic:Expected 
seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3047:global.user_notification_basic:Expected listener 
(18446744073709551615) >= 0 (0)
seccomp_bpf.c:3053:global.user_notification_basic:Expected errno (13) == 
EBUSY (16)

thanks,
-- Shuah
