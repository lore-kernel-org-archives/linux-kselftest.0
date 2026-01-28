Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51C2E9ED8;
	Wed, 28 Jan 2026 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595880; cv=none; b=ED3AC+LnRy5Zz+8sr6n3iCT7YfvKzfkNozDKHf8Fcfxy/kKTZU5t8+u5PYbvJiprPUlkyI5QOtXLnGPBqZbT3JPlfdmTFTuwx0MPCmo1Sk9W/P2B2AzG38pH3ferDc/+ThwUZu6hPIMKfOGKjGxUJyqXHehCVQfkVqiXwZuiSQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595880; c=relaxed/simple;
	bh=HRNu4z8w8EZPbzRq85FQ5ZWuqXq4wsKth+f/gjHccvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tX2YtTO++QcVoe6OtvCnMf623rY5dGZ2q5EPEVdoqlkSwx2iX2Dd72Zv1gjAEInVvkLkNSPMeejLlf3z5cU9amR3ES/gdRuofLXA7R0Yl1DBalW4/kXJSZHxIUvo9CBZx8Okx8DWZCRnjMOC4Gld4pYXf/7PZF3WRcdLuErEX24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ncQGpBOW; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=736+CxVq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ncQGpBOW";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="736+CxVq"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769595877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JppsLuxHY2cBj9oDPbgokEIBtBEhc7Ey8FlaBKNqWlA=;
	b=ncQGpBOWkSOJFF2CQAnYaWHyUHrInWGPR36H2rN+YSC9D8agFw5MS31uJ9mIjlEA85eMH/
	6Cguv51aJQQ0+izGiNMEAjXBbiPrLS3Z5xkyGkrXGEBZOoELLMGNfg6SWaP6TCj9EevR4w
	YDXdKakEui7C+vpAO8DcWX7+PljHEqjgDGzyKFao9O5WC7Z/doXPv1muziJZBweaWvQUPN
	I/J4ZAGMrKQf4G8Qf3ImO+uGR4SX1OCA+SJWoE1QsMYFE5CaOKeZS6uCaggHjlFs241EKy
	qt4pXhbH5H0FCRV16gFJUmDxtItYGh8LeA2BDdkXYvXOB0ahs4+RUYC+qNXsvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769595877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JppsLuxHY2cBj9oDPbgokEIBtBEhc7Ey8FlaBKNqWlA=;
	b=736+CxVqmTMnOgHidwPS9ygOv2Xd0Pcz92WkctgEDc/NHwuwDZTueD+zXQVKFIxKp+7Hmd
	ZuOzZdxxcdx6BzAA==
Date: Wed, 28 Jan 2026 11:24:34 +0100
Subject: [PATCH 2/5] selftests: harness: Validate that explicit kselftest
 exitcodes are handled
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-kselftest-harness-v1-2-cb259fa81cd0@linutronix.de>
References: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
In-Reply-To: <20260128-kselftest-harness-v1-0-cb259fa81cd0@linutronix.de>
To: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
 Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769595876; l=4235;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HRNu4z8w8EZPbzRq85FQ5ZWuqXq4wsKth+f/gjHccvs=;
 b=9su08gX4c9r5oNm46sQk8RYSMJIi+o4ZytFAZH3fZ8Ha9PmVTEpCFKzw0veAGy6FfO+mEQ9va
 nOueV4tkvhWAID+S2XxuUEVo02XRCjp498KSezdxawMsdQF7LIWC3/f
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The test programs can directly call exit with one of the KSFT_* constants.

Add tests for this functionality.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 .../selftests/kselftest_harness/harness-selftest.c | 20 +++++++++++++
 .../kselftest_harness/harness-selftest.expected    | 35 ++++++++++++++++------
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.c b/tools/testing/selftests/kselftest_harness/harness-selftest.c
index 7820bb5d0e6d..f109a21ed6f7 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.c
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.c
@@ -118,6 +118,26 @@ TEST_F(fixture_setup_failure, pass) {
 	TH_LOG("after");
 }
 
