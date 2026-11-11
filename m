Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397381;
	b=XD2p/+M1kZjF5nk2U6uHMEAm6bY6uPhS/vkxBB22TYYvAjFPQcPmWLRUKUsxEwucif46
	 jfDgPll0c5C7AgkJuoDFo0KxPMUvuUljaWotejFKFe8X+vs7ls5KbmPfIElidJfhB62SO
	 NSeo//BMqWYNNiR4aS508RmZndBtKZHhpu/Hlyv9p9yNIo84jDmtJc6eXnQEgb6fMgAy6
	 B+fDn1J09r/VjZ+J97EuFySfybNPmhlmwoUKGMtsw8hf+h2XRX8O5IpI+U4AcInmdmpSs
	 1/NcgI9AKbn4KVEvTF9wuBWXJzGMTgWDLx+tcINC2IEm53zXE3pQxyoVorQ2BSbCMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397381;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=DvHKY3cYSus7pHAxRYcjnamtRx26ijW7dyhFooUIFS4=;
	b=ItTxV1DqOy1AKfgzVmeC6Mzg2IREc//KftORsNu5EdlbDs7q6cV0TtW8mgV8mshuDmwo
	 /AZc9OBMbkJ8SKEJ1T7bAiYLyTW0dbfENLLJu+vMBK3iK1k0PcPKskWTay4GUmd6GjsGx
	 r/a+2ErtIgNPvsP0Iz1v0z7vkD8pdJw29tTlxQoM9A2d9YGWFvvqpKvloGenHm/SInFCY
	 +XoyAHWQH32Hv5+qDp9HOXStkCYukLNpfhcB7ixti26LnmImtr8T3oW5neFdGgBQZGiyc
	 Z+jea1BBNBAujX+HeEjYJqylfaDXOvq5W5uYVV7k/14HiHp2BqXFGMBgi6C/IdFcgEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tk+WtAnf;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05881606A32D;
	Wed, 11 Nov 2026 11:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05881606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tk+WtAnf
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DvHKY3cYSus7pHAxRYcjnamtRx26ijW7dyhFooUIFS4=;
	b=tk+WtAnfL3EXR6bdWC04NRutNXaNCjkTEvHif9ALQAwcy4SXilgysliGlMr+RwJrGnm9LoYvO
	SuA5oYKEwqkKu2gSKc+RdKt50DYF6GQgWATX8TT6RxaJuAUhq6tBtFOkW8n/l4RareC12wic2dt
	IvroOtdNoDSmbKQFlEiNxRo=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jPhT30jrqzpSvH;
	Wed, 11 Nov 2026 19:42:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B5CF94057F;
	Wed, 11 Nov 2026 19:42:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <thuth@redhat.com>, <james.morse@arm.com>,
	<yeoreum.yun@arm.com>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v21 02/15] arm64: ptrace: Check rseq critical section before reporting syscall exit
Date: Wed, 11 Nov 2026 19:42:12 +0800
Message-ID: <20261111114225.3977243-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111114225.3977243-1-ruanjinjie@huawei.com>
References: <20261111114225.3977243-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

With CONFIG_DEBUG_RSEQ=y, rseq_syscall() kills the task with SIGSEGV if
the system call was issued from inside an rseq critical section. It
decides this from regs->pc.

arm64 calls rseq_syscall() after report_syscall_exit(), so a tracer
stopped at the syscall-exit-stop can change regs->pc with
PTRACE_SETREGSET before the check runs. The check then looks at the PC
written by the tracer, not the PC the system call was issued from:

- a system call issued inside a critical section is not detected if
  the tracer moves the PC out of it;

- a system call issued outside a critical section kills the task with
  SIGSEGV if the tracer moves the PC into it.

Call rseq_syscall() first, before audit, tracepoints and ptrace, as
generic entry (rseq_debug_syscall_return()), x86 before it moved to
generic entry, and arm32 already do.

Only kernels with CONFIG_DEBUG_RSEQ=y are affected. The option depends
on EXPERT and DEBUG_KERNEL, is off by default, and is otherwise a no-op
stub. Measured in QEMU with a traced task that issues getppid():

  case                                  before    after
  inside the CS, PC moved out           not killed SIGSEGV
  outside the CS, PC moved into the CS  SIGSEGV    exits normally

Fixes: 409d5db49867 ("arm64: rseq: Implement backend rseq calls and select HAVE_RSEQ")
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
index 4baf04f20e67..a34d4893f4bf 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2495,6 +2495,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2503,8 +2505,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1

