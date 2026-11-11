Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397385;
	b=OEMAH1Uq25DN83WhHTbXsKMzUYeT06Ab3I3MqSeIm1xEJaD5u3D9Zq3Blpge6enLMFYU
	 xL1+HnRsSnQDIuVW5IP9WgcbxoZ4hdY5WNrz0uu1XaPmpSgqhDLGP+WgpVvmJS74zhsU+
	 FytdfQYsGLiU4ePay9TSRjXZEJR6wSsKawIpH0tyC7q/vc90O/aqCAQA6Up4b9CZ6f+cj
	 NFHCTk3bxPWa9WdSjIK7DGBWs0nL8iqqX7pXTUI9afVZFfs6niUGP3I3LRmURnbDBQvoW
	 /nwync98GX5WuSCgGhQdHrn6FB+/4GvO4gPUw1AOYW/AQffzMIVzrg1YEfSdOYhf7gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397385;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=k2NrxhUNhWz90Sj+Vfwvx9E4ild0CjBUkFBsTKTSyQM=;
	b=3qgAjWVwwTNIevFVw9cEaL7IFYvnZ/j3RUZKeLICqQ7l2+U04HQfTJmKSvkbWnglBkah
	 XdKXbOx9jFvjQNdK90pFLi/uA0+l/PGcsYbLSFg3ureIfomI+Ws00BA0MB+eRWX0iLMTR
	 6HjC4KoLZEl3uSyvF4V1JrqdKxLsaUlgr3MDKLz2qDmljt13pDo8oLGskwOKuJR5NRdD9
	 a5zL0lti7FZetjkFoHMJ36zSDaWS5N/O1JQ6LP26IyOwvkwVy5mXotIicOVnVObwJmLCm
	 +pzdHQFsw7yXQ2jBstBmcZ3oj0j/zEUYcpNwHajv/+atFF6Xp4ICJ/AsC08rDmxM3fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JxJI0SDh;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0B60A3819;
	Wed, 11 Nov 2026 11:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC0B60A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=JxJI0SDh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=k2NrxhUNhWz90Sj+Vfwvx9E4ild0CjBUkFBsTKTSyQM=;
	b=JxJI0SDha1/wXQ+uyR6dt5VB1Mt9UXUWsH2uP5/NBL1d2KiUp4aVADoewefJxsJPnLB6IyRxp
	AdhKysOJE5nC4jLlavKsMwCX/yNV6j4yNSmy3Z7rTVokAk8nJVwRQmJDnVJItJTkaQD9xGmtbGS
	ZcdOgU/GZssGxY5ca0AQlO0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jPhV21WtDz12LFg;
	Wed, 11 Nov 2026 19:43:06 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4276040579;
	Wed, 11 Nov 2026 19:43:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:43:00 +0800
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
Subject: [PATCH v21 14/15] arm64: Inline el0_svc_common()
Date: Wed, 11 Nov 2026 19:42:24 +0800
Message-ID: <20261111114225.3977243-15-ruanjinjie@huawei.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)

After converting arm64 to Generic Entry framework, the compiler no longer
inlines el0_svc_common() into its caller do_el0_svc(). This introduces
a small but measurable overhead in the critical system call path.

Manually forcing el0_svc_common() to be inlined restores the
performance. Benchmarking with perf bench syscall basic on a
Kunpeng 920 platform (based on v6.19-rc1) shows a ~1% performance
uplift.

Inlining this function reduces function prologue/epilogue overhead
and allows for better compiler optimization in the hot system call
dispatch path.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%   |
| usecs/op   | 0.219575       | 0.217192        |  ↓1.1%   |
| ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |

Two notes on the inlining:

- Syscall-path stack usage grows slightly.  do_el0_svc() now has a
  single 112-byte frame and 13 calls, where previously a 16-byte frame
  called a 48-byte el0_svc_common(); that is +48 bytes of stack on the
  syscall path.  lkdtm's KSTACK_ERASE confirms the 48-byte delta at
  runtime.

- do_el0_svc() is not noinstr and stays in .text, so the inlined code
  is instrumentable, as el0_svc_common() was before. This is fine:
  el0_svc() only calls do_el0_svc() after
  arm64_syscall_enter_from_user_mode() has set up the context tracking,
  lockdep and RCU state, and do_el0_svc() is in a different translation
  unit, so it is not inlined into the noinstr el0_svc().

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 4a13108defb0..2535cae9413d 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -55,8 +55,8 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	syscall_set_return_value(current, regs, 0, ret);
 }
 
-static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
-			   const syscall_fn_t syscall_table[])
+static __always_inline void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
+					   const syscall_fn_t syscall_table[])
 {
 	unsigned long flags = read_thread_flags();
 	unsigned long work;
-- 
2.34.1

