Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7A3B52E7;
	Thu, 30 Jul 2026 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394078; cv=none; b=fHiJ992E2woD/PcjV5UKfaQesIiTNT6I+8DYDTKk4KHvo+APaPfQ0RJK0sdUc4WpB3mmgBfw5mZtSpBJ9wbNzqb4qdwA3NMyxQ3VXxR9NSenuEt2DxslaVWKc5J/6EpnAR0ZhEbrS+YT1zoyMPaHkdkGNcAzesElq9KE6lsuvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394078; c=relaxed/simple;
	bh=e7QhqrZZ8D3jWlyIEg5vzkcoZ8upobMej/xkHfVaBOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMmOEkfQ0DpJuR0fUtCDBRVzL6rMGyDS7PWWBzHHwjI+q7zfkNyO+pOjDzb04NR9B+LfRX1Yonbfn8ty838d5sFpxanApxOY6rm8XNRyvptC86Rt0nFSXhpyQCC5A5tRvmnZY9GsddtZ5aqZRkbTWGZaF+ha0Pr7Bm2cRqFHeh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CxphPe2U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hQiXHRyH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CxphPe2U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hQiXHRyH"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785394069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpNWaNTD+KFXGZdaXSzxU4kPTm4X1KDOpnVMXm6TXjU=;
	b=CxphPe2UZUdxTd8HyaMOVnhQWnyQzttBgZlUvPp04US6Ouby4uGzHrUqTzhA36ULi2rXW5
	9HQF9153lGNdNUeKcAm1UvQ726POIJDz0SidKUHUgUaJxt74SQH1+aAK77vg3haFOtB+hv
	ELWsPQJxc+WpngPtVvoFw/F1gokuAuRCCO225LqV9aa2RdswR215yZC87Y3qZPokON+aS6
	4V1TkE2yjEZlZ9fjZQKpWKMS09JE/l4yZbtT9nsgNsWdm+c1pssAyJzrQIsUMn/yms/Zv3
	fktc0q0yddYZF956j4o+rZ3znsQx39F1iILPD3m0WV/mGAS0MqdUaVxmLnldbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785394069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpNWaNTD+KFXGZdaXSzxU4kPTm4X1KDOpnVMXm6TXjU=;
	b=hQiXHRyH+rfJRMDyabuTqCDcftPjt811Og9Jp5ZZZ4as1zX7ESFcGbjEzE9Q/N5NlrCYsv
	PAispOElu9goB4Dg==
Date: Thu, 30 Jul 2026 08:47:44 +0200
Subject: [PATCH 07/16] selftests: timers: Use clock_name() and constants
 from clock-helpers.h
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260730-auxclock-nanosleep-prep-v1-7-cd8b61229a7c@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
In-Reply-To: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
To: John Stultz <jstultz@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785394062; l=19439;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=e7QhqrZZ8D3jWlyIEg5vzkcoZ8upobMej/xkHfVaBOw=;
 b=lnvNublpWzedgb+AkhlbX2kxLXFISXOh5Mh3YgVtjMnpy6yZxhosya7Vxncwn33RNrXXaUFM8
 KHR9ewC7CJ3CNv//f1widZS6h1CBAKWP1LS9Y0h6+SP6viwVA89tVP+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Replace the many repetitions of custom clockid_t to string translation
with the clock_name() helper from clock-helpers.h.
Also drop the custom ?SEC_PER_?SEC definitions.

Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/timers/adjtick.c           |  5 ++-
 .../testing/selftests/timers/alarmtimer-suspend.c  | 36 ++-----------------
 .../testing/selftests/timers/inconsistency-check.c | 38 +++-----------------
 tools/testing/selftests/timers/leap-a-day.c        |  3 +-
 tools/testing/selftests/timers/mqueue-lat.c        |  3 +-
 tools/testing/selftests/timers/nanosleep.c         | 42 ++++------------------
 tools/testing/selftests/timers/nsleep-lat.c        | 36 ++-----------------
 tools/testing/selftests/timers/posix_timers.c      | 33 +++++++++--------
 tools/testing/selftests/timers/raw_skew.c          |  3 +-
 tools/testing/selftests/timers/set-2038.c          |  3 +-
 tools/testing/selftests/timers/set-timer-lat.c     | 41 +++------------------
 tools/testing/selftests/timers/valid-adjtimex.c    |  4 +--
 12 files changed, 47 insertions(+), 200 deletions(-)

