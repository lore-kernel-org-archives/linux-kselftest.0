Received: from mail-108-mta140.mxroute.com (mail-108-mta140.mxroute.com [136.175.108.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B093CEBA6
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042963; cv=none; b=rzVHTZLKjr9izFe+fO11CjIs4e+Dmpd+KBPdGH5gmkbD9JU/2P9JapEUqzLPCKcxsvIg6/2j7M7EREqcZKtRzy4PBsGs430qSL47Jgnuby05UCO5hmimLupCXjJqBwDquBidAg0oDBCORzjgux7qg1O0QSuSkanXVPZBQsG9Rb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042963; c=relaxed/simple;
	bh=qe8/roO65A2VoZ78Z1QRgHVD8L+p2JrGkAE7QP5GbbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFN/XALAYcK/MTznOG/DM33J0YH+vklVqm6FQb+86X71PS/fnRG6bsqIccc1A8QQLXGi+6jSnd4hBIxPGujTf0VCTjXkoZXmEjvYKgyblWcLwBMNJ8bmgxthAmgH+Gh7c/Dj83Xmp2M4Je8P9859B8/Yt2zUS3Pna5EaVPLd7oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=deq7JJoH reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="deq7JJoH"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta140.mxroute.com (ZoneMTA) with ESMTPSA id 19e3734892800067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:50 +0000
X-Zone-Loop: 497ce8a15b7d4d944d87d9393e1cf4e1f29946bf2161
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=O3MajR2UHTB7tELzpgwInX/+mjytSwXsndvBgFS7uhw=; b=deq7JJoHk5ZITIV0eUqmpRtNFO
	UhvqKUzSPnyAmhskyyLPSMndgQZIwuBWs1NGXQIC+XYL8LFBQszNh8Mt8DVRDX6XNGXJ9IOsaZrdy
	OefiRgVXmYyyL4K4FVbkz/TlMqVjm6vnFV6oc6//ZG48k1O7/Acbu9fFHpC8Xg93wWVhbGvsG6icn
	sstg99O/jTO2COyqe9RY/lODgrsE/68Y1vgwVSskNX/I12pJk8bXoZ5J5zv4tpjDl+QWSziGV0t2U
	oMxXwfpivipCygX/SlB91uT0p8GNoMvAvfQYL/nCK9pBJ60JTsf3LuVpAlDsHuiNbCzNYuTXHJAce
	dZ78ZS9A==;
From: Richard Patel <ripatel@wii.dev>
To: x86@kernel.org
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] selftests/x86: test usermode IBT
Date: Sun, 17 May 2026 13:30:24 -0500
Message-ID: <20260517183024.16292-8-ripatel@wii.dev>
In-Reply-To: <20260517183024.16292-1-ripatel@wii.dev>
References: <20260517183024.16292-1-ripatel@wii.dev>
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
 tools/testing/selftests/x86/user_ibt.c | 157 +++++++++++++++++++++++++
 2 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/x86/user_ibt.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..203c3d9073f2 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			user_ibt
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
@@ -138,3 +139,5 @@ $(OUTPUT)/avx_64: CFLAGS += -mno-avx -mno-avx512f
 $(OUTPUT)/amx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/avx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/apx_64: EXTRA_FILES += xstate.c
+
+$(OUTPUT)/user_ibt_64: CFLAGS += -fcf-protection=branch
diff --git a/tools/testing/selftests/x86/user_ibt.c b/tools/testing/selftests/x86/user_ibt.c
new file mode 100644
index 000000000000..795011503335
--- /dev/null
+++ b/tools/testing/selftests/x86/user_ibt.c
@@ -0,0 +1,157 @@
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
+#include <sys/signal.h>
+#include <sys/syscall.h>
+#include <linux/const.h>
+#include <linux/prctl.h>
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
+void __attribute__((naked)) valid_target(void)
+{
+	asm volatile (
+		"endbr64\n"
+		"ret\n"
+	);
+}
+
+void __attribute__((nocf_check, naked)) invalid_target(void)
+{
+	asm volatile ("ret\n");
+}
+
+void __attribute__((naked)) user_ibt_basic_test(void)
+{
+	asm volatile (
+		"leaq valid_target(%rip), %rax\n"
+		"call *%rax\n"
+		"ret\n"
+	);
+}
+
+void __attribute__((naked)) user_ibt_notrack_test(void)
+{
+	asm volatile (
+		"leaq invalid_target(%rip), %rax\n"
+		"notrack call *%rax\n"
+		"ret\n"
+	);
+}
+
+static sigjmp_buf jmpbuf;
+static sig_atomic_t got_signal;
+static sig_atomic_t got_cperr;
+
+static void segv_handler(int signum, siginfo_t *si, void *uc)
+{
+	got_signal = true;
+	got_cperr = si->si_code == SEGV_CPERR;
+	siglongjmp(jmpbuf, 1);
+}
+
+int user_ibt_violation_test(void)
+{
+	struct sigaction sa = {};
+	struct sigaction oldsa;
+	size_t volatile ptr;
+
+	got_signal = false;
+	got_cperr = false;
+
+	sa.sa_sigaction = segv_handler;
+	sa.sa_flags = SA_SIGINFO;
+	if (sigaction(SIGSEGV, &sa, &oldsa)) {
+		ksft_perror("SIGSEGV handler setup failed");
+		return 1;
+	}
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
+	if (sigaction(SIGSEGV, &oldsa, NULL)) {
+		ksft_perror("SIGSEGV handler restore failed");
+		return 1;
+	}
+
+	if (!got_signal) {
+		ksft_print_msg("IBT violation did not generate SIGSEGV\n");
+		return 1;
+	}
+	if (!got_cperr) {
+		ksft_print_msg("IBT violation generated unknown segfault\n");
+		return 1;
+	}
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	unsigned long lpad_status = PR_CFI_ENABLE;
+
+	ksft_print_header();
+	ksft_set_plan(3);
+
+	if (syscall(__NR_prctl, PR_SET_CFI, PR_CFI_BRANCH_LANDING_PADS, lpad_status, 0, 0)) {
+		if (errno == EINVAL || errno == EOPNOTSUPP)
+			ksft_exit_skip("User IBT is not supported.\n");
+		ksft_exit_fail_perror("Failed to enable user IBT");
+	}
+
+	user_ibt_basic_test();
+	ksft_test_result_pass("valid indirect call with endbr64\n");
+
+	user_ibt_notrack_test();
+	ksft_test_result_pass("notrack indirect call to non-endbr target\n");
+
+	ksft_test_result(!user_ibt_violation_test(),
+			 "indirect call to non-endbr target raises SIGSEGV\n");
+
+	ksft_finished();
+}
+#endif
-- 
2.47.3

