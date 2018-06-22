From: shuah@kernel.org (Shuah Khan)
Date: Fri, 22 Jun 2018 08:54:54 -0600
Subject: [GIT PULL] kselftest fixes update for Linux 4.18-rc2
Message-ID: <c25e444d-734b-34be-2221-783d2dd78fa6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180622145454.TX3AGoQV0kc3h_oWMzthudTBoJ51VP8Jylftsex3d9Y@z>

Hi Linus,

Please pull the following kselftest fixes update for Linux 4.18-rc2

This Kselftest fixes update for Linux 4.18-rc2:

- Fixes new sparc64 adi driver test compile errors on non-sparc systems.
- Fixes config fragment for sync framework for improved test coverage.
- Fixes several tests to return correct Kselftest skip code.

I included a patch that adds missing SPDX license text in the Makefile for
the new Sparc64 test that went into 4.18-rc1. It should have been added in
the final version of the patches that went into 4.18-rc1.

diff is attached.

thanks,
-- Shuah

-----------------------------------------------------------------------------
The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux-kselftest-4.18-rc2

for you to fetch changes up to eb83d5f7d07ed913d62ca4ad1e14fb6ca4937bab:

  selftests: sparc64: Add missing SPDX License Identifiers (2018-06-18 09:29:20 -0600)

----------------------------------------------------------------
linux-kselftest-4.18-rc2

This Kselftest fixes update for Linux 4.18-rc2:

- Fixes new sparc64 adi driver test compile errors on non-sparc systems.
- Fixes config fragment for sync framework for improved test coverage.
- Fixes several tests to return correct Kselftest skip code.

----------------------------------------------------------------
Fathi Boudra (1):
      selftests: sync: add config fragment for testing sync framework

Shuah Khan (Samsung OSG) (9):
      selftests: pstore: return Kselftest Skip code for skipped tests
      selftests: static_keys: return Kselftest Skip code for skipped tests
      selftests: sysctl: return Kselftest Skip code for skipped tests
      selftests: user: return Kselftest Skip code for skipped tests
      selftests: zram: return Kselftest Skip code for skipped tests
      selftests: vm: return Kselftest Skip code for skipped tests
      selftests: sparc64: Fix to do nothing on non-sparc64
      selftests: sparc64: delete RUN_TESTS and EMIT_TESTS overrides
      selftests: sparc64: Add missing SPDX License Identifiers

 .../selftests/pstore/pstore_post_reboot_tests        |  5 ++++-
 tools/testing/selftests/sparc64/Makefile             | 20 ++++++++++++--------
 tools/testing/selftests/sparc64/drivers/Makefile     |  2 +-
 .../selftests/static_keys/test_static_keys.sh        | 13 +++++++++++++
 tools/testing/selftests/sync/config                  |  4 ++++
 tools/testing/selftests/sysctl/sysctl.sh             | 20 +++++++++++++-------
tools/testing/selftests/user/test_user_copy.sh       |  7 +++++++
 tools/testing/selftests/vm/compaction_test.c         |  4 +++-
 tools/testing/selftests/vm/mlock2-tests.c            | 12 +++++++-----
 tools/testing/selftests/vm/run_vmtests               |  5 ++++-
 tools/testing/selftests/vm/userfaultfd.c             |  4 +++-
 tools/testing/selftests/zram/zram.sh                 |  5 ++++-
 tools/testing/selftests/zram/zram_lib.sh             |  5 ++++-
 13 files changed, 79 insertions(+), 27 deletions(-)
 create mode 100644 tools/testing/selftests/sync/config
-----------------------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.18-rc2.diff
Type: text/x-patch
Size: 10604 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20180622/0926152f/attachment.bin>