diff --git a/tools/testing/selftests/timers/adjtick.c b/tools/testing/selftests/timers/adjtick.c
index 22d274d5520f..68009a6d6de8 100644
--- a/tools/testing/selftests/timers/adjtick.c
+++ b/tools/testing/selftests/timers/adjtick.c
@@ -22,10 +22,9 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
-#include "kselftest.h"
 
-#define NSEC_PER_SEC		1000000000LL
-#define USEC_PER_SEC		1000000LL
+#include "clock-helpers.h"
+#include "kselftest.h"
 
 #define MILLION			1000000
 
diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/testing/selftests/timers/alarmtimer-suspend.c
index d55d5b0377c6..e359c94baa50 100644
--- a/tools/testing/selftests/timers/alarmtimer-suspend.c
+++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
@@ -29,6 +29,7 @@
 #include <stdlib.h>
 #include <pthread.h>
 #include <errno.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
 #define NSEC_PER_SEC 1000000000LL
@@ -40,37 +41,6 @@ int alarmcount;
 int alarm_clock_id;
 struct timespec start_time;
 
-
-char *clockstring(int clockid)
-{
-	switch (clockid) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_REALTIME_ALARM:
-		return "CLOCK_REALTIME_ALARM";
-	case CLOCK_BOOTTIME_ALARM:
-		return "CLOCK_BOOTTIME_ALARM";
-	case CLOCK_TAI:
-		return "CLOCK_TAI";
-	}
-	return "UNKNOWN_CLOCKID";
-}
-
-
 long long timespec_sub(struct timespec a, struct timespec b)
 {
 	long long ret = NSEC_PER_SEC * b.tv_sec + b.tv_nsec;
@@ -130,12 +100,12 @@ int main(void)
 		alarmcount = 0;
 		if (timer_create(alarm_clock_id, &se, &tm1) == -1) {
 			printf("timer_create failed, %s unsupported?: %s\n",
-					clockstring(alarm_clock_id), strerror(errno));
+					clock_name(alarm_clock_id), strerror(errno));
 			break;
 		}
 
 		clock_gettime(alarm_clock_id, &start_time);
