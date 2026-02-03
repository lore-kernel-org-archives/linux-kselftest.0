Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D4339E197;
	Tue,  3 Feb 2026 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125837; cv=none; b=aeuUchoOf0M9IjtqKprMew9a2BepMfSv2ohc8n7qsk8xOIf/v1DwdVCKBWfV2gcDfnzYjAVEareOoBm8ta4I5boEgZk03ye73QbnTqKVwdFdTvnSMkLHepHPjLIn7GvHzMcTl3BU67x+6bj3wUf95CkHii/FIRGLjSNzMnMInEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125837; c=relaxed/simple;
	bh=JwuHP1sq3T4XAte3CiA8By9Pb6Zy34PlS5pERchEBYU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qcrsIsC1JdYJeDQ5LL2nZ5bY1qss1WIMWnN8fWgVnTsEKfbTqqB6LZotvjaOUxsyKzabsjtRxgPIvzCV9eDNHuik7t164M3Zgmjhavg2xCoDuFjcH2fpVmeOXliS7dk7kp2w5TVipynfsh9eeFhMCMW3TdMaFG2ljAw76X41gKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1HsPy7IV; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=1HsPy7IV; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1HsPy7IV";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="1HsPy7IV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=afh8FvCb9EHKgkE+4+/25vww4aVm2AkzGm6S3B5KCYc=;
	b=1HsPy7IVGWvtySLu6kgJfWHKRZwiFzVZFbT10zodPsiC9sAPlouCKf2Cv82vRYDHpvzHGBOvI
	mF34Io2lM1QzY+QbJkoK8wftipvuBjkT7L3uZJwebReX/BVYcwTMPiHXelzDaFQtgRDREzJEg5J
	LKT9D4K/Hn6x9hfhM/T4nB0=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f54JX5WWjz1BG3p;
	Tue,  3 Feb 2026 21:36:28 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=afh8FvCb9EHKgkE+4+/25vww4aVm2AkzGm6S3B5KCYc=;
	b=1HsPy7IVGWvtySLu6kgJfWHKRZwiFzVZFbT10zodPsiC9sAPlouCKf2Cv82vRYDHpvzHGBOvI
	mF34Io2lM1QzY+QbJkoK8wftipvuBjkT7L3uZJwebReX/BVYcwTMPiHXelzDaFQtgRDREzJEg5J
	LKT9D4K/Hn6x9hfhM/T4nB0=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f54DG4JKBz1T4Lx;
	Tue,  3 Feb 2026 21:32:46 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CCD2C4056A;
	Tue,  3 Feb 2026 21:37:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:05 +0800
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
Subject: [PATCH v12 03/13] arm64/ptrace: Return early for ptrace_report_syscall_entry() error
Date: Tue, 3 Feb 2026 21:37:18 +0800
Message-ID: <20260203133728.848283-4-ruanjinjie@huawei.com>
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

The generic entry abort the syscall_trace_enter() sequence if
ptrace_report_syscall_entry() errors out, but arm64 not.

When ptrace requests interception, it should prevent all subsequent
system-call processing, including audit and seccomp. In preparation for
moving arm64 over to the generic entry code, return early if
ptrace_report_syscall_entry() encounters an error.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 03fe2f8a4d54..f333791ffba6 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2372,15 +2372,18 @@ static __always_inline unsigned long ptrace_save_reg(struct pt_regs *regs,
 	return saved_reg;
 }
 
-static void report_syscall_entry(struct pt_regs *regs)
+static int report_syscall_entry(struct pt_regs *regs)
 {
 	unsigned long saved_reg;
-	int regno;
+	int regno, ret;
 
 	saved_reg = ptrace_save_reg(regs, PTRACE_SYSCALL_ENTER, &regno);
-	if (ptrace_report_syscall_entry(regs))
+	ret = ptrace_report_syscall_entry(regs);
+	if (ret)
 		forget_syscall(regs);
 	regs->regs[regno] = saved_reg;
+
+	return ret;
 }
 
 static void report_syscall_exit(struct pt_regs *regs)
@@ -2407,10 +2410,11 @@ static void report_syscall_exit(struct pt_regs *regs)
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
-		report_syscall_entry(regs);
-		if (flags & _TIF_SYSCALL_EMU)
+		ret = report_syscall_entry(regs);
+		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
 	}
 
-- 
2.34.1

