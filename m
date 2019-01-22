From: shuah at kernel.org (shuah)
Date: Tue, 22 Jan 2019 11:10:47 -0700
Subject: {GIT PULL] Kselftest update for Linux 5.0-rc4
Message-ID: <8e4a8f43-c135-1ac6-8ca1-5bc75f02d787@kernel.org>

Hi Linus,

Please pull the following Kselftest update for Linux 5.0-rc4

This Kselftest update for Linux 5.0-rc4 consists of fixes to rtc,
seccomp and other tests.

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.0-rc4

for you to fetch changes up to 3d244c192afeee7dd4f5fb1b916ea4e47420d401:

   selftests/seccomp: Abort without user notification support 
(2019-01-17 11:00:23 -0700)

----------------------------------------------------------------
linux-kselftest-5.0-rc4

This Kselftest update for Linux 5.0-rc4 consists of fixes to rtc, seccomp
and other tests.

----------------------------------------------------------------
Alexandre Belloni (2):
       selftests: rtc: rtctest: fix alarm tests
       selftests: rtc: rtctest: add alarm test on minute boundary

Alison Schofield (1):
       selftests/vm/gup_benchmark.c: match gup struct to kernel

Colin Ian King (1):
       x86/mpx/selftests: fix spelling mistake "succeded" -> "succeeded"

Fathi Boudra (1):
       selftests: seccomp: use LDLIBS instead of LDFLAGS

Geert Uytterhoeven (1):
       selftests: gpio-mockup-chardev: Check asprintf() for error

Kees Cook (1):
       selftests/seccomp: Abort without user notification support

Sabyasachi Gupta (1):
       tools/testing/selftests/x86/unwind_vdso.c: Remove duplicate header

  tools/testing/selftests/gpio/gpio-mockup-chardev.c |   9 +-
  tools/testing/selftests/rtc/rtctest.c              | 109 
++++++++++++++++++++-
  tools/testing/selftests/seccomp/Makefile           |   2 +-
  tools/testing/selftests/seccomp/seccomp_bpf.c      |  10 +-
  tools/testing/selftests/vm/gup_benchmark.c         |   1 +
  tools/testing/selftests/x86/mpx-mini-test.c        |   2 +-
  tools/testing/selftests/x86/unwind_vdso.c          |   1 -
  7 files changed, 118 insertions(+), 16 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.0-rc4.diff
Type: text/x-patch
Size: 7806 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190122/e6d5f49a/attachment.bin>
