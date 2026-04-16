Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E942C0F8C
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 23:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776380743; cv=none; b=anK+FHl4f+upGiFMOz7+gf1lJswgQswjprsL/30i0NfsCsEqSJgI+P9J/SHpTJ/CEmdk5fUg/XL41rvIkGgnSAtlNRxJWm9yaNJNu8gPFUxcp1kjzxuXrrnsikqYRna0QE4GfIL3z3019iYPsEPlaLxkeogIV3EC9bBkZkKScBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776380743; c=relaxed/simple;
	bh=Ni4jR7N3+gE6qlcBRbwo/mgtU5yYr2RWAwg3AZu0mpY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rKsbSlbn5A9Xq4wkIqv4XjqiFYUqNdxdrQWnvWkpDaIPuAGvJM61v0pLdQHLTAfFU1H70ncy4k+gs0d2xHViwvLVcY9/+yFFI5iFJ9KnmfnYDz/c7f28nBON26Y0UlHEPXU5NdudxrZkMdweE208LPV9JJ0IBzaAIssNPKDZNV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dWcZer1K; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWcZer1K"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b4678c6171so442275ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 16:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776380741; x=1776985541; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o+3nk2UVxQkF4GytpkajOyCmB/Ar2vO2VNW/ORyuspg=;
        b=dWcZer1KrdcI/65BqP6fdwtKDaBW6BCYyleVq0LXgxG2r+R6mkBY/5CmoiuNOAjs2O
         RB9TW6pQxj96SLrz+sqFq1RK4Diu55SZ7d1hrBesOepXQ1N80a+oLPCKFs+OqyPnUnHP
         boHcX4ChBM4D1Us3Y456SGz6+iYzn54Fbv5pCWdUgVhOYzVfac6slKk34ZGdIRTv4m7B
         qvsDSBuzs/PLXpKGSfgkzs6oeau8PF84Q+CrL9pDqrLE4P6ftdqRZFjeKFY5v+I6d+We
         VHW2NSElEjvqlKGk0jXT3Y1T9gA4yHcAbS97N0Hn3oeSW8IcvejHqHKVvwPL6B+z1r5/
         Oi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776380741; x=1776985541;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+3nk2UVxQkF4GytpkajOyCmB/Ar2vO2VNW/ORyuspg=;
        b=NjV+X88R/bvXKZBzpneJZ8LiwcQK4f9Za2+me+2xqMu478qhCLtSlZW8y/gxXssTXI
         Pf+GehIFrLpEj90EHbaNmj6AQWMLpYHNe8WNfvbNkOdvB+2LWrmP5OGwEYnLdYmp/1p8
         eUSWowBU6DyDovBJag1zMKUJUhSFXeOX7jhsywgnOtrR6XOaymyEMV2RDMaXY7ietIK+
         kSumfm5vzw1bscye66/y6TLU3XewNHb4JTsiGCXkSAgECz2zx3tk+ZxMiI9cVVAxKKTt
         O0EJqFJ8KJCt/3gMNgC5Ii5T+LheL6RZHQzdZjQOx/dvPSSaw7NU4dYz95agSqWz99vQ
         MVKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/m4ohcHVTeh8LbHy7/1Q4LrJg2wDRd7B3PxAoQgYx0WGaT5phLXMkLmsnVekQF1ulaWbIPaQn8xfIAJCy5RNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTM/IRt5DwLs1fCiBnvEpwOaUJf/oxHNSQNTvOurF4NJAj+0p
	AE0huDegmEEFIz7QD6iVbDwWwP2EFT3l56b+mi6rot86lEMjwTo07XF5ztWMAfhV0yrxIoENGgT
	2bi/kFOzH
X-Received: from plbkg11.prod.google.com ([2002:a17:903:60b:b0:2b4:5fd0:a45d])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:7003:b0:2b0:bed1:46f7
 with SMTP id d9443c01a7336-2b5f9fdfb9bmr1924635ad.37.1776380740912; Thu, 16
 Apr 2026 16:05:40 -0700 (PDT)
Date: Thu, 16 Apr 2026 23:05:23 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260416230534.901400-1-jstultz@google.com>
Subject: [RFC][PATCH] selftests: posix_timers: Use CLOCK_THREAD_CPUTIME_ID for
 ITIMER_PROF measurements
From: John Stultz <jstultz@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: John Stultz <jstultz@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

It was reported that the posix_timers test was at times seeing
failures with ITIMER_PROF timers, specifically in cases where
the RCU_SOFTIRQ was taking up significant amounts of time.

Analysis showed that as the time in softirq isn't included in
the task stime + utime accounting used to trigger the SIGPROF
so delays from softirq work could cause it to appear that the
signal was incorrectly delayed.

Contributing to this is that the test uses gettimeofday() to
measure itimers, which also means any scheduling delay can also
cause failures (as the task may not be running the entire time).

