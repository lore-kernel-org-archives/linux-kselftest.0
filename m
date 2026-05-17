Received: from mail-108-mta169.mxroute.com (mail-108-mta169.mxroute.com [136.175.108.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772C03CCFC6
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042953; cv=none; b=qLVCOipRsz6cjfdXtHdy6oR6T+hCRV6XP6hDatFVKK1bfbtB4ir1Os/4nd9zSSYZixpXhZp0qeXKCKZlgoGlL3QhPas060H/nkgZo015WsJqrObRx/DY1EMOjySGrtbkUm3hB4n/hq4cDri+nyAmW7WvOAVtoBFdGJ940G6aJOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042953; c=relaxed/simple;
	bh=xeReBSOSsVkWQnbyMV8OsE+FLzgdoiGUrh7bN9xLWM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/sAz3fGN5neFww1hWGISVSkbUl+rDazXRgoW2XUJN15LRQjl4E/Q8EkykkIukOxVfGwsTfpRc+nbRt+wtBvU0xnd0sWL3Mo6xSXG7qoymrH4Ix+C5jPynzeMzJ7At2VPjL3IrWSBeYEoSZTGzp3Nw4WZ66Gjsmh9YXUJ1wbeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=vveJHAAR reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="vveJHAAR"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta169.mxroute.com (ZoneMTA) with ESMTPSA id 19e37346a3500067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:42 +0000
X-Zone-Loop: fa7cbdc161de12e0cecfc0a4a2ae7090df8456cadd13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oi/FD+FVH2L6lffeDf4O/BKtqSjIgXeeFp6Po4P/CGI=; b=vveJHAARWyqcrfRODc0xyevwml
	TnfGyHeQ8NdmN8GLEoZEqsyDEKGD05QkRcgFd+ZJHP+4PNB+50tWcfGsd7JnQippJXtkKqfspeSHN
	GxvKugF/3fdTXBNtUxeTRtsRd7gvCXVl+FdmJOgGmWg+maIMQqbgniq559VfGiZUc9WFUGzwB4p7b
	x8/akAedXmp8RBkKFREA7deqyibshtDr94eY4ZAfct2jjcsiSxbT7p+ZgDiPJhZwBEZBq9GpDeSRl
	B1N38yO5C6DDiDfePCOkKKObPFEdhF5kORn6n9LhttCUGIcT720XTWAZ6+wRoCiSa0BrXlpSqZfcD
	+XjF2MNg==;
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
Subject: [PATCH 3/7] x86: signal handler support for IBT
Date: Sun, 17 May 2026 13:30:20 -0500
Message-ID: <20260517183024.16292-4-ripatel@wii.dev>
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

Addresses an edge case in usermode IBT with signal handlers.
When entering and exiting signals, the WAIT_FOR_ENDBR CPU state
must be restored. WAIT_FOR_ENDBR is a flag that raises a CET
violation if the next instruction is not endbr64.

If a thread enters a signal handler immediately after executing an
indirect jump (before reaching an endbr64), the WAIT_FOR_ENDBR
would otherwise mistakenly cause a CET violation on the signal
handler's first instruction.

Worse, an attacker could circumvent IBT by triggering a signal
before a vulnerable jump, call rt_sigreturn in that signal, and
then return to the original indirect jump target without endbr64
checking.

Unless FRED is enabled, the WAIT_FOR_ENDBR flag is backed up
from the U_CET MSR. Due to XSAVE, this MSR might be stale in
kernel-mode.

A gap in 32-bit signal handling is resolved in a follow-up commit.

Based-on-patch-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Link: https://lore.kernel.org/lkml/20210820182245.1188-4-yu-cheng.yu@intel.com/
Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/include/asm/ibt.h           | 14 +++++
 arch/x86/include/asm/processor.h     |  5 ++
 arch/x86/include/uapi/asm/ucontext.h |  5 ++
 arch/x86/kernel/Makefile             |  1 +
 arch/x86/kernel/ibt.c                | 88 ++++++++++++++++++++++++++++
 arch/x86/kernel/signal_64.c          |  6 ++
 6 files changed, 119 insertions(+)
 create mode 100644 arch/x86/kernel/ibt.c

diff --git a/arch/x86/include/asm/ibt.h b/arch/x86/include/asm/ibt.h
index 5e45d6424722..3fe464bf83e7 100644
--- a/arch/x86/include/asm/ibt.h
+++ b/arch/x86/include/asm/ibt.h
@@ -114,4 +114,18 @@ static inline void ibt_restore(u64 save) { }
 
 #define ENDBR_INSN_SIZE		(4*HAS_KERNEL_IBT)
 
+#ifndef __ASSEMBLER__
+
+struct pt_regs;
+
+#ifdef CONFIG_X86_USER_IBT
+bool user_ibt_pop_wait_endbr(struct pt_regs *regs);
+void user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr);
+#else
+static inline bool user_ibt_pop_wait_endbr(struct pt_regs *regs) { return false; }
+static inline void user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr) {}
+#endif /* CONFIG_X86_USER_IBT */
+
+#endif /* __ASSEMBLER__ */
+
 #endif /* _ASM_X86_IBT_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 10b5355b323e..6ce8f7b6607c 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -504,6 +504,11 @@ struct thread_struct {
 
 	unsigned int		iopl_warn:1;
 
