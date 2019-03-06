From: shuah@kernel.org (shuah)
Date: Wed, 6 Mar 2019 14:04:20 -0700
Subject: [GIT PULL] Kselftest update for Linux 5.1-rc1
Message-ID: <0935afa2-ad88-0db9-ca68-1b99544b8397@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190306210420.oLRJ57WOJC29tiCBCDCTkMazuw0G03SMONMWsdgc8JQ@z>

Hi Linus,

Please pull the following Kselftest update for Linux 5.1-rc1

This Kselftest update for Linux 5.1-rc1 consists of

- ir test compile warnings fixes
- seccomp test fixes and improvements from Tycho Andersen and Kees Cook
- ftrace fixes to non-POSIX-compliant constructs in colored output code
   and handling absence of tput from Juerg Haefliger

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:

   Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.1-rc1

for you to fetch changes up to 0e27ded1159f62ab1a4e723796246bd5b1793b93:

   selftests/ftrace: Handle the absence of tput (2019-02-25 07:48:01 -0700)

----------------------------------------------------------------
linux-kselftest-5.1-rc1

This Kselftest update for Linux 5.1-rc1 consists of

- ir test compile warnings fixes
- seccomp test fixes and improvements from Tycho Andersen and Kees Cook
- ftrace fixes to non-POSIX-compliant constructs in colored output code
   and handling absence of tput from Juerg Haefliger

----------------------------------------------------------------
Juerg Haefliger (3):
       selftests/ftrace: Replace echo -e with printf
       selftests/ftrace: Replace \e with \033
       selftests/ftrace: Handle the absence of tput

Kees Cook (2):
       selftests/harness: Update named initializer syntax
       selftests/seccomp: Actually sleep for 1/10th second

Shuah Khan (3):
       selftests: ir: fix warning: "%s" directive output may be 
truncated ’ directive output may be truncated
       selftests: ir: skip when lirc device doesn't exist.
       selftests: ir: skip when non-root user runs the test

Tycho Andersen (6):
       selftests: don't kill child immediately in get_metadata() test
       selftests: fix typo in seccomp_bpf.c
       selftest: include stdio.h in kselftest.h
       selftests: skip seccomp get_metadata test if not real root
       selftests: set NO_NEW_PRIVS bit in seccomp user tests
       selftests: unshare userns in seccomp pidns testcases

  tools/testing/selftests/ftrace/ftracetest     | 21 +++++++-----
  tools/testing/selftests/ir/ir_loopback.c      |  6 ++--
  tools/testing/selftests/ir/ir_loopback.sh     |  5 +++
  tools/testing/selftests/kselftest.h           |  1 +
  tools/testing/selftests/kselftest_harness.h   | 10 +++---
  tools/testing/selftests/seccomp/seccomp_bpf.c | 47 
+++++++++++++++++++++++----
  6 files changed, 68 insertions(+), 22 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.1-rc1.diff
Type: text/x-patch
Size: 8798 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190306/7ce3eea8/attachment-0001.bin>
