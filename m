Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680331;
	b=FVwF09XQqiXTId3DNrw0AzSA+s4lmC5qIR3JJVwriDwZZmY/tlT4lg2yDpKpgqN6e5Wj
	 D+jWASaCLcW/4d7bkXzdGa/HTLDtrvAB4gDSHf2a3HSpUXqlCpS1iNQcx3Aq0OEgjk0On
	 0W+5exN+RABOO/KJYuU/YK1Z2ZQNuaQpEFt6nFmVTd1WbDQzqChA7qA3/bPvdVEsPSVKZ
	 49pERHn9PvLSs6k4fusdrRfhBnQgL0ADwwcLlMG7WvS5QpmnesBBPEEwY0+V1tbGim4d+
	 932MtKqOyV+3ESAo8OYyxQZcYg1144dq1n2RewpK6SYrGYbQrySvpaKM6iDI7OwsPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680331;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=eucfmT/o/Eozou3D8TIi0sNyFcoiYBVuMw7umZiWiHo=;
	b=MAxivaQpd6R4PaPYRdO7A0teUGuj4+dDGYNLNlgr+aRJ4tFKbdTv8l9BgBsZf7RTKKPk
	 4h/vLHYseo+rxZKy42IuRMlNIPetcHOltv62DhEgIRPvrvwGq4VOVeoESWzoJ8FLqkFJg
	 oP2CX5UzYT9d2qARhlgRUE0vlhzte41ZOkDFxbGSxrwT9m1AWczvACR1F7YoYuad7CREr
	 KmEs0VVyq2qVu0i6Cs51/Tl6tG/zDjkNBjqDZTHyXNhHzjI3rxvw4T7RmCWmPeMhAHJ7v
	 4IBdL7N1GZ1JdzHT4v9lqOmfx4lhyO6e2RioQ1pTg3ND+3ec2ksg93CUI8DERsy+2oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uPiNeOjZ;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B1606A32E;
	Thu, 26 Nov 2026 08:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29B1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=uPiNeOjZ
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=eucfmT/o/Eozou3D8TIi0sNyFcoiYBVuMw7umZiWiHo=;
	b=uPiNeOjZvUhLdvjRznqZwRhUuQ72RNUQ6xBznmYewwXds/X6q437IXt3MEFB0gF2B2Ddd43w2
	lu52LvqkvufO6dSoD6Rai0KyjeEU/9hqIUv8kcucFfnRfmiyf17kXQgimWj9crPEHGgDUBhjHoO
	ez00NO/K6YO2+4A7sU1I/xw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jZpxT0WCCzLlWD;
	Thu, 26 Nov 2026 16:05:01 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1EFC640586;
	Thu, 26 Nov 2026 16:05:25 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 26 Nov
 2026 16:05:24 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <oleg@redhat.com>, <linusw@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <shuah@kernel.org>,
	<mathieu.desnoyers@efficios.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/3] arm64: ptrace: Check rseq critical section before reporting syscall exit
Date: Thu, 26 Nov 2026 16:05:13 +0800
Message-ID: <20261126080514.1523978-3-ruanjinjie@huawei.com>
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
Cc: Linus Walleij <linusw@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 07c80ebe948a..4e43f9841d10 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2499,6 +2499,8 @@ void syscall_trace_exit(struct pt_regs *regs)
 	unsigned long flags = read_thread_flags();
 	bool step;
 
+	rseq_syscall(regs);
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
@@ -2507,8 +2509,6 @@ void syscall_trace_exit(struct pt_regs *regs)
 	step = report_single_step(flags);
 	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
-
-	rseq_syscall(regs);
 }
 
 /*
-- 
2.34.1

