Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10134545297
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695349; cv=none; b=PWd2Jv7IV6rM9TGNsrvepLN0rMnIO8vHzSDgJIOooYo01A3+LJ0sqA2QRVBaQMmDwZ/VAZ3ggCes0agl80AYC3K2FBg/D/rlW4LvrmuQo3zRZ+sW6labbZWCAaVztkmQoX6CwGOoVhrZ7+2rC6lIM5ggtLzgYhYu1Hbu8U0FTng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695349; c=relaxed/simple;
	bh=OjsG17zH5H4/WOovinPDxPeHK+wSrzROs2gPQQfQPRM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XLv1LY43iRFNo3KhesEze2t0zldjIPletfwwPwzSYEofUkzjcwuliCSe8Frmwnx3R9qDMWdRY2EIlqy8lZD0oFCjlAmEdRGACO6xSG/o61Md1BJpj8x5Xmw1EeXeaEcCrygdo2WQLlDmZlUjHGbs0MHgbA1+efOiu0g6ZKCB3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HkI6zUV3; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HkI6zUV3"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2393321a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790695335; x=1791300135; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kABjuCkm1jRA+YVeLsWCevlcr/5DiZk5/ypt1L/HiIo=;
        b=HkI6zUV3Py6TqPYDZffdaidBH5ViUDmrCMp5kXEB329glVJKCgVWi09AhQ8z0OPyW0
         1Vh6rvJ4knjvaRAxdHULd1PshngV+xZd9uhsgiMC6g0F8SWSBqAoAHYh588nRj9BRMq5
         msUmM0A91af8ehtfkPTbYxRzdbjEuz1p2w9/l5el+r7DIIIAmoz+pfCQq2BXc6w0M0vG
         ijtBSENkTp4PgKiPhqjItOiZh/VDE8PcZEBUedmK19D3zpZjE8HIk9EZwbR0PhlPhqJw
         /mR/be1owPJz7nWT3byhp9InLwjHYrz1fiIpjnjvX5lq6V84apH30QoXUcZ35G7xGqsB
         C2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695335; x=1791300135;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kABjuCkm1jRA+YVeLsWCevlcr/5DiZk5/ypt1L/HiIo=;
        b=uTJdOH3ZpqRlzDnw/V6hLRmnHR7VuGLTkjHfJ6NpIlZkH4JTjei0ENswlAHZhcM8i3
         ty/3+3R442erCm52nASskf8c/OlD8gds+/OByzcT0yiU8ljhVQ0ODhL+morbqwap3PKI
         XHLSamVcw7fxWIqHuAP9cUSoCm0TeRlRim8RAfnWsiIWvESRRkgFhJvSXMISb6gi7cf4
         CjMq/GVYapD+fn1yRuQ6IvM3GyMLs+oHWTzDBkAU0ti9j4WQTBh1vQga8tJ8wOh6YdJ1
         bfUrb132KmRtWt/CYv8jWet7zZw5B6bq8aw8ibb8vf9wcUmge8iH+80TLAHGjlk2E8cB
         JW8Q==
X-Gm-Message-State: AFuF++n77j1pgAUP/z3f3HEiLirWFlJIlvFbbR/1cjWxqXGTscSq4+9r
	7lmH1PWpRvXMwoiSYH2cd+EfJA+iT0Fsx1K14bmMN3/ZomACCjipnSJ2C/lDQLzfTBocrprtpqk
	uEQ==
X-Received: from pfiu2.prod.google.com ([2002:a05:6a00:1242:b0:882:a5da:e18e])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88c2:0:b0:857:72ba:ff0b
 with SMTP id d2e1a72fcca58-87e9917f67amr14425858b3a.19.1790695335132; Tue, 29
 Sep 2026 08:22:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 15:22:12 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929152212.2092062-1-wakel@google.com>
