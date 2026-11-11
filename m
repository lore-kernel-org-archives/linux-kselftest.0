Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397386;
	b=g+IMh06uUEm/jnsn5u5ael4H9UWe/2KdvUlFU4UxFgX7B7+MFTu2aLMXXgOdFjj0WRk7
	 DOm6UoxpqfNqf7qg8M0cHO2aA4++v8VIOBS+UpWWznnyySlJqsgH+0NswFR2Q6r4s+DTV
	 sH6DCjndefpGzI8uNhlRZp0iltGSq6eR+HB4rJ+aKFUXBc4BuaMDy6vefQw1TOI7bnBhL
	 1n2bDNSLbRnw969Um9hbUMxpTC0e4FPF0cYf1rSkVmw9Xsu0mMMMnOBSAOdXxIIOg4ptr
	 WG3VE7ZcESz+r8x/kUEx8ulLHdXXvfAevCj090+HVYHZQS1koPreclxKMqg5GC0AUZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397386;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=w9eOUNANZZ1aqF6Umx0xUAPBLAnHlLs7pvt+ypv+WkQ=;
	b=vKIFwQyTlgqkMIQPg75T6UkhNheyc9TnH6iakW5z38Jxmvk9KVngo5bGUIg0cADVj0K0
	 e6IBBtPdv8ITI1JSSTzs+Ram+XzD3khnCGUAbvK74JTxS4nALXT+6eU8B1ZQipcDmXug7
	 xgBH7aE3YBdY23uwLqgzM3pBcdRYyZMFe5MkVaPn/HaMFGudEpTT7LyD+CAKHaAG2G5Jg
	 0DZGqhor1Vrhtc2zxcI70ogBnyZS6wwzUmT8kKnqZvFtvLqHRb8z+aH1fmPhsTiyAB7DZ
	 DQzgdp2b2Y1qnSutJcV5+u84Q4e6X92NBXTAKQQFpuH78nQ1G+GZenHGvFRFE5S7tvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PH8cyynm;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CBB60A5BC4;
	Wed, 11 Nov 2026 11:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44CBB60A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PH8cyynm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=w9eOUNANZZ1aqF6Umx0xUAPBLAnHlLs7pvt+ypv+WkQ=;
	b=PH8cyynmKyBDirON43SayR899ZdZULoiQCrvz8njxdb1IUKcbeAlUwGbXfu3JFa9NTB73Y3H4
	UVTyH3ZfrlHL4S78RJq7x8b9QGYvyrZE7Fs7+jEJ3Iq9ymkAdHakpLjYTPRc8tYVDcLNNDcp4X4
	04mkwkWsnj2HdvG6aySN+/I=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTD6sDPz1T4HZ;
	Wed, 11 Nov 2026 19:42:24 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C7A2B40579;
	Wed, 11 Nov 2026 19:42:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:53 +0800
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
Subject: [PATCH v21 05/15] arm64: ptrace: Rename and clean up syscall_trace_enter()
Date: Wed, 11 Nov 2026 19:42:15 +0800
Message-ID: <20261111114225.3977243-6-ruanjinjie@huawei.com>
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

Rename syscall_trace_enter() to arm64_syscall_trace_enter() to avoid
name collisions and clarify the boundary when arm64 eventually switches
to the generic entry infrastructure.

In addition, replace direct accesses to regs->syscallno with the standard
syscall_get_nr() helper for both trace_sys_enter() and the return value.
This decouples the tracing logic from architecture-specific struct pt_regs
layouts, aligning the implementation with the generic entry pattern.

No functional changes intended; this is a preparation step for
converting arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 2 +-
 arch/arm64/kernel/ptrace.c       | 6 +++---
 arch/arm64/kernel/syscall.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 5e4c7fc44f73..d1dabdcde41c 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -120,7 +120,7 @@ static inline int syscall_get_arch(struct task_struct *task)
 	return AUDIT_ARCH_AARCH64;
 }
 
-int syscall_trace_enter(struct pt_regs *regs);
+int arm64_syscall_trace_enter(struct pt_regs *regs);
 void syscall_trace_exit(struct pt_regs *regs);
 
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 9c45ff796732..1d93c3e1253a 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2471,7 +2471,7 @@ static inline void syscall_enter_audit(struct pt_regs *regs)
 static inline void syscall_enter_audit(struct pt_regs *regs) { }
 #endif
 
-int syscall_trace_enter(struct pt_regs *regs)
+int arm64_syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
 	int ret;
@@ -2492,12 +2492,12 @@ int syscall_trace_enter(struct pt_regs *regs)
 	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_enter(regs, regs->syscallno);
+		trace_sys_enter(regs, syscall_get_nr(current, regs));
 
 	if (unlikely(audit_context()))
 		syscall_enter_audit(regs);
 
-	return regs->syscallno;
+	return syscall_get_nr(current, regs);
 }
 
 static inline bool report_single_step(unsigned long flags)
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 358ddfbf1401..3e78e159b2a1 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -113,7 +113,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		 */
 		if (scno == NO_SYSCALL)
 			syscall_set_return_value(current, regs, -ENOSYS, 0);
-		scno = syscall_trace_enter(regs);
+		scno = arm64_syscall_trace_enter(regs);
 		if (scno == NO_SYSCALL)
 			goto trace_exit;
 	}
-- 
2.34.1

