From: skhan at linuxfoundation.org (Shuah Khan)
Date: Wed, 29 May 2019 09:04:42 -0600
Subject: [GIT PULL] Kselftest fixes update for Linux 5.2-rc3
Message-ID: <966d12fc-d32e-c72c-7996-34b8250388dc@linuxfoundation.org>

Hi Linus,

Please pull the following Kselftest fixes update for Linux 5.2-rc3.

This Kselftest update for Linux 5.2-rc3 consists of

- Alexandre Belloni's fixes to rtc regressions introduced in kselftest
   Makefile test run output refactoring work from Kees Cook.

- ftrace test checkbashisms fixes from Masami Hiramatsu

As a note, it is an usual and expected outcome to see a few regressions
when Kselftest run-time scripts are enhanced. No surprises there.

I am glad we are finding these problems early on in the rc cycle.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc3

for you to fetch changes up to eff82a263b5cfa3427fd9dbfedd96da94fdc9f19:

   selftests: rtc: rtctest: specify timeouts (2019-05-24 13:39:58 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc3

This Kselftest update for Linux 5.2-rc3 consists of

- Alexandre Belloni's fixes to rtc regressions introduced in kselftest
   Makefile test run output refactoring work from Kees Cook.

- ftrace test checkbashisms fixes from Masami Hiramatsu

----------------------------------------------------------------
Alexandre Belloni (2):
       selftests/harness: Allow test to configure timeout
       selftests: rtc: rtctest: specify timeouts

Masami Hiramatsu (2):
       selftests/ftrace: Make a script checkbashisms clean
       selftests/ftrace: Add checkbashisms meta-testcase

  tools/testing/selftests/ftrace/ftracetest           |  1 +
  .../selftests/ftrace/test.d/kprobe/kprobe_ftrace.tc |  2 +-
  .../selftests/ftrace/test.d/selftest/bashisms.tc    | 21 
+++++++++++++++++++++
  tools/testing/selftests/kselftest_harness.h         | 17 ++++++++++++-----
  tools/testing/selftests/rtc/rtctest.c               |  6 +++---
  5 files changed, 38 insertions(+), 9 deletions(-)
  create mode 100644 
tools/testing/selftests/ftrace/test.d/selftest/bashisms.tc
----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc3.diff
Type: text/x-patch
Size: 5340 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190529/97dede7b/attachment.bin>
