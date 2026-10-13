Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3494B203D
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 10:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886952; cv=none; b=mtTsDRFp/09uRM2zTJItZL+HxGPsSE1mKNySDmXXNAmHhpLooT3bXb0GL332uEVDA+sI9fThmZzwrVBFLXRxlyowdX55RGAs7zxjOIEu+TpGl+Rqv+WdcgpGAAc8JmkQ4D79kFMhULUSKH5QIGY8tRAGQVdrR7QU14oDEMZX0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886952; c=relaxed/simple;
	bh=YksWpFnXopwyl0GA9r6k3J7Ba5+eH89Y4Cf4TR7lbDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AOYcyCECBlQK6dpOAhTyv1NtDMq3SDKZqK5YO+hY0QvSvQlKKGiet/Ci5+guVrX6Pd93Gq5B595J0MYFYrJC3KAtbjvtGbEt9ZXikL+pS/htZs7xUUkNOJbKTHo20xocOIqH9pH+zuV/I2Z3U50NQss6cVTYTGVN2QMWHPemcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OxDBswgj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OxDBswgj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so353388866b.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886949; x=1792491749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJ++bhJiH0xJ/lCRUXOsssknMCsC9h0Cz3zSabf+zyY=;
        b=OxDBswgjgiWj+6HZkkTnALlgNxDIncxbhpy+2hHXO+rA6d7sNrpT7+ErAffSJsESc0
         TDaSzF9cBWXdYU+oaONg8R2/Bj5plQW50nq8REA+MXq21H8FkCchQydeI63gI/rPW/SS
         XlkcoereRACtSec7Bo6DxatxS4089EZa7m9u/GQ9PymIaWRbcZmiQZrZZV2FyiZ92l2c
         UAzhwjUe05gP6YN5rsuueb/vL69iUTrCJsNkcs9OGlcae8+sYMApOY2UZCFTSvQQmL5X
         HwZG5XZ3YV6o2OLk0nYD1tCd6CmP6Fe4DYKyip+JUcADB1milBmGXkxocLLiw6Qle34S
         H57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886949; x=1792491749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ++bhJiH0xJ/lCRUXOsssknMCsC9h0Cz3zSabf+zyY=;
        b=x9TTCgPuWaz98fhPSDhS+/5PbgRlNgJmqKtRluk03UOkWBc6oDi6okWcbLgFXOwAA7
         vwjPdFOPjg94LOw38zrVpq7MHdxea2vMEh/YK3A4pBAwJoYR2y8ZhyQbMsl86xfFZ3Pu
         FTWGWzSklDCzxmNz0ADmQ58IW2nl+c7L62jp/MkLNqi3wyTigU5Mi3PoXM9uMjYf2nW4
         Il+VTQOFe3To7eCkBVpXon/+PMkQBdDFSbs47/kBWjMMqWQP5ASTRlkrPYZ7Q2E/lB/O
         SO4HZrktjzAPlZWr1wNJGAZXgazusa692NvoBjQgV5KlfX+1iqs13HmN8RG4CxwpWNg+
         6liw==
X-Gm-Message-State: AFq9FYKFdMlksAYGVmSoPpDa0o37ROVYRkKcY3ej0TVCrBSjG3cG2QE4
	tHxnRhLJKZPp4XDziDmZd/Aa2xDspqzt6PzDyB7Dn6h3OxDszURhJf7H
X-Gm-Gg: AYBFou2heIIU0rWqyoO0c+wbPHfzDlZTbeZ4RmsTk51c5qaubEF1ZH1asO4DUEbt24D
	5lbVWTXmSM6huiOR/KDrqLV5HpQLcfceLkwgUEWdcowfy7hPXh9b2AN1hBCTex3godZDdriiYFF
	yCIPs29C19s9q4ofRuLTNWituvjDVCYDMEsw5QduXJPkg/PVQ3cfZeAFS0waTSchRxV6ruV7l3M
	aJC+CeVqShhDdrM7OHNmYmDHRM5h/ViTWHaHbkglexCq5gfiZ13f78d0ZAXicFk99w5FF1Tuwjk
	7oWXOJGGxe2HqItW3SgRdIZ0nUo5jabWPktnG9YlBoCa5rXv4hOZnfHAVulS2FO9OKDnycfSAlw
	IFKatl4sZIGhltNO8dqXbziw6cwv54xAm2JjULR2MEPhpkSr2If2cQgpvht5Ny7KIdY9rEzJwWS
	+q7CZBnMVMdqB+V6gaQkU1bS3ZyUhjTFi4Z1Jf1TEuYAyawyEI4Xe/HurF+JMWHLjwrxascJXq1
	56gC1mpZ3aPZ1gQZUcG6reuzhLVO+A2Cg==
