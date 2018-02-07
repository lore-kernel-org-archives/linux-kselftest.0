From: daniel.diaz@linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Wed,  7 Feb 2018 11:24:31 -0600
Subject: [Linux-kselftest-mirror] [PATCH] selftests/futex: Fix line
	continuation in Makefile
Message-ID: <1518024271-12467-1-git-send-email-daniel.diaz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180207172431.GNZc_q-zDuYouOoaLiamwdI21SHEf3QDwbB924rFRJ8@z>

The Makefile lacks a couple of line continuation backslashes
in an `if' clause, which produces an error while make'ing:

  $ make
  make[1]: Entering directory `/[...]/linux/tools/testing/selftests/futex'
  /bin/sh: -c: line 5: syntax error: unexpected end of file
  make[1]: *** [all] Error 1
  make[1]: Leaving directory `/[...]/linux/tools/testing/selftests/futex'
  make: *** [all] Error 2

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/futex/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/futex/Makefile b/tools/testing/selftests/futex/Makefile
index cea4adc..a63e845 100644
--- a/tools/testing/selftests/futex/Makefile
+++ b/tools/testing/selftests/futex/Makefile
@@ -12,9 +12,9 @@ all:
 		BUILD_TARGET=$(OUTPUT)/$$DIR;	\
 		mkdir $$BUILD_TARGET  -p;	\
 		make OUTPUT=$$BUILD_TARGET -C $$DIR $@;\
-		if [ -e $$DIR/$(TEST_PROGS) ]; then
-			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/;
-		fi
+		if [ -e $$DIR/$(TEST_PROGS) ]; then \
+			rsync -a $$DIR/$(TEST_PROGS) $$BUILD_TARGET/; \
+		fi \
 	done
 
 override define RUN_TESTS
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
