Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7698B3A0B1B;
	Tue,  3 Feb 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125849; cv=none; b=uZihzDWmx3UXbEOXKi+eQnFP3yqks9RJPa4GLnhaowRpTaMI8OIrP2790XR0h7l9tZDpqzA6gJgtxwq+DNPg7qkT2MmI8clkbSEG5W0X7JnXtBjt071zhyB6blimEEGHw9zrAgecTUwbTJ/t2s0sZMYvREkNo0NiZXUXmFqsiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125849; c=relaxed/simple;
	bh=YQxSdlMBptSCAi4OE7zpcGcqe2BLz4hSnhdN0B/dG9c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgFblQaIc4gjTIR5oPUXw/+sBVPEJLPWSkdip7BL0MhZ0TybP7+XlyTs85cZMd/hwtATQ/kf6XiEC3Oe3A+G/rjK/MzFRaHM6flptmguvToGGR8/YJeOuy31TckWXOpuneY1mUCA1pZG0/WwlevUz4ZogtWUBynh/T1ZRjcfKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=0w4Ecgax; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="0w4Ecgax"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ons0IhYAi+tEtZUFK+VtoCYghx5q1a+Q3OdvFvSt4HA=;
	b=0w4EcgaxjWXO4fx3WCpCxX5bgqbHY2Orz6MhI0dStAiNMe69vkFa7eMtJkrFlU9OkS/q8CrRd
	G2oyHfRDPxmBgUK5Y1N9uLOBQQCERW6gSillJ9Exev/JzmoBFwO2aCHW3EBRtQSH0BSqPRh4Dka
	tRlr6UdpRmasAjEEiWqInyU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f54DH6SwdzLlwZ;
	Tue,  3 Feb 2026 21:32:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 625C640565;
	Tue,  3 Feb 2026 21:37:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:19 +0800
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
Subject: [PATCH v12 10/13] arm64/ptrace: Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP
Date: Tue, 3 Feb 2026 21:37:25 +0800
Message-ID: <20260203133728.848283-11-ruanjinjie@huawei.com>
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

The generic report_single_step() always returns false if SYSCALL_EMU
is set, but arm64 only checks _TIF_SINGLESTEP and does not check
_TIF_SYSCALL_EMU, which means that if both _TIF_SINGLESTEP and
_TIF_SYSCALL_EMU are set, the generic entry will not report
a single-step, whereas arm64 will do it.

As the man manual of PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP said,
"For PTRACE_SYSEMU, continue and stop on entry to the next system
call, which will not be executed. For PTRACE_SYSEMU_SINGLESTEP, do the
same but also singlestep if not a system call.". And as the generic entry
report_single_step() comment said, If SYSCALL_EMU is set, then the only
reason to report is when SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).
Because this syscall instruction has been already reported
in syscall_trace_enter(), there is no need to report the syscall
again in syscall_exit_work().

In preparation for moving arm64 over to the generic entry code,

- Add report_single_step() helper for arm64 to make it clear.

- Do not report_syscall_exit() if both _TIF_SYSCALL_EMU and
  _TIF_SINGLESTEP set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e68aa386ea48..6e86aec8d607 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2453,14 +2453,25 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	return ret ? : syscall;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 static void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
+	bool step;
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 }
 
-- 
2.34.1

