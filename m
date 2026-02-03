Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F7E2C21EA
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109612; cv=none; b=V0zSV4+2K9MiFPu9AvyajylmfpvyC8PD6Sv/rPLVKr/YKNTXmCYSdp8qU+WMMCMmCZk2QCGPHmXdzGrlUkM9eGKTbzLJVV0lOCX3oUc+AKrTx5V8d8DJtnRtacMQt+6qRrFzbVfJ8ow+qg6ZgLhFJ/AYbLR+DgBq6Rnq6nhryNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109612; c=relaxed/simple;
	bh=roPHS30FKONpEYdSShHFx8BOvw8b3TfAY4ZJXfFKDKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LELaxsSA8leMe6+DdtXj9kBiNlo5zs88eEGKRLCGfqKnrnAJYRRnhrs09vBtc1Gct11Ne08kU7A1jPUTDkrnXocQCWKQElnofvxrScS2Z1wdm7t2WQNUnfUJVIvkuG090Ip/tXnsrL5NDDn0o3NiaKYQDijGfTZfSh98ZHSJ2vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Luy/iF2Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Luy/iF2Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-481188b7760so35467685e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Feb 2026 01:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770109609; x=1770714409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpbKMtC8BivCbI6h9yvvOEnL3PIMyeN3yev0pGv9rtk=;
        b=Luy/iF2YKNS2I568YtWP9BkQ/cVc01nXQCdcfbHu8PyVQ/i2TwnSHFxOZMLv8RJzw0
         4Higf/MO76iXrdZOIiZznjooGYJrBRIzdz37TD8fU921aEOcH6Dpas5i5k60VDCuqrnf
         8HZFWaCO5DV4Rx4LAXOfDxF+bND1OC1WFe351W4wqefgMzbmrEc2wRqnM3eByUTa6/AE
         mIq/DHCar1+cAKG7v8WgHCVZ2fCsVl/64GMUPN7i5Dvgic4Ce6PW53tRwoOuQkUor7eZ
         3jdrDvj3GSYG+QLWviltCei6aa6Yk69ssZF1lPlJjeNZJv0CKS8/Ac4Kg4dSPpRIPm8v
         5POQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109609; x=1770714409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpbKMtC8BivCbI6h9yvvOEnL3PIMyeN3yev0pGv9rtk=;
        b=YDemnWQBx2cLSd+n8ZvxYOgf92emNb39sXyHIjO3ldd2LLtz8cRoWj49NxwjEMYyvk
         eRoBSOBMqQW6WE5DWCXTPcNK9fmQ0zESQ79PuUF8FOVxbh2EaiTeDZyZNONdseSY4iRv
         qw0ayrIX7j8aMNbBJ1JDDfWMb6BOG3NNdFN3f9qHK4Nh3bmvEozM7vRWgkwBSl635GqS
         Fey0zFd9kyZzGmSKFC9Q8qJe/cIAjF+cSFNcKVziqkmZyFpwyS+wGdgvLAJ5QYzvK6MQ
         OmH9oeBy6Dx9lSLxpKnKuaxHWot3KWtAHsJgNEudY5WLJroWF/9kZqRPgETqYA6aCabF
         R3hg==
X-Gm-Message-State: AOJu0Yzffy3R/l9wWl6x29Os4e/7Bsdgu0sXFy9bn/PVmlqx+BWB+Nu4
	ffJfbdJswfpixtEjwICLdLaEIHdM+YDuhnNqUtLektvw7HGRJ8ffQnai
X-Gm-Gg: AZuq6aJdmMEUK4bg210kBKC358woIkRCe8y8D+Qs/e6w01SVUm+mkmannCjHwCpQn+Y
	7XswOt5xy/2P81IVUs7wuyy1bpF4yM4WqNFqrOUsV64MVdxBD4ueIZM1fqNThRS6h7+Pw22f1/G
	HKjq9r/qWwaWovJyh4ajNjj13Pl2UDoFZnkD1Z0c+BZLeCWIFleJktEYXp0YiqKKylAwbu8vDIL
	bZyeEG3fBpqk4KfGhrPZVgpBPebQ1fLk/+KtIJ4K7l/0uHdEAQx9TcTbItRxgy3nCESWTtB2Qs7
	u1ZxjpzBURj9G+8fwwhZ2AN+HCw3YJVbvDh9SWy2TPrcGfGrGcIp9IQgpzfaE7sgtDzruZbz/zK
	3lKq1dthDCFC9no5E5/S5VC0AYruy54OokICoB6IQ6D9eabDzCvkzg5ToXF0iuKORguxkXd21sd
	XqprtYmBaK8xkl3f8wKmnhXxWhtl4m6Pb5SSRtFKQh/ZjbaZdKuz0BRqYtIUD4uA==
X-Received: by 2002:a05:600c:b99:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-482db49a483mr188667685e9.28.1770109609053;
        Tue, 03 Feb 2026 01:06:49 -0800 (PST)
Received: from nixos.numericable.fr (38.42.3.89.rev.sfr.net. [89.3.42.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm78418655e9.13.2026.02.03.01.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:06:48 -0800 (PST)
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
Subject: [PATCH v4] lib: math: tests: drop unnecessary KUnit param_value casts
Date: Tue,  3 Feb 2026 10:06:09 +0100
Message-ID: <20260203090609.30430-1-titouan.ameline-de-cadeville@epita.fr>
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

