From: keescook@chromium.org (Kees Cook)
Date: Mon, 20 May 2019 15:37:47 -0700
Subject: [PATCH v5.2-rc2 0/2] selftests: Remove forced unbuffering for test
 running
Message-ID: <20190520223749.13476-1-keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190520223747.MfF7I0_60-8X6bh6oBaMq2nHnOLSQSBuFxy8R3KJRDE@z>

This should fix test regressions seen when running under unbuffered
output. Additionally, fixes are added for the missing flushed output
in the timers test which become obvious without unbuffered output.

-Kees

Kees Cook (2):
  selftests: Remove forced unbuffering for test running
  selftests/timers: Add missing fflush(stdout) calls

 tools/testing/selftests/kselftest/runner.sh     | 12 +-----------
 tools/testing/selftests/timers/adjtick.c        |  1 +
 tools/testing/selftests/timers/leapcrash.c      |  1 +
 tools/testing/selftests/timers/mqueue-lat.c     |  1 +
 tools/testing/selftests/timers/nanosleep.c      |  1 +
 tools/testing/selftests/timers/nsleep-lat.c     |  1 +
 tools/testing/selftests/timers/raw_skew.c       |  1 +
 tools/testing/selftests/timers/set-tai.c        |  1 +
 tools/testing/selftests/timers/set-tz.c         |  2 ++
 tools/testing/selftests/timers/threadtest.c     |  1 +
 tools/testing/selftests/timers/valid-adjtimex.c |  2 ++
 11 files changed, 13 insertions(+), 11 deletions(-)

-- 
2.17.1
