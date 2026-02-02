Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C682DB7A1;
	Mon,  2 Feb 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025752; cv=none; b=aSKGmfMVAy6sXFzerJDAWIxjeL4Ok/QHNtlD/EqWfYW6g+6+FItjiLHGbgaIxpvwfOmevk0KjyBOMEIbZJXitzzBClw4Qh8AncLtFq3l46WHKCUHS8zvQRNZN8mH8Q+8WprbgAd+PC20XB7XFOvFx4XB/QvdLh6VJldD7tKw8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025752; c=relaxed/simple;
	bh=aYe3i0EfcBZ6grZLsHJKBii1M1wU0Ev8hNRdJlLE2gU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QIQmSV4CS5fSBUfKCvpckojMhZ7kJLqRcn0bFq4Cn/Ybot1hWFufa5Im7EMY4SP3EyyInutstfOnH0/YdhlR9Ktql9UyZt2vxJaWmMKiwzJbovopLb0bCucJccbcgY6gWcUhVgfYwEw7wFIAlXgBEJIrBcSGYiVYJKGks5Evy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVwALT4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVwALT4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FF7C116C6;
	Mon,  2 Feb 2026 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770025752;
	bh=aYe3i0EfcBZ6grZLsHJKBii1M1wU0Ev8hNRdJlLE2gU=;
	h=From:To:Cc:Subject:Date:From;
	b=fVwALT4W31C7PNoe1QObREnEh3uibuJfsGrqc92ZqYlJJgwZiceotgUSEYrT7TLHR
	 P7uIw3X2VDWWPq9U648hpoQvy0L5Xxu7049CDNjXOItAIW9vh+eNZDNHizmDx13gzV
	 P2QwYZ1OOrFP1UFkmV8n5HVIsHBm9Ks6VtLQBaHCrZ4UamVDtiNiMpNvmikAtBSZ9n
	 AjYMYnTnSqWXhprH3/FubT+sF199K5YKhiJKWa8r93TnbKrOlGxtmsW2fx0RgJt6py
	 V3JEiJAFkS3cpx/uJKDf4MPa4tKTs/0gLauQN6XGy54P/cy7UTdRIzz+6Pn91S8FIk
	 m4ZQwDGQbEfUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Carlos Llamas <cmllamas@google.com>,
	Rae Moar <raemoar63@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marie Zhussupova <marievic@google.com>,
	Ujwal Jain <ujwaljain@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] kunit: reduce stack usage in kunit_run_tests()
Date: Mon,  2 Feb 2026 10:48:53 +0100
Message-Id: <20260202094903.1232201-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Some of the recent changes to the kunit framework caused the stack usage
for kunit_run_tests() to grow higher than most other kernel functions,
which triggers a warning when CONFIG_FRAME_WARN is set to a relatively
low value:

lib/kunit/test.c: In function 'kunit_run_tests':
lib/kunit/test.c:801:1: error: the frame size of 1312 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Split out the inner loop into a separate function to ensure that each
function remains under the limit, and pass the kunit_result_stats
structures by reference to avoid excessive copies.

Cc: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
 - plit out two functions instead of one, as there were still
   stack size warnings with clang on the earlier version
 - use void return type suggested by Carlos

Carlos has successfully tested version 1, but after I rebased on
current linux-next, the build warnings came back due to some other
changes, and I had to rework the patch.
---
 lib/kunit/test.c | 230 +++++++++++++++++++++++++----------------------
 1 file changed, 124 insertions(+), 106 deletions(-)

diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 62eb529824c6..8668ed8d4553 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -94,7 +94,7 @@ struct kunit_result_stats {
 	unsigned long total;
 };
 
-static bool kunit_should_print_stats(struct kunit_result_stats stats)
+static bool kunit_should_print_stats(struct kunit_result_stats *stats)
 {
 	if (kunit_stats_enabled == 0)
 		return false;
@@ -102,11 +102,11 @@ static bool kunit_should_print_stats(struct kunit_result_stats stats)
 	if (kunit_stats_enabled == 2)
 		return true;
 
-	return (stats.total > 1);
+	return (stats->total > 1);
 }
 
 static void kunit_print_test_stats(struct kunit *test,
-				   struct kunit_result_stats stats)
+				   struct kunit_result_stats *stats)
 {
 	if (!kunit_should_print_stats(stats))
 		return;
@@ -115,10 +115,10 @@ static void kunit_print_test_stats(struct kunit *test,
 		  KUNIT_SUBTEST_INDENT
 		  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
 		  test->name,
-		  stats.passed,
-		  stats.failed,
-		  stats.skipped,
-		  stats.total);
+		  stats->passed,
+		  stats->failed,
+		  stats->skipped,
+		  stats->total);
 }
 
 /* Append formatted message to log. */