X-Received: by 2002:a17:907:72ca:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c31a9fec198mr1483784366b.10.1791886948439;
        Tue, 13 Oct 2026 03:22:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a05:f6c4:d34b:0:eb4c:5610:e9e4:9d1e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm230739766b.42.2026.10.13.03.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:22:27 -0700 (PDT)
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 13 Oct 2026 12:22:21 +0200
Subject: [PATCH v3 1/4] kunit: add logic for tracking forcefully skipped
 test cases/suites
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-lockdep-kunit-v3-1-cdb8ff720c1f@gmail.com>
References: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
In-Reply-To: <20261013-lockdep-kunit-v3-0-cdb8ff720c1f@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Malte Wechter <maltewechter@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886944; l=16273;
 i=maltewechter@gmail.com; s=20260812; h=from:subject:message-id;
 bh=YksWpFnXopwyl0GA9r6k3J7Ba5+eH89Y4Cf4TR7lbDc=;
 b=aUMwpeF0gUrYGiwUBzGwLb2rQcT0ARscp0e+6PeAcsela3ULCFWTGLOv2pf5q1rTKcSs1zwGT
 SDWFNIPjvfTChXqdQS9/ERSkq2/FJgr859D+8brK+WVM0DsuhzTTnjL
X-Developer-Key: i=maltewechter@gmail.com; a=ed25519;
 pk=Ta/JQQMOW0Cbxp+yEwWqWFEyKFRyuQeSoYicwD7yvWI=

extend tools/testing/kunit/kunit_parser.py with logic to handle test
cases that have been forcefully skipped internally by kunit. This is done
by adding extra information before the skip reason in the ktap output,
more specifically: `# SKIP force skip: (skip reason)`. If the ktap output
were to contain the `force skip:` group, the test would be parsed and
displayed as `[FORCE SKIPPED]` instead of `[SKIPPED]`. On top of this,
the `[FORCE SKIPPED]` result is displayed using an orange color to
signify that the result is different both from a regular skipped test and
a failed test case.

furthermore, internal bookkeeping inside of kunit is added, this is done
by adding a `forced_skip` field both to the `kunit_suite` and `kunit`
structs, which enables kunit to check if a skipped test was forcefully
skipped or not, which is necessary in order to correctly bookkeep and
display test results. It is important to note that a test _cannot_ be
marked as forcefully skipped if neither of CONFIG_KUNIT_FAIL_TEST_ON_WARN
and CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP is =y. The rust kunit wrapper
inside of rust/kernel/kunit.rs is correctly updated to handle
the `forced_skip` field.

