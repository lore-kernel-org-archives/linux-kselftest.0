From: john.stultz@linaro.org (John Stultz)
Date: Tue,  3 Jul 2018 12:36:27 -0700
Subject: [RFC][PATCH] selftest: timers: Tweak raw_skew to SKIP when ADJ_OFFSET
 is in progress
Message-ID: <1530646587-12101-1-git-send-email-john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180703193627.dWJSExucUMTc8zh4sjEAgr7lImluyHUyc5u93gFdV5A@z>

In the past we've warned when ADJ_OFFSET was in progress, usually
caused by ntpd or some other time adjusting daemon running in non
steady sate, which can cause the skew calculations to be incorrect

Thus, this patch sets a flag which we check when we fail so that
we don't cause false negatives.

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
 tools/testing/selftests/timers/raw_skew.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index ca6cd14..d3fc453 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -94,6 +94,7 @@ int main(int argv, char **argc)
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
 	struct timex tx1, tx2;
+	int adj_offset_bad = 0;
 
 	setbuf(stdout, NULL);
 
@@ -108,8 +109,10 @@ int main(int argv, char **argc)
 	start = mon;
 	delta1 = diff_timespec(mon, raw);
 
-	if (tx1.offset)
+	if (tx1.offset) {
 		printf("WARNING: ADJ_OFFSET in progress, this will cause inaccurate results\n");
+		adj_offset_bad = 1;
+	}
 
 	printf("Estimating clock drift: ");
 	sleep(120);
@@ -134,6 +137,10 @@ int main(int argv, char **argc)
 	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
 
 	if (llabs(eppm - ppm) > 1000) {
+		if (adj_offset_bad) {
+			printf("	[SKIP]\n");
+			return ksft_exit_skip("ADJ_OFFSET in progress. Shutdown NTPd or other time steering daemons\n");
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
