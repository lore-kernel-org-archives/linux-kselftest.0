Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B864C2FE05B;
	Wed, 28 Jan 2026 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595882; cv=none; b=hNCRuXpE8nQYpvfyBbj5dLA6Lc6bsZM4w96kwn2+KTlI0IG/gnJzeLlDNp6HQ6f8E6zge/znylRIgVoN3WFScb+UA1dHsF+OGz3annH/AmJqdDysw+aiW+te8TunvRwV2maJr2i98Wu5KYO78Wj7QD3hgYtI7O5nDu1rq7JNrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595882; c=relaxed/simple;
	bh=CpItbGuqViNDVOKjF5OYL74vl8pZDCV7rH9gUThemMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R757WFLaSd8M3IpDQ51zD8SyTICMmcW13ClFLMvy0iy2+W/9rY9L82NTlNXV5UAD6gtfdc646FIoksxEo42QLY8zFQQIG+S83IDunyjq/zIZ+OHpuq4U0o+fcsY+8bjBOhqbsWtaQ4XrYml1q1mGn6Q/HPcQbtRIujktav82pcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XNGRnSh0; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YYQLmdP5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XNGRnSh0";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YYQLmdP5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0+KrQzgL1kAPuD4kd5PpMOSsltIHrny4Tn1/dEXzlk=;
	b=XNGRnSh0+7+hKsYV8RTaJPf5GgNjVGA4Z6VkjilJ7rOgaW9WKRvxkahGfn0bukv+L6/nx6
	iA7t22HOm/GhQ7MSXzJUsuTlkmRBloJ1s2BotcbUF8VSmjKLTHoRt9QMC9VPsTaVbAuGlj
	GL+2gQl86xbA0eP/xf64Cr7t/NSyAVOj18kH5YUXp/Fj4mGJAhEZpXcDtjTqmB4XTdb1gP
	z+FbZZpTtEMOMJSSkIauLd8wYGe6GM3LMhzg6lok8saui0Gxyjkcgx5+lRqQm6mm8KKf6n
	BrixNb1dzJPezdFKc6TPEu0QRBfApqmXenHYVdLx7YVdplhxFeg1eRophgTFQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0+KrQzgL1kAPuD4kd5PpMOSsltIHrny4Tn1/dEXzlk=;
	b=YYQLmdP5xh+dydSzykG9unsL61UJrmRSxf2mENSrKE6rtgmJmc0CNEXWcJNUHq+hUlLctk
	hOKhXiuzsGRwJADQ==
Date: Wed, 28 Jan 2026 11:24:37 +0100
Subject: [PATCH 5/5] selftests: harness: Validate intermixing of kselftest
 and harness functionality
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-harness-v1-5-cb259fa81cd0@linutronix.de>
References: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
In-Reply-To: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=4451;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CpItbGuqViNDVOKjF5OYL74vl8pZDCV7rH9gUThemMI=;
 b=FiNajDX/RN+zC3U5VW/VM8RA3z9ZFUACWJt5ru4l6Fo2la6ViiQjAiD3QL6azARVMQT3sFoYG
 ojSX2rwIDYkC2SNj2nZchalzUI3T7ru8kZAQiRe8Hn7wDolIcAOL3zW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Make sure that calling ksft_test_result_*() functions from harness
tests work as expected.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../selftests/kselftest_harness/harness-selftest.c | 20 +++++++++++++
 .../kselftest_harness/harness-selftest.expected    | 35 ++++++++++++++++------
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.c b/tools/testing/selftests/kselftest_harness/harness-selftest.c
index f109a21ed6f7..3e3033d2745a 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.c
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.c
@@ -138,6 +138,26 @@ TEST(exit_skip) {
 	exit(KSFT_SKIP);
 }
 