Signed-off-by: Malte Wechter <maltewechter@gmail.com>
---
 include/kunit/test.h                 |  4 ++
 lib/kunit/Kconfig                    | 23 +++++++++++
 lib/kunit/test.c                     | 79 +++++++++++++++++++++++++++---------
 rust/kernel/kunit.rs                 |  1 +
 tools/testing/kunit/kunit_json.py    |  2 +
 tools/testing/kunit/kunit_parser.py  | 36 +++++++++++++---
 tools/testing/kunit/kunit_printer.py |  3 ++
 7 files changed, 123 insertions(+), 25 deletions(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa5..248737980bb5 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -285,6 +285,9 @@ struct kunit_suite {
 	struct string_stream *log;
 	int suite_init_err;
 	bool is_init;
+
+	/* true if any tests in this suite has been forcefully skipped */
+	bool forced_skip;
 	enum kunit_status status;
 };
 
@@ -345,6 +348,7 @@ struct kunit {
 	 */
 	spinlock_t lock; /* Guards all mutable test state. */
 	enum kunit_status status; /* Read only after test_case finishes! */
+	bool forced_skip; /* True if this test has been forcefully skipped */
 	/*
 	 * Because resources is a list that may be updated multiple times (with
 	 * new resources) from any thread associated with a test case, we must
diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 94ff8e4089bf..5ed10ea5d4eb 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -142,4 +142,27 @@ config KUNIT_UML_PCI
 
 	  If unsure, say N.
 
+config KUNIT_FAIL_TEST_ON_WARN
+	bool "Enable kernel TAINT_WARN assertions in KUnit tests"
+	default n
+	help
+		Enables asserting if the kernel is tainted with `TAINT_WARN` before
+		and after a KUnit test case is run. In case `TAINT_WARN` is set
+		before a test case is run, skip that test, if `TAINT_WARN`
+		gets set during the test, fail that test and skip all proceeding test cases.
+		Tests that intentionally trigger warnings must use `kunit_warning_suppress()`,
+		or they will fail with this option.
+
+		If unsure, say N.
+
+config KUNIT_FAIL_TEST_ON_LOCKDEP
+	bool "Enable debug_locks assertions in KUnit tests"
+	depends on LOCKDEP
+	default n
+	help
+		Enables asserting `debug_locks` is on before and after a KUnit test case is run.
+		In case `debug_locks` is off before a test case is run, skip that test, if `debug_locks`
+		has been turned off during the test, fail that test and skip all proceeding test cases.
+
+		If unsure, say N.
 endif # KUNIT
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index 09e3dabfac0c..0e3ed457daca 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -27,6 +27,28 @@
 
 static DEFINE_MUTEX(kunit_run_lock);
 
+/*
+ * True if test cases/suites can be forcefully skipped
+ */
+#define KUNIT_CAN_FORCE_SKIP \
+	(IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_WARN) || \
+	 IS_ENABLED(CONFIG_KUNIT_FAIL_TEST_ON_LOCKDEP))
+
+/*
+ * If force skips are possible, forced_skip should be logged as a stat.
+ * Macro must expand to multiple function arguments.
+ * checkpatche falsely displays an error for this.
+ */
+#if KUNIT_CAN_FORCE_SKIP
+#define KUNIT_STATS_FMT "pass:%lu fail:%lu skip:%lu forced_skip:%lu total:%lu"
+#define KUNIT_STATS_ARGS(s) \
+	(s)->passed, (s)->failed, (s)->skipped, (s)->forced_skipped, (s)->total
+#else
+#define KUNIT_STATS_FMT "pass:%lu fail:%lu skip:%lu total:%lu"
+#define KUNIT_STATS_ARGS(s) \
+	(s)->passed, (s)->failed, (s)->skipped, (s)->total
+#endif
+
 /*
  * Hook to fail the current test and print an error message to the log.
  */
@@ -90,6 +112,7 @@ MODULE_PARM_DESC(stats_enabled,
 struct kunit_result_stats {
 	unsigned long passed;
 	unsigned long skipped;
+	unsigned long forced_skipped;
 	unsigned long failed;
 	unsigned long total;
 };
@@ -113,12 +136,8 @@ static void kunit_print_test_stats(struct kunit *test,
 
 	kunit_log(KERN_INFO, test,
 		  KUNIT_SUBTEST_INDENT
-		  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
-		  test->name,
-		  stats->passed,
-		  stats->failed,
-		  stats->skipped,
-		  stats->total);
+		  "# %s: " KUNIT_STATS_FMT,
+		test->name, KUNIT_STATS_ARGS(stats));
 }
 
 /* Append formatted message to log. */
@@ -230,6 +249,10 @@ enum kunit_status kunit_suite_has_succeeded(struct kunit_suite *suite)
 			status = KUNIT_SUCCESS;
 	}
 
+	/* If any test cases has been forcefully skipped, mark the test suite as failed */
+	if (suite->forced_skip && status == KUNIT_SKIPPED)
+		status = KUNIT_FAILURE;
+
 	return status;
 }
 EXPORT_SYMBOL_GPL(kunit_suite_has_succeeded);
