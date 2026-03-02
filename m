Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D01E8320;
	Mon,  2 Mar 2026 06:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772434202; cv=none; b=aMUnWubYEJi1+mMEeTluasxT1LpJsUVoJg/SiPDBFRLwe1NtP1WHmgku24cDo6eH6YZk807JNaB1QupjTgWwSajgocl6/NHhORb7OFfDcjxn0Qs/tKaRDN52i2k0KrTTRr4hRGPI4jDsz5SiOQhH2mFbOhzLoU97Ax3rj9ZCptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772434202; c=relaxed/simple;
	bh=es08QVW7hTl3XMoeEOKefu5ph+RdgJ8wPYzRQfQoFek=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LuNzX67S8oCcwpZjYYbWjgTgkUtyfvVOaWllZRUs9wKBtVO9kcwN8BfdfllxsW9x/IItAsSKcor/vaNw914VKlB4fo8yicT9r7ZqeSIEJ78wxT6Dn5rhRTY7ezDGTAJPbVmQiOq/QviX0EgAQESwCcDIJ95Kq5EwhZbujuMR4Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Kg8e3DXG; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Kg8e3DXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kr
	ZO426PFlDorEa2A0nidAbqtyuzFQ2nQjRkAmJV+mQ=; b=Kg8e3DXGgFBcKwu+SX
	nd9eo7loZySauY8873BK24KqNjRL2T0Z2Gu1M1L5hERS8WFmvIhHo5pUhvyvv5Zx
	WW1vOm1607dP9NBnqRe89gTf4fWUg7d9d2FyHXPR3oxHFlOlZws4RvcTL5LJtS/o
	igiTSXcgW6r4LX28qSZ33olXg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnuD7TMqVpFsyuNQ--.14978S2;
	Mon, 02 Mar 2026 14:48:53 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	shuah@kernel.org
Cc: sched-ext@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/sched_ext: Fix the incorrect logic validation
Date: Mon,  2 Mar 2026 14:48:51 +0800
Message-Id: <20260302064851.370327-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnuD7TMqVpFsyuNQ--.14978S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww48AFyrWFy5GrWftrW5KFg_yoW8JFW5pa
	4ku3sI9F1ktF43K3yxtrWqq3yrWFs3ta1xXw4xJa13AF18Xry2qr18tFnaq39xWrs2y34f
	ZFyIg3yxWa1xA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jePfQUUUUU=
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/xtbC8RWF-WmlMtUNFQAA3v

From: Feng Yang <yangfeng@kylinos.cn>

When __COMPAT_scx_bpf_pick_idle_cpu_node selects an idle CPU,
it reports that the CPU should be marked as busy.

Fixes: 5ae5161820e5 ("selftests/sched_ext: Add NUMA-aware scheduler test")
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 tools/testing/selftests/sched_ext/numa.bpf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/sched_ext/numa.bpf.c b/tools/testing/selftests/sched_ext/numa.bpf.c
index a79d86ed54a1..98423628b05c 100644
--- a/tools/testing/selftests/sched_ext/numa.bpf.c
+++ b/tools/testing/selftests/sched_ext/numa.bpf.c
@@ -44,12 +44,12 @@ s32 BPF_STRUCT_OPS(numa_select_cpu,
 	 */
 	cpu = __COMPAT_scx_bpf_pick_idle_cpu_node(p->cpus_ptr, node,
 					__COMPAT_SCX_PICK_IDLE_IN_NODE);
-	if (cpu < 0)
+	if (cpu < 0) {
 		cpu = __COMPAT_scx_bpf_pick_any_cpu_node(p->cpus_ptr, node,
 						__COMPAT_SCX_PICK_IDLE_IN_NODE);
-
-	if (is_cpu_idle(cpu, node))
-		scx_bpf_error("CPU %d should be marked as busy", cpu);
+		if (is_cpu_idle(cpu, node))
+			scx_bpf_error("CPU %d should be marked as busy", cpu);
+	}
 
 	if (__COMPAT_scx_bpf_cpu_node(cpu) != node)
 		scx_bpf_error("CPU %d should be in node %d", cpu, node);
-- 
2.43.0