-		printf("Start time (%s): %ld:%ld\n", clockstring(alarm_clock_id),
+		printf("Start time (%s): %ld:%ld\n", clock_name(alarm_clock_id),
 				start_time.tv_sec, start_time.tv_nsec);
 		printf("Setting alarm for every %i seconds\n", SUSPEND_SECS);
 		its1.it_value = start_time;
diff --git a/tools/testing/selftests/timers/inconsistency-check.c b/tools/testing/selftests/timers/inconsistency-check.c
index 9ab7066b4e32..d7982ac4bd18 100644
--- a/tools/testing/selftests/timers/inconsistency-check.c
+++ b/tools/testing/selftests/timers/inconsistency-check.c
@@ -28,44 +28,14 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
 #define CALLS_PER_LOOP 64
 
-char *clockstring(int clockid)
-{
-	switch (clockid) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_REALTIME_ALARM:
-		return "CLOCK_REALTIME_ALARM";
-	case CLOCK_BOOTTIME_ALARM:
-		return "CLOCK_BOOTTIME_ALARM";
-	case CLOCK_TAI:
-		return "CLOCK_TAI";
-	}
-	return "UNKNOWN_CLOCKID";
-}
-
 /* returns 1 if a <= b, 0 otherwise */
 static inline int in_order(struct timespec a, struct timespec b)
 {
@@ -172,15 +142,15 @@ int main(int argc, char *argv[])
 	for (clockid = userclock; clockid < maxclocks; clockid++) {
 
 		if (clockid == CLOCK_HWSPECIFIC || clock_gettime(clockid, &ts)) {
-			ksft_test_result_skip("%-31s\n", clockstring(clockid));
+			ksft_test_result_skip("%-31s\n", clock_name(clockid));
 			continue;
 		}
 
 		if (consistency_test(clockid, runtime)) {
-			ksft_test_result_fail("%-31s\n", clockstring(clockid));
+			ksft_test_result_fail("%-31s\n", clock_name(clockid));
 			ksft_exit_fail();
 		} else {
-			ksft_test_result_pass("%-31s\n", clockstring(clockid));
+			ksft_test_result_pass("%-31s\n", clock_name(clockid));
 		}
 	}
 	ksft_exit_pass();
diff --git a/tools/testing/selftests/timers/leap-a-day.c b/tools/testing/selftests/timers/leap-a-day.c
index 71b49734e08c..b93cb5714b37 100644
--- a/tools/testing/selftests/timers/leap-a-day.c
+++ b/tools/testing/selftests/timers/leap-a-day.c
@@ -51,10 +51,9 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 #define CLOCK_TAI 11
 
 time_t next_leap;
diff --git a/tools/testing/selftests/timers/mqueue-lat.c b/tools/testing/selftests/timers/mqueue-lat.c
index ce8700c95cac..fa4c3e3f58fe 100644
--- a/tools/testing/selftests/timers/mqueue-lat.c
+++ b/tools/testing/selftests/timers/mqueue-lat.c
@@ -29,10 +29,9 @@
 #include <signal.h>
 #include <errno.h>
 #include <mqueue.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 
 #define TARGET_TIMEOUT		100000000	/* 100ms in nanoseconds */
 #define UNRESONABLE_LATENCY	40000000	/* 40ms in nanosecs */
diff --git a/tools/testing/selftests/timers/nanosleep.c b/tools/testing/selftests/timers/nanosleep.c
index ceff18149a48..7df86dfc897f 100644
--- a/tools/testing/selftests/timers/nanosleep.c
+++ b/tools/testing/selftests/timers/nanosleep.c
@@ -27,44 +27,14 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
 #define UNSUPPORTED 0xf00f
 
-char *clockstring(int clockid)
-{
-	switch (clockid) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_REALTIME_ALARM:
-		return "CLOCK_REALTIME_ALARM";
-	case CLOCK_BOOTTIME_ALARM:
-		return "CLOCK_BOOTTIME_ALARM";
-	case CLOCK_TAI:
-		return "CLOCK_TAI";
-	};
-	return "UNKNOWN_CLOCKID";
-}
-
 /* returns 1 if a <= b, 0 otherwise */
 static inline int in_order(struct timespec a, struct timespec b)
 {
@@ -182,7 +152,7 @@ int main(int argc, char **argv)
 		if (clockid == CLOCK_PROCESS_CPUTIME_ID ||
 				clockid == CLOCK_THREAD_CPUTIME_ID ||
 				clockid == CLOCK_HWSPECIFIC) {
-			ksft_test_result_skip("%-31s\n", clockstring(clockid));
+			ksft_test_result_skip("%-31s\n", clock_name(clockid));
 			continue;
 		}
 
@@ -192,21 +162,21 @@ int main(int argc, char **argv)
 		while (length <= (NSEC_PER_SEC * 10)) {
 			ret = nanosleep_test(clockid, length);
 			if (ret == UNSUPPORTED) {
-				ksft_test_result_skip("%-31s\n", clockstring(clockid));
+				ksft_test_result_skip("%-31s\n", clock_name(clockid));
 				goto next;
 			}
 			if (ret < 0) {
-				ksft_test_result_fail("%-31s\n", clockstring(clockid));
+				ksft_test_result_fail("%-31s\n", clock_name(clockid));
 				ksft_exit_fail();
 			}
 			length *= 100;
 		}
 		ret = nanosleep_test_remaining(clockid);
 		if (ret < 0) {
-			ksft_test_result_fail("%-31s\n", clockstring(clockid));
+			ksft_test_result_fail("%-31s\n", clock_name(clockid));
 			ksft_exit_fail();
 		}
-		ksft_test_result_pass("%-31s\n", clockstring(clockid));
+		ksft_test_result_pass("%-31s\n", clock_name(clockid));
 next:
 		ret = 0;
 	}
