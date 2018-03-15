From: keescook at chromium.org (Kees Cook)
Date: Thu, 15 Mar 2018 09:59:16 -0700
Subject: [PATCH] selftests/seccomp: Allow get_metadata to XFAIL
Message-ID: <20180315165916.GA31072@beast>

Since seccomp_get_metadata() depends on CHECKPOINT_RESTORE, XFAIL the
test if the ptrace reports it as missing.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest_harness.h   | 26 +++++++++++++++++++++++++-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 15 +++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index e81bd28bdd89..6ae3730c4ee3 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -107,6 +107,27 @@
 			__FILE__, __LINE__, _metadata->name, ##__VA_ARGS__)
 
 /**
+ * XFAIL(statement, fmt, ...)
+ *
+ * @statement: statement to run after reporting XFAIL
+ * @fmt: format string
+ * @...: optional arguments
+ *
+ * This forces a "pass" after reporting a failure with an XFAIL prefix,
+ * and runs "statement", which is usually "return" or "goto skip".
+ */
+#define XFAIL(statement, fmt, ...) do { \
+	if (TH_LOG_ENABLED) { \
+		fprintf(TH_LOG_STREAM, "[  XFAIL!  ] " fmt "\n", \
+			##__VA_ARGS__); \
+	} \
+	/* TODO: find a way to pass xfail to test runner process. */ \
+	_metadata->passed = 1; \
+	_metadata->trigger = 0; \
+	statement; \
+} while (0)
+
+/**
  * TEST(test_name) - Defines the test function and creates the registration
  * stub
  *
@@ -198,7 +219,7 @@
 
 /**
  * FIXTURE_SETUP(fixture_name) - Prepares the setup function for the fixture.
- * *_metadata* is included so that ASSERT_* work as a convenience
+ * *_metadata* is included so that EXPECT_* and ASSERT_* work correctly.
  *
  * @fixture_name: fixture name
  *
@@ -221,6 +242,7 @@
 		FIXTURE_DATA(fixture_name) __attribute__((unused)) *self)
 /**
  * FIXTURE_TEARDOWN(fixture_name)
+ * *_metadata* is included so that EXPECT_* and ASSERT_* work correctly.
  *
  * @fixture_name: fixture name
  *
@@ -253,6 +275,8 @@
  * Defines a test that depends on a fixture (e.g., is part of a test case).
  * Very similar to TEST() except that *self* is the setup instance of fixture's
  * datatype exposed for use by the implementation.
+ *
+ * Warning: use of ASSERT_* here will skip TEARDOWN.
  */
 /* TODO(wad) register fixtures on dedicated test lists. */
 #define TEST_F(fixture_name, test_name) \
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 92db48825dc1..d7e54031e26b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -2860,6 +2860,7 @@ TEST(get_metadata)
 	int pipefd[2];
 	char buf;
 	struct seccomp_metadata md;
+	long ret;
 
 	ASSERT_EQ(0, pipe(pipefd));
 
@@ -2893,16 +2894,26 @@ TEST(get_metadata)
 	ASSERT_EQ(0, ptrace(PTRACE_ATTACH, pid));
 	ASSERT_EQ(pid, waitpid(pid, NULL, 0));
 
+	/* Past here must not use ASSERT or child process is never killed. */
+
 	md.filter_off = 0;
-	ASSERT_EQ(sizeof(md), ptrace(PTRACE_SECCOMP_GET_METADATA, pid, sizeof(md), &md));
+	errno = 0;
+	ret = ptrace(PTRACE_SECCOMP_GET_METADATA, pid, sizeof(md), &md);
+	EXPECT_EQ(sizeof(md), ret) {
+		if (errno == EINVAL)
+			XFAIL(goto skip, "Kernel does not support PTRACE_SECCOMP_GET_METADATA (missing CONFIG_CHECKPOINT_RESTORE?)");
+	}
+
 	EXPECT_EQ(md.flags, SECCOMP_FILTER_FLAG_LOG);
 	EXPECT_EQ(md.filter_off, 0);
 
 	md.filter_off = 1;
-	ASSERT_EQ(sizeof(md), ptrace(PTRACE_SECCOMP_GET_METADATA, pid, sizeof(md), &md));
+	ret = ptrace(PTRACE_SECCOMP_GET_METADATA, pid, sizeof(md), &md);
+	EXPECT_EQ(sizeof(md), ret);
 	EXPECT_EQ(md.flags, 0);
 	EXPECT_EQ(md.filter_off, 1);
 
+skip:
 	ASSERT_EQ(0, kill(pid, SIGKILL));
 }
 
-- 
2.7.4


-- 
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
