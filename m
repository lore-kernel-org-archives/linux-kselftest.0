From: shuah@kernel.org (shuah)
Date: Fri, 21 Dec 2018 09:45:50 -0700
Subject: [GIT PULL] kselftest update for Linux 4.21-rc1
Message-ID: <6d5aa143-4c9b-0bd9-4c14-8801f64ac40c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181221164550.FysV79SqCTvoRkf0LFYHylwMz39U-63tSyHlFeNm4Yo@z>

Hi Linus,

Please pull the following Kselftest update for Linux 4.21-rc1.

This Kselftest update for Linux 4.21-rc1 consists of:

- fixes, and improvements to the framework, and individual tests.
- a new media test for IR encoders from Sean Young.
- a new watchdog test option to find time left on a timer.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-4.21-rc1

for you to fetch changes up to 283ac6d5fb2a47f12bcef7806b78acf6ad89907e:

   selftests: Fix test errors related to lib.mk khdr target (2018-12-17 
09:17:55 -0700)

----------------------------------------------------------------
linux-kselftest-4.21-rc1

This Kselftest update for Linux 4.21-rc1 consists of:

- fixes, and improvements to the framework, and individual tests.
- a new media test for IR encoders from Sean Young.
- a new watchdog test option to find time left on a timer.

----------------------------------------------------------------
Colin Ian King (1):
       selftests: watchdog: fix spelling mistake "experies" -> "expires"

Dan Rue (2):
       selftests: firmware: remove use of non-standard diff -Z option
       selftests: firmware: add CONFIG_FW_LOADER_USER_HELPER_FALLBACK to 
config

Daniel Díaz (1):
       selftests: gpio: Find libmount with pkg-config if available

Dmitry V. Levin (1):
       selftests: do not macro-expand failed assertion expressions

Jerry Hoemann (1):
       selftests: watchdog: Add gettimeleft command line arg

Sean Young (1):
       media: rc: self test for IR encoders and decoders

Shuah Khan (1):
       selftests: Fix test errors related to lib.mk khdr target

Thomas Gleixner (1):
       selftests/ftrace: Fix invalid SPDX identifiers

Tom Murphy (1):
       fix dma-buf/udmabuf selftest

tools/testing/selftests/Makefile                   |   2 +
  tools/testing/selftests/android/Makefile           |   2 +-
  tools/testing/selftests/drivers/dma-buf/Makefile   |   2 +
  tools/testing/selftests/drivers/dma-buf/udmabuf.c  |  11 +-
  tools/testing/selftests/firmware/config            |   1 +
  tools/testing/selftests/firmware/fw_filesystem.sh  |   9 +-
  .../ftrace/test.d/ftrace/func-filter-stacktrace.tc |   2 +-
  .../selftests/ftrace/test.d/ftrace/func_cpumask.tc |   2 +-
  tools/testing/selftests/ftrace/test.d/template     |   2 +-
  .../selftests/ftrace/test.d/tracer/wakeup.tc       |   2 +-
  .../selftests/ftrace/test.d/tracer/wakeup_rt.tc    |   2 +-
  tools/testing/selftests/futex/functional/Makefile  |   1 +
  tools/testing/selftests/gpio/Makefile              |  16 +-
  tools/testing/selftests/ir/.gitignore              |   1 +
  tools/testing/selftests/ir/Makefile                |   5 +
  tools/testing/selftests/ir/ir_loopback.c           | 199 
+++++++++++++++++++++
  tools/testing/selftests/ir/ir_loopback.sh          |  20 +++
  tools/testing/selftests/kselftest_harness.h        |  42 ++---
  tools/testing/selftests/kvm/Makefile               |   2 +-
  tools/testing/selftests/lib.mk                     |   8 +-
  .../selftests/networking/timestamping/Makefile     |   1 +
  tools/testing/selftests/tc-testing/bpf/Makefile    |   1 +
  tools/testing/selftests/vm/Makefile                |   1 +
  tools/testing/selftests/watchdog/watchdog-test.c   |  13 +-
  24 files changed, 301 insertions(+), 46 deletions(-)
  create mode 100644 tools/testing/selftests/ir/.gitignore
  create mode 100644 tools/testing/selftests/ir/Makefile
  create mode 100644 tools/testing/selftests/ir/ir_loopback.c
  create mode 100755 tools/testing/selftests/ir/ir_loopback.sh

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-4.21-rc1.diff
Type: text/x-patch
Size: 24361 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20181221/049b84e5/attachment-0001.bin>
