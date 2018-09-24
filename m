From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Mon, 24 Sep 2018 13:53:01 +0200
Subject: [PATCH 4.4 62/70] selftest: timers: Tweak raw_skew to SKIP when
 ADJ_OFFSET/other clock adjustments are in progress
In-Reply-To: <20180924113058.420454070@linuxfoundation.org>
References: <20180924113058.420454070@linuxfoundation.org>
Message-ID: <20180924113107.101779218@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180924115301.J5T4sPo42O1U_jRlP0Q_yMmkQHar5F89KrkpbuK0bgU@z>

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: John Stultz <john.stultz@linaro.org>

[ Upstream commit 1416270f4a1ae83ea84156ceba19a66a8f88be1f ]

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
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
v2: Widened the checks to look for other clock adjustments that
    could happen, as suggested by Miroslav
v3: Fixed up commit message
Signed-off-by: Sasha Levin <alexander.levin at microsoft.com>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
---
 tools/testing/selftests/timers/raw_skew.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -146,6 +146,11 @@ int main(int argv, char **argc)
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
