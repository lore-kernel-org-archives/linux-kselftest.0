Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8243CEC4
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512948; cv=none; b=bcYNM8hQxESIDW4ugPZAyj/W3BsiRq6RthF0f7o/0808wD121st7cznDcqxMEvsMtkKAVQaZPZWiVSeRQKm4rHogrCmwYVmRvrGk5pj4BMU4KdJ3tlYCJeGplvk0HNyQ86b3wVOll8Wvdt8g3No8C+m00qPa00Ooe3NbAt4Iebo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512948; c=relaxed/simple;
	bh=PoNqBwmkV3X6OXW5GPoMzkg2VINY88A+CzL8t5gKFnY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nzkDbFzQfZfGNahDkWsXo8E5dgvmpJ1dyY7cCUjL7Im2e77OYKabDbM3DqpAo9+OC+F+whuM8nAua70rwW6kOxCH7FV5usOAbUUjQ6joKnBdh4qP1jiUG47oZueNdMuv/cYY8vebIU2O77ZkhCaMnd6qZJfjxxd1C192oBlSIzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=md9XOUQc; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="md9XOUQc"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-847e78d656bso1553609b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783512946; x=1784117746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xrenUMVEDaQLL0EiqmFqHG8anxrMumEsEg3sZeCsfEk=;
        b=md9XOUQcgzn26XNwHnd0kG4u797/hOflbpV0Z068bi+Uk6fqcXKyAqb0BrWmZdy4V2
         JwJq7z8SnSq/hne91DMzzYFBWa0+Uleaf/awwGo+Hf5O6ZEqPNmZkUVV0rSEytd5d30a
         TWKFOjh4ZX279HSNXoUauip048UrBYdJQ+26VbWaSfHYQPBvQVzccxAnqwqd9jJInSvY
         HH479KaMhPrvCh/cuqHM94FdXnHg3RHSDYj8Ai/JR0CQmVqfsEel1jykeIAAbEg3XwLu
         +Kcw28G9in5gwsEKHv+sMKWB6oiwgdKiM/jVsuVRYTi/vHOnSukXiylEH0KCJURpMEhd
         bL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512946; x=1784117746;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xrenUMVEDaQLL0EiqmFqHG8anxrMumEsEg3sZeCsfEk=;
        b=UeN8SmeJQ1C0F4b38Vu6z8b4o74xax8m23kThC0KPJOGs2gIF+MSWv8L3xHIUGjrOv
         /Xjh2fZKVFF/Swc8pMnsKbV6AwuVu/E/k3V7WQw0xxDgK51PspKAAEPc6TV2WLodaT0w
         teC0T/31RyBggmSxcOoDjaUKRDx5Wj6QbtUyokfCLAz/nxH6Dd5Omx5VUIW0eMQmg3p5
         yoVg4J3Fb3XMBfKxzr7r5myE3AxWJMiMUzuRIaLWataFLJlCXLfxm5NbFro4xwy0uvm5
         XWzggCceUUL4JlUTxkwQxaQHIKxk8MqoKrl/PHUGpV9QCNRgxokuWOG3HBwPLfjBV4rY
         uMNg==
X-Gm-Message-State: AOJu0YzzaAivVuZznQVb1RfEXDCW9tJ18XJoM1XgQIqrX+/fCsD26p9R
	pZYy2UiwcoJKpiX75qj1XdXRRmaNwBk0KHw5M/RLdfHvPaWvjbJHY4ZvkuzstMWLzUPMnLeTa/u
	YmQ==
X-Received: from pfmu13.prod.google.com ([2002:aa7:838d:0:b0:847:7599:7277])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6c9a:b0:848:2f7a:2e57
 with SMTP id d2e1a72fcca58-848438a63damr2652177b3a.70.1783512946318; Wed, 08
 Jul 2026 05:15:46 -0700 (PDT)
Date: Wed,  8 Jul 2026 12:15:44 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708121544.583552-1-wakel@google.com>
Subject: [PATCH] selftests: timers: Use CPU time for CPU timers in
 posix_timers test
From: Wake Liu <wakel@google.com>
To: Shuah Khan <shuah@kernel.org>
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
---
 tools/testing/selftests/timers/posix_timers.c | 65 +++++++++++++------
 1 file changed, 46 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/selftests/timers/posix_timers.c
index 6f78b6068589..55c5f96ea6c8 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -79,16 +79,39 @@ static void sig_handler(int nr)
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
+	if (clock_gettime(clock_id, &ts) < 0)
+		return -1;
+	return (long long)ts.tv_sec * USECS_PER_SEC + ts.tv_nsec / 1000;
+}
+
+static long long get_itimer_time_us(int which)
+{
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
+
+static int check_diff_us(long long start, long long end)
 {
 	long long diff;
 
-	diff = end.tv_usec - start.tv_usec;
-	diff += (end.tv_sec - start.tv_sec) * USECS_PER_SEC;
+	diff = end - start;
 
 	if (llabs(diff - DELAY * USECS_PER_SEC) > USECS_PER_SEC / 2) {
 		printf("Diff too high: %lld..", diff);
@@ -100,7 +123,7 @@ static int check_diff(struct timeval start, struct timeval end)
 
 static void check_itimer(int which, const char *name)
 {
-	struct timeval start, end;
+	long long start, end;
 	struct itimerval val = {
 		.it_value.tv_sec = DELAY,
 	};
@@ -114,8 +137,9 @@ static void check_itimer(int which, const char *name)
 	else if (which == ITIMER_REAL)
 		signal(SIGALRM, sig_handler);
 
-	if (gettimeofday(&start, NULL) < 0)
-		fatal_error(name, "gettimeofday()");
+	start = get_itimer_time_us(which);
+	if (start < 0)
+		fatal_error(name, "get_itimer_time_us()");
 
 	if (setitimer(which, &val, NULL) < 0)
 		fatal_error(name, "setitimer()");
@@ -127,15 +151,16 @@ static void check_itimer(int which, const char *name)
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
@@ -149,18 +174,20 @@ static void check_timer_create(int which, const char *name)
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
+	ksft_test_result(check_diff_us(start, end) == 0,
 			 "timer_create() per %s\n", name);
 }
 
-- 
2.55.0.795.g602f6c329a-goog

