From: sabyasachi.linux at gmail.com (Sabyasachi Gupta)
Date: Mon, 14 Jan 2019 17:48:02 +0530
Subject: [PATCH] tools/testing/selftests/x86/unwind_vdso.c: Remove duplicate
 header
Message-ID: <5c3c7dfe.1c69fb81.7c853.0be7@mx.google.com>

Remove sys/ucontext.h which is included more than once.

Signed-off-by: Sabyasachi Gupta <sabyasachi.linux at gmail.com>
---
 tools/testing/selftests/x86/unwind_vdso.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/x86/unwind_vdso.c b/tools/testing/selftests/x86/unwind_vdso.c
index 00a26a8..9731133 100644
--- a/tools/testing/selftests/x86/unwind_vdso.c
+++ b/tools/testing/selftests/x86/unwind_vdso.c
@@ -44,7 +44,6 @@ int main()
 #include <stdbool.h>
 #include <sys/ptrace.h>
 #include <sys/user.h>
-#include <sys/ucontext.h>
 #include <link.h>
 #include <sys/auxv.h>
 #include <dlfcn.h>
-- 
2.7.4
