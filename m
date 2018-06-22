From: shuah@kernel.org (Shuah Khan (Samsung OSG))
Date: Fri, 22 Jun 2018 11:51:08 -0600
Subject: [PATCH] selftests: vDSO - fix to return KSFT_SKIP when test couldn't
 be run
Message-ID: <20180622175108.24292-1-shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180622175108.NOL6jP6qwxsqe_WSE8yVlDe5neQCpPRIrIbUfw0VfxI@z>

Fix to return KSFT_SKIP when test couldn't be run because AT_SYSINFO_EHDR
isn't found and gettimeofday isn't defined.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/vDSO/vdso_test.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test.c b/tools/testing/selftests/vDSO/vdso_test.c
index 2df26bd0099c..eda53f833d8e 100644
--- a/tools/testing/selftests/vDSO/vdso_test.c
+++ b/tools/testing/selftests/vDSO/vdso_test.c
@@ -15,6 +15,8 @@
 #include <sys/auxv.h>
 #include <sys/time.h>
 
+#include "../kselftest.h"
+
 extern void *vdso_sym(const char *version, const char *name);
 extern void vdso_init_from_sysinfo_ehdr(uintptr_t base);
 extern void vdso_init_from_auxv(void *auxv);
@@ -37,7 +39,7 @@ int main(int argc, char **argv)
 	unsigned long sysinfo_ehdr = getauxval(AT_SYSINFO_EHDR);
 	if (!sysinfo_ehdr) {
 		printf("AT_SYSINFO_EHDR is not present!\n");
-		return 0;
+		return KSFT_SKIP;
 	}
 
 	vdso_init_from_sysinfo_ehdr(getauxval(AT_SYSINFO_EHDR));
@@ -48,7 +50,7 @@ int main(int argc, char **argv)
 
 	if (!gtod) {
 		printf("Could not find %s\n", name);
-		return 1;
+		return KSFT_SKIP;
 	}
 
 	struct timeval tv;
@@ -59,6 +61,7 @@ int main(int argc, char **argv)
 		       (long long)tv.tv_sec, (long long)tv.tv_usec);
 	} else {
 		printf("%s failed\n", name);
+		return KSFT_FAIL;
 	}
 
 	return 0;
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
