Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35A727F017
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 04:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777521747; cv=none; b=ayFoIGlRBI2cgKhokJZRd51WsAlwk59eZESaI1UogS2XjZihIyWr/49JPsSYYvD7rIZnZhqrFKNaLgowLYILr95aagT0NCQIFEu8xiWuU++eyv44LvV8gmuGYqSjtz+Eiy6bZW9TgI65USXE4yLFroU4x/r3L59qpzYriwvCeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777521747; c=relaxed/simple;
	bh=S9qKw++DwaSQqM9CRZbugJWSsqmeGsHl7EmLAtvoLb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TKfYPm/bBtjaQBkjtaJEs11Lyey7nIB9JXRC0R6jfzczWc5d59iWYPtL8T5ewdPYqTdnWvGj9GthwYuyTqss2D39yR7TepTmvZY6WvsCz21SVknXkZ3jEZfZhYtoMbiJNWH9eHdzdXTFIZ5GFk8YpGxmLwuVXL6lRImWtYR/mVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7HbN0wC; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7HbN0wC"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c7963df6f17so293568a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 21:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777521746; x=1778126546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNAWw4AuVFxwgv1L7Dwy/JL7WXpBrh4g95GEue5eO0Y=;
        b=j7HbN0wCpv2lrFWCi10zdBuXJ/9p/36ODxjPdPE2sPZsn0K6zcsp9q9vBtzgduyZ55
         11XmVqQuljwHHCuNRKT0oG3T1mwSk64CIzw8uMRRtiOr2I4saTiKcbll56da47sWhjLh
         Vmy0Xra+4KMC58OcMQxDbKrV4CW9Jo1a7eZVMiE06Jrqz9j0Si8kb4+Rf+CddAIedz3Q
         7t6f2jhf05OrC0pa8x7ubK6R5i2yfz7A3NqQJJYbwqy1loQkhPhrSQCfchBP7/6lfbKb
         eJaCYUPBp8RyrPY/IBNZb0ftbO3CfN7vP3HEihCrdQBQ3JI7JgXOYoNOAk0CJfflbGWf
         tWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777521746; x=1778126546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNAWw4AuVFxwgv1L7Dwy/JL7WXpBrh4g95GEue5eO0Y=;
        b=h7RPAqaicW93XPCab6MPgfhZsxJqDJC7KT4qsI1NE4FgBzTASE4QD7grUJ6/BJtdf1
         YK9FHkBOng6jGOhGLW5fwNT0BcMdb5Zmm94uma4bEwg/qQEUiwBWBUeHCT76d+9GDYL8
         8yrLcKtc1plDYYkRG87McH0OeAui6rIBgpCAWe8q1BG27i2mL12pH0QCSUG2CTpKTEUS
         bOGrP4FUY7L/7FbrdWEmwfQH5OM3/JcFjPEhJiStscqlMbpnfAxTiPTPd1elPKnB+Gug
         7jR7dMY0rAC9So4Cbfk1ZH/lnV/NXInwtv2h9kCs1jyVCB3JpK+ZHTsrAGPGVxMMSFDR
         xLTw==
X-Gm-Message-State: AOJu0Yzf4rDwGLPOXYdgVCySERSiUKzOt1SfC3B9Jn9OsgoTvLepKd3y
	HZIdc9rYOqOwQxxiABi+XQ4XTPf4j2W1yFjvOPSbKedloNRCA10fDExn
X-Gm-Gg: AeBDiesKXT6AW6pwmQCupjpGo57998jZ1yOZBe20h2TukC3/LSMNPTxuIMEvqRZD9BB
	ez4DV7WzgPzWdDvh8LsdDQe4QGSJxAhz9/s4mlapbJuAaHzSQ69fRXPbiMTmoiThFjHiJZDtFnP
	wRoyXttWO8NbWn1H3VyS3oFoEDver5GX/ydAIb70ZAvet84fDc08d6WfeqssjCoEM8XuVs+dyVT
	XWEz+i6EE6qArcj4RpbDA5T6C3Z32xSwuJGLVocqIsu/IWy5i7QqtnZ2/CgV3t0C12qtSg/uo3z
	4rF2/jvrBciF1KPtE0vJJneAiQjMQY2zcX9QcMMCaHrMzel/cJz0eYpgYYDWGZJUrbeNUIXUGMz
	jLa2ngzrglG5Tq6CJ5TE0seeFywEetJ/aR+6gJf2fDd/pS1Fb2CpQJCogJ5LIYiQXopkefxYaNj
	uQG+Ap2l7NuuBfFgh28p1rB41o+gnmLYCVJayvjQyelmOf4+wEygLQXABXwFJfo3DQCv42vu38x
	WZz5BzJ5K2C4EuUOgdoyp0iPLQMItnetv99
