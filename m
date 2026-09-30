Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC73FFABF;
	Wed, 30 Sep 2026 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763433; cv=none; b=HAUATiQ4mgq97WEzr/oMSZszhwUAgmGoqNSKIw+xkVBtP5j8r38kdwoDik7oqLcu16h+L2lpfa426npTGDMtwAoD0iuyC5Fc2STFYBzpAst7FY94Hr2yoU/x4We12zPlhmB3ed+VP6YmgZwaHnMdPa5kfEOtl8azussocvt5ucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763433; c=relaxed/simple;
	bh=QUb2+HOVn5dbuUQ14u8mXXYMz5lFEWlHfabDCQ6rwEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MT2ze/KO4GPCCXf62dnZB8Fv89NajgyKaGqKxh87RQF9a/FfmV+UdODQE4W7gMqnPQfVIoARu3yGQkxHo91AnZ+RTff/JEtGWy72c95QNG83N7NKf1+4Wxm6qIXx2ClawT9jbgIlL2nmZF3GxMswozAVSsLSorSPgBNKjn+WroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=fDoZGbnV; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="fDoZGbnV"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sZSpbO9IcTEwUC97Fm4qSyjltlS7ssuPpR01THv8ukQ=;
	b=fDoZGbnV45YDNiTR6zCUOF2t6mzSJS0uWp1qBlqF+4Soik/WqcPB32qWWOHSPtfzJgCfAHXiR
	gQTXDcp1mG8RS95tchNiModcsQvJqxCjPWRd9z4wnkkQNmE8Zl+qXWHWW2BgZfoAhYdmihEdGed
	vGZ5JBVBiYB3iDbIAW+Jcrk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJC2pclz12LHk;
	Wed, 30 Sep 2026 18:04:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EA2640538;
	Wed, 30 Sep 2026 18:17:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:00 +0800
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
Subject: [PATCH v20 08/15] arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
Date: Wed, 30 Sep 2026 18:17:58 +0800
Message-ID: <20260930101805.1770358-9-ruanjinjie@huawei.com>
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

Introduce a helper arm64_syscall_exit_to_user_mode_work() that
encapsulates the re-reading of thread flags and the call to
syscall_trace_exit(). Use it in el0_svc_common() to replace
the open-coded instances, removing the duplicated flags read
and making the control flow simpler.

This aligns the arm64 exit path with the pattern expected by the
generic entry infrastructure, which uses a similar
syscall_exit_to_user_mode_work() callback.

No functional changes intended; this is a preparation step for converting
arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 7 +++++++
 arch/arm64/kernel/syscall.c      | 9 +++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 696739f5a250..3e4672ab4a4f 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -123,4 +123,11 @@ static inline int syscall_get_arch(struct task_struct *task)
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
+static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	syscall_trace_exit(regs, flags);
+}
+
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e778aac6fab9..0061fc63e7ba 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,16 +127,13 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
-			flags = read_thread_flags();
-			syscall_trace_exit(regs, flags);
-		}
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
 
 trace_exit:
-	flags = read_thread_flags();
-	syscall_trace_exit(regs, flags);
+	arm64_syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1