@@ -600,26 +600,26 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
 }
 
 static void kunit_print_suite_stats(struct kunit_suite *suite,
-				    struct kunit_result_stats suite_stats,
-				    struct kunit_result_stats param_stats)
+				    struct kunit_result_stats *suite_stats,
+				    struct kunit_result_stats *param_stats)
 {
 	if (kunit_should_print_stats(suite_stats)) {
 		kunit_log(KERN_INFO, suite,
 			  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
 			  suite->name,
-			  suite_stats.passed,
-			  suite_stats.failed,
-			  suite_stats.skipped,
-			  suite_stats.total);
+			  suite_stats->passed,
+			  suite_stats->failed,
+			  suite_stats->skipped,
+			  suite_stats->total);
 	}
 
 	if (kunit_should_print_stats(param_stats)) {
 		kunit_log(KERN_INFO, suite,
 			  "# Totals: pass:%lu fail:%lu skip:%lu total:%lu",
-			  param_stats.passed,
-			  param_stats.failed,
-			  param_stats.skipped,
-			  param_stats.total);
+			  param_stats->passed,
+			  param_stats->failed,
+			  param_stats->skipped,
+			  param_stats->total);
 	}
 }
 
@@ -681,13 +681,115 @@ static void kunit_init_parent_param_test(struct kunit_case *test_case, struct ku
 	}
 }
 