@@ -360,6 +383,7 @@ void kunit_init_test(struct kunit *test, const char *name, struct string_stream
 	if (test->log)
 		string_stream_clear(log);
 	test->status = KUNIT_SUCCESS;
+	test->forced_skip = false;
 	test->status_comment[0] = '\0';
 	kunit_init_params(test);
 }
@@ -611,21 +635,14 @@ static void kunit_print_suite_stats(struct kunit_suite *suite,
 {
 	if (kunit_should_print_stats(suite_stats)) {
 		kunit_log(KERN_INFO, suite,
-			  "# %s: pass:%lu fail:%lu skip:%lu total:%lu",
-			  suite->name,
-			  suite_stats->passed,
-			  suite_stats->failed,
-			  suite_stats->skipped,
-			  suite_stats->total);
+		"# %s: " KUNIT_STATS_FMT,
+		suite->name, KUNIT_STATS_ARGS(suite_stats));
 	}
 
 	if (kunit_should_print_stats(param_stats)) {
 		kunit_log(KERN_INFO, suite,
-			  "# Totals: pass:%lu fail:%lu skip:%lu total:%lu",
-			  param_stats->passed,
-			  param_stats->failed,
-			  param_stats->skipped,
-			  param_stats->total);
+		"# Totals: " KUNIT_STATS_FMT,
+		KUNIT_STATS_ARGS(param_stats));
 	}
 }
 
@@ -647,11 +664,23 @@ static void kunit_update_stats(struct kunit_result_stats *stats,
 	stats->total++;
 }
 
+static void kunit_update_stats_forced_skip(struct kunit_result_stats *stats,
+				      enum kunit_status status, bool forced)
+{
+	if (KUNIT_CAN_FORCE_SKIP && status == KUNIT_SKIPPED && forced) {
+		stats->forced_skipped++;
+		stats->total++;
+		return;
+	}
+	kunit_update_stats(stats, status);
+}
+
 static void kunit_accumulate_stats(struct kunit_result_stats *total,
 				   struct kunit_result_stats add)
 {
 	total->passed += add.passed;
 	total->skipped += add.skipped;
+	total->forced_skipped += add.forced_skipped;
 	total->failed += add.failed;
 	total->total += add.total;
 }
@@ -723,6 +752,7 @@ kunit_run_param_test(struct kunit_suite *suite, struct kunit_case *test_case,
 			.param_value = curr_param,
 			.param_index = ++test->param_index,
 			.parent = test,
+			.forced_skip = false,
 		};
 		kunit_init_test(&param_test, test_case->name, NULL);
 		param_test.log = test_case->log;
@@ -739,7 +769,15 @@ kunit_run_param_test(struct kunit_suite *suite, struct kunit_case *test_case,
 				      param_desc,
 				      param_test.status_comment);
 
-		kunit_update_stats(param_stats, param_test.status);
+		kunit_update_stats_forced_skip(param_stats, param_test.status,
+				param_test.forced_skip);
+
+		/* If any param test is forcefully skipped, mark the test as well */
+		if (param_test.forced_skip && !test->forced_skip) {
+			test->forced_skip = true;
+			strscpy(test->status_comment, param_test.status_comment,
+				sizeof(test->status_comment));
+		}
 
 		/* Get next param. */
 		param_desc[0] = '\0';
@@ -773,7 +811,7 @@ kunit_run_one_test(struct kunit_suite *suite, struct kunit_case *test_case,
 		/* Non-parameterised test. */
 		test_case->status = KUNIT_SKIPPED;
 		kunit_run_case_catch_errors(suite, test_case, &test);
-		kunit_update_stats(&param_stats, test.status);
+		kunit_update_stats_forced_skip(&param_stats, test.status, test.forced_skip);
 	} else {
 		kunit_run_param_test(suite, test_case, &test, suite_stats,
 				     total_stats, &param_stats);
@@ -787,7 +825,7 @@ kunit_run_one_test(struct kunit_suite *suite, struct kunit_case *test_case,
 			      test_case->name,
 			      test.status_comment);
 
-	kunit_update_stats(suite_stats, test_case->status);
+	kunit_update_stats_forced_skip(suite_stats, test_case->status, test.forced_skip);
 	kunit_accumulate_stats(total_stats, param_stats);
 }
 
