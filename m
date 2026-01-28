Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38C283FDF;
	Wed, 28 Jan 2026 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570403; cv=none; b=gAMCyv/GJ/CBsnp2ZcaSAFDRnEthsSDuGGKjbtk5yrTmwUhy1F7Dl1JRcuRW7F7lNveTWOuOeJVUf00T1DqBKbbmnR4/QNp+VMHRC830uOBilo+YcFcNeY0EuMZ6nm4Ls4WRuZIe/hwDyZauVmxc7QrtH53HT+b2uxwivL/2Mb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570403; c=relaxed/simple;
	bh=WhDz4htPQ5sloRPlm8a4kSNl0K3f+Kgfpds6UiOXO1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFGiOuhczOfdcXuXS5GY9q0Ht1sblHM6CxHrYw+eJVzqugZFBZaRl/kLwRGtK7P9yrartGvIolb0wqibSeSd19rDkdco3ygWDYzRtrp9U7w6nUCQMqh7KiC6TzhgLotvIIegy+XY65E0wx6C5Ybt9VzgXu+qiG/J6XLtBQGFJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Smzps4P7; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Smzps4P7; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Smzps4P7";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Smzps4P7"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=54KpUEZEcGyKnoDqPWEAKzRGztaCb6owc5LMSEBt5iY=;
	b=Smzps4P7IUQYNQmi/5Z7VIiaOUeD1PBZ8fpBSIY9oIAT2+0EOFGEviVghegFO9J7znlULaYUZ
	f3SOfE+64WvRb+3E0BnH+z8+ndQX5NvV7o0nDbgUPqIRwmHi5zwlZDNvH/hapapZRowlLbXauuT
	w1uO9pl+j1+EYuvaswnTk/g=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f16vM4V5zz1BGMM;
	Wed, 28 Jan 2026 11:19:27 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=54KpUEZEcGyKnoDqPWEAKzRGztaCb6owc5LMSEBt5iY=;
	b=Smzps4P7IUQYNQmi/5Z7VIiaOUeD1PBZ8fpBSIY9oIAT2+0EOFGEviVghegFO9J7znlULaYUZ
	f3SOfE+64WvRb+3E0BnH+z8+ndQX5NvV7o0nDbgUPqIRwmHi5zwlZDNvH/hapapZRowlLbXauuT
	w1uO9pl+j1+EYuvaswnTk/g=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f16py1prHz1T4gP;
	Wed, 28 Jan 2026 11:15:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 688752025E;
	Wed, 28 Jan 2026 11:19:50 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:48 +0800
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
Subject: [PATCH v11 06/14] arm64/ptrace: Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP
Date: Wed, 28 Jan 2026 11:19:26 +0800
Message-ID: <20260128031934.3906955-7-ruanjinjie@huawei.com>
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
index ec30a23e7e93..cc2bac9c95d6 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2441,14 +2441,25 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	return syscall;
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