+#ifdef CONFIG_X86_USER_IBT
+	unsigned int		ibt:1;
+	unsigned int		ibt_locked:1;
+#endif
+
 	/*
 	 * Protection Keys Register for Userspace.  Loaded immediately on
 	 * context switch. Store it in thread_struct to avoid a lookup in
diff --git a/arch/x86/include/uapi/asm/ucontext.h b/arch/x86/include/uapi/asm/ucontext.h
index 5657b7a49f03..0271f5e8aa14 100644
--- a/arch/x86/include/uapi/asm/ucontext.h
+++ b/arch/x86/include/uapi/asm/ucontext.h
@@ -51,6 +51,11 @@
 #define UC_STRICT_RESTORE_SS	0x4
 #endif
 
+/*
+ * Indicates IBT status WAIT_FOR_ENDBR.
+ */
+#define UC_WAIT_ENDBR		0x8
+
 #include <asm-generic/ucontext.h>
 
 #endif /* _ASM_X86_UCONTEXT_H */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 47a32f583930..05c87f014552 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -169,6 +169,7 @@ obj-$(CONFIG_CALL_THUNKS)		+= callthunks.o
 obj-$(CONFIG_X86_CET)			+= cet.o
 
 obj-$(CONFIG_X86_USER_SHADOW_STACK)	+= shstk.o
+obj-$(CONFIG_X86_USER_IBT)		+= ibt.o
 
 ###
 # 64 bit specific files
diff --git a/arch/x86/kernel/ibt.c b/arch/x86/kernel/ibt.c
new file mode 100644
index 000000000000..596b0629106d
--- /dev/null
+++ b/arch/x86/kernel/ibt.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+#include <asm/msr.h>
+#include <asm/fpu/xstate.h>
+
+static bool user_ibt_enabled(struct task_struct *task)
+{
+	return task->thread.ibt;
+}
+
+bool user_ibt_pop_wait_endbr(struct pt_regs *regs)
+{
+	struct fpu *fpu = x86_task_fpu(current);
+	u64 msrval = 0;
+
+	if (!user_ibt_enabled(current))
+		return 0;
+
+#ifdef CONFIG_X86_FRED
+	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
+		msrval = regs->fred_cs.wfe;
+		regs->fred_cs.wfe = 0;
+		return !!msrval;
+	}
+#endif
+
+	fpregs_lock();
+
+	if (!test_thread_flag(TIF_NEED_FPU_LOAD)) {
+		if (!rdmsrq_safe(MSR_IA32_U_CET, &msrval))
+			wrmsrq(MSR_IA32_U_CET, msrval & ~CET_WAIT_ENDBR);
+	} else {
+		struct cet_user_state *cet;
+
+		/*
+		 * If TIF_NEED_FPU_LOAD and get_xsave_addr() returns zero,
+		 * XFEATURE_CET_USER is in init state (cet is not active).
+		 * Return zero status.
+		 */
+		cet = get_xsave_addr(&fpu->fpstate->regs.xsave,
+				     XFEATURE_CET_USER);
+		if (cet) {
+			msrval = cet->user_cet;
+			cet->user_cet = msrval & ~CET_WAIT_ENDBR;
+		}
+	}
+
+	fpregs_unlock();
+
+	return !!(msrval & CET_WAIT_ENDBR);
+}
+
+void
+user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr)
+{
+	struct fpu *fpu = x86_task_fpu(current);
+	u64 msrval = 0;
+
+	if (!user_ibt_enabled(current))
+		return;
+
+#ifdef CONFIG_X86_FRED
+	if (cpu_feature_enabled(X86_FEATURE_FRED)) {
+		regs->fred_cs.wfe = wait_endbr;
+		return;
+	}
+#endif
+
+	if (!wait_endbr)
+		return;
+
+	fpregs_lock();
+
+	if (!test_thread_flag(TIF_NEED_FPU_LOAD)) {
+		if (!rdmsrq_safe(MSR_IA32_U_CET, &msrval))
+			wrmsrq(MSR_IA32_U_CET, msrval | CET_WAIT_ENDBR);
+	} else {
+		struct cet_user_state *cet;
+
+		cet = get_xsave_addr(&fpu->fpstate->regs.xsave,
+				     XFEATURE_CET_USER);
+		if (cet)
+			cet->user_cet |= CET_WAIT_ENDBR;
+	}
+
+	fpregs_unlock();
+}
diff --git a/arch/x86/kernel/signal_64.c b/arch/x86/kernel/signal_64.c
index d483b585c6c6..9f1861540d27 100644
--- a/arch/x86/kernel/signal_64.c
+++ b/arch/x86/kernel/signal_64.c
@@ -14,6 +14,7 @@
 
 #include <asm/ucontext.h>
 #include <asm/fpu/signal.h>
+#include <asm/ibt.h>
 #include <asm/sighandling.h>
 
 #include <asm/syscall.h>
@@ -92,6 +93,8 @@ static bool restore_sigcontext(struct pt_regs *regs,
 	if (unlikely(!(uc_flags & UC_STRICT_RESTORE_SS) && user_64bit_mode(regs)))
 		force_valid_ss(regs);
 
+	user_ibt_restore_wait_endbr(regs, uc_flags & UC_WAIT_ENDBR);
+
 	return fpu__restore_sig((void __user *)sc.fpstate, 0);
 }
 
@@ -158,6 +161,9 @@ static unsigned long frame_uc_flags(struct pt_regs *regs)
 	if (likely(user_64bit_mode(regs)))
 		flags |= UC_STRICT_RESTORE_SS;
 
+	if (user_ibt_pop_wait_endbr(regs))
+		flags |= UC_WAIT_ENDBR;
+
 	return flags;
 }
 
-- 
2.47.3

