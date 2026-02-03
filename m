Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6D274B59;
	Tue,  3 Feb 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125837; cv=none; b=AHH1zxwZhKKEyBauRsthLLRC3sT14GEu26yAc3lL84OLi8/inDi1Bc9ezoeMga9trvXMIHj+Vpu4LFu18lIGbXJo9sq4Lrb2N/Ry7T+neXG+Xk26sjLndI9QBGXsZ4siOdyKleRWLqQp3FmaIF8hAa1L94VJeWkBo0Zb/qkhvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125837; c=relaxed/simple;
	bh=wOu7iNm4bCW7xNFMm07kSxf+6rNlcg1bw+tJUrdXxjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBrzk02L7/6vHCoQY1DkRYCLTDnv5xsqDzSPdak/zeH/LEuZ4Jyy3izVu9gD2ZPfvd/jmV7O5pdBJ2KKygesUVweTVACK3cXTa2aT/LYrt6u6cPML81ZH8vgGQcy0gV3N1I3z6+bPLnWj2C3BZE7wBdIq6OpY/BmhviFQjCWNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=gk87i4gg; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="gk87i4gg"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2pfG2FGkeqdKtN9RNd7Vzxcgb13kzm9Ua4HpZFnxrFA=;
	b=gk87i4ggW79ZggPR8oBheys6SvdF7hYLha1MT6VPKCAPQJ+TRHjXBDLKaAIZXxgVtSlejhfSU
	R6ETfk4CROePgxZT3vmKHzg5eEqPEYIblrxgLmvfIhtM/OV7CDzs1cREKjzkP2Fo1oHHKJaNQKa
	a0KIQkMCcY6SDj/sd3BxOik=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f54DB6WywzcbQH;
	Tue,  3 Feb 2026 21:32:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id EECB040363;
	Tue,  3 Feb 2026 21:37:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:02 +0800
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
Subject: [PATCH v12 01/13] arm64: Remove unused _TIF_WORK_MASK
Date: Tue, 3 Feb 2026 21:37:16 +0800
Message-ID: <20260203133728.848283-2-ruanjinjie@huawei.com>
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

Since commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ
entry"), _TIF_WORK_MASK is never used, so remove it.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/thread_info.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index a803b887b0b4..24fcd6adaa33 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -106,12 +106,6 @@ void arch_setup_new_exec(void);
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
 
-#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
-				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
-				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
-				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING | \
-				 _TIF_PATCH_PENDING)
-
 #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
-- 
2.34.1

