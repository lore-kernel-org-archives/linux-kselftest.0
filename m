Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F9035E922
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051055; cv=none; b=QHrwj2oxjh5qBMMVQ2KtfFff1CnsOV1lIvbYtiUnUuhgRAB8l7WZ9o59WrcfLg54Hacr2dbpoe/1op4EfhCbENQistNgbfUtCGiU0bg1n2f3a/PPN6WEripPeLzRrcAp62+gA/2uQi+6y0m5TSmRumvXr6UKxJoXRenmFhITNBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051055; c=relaxed/simple;
	bh=usZoaZc9JhFTrkme12KQOYqhRFy3UyVCT0avT8MS0r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMRWT7Q7oMk5Ojoyc1hCocqxmaXXOMWm3i5ziYp3xySQDEEEJkyz576QDm/estJvcyPGzaZBWJJV8ge533m81lNSG4m4xBRlMjy6ahdhq6a+SYxMMsjxBq1pgR4mBZOxYfycaTWlB56DJWjcxq4JAFSL/mUJ5N6jXWsaJl+f6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUaWU65U; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUaWU65U"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca423ad53so10098494d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773051052; x=1773655852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL0iAbhYAa3V6iCG1msuKgFxXPqq5+JAku+R1paZE/I=;
        b=SUaWU65UggGszwVg/+qaQyoWkaGhugUG9iR6NyD13Hjjnjawkp6ZiqEnkpKvedS4k8
         pKT8UGFQUdYQhJXEKDYzq2r2nAbAseRrcpEzpnqViLzvJlg6Vrt5A7+WeGt5G2y4WKgG
         LBxbEIb/OqVqBWwEKCqqXE3J0fVshtrYuu+o12R5tE1TeIWJFwkqc6su0LJA1gBwO6cm
         ma1AlDOhxCc88n7YHY7Ttpdu/EJiik9v9iHlgigpQd4p6rrnLAJHAWTCQcKTsO/6Ps8T
         lOJCPKX7AlIPAG5G7/gBBRhpVtJpuxxGcB30JjVnl8ZchydvyNGtZQnMAQfmiCFXCr2N
         dYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773051052; x=1773655852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CL0iAbhYAa3V6iCG1msuKgFxXPqq5+JAku+R1paZE/I=;
        b=tzmcJ5N2tDMxz18P1hyslNE9j/GF/B0oTie5iRdPx7qiUHHDTubU1LlKb4SBwxELnX
         fkwZbNlLyUXO3/L745m8APOjxuEMe9Z17ZTq88tBwQ95lmqynRm5Db6mNyeS1FpDHJ7w
         63uQBXe51HDJqLWZy9pZW+qSignGMSmQYZ6en1/V9t3UyGVnEeWsUQWg6PuyQ+XLVbCg
         BBXAoGEBB7BBUFPEiO8Z1j8s90pkp4pWDNK5jxYBrWq1inkSD4gA93LfH2jZYTT1JHkK
         WLYLvSq5lGpqSqC+AsXp2siO0yMj0loUKo966aM6Y5qn3Z8BcqQBGcAAuvmwQL8Pk7mL
         tFvA==
X-Gm-Message-State: AOJu0Yx4+uaDD+Qx4Y96yZ26OqjCbF/Hk7REOdGEjb2kGbbKjEkwkb4r
	pNNs8DdaN2iV9RDuhr5ue6oi+ohkOfnafTu3vZk53+XbttbWVx0M96PH
X-Gm-Gg: ATEYQzyKAoSv4f9nzeTL8+qkVMlqUJgwLSz2oJYuv1IuZ8ABSgu5AZSVNfEILTygqxP
	OwRhWTph3/GqTo6NxrhfkmtDiP+S4iZgneEJJsmBgy+dJbbxoiGlXVUdUP49ogexzg49QG1ct15
	oUDt1VIptvyAhalEjqQ1liMgxn5dITP5YcSHqSI+mi82JaUK4ATtKudNAwZ1i2otTsY/lfIG9sd
	MFg6q4t2r77cYMob/2SLk2STSlqmxi53v0YiswERZX6/NRm4c2N5+M5BfwHK8dSfp6Kd8UwcD5y
	TFeDZnaOImGDkZ3GrbYPlcxuCnCv9nVag8uQySusdB9I1DB7xP86jNgTjq5A9K7bzssxm29Goar
	44r/wtnFRz6+PX6BzjGRcXEooopsqHFxRB9UjIK9LPDWOw1KgeFFiMzhYU6fZgxUKLu974+v0xW
	bz1jnk2ViMLHeunBwDNGQWc1N1tZ1Ln9B+C4GHytxZMUqq0AvQcCKiWw0RZHrssX6uKNGmbMnJu
	slDLiGyR0ILUkfy7fqTQprAX/Y=