diff --git a/tools/testing/selftests/timers/nsleep-lat.c b/tools/testing/selftests/timers/nsleep-lat.c
index 15f6493ca7b5..d22973c87f21 100644
--- a/tools/testing/selftests/timers/nsleep-lat.c
+++ b/tools/testing/selftests/timers/nsleep-lat.c
@@ -24,10 +24,9 @@
 #include <sys/timex.h>
 #include <string.h>
 #include <signal.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 #define UNRESONABLE_LATENCY 40000000 /* 40ms in nanosecs */
 
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
@@ -35,35 +34,6 @@
 
 #define UNSUPPORTED 0xf00f
 
-char *clockstring(int clockid)
-{
-	switch (clockid) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_REALTIME_ALARM:
-		return "CLOCK_REALTIME_ALARM";
-	case CLOCK_BOOTTIME_ALARM:
-		return "CLOCK_BOOTTIME_ALARM";
-	case CLOCK_TAI:
-		return "CLOCK_TAI";
-	};
-	return "UNKNOWN_CLOCKID";
-}
-
 struct timespec timespec_add(struct timespec ts, unsigned long long ns)
 {
 	ts.tv_nsec += ns;
@@ -156,10 +126,10 @@ int main(int argc, char **argv)
 		}
 
 		if (ret == UNSUPPORTED) {
-			ksft_test_result_skip("%s\n", clockstring(clockid));
+			ksft_test_result_skip("%s\n", clock_name(clockid));
 		} else {
 			ksft_test_result(ret >= 0, "%s\n",
-					 clockstring(clockid));
+					 clock_name(clockid));
 		}
 	}
 
diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index fa168d802f9e..643006c543f4 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -19,6 +19,7 @@
 #include <pthread.h>
 #include <stdbool.h>
 
+#include "clock-helpers.h"
 #include "kselftest.h"
 
 #define NSEC_PER_SEC 1000000000LL
@@ -143,8 +144,9 @@ static void check_itimer(int which, const char *name)
 	ksft_test_result(check_diff(start, end) == 0, "%s\n", name);
 }
 
-static void check_timer_create(int which, const char *name)
+static void check_timer_create(int which)
 {
+	const char *name = clock_name(which);
 	struct timespec start, end;
 	struct itimerspec val = {
 		.it_value.tv_sec = DELAY,
@@ -457,8 +459,9 @@ static void check_delete(void)
 	ksft_test_result(!tsig.signals, "check_delete\n");
 }
 
-static void check_sigev_none(int which, const char *name)
+static void check_sigev_none(int which)
 {
+	const char *name = clock_name(which);
 	struct timespec start, now;
 	struct itimerspec its;
 	struct sigevent sev;
@@ -495,8 +498,9 @@ static void check_sigev_none(int which, const char *name)
 			 "check_sigev_none %s\n", name);
 }
 
-static void check_gettime(int which, const char *name)
+static void check_gettime(int which)
 {
+	const char *name = clock_name(which);
 	struct itimerspec its, prev;
 	struct timespec start, now;
 	struct sigevent sev;
@@ -548,8 +552,9 @@ static void check_gettime(int which, const char *name)
 	ksft_test_result(wraps > 1, "check_gettime %s\n", name);
 }
 
