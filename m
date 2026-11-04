Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811533;
	b=bl2rhk4cEGqK35yT2oOfLcieSJ7gfBGoh/SCstXxOebsgDxaG1tLzxiBuYlTI2TfSI9C
	 pHUsSHuSVA1neba4AdeKZLMXqVIKk8Ckow+qyiWyPO3J4wYzK5+3GmU8B9qIxMRXJD961
	 NrjPXP+jvCe5RvLzbWSPRzq+a0zB089bNK+9pxP9XaxLrhGaxfly3+GY0fjPkjlO2Efs/
	 LSvTm+vI7/fyVxJ5GX8CNYhW4XWWIPz4BD8lBusBk+EDYpitkvMRIkf22WvqAVc788vrf
	 WSAfrKUUNo+bwedtJwmOM2AbYCVGX4OiZL7TYemicpURRyXtQa0MLAqEXwIlAlrv5yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
	b=Qjyp3Di9Misx76I/1GmvMpB5MVwIPtuaboXOpsG+GWtZf/d5U242SzH0nta1fgOmG8vi
	 qJmJ4+bCrhDQmx6Df9qks5+4tNLfF+LvZYJ+5V7IYemBxuNqwWWf7PYTKz+l4tiwhjMsu
	 zUp2WsrJab+8ANG6ABDqxIhbbYZe7FtQ2VGpaFPIF1b2cHjlfp54RSM/oS4Ci5vE9e4au
	 Ss/+tS4ME0cfh6OyVoZ8I/p8w7ssfSX8kI4MutP3fHqlCUbp53eZ3usVGb1PhkSEp1J6L
	 gS0ttAKEDcDXmbKkU3vu4xffJjau1rq4GBg8i6ydGdPf36TEg5+eIOzv5HMCGmofmdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F85606EE99
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 16:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F85606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so1345505eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811532; x=1794416332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=ANygCtmEabL2DlL1vQlsQM2V0AtBPyADMKMlCJWmID9fbbwmQs5upuFgx6EU3yvhKo
         6caM3e2hkkYO5GJr7HHs+Js9ExbyddYDzxIlemrd8dAXA7Zu9APdFA1UHE8diifgdk8a
         lmdBb0VWG5nNoMzfJrINFe2jSCYp+laLzbezywwABqXJTWGEic2IdMbDjiSu5RV0+CVJ
         eIqDGjL4iNpOnsFQO7sePrDbbe2pzXFrEn6oNowXFyvwpyOWoIVbsF52+leys0IMgc2l
         DNaM0njeFmPb1ZBzxYZ6tHpA5QdzerC11YzE4j+NaXlXjJhySqwp7mgr6wcLnzJmPe3C
         ukow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811532; x=1794416332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=YfndChIt6v8ot8aiq08xqbdly6orFfIUlQ6jfpwRI12hm91qTBEKtHRDdwkSCcKxZW
         gsxDk5dYsI5UQ1IUTqTxXCx6peKXNVqCEvsKcv+ziHXO4ml4pWJozTyCMERWYuj2jEk0
         Gy88rPX318RzqI3z2p+T/ZED5fRip+YQDePwulW46ILgaoZj1IIu1XI1j75Yfea69d+F
         eIO1Sbl7OdXAGqr6lk/qAoaxf+DqtxkxhjML5gGXSBCem6H3mXsJO0l0tIBPjon5mFJq
         kHZSZdx8BcR/8NuFlf142VTKQYdghmBJjMHakq39M/HqQVQ1NfC4KhFtQeMW9RDZsyrQ
         unVA==
X-Forwarded-Encrypted: i=1; AKwUvBzSsotRqSyLJFYR7XxIgIIFNzbLP8m6d0MJMblu4iRpIKU3MH5pu+FTOs53xqQJgdSJiBbjIRCVASazpq0GB0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kP516EQyP/kqoiJHFqVwTWNNFjdUskNKKsIGU//+Qt8wFPEPB
	rYQgOUi5ZA8P6qS0Chaa6GYqNNF1XCHMdULdsjbQ4EF8igN3uXDj5ETZ
X-Gm-Gg: AYBFou2HwHQP7WTrWT6oyEo82fNIm6hPiuvxr+5scaw+RivMrp1ItxZuJPV+DKTqW5m
	ZEtQj0Aj55L1mPfuXcZ4luCyCcYSmRzctNUoOlppX6umI4nbXMNKxFFzY/26nUZaM1bDsNk44zR
	1nPqdVrLeSN5H6Od0SZd9lrD7tiDsWf/FlHekD1U5xM7zmdxPB0kRMfVDfJasjDpZ1crp160kM6
	dmsYoL7VQypbjNGtkMJZoL0xlcMFABvmlCzjaMQ6/2ioXJrN22LUA+LXh4FU5c2ieX6CEH0PL9V
	YnAvQTIADWIpZeyM7mjyA49PQvvHoBjwyz61eV4f7gkSDsEzycxjrfDOJy9bN/oHEnSu9/mrpOD
	1ed/TkL/zRjlP5tA7Q69xLhVXxb0kEmOBjJOMM33YujJ3H5BKlnxCJQvHqbTQiLkfNKrjoTXY/9
	nYtqgn2easS3cvPIQt3qWTM1XnVBnQoYLlL3y2O4VKP9sQBE2qscNYEK91nzAeaksVa8uYu9JA/
	ZgMD59YJVEYQQOK6w+mag37zoL+ipxlhr7iCQp/Qi79yvw1kx/RE9H4YLC9ZMjaUcMIbkWKkflk
	VdpRkVtlNrqYPngghC7421qrje7UDujRWfswFgcjN00qFPqxJgmT3ApW7Mhd
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr37599893eec.31.1793811531717;
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
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
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 23/28] rcuscale: Add hazptr scale type
Date: Thu,  5 Nov 2026 00:54:41 +0800
Message-ID: <20261104165504.2430480-24-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add a hazptr scale type for per-writer hazptr_synchronize()
cost and per-reader hazptr_acquire()/hazptr_release() overhead.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5659eaebc5c0..6e3e3f296f85 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -40,6 +40,7 @@
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
 #include <linux/sched/debug.h>
+#include <linux/hazptr.h>
 
 #include "rcu.h"
 
@@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
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
@@ -1140,6 +1206,7 @@ rcu_scale_init(void)
 	static struct rcu_scale_ops *scale_ops[] = {
 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

