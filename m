Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397381;
	b=R3dgFSEIN+Deyt/JJuCwiIO33dFPke1SFvOh7egKFWna0iUH0I40bBnExOhRwqd6ZBEV
	 fhQJ8YRaBcmEx7a71XYC32RnSU19CvVmBFcmg25Z8wcSt01j6kCevmaeeyfM5c1NcnEpa
	 i51dyfqKe9e6XQ2HyLQI3Rub2NH9KOMv44uD/36cxGtrZOJNTqZI5icqhmaXq5XC5/gd4
	 Ao22DcXvhZZMyJBCg4QHo6F+/22MrBoqa081snJG+YVb/SjFgCKfIwaVFUmfD+8AdnoOU
	 9Y1CrYuHmWb2SSXPKs6ZpthNK62eTemjIoZ/5oin82JkpU1Ti/nhtpHueijuGT9frAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397381;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=hapHJX5CBE0NDRN9ZLEstnet2nYwtvfy5mzxbnNdOv8=;
	b=2E3pxsCZMEZQCG6SKbs/MYmlIf+DVJEaO8WYXhSzaaFSQdaRSv0pK+TxX5oJjnKF0mu5
	 XHjy9KKljuFwKpx9xFXtk3GOcDiErjNqIlnXM50cK4rtN5ZAQ/OYM56GgeoC5BD7D9PuF
	 qf6qNtQWQABM6dyamrMJqvGqtGY2nE/lztgNX8lQJ8sjaS0k5o6MsjQvEmQhPsbcNWgHX
	 vS1273RRBCYfuAl50BhEwc2GtPMsPrGQYub97PM9aObozuHvyVesqG1vEOSZ6BEirJPf7
	 kx0EPv5eVwoi7f5SATM8y7y7OqHefTV76pRBc5az0Z+mCaT6kdnBNoTRxEFDCSlFlyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Wz6XAmWk;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCABC606A333;
	Wed, 11 Nov 2026 11:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCABC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Wz6XAmWk
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hapHJX5CBE0NDRN9ZLEstnet2nYwtvfy5mzxbnNdOv8=;
	b=Wz6XAmWk7oFSJGEEUVKr9opU5RIMYAQlGT1v/zo0ytAa5WpqhDgPQXSN2Kw3OUTFGsCmA7WoC
	5Ghlc/u5SZaqRNRjW4/BBFKpx+cwWWCmzr2o1QYrrbuE+OGDA3fl4QfEnoakNykn3XM9+UIUyVh
	ZH3MOJpYkibgFRklj4aBigM=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTb5th4zLlVY;
	Wed, 11 Nov 2026 19:42:43 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 186484048B;
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
Subject: [PATCH v21 11/15] arm64: syscall: Simplify el0_svc_common() syscall exit path
Date: Wed, 11 Nov 2026 19:42:21 +0800
Message-ID: <20261111114225.3977243-12-ruanjinjie@huawei.com>
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

The fast exit path of el0_svc_common() is only taken when no syscall
work was pending on entry and CONFIG_DEBUG_RSEQ is disabled:

	if (!(flags & _TIF_SYSCALL_WORK) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
		flags = read_thread_flags();
		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
			arm64_syscall_exit_to_user_mode_work(regs);
		return;
	}
	trace_exit:
		arm64_syscall_exit_to_user_mode_work(regs);

arm64_syscall_exit_to_user_mode_work() already re-reads the thread
flags and checks the same flags itself. The only other thing it does is
rseq_syscall(), which is an empty stub when CONFIG_DEBUG_RSEQ is
disabled, i.e. whenever the fast path is taken. So both paths end up
doing exactly the same thing, and the fast path can be dropped:

	trace_exit:
		arm64_syscall_exit_to_user_mode_work(regs);

With CONFIG_DEBUG_RSEQ enabled the fast path was never taken, so
nothing changes there either.

has_syscall_work() then has a single user left, so open-code it.

No functional changes intended.

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

