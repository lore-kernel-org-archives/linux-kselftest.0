From: skhan@linuxfoundation.org (Shuah Khan)
Date: Wed, 5 Jun 2019 10:53:07 -0600
Subject: [GIT PULL] Kselftest fixes update for Linux 5.2-rc4
Message-ID: <c5b4091c-b6bc-0eea-7f64-5334c80be8ed@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190605165307.vGZ-gV2Vjk03-1dUh-MyymcGYoLKJaI1hr7IGRSs18E@z>

Hi Linus,

Please pull the following Kselftest fixes update for Linux 5.2-rc4.

This Kselftest update for Linux 5.2-rc4 consists of

- Alex Shi's fixes to cgroup tests
- Alakesh Haloi's fix to userfaultfd compiler warning
- Naresh Kamboju's fix to vm install to include test script to run
   the test.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------

The following changes since commit eff82a263b5cfa3427fd9dbfedd96da94fdc9f19:

   selftests: rtc: rtctest: specify timeouts (2019-05-24 13:39:58 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest 
tags/linux-kselftest-5.2-rc4

for you to fetch changes up to bc2cce3f2ebcae02aa4bb29e3436bf75ee674c32:

   selftests: vm: install test_vmalloc.sh for run_vmtests (2019-05-30 
08:32:57 -0600)

----------------------------------------------------------------
linux-kselftest-5.2-rc4

This Kselftest update for Linux 5.2-rc4 consists of

- Alex Shi's fixes to cgroup tests
- Alakesh Haloi's fix to userfaultfd compiler warning
- Naresh Kamboju's fix to vm install to include test script to run
   the test.

----------------------------------------------------------------
Alakesh Haloi (1):
       userfaultfd: selftest: fix compiler warning

Alex Shi (3):
       kselftest/cgroup: fix unexpected testing failure on test_memcontrol
       kselftest/cgroup: fix unexpected testing failure on test_core
       kselftest/cgroup: fix incorrect test_core skip

Naresh Kamboju (1):
       selftests: vm: install test_vmalloc.sh for run_vmtests

  tools/testing/selftests/cgroup/test_core.c       | 7 ++++++-
  tools/testing/selftests/cgroup/test_memcontrol.c | 4 ++++
  tools/testing/selftests/vm/Makefile              | 2 ++
  tools/testing/selftests/vm/userfaultfd.c         | 2 +-
  4 files changed, 13 insertions(+), 2 deletions(-)

----------------------------------------------------------------
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux-kselftest-5.2-rc4.diff
Type: text/x-patch
Size: 2610 bytes
Desc: not available
URL: <http://lists.linaro.org/pipermail/linux-kselftest-mirror/attachments/20190605/b655cc29/attachment.bin>
