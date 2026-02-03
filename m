Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED91B324707
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139917; cv=none; b=X192RAW6S0SKaicc941AP78L3DjyJcvm6bJVi4/e2OdetUgMaVdRcdcRRNaNncwp6dYo7O5opwn23j38u5w+L8RdaBE24EnrQ3cj0IQbsWweCPX3GEC4sffoavI0rX6QmuwgKTxw6+CFDAHqrqPbYQtr5xb6DjT3Xo2NV9dirtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139917; c=relaxed/simple;
	bh=uNXxK7WLHpMlPbgY+TeUY0Z5PZ32vbrTx+aEsPz338A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQCed57XYyqCnrNGn2TCHvtWpRYZR5ZtlcBlcFGj1UWHd1LIQPjN/n2zvRhTRN9iKvYX5Cf+9JpWjPpioXuYLuLvvGIfaDiNpjQq8Q6iVCtF/IHLXM/TdfMCTUXENoQOfLAk9XnbLUiqn55Vow0I3XKrkkDq98CODRzEDMTqaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwvGPHYD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwvGPHYD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so466635e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 09:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770139913; x=1770744713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBtQI5zA6navMOTUiG7Qoh+HnLf7L+vzMhsUMoPDOV0=;
        b=XwvGPHYDPucmETXRESZsxhLGcjyWUmAcSS2nIOo1VZDxC/GyZwdnrcn10epfOYDVNg
         ydVOAZRKokd0iNU/tDPtV7JrZc47t52MyX9uH7M3QQC9TKMxPustL2nysbagoJ/6iSGE
         Yaws6IYmA9ax9DZot0h560KHJ1q5Jwc6yemFXlE75yIiwpyvm+q0JHASBQsVXiIYKMKH
         InLumb1v9Pd6dRbjkMInUPUGPAXXzCv2RI7w6c4nFUJdmFt3VfFT/GMwT9oZgGwa2mMc
         fT3zEUykA1z41+M6WGrO1GwSnNRQaaLnrwEq2zu12xUjNDKdQeKTTmQ5JWNtKzmLordC
         aE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139913; x=1770744713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBtQI5zA6navMOTUiG7Qoh+HnLf7L+vzMhsUMoPDOV0=;
        b=Zvb1At7sKhfrs7TkIRZ+dDPBFaR5ikEMNh01AdCfK4jBAX4tp86aYCMPTnO+LQNYVb
         hUhyg26wxmukOVk8swnZjDDXt7LkbIMQUTxh1ZjTLun7FqDTM6vV0eNRsGuqmm0kt3Sr
         5leiswnm6w0ieeR4HkPnHjGQ8/509EzmV9RPJVs1I1F0qIfPF6RLdGylPzwilONLG72p
         ivKvpdXQ9R5fSHPgvPZmcyi9UNgUvep11nUedtqQxDQZxkOERbf6KDn9zz5E5E9cK6PQ
         lvMuxH2NeB/NIinCOCK2Egxfh2W7Ymn2DL6qr2UQSetzDysnfBRDxE6w+j0G1cXKhUbt
         iK2Q==
X-Gm-Message-State: AOJu0YybHPO1gkayfiw0Z4vrInEjT7khWUZ285sLYl9n5wkaFuWAvVWD
	b5LzK2COruZC86ToJ1Pz82Yrp9FfOFAW4TdjaJFaWBAUMhGnDFYldyHx
X-Gm-Gg: AZuq6aLgT+JEZsPZqE0tFHeCclKTEDzhXqmlaXpJxXAg0A5u5X7PSBCHJxx3XQCGhUV
	W3QesT2bg1zyG56g6LwX0oZu3YhwLyJ6aC9ZQDIBNcPbClrjprkeT6+0jcF9QqAqsOxEIwURUfK
	d+hOnRuiL5/c7B1c+6B08W7ptPVd3BLS4vmxoPs+n5ePSYC2cX7dBfyrI1jLn16sPxO9CUD+gQC
	tpunp7XQRAfsFGz2F1JBnNwYgXoe8CKjgzW2mAmWaAv08NFhQZScycEEefqQ23HuhB0sUHcQKRE
	ZfWMiIreMaeNfJyS5FEQ8CrNpIZsS1REK2ZUM2gjHLzGX8X4z+WtpPqJE2ci0Ik4y11efQYZ9+e
	iqJExhzY8SCEcLBRFqUmohCWpqNmRFLoePzd/uD5KG85alRA6QCv0B854VHxK4QV20jRGntXeo8
	7dwwTYvTPVH3H6iqexHmGa3y7q5NxjrZNfQS4mcFvHwo/szg==
X-Received: by 2002:a05:600c:8904:b0:47f:1332:e5f with SMTP id 5b1f17b1804b1-4830516490bmr49787005e9.12.1770139912880;
        Tue, 03 Feb 2026 09:31:52 -0800 (PST)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48305129321sm74868525e9.4.2026.02.03.09.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:31:52 -0800 (PST)
From: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	davidgow@google.com,
	raemoar63@gmail.com,
	kees@kernel.org,
	eleanor.lin@realtek.com,
	visitorckw@gmail.com,
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
Subject: [PATCH v5] lib: math: tests: drop unnecessary KUnit param_value casts
Date: Tue,  3 Feb 2026 18:30:40 +0100
Message-ID: <20260203173040.42158-1-titouan.ameline@gmail.com>
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
Signed-off-by: Titouan Ameline de Cadeville <titouan.ameline@gmail.com>
---

Changes in v5:
- Use consistent email address in From/Author/Signed-off-by (titouan.ameline@gmail.com).
- Add version changelog below the '---' line.

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

