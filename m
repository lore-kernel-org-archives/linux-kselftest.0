Received: from mail-108-mta45.mxroute.com (mail-108-mta45.mxroute.com [136.175.108.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25D03C76A0
	for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779042960; cv=none; b=pama8kq87cB/W6JQJAONHqd8J3ofnb3twRzUBw6BYjcA2GWBSj2WpQTwpARDKaEFOpXgSC3dBqAamNioOifigVpBosMcM5J5Qmy5vPu5EnMnNEhiTc6zKLNKp0LSC3yyoUT+iXGUWiSNY+PQHeyMkBhoBZRPHogJP6NxrKB9a7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779042960; c=relaxed/simple;
	bh=nzkSeffIK+gjPwyOs7CPx0rKZ0wFtGra/6Hr/w1xvVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6FXVwUwsjAX+iBx9+aFbWVUTKLvyOPeVacjASrTAA9JKd+osU1sOuOJAW5oQfbecT1zmzV47w8UNlOSkRaiJeu6YX75Ppo+jhsdN+JroW0a0J9aoR4rX1BaVqWG7mHRwm1rsQvuI82m2U9p5wOe1DWpEJYz06We7RPOsphWFxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=fail (0-bit key) header.d=wii.dev header.i=@wii.dev header.b=Id64VS9Q reason="key not found in DNS"; arc=none smtp.client-ip=136.175.108.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=wii.dev header.i=@wii.dev header.b="Id64VS9Q"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta45.mxroute.com (ZoneMTA) with ESMTPSA id 19e37347b6100067f7.00d
 for <linux-kselftest@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 17 May 2026 18:30:46 +0000
X-Zone-Loop: 98577e034c635ef4f0b8e04d158594c172c850e0fc61
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rOYOSG9vWxa4zChVZ2uDWaCD4UCDHihRbzaFMlB+lKE=; b=Id64VS9Qd8ejJVKC/9/9mJrMnT
	ZCcDNhRLr7ch74kS4/j8ebw398JWGxET0ZdK/WTB7g1nrEVIMiCJ6CtqwugdxWsvdPXIz3QvfIFqR
	fyzkLA0KRgxRE1fAW8Z48jDScivfWCVkWyeor+VWUAwUIrdIuuIwLSwKqRhJWHTXnN+Ma9bTOMLhv
	E64CWMN8Y5/4SE+FHmfVDogeljuaQVhZv9KZ74vFbc/UwwottmB9GWfhlU11JRoIlL7E9T7xwS+to
	bNYANXnf9rJTaLnOj1bOHrTNmaWeU4K351QQT7TRjkMGFuh5/o2B6mC5fqiBKC6uWOpDclFtM+LcJ
	j6sVuXSg==;
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
Subject: [PATCH 5/7] x86: expose user IBT via PR_CFI_BRANCH_LANDING_PADS
Date: Sun, 17 May 2026 13:30:22 -0500
Message-ID: <20260517183024.16292-6-ripatel@wii.dev>
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
 arch/x86/include/asm/ibt.h   |  2 +
 arch/x86/kernel/ibt.c        | 87 ++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/process_64.c |  2 +
 3 files changed, 91 insertions(+)

diff --git a/arch/x86/include/asm/ibt.h b/arch/x86/include/asm/ibt.h
index 3fe464bf83e7..a67c9ceaaf9e 100644
--- a/arch/x86/include/asm/ibt.h
+++ b/arch/x86/include/asm/ibt.h
@@ -121,9 +121,11 @@ struct pt_regs;
 #ifdef CONFIG_X86_USER_IBT
 bool user_ibt_pop_wait_endbr(struct pt_regs *regs);
 void user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr);
+void reset_thread_ibt(void);
 #else
 static inline bool user_ibt_pop_wait_endbr(struct pt_regs *regs) { return false; }
 static inline void user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr) {}
+static inline void reset_thread_ibt(void) {}
 #endif /* CONFIG_X86_USER_IBT */
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/x86/kernel/ibt.c b/arch/x86/kernel/ibt.c
index 596b0629106d..343e6fd5dab0 100644
--- a/arch/x86/kernel/ibt.c
+++ b/arch/x86/kernel/ibt.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/types.h>
+#include <linux/cpu.h>
+#include <linux/prctl.h>
 #include <asm/msr.h>
 #include <asm/fpu/xstate.h>
 
@@ -9,6 +11,85 @@ static bool user_ibt_enabled(struct task_struct *task)
 	return task->thread.ibt;
 }
 
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
+	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT) || in_ia32_syscall())
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
+	if (!cpu_feature_enabled(X86_FEATURE_USER_IBT) || in_ia32_syscall())
+		return -EINVAL;
+
+	if (t != current)
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
+	    !user_ibt_enabled(task) ||
+	    in_ia32_syscall())
+		return -EINVAL;
+
+	user_ibt_set_lock(task, true);
+
+	return 0;
+}
+
 bool user_ibt_pop_wait_endbr(struct pt_regs *regs)
 {
 	struct fpu *fpu = x86_task_fpu(current);
@@ -86,3 +167,9 @@ user_ibt_restore_wait_endbr(struct pt_regs *regs, bool wait_endbr)
 
 	fpregs_unlock();
 }
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

