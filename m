From: shuah@kernel.org (Shuah Khan)
Date: Sun, 16 Sep 2018 14:22:21 -0600
Subject: [GIT PULL] kselftest fixes update for Linux 4.19-rc5
Message-ID: <ce9af2b4-86e1-6603-cd36-b900fb583e6f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180916202221.hwOuVUHo4jc3MicLNAfq1q6YbUXgase5jwmLlAF_lB8@z>

Hi Linus,

Please pull the following Kselftest update for Linux 4.19-rc5

linux-kselftest-4.19-rc5

This Kselftest fixes update for 4.19-rc5 consists of:

-- fixes to build failures
-- fixes to add missing config files to increase test coverage
-- fixes to cgroup test and a new cgroup test for memory.oom.group

Please note that the selftests: add headers_install to lib.mk patch changes
the main Makefile. Some tests can't build without headers installed. This 
fixes such test build failures.

diff is attached.

thanks,
-- Shuah


----------------------------------------------------------------

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.19-rc5

for you to fetch changes up to a987785dcd6c8ae2915460582aebd6481c81eb67:

  Add tests for memory.oom.group (2018-09-07 16:36:01 -0600)

----------------------------------------------------------------
linux-kselftest-4.19-rc5

This Kselftest fixes update for 4.19-rc5 consists of:

-- fixes to build failures
-- fixes to add missing config files to increase test coverage
-- fixes to cgroup test and a new cgroup test for memory.oom.group

----------------------------------------------------------------
Anders Roxell (2):
      selftests: android: move config up a level
      selftests: add headers_install to lib.mk

Jay Kamat (2):
      Fix cg_read_strcmp()
      Add tests for memory.oom.group

Lei Yang (3):
      selftests/efivarfs: add required kernel configs
      selftests: memory-hotplug: add required configs
      cgroup: kselftests: add test_core to .gitignore

Thiago Jung Bauermann (1):
      selftests: kselftest: Remove outdated comment

 Makefile                                           |  14 +-
 scripts/subarch.include                            |  13 ++
 tools/testing/selftests/android/Makefile           |   2 +-
 tools/testing/selftests/android/{ion => }/config   |   0
 tools/testing/selftests/android/ion/Makefile       |   2 +
 tools/testing/selftests/cgroup/.gitignore          |   1 +
 tools/testing/selftests/cgroup/cgroup_util.c       |  38 +++-
 tools/testing/selftests/cgroup/cgroup_util.h       |   1 +
 tools/testing/selftests/cgroup/test_memcontrol.c   | 205 +++++++++++++++++++++
 tools/testing/selftests/efivarfs/config            |   1 +
 tools/testing/selftests/futex/functional/Makefile  |   1 +
 tools/testing/selftests/gpio/Makefile              |   7 +-
 tools/testing/selftests/kselftest.h                |   1 -
 tools/testing/selftests/kvm/Makefile               |   7 +-
 tools/testing/selftests/lib.mk                     |  12 ++

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.19-rc5.diff
Type: text/x-patch
Size: 15816 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180916/9f7a3e45/attachment.bin>
