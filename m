Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1D4E2F1F
	for <linux-kselftest@vger.kernel.org>; Mon,  5 Oct 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220670; cv=none; b=FRjbHjFhSziRka2t8pfnc6LK2pguW2qnE7+1lJfY6zpjvnuPO+ATRZAlVrkNfjW9nJp+6sZOPet8w3MJKYnftjPogyoDzXPpqgMBoSZ7juw7ku0mFabNmeyDLFwuB7ZbFUiP7WDJbzhpZ72rLWqWpL4pTOC0ZG0voJghjaQCBAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220670; c=relaxed/simple;
	bh=9oP9VQ+JM/9PdWJ+5+ZGbwB85sJAY1eTAyp/fwZIqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFShccywQ1FF+z+gF9EfeXmup06ur7DFNiAdHEcMTiJogfpJAwWFszlZqu6ZzXl7NrmRlAgF0NWmLxSrZS1ahMEwNAfMYGPX8SekBoSRy9qhQtbt1yIE1KO41F+JluvfVBHIuncpUTlDZ+GQ6mIN84AHYGEn7lXgcJ91xtr4NdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ns7XeNDB; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns7XeNDB"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1090844a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 05 Oct 2026 10:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791220668; x=1791825468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=ns7XeNDBEiEeUI6DMxj/Lo+OKLE2ftneMsq1CGeZTzWJRXOKh56hBIMnCvzzCvJgU+
         u5szmqm6erw6fCCc8Hs3KGvR8Rak60TxHSEBaYSSTzVoxI0+Bn/DaNuBq/vuk2hUI7sC
         T5gEDkLnnar+fyq/sr0SrB45DqULc6J6418sm+qEfA2KDhHo8+7F1c3XzDp34qkSXmIv
         xawx4JmY4YmKW0vvV/nFuajInG/3W7b7gFEnLEDxoQ+SLTVndRg9AsGhL9HADg0H1kSh
         sJXr4JDrKcW4xhkCgvQpoAnBFmO9OzrHMXCg+Fz6tKWihM6jzVqWYhTYtkPdCIdRo/gp
         i7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791220668; x=1791825468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=qSa7z5LF1oUJ01p96Td7T8ErelrzFjGL+jBqupgfZ9T17fZW08jfedSo6wfkf9MIB4
         lRkCyHL69VggHQbbUB6oKGm7s7fCZP0VEQXGU8htSS1FvFenfkKKWooex3JhxdmJZgxa
         RqBfZN2iSizd/oOaLyZ4Kr/Wc33rdxm880hZ9cG5b3Svf99TCKJDgUEPgHsHQnEkUR5F
         xf9fIV6dUmKJp6E4VzYcw1495f/+QTV6vhL62pUPjHLBKI9XNT+UCd4tiBGRrhz6Mlh1
         LmfiUhcew9IqwEp/1d2BfsBxnPDxCDdR/GkgCm+BAl3nSTB7tIfmHHOUajHJB6NmwEPs
         K/xA==
X-Forwarded-Encrypted: i=1; AKwUvBzLQ8G9u+9/Uz0dsVR/3jZCbpaQgR5Eok3Te2kLbMsBGlxN/vsqhxOxsx+9x1R6puKA6RzFHQe5ohp4naYTf74=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7q2m597wEzlOsjCs+IURdBgDc2V3xJ9iqKMo9h12bJABueBgM
	WbU1zfTZbv/gbXz+YtGolfV+XH2WxEWwefkBkZUj7xX4bdd2BjqMMGqw
X-Gm-Gg: AYBFou0O47fI7MIFvsBdZsRGrIWWpEhPYSfZ0j6Iin/2Va6Km8/2I/B3xlSmiFtso+M
	OgHwBS3KIz6cY4pVKPRoHjFb1LKTl0cmxkcPeBGI6cEsjm4ZEW8KR2wwZL3HBWhwXGYRHr/aYUq
	aE+Uhm4K6UBc2r6KGdeJyi0ggUaAXBbNjf8lPq4eClVC3ftpkST4nmlmfU8XWvkyWDrOmUsjBzn
	rO6DFeZZdLHCoJ0xUD1cngBjDjtOj0XaB/tpAonF71H/Nqwa6HQzAV/3ugP0zzrlRx07KyGsOlZ
	g5dQci8Rq6QjUribLmalyqZTN9dqzflnAqNf+duIVr1tNtVwlG00bssH+/feJAcsPXGUdHgf547
	tZgxlCEylQtJXU0CXV3wwfMYQlI2nxNqeNVJefqwic9qjpz161ylaE+FshmdXmCw+QtVh8hewUm
	dDMZRqvEzZTy8qjl1s+hDBlY47FK87bl1jXoxqgfNBFJJDO+WaEq3VH0iVGgf4Bpbarl8X5pSFh
	SgAPSkPB+5Bj0ceGE6PZlJ5TCkHkBaf3KBipVSD
X-Received: by 2002:a17:90a:2ce1:b0:3a6:dc2f:f087 with SMTP id 98e67ed59e1d1-3a6dc2ff4ffmr2745576a91.53.1791220667397;
        Mon, 05 Oct 2026 10:17:47 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([216.195.201.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853cafddesm406910a91.10.2026.10.05.10.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:17:46 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v3 09/15] rcuscale: add hazptr scale type
Date: Tue,  6 Oct 2026 01:15:23 +0800
Message-ID: <20261005171529.1378809-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005171529.1378809-1-kunwu.chan@gmail.com>
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hazptr reader and synchronize operations so that synchronize
latency can be measured alongside RCU and SRCU.

Use a small set of objects so readers do not always protect the
same target.  Each reader protects the object selected by its CPU,
while the updater round-robins through the objects.

Use hazptr_synchronize() for both normal and expedited scale
operations, since hazptr has no separate expedited operation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 70 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..5aca31c3c01d 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -39,6 +39,7 @@
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
+#include <linux/hazptr.h>
 #include <linux/sched/debug.h>
 
 #include "rcu.h"
@@ -418,6 +419,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+#define HAZPTR_SCALE_NR_OBJS 8
+static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
+static atomic_t hazptr_scale_sync_idx = ATOMIC_INIT(0);
+
+struct hazptr_scale_state {
+	struct hazptr_ctx ctx;
+	void *addr;
+};
+static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
+
+static int hazptr_scale_read_lock(void)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+	int idx = smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
+	void *ptr = &hazptr_scale_obj[idx];
+
+	state->addr = hazptr_acquire(&state->ctx, &ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	hazptr_release(&state->ctx, state->addr);
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
+	.exp_completed	= hazptr_scale_completed,
+	.sync		= hazptr_scale_sync,
+	.exp_sync	= hazptr_scale_sync_exp,
+	.name		= "hazptr",
+};
+
+#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
+#else
+#define HAZPTR_SCALE_OPS
+#endif
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1110,7 +1176,9 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcud_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

