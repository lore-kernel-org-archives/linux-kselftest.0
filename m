From: shuahkh at osg.samsung.com (Shuah Khan)
Date: Fri, 20 Apr 2018 14:33:48 -0600
Subject: [GIT PULL] kselftest update for 4.17-rc2
Message-ID: <4c8657ee-d7e8-3e87-05fb-57de6fff13e2@osg.samsung.com>

Hi Linus,

Please pull the following Kselftest update for 4.17-rc2


This Kselftest update for 4.17-rc2 consists of a fix from Michael Ellerman
to not run dnotify_test by default to prevent Kselftest running forever.

diff is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------------
The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.17-rc2

for you to fetch changes up to 8bf24e8319613bbe950d4188682b3a0d9441b76b:

  selftests/filesystems: Don't run dnotify_test by default (2018-04-17 17:01:16 -0600)

----------------------------------------------------------------
linux-kselftest-4.17-rc2

This Kselftest update for 4.17-rc2 consists of a fix from Michael Ellerman
to not run dnotify_test by default to prevent Kselftest running forever.

----------------------------------------------------------------
Michael Ellerman (1):
      selftests/filesystems: Don't run dnotify_test by default

 tools/testing/selftests/filesystems/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-----------------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.17-rc2.diff
Type: text/x-patch
Size: 502 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180420/da12fd7f/attachment.bin>
