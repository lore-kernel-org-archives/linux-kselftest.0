Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38343921C0
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772801352; cv=none; b=VJFFG2XevSwF2ysGWqKLG0rHbR3hhen20IP4RmPWmkW0EytKzKi8mDRLB7l79bpM8EBzlPYlM+xl0+RQ477wU78RgwMy7o6mw2+Ny6xmbNcmq0PTIxHb1QZ9x8JkCemtSKBfbOGwSRgqeIkzymciIDc9JR40DxDG61HjkL1V4L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772801352; c=relaxed/simple;
	bh=0OeY0xReBFL8eCyB/FrdWjGk3Mhp+R/qkHPO1eyeEZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mk7AnSMLJ5Ih1rCC3g4k1m4awn3NNYJbcxgVJ2Z02h1OHddnQR/BKgi7qGlZqa/UVmKMFwMq/6uCsed30TwXUWYsHujZwrz5iovUrFJNF/G57/Qz+3IUTJKNbMZ45NYsK8P2guGJ9SPcH+vHbF/MtMac8T2FX7ERtzA0l7ZbY+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtGMHuNF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtGMHuNF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-359832fc558so4531535a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772801351; x=1773406151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=usOL8l/KNsMfxD0BXV4D931Ky3sdKsa4TTa5Fbius5w=;
        b=DtGMHuNFwvjoI/7+psX/YiF65l6F3AeEtusUqqz+whu7UcODWPC9X5gRH9YP8caihO
         CkgZ1+tT2BOnZX7Do9Myod5yTtSueYBt45v/5aiEsu8f8sAUX6XS9fJdoYAKipwspPMg
         gggi9LGszSDqGFoE9/bXzmyRwnoBtILPToZCXeo0rWKH/lOymloBq8WsazDLya8E1jRk
         bC9lJeX8U6KVzgxWvPf32AWV9GyjJLhGMIPrXPV2MjgX7PxfbJdmG7nhtzyd5G9ayWN4
         L8skd7QXOenghIlOQowLA/GUs/iS3KgPEqZt6zLwJrakkBPvnpsrXrpJhH4z+tk2F8Bn
         SEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801351; x=1773406151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usOL8l/KNsMfxD0BXV4D931Ky3sdKsa4TTa5Fbius5w=;
        b=NWVdQwGDfs3hoxbUUQxiLNhYbeCi17+E966IcVqYYKdHTTAQ0P8niygdSJOw5DJ7DB
         OPnpm2r91BPe3k/dVcMFn9+IFHszmLUt02LQ33tfPA1DVqZqepCnifMuV45+ZWZMNk9g
         8F5DJ4BRDEA3zKkIVj3nMb0eKbpiHRELodn3TkO9Gc9WaKs7CYcwHdFYlt0V85XBxjR+
         O5Nn+luLwVnjAbiOZT186R7YCrgzICjWB2auCbIw1+D4KcGibADmMc5G34sgO8xOAqvZ
         GxNeAxS6xYUnu6qdRLx7ylZznH13kvkynd8FarG4dz6NNQDxrS2xwtdxRo1MKET7Dq3e
         SXQA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bXlZlvdYwDhuX99jgmIYa0u14qsbzeXUhhzgFwyOsze0dIlwddk0Rb5rfwkG4J2sGqimxrD/ilkkvGlvRSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKLplZ/o3bJI8Ze2Ivx7byIK5fhn2HuVGLCvIX0l04rHA67SY
	1UcUJdVYw4uVn8I13b7UtOy4YOLT97hip33VuD4VrUcN2WKMDoa+IQX2
