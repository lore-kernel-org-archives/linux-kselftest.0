From: shuah at kernel.org (Shuah Khan (Samsung OSG))
Date: Fri,  4 May 2018 19:13:19 -0600
Subject: [PATCH 15/24] selftests: lib: add prime_numbers.sh test to Makefile
In-Reply-To: <20180505011328.32078-1-shuah@kernel.org>
References: <20180505011328.32078-1-shuah@kernel.org>
Message-ID: <20180505011328.32078-15-shuah@kernel.org>

prime_numbers.sh is not included in TEST_PROGS. Add it.

Signed-off-by: Shuah Khan (Samsung OSG) <shuah at kernel.org>
---
 tools/testing/selftests/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/lib/Makefile b/tools/testing/selftests/lib/Makefile
index 08360060ab14..70d5711e3ac8 100644
--- a/tools/testing/selftests/lib/Makefile
+++ b/tools/testing/selftests/lib/Makefile
@@ -3,6 +3,6 @@
 # No binaries, but make sure arg-less "make" doesn't trigger "run_tests"
 all:
 
-TEST_PROGS := printf.sh bitmap.sh
+TEST_PROGS := printf.sh bitmap.sh prime_numbers.sh
 
 include ../lib.mk
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
