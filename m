Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB533A0B30;
	Tue,  3 Feb 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125848; cv=none; b=mPFVaxVRUVUbudRIJdTswM7YPx96nim/g8ZQ24kRPN6rLeKN4jbUhRs1GTTuHpNeIPhFWTRDL2+1ZkrhLCLOs1Q9peFZ2mNl6p2DCUcDDrhnJS7wysyw4/YhzxKZVjjAJznrv+Rc1+uIeRsiLWCx1xYLORWztEEdbqdiKdsDnCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125848; c=relaxed/simple;
	bh=UvNiaMJnltxRxeKTIdX1NIIjzyQ9oTkqhvFRd4MkevE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlHmQH35otiRkBSWBf0ggbfI12o/6zfVb39bXfAztsSxceu0WUN7Kl9iyAKUpoAKtwfbv8l3lI5v25etOYbDwIXjNscSvC4PtE4Y2YG0SJQpE8S5+kd+x/uj1EpZwead6AsVu+ia4NFnagHu1XkNGqK5xikuuS4nEHSR4R0xvXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=IlBgGp6F; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="IlBgGp6F"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=elgNqx8q9SSGC3qz/N2mFx9V6p9uKgkkJP1/0OOPjBg=;
	b=IlBgGp6FxoUxRLrGCNjE0de/SNhWoHPDnWfU9mC+1kMA6sg2nmY3TE0USpLgWVnI7oYd7av8p
	zTelKMyrcfNRNutOj9kpTZV4Rrnxt6u52Szbmiy5zOpqtrZ8nhMJkr/OakWqwV5BsOO99ehXRpw
	Uqo61SHK8A6LXJIbeGguYfI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f54D90FFxzmV6s;
	Tue,  3 Feb 2026 21:32:41 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F58240565;
	Tue,  3 Feb 2026 21:37:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:13 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<shuah@kernel.org>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <kevin.brodsky@arm.com>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <anshuman.khandual@arm.com>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<tglx@kernel.org>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 07/13] arm64: ptrace: Move rseq_syscall() before audit_syscall_exit()
Date: Tue, 3 Feb 2026 21:37:22 +0800
Message-ID: <20260203133728.848283-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
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

commit a9f3a74a29af ("entry: Provide generic syscall exit function")
introduce generic syscall exit function and call rseq_syscall()
before audit_syscall_exit() and arch_syscall_exit_tracehook().

And commit b74406f37737 ("arm: Add syscall detection for restartable
sequences") add rseq support for arm32, which also call rseq_syscall()
before audit_syscall_exit() and tracehook_report_syscall().

However, commit 409d5db49867c ("arm64: rseq: Implement backend rseq
calls and select HAVE_RSEQ") implement arm64 rseq and call
rseq_syscall() after audit_syscall_exit() and tracehook_report_syscall().
So compared to the generic entry and arm32 code, arm64 calls
rseq_syscall() a bit later.

But as commit b74406f37737 ("arm: Add syscall detection for restartable
sequences") said, syscalls are not allowed inside restartable sequences,
so should call rseq_syscall() at the very beginning of system call
exiting path for CONFIG_DEBUG_RSEQ=y kernel. This could help us to detect
whether there is a syscall issued inside restartable sequences.

To align the order of the calls with generic entry, move rseq_syscall()
ahead before audit_syscall_exit().

As for the impact of raising SIGSEGV via rseq_syscall(), it makes no
practical difference to signal delivery because signals are processed
in arm64_exit_to_user_mode() at the very end.

As for the "regs", rseq_syscall() only checks and update
instruction_pointer(regs) when CONFIG_DEBUG_RSEQ=y, audit_syscall_exit()
only checks the return value (x0 for arm64), so calling rseq_syscall()
before or after audit syscall exit makes no difference. trace_sys_exit()
only uses syscallno and the return value, so calling rseq_syscall() before
or after trace_sys_exit() makes no difference.

But ptrace can also modify the "pc" on syscall exit path. So when
CONFIG_DEBUG_RSEQ=y, before this patch, rseq could observe the PC
modified by ptrace on the syscall exit path; after this patch, rseq no
longer sees modifications made by ptrace.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e3dcadf13e99..50344a2d7b88 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2455,6 +2455,8 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 {
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2462,8 +2464,6 @@ void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
 
 	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1

