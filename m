Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680331;
	b=WznpfLNHMIbroJfHGImrUNhk/XwHZvmkncC+Oaik9IO5sEE9cesfaEHSREB5O+sLew+2
	 ZAhw5sXz/5AGKlWFMpD1FmTdZ5o0a99odiAwbzWLmWxhtLBvCkV10dypO3/aa2yym/mRD
	 X182omkcfJEybiw/QoCPtRB+VSqT86xO4gQ/CBT5GVlKcKqGbBhnz5x22OMSTPsDWJ+R9
	 rb7Nz/kNZgtsIcirN61MXtNvkvTgMhQgfq6tQVphQZDe0UzXJeCYBjyXJKND5zMDT+7bb
	 NW1NDiitLo4dPCq/PAtTT88a1wGuEwciNVb0es2nHFXLIS+jz9ReZEhOcLaQGvgep0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680331;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=8Z15m+NbNiZQiSnpZp29G5Mqn1yjW1kGCZAqukJTahE=;
	b=CR7L0mScih/49b79E14CHJNrlKTS8JEhDRyKy63DJYHx5BQtcRqJOKPSocmLWlSQwDW8
	 oux2Fk94WrLaMvSNNsRt5R8GImwKrUBuDFLccO125xjHqbonmqBhud4gtbuaur9rSW6M4
	 AfC5YX3U8CxD1mDVf8I9ogJ/yy8fBR9WLQKqvfavt/VICppifH5q4o6+ORwAJVab9YpBL
	 tbWLaqhl5CgWJpjsiHdrBJv7sKQRF+vPCd2muTTyehKWnANQuGiv/n8XkI97iWi3zEfJB
	 ShJYB8EP86tuQ3sOdbyJrs7Drqldups1gzP4Om530yumff+aYEOa/2hHCGj2ty+Qw/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="ZJgs/J6y";
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FA4606A321;
	Thu, 26 Nov 2026 08:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49FA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ZJgs/J6y
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8Z15m+NbNiZQiSnpZp29G5Mqn1yjW1kGCZAqukJTahE=;
	b=ZJgs/J6ySKZ7kivw/bNsrZv9YfSOpa1dxfURcrD/y/U+BbkZ21lhEoMSzKtQzH2A50BhzA6KE
	OCkWEPr+wX16bDinL1RDNPjJ9cfqiXWrQ/6JCADg/tUn67HGXqZZb1wOx/xRKdabF6Mmsemf5x1
	bNXZXCS7YvEjX9u6UqjBooI=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jZpxY2NHtzRhQT;
	Thu, 26 Nov 2026 16:05:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9042C4056E;
	Thu, 26 Nov 2026 16:05:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:23 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/3] arm64: ptrace: Fix spurious pseudo-single-step for PTRACE_SYSEMU_SINGLESTEP
Date: Thu, 26 Nov 2026 16:05:12 +0800
Message-ID: <20261126080514.1523978-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126080514.1523978-1-ruanjinjie@huawei.com>
References: <20261126080514.1523978-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
Since commit ac2081cdc4d99 ("arm64: ptrace: Consistently use
pseudo-singlestep exceptions"), syscall_trace_exit() injects a
pseudo-single-step SIGTRAP (si_code SI_USER) whenever _TIF_SINGLESTEP is
set, including for an emulated system call.

That pseudo-step was added for PTRACE_SINGLESTEP: the system call runs,
and the tracer must get a stop at the return address to inspect the
result. An emulated system call does not run, and its syscall-enter-stop
already reports the SVC, as the x86 implementation and generic entry
(report_single_step()) both say. The extra stop is wrong:

1) Stepping armed before the SVC (the normal case). The SVC exception
   leaves the step pending (SPSR_EL1.SS is 0, Arm ARM D2.11.5.1), so the
   hardware step is taken at the return address anyway, and the tracer
   now stops there twice without the tracee executing anything:

	syscall-enter-stop  pc=L
	pseudo-step         pc=L    si_code=SI_USER  <- added by that commit
	hardware step       pc=L    si_code=TRAP_TRACE
	hardware step       pc=L+4

2) Stepping armed after the SVC, e.g. a tracer resuming a
   PTRACE_EVENT_SECCOMP stop with PTRACE_SYSEMU_SINGLESTEP. The first
   stop is the pseudo-step at L, so the instruction at L is not
   executed before the step is reported. Before that commit, and on
   x86, the first stop follows the instruction at L.

Skip the pseudo-step when _TIF_SYSCALL_EMU is set, as generic entry
does. The behaviour of PTRACE_SYSEMU_SINGLESTEP goes back to what it was
before that commit. PTRACE_SINGLESTEP is unaffected and still gets the
pseudo-step, so both problems fixed by that commit stay fixed.

Only tracers using PTRACE_SYSEMU_SINGLESTEP see the difference. Measured
in QEMU, L is the instruction after the SVC:

  case          before that commit   v7.4-rc1      this patch
  normal        L, L+4               L, L, L+4     L, L+4
  after seccomp L+4                  L             L+4

Fixes: ac2081cdc4d99 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 6a0b3a9b6125..07c80ebe948a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2486,16 +2486,26 @@ int syscall_trace_enter(struct pt_regs *regs)
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

