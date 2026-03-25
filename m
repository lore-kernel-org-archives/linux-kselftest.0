Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A75A351C02
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429853; cv=none; b=RAw/4CQdTxH5wAFqO0F7QItGvFw32uWOTibiS8plx5E5/XvwwXSN5H/KRnrrwTcbEgf8gSG4h4zWiBt2gcdg0vqEBES8f2GIM6D3oydkWAcQsag2PBs/kw2qztcSVqlsqo4KVxKr5k36WwiayhkSYWuk34lwZ2FnHb6AcJtBVtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429853; c=relaxed/simple;
	bh=qg8WLXL88Iept54fzSGWgFgBN1HmxL+HvwvzbJJ1K+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEFiXwLhIy7qkGdgwuPYLwZrGRhIBKEQUQN+JsBDvhZLMLQW/8dyVbM9JTrYqp0AXOIShxslhA/eruUmN3MhPieySplHNABdw2pSJ+1doByFSYL9gvojSjdLFtJENgpzGtLa8NV+UgXzlhnmK4MzF+6I2l1VNcC3v40iDrzVMO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISUg5NGP; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISUg5NGP"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0fa90d47bso381457eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429850; x=1775034650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZgSquaLuKBFQZpkdx/1H4ca5cGKSrUW15huIE1GEBI=;
        b=ISUg5NGPIpEfbQsjlwC1Er3p4lCtuAt2FDC0Kwn+O9eMIErydITTEx7nqkASOssODr
         nUDQYRuPLnwXrAUunGsnPjoelBNnq6+VMv37sBofsfopkVEDKqwM0G83asN4xCjWiP9h
         /aMSAxRQMrAv/VOf0bSZj1MSf6ynk0EXYWjjcR4dcnNq+fLMxesPFCoQp//aP+1LT3b7
         A9ovAYckunhqKFj+9A2M4p6T3tnIsqzgjKakPuxq2k+wNE0WrE4S55mIcwPXGTVU+zSE
         /Y4yjn439dlLF51w6l8pGzE1P2Fjichtlj+ufpsXv/8p5FmzpDFKOhtR1WsOOB+UEvey
         y4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429850; x=1775034650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0ZgSquaLuKBFQZpkdx/1H4ca5cGKSrUW15huIE1GEBI=;
        b=RCXSe0jHd0c20TvDFK4JCGsA/ZlQq7LpUr5LGmcqSgq207b7/QsRjBJLbMgxu+vBCI
         98B5EEk61S3iIAGhnsDscfqiDx7x4kOM/p/aW/jiwP10z4DxmdLjQtR71ySp+yZIK+DS
         EDjHiOf0ruoJO6M38enPNOyww2bCyO6zV4TyQnHq2uG3EZ6W3eSO/VUyafxYUbrqUc9p
         vLeFftAXQYuiYZz4D7MrFVj/zw8Vy3+PjJJhqCHh3drUJG4wnQ5tTRzzBkMO/yxQKapf
         zIJSaWxwEFDSDBl3I/uPCm1cyc1I6hGkVAAEctjbZdjp7ZJRw1zxlZ5nPRvDn9jTpNxn
         MSWw==
X-Forwarded-Encrypted: i=1; AJvYcCV14Bl/1Clw2bfmjyxi2WnTJkaj8FXUTvYbFN8FWJuKqeCnJ2W3Rgg8vKSPbt+1ahpAkgKuXWJhrj8bwlh3LFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEP3bnLWdkHW5xE1YEeJE+7AU0hg4itopW8kTo6V7qsMcVfvG+
	1IUh4YkErGpwN2V790qJqQsnUrhSxbcBsuy4u0vWi+SRpB33ZoUS4m8B
