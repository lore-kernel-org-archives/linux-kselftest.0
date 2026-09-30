Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C1342CB0;
	Wed, 30 Sep 2026 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763435; cv=none; b=oMCwNq55qQ8A1SEEXhi5lbP9vXK4j7AoNJTuJ4DOLZox+cFXE5JogHvfBXxWEBPru7MPok8HZkJB97VwFuydZUzjWmZRJAZDlsAVNUq0AIOY7LQygiKNLPKcPMS/8hIQdx+NaWVkG7yP/aDsNXQLYhHERCq9nG1jj8u2W3izVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763435; c=relaxed/simple;
	bh=vcT+HBf63InCMft+d13UpGDojs5UvPewR35keg7Nq0o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLGxdbKYVl7QWhw2QGzvYjfFZx7O+lFflJtdhdWIUPQctCW+d3orma9UtEtwp6XTjKubbIfCX819nHnJ9ghLMpC/0ioB9QGVHMNNMNS7RVdnVtJvqeOlfBIfhZuzU99NsBSu8Ly97t4TUItwh8nPYL4c0SLmGVjhXlmdwsKXbH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YiEB1lIl; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YiEB1lIl"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=n28SIgyTurwPWKci1fV1L6oABEznXaKISMnbpRp00yM=;
	b=YiEB1lIl10j0iQ/y4gekBd8r1iG0zyp4gJaGWKaUAqxZzk4KkzxFhrC0gThETZeWaNjCCfN6X
	9HVUVpPteG/couL3ubhsIko3I6PjeRCu0OHe1GwouNjke+mBlnyFHd8v1g1WngYu6bNbpO1MhI/
	9S1lWOIq2zbQrCucn7k77Q0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ92gNbzRhTs;
	Wed, 30 Sep 2026 18:04:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A07340575;
	Wed, 30 Sep 2026 18:17:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:02 +0800
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
Subject: [PATCH v20 11/15] arm64: syscall: Simplify el0_svc_common() syscall exit path
Date: Wed, 30 Sep 2026 18:18:01 +0800
Message-ID: <20260930101805.1770358-12-ruanjinjie@huawei.com>
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

Remove the redundant nested conditional check within the system call
exit path of el0_svc_common() to streamline the exit sequence.

The fast-path block is guarded by `!IS_ENABLED(CONFIG_DEBUG_RSEQ)`,
so CONFIG_DEBUG_RSEQ is guaranteed to be disabled and the call of
rseq_syscall() is a no-op. Under this constraint, the code logic
inside the block becomes completely identical to what
the arm64_syscall_exit_to_user_mode_work() helper already does.
Replace that nested logic with a direct invocation of the helper,
eliminating redundant code.

Before:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
| 	flags = read_thread_flags();
| 	if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
| 		arm64_syscall_exit_to_user_mode_work(regs);
| 	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

After simplify:

| if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
|	arm64_syscall_exit_to_user_mode_work(regs);
|	return;
| }
| trace_exit:
|	arm64_syscall_exit_to_user_mode_work(regs);

Furthermore, Since both the conditional fast-path and the fallback
slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
this explicit conditional branch is entirely redundant regardless of
whether the evaluation is true or false. Removing it collapses
the duplicated logic into a single, unconditional path.

Also remove has_syscall_work(). No functional changes indeed.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index f1f0b6f3e32b..3488afd45d20 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -54,11 +54,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	syscall_set_return_value(current, regs, 0, ret);
 }
 
-static inline bool has_syscall_work(unsigned long flags)
-{
-	return unlikely(flags & _TIF_SYSCALL_WORK);
-}
-
 static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 			   const syscall_fn_t syscall_table[])
 {
@@ -95,7 +90,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 		return;
 	}
 
-	if (has_syscall_work(flags)) {
+	if (unlikely(flags & _TIF_SYSCALL_WORK)) {
 		/*
 		 * The de-facto standard way to skip a system call using ptrace
 		 * is to set the system call to -1 (NO_SYSCALL) and set x0 to a
@@ -119,19 +114,6 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	}
 
 	invoke_syscall(regs, scno, sc_nr, syscall_table);
-
-	/*
-	 * The tracing status may have changed under our feet, so we have to
-	 * check again. However, if we were tracing entry, then we always trace
-	 * exit regardless, as the old entry assembly did.
-	 */
-	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
-		flags = read_thread_flags();
-		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
-			arm64_syscall_exit_to_user_mode_work(regs);
-		return;
-	}
-
 trace_exit:
 	arm64_syscall_exit_to_user_mode_work(regs);
 }
-- 
2.34.1

