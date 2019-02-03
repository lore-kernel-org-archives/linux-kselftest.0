From: broonie at kernel.org (Mark Brown)
Date: Sun,  3 Feb 2019 14:40:16 +0100
Subject: [PATCH 1/2] selftests/x86/fsgsbase: Indirect output through a wrapper
 function
In-Reply-To: <20190203134017.9375-1-broonie@kernel.org>
References: <20190203134017.9375-1-broonie@kernel.org>
Message-ID: <20190203134017.9375-2-broonie@kernel.org>

In preparation for a change to make this test run repeatedly which
would generate huge amounts of output as is indirect all the printf()
calls in the program through a wrapper and add a quiet flag which can
be used to suppress the output.  This is fairly quick and dirty, I'm not
100% sure what would be idiomatic here.

Signed-off-by: Mark Brown <broonie at kernel.org>
---
 tools/testing/selftests/x86/fsgsbase.c | 52 ++++++++++++++++----------
 1 file changed, 32 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
index f249e042b3b5..6cda6daa1f8c 100644
--- a/tools/testing/selftests/x86/fsgsbase.c
+++ b/tools/testing/selftests/x86/fsgsbase.c
@@ -7,6 +7,7 @@
 #define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
+#include <stdarg.h>
 #include <stdbool.h>
 #include <string.h>
 #include <sys/syscall.h>
@@ -32,6 +33,17 @@ static volatile sig_atomic_t want_segv;
 static volatile unsigned long segv_addr;
 
 static int nerrs;
+static bool quiet;
+
+static void logger(const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	if (!quiet)
+		vprintf(fmt, args);
+	va_end(args);
+}
 
 static void sethandler(int sig, void (*handler)(int, siginfo_t *, void *),
 		       int flags)
@@ -118,29 +130,29 @@ static void check_gs_value(unsigned long value)
 	unsigned long base;
 	unsigned short sel;
 
