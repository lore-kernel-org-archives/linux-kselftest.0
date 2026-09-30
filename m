Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4F4078E8;
	Wed, 30 Sep 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763440; cv=none; b=QuR7G4u0K1EciPEUZPRZXO0u0kTJwR9msfYpbcZr3roBuFStS0ot3NdQ2YWHPBQRjLkp4y+kUFyARZFJ7nqKKecVvqs6Y7vEb4NYn6HgAoe6ZShmIsP9nvsl76ldhn59VdezhAuAsE+g/G65fX/aY6N2ls1C1nslx5O43rbSMuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763440; c=relaxed/simple;
	bh=G1k1CuhmIERTReJLC+wR8KvpMYqUYAkj6w6JeWw0vQ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOostduHd4j2+SxRa0eZ4YujCUFDw4+ZdXCO/mBz6vHDRwIzJSAB1GVIpIBkj+Ac5tXvDd4QMiFVPy2M658x7jUUwRt6Q+0gpmoVSrxCYjzN7oGkOObmgn80Qk16q/1+ViX7MXgAOMaC0l+VZYS2+7CqpX3tzB4Eq8vhC8JPW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=umPEVjQO; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="umPEVjQO"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ayTW7xrxEmoDaDHrDoW2f9Tni7T5XTnUSk+ItOt6MDY=;
	b=umPEVjQOGISIXOF6JiELpMiVZBOAmqqRE1hjXx32ygUu+avj8qVS0gY8QzOoDKz6gm+OmskkJ
	ek+jG2ckuTwmbiMfDZQ4cvoPz8GwGdwvXlIMFtt2Ymvp22PNreJefhKSpNL82DRC9ChLIwGZeOW
	UXJuInj7rbLvk00bBTW2KU0=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hvrHy0lhzz1prN4;
	Wed, 30 Sep 2026 18:04:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 77C9240538;
	Wed, 30 Sep 2026 18:16:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:56 +0800
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
Subject: [PATCH v20 02/15] arm64: ptrace: Rework audit_syscall_entry()
Date: Wed, 30 Sep 2026 18:17:52 +0800
Message-ID: <20260930101805.1770358-3-ruanjinjie@huawei.com>
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

Extract syscall_enter_audit() helper and switch to generic helpers to
get syscall number and syscall arguments, matching the generic entry
implementation.

The new code:
- Checks audit_context() first to avoid unnecessary work when audit
  is not active.
- Use syscall_get_arguments() helper instead of directly accessing
  regs fields.
- Use syscall_get_nr() helper to get syscall number instead of directly
  accessing regs->syscallno.
- Now exactly equivalent to generic entry's syscall_enter_audit().

This is a preparation step for converting arm64 to the generic entry
infrastructure. No functional changes intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 96462de75d4b..573b5770698f 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2458,6 +2458,19 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+#ifdef CONFIG_AUDITSYSCALL
+static inline void syscall_enter_audit(struct pt_regs *regs)
+{
+	long syscall = syscall_get_nr(current, regs);
+	unsigned long args[6];
+
+	syscall_get_arguments(current, regs, args);
+	__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+}
+#else
+static inline void syscall_enter_audit(struct pt_regs *regs) { }
+#endif
+
 int syscall_trace_enter(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
@@ -2476,8 +2489,8 @@ int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
 
-	audit_syscall_entry(regs->syscallno, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	if (unlikely(audit_context()))
+		syscall_enter_audit(regs);
 
 	return regs->syscallno;
 }
-- 
2.34.1

