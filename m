Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDD148C40A;
	Tue, 14 Jul 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044099; cv=none; b=e9AZJWC1hWOwdE8OtK6Pjkbs3uWyjjvuYQocI0TeKETBS1ZilE8drjyrtZGrp3zCDySqpROcFSfN0JsNjYSn/C8HHhSOPyzlXD9vL2DbGcqCLryTEPMY4L9cBVlcuSWE6lbLdXmiQ8lH3BgBTD0cu1WdLkkA6Lj48oACeVclNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044099; c=relaxed/simple;
	bh=9/YWlV5TSXUMBp/ymIq49v2XGDkawLw3WU86wtMXh0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caV90elkDa/60c0zpnixdTwsqk+SsF/ssVhNJrTniGJ9SSa1FiYnAyjoQVSpMMgRXSUMVrFcKsEU1hIlTs5BFqUGWbTP5bNLyfDXbrHxUUFjxrgYB36hY4ATC3OA3GYBGbvuv30LPSZVdjfkDeXkB7Z43VIxfwDUwec3czqygu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ck+tRRDb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ck+tRRDb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9907114BF;
	Tue, 14 Jul 2026 08:48:09 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A25A3F915;
	Tue, 14 Jul 2026 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784044093; bh=9/YWlV5TSXUMBp/ymIq49v2XGDkawLw3WU86wtMXh0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ck+tRRDbAqBVC1L8QCIe83oQY+1ui9WeuVVQ0qk0yr8ZlucPKImLO304IwpSi3Pnc
	 BgfFpp7Irsx3JDlsYz7NnzmHTrX6V+bMg17rTtlp2S02WSfBxEtUTt2uwyusNKBciV
	 WzjuHmCP/QcWQL8OKlbhqfxw6lLD66KvwRe88BH0=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH 2/2] selftests/x86: add generic prctl shadow stack test
Date: Tue, 14 Jul 2026 10:47:40 -0500
Message-ID: <20260714154740.140431-3-bill.roberts@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714154740.140431-1-bill.roberts@arm.com>
References: <20260714154740.140431-1-bill.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Run the same test suite for arch_prctl, against prctl, to ensure
consisteny and correctness between the interfaces.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/Makefile          |  3 +-
 .../testing/selftests/x86/test_shadow_stack.c | 55 +++++++++++++++----
 .../selftests/x86/test_shadow_stack_prctl.c   |  3 +
 3 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 tools/testing/selftests/x86/test_shadow_stack_prctl.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..6a505b42ff66 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			test_shadow_stack_prctl
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
diff --git a/tools/testing/selftests/x86/test_shadow_stack.c b/tools/testing/selftests/x86/test_shadow_stack.c
index 3d6ca33edba4..0d14a7f444aa 100644
--- a/tools/testing/selftests/x86/test_shadow_stack.c
+++ b/tools/testing/selftests/x86/test_shadow_stack.c
@@ -92,6 +92,7 @@ static inline unsigned long __attribute__((always_inline)) get_ssp(void)
  * Based on code from nolibc.h. Keep a copy here because this can't pull in all
  * of nolibc.h.
  */
+ #ifndef BUILD_PRCTL
 #define ARCH_PRCTL(arg1, arg2)					\
 ({								\
 	long _ret;						\
@@ -109,6 +110,40 @@ static inline unsigned long __attribute__((always_inline)) get_ssp(void)
 	_ret;							\
 })
 