X-Received: by 2002:a05:690e:2028:b0:649:e4eb:cc66 with SMTP id 956f58d0204a3-64d1427cb3amr7167096d50.41.1773051052269;
        Mon, 09 Mar 2026 03:10:52 -0700 (PDT)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d176d9721sm4446898d50.17.2026.03.09.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:10:51 -0700 (PDT)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2] selftests/harness: harness-selftest: cover XFAIL_ADD ctor ordering
Date: Mon,  9 Mar 2026 18:10:44 +0800
Message-ID: <20260309101044.809074-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
References: <20260309093752.808533-1-sun.jian.kdev@gmail.com>
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
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
v2:
- update Suggested-by address
- update harness-selftest.expected
- verify with 'make run_tests'

 .../kselftest_harness/harness-selftest.c      | 23 ++++++++++
 .../harness-selftest.expected                 | 43 +++++++++++--------
 2 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness/harness-selftest.c b/tools/testing/selftests/kselftest_harness/harness-selftest.c
index 7820bb5d0e6d..9920ef7e4385 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.c
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.c
@@ -118,6 +118,29 @@ TEST_F(fixture_setup_failure, pass) {
 	TH_LOG("after");
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
index 97e1418c1c7e..e0088c9e07b2 100644
--- a/tools/testing/selftests/kselftest_harness/harness-selftest.expected
+++ b/tools/testing/selftests/kselftest_harness/harness-selftest.expected
@@ -1,6 +1,6 @@
 TAP version 13
-1..9
-# Starting 9 tests from 4 test cases.
+1..10
+# Starting 10 tests from 5 test cases.
 #  RUN           global.standalone_pass ...
 # harness-selftest.c:19:standalone_pass:before
 # harness-selftest.c:23:standalone_pass:after
@@ -24,15 +24,12 @@ ok 3 global.signal_pass
 # signal_fail: Test terminated by assertion
 #          FAIL  global.signal_fail
 not ok 4 global.signal_fail
-#  RUN           fixture.pass ...
-# harness-selftest.c:53:pass:setup
-# harness-selftest.c:62:pass:before
-# harness-selftest.c:19:pass:before
-# harness-selftest.c:23:pass:after
-# harness-selftest.c:66:pass:after
-# harness-selftest.c:58:pass:teardown same-process=1
-#            OK  fixture.pass
-ok 5 fixture.pass
+#  RUN           fixture.timeout ...
+# harness-selftest.c:53:timeout:setup
+# harness-selftest.c:77:timeout:before
+# timeout: Test terminated by timeout
+#          FAIL  fixture.timeout
+not ok 5 fixture.timeout
 #  RUN           fixture.fail ...
 # harness-selftest.c:53:fail:setup
 # harness-selftest.c:70:fail:before
@@ -41,12 +38,15 @@ ok 5 fixture.pass
 # fail: Test terminated by assertion
 #          FAIL  fixture.fail
 not ok 6 fixture.fail
-#  RUN           fixture.timeout ...
-# harness-selftest.c:53:timeout:setup
-# harness-selftest.c:77:timeout:before
-# timeout: Test terminated by timeout
-#          FAIL  fixture.timeout
-not ok 7 fixture.timeout
+#  RUN           fixture.pass ...
+# harness-selftest.c:53:pass:setup
+# harness-selftest.c:62:pass:before
+# harness-selftest.c:19:pass:before
+# harness-selftest.c:23:pass:after
+# harness-selftest.c:66:pass:after
+# harness-selftest.c:58:pass:teardown same-process=1
+#            OK  fixture.pass
+ok 7 fixture.pass
 #  RUN           fixture_parent.pass ...
 # harness-selftest.c:87:pass:setup
 # harness-selftest.c:96:pass:before
@@ -60,5 +60,10 @@ ok 8 fixture_parent.pass
 # pass: Test terminated by assertion
 #          FAIL  fixture_setup_failure.pass
 not ok 9 fixture_setup_failure.pass
-# FAILED: 4 / 9 tests passed.
-# Totals: pass:4 fail:5 xfail:0 xpass:0 skip:0 error:0
+#  RUN           xfail_ctor_ordering.only.expected_fail ...
+# harness-selftest.c:139:expected_fail:Expected 1 (1) == 0 (0)
+# expected_fail: Test terminated by assertion
+#          FAIL  xfail_ctor_ordering.only.expected_fail
+ok 10 xfail_ctor_ordering.only.expected_fail # XFAIL unknown
+# FAILED: 5 / 10 tests passed.
+# Totals: pass:4 fail:5 xfail:1 xpass:0 skip:0 error:0

base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

