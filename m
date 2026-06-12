Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FE37DEBE
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781245453; cv=none; b=PWZU6clivsrk3zzqZ4aBgQ84e4JOOP9B8oN7Q9Pig3TE+DCgYA8Ro5MZnhpkXTECIMfimtGgrMouFhRmovesB+FlLgLwanNDGYucLhRnJhqlaAnMfCUZhM2m/xNbY+hO/Smt+Yus0D5fsuHGdL/GtkK1sCVakpbG6vtaAbdVBHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781245453; c=relaxed/simple;
	bh=V4degicP98YaeLR08jiuNOlhbT3ArmkZyO1D0XGygGA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VngrjmEv6ljLkppt5a2va4rBuyn8vbmKmMKUhATOKG+8G1YRMeW0Ffu8+rSFdcuNTlAUTSNGtOOmY4UdYLed+Tp4cOq6cguNwzzbrr+RB6NSPgWMO+TQxFrVdp2dKUGUKEwDOLpZU2kW6MYpTQVC0IuDLfPJv7COi2ZdOHWmxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqWHhdoF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqWHhdoF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c35980c6so1286915ad.2
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781245452; x=1781850252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45sVfS/nx2nzBsCxkzCB9QiCoVHDr0etpbiBAxE4XQM=;
        b=UqWHhdoFlhEJI0xLkbtfAsUB5F2i09YWQKQGcpIFNJveF+BJiYp8fSXk7Q+JAgWjum
         lXOSwnV5iJUiSnWmyOQ8aK2nkjyelP+w9+LKVko+S23G8FOYGXI9G7+UdaAYWeAdynyZ
         tBs/IvCJ3ReqFgqCgHufoKxmd93GiOdnJGKyiTZttoBCTOCHBRixiES3xP1FSFU5DwC1
         Q7hGs184oBXTXDgAJRhM3LDa8Ji1mvE/kR1VMKnpP0MjvvXgZAxKoEuClEeOTFXJ2rXM
         dA7PWwwc22icBO4FgV2UXcvBm0Iv9UJuHcgMCo33ftV89Q4kr2hKQUKIiHY0DAVD3Q11
         N9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781245452; x=1781850252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45sVfS/nx2nzBsCxkzCB9QiCoVHDr0etpbiBAxE4XQM=;
        b=NiemFPAd11afGP7ZTrZAEJaAWmBkuWv9v63adPiYlKKNb8UTcegX0QKMLwbroCpsGU
         ed77KUo2mDRPOjRLMQDgpZV4HXHNySOl0AXGnN2WANz0pJ1lJeyA0SgKGTRB4WSrK4CT
         GllPfE4jZ7qJnL9XT57TLCi8uEOIHJKbtM4//dddaNgb4cbxOqNHkThMZvx01c3L3G1j
         0FRvd31TzvRYh1hZ7ndYC58UYWx/CtZCAJt6GPX6vV6YCVcOvv0qZPr06Ol/ucT89iZT
         gdVwuS37fXzG6/P/w5np816PMJsqrDmTJKH4sAcxFQ7SElQ/QcJSw3WD+xyGMUSneJ4t
         Ix4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/GwYVgmzyWjIw6zKL2elqtcZocpT/Of2PQp7iqN3pQhU6YQ1aGdW3yBkdw5DIrTOBGSX+KwN9HNoVNyC++uvg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh+r5Hqy3fSZdJL6OahSoB8GYIocUx7dQCxK0g3WVCS9EIxRyj
	LNmn1+M5VoaWhaNHx1xgpMjeNXFh87EFkfPBsryXe8HoQ07KC7YysWS2a8CmFNMF
X-Gm-Gg: Acq92OGuZa8DMyUu1HaKE4OnK8eEUzwKN1LSeg79WO2WdGMGJidEI67ZMIRJ5DyDeDN
	BXpRW5e16Js5+uKqhePQdy6LoWz1sahJ126gq/ybTom68od6IRVruXY/1+aOKjYq6vu+0oPHh9l
	Dqk6k6V+hCtcm+rS+AmCOk9VlBIM7+kBlJvDFg9sky4B2HISHiyYO2C77zxnV0zP32ihmJPIpLn
	8P9gNDpUXG6ywnIVGu5QIrnez+oGvit2wyKhMD7AWUrBC46Gc6FBTEpjcPHGKBEJjmNeCQkEp1u
	XIyrkKLZsoIMoyWNZN2d8Y9cHehCdlpQ5kOxZMai1tzcNmpNFYcx6F9HbnpW7dQIGHFnsRK0n7y
	Bfjqv9xm0t4a6Srr1hbx1h/q0NER6GnyByA5B5kr3LBAfaNUFmj1mRXpn5BrFzKWQk01gcp9dCz
	3ZRNd1uxtzU3c08wVigj/FnP+A3gKR0EyuotJP8ynfb5HSdWQ=