Subject: [PATCH RESEND] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Shuah Khan <shuah@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The test case rtc.date_read_loop in rtctest.c fails intermittently because
it checks that the RTC time does not advance by more than 1 second per loop
iteration. However, the loop sleeps for 11ms via nanosleep(), and if the
test thread is descheduled by the OS scheduler (e.g., under heavy system
load in a VM), more than 1 second can elapse between consecutive RTC reads.
This causes the next RTC time read to be 2 or more seconds ahead of the
previous read, triggering a test assertion failure.

To make the test more resilient against OS scheduling delays, measure the
real elapsed time between iterations using a monotonic clock
(clock_gettime(CLOCK_MONOTONIC)), and compute the actual number of seconds
elapsed (delta_s) between consecutive RTC reads. Then dynamically adjust
the assertion to:
ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Wake Liu <wakel@google.com>
---
Hi Shuah, Alexandre,

This is a resend of a patch that has been Acked by the RTC maintainer
but does not seem to have been picked up by either tree yet:
https://lore.kernel.org/all/20260430120313.4078185-1-wakel@google.com/

It applies cleanly on top of current mainline. No code changes since
the original posting; I have only folded in Alexandre's Acked-by.

Since tools/testing/selftests/rtc/ is listed under both the RTC
subsystem and the kselftest framework in MAINTAINERS, could either
Shuah (via the kselftest tree) or Alexandre (via the rtc tree) please
pick it up? I'm happy to go with whichever tree you both prefer.

We are still seeing this test fail intermittently in Android VTS
(about 15-18% of runs on some devices), so it would be great to get
this merged.

Thanks,
Wake

 tools/testing/selftests/rtc/rtctest.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rtc/rtctest.c b/tools/testing/selftests/rtc/rtctest.c
index 8047d9879039..54eb5c255a45 100644
--- a/tools/testing/selftests/rtc/rtctest.c
+++ b/tools/testing/selftests/rtc/rtctest.c
@@ -116,6 +116,7 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 	long iter_count = 0;
 	struct rtc_time rtc_tm;
 	time_t start_rtc_read, prev_rtc_read;
+	struct timespec prev_mono, cur_mono;
 
 	if (self->fd == -1 && errno == ENOENT)
 		SKIP(return, "Skipping test since %s does not exist", rtc_file);
@@ -126,25 +127,31 @@ TEST_F_TIMEOUT(rtc, date_read_loop, READ_LOOP_DURATION_SEC + 2) {
 
 	rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 	ASSERT_NE(-1, rc);
+	clock_gettime(CLOCK_MONOTONIC, &prev_mono);
 	start_rtc_read = rtc_time_to_timestamp(&rtc_tm);
 	prev_rtc_read = start_rtc_read;
 
 	do  {
 		time_t rtc_read;
+		time_t delta_s = 0;
 
 		rc = ioctl(self->fd, RTC_RD_TIME, &rtc_tm);
 		ASSERT_NE(-1, rc);
+		clock_gettime(CLOCK_MONOTONIC, &cur_mono);
 
 		rtc_read = rtc_time_to_timestamp(&rtc_tm);
+		delta_s = cur_mono.tv_sec - prev_mono.tv_sec;
+
 		/* Time should not go backwards */
 		ASSERT_LE(prev_rtc_read, rtc_read);
-		/* Time should not increase more then 1s at a time */
-		ASSERT_GE(prev_rtc_read + 1, rtc_read);
+		/* Time should not increase more then elapsed time + 1s */
+		ASSERT_GE(prev_rtc_read + delta_s + 1, rtc_read);
 
 		/* Sleep 11ms to avoid killing / overheating the RTC */
 		nanosleep_with_retries(READ_LOOP_SLEEP_MS * 1000000);
 
 		prev_rtc_read = rtc_read;
+		prev_mono = cur_mono;
 		iter_count++;
 	} while (prev_rtc_read <= start_rtc_read + READ_LOOP_DURATION_SEC);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

