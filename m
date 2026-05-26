Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87B519539F
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 01:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757603; cv=none; b=jlLpuOzjpk50SZsc8u7QurDiMBoIka7wlOFV0p6zaBda5IdLbPWZ1KqIQLUKS8bF9UIZYoFNJEQabmXvnXLOsw7b7tNuAvlSp4U7YRZp6KplfaM7yhyQxzBHf1rI3EXjZeudwJ7XDS/6S2RbIkhIettAYnCpc5mmY7u91yP8+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757603; c=relaxed/simple;
	bh=VXTy/Je1jTfdeX/4YnLlSdsBp3Faa7uVhPtRansJPTI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d1yk3UaqULVYTrg2oihrnP61mWmc+CQ7xa8nFaVIVo62we32WGuKA/P2viIi1dAsA8XMYk/0ORfp2rfAUAp5Z906w107x3hm+cgLTRdA7mr1JgCZFFpgZq1UVQuPo/yOjfd8DtymFmAHWFq7futRyhkSUt0GGlVkh810BMaBpIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FnLGKyCR; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FnLGKyCR"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so4831384b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 18:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779757602; x=1780362402; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgcP78CuJM+w46yzARBBO5pXbQrpyUCHSKmRsplZX+M=;
        b=FnLGKyCREJ2gQmopZXccT6wUUr2D3oXZy0Uup59/WaffTlmRp5qVdi+48N2gnBznqr
         R64UbxonYnVzFLRDXCfavTMzqWP286aZRgvQxmpEdPwEv5kTQCNon7dtnQa7vGtBaVGD
         o100nDMAUlQ5eiGT9C7FwtXfwXWBr0QjHTiUZ/+F8ixkvFphCUo25IjVkHlKPJTNBpZN
         Dm9VRP25TDj2bcRH537cwPi0Npq+XVfdF/l2Ukkz2ucQ3KJLR3JuJaNlCkGE2oAI6wiU
         meRLz1Y4uETo1ZETKWZyMwew31/GqDsVQ+9JNvXhGLaOUhMirntwf9TNy2X+rNA4HZJ6
         hUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779757602; x=1780362402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgcP78CuJM+w46yzARBBO5pXbQrpyUCHSKmRsplZX+M=;
        b=PnceYWvGj9RZC0lJjnbJA1ZOo6unlb7bUBNzakNpLcZ6hLlvRzjP7VxM2Wlg35h6CD
         FgAohIyVnzI8DNNVz291HXzjfmphBu8QW5gcpr7xguuevg9rc+iMLMUxDzMsUBWMVA//
         9worDkVrly0tlZKFgO1tkzpMUOIN5BZjNEcN6MXv/8JhZq7AmkelahzTY/Y0SmBpGSPO
         gs+RSvOPvd+vB2nkB6uKmyUx0hLAkxm+0O0xaTQlTyGjIoNqMQzO1U01s85LHuiBFAR5
         XuyblCO8Beg3FOgD5kmPNDlW+5BaZ+vsCVNa6iy+mK1O9MzJmKCwSBNgx7zIO5BWe3Q3
         rHsQ==
X-Forwarded-Encrypted: i=1; AFNElJ//kIFp1Q/8BWklhO6jrgVZUZsFhGVpMOtQqrljwigkohe+3JKZoKgKqu1ClfeVFZpph0+iifq4rDiudkxGapM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+WNN0i7efXr7UIbpEUMd/vFPxGra89RbjGxDotkXYxOLMvuYp
	o6zWa8vJVheeo3C5ryvJxAe/Ja/BYbx6qIwDg0mf7ilqaZBYAtGPJkOuiQcWfejKztuXvXx9LZq
	BNQ==
X-Received: from pfiu6.prod.google.com ([2002:a05:6a00:1246:b0:82f:2a0d:b24c])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:92a5:b0:82c:d9d0:f482
 with SMTP id d2e1a72fcca58-8415f587d88mr15926644b3a.46.1779757601792; Mon, 25
 May 2026 18:06:41 -0700 (PDT)
Date: Tue, 26 May 2026 01:06:35 +0000
In-Reply-To: <20260526010635.23980-1-wakel@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260525075748.3720995-1-wakel@google.com> <20260526010635.23980-1-wakel@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526010635.23980-3-wakel@google.com>
Subject: [PATCH v2 2/2] selftests/futex: Correct validation logic in waitv
From: Wake Liu <wakel@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Carlos Llamas <cmllamas@google.com>, 
	linux-kernel@vger.kernel.org, wakel@google.com
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
index 3053f69cf0c3..6a6fc49708a2 100644
--- a/tools/testing/selftests/futex/functional/futex_waitv.c
+++ b/tools/testing/selftests/futex/functional/futex_waitv.c
@@ -132,11 +132,10 @@ TEST(invalid_flag)
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
@@ -156,11 +155,10 @@ TEST(unaligned_address)
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
@@ -179,11 +177,10 @@ TEST(null_address)
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
@@ -191,11 +188,10 @@ TEST(null_address)
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
@@ -212,11 +208,10 @@ TEST(invalid_clockid)
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

