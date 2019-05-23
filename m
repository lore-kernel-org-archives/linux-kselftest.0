From: alexandre.belloni at bootlin.com (Alexandre Belloni)
Date: Fri, 24 May 2019 00:42:21 +0200
Subject: [PATCH 0/2] kselftest: fix rtctest timeout
Message-ID: <20190523224223.11054-1-alexandre.belloni@bootlin.com>

Hi,

Commit a745f7af3cbd ("selftests/harness: Add 30 second timeout per
test") wrongly assumed that no individual test would run for more than
30 seconds and this silently broke rtctest.

Please consider the following patches as fixes for v5.2 to avoid having
any non working release.

Thanks,

Alexandre Belloni (2):
  selftests/harness: Allow test to configure timeout
  selftests: rtc: rtctest: specify timeouts

 tools/testing/selftests/kselftest_harness.h | 17 ++++++++++++-----
 tools/testing/selftests/rtc/rtctest.c       |  6 +++---
 2 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.21.0
