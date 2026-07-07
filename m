Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EB432BD2
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783447377; cv=none; b=ugb0wEsoNIfC1pTqgHjVZeZEN2Il1HSmG0XMJYhg0FoATIspG8CGWES1lt58xfxtMBxXB2FEHT6xtrXq/D/JpMpZ/eVEsbeWAoB7uHzIHSpXW54Cl+QS5ZC4lVCk7gZ8NYI5HdMplIiHdxlARDLjexlr2wysB/jzeFhlrUJn+xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783447377; c=relaxed/simple;
	bh=//cvW4gSOO1r60LHv9TAkyXpGY3vFsGKdM0tUjAHR9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL0MU3PJdkN6i/Fzs8F9ApYhPgOhdl3yEjClaTg++4TZVqRagFA48TVKQKO00tFeJQ3QGfN7xCaP6dy1LAtEh4k0l2em82vWsFql+nIaZcWJB38iaFjLAuMOpL050Qt2xMZ0xxmNfWFv3YBsPEeVLUQz0FAr8OEg55y2K0+tr4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbUuBrhy; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbUuBrhy"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664a09bc459so6058722d50.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Jul 2026 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783447375; x=1784052175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=70oQwU88o+IMY5KYIKx2if+Hd1u/ko0kAaOQAuxSTHY=;
        b=TbUuBrhyrQPxkAfVtVlz8O3SeK5Fr24ORjYO9pdnQ2q0g9JIAhrm8jEUoNLuFjYmEZ
         +qMQIVg647VuGP8p0+2W/apnkvcOIfoonBo7n4Eov03xRvwRtBhjotx9NRmVmZSIeXIG
         /2ljjGxgVvnNucx6guO8W4YGuTqKILkTi5eShXbw87OgfQ016h071ed1F706Fr5E3NJ5
         yB3d7AIXhgGWoYg310Epj6kVILsa0epVrFtbHsZ4uWFQ3BrfTCuS9+FOMnhIZFx8wKvo
         KgjXUnSLzk7ZRXMsQPOAi6wQQ5Kvq5qDUFHi80bPekM9qTYRajEi6v0k/dhP0P9xp7Df
         wSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783447375; x=1784052175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70oQwU88o+IMY5KYIKx2if+Hd1u/ko0kAaOQAuxSTHY=;
        b=hAtZd//kWTWXrOMWhkS98tfuCephDJOKw6Gjrbv8W4zR3QIVcVbgqHtRglzL6bnS4D
         wknzKhty7RuAT+MYkLli2gPVswxXQL2+rSJp/EX9PmIgV9HNU2cqNMXH2fR32goBLxUc
         lpOsSexVSjZ8/yPP6Qnw81uEzhyyyosazFgYN/x2t5ZV+LWObvURYWcgGMSoASgyaq9C
         No2RzciURrHFBlUnIMD2UqYIHrvSeN1Kl1zBOnIMJAxSy/caILyYa/LTyxIp9bFtsIst
         GI+8qVxsTkc1T0H0Ncg3QWzGRgOYyN0cVoLydCQISbLsd3vpMjhPFyUu71CGUP4QtFDk
         Sg2A==
X-Forwarded-Encrypted: i=1; AHgh+RpDbZDritsppsxEbdaXRMKEEI5ZedFSoOpRId55elujPBIEV8hHXe4b9wFRt5S0nDMwOvqeK0Ahol5ALw8VTQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwysSh7A/jpLXrNj54tI+T1ryszgtxu6or7ltc8UElCDcXmUX3
	qt1HJ0FKutUSMpcHi55SbCDV/qazk+QWkrPFoq9uuN+z7sxPACuhbTYo
X-Gm-Gg: AfdE7cmIUMLadRmT+rKa7jQa+ujUFBNdtZnFH5S9TJXtNbtYzJ3x2ThR+Ttsm/dIhHr
	OcbNDyg2DVdQ1o4fgfxflTI+LcV2ea5X8yIaMqeRqs6D7cxgrum0mQ5/LEdSQnBOnknEKGwzkng
	AMSXzS3nFrWbP/67JKms784RGaIsv8l8ufeK8fvZmn75xMLvPVWKu00cv3898jkpmyTlL2q/4XM
	QK2AR2DDW861sOcOAsK6r/MS7sBPEaTiOst3PT+zOZ5L7qCme2p8x5ueFoRyP4gpHKuUibrv+hg
	7LiupV87qrQFo4CvcQBuWXuolflZnNmUc4/Msn4g4zmHbl6m5q9ZRSdDvndqeMEN+Cjt7oEiSmk
	eJXNzqtxDTuXD++bioQWCU12ae6jXaklx4xqQpNhyQ2cIhp/RFnq4M2jyQ1yOAMZy0vw0ZqXjwH
	csizaAKUqILnqw+KS3xodyWAAHYsZvg8k+ye/uZUxipzkwFAh341hElMSXSnsCC8/GS+IUbZObG
	7SjTQHd7gzznh5GuHZb03MdYoIWDKva
