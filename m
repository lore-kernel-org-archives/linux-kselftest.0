Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3B28B7DB;
	Mon, 20 Apr 2026 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776674665; cv=none; b=dqffraRSK6qnaau5JlWUb68Ee3X5R2SnO1QXXHFreUNEt3KcyAh04q6xBMrd2hOoj1ZtreO/C95+KbBMIazUW7zdelIA/2j9QHhfwgTXXlSkxnGfw7loXpiCLk8XqRmn0sWSr9Gf24J+8Soo8V1KOGCz6ZN13obm9wXrf5jkMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776674665; c=relaxed/simple;
	bh=P2A2Rcf45sJLVXR7eLOtjU1bbL8BlWrtZfGu65GNP4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O6okSKtT9o+Vx16hW0xsrgXMyDVD9kmXIfXhVfHs3+A/psMGVoNmKAvjmOLwgCj4Nw+wS2+6crO64nZwOoZ0JpfE+hcKTPH5gpdZqhOWkN70Cbiz9nYX+mnmKFCp77vi2lMLlkltPVItrz2q6pIeBvtRMNqJfEIozaehMLytN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mdRQ2dDj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=969/6w1I; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mdRQ2dDj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="969/6w1I"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776674662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CR3zRMsq35/Ix27Ctpd7iIqXcCTs3I7IZYAdTd+rSes=;
	b=mdRQ2dDj2Y4UUPhgSCHsZTSLT0SIFs7VD3VwyRet+T55rPEse9iV5MqOHNwLrlRrmTyzFR
	8A5B09vAGOw2EhnueyLExzQh9d5CGHiZf6kx609dxu876yjiwO790bLEHwxQJhR3ioQ/zR
	LfGI8ziZa1MT93SJm8TA1AX6rrCV6tIIOj9QWjdG6Q27lRdRICJAtE5FOFFUAvCl6dlQKB
	7yj5/jE65ied2lzkaj98HAeXovyKgiGzo5HTI590Dw4endXONfVnJ+94ZJ7uj9tw8Gl33Y
	2y81jkctcQehYBw7kaS9i1OtCp7MfOjNlgjAVf0d/7B9yOa8VdOAqR6zFxCm1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776674662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CR3zRMsq35/Ix27Ctpd7iIqXcCTs3I7IZYAdTd+rSes=;
	b=969/6w1Il11Z7YUr8Y7uCEGOIY5bh1X27+0HSdKFFb6X7kgeGEBHAeRJzb7GgzkboF1+/p
	WTV/lQJjmGT3urAg==
Date: Mon, 20 Apr 2026 10:44:04 +0200
Subject: [PATCH] selftests: harness: Restore order of test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260420-kselftests-harness-order-v1-1-b3c603782ce8@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB2IIQj2KtKFNn+awRJlRooQv
 HtDl9/ivUoGFRg9ukqKr5jspWHoO3rlpbzBEpvJOz+64B1vhk86YadxXrTAjHeNUJ7SGIbkXVg
 jqOWHIsn1X8/P+/4Bs+rOtGoAAAA=
X-Change-ID: 20260420-kselftests-harness-order-9f641f204bde
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 Sun Jian <sun.jian.kdev@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776674656; l=3653;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=P2A2Rcf45sJLVXR7eLOtjU1bbL8BlWrtZfGu65GNP4Y=;
 b=PlAMSYNoac2is8Bwa2BdXhH65ugYd0vS6otzb5SdfcR8xJ6mEv6ndwOIqem5j4jN7zsdxIYor
 sEf2ctfwK7WDuSk1aXQfZ8Hfpivw1Bpxf4MRynSwdvyzsNw0Q2TLywu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The recent addition of explicit constructor orders for fixture tests
broke the ordering of those relative to non-fixture tests and the
reverse-constructor-order detection.

Restore the ordering of the test functions relative to each other by
using the same explicit test order for all test registrations and
__constructor_order_first().

Rename the constant, as it is not specific to TEST_F() anymore.

Fixes: 6be268151426 ("selftests/harness: order TEST_F and XFAIL_ADD constructors")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
The harness selftest flags this issue, but apparently that was not used.
---
 tools/testing/selftests/kselftest_harness.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 75fb016cd190..eaa659acb3b4 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -76,7 +76,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		memset(s, c, n);
 }
 
-#define KSELFTEST_PRIO_TEST_F  20000
+#define KSELFTEST_PRIO_TEST    20000
 #define KSELFTEST_PRIO_XFAIL   20001
 
 #define TEST_TIMEOUT_DEFAULT 30
@@ -194,7 +194,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		  .fixture = &_fixture_global, \
 		  .termsig = _signal, \
 		  .timeout = TEST_TIMEOUT_DEFAULT, }; \
-	static void __attribute__((constructor)) _register_##test_name(void) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) _register_##test_name(void) \
 	{ \
 		__register_test(&_##test_name##_object); \
 	} \
@@ -238,7 +238,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 	FIXTURE_VARIANT(fixture_name); \
 	static struct __fixture_metadata _##fixture_name##_fixture_object = \
 		{ .name =  #fixture_name, }; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
 	_register_##fixture_name##_data(void) \
 	{ \
 		__register_fixture(&_##fixture_name##_fixture_object); \
@@ -364,7 +364,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 		_##fixture_name##_##variant_name##_object = \
 		{ .name = #variant_name, \
 		  .data = &_##fixture_name##_##variant_name##_variant}; \
-	static void __attribute__((constructor)) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST)) \
 		_register_##fixture_name##_##variant_name(void) \
 	{ \
 		__register_fixture_variant(&_##fixture_name##_fixture_object, \
@@ -468,7 +468,7 @@ static inline void __kselftest_memset_safe(void *s, int c, size_t n)
 			fixture_name##_teardown(_metadata, self, variant); \
 	} \
 	static struct __test_metadata *_##fixture_name##_##test_name##_object; \
-	static void __attribute__((constructor(KSELFTEST_PRIO_TEST_F))) \
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
 			_register_##fixture_name##_##test_name(void) \
 	{ \
 		struct __test_metadata *object = mmap(NULL, sizeof(*object), \
@@ -1323,7 +1323,7 @@ static int test_harness_run(int argc, char **argv)
 	return KSFT_FAIL;
 }
 
-static void __attribute__((constructor)) __constructor_order_first(void)
+static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) __constructor_order_first(void)
 {
 	__constructor_order_forward = true;
 }

---
base-commit: c1f49dea2b8f335813d3b348fd39117fb8efb428
change-id: 20260420-kselftests-harness-order-9f641f204bde

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

