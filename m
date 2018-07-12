From: john.stultz at linaro.org (John Stultz)
Date: Thu, 12 Jul 2018 13:17:19 -0700
Subject: [GIT PULL][PATCH 0/2] Few timekeeping items for 4.19
Message-ID: <1531426641-20076-1-git-send-email-john.stultz@linaro.org>

Hey Thomas,
  I had a few other items in my stack here, but you've already
queued them in -tip, so here's what I have left.

Let me know if you have any objections or feedback for change.

thanks
-john

Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Ingo Molnar <mingo at kernel.org>
Cc: Miroslav Lichvar <mlichvar at redhat.com>
Cc: Richard Cochran <richardcochran at gmail.com>
Cc: Prarit Bhargava <prarit at redhat.com>
Cc: Stephen Boyd <sboyd at kernel.org>
Cc: Shuah Khan <shuah at kernel.org>
Cc: linux-kselftest at vger.kernel.org

The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

  Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the git repository at:

  https://git.linaro.org/people/john.stultz/linux.git fortglx/4.19/time

for you to fetch changes up to b061c7a513afe14a68af41cec7c3476befc40e95:

  timekeeping: Update multiplier when NTP frequency is set directly (2018-07-10 12:44:25 -0700)

----------------------------------------------------------------
John Stultz (1):
      selftest: timers: Tweak raw_skew to SKIP when ADJ_OFFSET/other clock adjustments are in progress

Miroslav Lichvar (1):
      timekeeping: Update multiplier when NTP frequency is set directly

 kernel/time/timekeeping.c                 | 36 ++++++++++++++++++++++++++++++------
 tools/testing/selftests/timers/raw_skew.c |  5 +++++
 2 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
