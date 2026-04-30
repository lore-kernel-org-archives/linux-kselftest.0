Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA23A1696
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550605; cv=none; b=i6wMA50jgqzvFRIxpI/vEXAfmfRyCv7j+9vd/blrQjns2fCmIk07qcOl6BGqMOxlvlsQm4nLWf2Z+rdmlYqnYcetl+smYdZJr3VUa+Fnuy+cJ5YaKeGxMswna3dd8l4T8ESl4Y8t/oQ+hHLQExPOGGZZ9g1Z36zUULr9GfhI9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550605; c=relaxed/simple;
	bh=duJWKLbfqTL4D1zNPPk5QveBYRxoms7eL2nTGNWcLqY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z0XR+2CZH1qeb4R+gZIasYRYZ9eLg5fK5V7D+s1JCUiOaRefnwMUYxiF9dcpLcqpFhVrQ98OlCscQAzk6IHT9xflf1iHbNP+1XoKIZdggFZHy0M5cRexrMb2WyzZKs15FFcJPuh/iq//ui6zNmG1+eOgZlyN6ugXZ1a95oaqWm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eoIk2JN9; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eoIk2JN9"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82f8bbb4045so524921b3a.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777550603; x=1778155403; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PvMj/MkllnjgvE6Y7N3WHrJDvNHvsjKi1M8BHUaGO3o=;
        b=eoIk2JN9G0lyeyRKP9OQ4Tmjgi/XHJFUFEOiGH/rT+vjWi0kjVgOWKb+qY6I1IB7Fb
         wxNDv9uZL2Uyy78H22fmrEGDpoyoSt5q0d9mwdFCgHy0hvzfnRZ8PeWDzwdEyGoYRq7Y
         TxMjd4699QKuOgsNckmLFHI5UEdtlx9J7b486gPtkR+REwrcoIY975S4/EPvFyskH+ZF
         88SbgwcJy1UVi/ySM5O9MP6pkU1M4ik5qllBKDgq52rjSS3L0KAfPaMuajVEk2Aj42no
         in24wqfNSh1TOb/MuD2XFSyBxD64T1MlXjPpdASIx+8GVXK/ds13e40kzzg1QMku7hig
         +Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550603; x=1778155403;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvMj/MkllnjgvE6Y7N3WHrJDvNHvsjKi1M8BHUaGO3o=;
        b=WXtxlpIEbTxzD9+GKtsLU90iwU84KSAjP+5HxzNExEmNIpMERlDIMglIZm9gGxCkCS
         icplqgvsyB9yTUeDFs8oHKDHwz/LY+DGtGlRKyAEX3b3/GVZOIUhZ+K/CXsz7Hq7EmKa
         iybXTIwuhy3NCZL1c9D32jbQvMZ/6fxRQzu2YNkGJpfcMMX+ln9FtoiPV5IaIchUF5lv
         p2zZ9fFBg7W6qqvAMaikIJ6djagLjv0CYjtBo3ugq/zNPsipXpiIUV6j+RVRDWPho+M7
         C6T6GHm9e7wIlv6i8/Rp91RIS9lf+VgD4i3HOYIUqH321UK9BTgCBhYKn4lqRl6m5HHw
         pO4w==
X-Forwarded-Encrypted: i=1; AFNElJ9ZjO8P/Q4n6cZk2Cea0c8Ky8xSpQYlxMDRRR6w4OUDhyG5kuyehp4HDn+gXqB5QSpf5Vv1AR8wxBD888OitaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAEAEMGhRIZjmTf+YzJ6DdH2LTDWwKYMjzsA0djcSmmJSJAoF
	E19D40/i4rP0tWmngM2kOFAHAi6BK1HQodVs1DKaP7OeosHfpfX8f9hnfzSUo5inYQNc4pi4mKc
	AIg==
X-Received: from pfbgx2.prod.google.com ([2002:a05:6a00:1e02:b0:82f:b322:30fb])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:340a:b0:82f:1973:4b96
 with SMTP id d2e1a72fcca58-834fdcdef18mr2884609b3a.26.1777550602832; Thu, 30
 Apr 2026 05:03:22 -0700 (PDT)
Date: Thu, 30 Apr 2026 20:03:13 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260430120313.4078185-1-wakel@google.com>
Subject: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wake Liu <wakel@google.com>
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

Signed-off-by: Wake Liu <wakel@google.com>
---
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
2.54.0.545.g6539524ca2-goog

