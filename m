From: shuah at kernel.org (shuah)
Date: Thu, 13 Dec 2018 13:37:08 -0700
Subject: [GIT PULL] kselftest update for Linux 4.20-rc7
Message-ID: <fe1c6815-c338-e264-cd77-7d92457acf4c@kernel.org>

Hi Linus,

Please pull the following Kselftest update for Linux 4.20-rc7.

This Kselftest update for Linux 4.20-rc7 consists of a single fix for
seccomp test from Kees Cook.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-4.20-rc7

for you to fetch changes up to 2bd61abead58c82714a1f6fa6beb0fd0df6a6d13:

   selftests/seccomp: Remove SIGSTOP si_pid check (2018-12-11 17:57:30 
-0700)

----------------------------------------------------------------
linux-kselftest-4.20-rc7

This Kselftest update for Linux 4.20-rc7 consists of a single fix for
seccomp test from Kees Cook.

----------------------------------------------------------------
Kees Cook (1):
       selftests/seccomp: Remove SIGSTOP si_pid check

  tools/testing/selftests/seccomp/seccomp_bpf.c | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.20-rc7.diff
Type: text/x-patch
Size: 1039 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181213/cd7c93a8/attachment-0001.bin>
