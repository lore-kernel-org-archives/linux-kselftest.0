From: tycho at tycho.ws (Tycho Andersen)
Date: Fri, 18 Jan 2019 17:12:14 -0700
Subject: [PATCH 3/6] selftest: include stdio.h in kselftest.h
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <20190119001217.12660-4-tycho@tycho.ws>

While playing around with a way to skip the seccomp get_metadata test, I
noticed that this header uses printf() without defining it, leading to,

../kselftest.h: In function ‘ksft_print_header’:
../kselftest.h:61:3: warning: implicit declaration of function ‘printf’ [-Wimplicit-function-declaration]
   printf("TAP version 13\n");
   ^~~~~~
../kselftest.h:61:3: warning: incompatible implicit declaration of built-in function ‘printf’
../kselftest.h:61:3: note: include ‘<stdio.h>’ or provide a declaration of ‘printf’

if user code doesn't also use printf.

Signed-off-by: Tycho Andersen <tycho at tycho.ws>
---
 tools/testing/selftests/kselftest.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index a3edb2c8e43d..47e1d995c182 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <unistd.h>
 #include <stdarg.h>
+#include <stdio.h>
 
 /* define kselftest exit codes */
 #define KSFT_PASS  0
-- 
2.19.1
