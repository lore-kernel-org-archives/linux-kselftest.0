From: shuah@kernel.org (shuah)
Date: Tue, 9 Apr 2019 08:38:24 -0600
Subject: secomp_bpf test hangs after global.user_notification_sibling_pid_ns
Message-ID: <eee08d39-7427-5c07-9efe-b5719b2232a4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409143824.V93aazLHGdr5syIvCMOPibFCzxrrEb1rKandWLA5LJo@z>

Hi Kees,

secomp_bpf test hangs after global.user_notification_sibling_pid_ns
when a non-root user runs it on 5.1-rc4

I thought you fixed the problem with this commit:

commit 3d244c192afeee7dd4f5fb1b916ea4e47420d401
Author: Kees Cook <keescook at chromium.org>
Date:   Wed Jan 16 16:35:25 2019 -0800

     selftests/seccomp: Abort without user notification support


seccomp_bpf.c:3380:global.user_notification_sibling_pid_ns:Expected 
unshare(CLONE_NEWPID) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3381:global.user_notification_sibling_pid_ns:Expected 
errno (1) == 0 (0)
seccomp_bpf.c:3365:global.user_notification_sibling_pid_ns:Expected 
unshare(CLONE_NEWPID) (18446744073709551615) == 0 (0)
seccomp_bpf.c:3392:global.user_notification_sibling_pid_ns:Expected 
req.pid (23610) == 0 (0)

hangs right after the above message,

root:

[ RUN      ] global.user_notification_sibling_pid_ns
[       OK ] global.user_notification_sibling_pid_ns
[ RUN      ] global.user_notification_fault_recv
[       OK ] global.user_notification_fault_recv
[ RUN      ] global.seccomp_get_notif_sizes
[       OK ] global.seccomp_get_notif_sizes
[==========] 74 / 74 tests passed.
[  PASSED  ]



I would debug this myself, double edged sword of harness, makes it
hard to debug:)

Can you take a look. "make kselftest" just hangs now and doesn't
complete.

thanks,
-- Shuah
