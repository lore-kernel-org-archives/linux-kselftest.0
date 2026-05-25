Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F913D5C1C
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695881; cv=none; b=dUxz0cW7vfkhbL0dViU3u1SX3CMDG3uYrV/dOoVkZA2/mK3RtE8xiBHDGturSRgXecbt3Msct7NxwccrD670boEQnHh2bfj1F8JFUdNY/fi5/GjdgXIMF2H+Dr0Zky4q5zkIbGGDRd7VVHRACZLpDKYB3V8ebLX/8HYI8rsGBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695881; c=relaxed/simple;
	bh=fbvLfcz5OT2LfqTOnVqPrV1GxfwNPFKnYVcQ4s0lcrY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pKbUfmLkInypnMIAVpu4aQSBEoldfqTxe5enTrBsxSQG5l5nGgQeuiKHsZVGQnACUH8+jPVmfN0jb7InKCnncm844VdbZkA93ONecAx9rLgUaXorwiWEreZgAskbkuyGZzYfGvcTONN2yux24eVr8KYw0m0xDO6i4aGb6qyutyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d57cTJPQ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d57cTJPQ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so5991051b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779695879; x=1780300679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffj7eFdWHqWW/R+dY3OxqwXEtgbaXV+LozfSiunZvv8=;
        b=d57cTJPQDwUwQsKl6DVUvJcwPme/xC2D+/vn4ALKkv7BoRU18EsM7xI5M8nwwBOVQQ
         uEk1xX88S5nGJYKyHxpy5EEeMzMPA83Q2UiXwCfszgT2Y/u5a1ihWmtDyJ8BR21IzaVO
         FDZdLUrtR6CUh5M6aGfHyBp9hA+O14OewTSZVV7lVWPqI5/qfiMIN2opHLWxSdc/lW3l
         OLBPXrp/RiuOK+J544Xt62Rx6Enl+Kz4KE49IO5kUfvrT0rwjXC8cUKDv3LjVgZAwcZP
         /uron7g9AFRD49PLXU3fqNmNxzKZbKJ5ksL3Q3YRWtsR0XjUYU1Jp4NVw0gv/GciuLk1
         TiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695879; x=1780300679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ffj7eFdWHqWW/R+dY3OxqwXEtgbaXV+LozfSiunZvv8=;
        b=hlewNXSRCY296F3xhAfNaRWtOhKgHszYrzCcXhOMheIR7y6WOmz5GZZQ5fjlW3+U84
         wkJ2kBWhOKor1xVVB6gbqJ/bwt8ncrUGKzqkDrv+NfvpwspUXWmgcT1zFqMyY9UxX3Po
         EaWgfKtCAONTANd+76ayKb8zZ7r5o2s2umyG2Se+oMelKsV/KIbSLR7i7eBn24A4HYoS
         pkdNHAxNkerKubdwOpm0o/HO2bhWtnQOBRB55Aix3l/LV7EHEYyOpV6mOZWp0WtBh1pC
         Of/4CpbuN7kxoejQh9AgeUtaVD1l+MUhYY/8E91q/g5Jn8ThTephBwNAgbi4BEyTQiTE
         el4A==
X-Forwarded-Encrypted: i=1; AFNElJ/6s5S/fIRLgjo33yvWqe8KfwChL8sOgtQqplebSPS58m22JDwPPEW/vhqTYxZ+UmmqypQDtg8xTw/rbiga8Y8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2tptwTkccVDdNUCzm6s5J+msiyunzPXhDREEkm8HIPz1OIa3
	sQraetNBgBLmHSFU8k/SctIq16wZ1uh+vnGxxLsMQX1wuLSTl0WehgN+r53OaDwAfyFnS03Zo4l
	chQ==
X-Received: from pfbgg15.prod.google.com ([2002:a05:6a00:630f:b0:837:c7f5:5c27])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d0d:b0:83f:250d:5ab
 with SMTP id d2e1a72fcca58-8415f3a79f7mr12477853b3a.7.1779695878171; Mon, 25
 May 2026 00:57:58 -0700 (PDT)
Date: Mon, 25 May 2026 07:57:48 +0000
In-Reply-To: <20260525075748.3720995-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525075748.3720995-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525075748.3720995-3-wakel@google.com>
Subject: [PATCH 2/2] selftests/futex: Correct validation logic in waitv
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	Edward Liaw <edliaw@google.com>, linux-kernel@vger.kernel.org, wakel@google.com
Content-Type: text/plain; charset="UTF-8"

In futex_waitv negative tests (invalid_flag, unaligned_address, etc.),
test results were previously evaluated as:
    if (res == EINVAL)

Since sys_futex_waitv returns -1 on error and sets errno, direct positive
comparisons against res are always false, causing tests to silently pass
regardless of real errors.

Correct these validations to assert EXPECT_EQ(res, -1) and compare errno
directly against expected constants.

Signed-off-by: Wake Liu <wakel@google.com>
---
 .../selftests/futex/functional/futex_waitv.c  | 45 +++++++++----------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_waitv.c b/tools/testing/selftests/futex/functional/futex_waitv.c
index 7bed76a1caed..9dc0f9c1f22a 100644
--- a/tools/testing/selftests/futex/functional/futex_waitv.c
+++ b/tools/testing/selftests/futex/functional/futex_waitv.c
@@ -139,11 +139,10 @@ TEST(invalid_flag)
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
-	if (res == EINVAL) {
-		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EINVAL)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 }
 
 TEST(unaligned_address)
@@ -163,11 +162,10 @@ TEST(unaligned_address)
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
-	if (res == EINVAL) {
-		EXPECT_TRUE(0) TH_LOG("futex_wake private returned: %d %s",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EINVAL)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 }
 
 TEST(null_address)
@@ -186,11 +184,10 @@ TEST(null_address)
 	to.tv_sec++;
 
 	res = futex_waitv(waitv, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
-	if (res == EINVAL) {
-		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EINVAL)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 
 	/* Testing a NULL address for *waiters */
 	ASSERT_EQ(clock_gettime(CLOCK_MONOTONIC, &to), 0) TH_LOG("gettime64 failed");
@@ -198,11 +195,10 @@ TEST(null_address)
 	to.tv_sec++;
 
 	res = futex_waitv(NULL, NR_FUTEXES, 0, &to, CLOCK_MONOTONIC);
-	if (res == EINVAL) {
-		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EINVAL)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 }
 
 TEST(invalid_clockid)
@@ -219,11 +215,10 @@ TEST(invalid_clockid)
 	to.tv_sec++;
 
 	res = futex_waitv(NULL, NR_FUTEXES, 0, &to, CLOCK_TAI);
-	if (res == EINVAL) {
-		EXPECT_TRUE(0) TH_LOG("futex_waitv private returned: %d %s",
-				      res ? errno : res,
-				      res ? strerror(errno) : "");
-	}
+	EXPECT_EQ(res, -1) TH_LOG("futex_waitv returned unexpected result: %d", res);
+	if (res == -1)
+		EXPECT_EQ(errno, EINVAL)
+			TH_LOG("futex_waitv returned unexpected errno: %d", errno);
 }
 
 TEST_HARNESS_MAIN
-- 
2.54.0.746.g67dd491aae-goog

