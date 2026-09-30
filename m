Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C113BFAD4;
	Wed, 30 Sep 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763428; cv=none; b=e6nvyPLhhO2z8oKt3fmDUFoY+JFb6sy0271v3xdRLWaCSE6urHhMYAb6Q56QA4rIvK9TGn9wfc9m2w5oyHwRBpbABbjrBV/fv2Qc/0KteRJc1BIlWg+k0m7wdeV8BcpoPib0nADnUFEAwY+2ejmCU5pO/j+wr8pPVZSNFrCtclk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763428; c=relaxed/simple;
	bh=W2jJkXcgp83ghv0I0MYNnL2++0RqcRCMGArnfZq7dzw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEIHNmpD39H3MLQg6FGYvrmB421RDazbCBdsdple24kV+HwEy8Bi7KBV2E/36Ofd7hp412oUMGbm+PP3rgGDCHb9D2pbAofdB3gLB76lANu9L7AMm2h14qVN5oLJ5Mn4V52MuU98FajVSecyeOCPC9S7KPnR6vsUO17LxR7kHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=rIwZyeTP; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="rIwZyeTP"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FQdNtaFgS43hc7aQ3NVSNJzuet2NH5At9H2dDPqqwLM=;
	b=rIwZyeTPGws08CmzLgRBWH9lTvnglqEWnwYGt2N2aaG2IZMFAoN7bIRpS0gVgIbOqLU88Nv8I
	aSx78LyYFGMqpm9KNuCbMR1xameBh8pay9Apu1spyvbzCcZq1dalyylykXY5/1qOqS72Badvlvq
	CKNeGt2pt9r0xAuYb7vOrUA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJf2rySzcb46;
	Wed, 30 Sep 2026 18:05:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F3934057D;
	Wed, 30 Sep 2026 18:16:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:58 +0800
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
Subject: [PATCH v20 05/15] arm64: ptrace: Protect rseq_syscall() from tracer PC modifications
Date: Wed, 30 Sep 2026 18:17:55 +0800
Message-ID: <20260930101805.1770358-6-ruanjinjie@huawei.com>
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

Move the rseq_syscall() check earlier in the syscall exit path to ensure
it operates on the original instruction pointer (regs->pc) before any
potential modification by a tracer.

[Background]
When CONFIG_DEBUG_RSEQ is enabled, rseq_syscall() verifies that a system
call was not executed within an rseq critical section by examining
regs->pc. If a violation is detected, it triggers a SIGSEGV.

[Problem]
Currently, arm64 invokes rseq_syscall() after report_syscall_exit().
However, during report_syscall_exit(), a ptrace tracer can modify the
task's instruction pointer via PTRACE_SETREGSET (with NT_PRSTATUS). This
leads to an inconsistency where rseq may analyze a post-trace PC instead
of the actual PC at the time of syscall exit.

[Why this matters]
The rseq check is intended to validate the execution context of the
syscall itself. Analyzing a tracer-modified PC can lead to incorrect
detection or missed violations. Moving the check earlier ensures rseq
sees the authentic state of the task.

[Alignment]
This change aligns arm64 with:
- Generic entry, which calls rseq_syscall() first.
- arm32 implementation, which also performs the check before audit.

[Impact]
There is no functional change to signal delivery; SIGSEGV will still be
processed in arm64_exit_to_user_mode() at the end of the exit path.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 96c03922baa5..72df4b84ec9a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2513,6 +2513,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2521,8 +2523,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1

