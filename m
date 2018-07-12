From: john.stultz at linaro.org (John Stultz)
Date: Thu, 12 Jul 2018 13:17:20 -0700
Subject: [PATCH 1/2] selftest: timers: Tweak raw_skew to SKIP when
 ADJ_OFFSET/other clock adjustments are in progress
In-Reply-To: <1531426641-20076-1-git-send-email-john.stultz@linaro.org>
References: <1531426641-20076-1-git-send-email-john.stultz@linaro.org>
Message-ID: <1531426641-20076-2-git-send-email-john.stultz@linaro.org>

In the past we've warned when ADJ_OFFSET was in progress, usually
caused by ntpd or some other time adjusting daemon running in non
steady sate, which can cause the skew calculations to be
incorrect.

Thus, this patch checks to see if the clock was being adjusted
when we fail so that we don't cause false negatives.

Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Ingo Molnar <mingo at kernel.org>
Cc: Miroslav Lichvar <mlichvar at redhat.com>
Cc: Richard Cochran <richardcochran at gmail.com>
Cc: Prarit Bhargava <prarit at redhat.com>
Cc: Stephen Boyd <sboyd at kernel.org>
Cc: Shuah Khan <shuah at kernel.org>
Cc: linux-kselftest at vger.kernel.org
Suggested-by: Miroslav Lichvar <mlichvar at redhat.com>
Signed-off-by: John Stultz <john.stultz at linaro.org>
---
v2: Widened the checks to look for other clock adjustments that
    could happen, as suggested by Miroslav
v3: Fixed up commit message
---
 tools/testing/selftests/timers/raw_skew.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index ca6cd14..dcf73c5 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -134,6 +134,11 @@ int main(int argv, char **argc)
 	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
 
 	if (llabs(eppm - ppm) > 1000) {
+		if (tx1.offset || tx2.offset ||
+		    tx1.freq != tx2.freq || tx1.tick != tx2.tick) {
+			printf("	[SKIP]\n");
+			return ksft_exit_skip("The clock was adjusted externally. Shutdown NTPd or other time sync daemons\n");
+		}
 		printf("	[FAILED]\n");
 		return ksft_exit_fail();
 	}
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
