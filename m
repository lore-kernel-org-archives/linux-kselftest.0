From: keescook@chromium.org (Kees Cook)
Date: Thu, 11 Apr 2019 17:11:08 -0700
Subject: [PATCH] selftests/harness: Add 30 second timeout per test
Message-ID: <20190412001108.GA3576@beast>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190412001108.U9l0blUU8BeFO7cNJOjAwUkdMNyWqsAlE_Fv7iEdHVM@z>

In order to keep tests from hanging forever, this adds an alarm signal
to each test run. This assumes an individual test doesn't take longer
than 30 seconds.

Signed-off-by: Kees Cook <keescook at chromium.org>
---
 tools/testing/selftests/kselftest_harness.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 2d90c98eeb67..941d9391377f 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -696,6 +696,7 @@ void __run_test(struct __test_metadata *t)
 	t->passed = 1;
 	t->trigger = 0;
 	printf("[ RUN      ] %s\n", t->name);
+	alarm(30);
 	child_pid = fork();
 	if (child_pid < 0) {
 		printf("ERROR SPAWNING TEST CHILD\n");
@@ -744,6 +745,7 @@ void __run_test(struct __test_metadata *t)
 		}
 	}
 	printf("[     %4s ] %s\n", (t->passed ? "OK" : "FAIL"), t->name);
+	alarm(0);
 }
 
 static int test_harness_run(int __attribute__((unused)) argc,
-- 
2.17.1


-- 
Kees Cook
