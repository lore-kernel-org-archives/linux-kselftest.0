Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E17404BE3;
	Wed, 30 Sep 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763435; cv=none; b=GtpOGVdnwpSIASWh6xpSXyFOQLqPdMzzSGivrtDh6a2NPkidRPymgd2jgbtoOJiN/KwiMahCdJpgguz7TJEwPOkNYiSkIU7iTWCJeNFZE9Tto5cibZGZXYPcAmeOyIorftF4TqTEvELJcvxEp5N3TqP/31+Hwk6AdSOuOZ9FblE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763435; c=relaxed/simple;
	bh=tUCBhStOIQ+SWscy5Ep4APA8kmtRgLV+063EXu06yUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dtd8nPsg6LxAST0frxfE+I8gyHFRyfgOQZaD+CxKApZ1L2pEYUzSBbSZ2e39SQg5mlmna9WXl1KAH1awrxsWchrMkN5059pknqfxOmchdIq7vMtCTNtlA4HDLzfWb9/ruAyFuaETacfQWI+MiU6S2No8U52b4RpDKxV5fP9/BO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=vfZIExNY; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="vfZIExNY"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gu9Cqb8vFUNHkJKouKY2FveVDWk/CQI/ohxkO/UXILg=;
	b=vfZIExNYA01nh0ujAyUDCWi6MNhafI5QgEC4HIodELJbXBH35Xb2R8yfC/OUUab9u/LTqEyxI
	/gb4PKsE8LyosCc5ejzPrjr8mWXl/ENrCNmOS5PPdFn0I51mCQX6PFr0tTUSr1GdNQwSJnsDFAi
	3Q4FMPOIX1UZst0IL6NgZbA=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ260sNz1prl2;
	Wed, 30 Sep 2026 18:04:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3700720104;
	Wed, 30 Sep 2026 18:17:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 09/15] arm64: ptrace: Align syscall exit work semantics with generic entry
Date: Wed, 30 Sep 2026 18:17:59 +0800
Message-ID: <20260930101805.1770358-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Refactor the syscall exit path to better match the generic entry
framework. Specifically:

- Introduce `_TIF_SYSCALL_EXIT_WORK` to aggregate exit-time thread
  flags (trace, audit, tracepoint).

- Rename `syscall_trace_exit()` to `arm64_syscall_exit_work()` to
  better reflect its role.

- Move `rseq_syscall()` out of `arm64_syscall_exit_work()` and into
  `arm64_syscall_exit_to_user_mode_work()` so that it runs
  unconditionally on all exits, consistent with generic entry.

- Gate `arm64_syscall_exit_work()` behind the new flag check,
  mirroring the generic entry exit's pattern.

Gating audit on `_TIF_SYSCALL_AUDIT` is equivalent to the previous
`audit_context()` check: the audit context and flag are statically
allocated at fork and freed at exit, remaining stable throughout
syscall execution.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h     | 8 ++++++--
 arch/arm64/include/asm/thread_info.h | 3 +++
 arch/arm64/kernel/ptrace.c           | 5 +----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 3e4672ab4a4f..7cc872fde019 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -8,6 +8,7 @@
 #include <uapi/linux/audit.h>
 #include <linux/compat.h>
 #include <linux/err.h>
+#include <linux/rseq.h>
 
 typedef long (*syscall_fn_t)(const struct pt_regs *regs);
 
@@ -121,13 +122,16 @@ static inline int syscall_get_arch(struct task_struct *task)
 }
 
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 
-	syscall_trace_exit(regs, flags);
+	rseq_syscall(regs);
+
+	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
+		arm64_syscall_exit_work(regs, flags);
 }
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 5d7fe3e153c8..56a2c9426a32 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -112,6 +112,9 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
 
+#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SYSCALL_TRACEPOINT)
+
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ac90b05dbd11..610a79c1072b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -28,7 +28,6 @@
 #include <linux/hw_breakpoint.h>
 #include <linux/regset.h>
 #include <linux/elf.h>
-#include <linux/rseq.h>
 
 #include <asm/compat.h>
 #include <asm/cpufeature.h>
@@ -2507,12 +2506,10 @@ static inline bool report_single_step(unsigned long flags)
 	return flags & _TIF_SINGLESTEP;
 }
 
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
+void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
 	bool step;
 
-	rseq_syscall(regs);
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
-- 
2.34.1