X-Gm-Gg: ATEYQzx69zYXlhzVP1zUWw3G7xMXohON2L46mWSSwvTx72R4alISxWxOV+wrPvnxMie
	2ipsOlnvoekjGKM1duaYs07k7Ox5q2r/55dyLnt/MsuZi36GDmJITwoxDpoSE5lzZdDOjp4L5h4
	9bzH/0tTvfDDXCA2U+KCjUGICGxAxZ55S1hPMRek/3OSInn1ErdsavnBueeRipJ0++QgWOy6JiE
	dj+eddXz8ZD+FWOiyBVMLpJYJ8JYVWds6Z+Jl5Qo8BjQWMXcuHB7zmkjQNs+Vo3xLrjm00kDr9U
	rDnSdEPGAirtOTQ0gKgFK3fM2OTsqovCuH6Ph1LcDskEX+P5Vj+uC+dXZPNJlQmUQv2pscdFCBw
	s67IQm9kQSeGipxfgd1OMMerj2RqDR4eIKIeK+99XZLY7Utwr0o50OOX/KIPu2PVZqdq9DA3qM9
	+XjIPdpld+PazedjAp
X-Received: by 2002:a05:7301:9f14:b0:2c0:ac4e:1516 with SMTP id 5a478bee46e88-2c15bd3cb1cmr1301131eec.11.1774429850168;
        Wed, 25 Mar 2026 02:10:50 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:10:49 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:40 +0800
Subject: [PATCH 09/15] mm/compaction: Support dynamic housekeeping mask
 updates for kcompactd
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-9-919cca23cadf@gmail.com>
References: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
In-Reply-To: <20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

The kcompactd threads are affined to housekeeping CPUs (HK_TYPE_DOMAIN)
at boot to avoid interference with isolated workloads. Currently,
these threads do not migrate when the housekeeping boundaries are
reconfigured at runtime.

Implement a housekeeping notifier to synchronize kcompactd affinity.

This ensures that background compaction threads honor the dynamic
isolation boundaries configured via the DHEI sysfs interface.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 mm/compaction.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 1e8f8eca318c6..574ee3c6dc942 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -24,6 +24,7 @@
 #include <linux/page_owner.h>
 #include <linux/psi.h>
 #include <linux/cpuset.h>
+#include <linux/sched/isolation.h>
 #include "internal.h"
 
 #ifdef CONFIG_COMPACTION
@@ -3246,6 +3247,7 @@ void __meminit kcompactd_run(int nid)
 		pr_err("Failed to start kcompactd on node %d\n", nid);
 		pgdat->kcompactd = NULL;
 	} else {
+		housekeeping_affine(pgdat->kcompactd, HK_TYPE_KTHREAD);
 		wake_up_process(pgdat->kcompactd);
 	}
 }
@@ -3320,6 +3322,30 @@ static const struct ctl_table vm_compaction[] = {
 	},
 };
 
+static int kcompactd_housekeeping_reconfigure(struct notifier_block *nb,
+					      unsigned long action, void *data)
+{
+	struct housekeeping_update *upd = data;
+	unsigned int type = upd->type;
+
+	if (action == HK_UPDATE_MASK && type == HK_TYPE_KTHREAD) {
+		int nid;
+
+		for_each_node_state(nid, N_MEMORY) {
+			pg_data_t *pgdat = NODE_DATA(nid);
+
+			if (pgdat->kcompactd)
+				housekeeping_affine(pgdat->kcompactd, HK_TYPE_KTHREAD);
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block kcompactd_housekeeping_nb = {
+	.notifier_call = kcompactd_housekeeping_reconfigure,
+};
+
 static int __init kcompactd_init(void)
 {
 	int nid;
@@ -3327,6 +3353,7 @@ static int __init kcompactd_init(void)
 	for_each_node_state(nid, N_MEMORY)
 		kcompactd_run(nid);
 	register_sysctl_init("vm", vm_compaction);
+	housekeeping_register_notifier(&kcompactd_housekeeping_nb);
 	return 0;
 }
 subsys_initcall(kcompactd_init)

-- 
2.43.0

