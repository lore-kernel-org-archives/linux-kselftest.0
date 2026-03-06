Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F3F37B41F
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813612; cv=none; b=dZvVAIpXaeGdzl6v16QtQACbzBmB0mGtJ/ZLhw7V+uv4v95Ly81qfrYJpavUub3E13eioaABUNM2QKPVONsrmwm8Ms7dm+xIPwq5IXdDZ0v1AEjbHJD3WEVDKoS96JDIgHs5EAemLjuhT1FcJnGuvADKmuxPHni0JWOR9238Tkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813612; c=relaxed/simple;
	bh=jJq0hYOd7KM1DJayyjkcFArrTtHSIxiUDjXD0vFf6hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3aDQ/MzWSMnWqEdmh9jrpGbwkKpKJpId4IHmvti0vJbK9eu89S8lZajm+6VIMHC/oZhlP7IQNLHvUkceLhugroz+hh5pIt5Jxkg5UAQJoJ9FUBNwn44kyVV07JaFsJ60/zupNeIWjJcObc41oCmcuF3MClhM8Ij4bh+Uq69+oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPWEGuHY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPWEGuHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772813609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pp3EhGkHs8clYca1XkHqcOG+uzD0A0gPqGEyEfk/OdY=;
	b=DPWEGuHY58IdftcC+tU9+1TtAWG8oBcb6zGJ7jgJKjangfQ4Lbb9SZcVxVFGeQXuZI/H3y
	J2LdrFCBfPQtN8SVfPQMc0onCLhlKG8FbU0zOGO+Y1hOxENhoqEbFbjRs5pUFgG8hhFn/y
	qKhJYaS77iy0mtdKNlU9v8n0QouuYgM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-e0XU-W0eOUuW0XdYOlTQ4Q-1; Fri,
 06 Mar 2026 11:13:26 -0500
X-MC-Unique: e0XU-W0eOUuW0XdYOlTQ4Q-1
X-Mimecast-MFC-AGG-ID: e0XU-W0eOUuW0XdYOlTQ4Q_1772813604
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E1E7D19560A7;
	Fri,  6 Mar 2026 16:13:23 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EA7E3003E9F;
	Fri,  6 Mar 2026 16:13:18 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Fri, 06 Mar 2026 17:10:06 +0100
Subject: [PATCH RFC 1/7] selftests/sched: Add SCHED_DEADLINE test framework
 infrastructure
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-upstream-deadline-kselftests-v1-1-2b23ef74c46a@redhat.com>
References: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
In-Reply-To: <20260306-upstream-deadline-kselftests-v1-0-2b23ef74c46a@redhat.com>
To: Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Valentin Schneider <vschneid@redhat.com>, 
 Clark Williams <williams@redhat.com>, Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772813592; l=15557;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=jJq0hYOd7KM1DJayyjkcFArrTtHSIxiUDjXD0vFf6hg=;
 b=TuoorXqdQfHAcRC2W81zD5RaDXkXUUkj8Utgj3E343lMw4pIHfeW9g69s7RF5GLQ/iuVH+T/v
 64q/nqNGrAUCKBLMycRtMD9FbE88o/NjdYB8VDlr5piMdO35HuYpV3K
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add the foundational infrastructure for SCHED_DEADLINE scheduler tests
following the pattern established by sched_ext selftests. This provides
a clean, extensible framework for testing SCHED_DEADLINE functionality.

The framework uses ELF constructors for automatic test registration,
allowing new tests to be added simply by defining a struct dl_test and
calling REGISTER_DL_TEST(). The runner discovers all registered tests
at runtime and executes them serially, providing a simple and consistent
way to expand test coverage without modifying the test runner itself.

The framework provides a complete test lifecycle with setup, run, and
cleanup phases for each test. Tests can be filtered by name, listed for
inspection, or run in quiet mode for automated testing environments. The
framework includes assertion macros such as DL_EQ and DL_FAIL_IF to
simplify test authoring and provide consistent error reporting. Signal
handling ensures graceful interruption and cleanup when tests are
terminated early.

