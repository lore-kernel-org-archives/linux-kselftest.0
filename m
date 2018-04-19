From: alexandre.belloni at bootlin.com (Alexandre Belloni)
Date: Thu, 19 Apr 2018 14:50:26 +0200
Subject: [PATCH 0/4] selftests: rework RTC tests
Message-ID: <20180419125030.5076-1-alexandre.belloni@bootlin.com>

Hi,

This series separates tests using the RTC devices between the one
testing driver agnostic kernel facilities (timers) and the others that
are testing device drivers and hardware.

Then, rtctest is reworked to use the test harness and be much more
robust. Skipping tests is now easier and tests will not block
indefinitively.

I'm planning to send more improvements later this cycle.

Alexandre Belloni (4):
  selftests: timers: move PIE tests out of rtctest
  selftests: timers: rtcpie: restore previous PIE rate
  selftests: move RTC tests to rtc subfolder
  selftests: rtc: rework rtctest

 MAINTAINERS                                   |   2 +-
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/rtc/.gitignore        |   2 +
 tools/testing/selftests/rtc/Makefile          |   9 +
 tools/testing/selftests/rtc/rtctest.c         | 238 +++++++++++
 .../rtctest_setdate.c => rtc/setdate.c}       |   0
 tools/testing/selftests/timers/.gitignore     |   3 +-
 tools/testing/selftests/timers/Makefile       |   4 +-
 tools/testing/selftests/timers/rtcpie.c       | 134 ++++++
 tools/testing/selftests/timers/rtctest.c      | 403 ------------------
 10 files changed, 388 insertions(+), 408 deletions(-)
 create mode 100644 tools/testing/selftests/rtc/.gitignore
 create mode 100644 tools/testing/selftests/rtc/Makefile
 create mode 100644 tools/testing/selftests/rtc/rtctest.c
 rename tools/testing/selftests/{timers/rtctest_setdate.c => rtc/setdate.c} (100%)
 create mode 100644 tools/testing/selftests/timers/rtcpie.c
 delete mode 100644 tools/testing/selftests/timers/rtctest.c

-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
