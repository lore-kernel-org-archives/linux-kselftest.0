Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0932C92B;
	Wed, 28 Jan 2026 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570392; cv=none; b=PM9UngZyWqzNDlkwlR1DOb0hcjToWpa/lTvPE45v3rUx7PEmRTNmUrmh7oQu+PlMqbxnpVRsUk672kVwbm4rbG1gAUHYlX6f7426zn9FtAHHY7MqwsZjxKDcQSB8mPIYx/6XLA8mj9KoeBR5eUv5l8GhWZBg7qnTRpaV+Roiwec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570392; c=relaxed/simple;
	bh=XpDQ0ZpwQA26VK9s2HAldw6wLv2GF8GIpKuTUJT2NCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffuSJhdNdbaMS2DpPlv3b06XSYVgmCtdF74AKwQ3UjEublLfXv9gUfMPJMuH6yXHp1incFu1TDie/2I1aV9FA5AaZRvM8eXsZrJej5k91PSIc/uvcQ9tXOp6Cgjz+/EbfM2TaSZBhpob73M1rXe2SpJEZv/fvyoYgwzbJTwMSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=f8+YI6ZN; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="f8+YI6ZN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Dlgiv5vHJeVQfqQO8YenRF15VrNmzNgTu7a/urQEomA=;
	b=f8+YI6ZNmONGPD5Cq7a0UKIdbtF1h6Vx+W1Sfv+OgwyYXLWbRWO9PlE4mTEhBXdqnaEsk2Zev
	BBr31SSrfvCwTD8/2jp0DWz2QteHffff/nh12ThgOdWJpt2pL1Fl5CrJUb3eTO7MrQYFfAAN7pB
	GO5403Sza+W2nfoC2kN9QVc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f16q76XVCznTVF;
	Wed, 28 Jan 2026 11:15:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F05C440363;
	Wed, 28 Jan 2026 11:19:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 01/14] entry: Remove unused syscall in syscall_trace_enter()
Date: Wed, 28 Jan 2026 11:19:21 +0800
Message-ID: <20260128031934.3906955-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
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

The 'syscall' argument in syscall_trace_enter() is immediately overwritten
before any real use and serves only as a local variable, so drop
the parameter.

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h  | 4 ++--
 kernel/entry/syscall-common.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 87efb38b7081..e4a8287af822 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -45,7 +45,7 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
-long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
+long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
 
 /**
  * syscall_enter_from_user_mode_work - Check and handle work before invoking
@@ -75,7 +75,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
 	if (work & SYSCALL_WORK_ENTER)
-		syscall = syscall_trace_enter(regs, syscall, work);
+		syscall = syscall_trace_enter(regs, work);
 
 	return syscall;
 }
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index 940a597ded40..e6237b536d8b 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -17,10 +17,9 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 	}
 }
 
-long syscall_trace_enter(struct pt_regs *regs, long syscall,
-				unsigned long work)
+long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
 {
-	long ret = 0;
+	long syscall, ret = 0;
 
 	/*
 	 * Handle Syscall User Dispatch.  This must comes first, since
-- 
2.34.1

