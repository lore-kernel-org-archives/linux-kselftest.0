From: bp at alien8.de (Borislav Petkov)
Date: Mon, 15 Jan 2018 15:59:42 +0100
Subject: [Linux-kselftest-mirror] selftests: run all tests
Message-ID: <20180115145942.s3dgy457xwhn6lwv@pd.tnic>

Hi,

do we want something like that with which one can run all selftests
quickly?

Or is there a way already which I couldn't find?

---
diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 5d4f10ac2af2..3ed42fa50acc 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -77,3 +77,8 @@ $(OUTPUT)/test_syscall_vdso_32: thunks_32.S
 # state.
 $(OUTPUT)/check_initial_reg_state_32: CFLAGS += -Wl,-ereal_start -static
 $(OUTPUT)/check_initial_reg_state_64: CFLAGS += -Wl,-ereal_start -static
+
+run_all:
+	for f in $(TEST_PROGS); do \
+		$$f; \
+	done

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
