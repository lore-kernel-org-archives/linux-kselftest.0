Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5910125785D
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 11:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933156; cv=none; b=Lm8bC5f3n3EQFbZFYs5GeUaEaLZXHzHx+q0yaAj9ruJ8gtO3jDbNs7ibvMESU0Aqo7MxzWkD7fil0VqocoVU/0alz5wFFb3V8AP2GcbK79rUsl0QANIsWjvYgSR7nWrH0rDI78xln7i90JluMOghleoxd7uix2SDQMY4lR0y1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933156; c=relaxed/simple;
	bh=4sWOiOmov7pXHesk/kMClarPFFoDVRWZZWw5FqizKLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+W0D64VA3D4dgtTlk2uToX7C4xgWvhaEixx3Ti0WlZkTcydrPbFabwMvRuOZakqN30zOt4Nv/BZcAxsYt1ZWDc1avQ+6Odp5IlypaB90ok0WBBHMFOAu72JKrj4g/zOCBqnBCvhEAP2xc4K4wbxIgM84hChpcVrEFSEykgvo10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZ5CgP3R; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZ5CgP3R"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-46391f4c1f9so3146195b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 03:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771933154; x=1772537954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0osYvSfuq+cEJNXKz69BQQO4P3x6o0j/TaGapvJ+PU=;
        b=FZ5CgP3R5HHfbrIgwR3SiARfElLPTInzEuDrZm/n709TwrFaDnTxAMMm9vOxzZKcW3
         2D5bKRUA+KgK94sZxWDALffpjsMflTWXYOe8VWz2jkQQ4y6h24//+j2uZnY6f+b76eJq
         2u71LBr+eBcFUcxTZpWMwqIK5U9vTVFe0hhai3HaLm1MDhyUDrm/k6PLQt7PKMHa1ux7
         dkhe+p9C2GgL2SIPQI9cf3InjCATc2lDGiQSwd0V4v71U0xuEFTt623REtrNuMB+fXJe
         MEGVidVsgW06MNN9WQDkZvb0xVlDvi8yC3stTDwcDRSllrPKfzGLjovGh4da8u4QsPpQ
         GuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933154; x=1772537954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0osYvSfuq+cEJNXKz69BQQO4P3x6o0j/TaGapvJ+PU=;
        b=UZJI8lNglXvKr6KcZj1XaDrGH9G9wPeS2igwyrzXX9u79O0aJfT10vsRNhUEhcuGWm
         dwKqCud3eoyEcGHt5xrO070o3+61zpQ9ag5e8wST7A10nw/BA75WDME1qRmsUnhidHwi
         had4e4pdbyzHaB0zhoHALDTzH/1uBQYj91LcjPksr2Jwo6bLx05nrnPfQx9gCCyQ/d/3
         39EukWDKUGJxShBPsCBG8GuwcUKOqJbEzbQ5OA+Wt+o8hunwdv1h7MVyoSEOZE2h07FY
         vqRRX11HXFWWPsiKJJV9GxRwj0ZsbK1vf6KY5Alvlk69KcUU1HfaaeGbDc9kQN6+tUFH
         VPbQ==
X-Gm-Message-State: AOJu0Yzff0JNnBZXQzhXgUYVzlwqZ4mZnCe3Ab5eAo4BCiXG4l2smTrv
	C3qY9hJDSShVloWkjFxcpmRz1PmLw5Yk/DwR60AqTBDFiF3zNDZazZqyHNP3YQ==
X-Gm-Gg: ATEYQzwxrnwMGIys6SHpCI35TVA9XiL1so/cSdbb+yw2WBERN9MHPKTjsQDpLf8kAcl
	XCIGNQBTjPIhB0LIW1SrGUcsBiI4r0VUqEbvlkb3cGYV10rZyvPhhOyyEPzS6O0/fvIsPadwVq+
	IFZid0nczRUaXixCD+MefaVb+9JiXBXH3/Ca7iR7rMAD4sXayqYbUfB6u0eIYNcv8sZ9xjROqhr
	nyVbbcEJfet1tnYeIT4/WBbziIR6aoJtIn2i/rf7vZQxSDZMPP5S1zwqX+MGfdABN7PjnDNDtgh
	woOgbED8rbtIxIShJpvKFl8eHtBUCc4sQLdy89MxG4CjwB27YsWJy+14Mfhh2k5AOCcBVX7w2AG
	KDjfZcrNwvDVvhZiy97i78WX7bFXucGl6ulcvI/NC4WKUoOonoKAatKT0wnxdD99GNA5kYn/ZA1
	xER0BmbFc92Pt517zjTCcvWTCvLT7CtwJDK7/EecLXzGp06MCMPT/wNwhXooiN7NrKsI4krkcP0
	Y/KdscmyKrzOgSZYlQll6M=
X-Received: by 2002:a05:6870:8587:b0:404:1967:d6f7 with SMTP id 586e51a60fabf-4157af8cb38mr5873853fac.28.1771933154180;
        Tue, 24 Feb 2026 03:39:14 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cf9a388sm9899241fac.6.2026.02.24.03.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:39:13 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	davem@davemloft.net,
	horms@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	luto@amacapital.net,
	wad@chromium.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 1/2] selftests/harness: order TEST_F and XFAIL_ADD constructors
Date: Tue, 24 Feb 2026 19:38:59 +0800
Message-ID: <20260224113900.3331-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
References: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TEST_F() allocates and registers its struct __test_metadata via mmap()
inside its constructor, and only then assigns the
_##fixture_##test##_object pointer.

XFAIL_ADD() runs in a constructor too and reads
_##fixture_##test##_object to initialize xfail->test. If XFAIL_ADD runs
first, xfail->test can be NULL and the expected failure will be reported
as FAIL.

Use constructor priorities to ensure TEST_F registration runs before
XFAIL_ADD, without adding extra state or runtime lookups.

Fixes: 2709473c9386 ("selftests: kselftest_harness: support using xfail")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v2:
  - Switch from name-based fallback matching to ctor priorities.
  - Drop the extra xfail state and runtime matching.
---
 tools/testing/selftests/kselftest_harness.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 16a119a4656c..afcba0c4e98d 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -175,6 +175,9 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
  *
  * EXPECT_* and ASSERT_* are valid in a TEST() { } context.
  */
+#define KSELFTEST_PRIO_TEST_F  20000
+#define KSELFTEST_PRIO_XFAIL   20001
+
 #define TEST_SIGNAL(test_name, signal) __TEST_IMPL(test_name, signal)
 
 #define __TEST_IMPL(test_name, _signal) \
@@ -465,7 +468,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
 	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST_F))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \
 		struct __test_metadata *object = mmap(NULL, sizeof(*object), \
@@ -880,7 +883,7 @@ struct __test_xfail {
 		.fixture = &_##fixture_name##_fixture_object, \
 		.variant = &_##fixture_name##_##variant_name##_object, \
 	}; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_XFAIL))) \
 		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
 	{ \
 		_##fixture_name##_##variant_name##_##test_name##_xfail.test = \

base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.43.0

