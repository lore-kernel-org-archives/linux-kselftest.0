Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC73431E3
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 09:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429877; cv=none; b=Kw57DI37lhGf12R6HVyblt0TYF4yhAhPR8MA/gFennKoZY8RQHrpOmInH3/HVbr+3QktX3Tpr0PEF4FDIXE35QY7MGTenMWClrfmXOBBQ0UXzpkUQ5p/MIoS7XWH3L+DcDSi4JQnZd0uL4RajPlR6leZDRNomdTywSBS4A68IT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429877; c=relaxed/simple;
	bh=gZDjuCZnZUWwu0Zvd8wZfxxZBNGQo3l8lZvSZ9PYvBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTSC4BlqRVsaUPd9rwLXopcPDPeVCvecsebuantf59M+RsPXc9nFemCBZy+PhhSQAgqstdj6mkVcvczLtqXlargeZ/qTc1y8tLo3WK/Rp+Gd8efVso8tW/cAKcUAXU3iNWE3DxfWe5CDpkXHb9wNfHHOS965WpGp3/1CtJBDpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YS6wXGAe; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YS6wXGAe"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12732165d1eso3100120c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429875; x=1775034675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k0s0Dc7RCL/9ENJthFTImT096lJg25UlEll25yQMqG8=;
        b=YS6wXGAeUCdowzmn1QQHtFt16IIsunO8ysj5qyDG0CR23UlWvl20zgPkD0aVqtSV1m
         P4zMvumNcGtlF9uoyQJE/hiFm6a5YThL7PiF3Zs87Uk4kFShVXXt0FCLCrSn4IcCWlcQ
         g92yaK+yF1Gadha25N9KkgmMyByHUu3XOGls5ePm7d9QIrMV9QfAS3A/kutgnrHll1tj
         SawMSm9DYRDajIe1/FAKEKWq2A0BuEbYiltbtFajcuJcClB6hWum2dw2UQIHds5MRZTO
         LLxI+xalRaGqTiXwJ/Yiolagwk5oMbZW+DWzXEJqhc3JLlQu1LNzWwUg+dvaSQswPeaL
         dvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429875; x=1775034675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k0s0Dc7RCL/9ENJthFTImT096lJg25UlEll25yQMqG8=;
        b=jj5qE+57rozxdGfgDRIOO35+41Wye8SdajhuaMSVPjHPcorkIARHj8YMn9xiZje3T5
         vrB3OlgctgCZkIlNatS4NRrQEve0io7s/2qoRGJbHm5NO4uxxYRiZEHzkLq9w2TUb68J
         DpIHlsjwXx1FANeGn1btFfLdO4QPlOB69Gm98461pwKgTGAzsDnkp5VU+H4GXv6F3hnI
         oVPTvzNM7r+/JVkYguMzRXjh2lsYkY8cCvLNQlLe7cGo0FHdYdztoRFvPXQNVdd8nAaD
         OCKNxNLU5QecvS6eVdYQoIRebirBH28lkl+3bClzrM5mVs5ccRlepkYt17LQngDBFUkE
         3rRA==
X-Forwarded-Encrypted: i=1; AJvYcCUoOnbhvf+OTpIv17heudjHtxQWgdKt041+Uu37thM7mdI5nO2mM+0S3H5EHmoUld/URQw1HOO8eCrBgAX8wgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSnLOxyHvPZeAOlYhahuWU24u4zR89DKTfWlzF4j8QTYlZ0wU
	9rlJMCtu5IjBU4tbji1ZpHdqKAqYix372nD29I3jaorps9mMC0tm3aIP
X-Gm-Gg: ATEYQzxsiUbIedyr3WAG8ZnDosvjRS+tDjlrUrIwq+0i60Q8xzcE7lu+7eGxfPF+1OM
	4R6CkrRDdB+coP3XHOlalgDYtJvn0tGcdLdARcSR09zZgJ5MO0GAHXHA91MjdtWZNa6y/Qp8i1C
	bZ/7FPhLMgCq36krEhiXcl2EjNrJlN8taM80hgeyATLaPTRdY+DwGu3rffwuB9JKTjlBsyj9q6N
	nSB2UnU8f8n6gxweezWp2iJpX3Q47s7RVe1kHlMKwy00qStG5YWkoPPE7XJS8vCkbx7XAhKv0SX
	7g/D2vqGo3JW/SMhT/HpRtrhe9FCTX84BAU94z1z0fldCZlrflkGS6LNOSHgUUVk9UEWZrITAEH
	Me3RyrYbmkR6DknN5YfTDcRKAJKGLniQHKgF2AmddwKIw+FUtPVmNWEjmWf0ItLcNxYnYQZmVz2
	vs3EhR35px4b5XI/Ew
X-Received: by 2002:a05:7301:9f13:b0:2be:1946:857e with SMTP id 5a478bee46e88-2c15d35c829mr1429438eec.12.1774429874937;
        Wed, 25 Mar 2026 02:11:14 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c159e25dc7sm2786389eec.27.2026.03.25.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:11:14 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Wed, 25 Mar 2026 17:09:43 +0800
Subject: [PATCH 12/15] sched/isolation: Bridge boot-time parameters with
 dynamic isolation
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-dhei-v12-final-v1-12-919cca23cadf@gmail.com>
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

The boot-time parameters 'isolcpus' and 'nohz_full' currently initialize
housekeeping masks that cannot be easily updated at runtime. To support
DHEI, the scheduler's tick offload infrastructure must be ready for
dynamic enablement even if no isolation was requested at boot.

Enable unconditional boot-time initialization for tick offload.

This ensures that the infrastructure for remote ticks is always present,
allowing DHEI to safely toggle full dynticks mode at runtime.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/sched/core.c      | 5 +++++
 kernel/sched/isolation.c | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ddf9951f1438c..d987ce03e7cc6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5688,6 +5688,9 @@ static void sched_tick_stop(int cpu)
 
 int __init sched_tick_offload_init(void)
 {
+	if (tick_work_cpu)
+		return 0;
+
 	tick_work_cpu = alloc_percpu(struct tick_work);
 	BUG_ON(!tick_work_cpu);
 	return 0;
@@ -8509,6 +8512,8 @@ void __init sched_init_smp(void)
 	current->flags &= ~PF_NO_SETAFFINITY;
 	sched_init_granularity();
 
+	sched_tick_offload_init();
+
 	init_sched_rt_class();
 	init_sched_dl_class();
 
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 4a5967837e8de..685cc0df1bd9f 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -299,9 +299,6 @@ void __init housekeeping_init(void)
 
 	static_branch_enable(&housekeeping_overridden);
 
-	if (housekeeping.flags & HK_FLAG_KERNEL_NOISE)
-		sched_tick_offload_init();
-
 	for_each_set_bit(type, &housekeeping.flags, HK_TYPE_MAX) {
 		/* We need at least one CPU to handle housekeeping work */
 		WARN_ON_ONCE(cpumask_empty(housekeeping.cpumasks[type]));

-- 
2.43.0

