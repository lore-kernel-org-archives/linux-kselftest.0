Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA57144E046
	for <linux-kselftest@vger.kernel.org>; Wed,  2 Sep 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345202; cv=none; b=KgtKODwdYTayWswYoZlzFWNmuZq/6KBhtxcWkmVy+ZTWF9zVjtLQshexX5esWGcfG7IROAprApk7wCi7YRpScPShn7PMUS7bmp42aTkjrn9JjbhT+8dKAW3fDNbfzf6oAiSEpMB0cMxLHN3eGGtUpIUxVJaxzSguYEiJTy39Sw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345202; c=relaxed/simple;
	bh=mM/ohG8mWKsAdS/PEqLuQl+h/sSLmrqFVt/0/9xC0Kc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E4w9xLzOn9P1lKW1tR/mUg0aCdanc3KB2pTRqUun2316ueD6lANQ9Jj6psQXTrDeCD3b5pa1wK934jJVkB1fzfKnyIv0A39ZDH+Bkmt1GUg4z+loM1BjjOBeP5R4Kd9pyh5iKXTXMzC+petqNCNYrElvC602+UD0cYNr15Qo6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=piuKFThz; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="piuKFThz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Es
	C0qBELCbvlqd4eUKsuSha0UVOzKqDiqLxvN3aRDEY=; b=piuKFThzi3wg3DHPEP
	jGvfimB7GyURJ4SouBf8uqg1r2XeQsPHdxPHbnNdOye+ZJ0szTEa8a301JcpLm6b
	hhLYJgxOquDaBP0HALMJqdiBW10g1rEw2sPAB7kLxEuw99ucxkK4hh12Akir3H6O
	8qhOjhAh/3AnJRqi9kzssh24M=
Received: from ubuntu.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDXPyY3+5dqQ05PAA--.39S2;
	Wed, 02 Sep 2026 18:32:28 +0800 (CST)
From: huhai <15815827059@163.com>
To: brendan.higgins@linux.dev,
	david@davidgow.net,
	raemoar63@gmail.com
Cc: linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	huhai <huhai@kylinos.cn>
Subject: [PATCH] kunit: executor: fix NULL dereference with glob and attribute filters
Date: Wed,  2 Sep 2026 18:32:12 +0800
Message-Id: <20260902103212.295178-1-15815827059@163.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXPyY3+5dqQ05PAA--.39S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4kZw1kZr13KFyrKw48JFb_yoWrWw1fpr
	15GFyjkFW8XF1UXrnxJF10vw13Aan2yF1UuryxAr9YqF43Jw1DAws7K3y7Jw4rWF48Z3Z0
	y3Wvyw17K3WDAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnKsUUUUUU=
X-CM-SenderInfo: rprvmiivyslimvzbiqqrwthudrp/xtbC7x2OFGqX+z3xpQAA3H

From: huhai <huhai@kylinos.cn>

kunit_filter_glob_tests() returns NULL if a suite matches the suite glob
but none of its tests match the test glob. If an attribute filter is also
specified, kunit_filter_suites() passes this NULL pointer to
kunit_filter_attr_tests(), which eventually dereferences it in kmemdup().

This causes a kernel panic with, for example:

  kunit.filter_glob=kunit_executor_test.not_found
  kunit.filter="speed>slow"

  Pid: 1, comm: swapper/0 Not tainted 7.2.0
  RIP: 0033:memcpy_orig+0x1a/0x115
  RSP: 00000000a0803df8  EFLAGS: 00010202
  RAX: 0000000060b3f800 RBX: 0000000000000250 RCX: 0000000060b3f800
  RDX: 0000000000000210 RSI: 0000000000000000 RDI: 0000000060b3f800
  RBP: 0000000000000000 R08: 00000000a0803f4c R09: 000000000000006e
  R10: 0000000060812a11 R11: 747365745f726f01 R12: 00000000a0803f4c
  R13: 0000000000000000 R14: 0000000060812a00 R15: 0000000000000001
  Kernel panic - not syncing: Segfault with no mm
  CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.2.0 #3 VOLUNTARY
  Stack:
   60107348 608013c0 60490e60 6027d5b0
   6026d06a 9f1ffe43 6026cf68 00000000
   3e00000000000001 a0803ee8 a0803f4c 6026a6d1
  Call Trace:
   [<60107348>] ? kmemdup_noprof+0x48/0x60
   [<6027d5b0>] ? glob_match+0x0/0x20
   [<6026d06a>] ? kunit_filter_attr_tests+0x3a/0x2a0
   [<6026cf68>] ? kunit_next_attr_filter+0xb8/0x180
   [<6026a6d1>] ? kunit_filter_suites+0xf1/0x6e0
   [<6027d5b0>] ? glob_match+0x0/0x20
   [<6026aab7>] ? kunit_filter_suites+0x4d7/0x6e0
   [<6026c5f1>] ? kunit_run_all_tests+0xc1/0x330
   [<6000211b>] ? do_one_initcall+0x0/0x203
   [<60002675>] ? kernel_init_freeable+0x2e2/0x365
   [<603359b5>] ? kernel_init+0x33/0x19e
   [<60043435>] ? new_thread_handler+0x45/0x60

Check for a NULL result after glob filtering and skip the suite instead of
passing it to the attribute filters. Add a test for this case.

Fixes: 529534e8cba3 ("kunit: Add ability to filter attributes")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: huhai <huhai@kylinos.cn>
---
 lib/kunit/executor.c      |  2 ++
 lib/kunit/executor_test.c | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index b0f8a41d61d3..8bc2d35078fe 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -226,6 +226,8 @@ kunit_filter_suites(const struct kunit_suite_set *suite_set,
 				*err = PTR_ERR(filtered_suite);
 				goto free_filtered_suite;
 			}
+			if (!filtered_suite)
+				continue;
 		}
 		if (filter_count > 0 && parsed_filters != NULL) {
 			for (k = 0; k < filter_count; k++) {
diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index 4cb119ad8f64..0b8ca3df953e 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -115,6 +115,27 @@ static void filter_suites_to_empty_test(struct kunit *test)
 				"should be empty to indicate no match");
 }
 
+static void filter_suites_glob_and_attr_to_empty_test(struct kunit *test)
+{
+	struct kunit_suite *subsuite[2] = {NULL};
+	struct kunit_suite_set suite_set = {
+		.start = subsuite, .end = &subsuite[1],
+	};
+	struct kunit_suite_set got;
+	char filter[] = "speed>slow";
+	int err = 0;
+
+	subsuite[0] = alloc_fake_suite(test, "suite", dummy_test_cases);
+
+	got = kunit_filter_suites(&suite_set, "suite.not_found", filter, NULL,
+				  &err);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	free_suite_set_at_end(test, &got);
+
+	KUNIT_EXPECT_PTR_EQ_MSG(test, got.start, got.end,
+				"should be empty to indicate no match");
+}
+
 static void parse_filter_attr_test(struct kunit *test)
 {
 	int j, filter_count;
@@ -240,6 +261,7 @@ static struct kunit_case executor_test_cases[] = {
 	KUNIT_CASE(filter_suites_test),
 	KUNIT_CASE(filter_suites_test_glob_test),
 	KUNIT_CASE(filter_suites_to_empty_test),
+	KUNIT_CASE(filter_suites_glob_and_attr_to_empty_test),
 	KUNIT_CASE(parse_filter_attr_test),
 	KUNIT_CASE(filter_attr_test),
 	KUNIT_CASE(filter_attr_empty_test),
-- 
2.40.1

