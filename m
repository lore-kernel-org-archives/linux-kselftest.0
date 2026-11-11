Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397382;
	b=D0hgN2dWInHU/pZMVil6TciGHz5/w+j8Uo0mPn2Ks/xq1eKjz+Ewdw1bGG8bCOLwRWxc
	 nJ9pHlvZlL9Vai9+c0uDC+GnPne1Mv0AS1gxsC/IwXO2mpNYtU4QEtEEvh/ZR/1oc4hOP
	 zFemlyoJNVwcVWn4dT/hpRipfkBuZq4ThuDgMT1pMH0kUERnB+aJMdcWENNAnytz12MLU
	 dQ3zDFGQrEJ5SJBbM5fBpC+FHJb1ONs9wvF5R2rVnY+BT9LgxQjKvCj1zn3ekzVEfYSb9
	 YbfSIryO5n2MJE1qesV5yN6G6FWzhedyaADBRJXuxp+bMzQVJlIEFWCwfJeLzZLxm5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397382;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=euqH4E9CbqliXF/UtInV48zFkTUqE+5g8o1uqOyP+4o=;
	b=bOJxT+YoW91oCWDTwzTmiUPyj5/zQaxahO8qQMpVbJ9XpbxRY3EdDFQBi5iLsF117yt7
	 +k+zbiKryIYd+pjKlR7mQRfDXp7UxWXZ9x8sCSp15Ez2J8m9hEjFb5LGM6GVjV8/Qai2X
	 Jy+cepTBIz0EksF7ijKqXG3e87zGpDOOm8+nx+WICLdzCp8AWUZQ4qtJu3/v38k5S/BiG
	 fnsc0wAxVIZIxKOnr9eIBy4J1wFQvxpcH1rWQmDmwydz3ZEJ/3T5pwS+ibEdFbC3nqvZN
	 t0DKrDLyp7Vrj4Sw+YHuvsk0e+e5xDsnNVStUySpCMs704M10QUezwN2htu9fYwekrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=j+BPUovm;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B2760A2608;
	Wed, 11 Nov 2026 11:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B2760A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=j+BPUovm
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=euqH4E9CbqliXF/UtInV48zFkTUqE+5g8o1uqOyP+4o=;
	b=j+BPUovmIiXOpkDuhWrQvHUNra2R2yWKhUtN7RBRrX/da1TQ6P5iNysctdw5Jmfao4NKuukmk
	AXE9SnEZAcB3KxGuZWSGlnQ+8tgTpr/o/z5MRPAQ8JXJ2P+dz6+RUEm5+0Ejx1+xQB/hj93/CcG
	fORQL8DIE9XLlB37kbN92BI=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jPhT358dmzpSvH;
	Wed, 11 Nov 2026 19:42:15 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 597F140579;
	Wed, 11 Nov 2026 19:42:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:52 +0800
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
Subject: [PATCH v21 03/15] arm64: ptrace: Add syscall_enter_audit() helper
Date: Wed, 11 Nov 2026 19:42:13 +0800
Message-ID: <20261111114225.3977243-4-ruanjinjie@huawei.com>
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

Extract syscall_enter_audit() from arm64_syscall_trace_enter() and make
it match the generic entry version:

- Check audit_context() in the caller, as audit_syscall_entry() did,
  so nothing is done when audit is not active.

- Use syscall_get_nr() and syscall_get_arguments() instead of reading
  regs->syscallno and the regs fields directly.

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
index a34d4893f4bf..22bda379b244 100644
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

