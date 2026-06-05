Received: from mail-108-mta156.mxroute.com (mail-108-mta156.mxroute.com [136.175.108.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDC3EFFA6
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685635; cv=none; b=uViWLqBVPE5tk3MyiLsV32yvU47to9laMDP/ZF8tBVWiCIOQFNQKCK1CkGSYs2bjXxT1jeXqiHYlILUr7skx8akK0Iqh+Od31m3IiZIjO5+k25oBF1sqW1OiAZ/YmbfeAFbXoia2aPyg1/jtbcQhFpQR5AA5ZIs7qijDZcvxnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685635; c=relaxed/simple;
	bh=+q11RDj3poboSxCnWMW12iGNK14GvewWRyWYUZQmlG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nZZ3qpdiBZQH/lwmh3PEge7X/5xuZSvsg3LJGV/OcfhEhmb0kIauJ9aRruPZVN0A4JcL9Q/1VtDu6XG8DCwyUCkSttvFeOkoMELdluIuLh61ouZdSQFGxGVIMAxT35Bm8BQe8JYLionqyWc5mXYxSijtvwfmB+PDJkpiC7YQG+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=pdZ+6WAC; arc=none smtp.client-ip=136.175.108.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="pdZ+6WAC"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta156.mxroute.com (ZoneMTA) with ESMTPSA id 19e991daf2000067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:39 +0000
X-Zone-Loop: 922222c71a10936ab6c0d849f4acf01f230451b2a0da
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CnvQbV3+nnyIgzzHQcF40GBllpWdxq0XjKnonBw2gVM=; b=pdZ+6WACcoHjKOC7RVf0TqVcw3
	wmFFP+z7FPzjLDeFSBXJ36kWELVbg98fZTtsl45RZBrKgfRRer46qXd4rffJPn4typ6NSQBtlgtNV
	6HuESq3fb8LpUNHM++8jwU82vBahsRONz2w/50G1TS/qP8gendd2JolCXuIP/3gE4pkON4f22PRCv
	nayHrGtaBmjaCtgxzjoCiX6qoU8VJjuB6mRnfR22c+4ZN5cRDf44yzCKbK7LBrEvGa5CtFKN2/YQc
	b680jSXtsQ3zCE//9Af9jHWd9CS55BnkxDu9k0oNw64u08Wz4zXOexmqGPvpoxOLNFh3oMZKUgZgR
	m5kibDIg==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	David Laight <david.laight.linux@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Weimer <fweimer@redhat.com>,
	Richard Patel <ripatel@wii.dev>
Subject: [PATCH v2 5/5] selftests/x86: test usermode IBT
Date: Fri,  5 Jun 2026 18:47:16 +0000
Message-ID: <20260605184715.3383415-7-ripatel@wii.dev>
In-Reply-To: <20260605184715.3383415-2-ripatel@wii.dev>
References: <20260605184715.3383415-2-ripatel@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: ripatel@wii.dev

Adds a basic selftest exercising a usermode IBT violation.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 tools/testing/selftests/x86/Makefile   |   5 +-
 tools/testing/selftests/x86/user_ibt.c | 247 +++++++++++++++++++++++++
 2 files changed, 251 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/x86/user_ibt.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..59f2ba3ec4ea 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -13,7 +13,7 @@ CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh "$(CC)" trivial_program.c -no-pie)
 TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
 			test_vsyscall mov_ss_trap sigtrap_loop \
-			syscall_arg_fault fsgsbase_restore sigaltstack
+			syscall_arg_fault fsgsbase_restore sigaltstack user_ibt
 TARGETS_C_BOTHBITS += nx_stack
 TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
@@ -138,3 +138,6 @@ $(OUTPUT)/avx_64: CFLAGS += -mno-avx -mno-avx512f
 $(OUTPUT)/amx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/avx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/apx_64: EXTRA_FILES += xstate.c
+
+$(OUTPUT)/user_ibt_32: CFLAGS += -fcf-protection=branch
+$(OUTPUT)/user_ibt_64: CFLAGS += -fcf-protection=branch
diff --git a/tools/testing/selftests/x86/user_ibt.c b/tools/testing/selftests/x86/user_ibt.c
new file mode 100644
index 000000000000..b1038e5e5e64
--- /dev/null
+++ b/tools/testing/selftests/x86/user_ibt.c
@@ -0,0 +1,247 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test kernel support for userspace Indirect Branch Tracking (IBT).
+ * Enables IBT manually via prctl(). Must be compiled with
+ * -fcf-protection=branch to enable ENDBR64 instrumentation.
+ */
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <stdint.h>
+#include <sys/signal.h>
+#include <sys/syscall.h>
+#include <sys/mman.h>
+#include <time.h>
+#include <linux/const.h>
+#include <linux/prctl.h>
+#include <ucontext.h>
+#include <unistd.h>
+#include "../kselftest.h"
+
+/*
+ * Allow building this test with old kernel headers.
+ */
+#ifndef PR_SET_CFI
+#define PR_GET_CFI			80
+#define PR_SET_CFI			81
+#endif
+#ifndef PR_CFI_ENABLE
+#define PR_CFI_ENABLE			(1UL << 0)
+#define PR_CFI_DISABLE			(1UL << 1)
+#endif
+#ifndef PR_CFI_BRANCH_LANDING_PADS
+#define PR_CFI_BRANCH_LANDING_PADS	0
+#endif
+#ifndef SEGV_CPERR
+#define SEGV_CPERR			10
+#endif
+
+#if !defined(__CET__) || (__CET__ & 1) != 1
+int main(int argc, char *argv[])
+{
+	ksft_print_header();
+	ksft_exit_skip("Compiler does not support CET.\n");
+	return 0;
+}
+#else
+void __attribute__((naked, aligned(4096))) valid_target(void)
+{
+#ifdef __x86_64__
+	asm volatile("endbr64\n");
+#else
+	asm volatile("endbr32\n");
+#endif
+	asm volatile(
+		"ret\n"
+		".p2align 12\n"
+	);
+}
+
+void __attribute__((nocf_check, naked, aligned(4096))) invalid_target(void)
+{
+	asm volatile(
+		"ret\n"
+		".p2align 12\n"
+	);
+}
+
+void __attribute__((naked)) user_ibt_basic_test(void)
+{
+#ifdef __x86_64__
+	asm volatile(
+		"leaq valid_target(%rip), %rax\n"
+		"call *%rax\n"
+		"ret\n"
+	);
+#else
+	asm volatile(
+		"movl $valid_target, %eax\n"
+		"call *%eax\n"
+		"ret\n"
+	);
+#endif
+}
+
+void __attribute__((naked)) user_ibt_notrack_test(void)
+{
+#ifdef __x86_64__
+	asm volatile (
+		"leaq invalid_target(%rip), %rax\n"
+		"notrack call *%rax\n"
+		"ret\n"
+	);
+#else
+	asm volatile (
+		"movl $invalid_target, %eax\n"
+		"notrack call *%eax\n"
+		"ret\n"
+	);
+#endif
+}
+
+static sigjmp_buf jmpbuf;
+static volatile sig_atomic_t num_segv;
+static volatile sig_atomic_t got_cperr;
+
+static void segv_handler(int signum, siginfo_t *si, void *uc)
+{
+	num_segv++;
+	got_cperr = si->si_code == SEGV_CPERR;
+	siglongjmp(jmpbuf, 1);
+}
+
+int user_ibt_violation_test(void)
+{
+	struct sigaction sa = {};
+	size_t volatile ptr;
+
+	num_segv = 0;
+	got_cperr = false;
+
+	sa.sa_sigaction = segv_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, NULL))
+		return 0;
+
+	if (!sigsetjmp(jmpbuf, 1)) {
+		/*
+		 * Force an indirect call and drop 'nocf_check' attribute.
+		 * Obfuscate cast through a temp local to suppress
+		 * -Wincompatible-pointer-types (which correctly detects
+		 * the nocf_check attribute mismatch)
+		 */
+		ptr = (size_t)invalid_target;
+		((void (* volatile)(void))ptr)();
+		/* Fall through in case this didn't SIGSEGV */
+	}
+
+	signal(SIGSEGV, SIG_DFL);
+
+	return num_segv == 1 && got_cperr;
+}
+
+static int user_ibt_signal_handler(void (*handler)(int, siginfo_t *, void *), bool expect_segv)
+{
+	struct sigaction sa = {};
+	pid_t pid = getpid();
+
+	if (pid < 0)
+		return 0;
+	num_segv = 0;
+	got_cperr = false;
+
+	sa.sa_sigaction = handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGPWR, &sa, NULL))
+		return 0;
+
+	sa.sa_sigaction = segv_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, NULL))
+		return 0;
+
+	if (kill(getpid(), SIGPWR))
+		return 0;
+
+	signal(SIGSEGV, SIG_DFL);
+	signal(SIGPWR, SIG_DFL);
+
+	return 1;
+}
+
+int user_ibt_signal_handler_valid(void)
+{
+	user_ibt_signal_handler((void *)valid_target, false);
+	return num_segv == 0;
+}
+
+bool has_endbr_preamble(void *ptr)
+{
+	const unsigned char *p = ptr;
+
+	if (!(p[0] == 0xf3 && p[1] == 0x0f && p[2] == 0x1e))
+		return false;
+#ifdef __x86_64__
+	return p[3] == 0xfa;
+#else
+	return p[3] == 0xfb;
+#endif
+}
+
+int user_ibt_vdso(void)
+{
+	struct sigaction sa = {};
+	struct timespec ts;
+	int ret = 1;
+
+	sa.sa_sigaction = segv_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, NULL))
+		return 0;
+
+	if (!sigsetjmp(jmpbuf, 1))
+		(void)clock_gettime(CLOCK_REALTIME, &ts);
+	else
+		ret = 0;
+
+	signal(SIGSEGV, SIG_DFL);
+	return ret;
+}
+
+int main(int argc, char *argv[])
+{
+	unsigned long lpad_status = PR_CFI_ENABLE;
+
+	ksft_print_header();
+
+	if (!has_endbr_preamble((void *)printf))
+		ksft_exit_skip("libc does not support IBT (needs -fcf-protection=branch)\n");
+
+	if (syscall(__NR_prctl, PR_SET_CFI, PR_CFI_BRANCH_LANDING_PADS, lpad_status, 0, 0)) {
+		if (errno == EINVAL || errno == EOPNOTSUPP)
+			ksft_exit_skip("User IBT is not supported.\n");
+		ksft_exit_fail_perror("Failed to enable user IBT");
+	}
+
+	ksft_set_plan(5);
+
+	user_ibt_basic_test();
+	ksft_test_result_pass("valid indirect call with endbr64\n");
+
+	user_ibt_notrack_test();
+	ksft_test_result_pass("notrack indirect call to non-endbr target\n");
+
+	ksft_test_result(user_ibt_violation_test(),
+			 "indirect call to non-endbr target raises SIGSEGV\n");
+
+	ksft_test_result(user_ibt_signal_handler_valid(),
+			 "Signal handler sanity check\n");
+
+	ksft_test_result(user_ibt_vdso(), "vDSO supports IBT\n");
+
+	ksft_finished();
+}
+#endif
\ No newline at end of file
-- 
2.47.3

