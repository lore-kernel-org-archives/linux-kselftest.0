Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF718392C3D
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107886; cv=none; b=GrjxSmZ1M5uqLJI9TAxLP67G006MeAjzwe4kPo8TroA8nekTlwzCWy3jwrPNnZkyaopAM6x3gWtZ974x97kfmXjDMZ4J40WAE0OSPD3Z9rBWqZSGWWy1/g4el9/p5oqZOkUT8cP1br7BoiqhHW2U7YxLCZ6KN+EdMfFMALwLByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107886; c=relaxed/simple;
	bh=roPHS30FKONpEYdSShHFx8BOvw8b3TfAY4ZJXfFKDKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sj4bngSbRGSKHSAtXZ7cpXKaLexOM1AHT1HtY+AAecLpkIrffl9VgGMxYZz2a8omsfU77XwONrHA2G7w2u34uyzWPmHL2FP3mgXKwc6HJcNb+xw7uHZzeUJsOdg8yRfD3sl1m/zuGa2GDUBqoeO6bWW67CHmxeSwLshThBe/0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXmxKPP7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXmxKPP7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso31467555e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 00:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107883; x=1770712683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpbKMtC8BivCbI6h9yvvOEnL3PIMyeN3yev0pGv9rtk=;
        b=iXmxKPP7vMPWNxg+NsEPFkrDv2Wqah772FNCToTRc0dVBkv9xDzjtBonlnadUTXW6i
         kBXn4JxPB8jBMGi/azGHDeSzgbZUTXT1bcN6Ysl2e+1GrqwUVYi9Yusf1v312Sm282YW
         eoYthjObB2USBQrQbiI9QLLD/lchO7i51gqg9i/XkqSUrqoUbA5KGuWj9rUiifipAeh2
         Hx2hdkwmOaQ9nQZ4Bioh+ctGmmT/bqOCmmVtmbwbWK1RwJsmKvMOSAz11Wj7zcCbWhpU
         XPTDE/Rdu7R4e3tphIXcF2CF1RU3IW8jKXVame6Z5VFvHQ78dKOFqxDmgYg/h0X8Wsdp
         mKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107883; x=1770712683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpbKMtC8BivCbI6h9yvvOEnL3PIMyeN3yev0pGv9rtk=;
        b=ay1UPcoZUetCuAqjl2EZLhQYE6OIndumVZm8CvvcVui7NAGTpCMThfGxwMLwnnWyHX
         +PfXejsU7/EtD+ZAodrd2MvJnLuNuki7bxnkAXvsOnMhyKDFjrof/+V1kreDzX/Ettmk
         pJkVRYz5HXLbkmmgqeWzMIDZp9UnPA3BszNLb2EyGF7yRcNVfeo9VXjjavWqPAKr7KAO
         k2ssUp0DjGIJ/oeDJykYHpRALk8cKtj+tk9NfOvg5MHq67zIxSLKgDHarwrLZd1Np59m
         y3lCdAjGNdE+scoKahOukUFPzNi9R+QWJaBlhCRYjOtIr8+6xBTF0TBtVgF4Zs+n1t86
         tqvg==
X-Gm-Message-State: AOJu0YwvUrhPjChY31ZsiJiahEjV7Tg9Ql/QWKxpy/W4egM0KhCKvvpm
	kcQOcn9CyRfCRY1do1CY29kkTbYI0Q1rbRomy+Q/USS1kB/tBj2oPPRX
X-Gm-Gg: AZuq6aI+EELwUaVUKsRmXunmfyAcFSb/YPixskF4rc1vR9n7JsYvUcgErgndPO8yLBD
	Tow9UKnPuSds99VD5fQVil0F3pAQPFZQzuZ+YjMz++AFH0mu5nc/GtBujow8WSxZSxgjw4dT7aG
	rrV9i2AEmk9e3F+rZZilkCtHYQp9uEutCu0UJIX/FsI7yUajbCmoAsCxEYgtvo/s7rDDLCwu9hY
	oD2+bl940FETue8E5246vKM5Q+CoFVmZ+xSMY7QNo51MsNwN+UTEdfxRIB+DB4dGTiVvGoaqYq7
	DLZ3kq0lllBVnC7WWptrJy5pfDVYkinSXb32Q08LMJPlI36Zwr/0w/9JMhVEVhSm6YfC1vLHKNT
	V+Tlgcn+S4JVHyUqFVtvGacXFVVONcB+7p6vKkqVcTCl8KWVb4wafuNxY8NAUlTfTs0U2fJR8kt
	oqw8HajGAVtd049qcLND1uEIoYcJp5Vv4skPm607k4gLASuNGSw3ceCpgElKY74fyIVsBPjq/O