To fix this, convert all the itimer measurements to use
clock_gettime(), tweaking the logic to use nsecs instead of
usecs. Then for ITIMER_PROF timers, utilize the
CLOCK_THREAD_CPUTIME_ID clockid so that we are similarly
measuring the time the task was running.

Signed-off-by: John Stultz <jstultz@google.com>
---
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: kernel-team@android.com
---
 tools/testing/selftests/timers/posix_timers.c | 55 ++++++++++---------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 38512623622a5..2f3bac9fc6e87 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -78,19 +78,25 @@ static void sig_handler(int nr)
 	done = 1;
 }
 
+static inline int64_t calcdiff_ns(struct timespec t1, struct timespec t2)
+{
+	int64_t diff;
+
+	diff = NSEC_PER_SEC * (int64_t)((int) t1.tv_sec - (int) t2.tv_sec);
+	diff += ((int) t1.tv_nsec - (int) t2.tv_nsec);
+	return diff;
+}
+
 /*
  * Check the expected timer expiration matches the GTOD elapsed delta since
  * we armed the timer. Keep a 0.5 sec error margin due to various jitter.
  */
-static int check_diff(struct timeval start, struct timeval end)
+static int check_diff(struct timespec start, struct timespec end)
 {
-	long long diff;
-
-	diff = end.tv_usec - start.tv_usec;
-	diff += (end.tv_sec - start.tv_sec) * USEC_PER_SEC;
+	long long diff = calcdiff_ns(end, start);
 
-	if (llabs(diff - DELAY * USEC_PER_SEC) > USEC_PER_SEC / 2) {
-		printf("Diff too high: %lld..", diff);
+	if (llabs(diff - DELAY * NSEC_PER_SEC) > NSEC_PER_SEC / 2) {
+		printf("Diff too high: %lld ns..", diff);
 		return -1;
 	}
 
@@ -99,22 +105,25 @@ static int check_diff(struct timeval start, struct timeval end)
 
 static void check_itimer(int which, const char *name)
 {
-	struct timeval start, end;
+	struct timespec start, end;
 	struct itimerval val = {
 		.it_value.tv_sec = DELAY,
 	};
+	int clock_id = CLOCK_REALTIME;
 
 	done = 0;
 
 	if (which == ITIMER_VIRTUAL)
 		signal(SIGVTALRM, sig_handler);
-	else if (which == ITIMER_PROF)
+	else if (which == ITIMER_PROF) {
+		clock_id = CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGPROF, sig_handler);
+	}
 	else if (which == ITIMER_REAL)
 		signal(SIGALRM, sig_handler);
 
-	if (gettimeofday(&start, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	if (clock_gettime(clock_id, &start))
+		fatal_error(name, "clock_gettime()");
 
 	if (setitimer(which, &val, NULL) < 0)
 		fatal_error(name, "setitimer()");
@@ -126,18 +135,19 @@ static void check_itimer(int which, const char *name)
 	else if (which == ITIMER_REAL)
 		idle_loop();
 
-	if (gettimeofday(&end, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	if (clock_gettime(clock_id, &end))
+		fatal_error(name, "clock_gettime()");
 
 	ksft_test_result(check_diff(start, end) == 0, "%s\n", name);
 }
 
 static void check_timer_create(int which, const char *name)
 {
-	struct timeval start, end;
+	struct timespec start, end;
 	struct itimerspec val = {
 		.it_value.tv_sec = DELAY,
 	};
+	int clock_id = CLOCK_REALTIME;
 	timer_t id;
 
 	done = 0;
@@ -148,16 +158,16 @@ static void check_timer_create(int which, const char *name)
 	if (signal(SIGALRM, sig_handler) == SIG_ERR)
 		fatal_error(name, "signal()");
 
-	if (gettimeofday(&start, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	if (clock_gettime(clock_id, &start))
+		fatal_error(name, "clock_gettime()");
 
 	if (timer_settime(id, 0, &val, NULL) < 0)
 		fatal_error(name, "timer_settime()");
 
 	user_loop();
 
-	if (gettimeofday(&end, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	if (clock_gettime(clock_id, &end))
+		fatal_error(name, "clock_gettime()");
 
 	ksft_test_result(check_diff(start, end) == 0,
 			 "timer_create() per %s\n", name);
@@ -445,15 +455,6 @@ static void check_delete(void)
 	ksft_test_result(!tsig.signals, "check_delete\n");
 }
 
-static inline int64_t calcdiff_ns(struct timespec t1, struct timespec t2)
-{
-	int64_t diff;
-
-	diff = NSEC_PER_SEC * (int64_t)((int) t1.tv_sec - (int) t2.tv_sec);
-	diff += ((int) t1.tv_nsec - (int) t2.tv_nsec);
-	return diff;
-}
-
 static void check_sigev_none(int which, const char *name)
 {
 	struct timespec start, now;
-- 
2.54.0.rc1.513.gad8abe7a5a-goog