+TEST(exit_pass) {
+	exit(KSFT_PASS);
+}
+
+TEST(exit_xpass) {
+	exit(KSFT_XPASS);
+}
+
+TEST(exit_fail) {
+	exit(KSFT_FAIL);
+}
+
+TEST(exit_xfail) {
+	exit(KSFT_XFAIL);
+}
+
+TEST(exit_skip) {
+	exit(KSFT_SKIP);
+}
+
 int main(int argc, char **argv)
 {
 	/*
diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.expected b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
index 97e1418c1c7e..da7febc11e10 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.expected
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
@@ -1,6 +1,6 @@
 TAP version 13
-1..9
-# Starting 9 tests from 4 test cases.
+1..14
+# Starting 14 tests from 4 test cases.
 #  RUN           global.standalone_pass ...
 # harness-selftest.c:19:standalone_pass:before
 # harness-selftest.c:23:standalone_pass:after
@@ -24,6 +24,22 @@ ok 3 global.signal_pass
 # signal_fail: Test terminated by assertion
 #          FAIL  global.signal_fail
 not ok 4 global.signal_fail
+#  RUN           global.exit_pass ...
+#            OK  global.exit_pass
+ok 5 global.exit_pass
+#  RUN           global.exit_xpass ...
+#            OK  global.exit_xpass
+ok 6 global.exit_xpass # XPASS unknown
+#  RUN           global.exit_fail ...
+# exit_fail: Test failed
+#          FAIL  global.exit_fail
+not ok 7 global.exit_fail
+#  RUN           global.exit_xfail ...
+#            OK  global.exit_xfail
+ok 8 global.exit_xfail # XFAIL unknown
+#  RUN           global.exit_skip ...
+#            OK  global.exit_skip
+ok 9 global.exit_skip # SKIP unknown
 #  RUN           fixture.pass ...
 # harness-selftest.c:53:pass:setup
 # harness-selftest.c:62:pass:before
@@ -32,7 +48,7 @@ not ok 4 global.signal_fail
 # harness-selftest.c:66:pass:after
 # harness-selftest.c:58:pass:teardown same-process=1
 #            OK  fixture.pass
-ok 5 fixture.pass
+ok 10 fixture.pass
 #  RUN           fixture.fail ...
 # harness-selftest.c:53:fail:setup
 # harness-selftest.c:70:fail:before
@@ -40,25 +56,26 @@ ok 5 fixture.pass
 # harness-selftest.c:58:fail:teardown same-process=1
 # fail: Test terminated by assertion
 #          FAIL  fixture.fail
-not ok 6 fixture.fail
+not ok 11 fixture.fail
 #  RUN           fixture.timeout ...
 # harness-selftest.c:53:timeout:setup
 # harness-selftest.c:77:timeout:before
 # timeout: Test terminated by timeout
 #          FAIL  fixture.timeout
-not ok 7 fixture.timeout
+not ok 12 fixture.timeout
 #  RUN           fixture_parent.pass ...
 # harness-selftest.c:87:pass:setup
 # harness-selftest.c:96:pass:before
 # harness-selftest.c:98:pass:after
 # harness-selftest.c:92:pass:teardown same-process=0
 #            OK  fixture_parent.pass
-ok 8 fixture_parent.pass
+ok 13 fixture_parent.pass
 #  RUN           fixture_setup_failure.pass ...
 # harness-selftest.c:106:pass:setup
 # harness-selftest.c:108:pass:Expected 0 (0) == 1 (1)
 # pass: Test terminated by assertion
 #          FAIL  fixture_setup_failure.pass
-not ok 9 fixture_setup_failure.pass
-# FAILED: 4 / 9 tests passed.
-# Totals: pass:4 fail:5 xfail:0 xpass:0 skip:0 error:0
+not ok 14 fixture_setup_failure.pass
+# FAILED: 8 / 14 tests passed.
+# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
+# Totals: pass:5 fail:6 xfail:1 xpass:1 skip:1 error:0

-- 
2.52.0

