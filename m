Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C7439E6F7;
	Tue,  3 Feb 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125851; cv=none; b=gvbu4zYX2IWxJZtFocBW0JYxqLjNzctzT89kHcVLXVMCDOfv0zj3bBCOkViq7AXbXcjHTPOtpKcsXY7025YC5VQEgh87QWSwbD5fyPYdnnmjrRaJ7JEIGSs3q5Tta+tEjjl3L4xNTHu5A2jVnoUNJeg6rFYuactoZ8ODyWJvymo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125851; c=relaxed/simple;
	bh=qS2x3F/8cFI+ELoaVYDZ8iYLMzffKK/qG4KoEHB6l3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNVzAnROwdzuSI8tGjCTirf0G/Cod2OsDBb9Tu1MKX5kQRTEpNM4X2wk3DjKnanth+t2Jk/rOO13UhsvB0zt1Y8jTtBzZCGz2yuwWmTRuJ1SbwivAf0jwL8JmEnXtvDBE3gqvCIGQWdZMPVQS8PphhcYoCdec/KbkV7jwYuIjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xk66DhOL; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=xk66DhOL; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xk66DhOL";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="xk66DhOL"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=;
	b=xk66DhOLN81nQjlEgWG43Ir5X/TRRy3x05MfEPUryObaxDJxIG6GQUOA5nkuEJR0UWdw9Eg6L
	MmCMDfpdpL7jLlL3Cqeuw7P37VmMzs5UE3XzZOxLGC8abtF+WTKO9YpG2/ruXPbPNKIaAMVuDcE
	ozpT6xBaNaff10HikiHPZ60=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f54Jf667cz1BG4j;
	Tue,  3 Feb 2026 21:36:34 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=;
	b=xk66DhOLN81nQjlEgWG43Ir5X/TRRy3x05MfEPUryObaxDJxIG6GQUOA5nkuEJR0UWdw9Eg6L
	MmCMDfpdpL7jLlL3Cqeuw7P37VmMzs5UE3XzZOxLGC8abtF+WTKO9YpG2/ruXPbPNKIaAMVuDcE
	ozpT6xBaNaff10HikiHPZ60=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f54DN2zxrz1T4jY;
	Tue,  3 Feb 2026 21:32:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EC7F4036C;
	Tue,  3 Feb 2026 21:37:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:11 +0800
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
Subject: [PATCH v12 06/13] arm64/ptrace: Use syscall_get_arguments() helper
Date: Tue, 3 Feb 2026 21:37:21 +0800
Message-ID: <20260203133728.848283-7-ruanjinjie@huawei.com>
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

The generic entry check audit context first and use
syscall_get_arguments() helper.

In order to switch to the generic entry for arm64,

- Also use syscall_get_arguments() to get audit_syscall_entry()'s
  last four parameters.

- Extract the syscall_enter_audit() helper to make it clear.

- Check audit context first, which saves an unnecessary memcpy when
  current process's audit_context is NULL.

Overall these changes make syscall_enter_audit() exactly equivalent
to the generic one.

No functional changes.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 5a7e97e94358..e3dcadf13e99 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2407,6 +2407,16 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
+{
+	if (unlikely(audit_context())) {
+		unsigned long args[6];
+
+		syscall_get_arguments(current, regs, args);
+		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+	}
+}
+
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	long syscall;
@@ -2438,8 +2448,7 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 		 syscall = syscall_get_nr(current, regs);
 	}
 
-	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	syscall_enter_audit(regs, syscall);
 
 	return ret ? : syscall;
 }
-- 
2.34.1