-	printf("[RUN]\tARCH_SET_GS to 0x%lx\n", value);
+	logger("[RUN]\tARCH_SET_GS to 0x%lx\n", value);
 	if (syscall(SYS_arch_prctl, ARCH_SET_GS, value) != 0)
 		err(1, "ARCH_SET_GS");
 
 	asm volatile ("mov %%gs, %0" : "=rm" (sel));
 	base = read_base(GS);
 	if (base == value) {
-		printf("[OK]\tGSBASE was set as expected (selector 0x%hx)\n",
+		logger("[OK]\tGSBASE was set as expected (selector 0x%hx)\n",
 		       sel);
 	} else {
 		nerrs++;
-		printf("[FAIL]\tGSBASE was not as expected: got 0x%lx (selector 0x%hx)\n",
+		logger("[FAIL]\tGSBASE was not as expected: got 0x%lx (selector 0x%hx)\n",
 		       base, sel);
 	}
 
 	if (syscall(SYS_arch_prctl, ARCH_GET_GS, &base) != 0)
 		err(1, "ARCH_GET_GS");
 	if (base == value) {
-		printf("[OK]\tARCH_GET_GS worked as expected (selector 0x%hx)\n",
+		logger("[OK]\tARCH_GET_GS worked as expected (selector 0x%hx)\n",
 		       sel);
 	} else {
 		nerrs++;
-		printf("[FAIL]\tARCH_GET_GS was not as expected: got 0x%lx (selector 0x%hx)\n",
+		logger("[FAIL]\tARCH_GET_GS was not as expected: got 0x%lx (selector 0x%hx)\n",
 		       base, sel);
 	}
 }
@@ -149,7 +161,7 @@ static void mov_0_gs(unsigned long initial_base, bool schedule)
 {
 	unsigned long base, arch_base;
 
-	printf("[RUN]\tARCH_SET_GS to 0x%lx then mov 0 to %%gs%s\n", initial_base, schedule ? " and schedule " : "");
+	logger("[RUN]\tARCH_SET_GS to 0x%lx then mov 0 to %%gs%s\n", initial_base, schedule ? " and schedule " : "");
 	if (syscall(SYS_arch_prctl, ARCH_SET_GS, initial_base) != 0)
 		err(1, "ARCH_SET_GS");
 
@@ -161,10 +173,10 @@ static void mov_0_gs(unsigned long initial_base, bool schedule)
 	if (syscall(SYS_arch_prctl, ARCH_GET_GS, &arch_base) != 0)
 		err(1, "ARCH_GET_GS");
 	if (base == arch_base) {
-		printf("[OK]\tGSBASE is 0x%lx\n", base);
+		logger("[OK]\tGSBASE is 0x%lx\n", base);
 	} else {
 		nerrs++;
-		printf("[FAIL]\tGSBASE changed to 0x%lx but kernel reports 0x%lx\n", base, arch_base);
+		logger("[FAIL]\tGSBASE changed to 0x%lx but kernel reports 0x%lx\n", base, arch_base);
 	}
 }
 
@@ -195,7 +207,7 @@ static void do_remote_base()
 
 	unsigned short sel;
 	asm volatile ("mov %%gs, %0" : "=rm" (sel));
-	printf("\tother thread: ARCH_SET_GS(0x%lx)%s -- sel is 0x%hx\n",
+	logger("\tother thread: ARCH_SET_GS(0x%lx)%s -- sel is 0x%hx\n",
 	       to_set, hard_zero ? " and clear gs" : "", sel);
 }
 
@@ -228,7 +240,7 @@ void do_unexpected_base(void)
 		.useable         = 0
 	};
 	if (syscall(SYS_modify_ldt, 1, &desc, sizeof(desc)) == 0) {
-		printf("\tother thread: using LDT slot 0\n");
+		logger("\tother thread: using LDT slot 0\n");
 		asm volatile ("mov %0, %%gs" : : "rm" ((unsigned short)0x7));
 	} else {
 		/* No modify_ldt for us (configured out, perhaps) */
@@ -250,10 +262,10 @@ void do_unexpected_base(void)
 		munmap(low_desc, sizeof(desc));
 
 		if (ret != 0) {
-			printf("[NOTE]\tcould not create a segment -- test won't do anything\n");
+			logger("[NOTE]\tcould not create a segment -- test won't do anything\n");
 			return;
 		}
-		printf("\tother thread: using GDT slot %d\n", desc.entry_number);
+		logger("\tother thread: using GDT slot %d\n", desc.entry_number);
 		asm volatile ("mov %0, %%gs" : : "rm" ((unsigned short)((desc.entry_number << 3) | 0x3)));
 	}
 
@@ -298,10 +310,10 @@ static void set_gs_and_switch_to(unsigned long local,
 		local = 0;
 	}
 
-	printf("[RUN]\tARCH_SET_GS(0x%lx)%s, then schedule to 0x%lx\n",
+	logger("[RUN]\tARCH_SET_GS(0x%lx)%s, then schedule to 0x%lx\n",
 	       local, hard_zero ? " and clear gs" : "", remote);
 	if (force_sel)
-		printf("\tBefore schedule, set selector to 0x%hx\n", force_sel);
+		logger("\tBefore schedule, set selector to 0x%hx\n", force_sel);
 	if (syscall(SYS_arch_prctl, ARCH_SET_GS, local) != 0)
 		err(1, "ARCH_SET_GS");
 	if (hard_zero)
@@ -309,7 +321,7 @@ static void set_gs_and_switch_to(unsigned long local,
 
 	if (read_base(GS) != local) {
 		nerrs++;
-		printf("[FAIL]\tGSBASE wasn't set as expected\n");
+		logger("[FAIL]\tGSBASE wasn't set as expected\n");
 	}
 
 	if (force_sel) {
@@ -335,11 +347,11 @@ static void set_gs_and_switch_to(unsigned long local,
 	asm volatile ("mov %%gs, %0" : "=rm" (sel_post_sched));
 	base = read_base(GS);
 	if (base == local && sel_pre_sched == sel_post_sched) {
-		printf("[OK]\tGS/BASE remained 0x%hx/0x%lx\n",
+		logger("[OK]\tGS/BASE remained 0x%hx/0x%lx\n",
 		       sel_pre_sched, local);
 	} else {
 		nerrs++;
-		printf("[FAIL]\tGS/BASE changed from 0x%hx/0x%lx to 0x%hx/0x%lx\n",
+		logger("[FAIL]\tGS/BASE changed from 0x%hx/0x%lx to 0x%hx/0x%lx\n",
 		       sel_pre_sched, local, sel_post_sched, base);
 	}
 }
@@ -348,7 +360,7 @@ static void test_unexpected_base(void)
 {
 	unsigned long base;
 
-	printf("[RUN]\tARCH_SET_GS(0), clear gs, then manipulate GSBASE in a different thread\n");
+	logger("[RUN]\tARCH_SET_GS(0), clear gs, then manipulate GSBASE in a different thread\n");
 	if (syscall(SYS_arch_prctl, ARCH_SET_GS, 0) != 0)
 		err(1, "ARCH_SET_GS");
 	asm volatile ("mov %0, %%gs" : : "rm" ((unsigned short)0));
@@ -360,10 +372,10 @@ static void test_unexpected_base(void)
 
 	base = read_base(GS);
 	if (base == 0) {
-		printf("[OK]\tGSBASE remained 0\n");
+		logger("[OK]\tGSBASE remained 0\n");
 	} else {
 		nerrs++;
-		printf("[FAIL]\tGSBASE changed to 0x%lx\n", base);
+		logger("[FAIL]\tGSBASE changed to 0x%lx\n", base);
 	}
 }
 
-- 
2.20.1
