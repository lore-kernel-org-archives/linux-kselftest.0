Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397388;
	b=eveWOzTgZRi4Y1o4svguiaJkSiAmdLQuI8BMY1g2qmL54WReHGArYQmRGuzC9jalNY2I
	 dq5OePNnvIvM2XaD3wlDfAwrMjkbJ2CMV2oYfBByjYJiPMbT85WyZEFBOtc1JXDet0JXd
	 OkN94Zk6Tca1mXhaJK1GPKx1hbLiu6Jzy1l0zpDQdOc7SlIEPLFAqSfTbg2P1z86afI/Z
	 Ko1KaWiqasUwawCE8MxQlFsny+tMPfQBKpAeB1WtAT4s3TM2IYfVfxZxHSCFLpBmHeM3N
	 x0oP9cqzIYKXLs7RuMZAet5yLQSYgy6fl9n9kmlx9anN5VheUAsmOF0yOSFDXQB1ZHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397388;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hGBP36E9LTYeRQe9lgSGYGc4SeQI1Vsj1JRBREfQpFg=;
	b=p3xQNsyjZeprsBBZdGgMaZvmLoC09xVPufSbamxpXngcejtRtDeORDV1GhvjR77RX1yV
	 ehDzgViDbLuxp0dly71vExxiJBH9Zr/vytirnq7ik1iN5Jc6+5FL/LeVwsQKtbYopryJ5
	 pC2cPP3sfdYkehWIg/2kOz1+wkZHY1/JsFHEcZOWrMydyLE2PxV8Q535XdF647wK0dvTl
	 keDo8uBjI7WAxGj3Y1d/zVF2+B1aFTRR2xfgeJMh51KKSDL1N/QouE+qITtS/c6Sd/Kux
	 zqkN0bFCrAtzWhPPZULbA5HbVDgfUsCO673ke3zGBeq0fIvOIFkNcc4YvQiQv8e4zQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WIS1wqQr;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102C60A5BEB;
	Wed, 11 Nov 2026 11:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7102C60A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WIS1wqQr
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hGBP36E9LTYeRQe9lgSGYGc4SeQI1Vsj1JRBREfQpFg=;
	b=WIS1wqQrSUtsAIR45ecL+9Uc/y0quiS8JpfxA0fvFJ0wvxP8U3aD1SZhbUcp5Rp10cOh6m8a2
	Fh4DETZNYd/jpuOV73iNwbwXH8FO4aPr5LOXQOpO1ilSb3zl9u5LPMYscZoWzi5Nckcz4nCMSdM
	ig3Y9IQk0JL/OBZHG2hRvW4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTK75Knz1T4HZ;
	Wed, 11 Nov 2026 19:42:29 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id CF1844057F;
	Wed, 11 Nov 2026 19:42:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:58 +0800
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
Subject: [PATCH v21 12/15] arm64: ptrace: Return bool from arm64_syscall_trace_enter()
Date: Wed, 11 Nov 2026 19:42:22 +0800
Message-ID: <20261111114225.3977243-13-ruanjinjie@huawei.com>
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

In preparation for migrating arm64 to the generic entry infrastructure,
decouple the decision to run the system call from the syscall number.
arm64_syscall_trace_enter() now returns a bool, like generic entry's
syscall_trace_enter(), instead of overloading NO_SYSCALL (-1):

- false: do not run the system call (ptrace or seccomp rejected it)
- true: run it, after re-reading the syscall number from regs

When it returns true, el0_svc_common() re-reads the syscall number and
still skips invoke_syscall() if it is NO_SYSCALL. A tracer skips a
system call by setting the number to -1 and its own return value in x0;
calling invoke_syscall() would overwrite that x0 with -ENOSYS from
sys_ni_syscall().

The user-visible behaviour does not change:

- syscall(-1) issued by userspace still returns -ENOSYS.
- A tracer skip with a custom x0 still returns that x0.
- A tracer skip without setting x0 still returns the original x0.
- Normal system calls and seccomp rejections are unaffected.

No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 8 ++++----
 arch/arm64/kernel/syscall.c      | 6 +++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 7cc872fde019..f19d4a8824ba 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -121,7 +121,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void arm64_syscall_exit_work(struct pt_regs *regs, unsigned long flags);
 
 static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 4c2bdd37d67d..d3c52c9a1105 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2470,14 +2470,14 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 static inline void syscall_enter_audit(struct pt_regs *regs) { }
 #endif
 
-int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
+bool arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	int ret;
 
 	if (flags & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE)) {
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
-			return NO_SYSCALL;
+			return false;
 
 		/* ptrace might have changed thread flags */
 		flags = read_thread_flags();
@@ -2486,7 +2486,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	/* Do the secure computing after ptrace; failures should be fast. */
 	if (unlikely(flags & _TIF_SECCOMP)) {
 		if (!__seccomp_permit_syscall())
-			return NO_SYSCALL;
+			return false;
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
@@ -2495,7 +2495,7 @@ int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return syscall_get_nr(current, regs);
+	return true;
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3488afd45d20..72c6e8b7ab21 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -108,7 +108,11 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = arm64_syscall_trace_enter(regs, read_thread_flags());
+		if (!arm64_syscall_trace_enter(regs, read_thread_flags()))
+			goto trace_exit;
+
+		/* Reread the syscall number as it might have been modified */
+		scno = syscall_get_nr(current, regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1

