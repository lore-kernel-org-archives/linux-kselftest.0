From: shuah at kernel.org (Shuah Khan)
Date: Wed, 3 Oct 2018 08:42:13 -0600
Subject: [GIT PULL] kselftest fixes update for Linux-4.19-rc7
Message-ID: <ec2d8d2b-c5ac-5ac2-57fd-74efaa7ed0b6@kernel.org>

Hi Greg,

Please pull the following kselftest for 4.19-rc7.

linux-kselftest-4.19-rc7

This fixes update for 4.19-rc7 consists one fix to rseq test to prevent
it from seg-faulting when compiled with -fpie.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------

The following changes since commit 7876320f88802b22d4e2daf7eb027dd14175a0f8:

  Linux 4.19-rc4 (2018-09-16 11:52:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.19-rc7

for you to fetch changes up to ce01a1575f45bf319e374592656441021a7f5823:

  rseq/selftests: fix parametrized test with -fpie (2018-09-27 12:59:19 -0600)

----------------------------------------------------------------
linux-kselftest-4.19-rc7

This fixes update for 4.19-rc7 consists one fix to rseq test to prevent
it from seg-faulting when compiled with -fpie.

----------------------------------------------------------------
Mathieu Desnoyers (1):
      rseq/selftests: fix parametrized test with -fpie

 tools/testing/selftests/rseq/param_test.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.19-rc7.diff
Type: text/x-patch
Size: 1450 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181003/4ce5e752/attachment.bin>
