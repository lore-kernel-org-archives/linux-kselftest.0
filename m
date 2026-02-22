Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835F214A8B
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771759141; cv=none; b=XQTdkrt2FHupErrBBNaAo7cZt5DvabALBlx4ajq0UvEzSQ4BU3OkZkxVYu9TUZwpQqY2CUUHWV/rhxh2/aIQCBm/KpktqSqTPN2bxcRIwYuHQOryZRycE6k7XXb1oBCOfzlsN04T5FaJDcOIwUq+1Jhkei0vmYxwwrBmmXtae7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771759141; c=relaxed/simple;
	bh=wpldMA3YF/ASlxPzZrURIJ5XvFFGmSrDWKj35Wv1nIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r7gdc0xvk/QByaot0vcIxwxxxutZ2zxNnd+gDo1K0bKyPSZgiiGPsC9pZk3u4Cdh4dLM21dX0XhbvDkcSbeDmzcYGQihDF2uNLRirgWMsFwT1ZAyjLGjhoXIqzFiBapgAckQlnzOv4T3PX/odj/MvQk9+YFW1yXF4svxRursBT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxxpkEY8; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxxpkEY8"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3305456eec.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Feb 2026 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771759139; x=1772363939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=42QsmadCxy1ROcAjHdieyR34TL6njWgc3QuJFUWLep4=;
        b=hxxpkEY8W0KafdUv+vPmQH6azp10PIgzfuHm0Ih1Uv5cI24nTNiCD9OAfqgqTIlmHh
         nDUY89T/SrD3K2N73OoYrEB7/TMMe2ZyJ/+etIKyAt8NZHZlPdul1KEdiwNXOVusgXrO
         nO9XBb8J4jLn6HMPmJT2NVj6TwrDTLR8mbbCiNR+VzpvC9dWEegBthavC8q1YagfrFkf
         7BqweQVfI0+r6XB7NWA1bo8kVERFVTYSA7h9oUIYKsBZDsMgh0jqe5LRoXxUKYDNzf8I
         yybmwRb3JWiGa08Fhi3ebz0dL+bV4FZBZjLaBMy6uKcUoifbXMZ+XoZJl4c7FgQoSVtJ
         D5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771759139; x=1772363939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42QsmadCxy1ROcAjHdieyR34TL6njWgc3QuJFUWLep4=;
        b=v31jujjYntpFdEWrdUT6aT4mHza61eaOOG+e1Rj47mNYwqIBXAkNhTC7Z4wTZhtbT1
         VNtfxsH++7NheEsnpWLu3cBjWhAx3V2U19zuEZxhKelchumZtpHIFeI6x1kCYWE47iYZ
         iUHXuh/FyKeMBN6J/DImMlhK46E56Kzz4489M88rvzaYxWaILdx8clzK4fSQW+qkaHFl
         vvN2IiVgAW0tY4gkyKAiqrDTa89I8c3mNZ4DT6iCS0RkATr0BeN5QpVggWEnucQC/cad
         a83D2JC4T+1h625Teszo3I0VaCUtQK00QaXp6scE8c+/crUdKtBJD05PUo1+9dnGc7wQ
         A2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDjBj26nRdX8EByxfp8XqHuoy1pyeFQ/jTpV/Up9uJxNeE1RG1msBNcwSNOSyacbFDH/UadvDy9vKTzZvoPgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBcXuhjd2kikRN3WOV6lOlFUjg66/KfwqU0BFTrXo+nR2XF/L
	hR6GDlwg1ThvPkUtInRpndfAFds0XOxLrJW3UUD+LRFO5bfrldnau2ve