-static void check_overrun(int which, const char *name)
+static void check_overrun(int which)
 {
+	const char *name = clock_name(which);
 	struct timespec start, now;
 	struct tmrsig tsig = { };
 	struct itimerspec its;
@@ -691,7 +696,7 @@ int main(int argc, char **argv)
 	check_itimer(ITIMER_VIRTUAL, "ITIMER_VIRTUAL");
 	check_itimer(ITIMER_PROF, "ITIMER_PROF");
 	check_itimer(ITIMER_REAL, "ITIMER_REAL");
-	check_timer_create(CLOCK_THREAD_CPUTIME_ID, "CLOCK_THREAD_CPUTIME_ID");
+	check_timer_create(CLOCK_THREAD_CPUTIME_ID);
 
 	/*
 	 * It's unfortunately hard to reliably test a timer expiration
@@ -702,7 +707,7 @@ int main(int argc, char **argv)
 	 * to ensure true parallelism. So test only one thread until we
 	 * find a better solution.
 	 */
-	check_timer_create(CLOCK_PROCESS_CPUTIME_ID, "CLOCK_PROCESS_CPUTIME_ID");
+	check_timer_create(CLOCK_PROCESS_CPUTIME_ID);
 	check_timer_distribution();
 
 	if (run_sig_ign_tests) {
@@ -710,18 +715,18 @@ int main(int argc, char **argv)
 		check_sig_ign(1);
 		check_rearm();
 		check_delete();
-		check_sigev_none(CLOCK_MONOTONIC, "CLOCK_MONOTONIC");
-		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID, "CLOCK_PROCESS_CPUTIME_ID");
-		check_gettime(CLOCK_MONOTONIC, "CLOCK_MONOTONIC");
-		check_gettime(CLOCK_PROCESS_CPUTIME_ID, "CLOCK_PROCESS_CPUTIME_ID");
-		check_gettime(CLOCK_THREAD_CPUTIME_ID, "CLOCK_THREAD_CPUTIME_ID");
+		check_sigev_none(CLOCK_MONOTONIC);
+		check_sigev_none(CLOCK_PROCESS_CPUTIME_ID);
+		check_gettime(CLOCK_MONOTONIC);
+		check_gettime(CLOCK_PROCESS_CPUTIME_ID);
+		check_gettime(CLOCK_THREAD_CPUTIME_ID);
 	} else {
 		ksft_print_msg("Skipping SIG_IGN tests on kernel < 6.13\n");
 	}
 
-	check_overrun(CLOCK_MONOTONIC, "CLOCK_MONOTONIC");
-	check_overrun(CLOCK_PROCESS_CPUTIME_ID, "CLOCK_PROCESS_CPUTIME_ID");
-	check_overrun(CLOCK_THREAD_CPUTIME_ID, "CLOCK_THREAD_CPUTIME_ID");
+	check_overrun(CLOCK_MONOTONIC);
+	check_overrun(CLOCK_PROCESS_CPUTIME_ID);
+	check_overrun(CLOCK_THREAD_CPUTIME_ID);
 
 	ksft_finished();
 }
diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selftests/timers/raw_skew.c
index 2dd16cb4cdd0..0c87a8fb0d7f 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -25,10 +25,9 @@
 #include <sys/time.h>
 #include <sys/timex.h>
 #include <time.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 #define shift_right(x, s) ({		\
 	__typeof__(x) __x = (x);	\
 	__typeof__(s) __s = (s);	\
diff --git a/tools/testing/selftests/timers/set-2038.c b/tools/testing/selftests/timers/set-2038.c
index c1235638406d..f522a3035ec6 100644
--- a/tools/testing/selftests/timers/set-2038.c
+++ b/tools/testing/selftests/timers/set-2038.c
@@ -27,10 +27,9 @@
 #include <unistd.h>
 #include <time.h>
 #include <sys/time.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 #define KTIME_MAX	((long long)~((unsigned long long)1 << 63))
 #define KTIME_SEC_MAX	(KTIME_MAX / NSEC_PER_SEC)
 
diff --git a/tools/testing/selftests/timers/set-timer-lat.c b/tools/testing/selftests/timers/set-timer-lat.c
index e092c18befff..79ddba25d314 100644
--- a/tools/testing/selftests/timers/set-timer-lat.c
+++ b/tools/testing/selftests/timers/set-timer-lat.c
@@ -28,10 +28,9 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <pthread.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-
 /* CLOCK_HWSPECIFIC == CLOCK_SGI_CYCLE (Deprecated) */
 #define CLOCK_HWSPECIFIC		10
 
