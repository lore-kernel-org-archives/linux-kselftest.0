From: daniel.diaz at linaro.org (=?UTF-8?q?Daniel=20D=C3=ADaz?=)
Date: Wed,  7 Feb 2018 23:50:28 -0600
Subject: [Linux-kselftest-mirror] [PATCH] selftests/x86: Remove 5lvl test
	from Makefile
Message-ID: <1518069029-22457-1-git-send-email-daniel.diaz@linaro.org>

The 5lvl.c test file was incorporated into another one in
selftests/vm (va_128TBswitch.c) in commit 235266b8.

Signed-off-by: Daniel Díaz <daniel.diaz at linaro.org>
---
 tools/testing/selftests/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 10ca46d..ce2615a 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -11,7 +11,7 @@ TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt ptrace_sysc
 TARGETS_C_32BIT_ONLY := entry_from_vm86 syscall_arg_fault test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
-TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip 5lvl
+TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip
 
 TARGETS_C_32BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_32BIT_ONLY)
 TARGETS_C_64BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_64BIT_ONLY)
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
