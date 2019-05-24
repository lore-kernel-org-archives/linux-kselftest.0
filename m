From: skhan@linuxfoundation.org (Shuah Khan)
Date: Fri, 24 May 2019 15:19:29 -0600
Subject: [GIT PULL] Kselftest fixes update for Linux 5.2-rc2
Message-ID: <46b8fc51-ac8f-c03d-443e-4bd265cd4527@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524211929.T8jhvfqA3N-roynUvA7S601MjsoM6lWvnRism6xow60@z>

Hi Linus,

Please pull the following Kselftest fixes update for Linux 5.2-rc2.

This Kselftest fixes update for Linux 5.2-rc2 consists of:

- 2 fixes to regressions introduced in kselftest Makefile test run
   output refactoring work from Kees Cook.
- Adding Atom support to syscall_arg_fault test from Tong Bo.

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc2

for you to fetch changes up to fe48319243a626c860fd666ca032daacc2ba84a5:

   selftests/timers: Add missing fflush(stdout) calls (2019-05-21 
09:24:31 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc2

This Kselftest fixes update for Linux 5.2-rc2 consists of:

- 2 fixes to regressions introduced in kselftest Makefile test run output
   refactoring work from Kees Cook.
- Adding Atom support to syscall_arg_fault test from Tong Bo.

----------------------------------------------------------------
Kees Cook (2):
       selftests: Remove forced unbuffering for test running
       selftests/timers: Add missing fflush(stdout) calls

Tong Bo (1):
       selftests/x86: Support Atom for syscall_arg_fault test

  tools/testing/selftests/kselftest/runner.sh     | 12 +-----------
  tools/testing/selftests/timers/adjtick.c        |  1 +
  tools/testing/selftests/timers/leapcrash.c      |  1 +
  tools/testing/selftests/timers/mqueue-lat.c     |  1 +
  tools/testing/selftests/timers/nanosleep.c      |  1 +
  tools/testing/selftests/timers/nsleep-lat.c     |  1 +
  tools/testing/selftests/timers/raw_skew.c       |  1 +
  tools/testing/selftests/timers/set-tai.c        |  1 +
  tools/testing/selftests/timers/set-tz.c         |  2 ++
  tools/testing/selftests/timers/threadtest.c     |  1 +
  tools/testing/selftests/timers/valid-adjtimex.c |  2 ++
  tools/testing/selftests/x86/syscall_arg_fault.c | 10 ++++++++--
  12 files changed, 21 insertions(+), 13 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc2.diff
Type: text/x-patch
Size: 6968 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190524/c8021b7c/attachment.bin>
