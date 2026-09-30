Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C69C409E12;
	Wed, 30 Sep 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763439; cv=none; b=t5SMIBSoYPwYu6EIRGPcdUwjC6mcUrjY+NsEhJ2zavLgKHK/ZkhzfLUDUv3Cq6d0324rpcmqR8INKP17KTL7mfFNRldPknOSzw9o9IpYBEX5D7QgZP0rId+kpVVj2NGwW3f8t2xtoqjGLPo3evzAB2yA5FHVHT/KKzWLuXssrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763439; c=relaxed/simple;
	bh=sRYsCyt6tCruZ7shsJ/kXpJRa4iH6nh1UxO5MJpI8jQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vACP8qYUplepCk+me1P9+jryJhEDENBQkS3HQcteBH6xRQqsc0b2sqR/46FcDmarVHTZWq0yEpiLPMM3S544Z822PvmyfaSCw7jRaoNY+m5bQ4F10Okk/p+psMjLbfu2y/CX634mvSR9qHWeBGfNpHQ3RccLm2m+OALQLbpVbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rIrIfhrW; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rIrIfhrW"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rVhYULiQIiXpvEVgVOH62p6HcckY/rvq8TKnXOWaETw=;
	b=rIrIfhrWY2HJoi4f7DJ9degH0E+/1jXU4nTF3XgMS4rsD4xUK+XJ2bXY8qSGjalo4h+VrAsXk
	8K3UJHD/p2jYoDt4gsM2UOTBw6qMTHieuxsY++GV4nxbdMAczQg6nLqDLVEnw29kMwleUjXvV/G
	koQkzDQ9wwzmPtu2RlRqxRY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ64w47z12LHk;
	Wed, 30 Sep 2026 18:04:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C7F294058C;
	Wed, 30 Sep 2026 18:16:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:55 +0800
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
Subject: [PATCH v20 01/15] arm64: ptrace: Drop redundant pseudo-single-step for SYSEMU_SINGLESTEP
Date: Wed, 30 Sep 2026 18:17:51 +0800
Message-ID: <20260930101805.1770358-2-ruanjinjie@huawei.com>
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

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.

With _TIF_SINGLESTEP set, the arm64 syscall-exit path synthesises a
pseudo-single-step exception:

	ptrace_report_syscall_exit(regs, 1)
	  -> user_single_step_report()
	     -> info.si_signo = SIGTRAP
	     -> info.si_code = SI_USER
	     -> force_sig_info(&info)

But for PTRACE_SYSEMU_SINGLESTEP it is redundant: the stop before
the instruction following the SVC is already delivered by the hardware
single-step state machine, so the tracer ends up with two stops
at the same PC as below:

	sig=133 si_code=133  SS=0  pc=0x400638   [syscall-enter-stop]
	sig=5   si_code=0    SS=0  pc=0x400638   [pseudo-step, dropped here]
	sig=5   si_code=2    SS=1  pc=0x400638   [hardware single-step]

The pseudo-step was added by commit ac2081cdc4d9 ("arm64: ptrace:
Consistently use pseudo-singlestep exceptions") because a ptrace stop
taken while a system call is in progress may corrupt the stepping state.
For an emulated system call that cannot happen, as the call never runs:

- No syscall-exit-stop, because _TIF_SINGLESTEP is set

- No seccomp trap, because syscall_trace_enter() returns NO_SYSCALL
  when SYSCALL_EMU is set, before the seccomp check

- The syscall body is not executed, so nothing can take a stop while it
  is in progress.

Introduce report_single_step(), which returns false when _TIF_SYSCALL_EMU
is set, so the pseudo-step is skipped for the emulated case. This also
matches the generic entry behaviour.

PTRACE_SINGLESTEP and PTRACE_SYSCALL are unaffected:
- PTRACE_SYSCALL: SYSCALL_TRACE is set and _TIF_SINGLESTEP is not, so
  the syscall-exit-stop is reported as before and no pseudo-step is
  involved;

- PTRACE_SINGLESTEP: _TIF_SINGLESTEP is set but _TIF_SYSCALL_EMU is
  not, so the pseudo-step is still synthesised.  It is still needed
  here, because the system call does execute and the hazard described
  above applies.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..96462de75d4b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1

