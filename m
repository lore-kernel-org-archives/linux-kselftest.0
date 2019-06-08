From: skhan at linuxfoundation.org (Shuah Khan)
Date: Fri, 7 Jun 2019 20:11:05 -0600
Subject: [GIT PULL] Kselftest second fixes update for Linux 5.2-rc4
Message-ID: <f97f7947-db3b-07dd-157d-78ab9840a4dc@linuxfoundation.org>

Hi Linus,

Please pull the following second Kselftest fixes update for
Linux 5.2 rc4.

This Kselftest second fixes update for Linux 5.2-rc4 consists of a
single fix for vm test build failure regression when it is built by
itself.

I found this while I was sanity checking the first fixes update for
Linux 5.2. Would like to get this into rc4.

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------
The following changes since commit bc2cce3f2ebcae02aa4bb29e3436bf75ee674c32:

   selftests: vm: install test_vmalloc.sh for run_vmtests (2019-05-30 
08:32:57 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc4-2

for you to fetch changes up to e2e88325f4bcaea51f454723971f7b5ee0e1aa80:

   selftests: vm: Fix test build failure when built by itself 
(2019-06-05 16:05:40 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc4-2

This Kselftest second fixes update for Linux 5.2-rc4 consists of a single
fix for vm test build failure regression when it is built by itself.

----------------------------------------------------------------
Shuah Khan (1):
       selftests: vm: Fix test build failure when built by itself

  tools/testing/selftests/vm/Makefile | 4 ----
  1 file changed, 4 deletions(-)
----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc4-2.diff
Type: text/x-patch
Size: 453 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190607/a5a1d000/attachment.bin>