@@ -44,36 +43,6 @@ struct timespec start_time;
 long long max_latency_ns;
 int timer_fired_early;
 
-char *clockstring(int clockid)
-{
-	switch (clockid) {
-	case CLOCK_REALTIME:
-		return "CLOCK_REALTIME";
-	case CLOCK_MONOTONIC:
-		return "CLOCK_MONOTONIC";
-	case CLOCK_PROCESS_CPUTIME_ID:
-		return "CLOCK_PROCESS_CPUTIME_ID";
-	case CLOCK_THREAD_CPUTIME_ID:
-		return "CLOCK_THREAD_CPUTIME_ID";
-	case CLOCK_MONOTONIC_RAW:
-		return "CLOCK_MONOTONIC_RAW";
-	case CLOCK_REALTIME_COARSE:
-		return "CLOCK_REALTIME_COARSE";
-	case CLOCK_MONOTONIC_COARSE:
-		return "CLOCK_MONOTONIC_COARSE";
-	case CLOCK_BOOTTIME:
-		return "CLOCK_BOOTTIME";
-	case CLOCK_REALTIME_ALARM:
-		return "CLOCK_REALTIME_ALARM";
-	case CLOCK_BOOTTIME_ALARM:
-		return "CLOCK_BOOTTIME_ALARM";
-	case CLOCK_TAI:
-		return "CLOCK_TAI";
-	}
-	return "UNKNOWN_CLOCKID";
-}
-
-
 long long timespec_sub(struct timespec a, struct timespec b)
 {
 	long long ret = NSEC_PER_SEC * b.tv_sec + b.tv_nsec;
@@ -104,7 +73,7 @@ void sigalarm(int signo)
 void describe_timer(int flags, int interval)
 {
 	printf("%-22s %s %s ",
-			clockstring(clock_id),
+			clock_name(clock_id),
 			flags ? "ABSTIME":"RELTIME",
 			interval ? "PERIODIC":"ONE-SHOT");
 }
@@ -130,12 +99,12 @@ int setup_timer(int clock_id, int flags, int interval, timer_t *tm1)
 		if ((clock_id == CLOCK_REALTIME_ALARM) ||
 		    (clock_id == CLOCK_BOOTTIME_ALARM)) {
 			printf("%-22s %s missing CAP_WAKE_ALARM?    : [UNSUPPORTED]\n",
-					clockstring(clock_id),
+					clock_name(clock_id),
 					flags ? "ABSTIME":"RELTIME");
 			/* Indicate timer isn't set, so caller doesn't wait */
 			return 1;
 		}
-		printf("%s - timer_create() failed\n", clockstring(clock_id));
+		printf("%s - timer_create() failed\n", clock_name(clock_id));
 		return -1;
 	}
 
@@ -152,7 +121,7 @@ int setup_timer(int clock_id, int flags, int interval, timer_t *tm1)
 
 	err = timer_settime(*tm1, flags, &its1, &its2);
 	if (err) {
-		printf("%s - timer_settime() failed\n", clockstring(clock_id));
+		printf("%s - timer_settime() failed\n", clock_name(clock_id));
 		return -1;
 	}
 
diff --git a/tools/testing/selftests/timers/valid-adjtimex.c b/tools/testing/selftests/timers/valid-adjtimex.c
index dc2559eb11a5..f641d5fb0902 100644
--- a/tools/testing/selftests/timers/valid-adjtimex.c
+++ b/tools/testing/selftests/timers/valid-adjtimex.c
@@ -29,11 +29,9 @@
 #include <string.h>
 #include <signal.h>
 #include <unistd.h>
+#include "clock-helpers.h"
 #include "kselftest.h"
 
-#define NSEC_PER_SEC 1000000000LL
-#define USEC_PER_SEC 1000000LL
-
 #define ADJ_SETOFFSET 0x0100
 
 #include <sys/syscall.h>

-- 
2.55.0

