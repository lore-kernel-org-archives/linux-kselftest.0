Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397383;
	b=s2FiE0948tCdTknEIyBtaY3CDuJ1vxM2dHbe3lJDShc0chzZIbAdD8EBubpJmNheOWXz
	 YxXcOmBY+dI+pZVI6GE3zJStqQSGdjoQ/y/B4YFy5t10RzwKblPRZBVvzrSI51h3PFiki
	 Yyd0w+cmGzQX07fgNOSheXChIHRNGWR1IhA18r+0TqxTinKVSDLtGOvUjlWbfkZNupA3I
	 EUUtSAyxZLwNuWc1lLzzaNCpwbBTGHW6zFr4Xzo1azgRhJJVAd4JtKRnL+tBW0Jltl8Xx
	 C7KxWo31ow+tTRLZY9q+DHfOBbqUIs3NUql8BLS9x4TvqePmeM6yPPP7T68BifG48Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397383;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FJJ1bTU/A5OGTKd8MNjjrQxrp+auhWfDz+fIqooO6Fk=;
	b=H1au/TZhK835UIW9OacRhVgUpUUmkvSpG2whsxWEr4XFbUZ2DOSsVVk+Ro2uvwSZtqGS
	 O86nzZQxo7U6XgHTiiYKXsd4yHGCo8MtTEX37bE3NmP2fd2orGFChrH/WFwT/JHF2p+zV
	 9lqYVminzWf8jeAPBJOhIf5BJWRfDKzmzaVpFtUKOrSBj+lcqo3pwjKe+NkkBYKbDgZrx
	 MzcopjP/YdaEPgkLRl0fcM/YT6wvdnoYQu8ZUMbSWbUjIa2jF3FNFtc2XXOLTmneRB1v+
	 0QCYk/4SJ4cauEsozZjeMdg8evRueHiQOnvDokdgq9rwv14u85W/4kBEx+f6zqUM4Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QwuL8Lgf;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F30060A2619;
	Wed, 11 Nov 2026 11:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F30060A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=QwuL8Lgf
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FJJ1bTU/A5OGTKd8MNjjrQxrp+auhWfDz+fIqooO6Fk=;
	b=QwuL8Lgfjs647B2BdC9JzE7EU7rgeUgI2r13VyROZIG+vHPqZ6v3g9/Z1mO34uZjiywoGc/ki
	UUqWLsn5zHBX8tsJeQ06VBAyI9bBgGQ1KDmdvZkOjb64S9hsykDZ/wdwNARhR78QcMtFbRyJ6H7
	P6rjDJHzBAr98uIyaUvLr2o=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTc0MByzKm4r;
	Wed, 11 Nov 2026 19:42:44 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AF6C4048B;
	Wed, 11 Nov 2026 19:42:54 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:53 +0800
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
Subject: [PATCH v21 04/15] arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
Date: Wed, 11 Nov 2026 19:42:14 +0800
Message-ID: <20261111114225.3977243-5-ruanjinjie@huawei.com>
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

Refactor syscall_trace_enter() by open-coding the seccomp check to
align with the generic entry framework.

The generic entry implementation expands the seccomp check in-place
by testing SYSCALL_WORK_SECCOMP and directly calling the underlying
__seccomp_permit_syscall() function. Moreover, generic entry explicitly
re-reads work flags after ptrace handling to ensure any updates to
seccomp work flags during the ptrace stop are observed.

Bring arm64 in line with this behavior:
- Re-read thread flags after ptrace handling.

- Test the updated flags for _TIF_SECCOMP and call
  __seccomp_permit_syscall().

No functional changes are intended; this change simplifies future
migration to the generic entry framework.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 22bda379b244..9c45ff796732 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2480,11 +2480,16 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+
+		/* ptrace might have changed thread flags */
+		flags = read_thread_flags();
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (!seccomp_permit_syscall())
-		return NO_SYSCALL;
+	if (unlikely(flags & _TIF_SECCOMP)) {
+		if (!__seccomp_permit_syscall())
+			return NO_SYSCALL;
+	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
-- 
2.34.1