-int kunit_run_tests(struct kunit_suite *suite)
+static noinline_for_stack void
+kunit_run_param_test(struct kunit_suite *suite, struct kunit_case *test_case,
+		     struct kunit *test,
+		     struct kunit_result_stats *suite_stats,
+		     struct kunit_result_stats *total_stats,
+		     struct kunit_result_stats *param_stats)
 {
 	char param_desc[KUNIT_PARAM_DESC_SIZE];
+	const void *curr_param;
+	kunit_init_parent_param_test(test_case, test);
+	if (test_case->status == KUNIT_FAILURE) {
+		kunit_update_stats(param_stats, test->status);
+		return;
+	}
+	/* Get initial param. */
+	param_desc[0] = '\0';
+	/* TODO: Make generate_params try-catch */
+	curr_param = test_case->generate_params(test, NULL, param_desc);
+	test_case->status = KUNIT_SKIPPED;
+	kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
+		  "KTAP version 1\n");
+	kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
+		  "# Subtest: %s", test_case->name);
+	if (test->params_array.params &&
+	    test_case->generate_params == kunit_array_gen_params) {
+		kunit_log(KERN_INFO, test, KUNIT_SUBTEST_INDENT
+			  KUNIT_SUBTEST_INDENT "1..%zd\n",
+			  test->params_array.num_params);
+	}
+
+	while (curr_param) {
+		struct kunit param_test = {
+			.param_value = curr_param,
+			.param_index = ++test->param_index,
+			.parent = test,
+		};
+		kunit_init_test(&param_test, test_case->name, NULL);
+		param_test.log = test_case->log;
+		kunit_run_case_catch_errors(suite, test_case, &param_test);
+
+		if (param_desc[0] == '\0') {
+			snprintf(param_desc, sizeof(param_desc),
+				 "param-%d", param_test.param_index);
+		}
+
+		kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
+				      param_test.status,
+				      param_test.param_index,
+				      param_desc,
+				      param_test.status_comment);
+
+		kunit_update_stats(param_stats, param_test.status);
+
+		/* Get next param. */
+		param_desc[0] = '\0';
+		curr_param = test_case->generate_params(test, curr_param,
+							param_desc);
+	}
+	/*
+	 * TODO: Put into a try catch. Since we don't need suite->exit
+	 * for it we can't reuse kunit_try_run_cleanup for this yet.
+	 */
+	if (test_case->param_exit)
+		test_case->param_exit(test);
+	/* TODO: Put this kunit_cleanup into a try-catch. */
+	kunit_cleanup(test);
+}
+
+static noinline_for_stack void
+kunit_run_one_test(struct kunit_suite *suite, struct kunit_case *test_case,
+		   struct kunit_result_stats *suite_stats,
+		   struct kunit_result_stats *total_stats)
+{
+	struct kunit test = { .param_value = NULL, .param_index = 0 };
+	struct kunit_result_stats param_stats = { 0 };
+
+	kunit_init_test(&test, test_case->name, test_case->log);
+	if (test_case->status == KUNIT_SKIPPED) {
+		/* Test marked as skip */
+		test.status = KUNIT_SKIPPED;
+		kunit_update_stats(&param_stats, test.status);
+	} else if (!test_case->generate_params) {
+		/* Non-parameterised test. */
+		test_case->status = KUNIT_SKIPPED;
+		kunit_run_case_catch_errors(suite, test_case, &test);
+		kunit_update_stats(&param_stats, test.status);
+	} else {
+		kunit_run_param_test(suite, test_case, &test, suite_stats,
+				     total_stats, &param_stats);
+	}
+	kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
+
+	kunit_print_test_stats(&test, &param_stats);
+
+	kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
+			      kunit_test_case_num(suite, test_case),
+			      test_case->name,
+			      test.status_comment);
+
+	kunit_update_stats(suite_stats, test_case->status);
+	kunit_accumulate_stats(total_stats, param_stats);
+}
+
+
+int kunit_run_tests(struct kunit_suite *suite)
+{
 	struct kunit_case *test_case;
 	struct kunit_result_stats suite_stats = { 0 };
 	struct kunit_result_stats total_stats = { 0 };
-	const void *curr_param;
 
 	/* Taint the kernel so we know we've run tests. */
 	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
@@ -703,97 +805,13 @@ int kunit_run_tests(struct kunit_suite *suite)
 
 	kunit_print_suite_start(suite);
 
-	kunit_suite_for_each_test_case(suite, test_case) {
-		struct kunit test = { .param_value = NULL, .param_index = 0 };
-		struct kunit_result_stats param_stats = { 0 };
-
-		kunit_init_test(&test, test_case->name, test_case->log);
-		if (test_case->status == KUNIT_SKIPPED) {
-			/* Test marked as skip */
-			test.status = KUNIT_SKIPPED;
-			kunit_update_stats(&param_stats, test.status);
-		} else if (!test_case->generate_params) {
-			/* Non-parameterised test. */
-			test_case->status = KUNIT_SKIPPED;
-			kunit_run_case_catch_errors(suite, test_case, &test);
-			kunit_update_stats(&param_stats, test.status);
-		} else {
-			kunit_init_parent_param_test(test_case, &test);
-			if (test_case->status == KUNIT_FAILURE) {
-				kunit_update_stats(&param_stats, test.status);
-				goto test_case_end;
-			}
-			/* Get initial param. */
-			param_desc[0] = '\0';
-			/* TODO: Make generate_params try-catch */
-			curr_param = test_case->generate_params(&test, NULL, param_desc);
-			test_case->status = KUNIT_SKIPPED;
-			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
-				  "KTAP version 1\n");
-			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
-				  "# Subtest: %s", test_case->name);
-			if (test.params_array.params &&
-			    test_case->generate_params == kunit_array_gen_params) {
-				kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT
-					  KUNIT_SUBTEST_INDENT "1..%zd\n",
-					  test.params_array.num_params);
-			}
-
-			while (curr_param) {
-				struct kunit param_test = {
-					.param_value = curr_param,
-					.param_index = ++test.param_index,
-					.parent = &test,
-				};
-				kunit_init_test(&param_test, test_case->name, NULL);
-				param_test.log = test_case->log;
-				kunit_run_case_catch_errors(suite, test_case, &param_test);
-
-				if (param_desc[0] == '\0') {
-					snprintf(param_desc, sizeof(param_desc),
-						 "param-%d", param_test.param_index);
-				}
-
-				kunit_print_ok_not_ok(&param_test, KUNIT_LEVEL_CASE_PARAM,
-						      param_test.status,
-						      param_test.param_index,
-						      param_desc,
-						      param_test.status_comment);
-
-				kunit_update_stats(&param_stats, param_test.status);
-
-				/* Get next param. */
-				param_desc[0] = '\0';
-				curr_param = test_case->generate_params(&test, curr_param,
-									param_desc);
-			}
-			/*
-			 * TODO: Put into a try catch. Since we don't need suite->exit
-			 * for it we can't reuse kunit_try_run_cleanup for this yet.
-			 */
-			if (test_case->param_exit)
-				test_case->param_exit(&test);
-			/* TODO: Put this kunit_cleanup into a try-catch. */
-			kunit_cleanup(&test);
-		}
-test_case_end:
-		kunit_print_attr((void *)test_case, true, KUNIT_LEVEL_CASE);
-
-		kunit_print_test_stats(&test, param_stats);
-
-		kunit_print_ok_not_ok(&test, KUNIT_LEVEL_CASE, test_case->status,
-				      kunit_test_case_num(suite, test_case),
-				      test_case->name,
-				      test.status_comment);
-
-		kunit_update_stats(&suite_stats, test_case->status);
-		kunit_accumulate_stats(&total_stats, param_stats);
-	}
+	kunit_suite_for_each_test_case(suite, test_case)
+		kunit_run_one_test(suite, test_case, &suite_stats, &total_stats);
 
 	if (suite->suite_exit)
 		suite->suite_exit(suite);
 
-	kunit_print_suite_stats(suite, suite_stats, total_stats);
+	kunit_print_suite_stats(suite, &suite_stats, &total_stats);
 suite_end:
 	kunit_print_suite_end(suite);
 
-- 
2.39.5

