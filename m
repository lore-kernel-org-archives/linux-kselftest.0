Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16D2330647;
	Wed, 28 Jan 2026 03:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570405; cv=none; b=i59sSvGjKGi3YTGyX5ewoWRIH3eKtR9bGdPtmalqUTsIO0KAxTN9g6hGQk8F/8wtxNBFT5UTLSY8mPC3NP/8szbbDKCtAYvkzg5YmqtJUmQyeCeoYBIdCasj5yfUbsdSC38uuJs9GJz/cKNidNlm38a4tcX7LPqD5IvjC+Nq9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570405; c=relaxed/simple;
	bh=tn5gJ+i1Xio5+dCkuuVV3fbCHOnY3dpOAYi85AZtqDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WyUOBMT80o3e/UxYybdF1GW2kT2bYa08PsFWLH0vUPEz7ZPY84B2qkKmZ3XNLocu2VNT4sA2mL92uEotUi9Z+27NTfDjX/slPgkg0mXtBM9Tm3eZbqi7XQV2zpgYRVVZ+Rb+TD67MFg8XmuuB7oxRupjzDd35EY8kGJgPedKzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Qi5Ru1HY; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Qi5Ru1HY"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=85mBt0QduwqpO7QGjPElOHXbMhe3TMreeJIvwehl/3o=;
	b=Qi5Ru1HY0U1y9qnr6Cyp0ktn1pyOnjOGuBB/KAVivk9Vg4kdXuDBOJSBTPuBx9yvx73ARu/UE
	7EIBFnwoqunycZWnG/FOgQL+MGrRbrFG7n0qI2A/l9tobRsNDgvKBgHWOWZFHiE/Gm5W8qwi9wn
	ionzW012VnqooAzU2iQDAfY=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4f16qz32Pmz1K974;
	Wed, 28 Jan 2026 11:16:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 3852D40563;
	Wed, 28 Jan 2026 11:19:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 10/14] entry: Add arch_ptrace_report_syscall_entry/exit()
Date: Wed, 28 Jan 2026 11:19:30 +0800
Message-ID: <20260128031934.3906955-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Differ from generic entry, due to historical reasons, ARM64 need to
save/restore during syscall entry/exit because ARM64 use a scratch
register (ip(r12) on AArch32, x7 on AArch64) to denote syscall entry/exit.

In preparation for moving arm64 over to the generic entry code,
add arch_ptrace_report_syscall_entry/exit() as the default
ptrace_report_syscall_entry/exit() implementation. This allows
arm64 to implement the architecture specific version.

This allows arm64 to implement the architecture specific version.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Suggested-by: Mark Rutland <mark.rutland@arm.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h  | 39 +++++++++++++++++++++++++++++++++++
 kernel/entry/syscall-common.c |  4 ++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index c4fea642d931..48bdde74a3e1 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -45,6 +45,25 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
+/**
+ * arch_ptrace_report_syscall_entry - Architecture specific
+ *				      ptrace_report_syscall_entry().
+ *
+ * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
+ * Defaults to ptrace_report_syscall_entry.
+ *
+ * The main purpose is to support arch-specific ptrace_report_syscall_entry()
+ * implementation.
+ */
+static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
+
+#ifndef arch_ptrace_report_syscall_entry
+static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
+{
+	return ptrace_report_syscall_entry(regs);
+}
+#endif
+
 long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
 
 /**
@@ -112,6 +131,26 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
 	return ret;
 }
 
+/**
+ * arch_ptrace_report_syscall_exit - Architecture specific
+ *				     ptrace_report_syscall_exit.
+ *
+ * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
+ *
+ * The main purpose is to support arch-specific ptrace_report_syscall_exit
+ * implementation.
+ */
+static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
+							    int step);
+
+#ifndef arch_ptrace_report_syscall_exit
+static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
+							    int step)
+{
+	ptrace_report_syscall_exit(regs, step);
+}
+#endif
+
 /**
  * syscall_exit_work - Handle work before returning to user mode
  * @regs:	Pointer to current pt_regs
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index e6237b536d8b..bb5f61f5629d 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -33,7 +33,7 @@ long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
 
 	/* Handle ptrace */
 	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
-		ret = ptrace_report_syscall_entry(regs);
+		ret = arch_ptrace_report_syscall_entry(regs);
 		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
 			return -1L;
 	}
@@ -99,5 +99,5 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work)
 
 	step = report_single_step(work);
 	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
-		ptrace_report_syscall_exit(regs, step);
+		arch_ptrace_report_syscall_exit(regs, step);
 }
-- 
2.34.1