X-Received: by 2002:a05:6a21:6da3:b0:3a2:dd7d:b8aa with SMTP id adf61e73a8af0-3a3cf600db2mr1294744637.20.1777521745925;
        Wed, 29 Apr 2026 21:02:25 -0700 (PDT)
Received: from localhost.localdomain ([117.71.53.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6514ec6sm3185142a12.31.2026.04.29.21.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 21:02:25 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Bjoern Doebel <doebel@amazon.de>
Subject: [PATCH v3] selftests/harness: harness-selftest: cover XFAIL_ADD ctor ordering
Date: Thu, 30 Apr 2026 12:02:07 +0800
Message-ID: <20260430040207.296136-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a fixture-based test with a single variant and mark it with
XFAIL_ADD(). The test intentionally fails and is expected to be
accounted as XFAIL, covering the constructor ordering dependency
between TEST_F() registration and XFAIL_ADD() registration.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Bjoern Doebel <doebel@amazon.de>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---

v3:
- Rebase on kselftest/fixes.
- Refresh harness-selftest.expected after commit 465b05bae5ac
  ("selftests: harness: Restore order of test functions").
- Add Tested-by from Bjoern Doebel.

v2:
- update Suggested-by address
- update harness-selftest.expected
- verify with 'make run_tests'

 .../kselftest_harness/harness-selftest.c      | 23 +++++++++++++++++++
 .../harness-selftest.expected                 | 13 +++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.c b/tools/testing/selftests/kselftest_harness/harness-selftest.c
index 3e3033d2745a..93b5a5bbf10a 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.c
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.c
@@ -158,6 +158,29 @@ TEST(test_result_skip) {
 	ksft_test_result_skip("");
 }
 
+FIXTURE(xfail_ctor_ordering) {
+};
+
+FIXTURE_SETUP(xfail_ctor_ordering) {
+}
+
+FIXTURE_TEARDOWN(xfail_ctor_ordering) {
+}
+
+FIXTURE_VARIANT(xfail_ctor_ordering) {
+	int dummy;
+};
+
+FIXTURE_VARIANT_ADD(xfail_ctor_ordering, only) {
+	.dummy = 0,
+};
+
+TEST_F(xfail_ctor_ordering, expected_fail) {
+	ASSERT_EQ(1, 0);
+}
+
+XFAIL_ADD(xfail_ctor_ordering, only, expected_fail);
+
 int main(int argc, char **argv)
 {
 	/*
diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.expected b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
index c0a68ec124f8..f8b7cb2812b6 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.expected
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
@@ -1,6 +1,6 @@
 TAP version 13
-1..19
-# Starting 19 tests from 4 test cases.
+1..20
+# Starting 20 tests from 5 test cases.
 #  RUN           global.standalone_pass ...
 # harness-selftest.c:19:standalone_pass:before
 # harness-selftest.c:23:standalone_pass:after
@@ -93,6 +93,11 @@ ok 18 fixture_parent.pass
 # pass: Test terminated by assertion
 #          FAIL  fixture_setup_failure.pass
 not ok 19 fixture_setup_failure.pass
-# FAILED: 12 / 19 tests passed.
+#  RUN           xfail_ctor_ordering.only.expected_fail ...
+# harness-selftest.c:179:expected_fail:Expected 1 (1) == 0 (0)
+# expected_fail: Test terminated by assertion
+#          FAIL  xfail_ctor_ordering.only.expected_fail
+ok 20 xfail_ctor_ordering.only.expected_fail # XFAIL unknown
+# FAILED: 13 / 20 tests passed.
 # 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
-# Totals: pass:9 fail:7 xfail:1 xpass:1 skip:1 error:0
+# Totals: pass:9 fail:7 xfail:2 xpass:1 skip:1 error:0
-- 
2.43.0