X-Received: by 2002:a05:600c:4e56:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-482db47cf2dmr207798905e9.22.1770107882958;
        Tue, 03 Feb 2026 00:38:02 -0800 (PST)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830515381esm50518745e9.11.2026.02.03.00.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 00:38:01 -0800 (PST)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
X-Google-Original-From: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
To: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	davidgow@google.com,
	raemoar63@gmail.com,
	kees@kernel.org,
	eleanor.lin@realtek.com,
	visitorckw@gmail.com,
	Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
Subject: [PATCH v3] lib: math: tests: drop unnecessary KUnit param_value casts
Date: Tue,  3 Feb 2026 09:36:08 +0100
Message-ID: <20260203083608.29109-1-titouan.ameline-de-cadeville@epita.fr>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary casts from KUnit parameter access since param_value
is a void *. This improves readability and follows common kernel style.

No functional change.

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline-de-cadeville@epita.fr>
---
 lib/math/tests/gcd_kunit.c      | 2 +-
 lib/math/tests/int_log_kunit.c  | 4 ++--
 lib/math/tests/int_pow_kunit.c  | 2 +-
 lib/math/tests/int_sqrt_kunit.c | 2 +-
 lib/math/tests/rational_kunit.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/math/tests/gcd_kunit.c b/lib/math/tests/gcd_kunit.c
index ede1883583b1..b9c9b8758991 100644
--- a/lib/math/tests/gcd_kunit.c
+++ b/lib/math/tests/gcd_kunit.c
@@ -34,7 +34,7 @@ KUNIT_ARRAY_PARAM(gcd, params, get_desc);
 
 static void gcd_test(struct kunit *test)
 {
-	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+	const struct test_case_params *tc = test->param_value;
 
 	KUNIT_EXPECT_EQ(test, tc->expected_result, gcd(tc->val1, tc->val2));
 }
diff --git a/lib/math/tests/int_log_kunit.c b/lib/math/tests/int_log_kunit.c
index 14e854146cb4..9f9b48232701 100644
--- a/lib/math/tests/int_log_kunit.c
+++ b/lib/math/tests/int_log_kunit.c
@@ -43,7 +43,7 @@ KUNIT_ARRAY_PARAM(intlog2, intlog2_params, get_desc);
 
 static void intlog2_test(struct kunit *test)
 {
-	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+	const struct test_case_params *tc = test->param_value;
 
 	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog2(tc->value));
 }
@@ -52,7 +52,7 @@ KUNIT_ARRAY_PARAM(intlog10, intlog10_params, get_desc);
 
 static void intlog10_test(struct kunit *test)
 {
-	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+	const struct test_case_params *tc = test->param_value;
 
 	KUNIT_EXPECT_EQ(test, tc->expected_result, intlog10(tc->value));
 }
diff --git a/lib/math/tests/int_pow_kunit.c b/lib/math/tests/int_pow_kunit.c
index 34b33677d458..ef9c8a9bd8ac 100644
--- a/lib/math/tests/int_pow_kunit.c
+++ b/lib/math/tests/int_pow_kunit.c
@@ -31,7 +31,7 @@ KUNIT_ARRAY_PARAM(int_pow, params, get_desc);
 
 static void int_pow_test(struct kunit *test)
 {
-	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+	const struct test_case_params *tc = test->param_value;
 
 	KUNIT_EXPECT_EQ(test, tc->expected_result, int_pow(tc->base, tc->exponent));
 }
diff --git a/lib/math/tests/int_sqrt_kunit.c b/lib/math/tests/int_sqrt_kunit.c
index 1798e1312eb7..9c46024b0fc1 100644
--- a/lib/math/tests/int_sqrt_kunit.c
+++ b/lib/math/tests/int_sqrt_kunit.c
@@ -45,7 +45,7 @@ KUNIT_ARRAY_PARAM(int_sqrt, params, get_desc);
 
 static void int_sqrt_test(struct kunit *test)
 {
-	const struct test_case_params *tc = (const struct test_case_params *)test->param_value;
+	const struct test_case_params *tc = test->param_value;
 
 	KUNIT_EXPECT_EQ(test, tc->expected_result, int_sqrt(tc->x));
 }
diff --git a/lib/math/tests/rational_kunit.c b/lib/math/tests/rational_kunit.c
index 47486a95f088..b05587a1e90a 100644
--- a/lib/math/tests/rational_kunit.c
+++ b/lib/math/tests/rational_kunit.c
@@ -33,7 +33,7 @@ KUNIT_ARRAY_PARAM(rational, test_parameters, get_desc);
 
 static void rational_test(struct kunit *test)
 {
-	const struct rational_test_param *param = (const struct rational_test_param *)test->param_value;
+	const struct rational_test_param *param = test->param_value;
 	unsigned long n = 0, d = 0;
 
 	rational_best_approximation(param->num, param->den, param->max_num, param->max_den, &n, &d);
-- 
2.44.2

