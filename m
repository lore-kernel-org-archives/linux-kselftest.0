From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Fri, 23 Feb 2018 15:11:36 -0700
Subject: [PATCH 1/5] selftests: kselftest framework: add handling for TAP
 header level
In-Reply-To: <cover.1519423340.git.shuahkh@osg.samsung.com>
References: <cover.1519423340.git.shuahkh@osg.samsung.com>
Message-ID:
 <3176a8f2e1aaf19632cece19a7945a12e5ebc35f.1519423340.git.shuahkh@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180223221136.2zJxWrkvF4-M2FhtikVKWSWb9y-IM87_e6BEvrzjY6M@z>

Introduce environment variable KSFT_TAP_LEVEL to avoid printing
nested TAP headers for each test. lib.mk run_tests target prints
TAP header before invoking the test program or test script. Tests
need a way to suppress TAP headers if it is already printed out.

This new environment variable adds a way for ksft_print_header()
print TAP header only when KSFT_TAP_LEVEL isn't set.

lib.mk run_tests and test program should print TAP header and set
KSFT_TAP_LEVEL to avoid a second TAP header to be printed.

selftests Makefile should export KSFT_TAP_LEVEL and add TAP Header
echo to the run_kselftest.sh script from emit_tests target handling.

Signed-off-by: Shuah Khan <shuahkh at osg.samsung.com>
---
 tools/testing/selftests/kselftest.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 1a52b03962a3..1b9d8ecdebce 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -57,7 +57,8 @@ static inline int ksft_get_error_cnt(void) { return ksft_cnt.ksft_error; }
 
 static inline void ksft_print_header(void)
 {
-	printf("TAP version 13\n");
+	if (!(getenv("KSFT_TAP_LEVEL")))
+		printf("TAP version 13\n");
 }
 
 static inline void ksft_print_cnts(void)
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
