Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3536A009
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630253; cv=none; b=NnZD/NuayTw1y1UcHtWpwBA/eVS6UDu8dhGpvQoJD46MU54tK6EgBQLgDiUDPmIx/t0GSE1wYHaiEDBC93MZWbNuR3EwV6cSAVebSP5gGNmW6ZHMwnVaOBdHYEEuGDf91rb4/bwnIVUZY1dGL7dZqgSyjt9Y4Qj7H0uYdyaIuLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630253; c=relaxed/simple;
	bh=sF8wUc9XsZ/kAeA7ev5+zCfpWC99lPW0xYH+6oD5Cdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JqCzA9aahKvlw99wwiid61/2mPZ22SxSyJztzLmSXued64SOX9eSwUB/WfqHfyxSb9pFsIeAAwa7o0mroKmhAoNvopwu7/7DWFU6et5sSUMUYmEQHUCmjblmsoAX17bbsS+eewZw6she48p0+HSV1/87WnCyLmSDs+Ge+Yjfqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vqfSaw7O; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vqfSaw7O"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso14617096b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784630250; x=1785235050; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=io2YXuyBFnkPCqy+EpvVtO1P7+HxwVF2kbBTEeeJ9uI=;
        b=vqfSaw7O2WncJpK1glDnTrFL09gHdY3YFRpmLyaC92UpHDi9V+3EuInNjfFijwGlOe
         onKDOs/sBexszNWtka9QVKGyjnlEH3ppkNLTl+10poJq3oI7wogSuXYusch+mV0jG6F3
         jvMSJDlLE9KYv/Z+qjBxPVpVgt0PVx2oP1O6EcXyLjZbebtZJcBJD78vEnPTUqV1xkxO
         tRG+yVvqJGuHbOUHFqDa44rUzqRtQY46dCUTA8+aDsCgspwUbdqQtceee275UkSD0YhT
         YEjz1RJO083b4M86fO4c4uzGCURqC3Siza00V+8jg3/VFCiO/eLZO4KpQI98UdGlHy5e
         6EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784630250; x=1785235050;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=io2YXuyBFnkPCqy+EpvVtO1P7+HxwVF2kbBTEeeJ9uI=;
        b=RDrofW/Gu81hZEDS4MuMk18v7AiXDtuyjpaWlo2uM4QIMIwqPPFS/5Bne8SEKmsVm5
         JtJZOnR+LhUmmlhoACmYL8+s4elMDjeEObgd5kUfI5V4LP6xuNUlTbOG9hbSYP7K/+FM
         cdaYIhoefqHkiWvpCMyQMi4BiD7oP5h7hoXuBVSmaIK+yQshOHBEPGOKR06RVZAHdr0k
         IYpmP570clapU4EZLOgbLyfEAfY3KNVQjWNfEnkiVGrgPI72pJTRlGlT2IDCXFscXmXX
         adtjgybAEGooXTj6v2bHsNuYwpo+afpIy2tsLGaGE/C5+SyUUu28klZ9cuufxTc+mAG2
         JBNw==
X-Gm-Message-State: AOJu0YwyJCCjpUQsATaKF6hv2TIy5IwShFvZJrZVZDYoJAPpw0JarUQs
	/jBmvkfjmwW46qmvlyCMum6ixj35ZWloLwisFtYpayb9lnafos+KkMLvSuL4oWN48oQchjJ8G/l
	oXg==
X-Received: from pgkm10.prod.google.com ([2002:a63:ed4a:0:b0:c9a:3f28:8c06])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:301e:b0:848:86cf:267b
 with SMTP id d2e1a72fcca58-84c2951c735mr17324182b3a.61.1784630250192; Tue, 21
 Jul 2026 03:37:30 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:37:27 +0000
In-Reply-To: <87fr1dn3xf.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <87fr1dn3xf.ffs@fw13>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260721103728.1468166-1-wakel@google.com>
Subject: [PATCH v2] selftests: timers: Use CPU time for CPU timers in
 posix_timers test
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

The posix_timers test compares the elapsed real time (GTOD) with the
expected timer delay to verify if the timer expired. This works fine for
real-time timers (ITIMER_REAL), but is flaky for CPU-time timers
(ITIMER_PROF, ITIMER_VIRTUAL, and CLOCK_*_CPUTIME_ID) on loaded systems
(like shared test runners) because the test process might be scheduled
out, resulting in elapsed real time being larger than the consumed CPU
time.

Fix this by using the appropriate measurement method for each timer:
- Use CPU process/thread time (via clock_gettime or getrusage) for CPU
  timers.