@@ -840,6 +878,7 @@ static void kunit_init_suite(struct kunit_suite *suite)
 	suite->status_comment[0] = '\0';
 	suite->suite_init_err = 0;
 	suite->status = KUNIT_SUCCESS;
+	suite->forced_skip = false;
 
 	if (suite->log)
 		string_stream_clear(suite->log);
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 91eaff8c186a..c3fcad576320 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -288,6 +288,7 @@ macro_rules! kunit_unsafe_test_suite {
                     log: ::core::ptr::null_mut(),
                     suite_init_err: 0,
                     is_init: false,
+                    forced_skip: false,
                     status: kernel::bindings::kunit_status_KUNIT_SUCCESS,
                 };
 
diff --git a/tools/testing/kunit/kunit_json.py b/tools/testing/kunit/kunit_json.py
index 80fa4e354a17..64fb6e29a792 100644
--- a/tools/testing/kunit/kunit_json.py
+++ b/tools/testing/kunit/kunit_json.py
@@ -24,6 +24,7 @@ JsonObj = Dict[str, Any]
 _status_map: Dict[TestStatus, str] = {
 	TestStatus.SUCCESS: "PASS",
 	TestStatus.SKIPPED: "SKIP",
+	TestStatus.FORCE_SKIPPED: "FAIL",
 	TestStatus.TEST_CRASHED: "ERROR",
 }
 
@@ -46,6 +47,7 @@ def _get_group_json(test: Test, common_fields: JsonObj) -> JsonObj:
 		"failed": test_counts.failed,
 		"crashed": test_counts.crashed,
 		"skipped": test_counts.skipped,
+		"forced_skipped": test_counts.force_skipped,
 		"errors": test_counts.errors,
 	}
 	test_group = {
diff --git a/tools/testing/kunit/kunit_parser.py b/tools/testing/kunit/kunit_parser.py
index d722874bc660..45a8afffefc4 100644
--- a/tools/testing/kunit/kunit_parser.py
+++ b/tools/testing/kunit/kunit_parser.py
@@ -69,6 +69,7 @@ class TestStatus(Enum):
 	SUCCESS = auto()
 	FAILURE = auto()
 	SKIPPED = auto()
+	FORCE_SKIPPED = auto()
 	TEST_CRASHED = auto()
 	NO_TESTS = auto()
 	FAILURE_TO_PARSE_TESTS = auto()
@@ -83,13 +84,14 @@ class TestCounts:
 	failed: int = 0
 	crashed: int = 0
 	skipped: int = 0
+	force_skipped: int = 0
 	errors: int = 0
 
 	def __str__(self) -> str:
 		"""Returns the string representation of a TestCounts object."""
 		statuses = [('passed', self.passed), ('failed', self.failed),
 			('crashed', self.crashed), ('skipped', self.skipped),
-			('errors', self.errors)]
+			('force skipped', self.force_skipped), ('errors', self.errors)]
 		return f'Ran {self.total()} tests: ' + \
 			', '.join(f'{s}: {n}' for s, n in statuses if n > 0)
 
@@ -98,7 +100,7 @@ class TestCounts:
 		object, where a test case is a test with no subtests.
 		"""
 		return (self.passed + self.failed + self.crashed +
-			self.skipped)
+			self.skipped + self.force_skipped)
 
 	def add_subtest_counts(self, counts: TestCounts) -> None:
 		"""
@@ -114,6 +116,7 @@ class TestCounts:
 		self.failed += counts.failed
 		self.crashed += counts.crashed
 		self.skipped += counts.skipped
+		self.force_skipped += counts.force_skipped
 		self.errors += counts.errors
 
 	def get_status(self) -> TestStatus:
@@ -130,6 +133,8 @@ class TestCounts:
 		if self.passed:
 			# No failures or crashes, looks good!
 			return TestStatus.SUCCESS
+		if self.force_skipped:
+			return TestStatus.FORCE_SKIPPED
 		# We have only skipped tests.
 		return TestStatus.SKIPPED
 
@@ -141,6 +146,8 @@ class TestCounts:
 			self.failed += 1
 		elif status == TestStatus.SKIPPED:
 			self.skipped += 1
