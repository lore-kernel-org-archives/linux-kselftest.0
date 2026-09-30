Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15611407CCF;
	Wed, 30 Sep 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763434; cv=none; b=AesDYTXvKpNtb9iL4VFE43+eVvZmqARQp2Vg9rGy6zt5AVXrczG/K3ncibE/VguIjSOAPgotFzTvhvfP9M1A4K1JThNe8T7ZSDuI0t2ROdbXpX25+fgH7q7Je0cwdl3XaYDFxLxQTeTqwdxw7q64Oed9TOl7i4Sy1M/QQv8ZOnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763434; c=relaxed/simple;
	bh=Zgiw4LuaVfNIYyt5q6nbQ06GD9CvcK05GHXfVZX1uNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZlyqQUorz9+PsabltGP/XDrHbsTSVi73teMkbtR/J2UL46AlticCYT7oMiL8HpoXZxGjlrg+KN6VDrj6c1HndebHWva80T9GOJ0GvchxsJVljgu/4pMNwcDCy4Tjb8Ym18dppAgJW3Whc7t6SI/R4VOO45lHu4+bpxjHNdRFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=H04kjZjj; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="H04kjZjj"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=;
	b=H04kjZjj/yzZFnWJDfmGL+pacj/GYrh3KjJZBGJJ2UOCUjE0NyL73R25YU2gsDHAX4LbPafR5
	ldCmFAizL7lPssldKzdsYUtscSWhbhVp27KESDU7hIl9gkL45mNv7Ivko++PkVg8ut5VhLgr7Uy
	n8kzTjuEubnYkEWF2mosgaA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ85NWwzRhTs;
	Wed, 30 Sep 2026 18:04:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D62784057D;
	Wed, 30 Sep 2026 18:17:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:01 +0800
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
Subject: [PATCH v20 10/15] arm64: syscall: Use exit-specific flags check in el0_svc_common()
Date: Wed, 30 Sep 2026 18:18:00 +0800
Message-ID: <20260930101805.1770358-11-ruanjinjie@huawei.com>
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

The syscall exit path in el0_svc_common() re-evaluates all
_TIF_SYSCALL_WORK flags, but this mask contains flags that only
matter on entry:

- _TIF_SECCOMP: seccomp filtering is entry-only
- _TIF_SYSCALL_EMU: PTRACE_SYSEMU skips the syscall on entry

Re-checking them on exit is unnecessary and may trigger redundant work.

Switch to _TIF_SYSCALL_EXIT_WORK for the exit-path re-check to evaluate
only exit-relevant flags (_TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT, and
_TIF_SYSCALL_TRACEPOINT).

No functional change intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 0061fc63e7ba..f1f0b6f3e32b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,7 +127,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
 			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
-- 
2.34.1

