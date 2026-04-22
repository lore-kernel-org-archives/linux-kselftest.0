Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634E3D3D05;
	Wed, 22 Apr 2026 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861166; cv=none; b=RwAMqwsaGmu1f77oRHz3BbGB/YizJUaMR9CsW+L9Kt2PLCToEWLUK9aeLPlreVmScNicdGSlGRLUDhaW6oWOueqna3WvuYFToB3Y7Wk0k1aisHpG9t5LHPgCM9pQtygpANtkVhu86EZBYX31dHSB6Kx3FHpQGL2wBC1leow/iV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861166; c=relaxed/simple;
	bh=cB8W0FZgv5Yw8+4WT95CemkENL8Nr/69l1Y3SUSQuB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pBIaVaRKNFGBkXVBBSiFTACEorDUkdIYPdRd/sn7/G5YUgNO5PgmIATGjYQzG0SCofJ3Zl8suV7xCmoE6wndajrj6jGAGT/BKhwqoPjDXnM0dEQNzJY3dwQqm7sN/p2NRhLi+d5rardP8bcQIGG6kGUh34H3PjUregMqlbpjrXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vejivFw9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6jdtX7Df; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vejivFw9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6jdtX7Df"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776861162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZdoqKk0vmsYjhBCXxQxA5O+77MXBdHiix81x+MloAEI=;
	b=vejivFw97/LlBx5DR+BqmG0d8RzXy2CbDoJ8OZpP4WrwyWammX1KE48LQwB5KKhXdyjZUI
	fvBikvos/crUOQIuDQnTJCoH6Cl2dhAcZsEjK8WJK8XB6zw1mZpIpAonX9St4u5QpsJicI
	Mhhl03BgpwYeZoERuObbI3OT6EmKXSjfqRr2YwHZ+a6ESRGOVSEb+z8ifA8UwRb2uCGnm0
	Nif4ua0xLw3Txsyeqr0DVeRx/kiyQH2mGQKXJJxIpJ1x6iGXAB0spfIK9+JWMOfh1AHwnh
	+1SGnhU0y0a1h7p17/u31vYg5BYnVUWT3BlMHQyibkH0iLp+4lDM2Fn5m2hNGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776861162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZdoqKk0vmsYjhBCXxQxA5O+77MXBdHiix81x+MloAEI=;
	b=6jdtX7Df13bbr+fUA4cLOiUDNCVddE64TMII1R2npGziYYAh0tMz1Hl9uFw0VOhnTplY1v
	+6w2qLMiLj2AZ9Bg==
Date: Wed, 22 Apr 2026 14:32:33 +0200
Subject: [PATCH v2] selftests: harness: Restore order of test functions
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-kselftests-harness-order-v2-1-93ea980ea3ac@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0K6dkxbCKIr72FY8DOViaQlM5VgS
 O9u5QQu35d87+1KkAlF3YpdMa4kFHwGeyrUMHX+iUBjZmW1rXVlNbwEZxdRosDUsUcRCDwiw9X
 VlXFWV/2IKt8XRkfboX60mSeSGPhzlFbzW/+QrgYM9OVQ6/LS2AGb+0z+HTl42s6506aUvrUXX
 8rEAAAA
X-Change-ID: 20260420-kselftests-harness-order-9f641f204bde
To: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, 
 Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 Sun Jian <sun.jian.kdev@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776861156; l=3911;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cB8W0FZgv5Yw8+4WT95CemkENL8Nr/69l1Y3SUSQuB4=;
 b=bzs0qMSAfwKRksGsMLLdxVj9lVEt4moA8f+mllfExoys2JjvxYPzVgeSHtyuZDJl7fPR/n9UZ
 TebfGT0kqkfCNNZWv7v0JP8HCSAhkuojkSKvwga9zJO3uYE81e2dkrP
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
Reviewed-by: Kees Cook <kees@kernel.org>
---
Changes in v2:
- Pick up review tag from Kees.
- Add missing closing brace in FIXTURE_VARIANT_ADD().
- Link to v1: https://patch.msgid.link/20260420-kselftests-harness-order-v1-1-b3c603782ce8@linutronix.de
---
The harness selftest flags this issue, but apparently that was not used.
---
 tools/testing/selftests/kselftest_harness.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 75fb016cd190..cfdce9cd252e 100644
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
+	static void __attribute__((constructor(KSELFTEST_PRIO_TEST))) \
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