+#define SHADOW_STACK_DISABLE() ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)
+#define SHADOW_STACK_ENABLE() ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)
+#define SHADOW_STACK_ENABLE_WRITE() ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)
+
+#else
+
+#define PRCTL(option, arg2, arg3, arg4, arg5)             \
+({                                                        \
+	long _ret;                                        \
+	register long _num  asm("rax") = __NR_prctl;      \
+	register long _arg1 asm("rdi") = (long)(option);  \
+	register long _arg2 asm("rsi") = (long)(arg2);    \
+	register long _arg3 asm("rdx") = (long)(arg3);    \
+	register long _arg4 asm("r10") = (long)(arg4);    \
+	register long _arg5 asm("r8")  = (long)(arg5);    \
+							  \
+	asm volatile (                                    \
+		"syscall"                                 \
+		: "=a"(_ret)                              \
+		: "0"(_num),                              \
+		  "r"(_arg1), "r"(_arg2), "r"(_arg3),     \
+		  "r"(_arg4), "r"(_arg5)                  \
+		: "rcx", "r11", "memory", "cc"            \
+	);                                                \
+	_ret;                                             \
+})
+
+#define SHADOW_STACK_DISABLE() PRCTL(PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0)
+#define SHADOW_STACK_ENABLE() PRCTL(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE, 0, 0, 0)
+#define SHADOW_STACK_ENABLE_WRITE() \
+	PRCTL(PR_SET_SHADOW_STACK_STATUS, PR_SHADOW_STACK_ENABLE|PR_SHADOW_STACK_WRITE, 0, 0, 0)
+
+#endif
+
 void *create_shstk(void *addr)
 {
 	return (void *)syscall(__NR_map_shadow_stack, addr, SS_SIZE, SHADOW_STACK_SET_TOKEN);
@@ -691,7 +726,7 @@ void segv_gp_handler(int signum, siginfo_t *si, void *uc)
 	 * To work with old glibc, this can't rely on siglongjmp working with
 	 * shadow stack enabled, so disable shadow stack before siglongjmp().
 	 */
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	siglongjmp(jmp_buffer, -1);
 }
 
@@ -854,7 +889,7 @@ static int test_uretprobe(void)
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
 
-	ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_ENABLE();
 
 	/*
 	 * This either segfaults and goes through sigsetjmp above
@@ -866,7 +901,7 @@ static int test_uretprobe(void)
 	err = 0;
 
 out:
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	signal(SIGSEGV, SIG_DFL);
 	if (fd)
 		close(fd);
@@ -933,7 +968,7 @@ static int test_uprobe_call(void)
 	if (sigsetjmp(jmp_buffer, 1))
 		goto out;
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK))
+	if (SHADOW_STACK_ENABLE())
 		goto out;
 
 	/*
@@ -946,7 +981,7 @@ static int test_uprobe_call(void)
 	err = 0;
 
 out:
-	ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK);
+	SHADOW_STACK_DISABLE();
 	signal(SIGSEGV, SIG_DFL);
 	if (fd >= 0)
 		close(fd);
@@ -1059,22 +1094,22 @@ int main(int argc, char *argv[])
 {
 	int ret = 0;
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_ENABLE()) {
 		printf("[SKIP]\tCould not enable Shadow stack\n");
 		return 1;
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_DISABLE()) {
 		ret = 1;
 		printf("[FAIL]\tDisabling shadow stack failed\n");
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_ENABLE()) {
 		printf("[SKIP]\tCould not re-enable Shadow stack\n");
 		return 1;
 	}
 
-	if (ARCH_PRCTL(ARCH_SHSTK_ENABLE, ARCH_SHSTK_WRSS)) {
+	if (SHADOW_STACK_ENABLE_WRITE()) {
 		printf("[SKIP]\tCould not enable WRSS\n");
 		ret = 1;
 		goto out;
@@ -1164,7 +1199,7 @@ int main(int argc, char *argv[])
 	 * Disable shadow stack before the function returns, or there will be a
 	 * shadow stack violation.
 	 */
-	if (ARCH_PRCTL(ARCH_SHSTK_DISABLE, ARCH_SHSTK_SHSTK)) {
+	if (SHADOW_STACK_DISABLE()) {
 		ret = 1;
 		printf("[FAIL]\tDisabling shadow stack failed\n");
 	}
diff --git a/tools/testing/selftests/x86/test_shadow_stack_prctl.c b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
new file mode 100644
index 000000000000..9c9e2728a9f9
--- /dev/null
+++ b/tools/testing/selftests/x86/test_shadow_stack_prctl.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#define BUILD_PRCTL 1
+#include "test_shadow_stack.c"
-- 
2.54.0

