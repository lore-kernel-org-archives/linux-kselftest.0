From: shuah at kernel.org (Shuah Khan)
Date: Thu, 3 May 2018 14:50:58 -0600
Subject: [GIT PULL] kselftest update for 4.17-4
Message-ID: <c5fc8296-5cdc-9827-e7ad-c6e7d00ba0a9@kernel.org>

Hi Linus,

Please pull the following Kselftest update for 4.17-rc4

This Kselftest update for 4.17-rc4 consists of a fix for a syntax error
in the script that runs selftests. Mathieu Desnoyers found this bug in
the script on systems running GNU Make 3.8 or older.

diff is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------
The following changes since commit 8bf24e8319613bbe950d4188682b3a0d9441b76b:

  selftests/filesystems: Don't run dnotify_test by default (2018-04-17 17:01:16 -0600)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.17-rc4

for you to fetch changes up to a33554401e4746cc33307910a1baad63ce3fd650:

  selftests: Fix lib.mk run_tests target shell script (2018-04-27 16:06:36 -0600)

----------------------------------------------------------------
linux-kselftest-4.17-rc4

This Kselftest update for 4.17-rc4 consists of a fix for a syntax error
in the script that runs selftests. Mathieu Desnoyers found this bug in
the script on systems running GNU Make 3.8 or older.

----------------------------------------------------------------
Mathieu Desnoyers (1):
      selftests: Fix lib.mk run_tests target shell script

 tools/testing/selftests/lib.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
-----------------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.17-rc4.diff
Type: text/x-patch
Size: 663 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180503/46ca27a3/attachment.bin>