This commit establishes the framework without any actual tests. Tests
will be added in subsequent patches. The framework design is inspired by
tools/testing/selftests/sched_ext/ but tailored for SCHED_DEADLINE
testing needs.

Assisted-by: Claude Code: claude-sonnet-4-5@20250929
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 tools/testing/selftests/sched/deadline/.gitignore |   3 +
 tools/testing/selftests/sched/deadline/Makefile   |  34 ++++
 tools/testing/selftests/sched/deadline/dl_test.h  | 238 ++++++++++++++++++++++
 tools/testing/selftests/sched/deadline/runner.c   | 219 ++++++++++++++++++++
 4 files changed, 494 insertions(+)

diff --git a/tools/testing/selftests/sched/deadline/.gitignore b/tools/testing/selftests/sched/deadline/.gitignore
new file mode 100644
index 0000000000000..503a1a968f952
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/.gitignore
@@ -0,0 +1,3 @@
+runner
+cpuhog
+*.o
diff --git a/tools/testing/selftests/sched/deadline/Makefile b/tools/testing/selftests/sched/deadline/Makefile
new file mode 100644
index 0000000000000..fd57794f1a543
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/Makefile
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0
+
+TEST_GEN_PROGS := runner
+
+# override lib.mk's default rules
+OVERRIDE_TARGETS := 1
+include ../../lib.mk
+
+CFLAGS += -Wall -O2 -g -pthread
+
+OUTPUT_DIR := $(OUTPUT)
+
+# Utility object files
+UTIL_OBJS :=
+
+# Test object files (all .c files except runner.c, dl_util.c, cpuhog.c)
+# Will be populated as we add tests
+TEST_OBJS :=
+
+# Runner binary links utility and test objects
+$(OUTPUT)/runner: runner.c $(UTIL_OBJS) $(TEST_OBJS) dl_test.h | $(OUTPUT_DIR)
+	$(CC) $(CFLAGS) -o $@ runner.c $(UTIL_OBJS) $(TEST_OBJS) $(LDFLAGS)
+
+$(OUTPUT_DIR):
+	mkdir -p $@
+
+.PHONY: all clean
+
+all: $(TEST_GEN_PROGS)
+
+clean:
+	rm -f $(OUTPUT)/runner
+	rm -f $(OUTPUT)/*.o
+	rm -f *.o
diff --git a/tools/testing/selftests/sched/deadline/dl_test.h b/tools/testing/selftests/sched/deadline/dl_test.h
new file mode 100644
index 0000000000000..545fae1af6631
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/dl_test.h
@@ -0,0 +1,238 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SCHED_DEADLINE Test Framework
+ *
+ * Provides infrastructure for testing SCHED_DEADLINE scheduler functionality.
+ * Tests register themselves using REGISTER_DL_TEST() macro and are
+ * automatically discovered by the runner at runtime.
+ */
+
+#ifndef __DL_TEST_H__
+#define __DL_TEST_H__
+
+#include <errno.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+
+/* Test status return codes */
+enum dl_test_status {
+	DL_TEST_PASS = 0,	/* Test passed successfully */
+	DL_TEST_SKIP,		/* Test skipped (feature unavailable, etc.) */
+	DL_TEST_FAIL,		/* Test failed */
+};
+
+/**
+ * struct dl_test - Deadline scheduler test definition
+ * @name: Short test identifier (e.g., "basic_scheduling")
+ * @description: Human-readable description of what the test validates
+ * @setup: Optional callback to prepare test environment
+ * @run: Required callback to execute test logic
+ * @cleanup: Optional callback to cleanup test resources
+ *
+ * Tests are defined by filling in this structure and registering with
+ * REGISTER_DL_TEST(). The runner will discover and execute all registered
+ * tests automatically.
+ */
+struct dl_test {
+	/**
+	 * name - The name of the test
+	 *
+	 * Short identifier used for filtering and reporting. Should be
+	 * lowercase with underscores (e.g., "bandwidth_admission").
+	 */
+	const char *name;
+
+	/**
+	 * description - Human-readable test description
+	 *
+	 * Explains what the test validates and why it's important.
+	 * Displayed when test runs unless quiet mode is enabled.
+	 */
+	const char *description;
+
+	/**
+	 * setup - Optional setup callback
+	 * @ctx: Pointer to context pointer, can be set to pass data to run()
+	 *
+	 * Called before run() to prepare test environment. Can allocate
+	 * resources, check prerequisites, etc.
+	 *
+	 * Return:
+	 * - DL_TEST_PASS: Continue to run()
+	 * - DL_TEST_SKIP: Skip this test (feature not available, etc.)
+	 * - DL_TEST_FAIL: Abort test (setup failed)
+	 *
+	 * If setup() returns SKIP or FAIL, run() and cleanup() are not called.
+	 */
+	enum dl_test_status (*setup)(void **ctx);
+
+	/**
+	 * run - Required test execution callback
+	 * @ctx: Context pointer set by setup(), or NULL if no setup
+	 *
+	 * Executes the actual test logic. This is the main test function.
+	 *
+	 * Return:
+	 * - DL_TEST_PASS: Test passed
+	 * - DL_TEST_SKIP: Test skipped (unlikely here, prefer setup())
+	 * - DL_TEST_FAIL: Test failed
+	 */
+	enum dl_test_status (*run)(void *ctx);
+
+	/**
+	 * cleanup - Optional cleanup callback
+	 * @ctx: Context pointer set by setup(), or NULL if no setup
+	 *
+	 * Called after run() to cleanup resources. Always runs if setup()
+	 * succeeded, regardless of run() result. Cannot fail the test.
+	 */
+	void (*cleanup)(void *ctx);
+};
+
+/**
+ * dl_test_register() - Register a test with the framework
+ * @test: Pointer to test structure
+ *
+ * Called by REGISTER_DL_TEST() macro. Don't call directly.
+ */
+void dl_test_register(struct dl_test *test);
+
+/**
+ * REGISTER_DL_TEST() - Register a test for auto-discovery
+ * @__test: Pointer to struct dl_test
+ *
+ * Uses ELF constructor attribute to automatically register the test
+ * when the binary loads. The runner will discover and execute all
+ * registered tests.
+ *
+ * Example:
+ *   static struct dl_test my_test = {
+ *       .name = "my_test",
+ *       .description = "Tests something important",
+ *       .run = my_test_run,
+ *   };
+ *   REGISTER_DL_TEST(&my_test);
+ */
+#define __DL_CONCAT(a, b) a##b
+#define _DL_CONCAT(a, b) __DL_CONCAT(a, b)
+
+#define REGISTER_DL_TEST(__test)					\
+	__attribute__((constructor))					\
+	static void _DL_CONCAT(___dlregister_, __LINE__)(void)		\
+	{								\
+		dl_test_register(__test);				\
+	}
+
+/* Error reporting macros */
+
+/**
+ * DL_ERR() - Print error message with file/line info
+ */
+#define DL_ERR(__fmt, ...)						\
+	do {								\
+		fprintf(stderr, "ERR: %s:%d\n", __FILE__, __LINE__);	\
+		fprintf(stderr, __fmt"\n", ##__VA_ARGS__);		\
+	} while (0)
+
+/**
+ * DL_FAIL() - Fail the test with a message
+ *
+ * Prints error message and returns DL_TEST_FAIL. Use in test run() or
+ * setup() functions.
+ */
+#define DL_FAIL(__fmt, ...)						\
+	do {								\
+		DL_ERR(__fmt, ##__VA_ARGS__);				\
+		return DL_TEST_FAIL;					\
+	} while (0)
+
+/**
+ * DL_FAIL_IF() - Conditionally fail the test
+ * @__cond: Condition to check
+ * @__fmt: printf-style format string
+ *
+ * If condition is true, fail the test with the given message.
+ */
+#define DL_FAIL_IF(__cond, __fmt, ...)					\
+	do {								\
+		if (__cond)						\
+			DL_FAIL(__fmt, ##__VA_ARGS__);			\
+	} while (0)
+
+/* Comparison assertion macros */
+
+/**
+ * DL_EQ() - Assert two values are equal
+ */
+#define DL_EQ(_x, _y) \
+	DL_FAIL_IF((_x) != (_y), \
+		   "Expected %s == %s (%lld == %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_NE() - Assert two values are not equal
+ */
+#define DL_NE(_x, _y) \
+	DL_FAIL_IF((_x) == (_y), \
+		   "Expected %s != %s (%lld != %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_LT() - Assert x < y
+ */
+#define DL_LT(_x, _y) \
+	DL_FAIL_IF((_x) >= (_y), \
+		   "Expected %s < %s (%lld < %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_LE() - Assert x <= y
+ */
+#define DL_LE(_x, _y) \
+	DL_FAIL_IF((_x) > (_y), \
+		   "Expected %s <= %s (%lld <= %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_GT() - Assert x > y
+ */
+#define DL_GT(_x, _y) \
+	DL_FAIL_IF((_x) <= (_y), \
+		   "Expected %s > %s (%lld > %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_GE() - Assert x >= y
+ */
+#define DL_GE(_x, _y) \
+	DL_FAIL_IF((_x) < (_y), \
+		   "Expected %s >= %s (%lld >= %lld)", \
+		   #_x, #_y, (long long)(_x), (long long)(_y))
+
+/**
+ * DL_ASSERT() - Assert condition is true
+ */
+#define DL_ASSERT(_x) \
+	DL_FAIL_IF(!(_x), "Expected %s to be true", #_x)
+
+/**
+ * DL_BUG_ON() - Fatal assertion (for framework bugs, not test failures)
+ * @__cond: Condition to check
+ * @__fmt: Error message
+ *
+ * For internal framework consistency checks. If condition is true,
+ * prints error and aborts. Use for "should never happen" cases.
+ */
+#define DL_BUG_ON(__cond, __fmt, ...)					\
+	do {								\
+		if (__cond) {						\
+			fprintf(stderr, "BUG: %s:%d: " __fmt "\n",	\
+				__FILE__, __LINE__, ##__VA_ARGS__);	\
+			abort();					\
+		}							\
+	} while (0)
+
+#endif /* __DL_TEST_H__ */
diff --git a/tools/testing/selftests/sched/deadline/runner.c b/tools/testing/selftests/sched/deadline/runner.c
new file mode 100644
index 0000000000000..358f695423ef5
--- /dev/null
+++ b/tools/testing/selftests/sched/deadline/runner.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SCHED_DEADLINE Test Runner
+ *
+ * Discovers and executes all registered SCHED_DEADLINE tests.
+ * Tests are statically linked and register themselves via ELF constructors.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <signal.h>
+#include <string.h>
+#include <stdbool.h>
+#include "dl_test.h"
+
+const char help_fmt[] =
+"Runner for SCHED_DEADLINE scheduler tests.\n"
+"\n"
+"All tests are statically linked and run serially. Tests require root\n"
+"privileges to set SCHED_DEADLINE scheduling policy.\n"
+"\n"
+"Usage: %s [-t TEST] [-h]\n"
+"\n"
+"  -t TEST       Only run tests whose name includes this string\n"
+"  -s            Include print output for skipped tests\n"
+"  -l            List all available tests\n"
+"  -q            Don't print the test descriptions during run\n"
+"  -h            Display this help and exit\n";
+
+static volatile int exit_req;
+static bool quiet, print_skipped, list;
+
+#define MAX_DL_TESTS 256
+
+static struct dl_test *__dl_tests[MAX_DL_TESTS];
+static unsigned int __dl_num_tests;
+
+static void sigint_handler(int sig)
+{
+	exit_req = 1;
+}
+
+static void print_test_preamble(const struct dl_test *test, bool quiet)
+{
+	printf("===== START =====\n");
+	printf("TEST: %s\n", test->name);
+	if (!quiet)
+		printf("DESCRIPTION: %s\n", test->description);
+	printf("OUTPUT:\n");
+}
+
+static const char *status_to_result(enum dl_test_status status)
+{
+	switch (status) {
+	case DL_TEST_PASS:
+	case DL_TEST_SKIP:
+		return "ok";
+	case DL_TEST_FAIL:
+		return "not ok";
+	default:
+		return "<UNKNOWN>";
+	}
+}
+
+static void print_test_result(const struct dl_test *test,
+			      enum dl_test_status status,
+			      unsigned int testnum)
+{
+	const char *result = status_to_result(status);
+	const char *directive = status == DL_TEST_SKIP ? "SKIP " : "";
+
+	printf("%s %u %s # %s\n", result, testnum, test->name, directive);
+	printf("=====  END  =====\n");
+}
+
+static bool should_skip_test(const struct dl_test *test, const char *filter)
+{
+	return filter && !strstr(test->name, filter);
+}
+
+static enum dl_test_status run_test(const struct dl_test *test)
+{
+	enum dl_test_status status;
+	void *context = NULL;
+
+	if (test->setup) {
+		status = test->setup(&context);
+		if (status != DL_TEST_PASS)
+			return status;
+	}
+
+	status = test->run(context);
+
+	if (test->cleanup)
+		test->cleanup(context);
+
+	return status;
+}
+
+static bool test_valid(const struct dl_test *test)
+{
+	if (!test) {
+		fprintf(stderr, "NULL test detected\n");
+		return false;
+	}
+
+	if (!test->name) {
+		fprintf(stderr,
+			"Test with no name found. Must specify test name.\n");
+		return false;
+	}
+
+	if (!test->description) {
+		fprintf(stderr, "Test %s requires description.\n", test->name);
+		return false;
+	}
+
+	if (!test->run) {
+		fprintf(stderr, "Test %s has no run() callback\n", test->name);
+		return false;
+	}
+
+	return true;
+}
+
+int main(int argc, char **argv)
+{
+	const char *filter = NULL;
+	unsigned int testnum = 0, i;
+	unsigned int passed = 0, skipped = 0, failed = 0;
+	int opt;
+
+	signal(SIGINT, sigint_handler);
+	signal(SIGTERM, sigint_handler);
+
+	while ((opt = getopt(argc, argv, "qslt:h")) != -1) {
+		switch (opt) {
+		case 'q':
+			quiet = true;
+			break;
+		case 's':
+			print_skipped = true;
+			break;
+		case 'l':
+			list = true;
+			break;
+		case 't':
+			filter = optarg;
+			break;
+		default:
+			fprintf(stderr, help_fmt, argv[0]);
+			return opt != 'h';
+		}
+	}
+
+	for (i = 0; i < __dl_num_tests; i++) {
+		enum dl_test_status status;
+		struct dl_test *test = __dl_tests[i];
+
+		if (list) {
+			printf("%s\n", test->name);
+			if (i == (__dl_num_tests - 1))
+				return 0;
+			continue;
+		}
+
+		if (should_skip_test(test, filter)) {
+			/*
+			 * Printing the skipped tests and their preambles can
+			 * add a lot of noise to the runner output. Printing
+			 * this is only really useful for CI, so let's skip it
+			 * by default.
+			 */
+			if (print_skipped) {
+				print_test_preamble(test, quiet);
+				print_test_result(test, DL_TEST_SKIP, ++testnum);
+			}
+			continue;
+		}
+
+		print_test_preamble(test, quiet);
+		status = run_test(test);
+		print_test_result(test, status, ++testnum);
+
+		switch (status) {
+		case DL_TEST_PASS:
+			passed++;
+			break;
+		case DL_TEST_SKIP:
+			skipped++;
+			break;
+		case DL_TEST_FAIL:
+			failed++;
+			break;
+		}
+
+		if (exit_req) {
+			fprintf(stderr, "\nInterrupted by signal\n");
+			break;
+		}
+	}
+
+	printf("\n\n=============================\n\n");
+	printf("RESULTS:\n\n");
+	printf("PASSED:  %u\n", passed);
+	printf("SKIPPED: %u\n", skipped);
+	printf("FAILED:  %u\n", failed);
+
+	return failed > 0 ? 1 : 0;
+}
+
+void dl_test_register(struct dl_test *test)
+{
+	DL_BUG_ON(!test_valid(test), "Invalid test found");
+	DL_BUG_ON(__dl_num_tests >= MAX_DL_TESTS, "Maximum tests exceeded");
+
+	__dl_tests[__dl_num_tests++] = test;
+}

-- 
2.53.0