X-Gm-Gg: AZuq6aIr8B4mEgZ7JOH5R+DY61b28XWCMLGdwiSX1FJczXw1yv/47qs8hGtiQT7dSRO
	U5iBXBaXrYu+sb9OPCMm4ViBVznZrWz98oZbviLdC3EUFuIsiEqSJ0ampq/oW4OVVqeE2dwPZJD
	efnobOpIhBS2lXmpodgUkLhR2jupnQOlRjOqj/0bKDy7Erla1fXo6Zx+RvZ+p5hRoy8voNlQTL9
	n2YNMd0z04mmwYHI9fgUuCwlGnR6hPF/P0UjnCxxIG9hmSmv7QCJ+ZBA78YSlhIADRjRti2Ou6q
	uvMA49DYK+b6n+ToUPNRc0jrVED9FLr7BOGHOtFXa6IE1IOrBwLmdUkKdHMma0QxIvJrZoUnd7R
	h6U7yX60BFxS3f2CTlufNd/xNCKRVi7L7OW+CRPlK/eMMuUiRErA6ohWAKk9w2piM/anClSFVJ4
	8gONEx36ZHVzRIHD1OZ8FZ5eY7s/oUL8V/qLZADwfZVD84LTCLg2uvu5qM5BbgObPMh+o4P0tR4
	IuQT2W5+w5v3ROX9W/Ub90w3zAtl0iBdQ==
X-Received: by 2002:a05:7022:e23:b0:11b:9386:826c with SMTP id a92af1059eb24-1276ad8a737mr2512246c88.41.1771759138999;
        Sun, 22 Feb 2026 03:18:58 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af9f74bsm4437200c88.15.2026.02.22.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 03:18:58 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH 1/2] selftests/harness: fix XFAIL_ADD matching when test metadata is not initialized
Date: Sun, 22 Feb 2026 19:18:46 +0800
Message-ID: <20260222111847.692325-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XFAIL_ADD() registers expected failures using constructor order, but the
associated struct __test_metadata pointer may not be initialized yet.
As a result, xfail entries can end up with a NULL test pointer and never
match at runtime, causing expected failures to be reported as FAIL.

Store the test case name in the xfail entry and fall back to name-based
matching when the test pointer is unavailable, while keeping the original
pointer-based matching for compatibility.

Fixes: 2709473c9386 ("selftests: kselftest_harness: support using xfail")
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 tools/testing/selftests/kselftest_harness.h | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 16a119a4656c..1082024b2d77 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -860,6 +860,7 @@ struct __test_xfail {
 	struct __fixture_metadata *fixture;
 	struct __fixture_variant_metadata *variant;
 	struct __test_metadata *test;
+	const char *case_name;
 	struct __test_xfail *prev, *next;
 };
 
@@ -873,19 +874,19 @@ struct __test_xfail {
  * to fail. Tests marked this way will report XPASS / XFAIL return codes,
  * instead of PASS / FAIL,and use respective counters.
  */
-#define XFAIL_ADD(fixture_name, variant_name, test_name) \
+#define XFAIL_ADD(fixture_name, variant_name, tc_name) \
 	static struct __test_xfail \
-		_##fixture_name##_##variant_name##_##test_name##_xfail = \
+		_##fixture_name##_##variant_name##_##tc_name##_xfail = \
 	{ \
 		.fixture = &_##fixture_name##_fixture_object, \
 		.variant = &_##fixture_name##_##variant_name##_object, \
 	}; \
 	static void __attribute__((constructor)) \
-		_register_##fixture_name##_##variant_name##_##test_name##_xfail(void) \
+		_register_##fixture_name##_##variant_name##_##tc_name##_xfail(void) \
 	{ \
-		_##fixture_name##_##variant_name##_##test_name##_xfail.test = \
-			_##fixture_name##_##test_name##_object; \
-		__register_xfail(&_##fixture_name##_##variant_name##_##test_name##_xfail); \
+		_##fixture_name##_##variant_name##_##tc_name##_xfail.case_name = \
+			#tc_name; \
+		__register_xfail(&_##fixture_name##_##variant_name##_##tc_name##_xfail); \
 	}
 
 static struct __fixture_metadata *__fixture_list = &_fixture_global;
@@ -1233,7 +1234,10 @@ static void __run_test(struct __fixture_metadata *f,
 
 	/* Check if we're expecting this test to fail */
 	for (xfail = variant->xfails; xfail; xfail = xfail->next)
-		if (xfail->test == t)
+		if (xfail->test == t ||
+		    (!xfail->test &&
+		     xfail->case_name && t->name &&
+		     !strcmp(xfail->case_name, t->name)))
 			break;
 	if (xfail)
 		t->exit_code = __test_passed(t) ? KSFT_XPASS : KSFT_XFAIL;

base-commit: 32a92f8c89326985e05dce8b22d3f0aa07a3e1bd
-- 
2.43.0

