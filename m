Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794397378;
	b=ELfYhuFtCs736fzoZWRrPE2CotH6UgrNAOA/BDGmjtpANaBjdTolA239moSX3VkikwXm
	 zVIc5i4spgczr+61LBUcr+8mYa+Yq9altVmloUwvuuS0OvYxOko7e6c2WSewp4z5bDzud
	 9UNnaX5FbkeTF5Lear8DNCIWy7dfCsyGdGatkjGRcODTXY+zH+d72W4g934eRykEkOz0n
	 hy1WUHITPgPqrOPEv5FbEm8PAByILxLcZwaLX2gnQ/Mr9Ex+EiwMHBxX13OHemCyVIsYp
	 Zb8A36LiQjiQMzWtIXKwWB7NsenwFCjIImbFL2Bv/XrrlVafkDDfF+14/BIe5ammhHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397378;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=QMaAMs6xR7T/aO1N9I//k1I6DFurg91LjcHnmn/S05Y=;
	b=JuHcNEXdsGsu/YEyM4fHmhJXk3WmwFpLIMY6976iJgrQ7cO7bm28BCMbPPqfHknsBKWa
	 UO61nMq8+Big+yYJY60xBgqKEwI9RYn8tSoLiUjTeUi2TeS1RT/Plfy5jY9T/WPn0CmHe
	 vcpVxTZ5By9jKag2IBIynBmVAfGXeVKxjS0NBq8nfp/26J69qTKlYZj61XyW4p+XvmuTd
	 pY8yFir092tIqYctj4HlujmZf2ruHgtpqWWvxrbh/POO/fAx9O0nHOlJk3LwXb8ANDeYz
	 irByQ+GAlsB50ZVtds6sR5WQQg1V4gTfyNc/Nx2NYc9OVlit6N2XWAQ85+yGjDl/X7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cQPtzUtv;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616E606A33E;
	Wed, 11 Nov 2026 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E616E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cQPtzUtv
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QMaAMs6xR7T/aO1N9I//k1I6DFurg91LjcHnmn/S05Y=;
	b=cQPtzUtvy2o9PL5FMvDO+7Lzag/wZrtRtjChma0olY1padw+2L0H7MUQQazOx34Vu0fvX7AvS
	KCpGzLlP91dXed0wvh2mEFX5IgLXvih0ypczLFyJmutIaZnJQxJrENA295oad1aH9E9wV8bA2SC
	gm1GxiLBssIuuZObSbM6nBI=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jPhTX2TcwzmV8Q;
	Wed, 11 Nov 2026 19:42:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A3A240573;
	Wed, 11 Nov 2026 19:42:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 19:42:54 +0800
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
Subject: [PATCH v21 06/15] arm64: syscall: Invert the exit-path flags check in el0_svc_common()
Date: Wed, 11 Nov 2026 19:42:16 +0800
Message-ID: <20261111114225.3977243-7-ruanjinjie@huawei.com>
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

In the fast exit path of el0_svc_common(), invert the nested flags
check so that it calls syscall_trace_exit() directly when work is
pending and then returns, instead of returning early when no work is
pending and falling through to the trace_exit label.

This makes the fast path call the exit work in the same place as the
slow path, which later patches fold into a single helper.

In preparation for moving arm64 over to the generic entry. No
functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3e78e159b2a1..b8d7d29a431b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,8 +127,9 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			syscall_trace_exit(regs);
+		return;
 	}
 
 trace_exit:
-- 
2.34.1

