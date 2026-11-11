Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397382;
	b=Fliqjm8TI7Mj8jWDm053uixkDLS72fogZnvEZVzc+zYyQQzb51sYjhC1SCZEAocQGpgz
	 x88tbFggSPXtiVdQCnrtZSRgc5IqnwczcJtnEIPVdidDa0fJg5xTLV9mE+PgcjweN6DKH
	 61OHZ6bGSu7KlIfgLgG87oeYOz2P4B8GxbuXeC2jMtZPFfT5ILnw8/X0445ssgG5g+/Kk
	 qgCFZa/1LDzTYN2Ck58IodgeEIF6bsDvSYUKZ4DBObOvN4cTiSqUu4amMup9sfFqkfnFy
	 EEub0831A9w+e2N0ns9BSvQMxO4aiDDysz6vohiPYhmMsb0hsBQa6VtF6x6vhWIVCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397382;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=;
	b=QPvMKWM210YmD4rJXBt51+c/U+e/VBk65ek2kPn6FPq72K3Q/FrfVc0wRGs3A4L5ORBo
	 dSITevqC0poHrssefOm1xmp/U6yP8JLi3Bdpb+XPuXohK+UWEF1GFfosV6IupAUet+4RN
	 RXv9qRLEcLTSglR/VHpczjB5O2u5N6guKX8BZtWi3/w5+JMZK8x4x+iwmnOiOTBranjxH
	 JPMdH8rGHBqbWtmwI1521K6GyR0VziIumk5eWALdsT7pW7t8MDEH9UB53S/G7ccRy9P2/
	 NPyH2tg3VouOpPdnp1Vjjm0WybrXZjXWaUzZxqj+fgHHuQAt992YjGBMo9TtWsjg99g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=H04kjZjj;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429060A260B;
	Wed, 11 Nov 2026 11:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7429060A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=H04kjZjj
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=;
	b=H04kjZjj/yzZFnWJDfmGL+pacj/GYrh3KjJZBGJJ2UOCUjE0NyL73R25YU2gsDHAX4LbPafR5
	ldCmFAizL7lPssldKzdsYUtscSWhbhVp27KESDU7hIl9gkL45mNv7Ivko++PkVg8ut5VhLgr7Uy
	n8kzTjuEubnYkEWF2mosgaA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTg6q3gzRhT3;
	Wed, 11 Nov 2026 19:42:47 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 66DBA4057E;
	Wed, 11 Nov 2026 19:42:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:57 +0800
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
Subject: [PATCH v21 10/15] arm64: syscall: Use exit-specific flags check in el0_svc_common()
Date: Wed, 11 Nov 2026 19:42:20 +0800
Message-ID: <20261111114225.3977243-11-ruanjinjie@huawei.com>
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

