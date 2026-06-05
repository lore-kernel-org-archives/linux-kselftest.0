Received: from mail-108-mta227.mxroute.com (mail-108-mta227.mxroute.com [136.175.108.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7113F4115
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685625; cv=none; b=LozkiHXcEwPB7gN7en8RXdkqg5zf/fbtlHv66uGqSu47TEtpZPP4kv+xUVB9DHiUUd2mJRq+BQhM2j48h2F9nGERhGGkFCQKMN/gJIz0Rg6MjmcyFYvdgPZQlCuv8ddymcMmS9NQXiHcal8neX6Lave2H2pdRDgJF9tXg6DTGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685625; c=relaxed/simple;
	bh=7dF/Jnx0wdxiKwad9kq3Ay0lwkGHxkajtV3MvLcJ5q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ic60Sgcl8VpcVm776JIBqQ6s20NE4uvtYzzH50rxabYismcGC+D5Nmk1B+QIK2HAyGSu+dbI6WEwRaDMLJZBb5XIlDRoksH914OBVokbrYq0+PkXyc8/NbbeUfGCZjD4JA8PC4m5SXzT/DEDb4ywCoOCv8uSiAsq1zYIOkJ6a+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=oGUhd9TM; arc=none smtp.client-ip=136.175.108.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="oGUhd9TM"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta227.mxroute.com (ZoneMTA) with ESMTPSA id 19e991d8f6800067f7.00f
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Jun 2026 18:48:31 +0000
X-Zone-Loop: db0ac47c17b29128e850b1ecbd30ac656be35a855353
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZDXhhuq8nE1DCfiIOEaeZ0HqYW34V80BJ+yWskuv/Z0=; b=oGUhd9TMu7zTssEJT28yWbyMet
	wVda/NKP6QAFXL5ekm+rovvn0wi4QpmWN819qf4lJwsH/+UbuORvY0MwU/Oc880GiyG1HnWPzEFf/
	nE4RWEyRgbzCwo+NL2DuFJrPNTMg/p6ZxiDvGxOTHTEJ5GC8p+/muCTMua50xCuy/eM9Q8OwbaExG
	pV3eA7DwFLt6Zq/+qnnQxX0yRrQ7lvqjC9w0VFrcyW4kkomMZjio+ou6+x2LakiSqufURMEwqJQkx
	P+VWucl2wT0SPvrJNVS/E+ABMYNSYYQBMgCcjXxKZ1tFfTutXe+06WC4rQxVg89Kbc07hR6t/RPNA
	TzzZhy7w==;
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
Subject: [PATCH v2 3/5] x86: expose user IBT via PR_CFI_BRANCH_LANDING_PADS
Date: Fri,  5 Jun 2026 18:47:14 +0000
Message-ID: <20260605184715.3383415-5-ripatel@wii.dev>
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

Allows userspace applications to enable IBT (forward-edge control
flow integrity protection) using the portable PR_CFI prctl API.

The name 'branch landing pads' is RISC-V specific, but the mechanism
is nearly identical in x86.

This setting enables the following MSR_IA32_U_CET bits:
- CET_ENDBR_EN (enforce endbr as indirect branch target)
- CET_NOTRACK_EN (jump modifier to opt-out of IBT checking)

Kernel-mode IBT (as part of CFI) bans notrack. A future prctl flag
could be introduced to ban notrack in usermode too.

Signed-off-by: Richard Patel <ripatel@wii.dev>
---
 arch/x86/include/asm/ibt.h       | 14 +++++
 arch/x86/include/asm/processor.h |  5 ++
 arch/x86/kernel/Makefile         |  1 +
 arch/x86/kernel/ibt.c            | 98 ++++++++++++++++++++++++++++++++
 arch/x86/kernel/process_64.c     |  2 +
 5 files changed, 120 insertions(+)
 create mode 100644 arch/x86/kernel/ibt.c

diff --git a/arch/x86/include/asm/ibt.h b/arch/x86/include/asm/ibt.h
index 5e45d6424722..586e5fadf844 100644
--- a/arch/x86/include/asm/ibt.h
+++ b/arch/x86/include/asm/ibt.h
@@ -114,4 +114,18 @@ static inline void ibt_restore(u64 save) { }
 
 #define ENDBR_INSN_SIZE		(4*HAS_KERNEL_IBT)
 
+#ifndef __ASSEMBLER__
+
+#include <linux/prctl.h>
+
+#define PR_CFI_SUPPORTED_STATUS_MASK (PR_CFI_ENABLE | PR_CFI_DISABLE | PR_CFI_LOCK)
+
+#ifdef CONFIG_X86_USER_IBT
+void reset_thread_ibt(void);
+#else
+static inline void reset_thread_ibt(void) {}
+#endif /* CONFIG_X86_USER_IBT */
+
+#endif /* __ASSEMBLER__ */
+
 #endif /* _ASM_X86_IBT_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 67dd932305db..7fbf10410973 100644
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
index 000000000000..682414fde5a4
--- /dev/null
+++ b/arch/x86/kernel/ibt.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/types.h>
+#include <linux/cpu.h>
+#include <linux/prctl.h>
+#include <asm/msr.h>
+
+static bool user_ibt_enabled(struct task_struct *task)
+{
+	return task->thread.ibt;
+}
+
+static bool user_ibt_locked(struct task_struct *task)
+{
+	return task->thread.ibt_locked;
+}
+
+static void user_ibt_set_lock(struct task_struct *task, bool lock)
+{
+	task->thread.ibt_locked = lock;
+}
+
+static void user_ibt_set_enable(bool enable)
+{
+	u64 msrval;
+
+	/* Already enabled */
+	if (user_ibt_enabled(current) == enable)
+		return;
+
+	current->thread.ibt = !!enable;
+
+	fpregs_lock_and_load();
+	rdmsrq(MSR_IA32_U_CET, msrval);
+	if (enable)
+		msrval |= CET_ENDBR_EN | CET_NO_TRACK_EN;
+	else
+		msrval &= ~(CET_ENDBR_EN | CET_NO_TRACK_EN);
+	msrval &= ~CET_WAIT_ENDBR;
+	wrmsrq(MSR_IA32_U_CET, msrval);
+	fpregs_unlock();
+}
+
+int arch_prctl_get_branch_landing_pad_state(struct task_struct *t,
+					    unsigned long __user *state)
+{
+	unsigned long status = 0;
+
+	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT))
+		return -EINVAL;
+
+	status = (user_ibt_enabled(t) ? PR_CFI_ENABLE : PR_CFI_DISABLE);
+	status |= (user_ibt_locked(t) ? PR_CFI_LOCK : 0);
+
+	return copy_to_user(state, &status, sizeof(status)) ? -EFAULT : 0;
+}
+
+int arch_prctl_set_branch_landing_pad_state(struct task_struct *t, unsigned long state)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT))
+		return -EINVAL;
+
+	if (t != current)
+		return -EINVAL;
+
+	if (state & ~PR_CFI_SUPPORTED_STATUS_MASK)
+		return -EINVAL;
+
+	if (user_ibt_locked(t))
+		return -EINVAL;
+
+	if (!(state & (PR_CFI_ENABLE | PR_CFI_DISABLE)))
+		return -EINVAL;
+
+	if (state & PR_CFI_ENABLE && state & PR_CFI_DISABLE)
+		return -EINVAL;
+
+	user_ibt_set_enable(!!(state & PR_CFI_ENABLE));
+
+	return 0;
+}
+
+int arch_prctl_lock_branch_landing_pad_state(struct task_struct *task)
+{
+	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT) ||
+	    !user_ibt_enabled(task))
+		return -EINVAL;
+
+	user_ibt_set_lock(task, true);
+
+	return 0;
+}
+
+void reset_thread_ibt(void)
+{
+	current->thread.ibt = false;
+	current->thread.ibt_locked = false;
+}
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index b85e715ebb30..4b727cc7bccb 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -59,6 +59,7 @@
 #include <asm/fsgsbase.h>
 #include <asm/fred.h>
 #include <asm/msr.h>
+#include <asm/ibt.h>
 #ifdef CONFIG_IA32_EMULATION
 /* Not included via unistd.h */
 #include <asm/unistd_32_ia32.h>
@@ -540,6 +541,7 @@ start_thread_common(struct pt_regs *regs, unsigned long new_ip,
 	}
 
 	reset_thread_features();
+	reset_thread_ibt();
 
 	loadsegment(fs, 0);
 	loadsegment(es, _ds);
-- 
2.47.3

