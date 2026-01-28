Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7B32E12E;
	Wed, 28 Jan 2026 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570392; cv=none; b=WdqErraAt9tiWUo97nKH9IR2AcBCTQ/Ky7RaIRYNtaSUq9geofe+aVTBuWPOMsc4x6xYjgX7XLNa3MuP4ktBkHG/3NyAwxWuyXypn4iIw1m6EnZsl0LuIGOP0fM3Jsva6jikDRn4z2jPQi1eUUfkzOPji2CfeOJHu1cHfeuH418=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570392; c=relaxed/simple;
	bh=5RG6betf6JJ2sZ/H2Y0C5K8szdTGncGvPVtzOyG9eq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O88fj1Sz48MtpQTgnj9O1+EgyQ8FqVgsAMcL13YOR+ABVFe/5Yx3ar5u1tKc7FWwloLYKqdBS9LnPnb+7czOLpfO9A3I/7UK6/J4zZBGZ9FHD3SkbXj9rTE+4i6MKb8mEe+LK4BsogJM2uYEskERY6xsNgNrt+de5h0idlaUqOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=FmKNX9a2; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="FmKNX9a2"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eMYoVUreRtbJVgDDXvPW6ErcnIr43ieYFt9foGlGR44=;
	b=FmKNX9a2dfPNnhrkMtKHaKp88iAWjtttTwcTU2gvTy4PhbfTqi1cby0oYc01WXdjB7DrvhCcA
	ChCieyiM5p4xPY6CVwoOfPxSQ4JrfluQbLBiSVeqXZNjrsXI4Q+l4Sb5v/0XYIC1psbtX0KgcPD
	T9LUMbmTXZ3d7dO8oSguz5M=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f16qG4jmfznTVF;
	Wed, 28 Jan 2026 11:15:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B1BD24048B;
	Wed, 28 Jan 2026 11:19:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:46 +0800
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
Subject: [PATCH v11 05/14] arm64/ptrace: Not check _TIF_SECCOMP/SYSCALL_EMU for syscall_exit_work()
Date: Wed, 28 Jan 2026 11:19:25 +0800
Message-ID: <20260128031934.3906955-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

As syscall_exit_work() do not handle seccomp, so not check _TIF_SECCOMP
for syscall_exit_work().

And as the man manual of PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP
said, "For PTRACE_SYSEMU, continue and stop on entry to the next system
call, which will not be executed. For PTRACE_SYSEMU_SINGLESTEP, do the same
but also singlestep if not a system call.". So only the syscall entry need
to be reported for SYSCALL_EMU, so not check _TIF_SYSCALL_EMU for
syscall_exit_work().

After this, audit_syscall_exit() and report_syscall_exit() will
no longer be called if only SECCOMP and/or SYSCALL_EMU is set.

And remove has_syscall_work() by the way as currently it is only used in
el0_svc_common().

This is another preparation for moving arm64 over to the generic
entry code.

Link：https://man7.org/linux/man-pages/man2/ptrace.2.html
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h     | 5 -----
 arch/arm64/include/asm/thread_info.h | 3 +++
 arch/arm64/kernel/ptrace.c           | 2 +-
 arch/arm64/kernel/syscall.c          | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index c469d09a7964..dea392c081ca 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,11 +120,6 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_exit_to_user_mode_work(struct pt_regs *regs);
 
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index 24fcd6adaa33..ef1462b9b00b 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -110,6 +110,9 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
 
+#define _TIF_SYSCALL_EXIT_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
+				 _TIF_SYSCALL_TRACEPOINT)
+
 #ifdef CONFIG_SHADOW_CALL_STACK
 #define INIT_SCS							\
 	.scs_base	= init_shadow_call_stack,			\
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index bf8af5247db4..ec30a23e7e93 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2458,7 +2458,7 @@ void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 
 	rseq_syscall(regs);
 
-	if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
 		syscall_exit_work(regs, flags);
 }
 
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 66d4da641d97..ec478fc37a9f 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -101,7 +101,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (has_syscall_work(flags)) {
+	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
-- 
2.34.1

