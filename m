Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82467274B59;
	Tue,  3 Feb 2026 13:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125846; cv=none; b=HkdmZ8DBUEtEmvR5YWDls2138dmuL3/9elQrHHttDcWvGufACwYsLPvDd+jl35/y8tneCuVGLnT0TsjTmna25H4CXO7gHhJHs5zeD/1SerphUNzMLv9IDMZGwNXKGxmBicggk0R7G6uGVhuonaLHkjUPJIgUi/5XG2YC6ZGj+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125846; c=relaxed/simple;
	bh=gFSp44aaiC5Sbw3tAorArFL0lS2hJmZJWnRCJoidgrk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iHhLUk5eitnykvg55bItBzsuYNVoGBPsgG+MtCvd3Sr7vgg8yjhgGDZXRP1zUr8HpNUzjZXcS/cx1k9Hl0//tthHJxwwOV6mGhgX4Jc5zl6g7nQ8IqshpsBgr+0k/5NgkhULTT8R6HiEakvr66o71IdeNHelIg3L2oiYY5Li660=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uWAf7za8; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uWAf7za8"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rA5PDoRRW0nyf0Ob40TZcTkk7U3DIk1nYVoEtYBGC9M=;
	b=uWAf7za8xonzhYvQ1FXHJHUi0h59nb/kCdMsIENx48i9EQgZHuPcydKSzNGZ6aGIVS0tVvaqJ
	mTpNvt99QTyEk0K8IX67czXkpmQDLn3h0PZjXj2XoYVpi0c4Kg+K7w1Bgkn/FCii9GPZfQFSGle
	RJiGJCEG5MfvXwwfGrzsHn4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f54D61cBQzLlTs;
	Tue,  3 Feb 2026 21:32:38 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id B12AD40565;
	Tue,  3 Feb 2026 21:37:11 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:09 +0800
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
Subject: [PATCH v12 05/13] arm64/ptrace: Expand secure_computing() in place
Date: Tue, 3 Feb 2026 21:37:20 +0800
Message-ID: <20260203133728.848283-6-ruanjinjie@huawei.com>
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

The generic entry expand secure_computing() in place and call
__secure_computing() directly.

In order to switch to the generic entry for arm64, refactor
secure_computing() for syscall_trace_enter().

No functional changes.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 9f9aa3087c09..5a7e97e94358 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2419,8 +2419,11 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (secure_computing() == -1)
-		return NO_SYSCALL;
+	if (flags & _TIF_SECCOMP) {
+		ret = __secure_computing();
+		if (ret == -1)
+			return NO_SYSCALL;
+	}
 
 	/* Either of the above might have changed the syscall number */
 	syscall = syscall_get_nr(current, regs);
@@ -2438,7 +2441,7 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
 			    regs->regs[2], regs->regs[3]);
 
-	return syscall;
+	return ret ? : syscall;
 }
 
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags)
-- 
2.34.1