+		elif status == TestStatus.FORCE_SKIPPED:
+			self.force_skipped += 1
 		elif status != TestStatus.NO_TESTS:
 			self.crashed += 1
 
@@ -384,6 +391,8 @@ def peek_test_name_match(lines: LineStream, test: Test) -> bool:
 		return False
 	return name == test.name
 
+FORCE_SKIP_PREFIX = 'force skip:'
+
 def parse_test_result(lines: LineStream, test: Test,
 			expected_num: int, printer: Printer) -> bool:
 	"""
@@ -431,8 +440,13 @@ def parse_test_result(lines: LineStream, test: Test,
 	# Set status of test object
 	status = match.group(1)
 	if skip_match:
-		test.status = TestStatus.SKIPPED
-		test.skip_reason = skip_match.group(5) or ''
+		skip_reason = skip_match.group(5) or ''
+		if skip_reason.startswith(FORCE_SKIP_PREFIX):
+			test.status = TestStatus.FORCE_SKIPPED
+			test.skip_reason = skip_reason[len(FORCE_SKIP_PREFIX):].strip()
+		else:
+			test.status = TestStatus.SKIPPED
+			test.skip_reason = skip_reason
 	elif status == 'ok':
 		test.status = TestStatus.SUCCESS
 	else:
@@ -540,6 +554,11 @@ def format_test_result(test: Test, printer: Printer) -> str:
 	"""
 	if test.status == TestStatus.SUCCESS:
 		return printer.green('[PASSED] ') + test.name
+	if test.status == TestStatus.FORCE_SKIPPED:
+		skip_message = printer.orange('[FORCE SKIPPED] ') + test.name
+		if test.skip_reason != '':
+			skip_message += printer.yellow(' (' + test.skip_reason + ')')
+		return skip_message
 	if test.status == TestStatus.SKIPPED:
 		skip_message = printer.yellow('[SKIPPED] ') + test.name
 		if test.skip_reason != '':
@@ -659,6 +678,8 @@ def print_summary_line(test: Test, printer: Printer) -> None:
 		color = printer.green
 	elif test.status in (TestStatus.SKIPPED, TestStatus.NO_TESTS):
 		color = printer.yellow
+	elif test.status == TestStatus.FORCE_SKIPPED:
+		color = printer.orange
 	else:
 		color = printer.red
 	printer.print_with_timestamp(color(f'Testing complete. {test.counts}'))
@@ -678,7 +699,9 @@ def bubble_up_test_results(test: Test) -> None:
 	"""
 	If the test has subtests, add the test counts of the subtests to the
 	test and check if any of the tests crashed and if so set the test
-	status to crashed. Otherwise if the test has no subtests add the
+	status to crashed. If the test has subtests, is marked as failed
+	and all subtests are FORCE_SKIPPED then mark the test as FORCE_SKIPPED.
+	Otherwise if the test has no subtests add the
 	status of the test to the test counts.
 
 	Parameters:
@@ -694,6 +717,9 @@ def bubble_up_test_results(test: Test) -> None:
 	elif test.counts.get_status() == TestStatus.TEST_CRASHED:
 		test.status = TestStatus.TEST_CRASHED
 
+	if status == TestStatus.FAILURE and test.counts.get_status() == TestStatus.FORCE_SKIPPED:
+		test.status = TestStatus.FORCE_SKIPPED
+
 	if status == TestStatus.FAILURE and test.counts.get_status() == TestStatus.SUCCESS:
 		counts.add_status(status)
 
diff --git a/tools/testing/kunit/kunit_printer.py b/tools/testing/kunit/kunit_printer.py
index ca119f61fe79..97813b462b93 100644
--- a/tools/testing/kunit/kunit_printer.py
+++ b/tools/testing/kunit/kunit_printer.py
@@ -45,6 +45,9 @@ class Printer:
 	def green(self, text: str) -> str:
 		return self._color('\033[1;32m', text)
 
+	def orange(self, text: str) -> str:
+		return self._color('\033[1;38;5;208m', text)
+
 	def color_len(self) -> int:
 		"""Returns the length of the color escape codes."""
 		return len(self.red(''))

-- 
2.54.0