X-Gm-Gg: ATEYQzyU871+MspSWrg7j+9fyrR3fTIBqt+DjHkXi+Snje94Fvn3gf1juunpu41Ck7l
	XyvTcm7ziWIaRjP6gbyq6d29uxdaEJZZghgPQ4Zpdbm4uVeAVCGHvBDHvCC/A8BEZjXVy/muL/6
	LYglygPoyGKUJtZBgDwXokjFEppeyDChBTITfFXzKiHGvQRNFXqjWRE9yko8eD3jkmAl7Qqr3kq
	G7KirUyiClMzDQmHT3L8mU/ZVGfJXELR5V12CEiLkB3UqWoH2ERQTtV6sxCoFhf8ueEHEyGjQaX
	1pk1SNUCHvy7clNhBGgRamUal5LXvpWAnysFyNBrnEvYkC2SBYkYwS7Gxu4vdmgdqawShmrtkdq
	EfG5r107sKFfkRM/AxgIFXBzBEKx/CcLHlLsUaMD6TbDkpsuF8xNV8AdKauhfDgDzwjvezU2A+I
	jMBxqIntJfFknDVkgOqESpTlfzFh//CJp/rTdoVGNbJJtrTg4Zt/A8ABulqkHtFaZfC5wqJrZVq
	FU=
X-Received: by 2002:a17:903:faf:b0:2ae:7f7e:93a8 with SMTP id d9443c01a7336-2ae8248ab08mr22623655ad.51.1772801351191;
        Fri, 06 Mar 2026 04:49:11 -0800 (PST)
Received: from mi-HP-ProDesk-680-G6-PCI-Microtower-PC.mioffice.cn ([43.224.245.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e78f77sm27712845ad.21.2026.03.06.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:49:10 -0800 (PST)
From: zhidao su <soolaugust@gmail.com>
X-Google-Original-From: zhidao su <suzhidao@xiaomi.com>
To: tj@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kselftest@vger.kernel.org,
	Su Zhidao <suzhidao@xiaomi.com>
Subject: [PATCH 2/5] sched_ext: Add comments to scx_bypass() for bypass depth semantics
Date: Fri,  6 Mar 2026 20:48:58 +0800
Message-ID: <20260306124901.2653465-2-suzhidao@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Su Zhidao <suzhidao@xiaomi.com>

The bypass depth counter (scx_bypass_depth) uses WRITE_ONCE/READ_ONCE
to communicate that it can be observed locklessly from IRQ context, even
though modifications are serialized by bypass_lock. The existing code did
not explain this pattern or the re-queue loop's role in propagating the
bypass state change to all CPUs.

Add inline comments to clarify:
- Why bypass_depth uses WRITE_ONCE/READ_ONCE despite lock protection
- How the dequeue/enqueue cycle propagates bypass state to all per-CPU queues

Signed-off-by: Su Zhidao <suzhidao@xiaomi.com>
---
 kernel/sched/ext.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index 56ff5874af94..053d99c58802 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4229,6 +4229,14 @@ static void scx_bypass(bool bypass)
 	if (bypass) {
 		u32 intv_us;
 
+		/*
+		 * Increment bypass depth. Only the first caller (depth 0->1)
+		 * needs to set up the bypass state; subsequent callers just
+		 * increment the counter and return. The depth counter is
+		 * protected by bypass_lock but READ_ONCE/WRITE_ONCE are used
+		 * to communicate that the value can be observed locklessly
+		 * (e.g., from scx_bypass_lb_timerfn() in softirq context).
+		 */
 		WRITE_ONCE(scx_bypass_depth, scx_bypass_depth + 1);
 		WARN_ON_ONCE(scx_bypass_depth <= 0);
 		if (scx_bypass_depth != 1)
@@ -4263,6 +4271,10 @@ static void scx_bypass(bool bypass)
 	 *
 	 * This function can't trust the scheduler and thus can't use
 	 * cpus_read_lock(). Walk all possible CPUs instead of online.
+	 *
+	 * The dequeue/enqueue cycle forces tasks through the updated code
+	 * paths: in bypass mode, do_enqueue_task() routes to the per-CPU
+	 * bypass DSQ instead of calling ops.enqueue().
 	 */
 	for_each_possible_cpu(cpu) {
 		struct rq *rq = cpu_rq(cpu);
-- 
2.43.0