- Keep using monotonic clock (real time) for real-time timers.

This makes the test robust against scheduling delays.

Signed-off-by: Wake Liu <wakel@google.com>
---
v2:
  - Add Signed-off-by.
  - Fix coding style issues:
    - Add newline after variable declaration in get_clock_time_us().
    - Merge variable declaration and assignment in check_diff_us().
    - Remove unnecessary line break in ksft_test_result() call.

 tools/testing/selftests/timers/posix_timers.c | 67 +++++++++++++------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 6f78b6068589..02eb9d5c769c 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -79,16 +79,38 @@ static void sig_handler(int nr)
 	done = 1;
 }
 
-/*
- * Check the expected timer expiration matches the GTOD elapsed delta since
- * we armed the timer. Keep a 0.5 sec error margin due to various jitter.
- */
-static int check_diff(struct timeval start, struct timeval end)
+#include <sys/resource.h>
+
+static long long get_clock_time_us(clockid_t clock_id)
+{
+	struct timespec ts;
+
+	if (clock_gettime(clock_id, &ts) < 0)
+		return -1;
+	return (long long)ts.tv_sec * USECS_PER_SEC + ts.tv_nsec / 1000;
+}
+
+static long long get_itimer_time_us(int which)
 {
-	long long diff;
+	struct rusage usage;
+
+	switch (which) {
+	case ITIMER_REAL:
+		return get_clock_time_us(CLOCK_MONOTONIC);
+	case ITIMER_PROF:
+		return get_clock_time_us(CLOCK_PROCESS_CPUTIME_ID);
+	case ITIMER_VIRTUAL:
+		if (getrusage(RUSAGE_SELF, &usage) < 0)
+			return -1;
+		return (long long)usage.ru_utime.tv_sec * USECS_PER_SEC + usage.ru_utime.tv_usec;
+	default:
+		return -1;
+	}
+}
 
-	diff = end.tv_usec - start.tv_usec;
-	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
+static int check_diff_us(long long start, long long end)
+{
+	long long diff = end - start;
 
 	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
 		printf("Diff too high: %lld..", diff);
@@ -100,7 +122,7 @@ static int check_diff(struct timeval start, struct timeval end)
 
 static void check_itimer(int which, const char *name)
 {
-	struct timeval start, end;
+	long long start, end;
 	struct itimerval val = {
 		.it_value.tv_sec = DELAY,
 	};
@@ -114,8 +136,9 @@ static void check_itimer(int which, const char *name)
 	else if (which == ITIMER_REAL)
 		signal(SIGALRM, sig_handler);
 
-	if (gettimeofday(&start, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	start = get_itimer_time_us(which);
+	if (start < 0)
+		fatal_error(name, "get_itimer_time_us()");
 
 	if (setitimer(which, &val, NULL) < 0)
 		fatal_error(name, "setitimer()");
@@ -127,15 +150,16 @@ static void check_itimer(int which, const char *name)
 	else if (which == ITIMER_REAL)
 		idle_loop();
 
-	if (gettimeofday(&end, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	end = get_itimer_time_us(which);
+	if (end < 0)
+		fatal_error(name, "get_itimer_time_us()");
 
-	ksft_test_result(check_diff(start, end) == 0, "%s\n", name);
+	ksft_test_result(check_diff_us(start, end) == 0, "%s\n", name);
 }
 
 static void check_timer_create(int which, const char *name)
 {
-	struct timeval start, end;
+	long long start, end;
 	struct itimerspec val = {
 		.it_value.tv_sec = DELAY,
 	};
@@ -149,19 +173,20 @@ static void check_timer_create(int which, const char *name)
 	if (signal(SIGALRM, sig_handler) == SIG_ERR)
 		fatal_error(name, "signal()");
 
-	if (gettimeofday(&start, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	start = get_clock_time_us(which);
+	if (start < 0)
+		fatal_error(name, "get_clock_time_us()");
 
 	if (timer_settime(id, 0, &val, NULL) < 0)
 		fatal_error(name, "timer_settime()");
 
 	user_loop();
 
-	if (gettimeofday(&end, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	end = get_clock_time_us(which);
+	if (end < 0)
+		fatal_error(name, "get_clock_time_us()");
 
-	ksft_test_result(check_diff(start, end) == 0,
-			 "timer_create() per %s\n", name);
+	ksft_test_result(check_diff_us(start, end) == 0, "timer_create() per %s\n", name);
 }
 
 static pthread_t ctd_thread;
-- 
2.55.0.229.g6434b31f56-goog

