Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBB215F5C;
	Wed, 28 Jan 2026 03:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570391; cv=none; b=XqId3LYrOqTyHwuY9/OD9tHQHou2CFsb8WOPiTM3GUjkMtCtmp2lUxcuixYmqdCNzxhGEUE94BTA8gjU8PhClYZv0Sy+vBTQ8VhD/87PJEcCBO6KM/P+nQyz396IYtRG1M8IaNXDd78V3vnkz99n1m7jaLI8bU9kowLIKgTC+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570391; c=relaxed/simple;
	bh=hS+YckGAPMNl4dVKocKADkr3qdwqc6Q9ABOz/6yu9X8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tYRg1zFVzoq/DraABR7Xq+bZca3nKewjCuX1MDJqXozWkRjK+HgxPaYunnviDC/IGPW62BjxMvu5MuiVa/IBJ+5SFL+4he86m9wSVUXEnBPB4G3HS0Ny6goYMkE7C87jpOB3n0jGisvjVFRJ8G+piU3gsx/PG8vIEHmSik6YGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=X6eEBa1k; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="X6eEBa1k"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2xXDsBKQ2x++LL5yAUB1F4NfF6P//SX3Tm76tXX8KaQ=;
	b=X6eEBa1kVnbnpx+I2b7gEpDDYBQYsT49EKRZ0gFWrGdi/fXuwRP9MA9t1X2psiYKsi5bow+tH
	QwQnkkoVHMGJk1byNoxh5PThcJH+FkyMTrMRdbkVN4stpFUSVwwOrhluTMJsU1V6R3woB4L3xpE
	p0GsdxjdPXmaROHIM/aH9eI=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f16ql6NvmzLlv9;
	Wed, 28 Jan 2026 11:16:19 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 15E9640563;
	Wed, 28 Jan 2026 11:19:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:45 +0800
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
Subject: [PATCH v11 04/14] arm64: syscall: Rework el0_svc_common()
Date: Wed, 28 Jan 2026 11:19:24 +0800
Message-ID: <20260128031934.3906955-5-ruanjinjie@huawei.com>
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

The generic syscall syscall_exit_work() has the following content:

| audit_syscall_exit(regs)
| trace_sys_exit(regs, ...)
| ptrace_report_syscall_exit(regs, step)

The generic syscall syscall_exit_to_user_mode_work() has
the following form:

| unsigned long work = READ_ONCE(current_thread_info()->syscall_work)
| rseq_syscall()
| if (unlikely(work & SYSCALL_WORK_EXIT))
|	syscall_exit_work(regs, work)

In preparation for moving arm64 over to the generic entry code,
rework el0_svc_common() as below:

- Rename syscall_trace_exit() to syscall_exit_work().

- Add syscall_exit_to_user_mode_work() function to replace
  the combination of read_thread_flags() and syscall_exit_work(),
  also move the syscall exit check logic into it. Move has_syscall_work()
  helper into asm/syscall.h for reuse.

- As currently rseq_syscall() is always called and itself is controlled
  by the CONFIG_DEBUG_RSEQ macro, so the CONFIG_DEBUG_RSEQ check
  is removed.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h |  7 ++++++-
 arch/arm64/kernel/ptrace.c       | 14 +++++++++++---
 arch/arm64/kernel/syscall.c      | 20 +-------------------
 3 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 30b203ef156b..c469d09a7964 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,12 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
+static inline bool has_syscall_work(unsigned long flags)
+{
+	return unlikely(flags & _TIF_SYSCALL_WORK);
+}
+
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
+void syscall_exit_to_user_mode_work(struct pt_regs *regs);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 785280c76317..bf8af5247db4 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2441,10 +2441,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	return syscall;
 }
 
-void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
+static void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
-	rseq_syscall(regs);
-
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2454,6 +2452,16 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 		report_syscall_exit(regs);
 }
 
+void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	rseq_syscall(regs);
+
+	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+		syscall_exit_work(regs, flags);
+}
+
 /*
  * SPSR_ELx bits which are always architecturally RES0 per ARM DDI 0487D.a.
  * We permit userspace to set SSBS (AArch64 bit 12, AArch32 bit 23) which is
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e8fd0d60ab09..66d4da641d97 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -65,11 +65,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	choose_random_kstack_offset(get_random_u16());
 }
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
@@ -130,21 +125,8 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
-	}
-
 trace_exit:
-	flags = read_thread_flags();
-	syscall_trace_exit(regs, flags);
+	syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1