+TEST(test_result_pass) {
+	ksft_test_result_pass("");
+}
+
+TEST(test_result_xpass) {
+	ksft_test_result_xpass("");
+}
+
+TEST(test_result_fail) {
+	ksft_test_result_fail("");
+}
+
+TEST(test_result_xfail) {
+	ksft_test_result_xfail("");
+}
+
+TEST(test_result_skip) {
+	ksft_test_result_skip("");
+}
+
 int main(int argc, char **argv)
 {
 	/*
diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.expected b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
index da7febc11e10..c0a68ec124f8 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.expected
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
@@ -1,6 +1,6 @@
 TAP version 13
-1..14
-# Starting 14 tests from 4 test cases.
+1..19
+# Starting 19 tests from 4 test cases.
 #  RUN           global.standalone_pass ...
 # harness-selftest.c:19:standalone_pass:before
 # harness-selftest.c:23:standalone_pass:after
@@ -40,6 +40,23 @@ ok 8 global.exit_xfail # XFAIL unknown
 #  RUN           global.exit_skip ...
 #            OK  global.exit_skip
 ok 9 global.exit_skip # SKIP unknown
+#  RUN           global.test_result_pass ...
+#            OK  global.test_result_pass
+ok 10 global.test_result_pass
+#  RUN           global.test_result_xpass ...
+#            OK  global.test_result_xpass
+ok 11 global.test_result_xpass
+#  RUN           global.test_result_fail ...
+not ok 1 # Illegal usage of low-level ksft APIs in harness test
+# test_result_fail: Test failed
+#          FAIL  global.test_result_fail
+not ok 12 global.test_result_fail
+#  RUN           global.test_result_xfail ...
+#            OK  global.test_result_xfail
+ok 13 global.test_result_xfail
+#  RUN           global.test_result_skip ...
+#            OK  global.test_result_skip
+ok 14 global.test_result_skip
 #  RUN           fixture.pass ...
 # harness-selftest.c:53:pass:setup
 # harness-selftest.c:62:pass:before
@@ -48,7 +65,7 @@ ok 9 global.exit_skip # SKIP unknown
 # harness-selftest.c:66:pass:after
 # harness-selftest.c:58:pass:teardown same-process=1
 #            OK  fixture.pass
-ok 10 fixture.pass
+ok 15 fixture.pass
 #  RUN           fixture.fail ...
 # harness-selftest.c:53:fail:setup
 # harness-selftest.c:70:fail:before
@@ -56,26 +73,26 @@ ok 10 fixture.pass
 # harness-selftest.c:58:fail:teardown same-process=1
 # fail: Test terminated by assertion
 #          FAIL  fixture.fail
-not ok 11 fixture.fail
+not ok 16 fixture.fail
 #  RUN           fixture.timeout ...
 # harness-selftest.c:53:timeout:setup
 # harness-selftest.c:77:timeout:before
 # timeout: Test terminated by timeout
 #          FAIL  fixture.timeout
-not ok 12 fixture.timeout
+not ok 17 fixture.timeout
 #  RUN           fixture_parent.pass ...
 # harness-selftest.c:87:pass:setup
 # harness-selftest.c:96:pass:before
 # harness-selftest.c:98:pass:after
 # harness-selftest.c:92:pass:teardown same-process=0
 #            OK  fixture_parent.pass
-ok 13 fixture_parent.pass
+ok 18 fixture_parent.pass
 #  RUN           fixture_setup_failure.pass ...
 # harness-selftest.c:106:pass:setup
 # harness-selftest.c:108:pass:Expected 0 (0) == 1 (1)
 # pass: Test terminated by assertion
 #          FAIL  fixture_setup_failure.pass
-not ok 14 fixture_setup_failure.pass
-# FAILED: 8 / 14 tests passed.
+not ok 19 fixture_setup_failure.pass
+# FAILED: 12 / 19 tests passed.
 # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
-# Totals: pass:5 fail:6 xfail:1 xpass:1 skip:1 error:0
+# Totals: pass:9 fail:7 xfail:1 xpass:1 skip:1 error:0

-- 
2.52.0

