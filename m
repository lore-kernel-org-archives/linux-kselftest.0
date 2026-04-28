Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535BA44D023
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777398002; cv=none; b=tnctiPdOqjCStTYV8IZg1FSV8m8BuurfxJEM0kzZg0lmlG4Gwh6RhUo/w6rRYRO7llJ0HLy3ehxc82Tw6whmIRxVm/TWIMIR5kPk4MnVR7MUUVA7FV84D9V901YGmMM6t+4z19ZUvt/rybrD8W4IPQS0lbvJda/ymQY2YQKQCxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777398002; c=relaxed/simple;
	bh=1yZcxJpM16ON5PpaeLyyhomo152q1nuqWUasI2vXHrw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Iho0JbGMi3HV0rr4LSt2gwUrEWb2iZRjaE7KH7dAVXuqvRMaX1U9BJJVmabijgvO49fsns/Af8b6UUCiqqZjjYq9Iy6h7kJR6v/RsbMDe4UPJCXPBmngoD0X0haw6uXGDRT5hAdG9shIQRs5WngYAyL3QgQsr3+HHDTfYGh7duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxYwACHN; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jstultz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxYwACHN"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b7c2ee830aso88092745ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777398001; x=1778002801; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wg6ndJoJw7e3vRcb43WTRotH1q6LGrr+y/ggZNEiTTY=;
        b=nxYwACHNy/B+q0UjovooMfnmoi47C+5IOtitPLc3nnBg21NSdWstnxDygf1ww5JwxH
         RZnPe2ho77Fg8aPW3hP2406GCR92U+s3yu+91CrOvY2K1Nlh40m+v2HpkHs+ZMqbrSAQ
         97viIOSvdbGXSoZWGeVFmbpnIMAJYKnQ1gBsxzHbe/vW3Bgb+usM63HjHWCdfC23lqDP
         FExbQQ1BwkNkkRO9B7vJYwV8JpLlMPXEjZ0CcuANSU+kNCLlL1vW9QUsZyKO61De/XW9
         fDbIcBtjpuaegBsDkMTd1mW4ok+85rTSca9y9tGe+6kNPc4s0HzaOCCWqublvcSbTFtV
         favA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777398001; x=1778002801;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wg6ndJoJw7e3vRcb43WTRotH1q6LGrr+y/ggZNEiTTY=;
        b=NA7sNJakjzNQmWeGgTt1so16dZK9Bmf5yN2v/jx62Orzez2HRx7tRAE7EwUOtz2h6K
         MbZJ7Q44CeOHdLkLE7Ddiro5YcNtL6a7qj1A7IeSVKXetXDsNS5ezQ3QhLPpyw7Gsc9X
         eZyzvX6ET5ZyHtjlCBuuSFyaWCqZiumkgGIcMCdmv6W53N8cNenL4oMD+NF8r1Or7LpG
         hdiE/gB88qF/clPCioBV+gqR6WaCsiM0Xnoiwb2vLq355QPtdoF1ataafcM5mGgQwiJj
         zkblG0cyehm34kSoRUnb8E5Giy53+ULlu2sR4AAcZE4f18Jlhdts8Eg2zLLWRf7SiNAE
         LFng==
X-Forwarded-Encrypted: i=1; AFNElJ8kVmIllOC/p3PyNwnBY9bazssWx0QpL4afdDVw6sZbnM8jlyCu6oOiVQctFuUPFjL9shGIq0cSeu2K5naou7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Uvrzv3fejLAp6l9mdkAXhSGnY1GQ3spfkBXgm6xZ0W60OMXB
	jaYm/TfV4SFkFYnRTWySg8106X4/0/5SNg590WBbf3SqH/KBGheoCbLhpJHC2ZhI+M4MbpHcnz3
	4jK3NgDHN
X-Received: from plr20.prod.google.com ([2002:a17:903:4454:b0:2b2:458e:4d6a])
 (user=jstultz job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f785:b0:2b4:656b:aeb0
 with SMTP id d9443c01a7336-2b97c497ee8mr42986115ad.35.1777398000479; Tue, 28
 Apr 2026 10:40:00 -0700 (PDT)
Date: Tue, 28 Apr 2026 17:39:46 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428173957.1394265-1-jstultz@google.com>
Subject: [PATCH] selftests: posix_timers: Use CLOCK_THREAD_CPUTIME_ID for
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
2.54.0.545.g6539524ca2-goog