X-Received: by 2002:a17:90b:2c84:b0:36b:9798:4f6c with SMTP id 98e67ed59e1d1-37a0468a571mr789060a91.7.1781245451640;
        Thu, 11 Jun 2026 23:24:11 -0700 (PDT)
Received: from localhost.localdomain ([106.195.67.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cd8dsm1064680b3a.1.2026.06.11.23.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 23:24:11 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: sj@kernel.org
Cc: shuah@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [PATCH v3] mm/damon: add KUnit test for walk_control_obsolete behavior
Date: Fri, 12 Jun 2026 11:53:37 +0530
Message-Id: <20260612062337.2459-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260524100258.36819-1-saileshnandanavanam@gmail.com>
References: <20260524100258.36819-1-saileshnandanavanam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test to verify that damos_walk() rejects
new requests when walk_control_obsolete is set.

Commit 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs
kdamond_fn() exit race") introduced walk_control_obsolete
to prevent a race condition where new requests could be
registered during kdamond shutdown and never handled.

This test simulates the shutdown condition by setting
walk_control_obsolete and verifies that damos_walk()
returns -ECANCELED immediately.

This validates the invariant introduced by the fix and
helps prevent regressions.

Suggested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---

Changes since v2 (https://lore.kernel.org/20260524100258.36819-1-saileshnandanavanam@gmail.com):
- Dropped the userspace selftest approach entirely. SeongJae tested
  v2 100 times on a kernel with the fix reverted and it always
  passed, confirming the microsecond-wide race window cannot be
  reliably hit from userspace due to syscall overhead.
- Added a KUnit test for damos_walk() + walk_control_obsolete
  instead, as suggested by SeongJae. This directly sets the
  obsolete flag and verifies damos_walk() returns -ECANCELED
  immediately, without timing dependency.

Changes since v1 (https://lore.kernel.org/20260524091812.35283-1-saileshnandanavanam@gmail.com):
- Addressed sashiko bot review comments (execute bit, threading,
  dynamic sysfs path, OSError handling) - superseded by the v3
  approach above.

 mm/damon/tests/core-kunit.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index 9e5904c2beeb..599aac056b73 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -1336,6 +1336,33 @@ static void damon_test_is_last_region(struct kunit *test)
 	damon_free_target(t);
 }
 
+/*
+ * Verify that damos_walk() rejects new requests when
+ * walk_control_obsolete is set.
+ *
+ * This tests the invariant introduced by:
+ * commit 33c3f6c2b48c ("mm/damon/core: fix damos_walk() vs kdamond_fn() exit race")
+ */
+static void damon_test_walk_control_obsolete(struct kunit *test)
+{
+	struct damon_ctx *ctx;
+	struct damos_walk_control control = {};
+	int ret;
+
+	ctx = damon_new_ctx();
+	if (!ctx)
+		kunit_skip(test, "ctx alloc fail");
+
+	/* Simulate shutdown phase */
+	ctx->walk_control_obsolete = true;
+
+	ret = damos_walk(ctx, &control);
+
+	KUNIT_EXPECT_EQ(test, ret, -ECANCELED);
+
+	damon_destroy_ctx(ctx);
+}
+
 static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_target),
 	KUNIT_CASE(damon_test_regions),
@@ -1365,6 +1392,7 @@ static struct kunit_case damon_test_cases[] = {
 	KUNIT_CASE(damon_test_set_filters_default_reject),
 	KUNIT_CASE(damon_test_apply_min_nr_regions),
 	KUNIT_CASE(damon_test_is_last_region),
+	KUNIT_CASE(damon_test_walk_control_obsolete),
 	{},
 };
 
-- 
2.34.1

