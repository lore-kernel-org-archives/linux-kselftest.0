From: shuah at kernel.org (shuah)
Date: Thu, 31 Jan 2019 11:35:36 -0700
Subject: [GIT PULL] Kselftest update for Linux 5.0-rc5
Message-ID: <861aa0ec-3f5e-27aa-8cfb-d7f2d3fdb24b@kernel.org>

Hi Linus,

Please pull the following Kselftest updated for Linux 5.0-rc5

This Kselftest update for Linux 5.0-rc5 consists of run-time fixes to
cpu-hotplug, and seccomp tests, compile fixes to ir, net, and timers
Makefiles.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 3d244c192afeee7dd4f5fb1b916ea4e47420d401:

   selftests/seccomp: Abort without user notification support 
(2019-01-17 11:00:23 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.0-rc5

for you to fetch changes up to 7d4e591bc051d3382c45caaa2530969fb42ed23d:

   selftests: timers: use LDLIBS instead of LDFLAGS (2019-01-28 08:02:12 
-0700)

----------------------------------------------------------------
linux-kselftest-5.0-rc5

This Kselftest update for Linux 5.0-rc5 consists of run-time fixes to
cpu-hotplug, and seccomp tests, compile fixes to ir, net, and timers
Makefiles.

----------------------------------------------------------------
Colin Ian King (1):
       selftests: cpu-hotplug: fix case where CPUs offline > CPUs present

Fathi Boudra (2):
       selftests: net: use LDLIBS instead of LDFLAGS
       selftests: timers: use LDLIBS instead of LDFLAGS

Kees Cook (1):
       selftests/seccomp: Enhance per-arch ptrace syscall skip tests

Sean Young (1):
       selftests: Use lirc.h from kernel tree, not from system

  .../selftests/cpu-hotplug/cpu-on-off-test.sh       | 13 +++-
  tools/testing/selftests/ir/Makefile                |  2 +
  tools/testing/selftests/net/Makefile               |  2 +-
  tools/testing/selftests/seccomp/seccomp_bpf.c      | 72 
+++++++++++++++++-----
  tools/testing/selftests/timers/Makefile            |  2 +-
  5 files changed, 71 insertions(+), 20 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.0-rc5.diff
Type: text/x-patch
Size: 7934 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190131/0a8696c4/attachment.bin>