X-Received: by 2002:a53:d015:0:b0:664:d786:3321 with SMTP id 956f58d0204a3-6677fc69000mr4400946d50.62.1783447370059;
        Tue, 07 Jul 2026 11:02:50 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e27d555sm165184196d6.7.2026.07.07.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:02:49 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Beau Belgrave <beaub@linux.microsoft.com>,
	XIAO WU <xiaowu.417@qq.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/user_events: wait for deferred event teardown after unregister
Date: Tue,  7 Jul 2026 14:02:40 -0400
Message-ID: <20260707180240.2887081-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Unregistering a user event now defers the drop of the enabler's event
reference (and the freeing of the enabler) past an RCU grace period. As a
result DIAG_IOCSDEL can transiently fail with -EBUSY while that last
reference is still being dropped, where it previously succeeded
immediately.

Two tests assumed the delete takes effect the instant the unregister
returns:

  - abi_test "flags" deletes the event right after disabling it.
  - perf_test's fixture teardown clear() deletes __test_event before the
    next test registers the same name; a stale event makes the following
    registration fail with -EADDRINUSE.

Retry the delete until it succeeds (or the event is already gone) with a
bounded wait, matching the existing wait_for_delete() idiom in the same
suite, so the tests are robust to the deferred teardown.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
This resends only the selftest patch; the tracing/user_events fix that
was patch 1/2 of the v2 series is unchanged and being applied separately.

v2 -> v3:
  - abi_test wait_for_event_delete(): only retry the delete on -EBUSY,
    treat an already-deleted event (-ENOENT) as success, and return any
    other error immediately instead of spinning for the full 10s timeout.
    perf_test's clear() already discriminated on errno this way; the two
    now match. Reported by Sashiko automated review.

 .../testing/selftests/user_events/abi_test.c  | 29 ++++++++++++++++++-
 .../testing/selftests/user_events/perf_test.c | 26 +++++++++++++++--
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
index 85892b3b719cc..b71813eaf5c04 100644
--- a/tools/testing/selftests/user_events/abi_test.c
+++ b/tools/testing/selftests/user_events/abi_test.c
@@ -132,6 +132,33 @@ static int event_delete(void)
 	return ret;
 }
 
+/*
+ * Deleting an event drops its last reference, but an unregister may defer
+ * that put (and the freeing of the associated enabler) past an RCU grace
+ * period. The delete can therefore transiently fail with -EBUSY while the
+ * previous reference is still being dropped. Retry only on that transient
+ * failure; treat an already-deleted event (-ENOENT) as success and return
+ * any other error immediately rather than spinning for the full timeout.
+ */
+static int wait_for_event_delete(void)
+{
+	int i, ret;
+
+	for (i = 0; i < 10000; ++i) {
+		ret = event_delete();
+
+		if (ret == 0 || errno == ENOENT)
+			return 0;
+
+		if (errno != EBUSY)
+			return ret;
+
+		usleep(1000);
+	}
+
+	return ret;
+}
+
 static int reg_enable_multi(void *enable, int size, int bit, int flags,
 			    char *args)
 {
@@ -262,7 +289,7 @@ TEST_F(user, flags) {
 	ASSERT_TRUE(event_exists());
 
 	/* Ensure we can delete it */
-	ASSERT_EQ(0, event_delete());
+	ASSERT_EQ(0, wait_for_event_delete());
 
 	/* USER_EVENT_REG_MAX or above is not allowed */
 	ASSERT_EQ(-1, reg_enable_flags(&self->check, sizeof(int), 0,
diff --git a/tools/testing/selftests/user_events/perf_test.c b/tools/testing/selftests/user_events/perf_test.c
index cafec0e52eb31..5727cb5b914cf 100644
--- a/tools/testing/selftests/user_events/perf_test.c
+++ b/tools/testing/selftests/user_events/perf_test.c
@@ -85,6 +85,7 @@ static int get_offset(void)
 static int clear(int *check)
 {
 	struct user_unreg unreg = {0};
+	int i, ret;
 
 	unreg.size = sizeof(unreg);
 	unreg.disable_bit = 31;
@@ -99,13 +100,32 @@ static int clear(int *check)
 		if (errno != ENOENT)
 			return -1;
 
-	if (ioctl(fd, DIAG_IOCSDEL, "__test_event") == -1)
-		if (errno != ENOENT)
+	/*
+	 * Deleting the event drops its last reference, but the unregister
+	 * above defers that put (and the freeing of the enabler) past an RCU
+	 * grace period. The delete can therefore transiently fail with -EBUSY
+	 * until that reference is dropped. Retry for up to ~10 seconds so the
+	 * event is actually gone before the next test registers the same name.
+	 */
+	for (i = 0; i < 10000; ++i) {
+		ret = ioctl(fd, DIAG_IOCSDEL, "__test_event");
+
+		if (ret == 0 || errno == ENOENT) {
+			ret = 0;
+			break;
+		}
+
+		if (errno != EBUSY) {
+			close(fd);
 			return -1;
+		}
+
+		usleep(1000);
+	}
 
 	close(fd);
 
-	return 0;
+	return ret;
 }
 
 FIXTURE(user) {
-- 
2.53.0

