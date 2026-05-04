Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F0406279
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929531; cv=none; b=HO94B5uwYGEqkvCW6jh2OnSDrZdpG7hhedYYaAam5+4FEv8T37nXun2l5FBDly6ltZnTfexr6tpLGorrBce/JVG1nIm7jSHsGKvsWb+bnhnF/c4znOiKwLTwYKKMnwA0+y0MXsRz0CR8wZ9piGIqdOIpLhk6JEdGNVtSNZXTbz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929531; c=relaxed/simple;
	bh=S0Rh88cIzrwPcgFazDDX9G1MacYZO4t4rc6Ti6y7iLw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JC6jF83slmwei7XGI24DnT0egumPFNKo6/YZgktGsJN2uNJNqDjTduUqkr/chqsqGswo0bhO6yZL6r087VdLqYEjYm37732OUBI/tlqspaCyxEfpq43mMy2ss3CyAXvmZvTP434HchEHNwmt0sM7w26di8n386ZAOQhPXM6Tpg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suUKP8VD; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suUKP8VD"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-42fb9d10232so10197467fac.2
        for <linux-kselftest@vger.kernel.org>; Mon, 04 May 2026 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929524; x=1778534324; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IHqwi47gLxulqjFwzyPWRWmJ21m3KfZnivqkYOWLGBw=;
        b=suUKP8VDI/w6B/+nWuXC9PVT+Uanm7EuOrfR1dptORtN5vfsGXf+LmnkhhqUA0gWA9
         5I7rtXK68DW2fC5SxchvRHMHrlEzSotlrvoT+Rlbn8GnadevTw7VNFn3tjRkMwAeqlUv
         YsawUIYcHYTkn+bs8HElGlx318phzbGts5Y+4fuIfF1kWKKypHvJlz2wR1PRnwgoAqHI
         DNwMeoeVYSki2i8pnTBjxZ3WgC9gsud8K5lRsXxeEOH7R7K4aXyWQSitV4gLk44uFCYQ
         fAgLlAdqpLSzzVahrQh6OQyco3b9HLSfvT+mBJzoOIvetV5hRWthWAX/mb1ZoBbCKIac
         5sPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929524; x=1778534324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHqwi47gLxulqjFwzyPWRWmJ21m3KfZnivqkYOWLGBw=;
        b=KTMJJBjP0+n8CBNghKnehm04hbcWTZkoGHb30X1tfshudtLd9M9VEEInzSCJld/tcR
         7118htvYWokV6WjNU7U3P7GetTOTExpfRfsnPThbiUPsNOMFq0m3qZhYKDNrCTa1Igl0
         s2Sg5Vjx97ZWvVov4I/FDNRnD2lx6Wv43o4JC90QUFSTpIb5wbWJwJacpw0MwBJgUhfU
         ESsYp23lwNF7+0cQ/I1iJvmLXZu3Vu8iLVLlBpP1ochNo3LDF7cEO6/sN6nWg39rt319
         JgjAYgzmVmC2SueAaEpIsjWVBCSdZ07lLkObUufaoKXlgVY41ps9ID8+zoSUfZpqNy3R
         8P6A==
X-Forwarded-Encrypted: i=1; AFNElJ+3l+h1d7x6/B5+J9w2vrk1NO3J8GHwjyc3Kui0oiDV2Zhwgt6GfxnukduWTO5Dsf23QbeouTLhngZiDohwqlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNQvP+mn9xeYcOYKpMQ1rRw/zydPFl8K36cU2nGGwzvxEp4vL
	HBxVjW+/yEmsWmWk/Kkmd9UMtWHXejd4sCNUDYI5VTOBPFf8rY+QXvY0BbqP5yaRA8qpUWHXMh2
	2WdHzJcEPVr5pu4Xd+Jlf+sPIjw==
X-Received: from iods12.prod.google.com ([2002:a05:6602:324c:b0:96b:30a7:3dc9])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:211:b0:696:8278:c619 with SMTP id 006d021491bc7-696979ad7d2mr5858531eaf.6.1777929523888;
 Mon, 04 May 2026 14:18:43 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:05 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-13-coltonlewis@google.com>
Subject: [PATCH v7 12/20] perf: Add perf_pmu_resched_update()
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

To modify PMU guest counter reservations dynamically, we need to
update the available counters safely.

Introduce perf_pmu_resched_update() to allow updating the PMU struct
in between scheduling perf events out and scheduling them back in
again. It takes a callback operation to call in between schedule out
and schedule in. This accomplishes the goal with minimal perf API
expansion.

Refactor ctx_resched call the callback in the right place.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf_event.h |  3 +++
 kernel/events/core.c       | 28 +++++++++++++++++++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea5..a08db3ee38b10 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1242,6 +1242,9 @@ extern int perf_event_task_disable(void);
 extern int perf_event_task_enable(void);
 
 extern void perf_pmu_resched(struct pmu *pmu);
+extern void perf_pmu_resched_update(struct pmu *pmu,
+				    void (*update)(struct pmu *, void *),
+				    void *data);
 
 extern int perf_event_refresh(struct perf_event *event, int refresh);
 extern void perf_event_update_userpage(struct perf_event *event);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 89b40e4397177..62fec73caabad 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2983,9 +2983,10 @@ static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
  * event_type is a bit mask of the types of events involved. For CPU events,
  * event_type is only either EVENT_PINNED or EVENT_FLEXIBLE.
  */
-static void ctx_resched(struct perf_cpu_context *cpuctx,
-			struct perf_event_context *task_ctx,
-			struct pmu *pmu, enum event_type_t event_type)
+static void __ctx_resched(struct perf_cpu_context *cpuctx,
+			  struct perf_event_context *task_ctx,
+			  struct pmu *pmu, enum event_type_t event_type,
+			  void (*update)(struct pmu *, void *), void *data)
 {
 	bool cpu_event = !!(event_type & EVENT_CPU);
 	struct perf_event_pmu_context *epc;
@@ -3021,6 +3022,9 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
+	if (update)
+		update(pmu, data);
+
 	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
@@ -3032,6 +3036,24 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	}
 }
 
+static void ctx_resched(struct perf_cpu_context *cpuctx,
+			struct perf_event_context *task_ctx,
+			struct pmu *pmu, enum event_type_t event_type)
+{
+	__ctx_resched(cpuctx, task_ctx, pmu, event_type, NULL, NULL);
+}
+
+void perf_pmu_resched_update(struct pmu *pmu, void (*update)(struct pmu *, void *), void *data)
+{
+	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
+	struct perf_event_context *task_ctx = cpuctx->task_ctx;
+
+	perf_ctx_lock(cpuctx, task_ctx);
+	__ctx_resched(cpuctx, task_ctx, pmu, EVENT_ALL|EVENT_CPU, update, data);
+	perf_ctx_unlock(cpuctx, task_ctx);
+}
+EXPORT_SYMBOL_GPL(perf_pmu_resched_update);
+
 void perf_pmu_resched(struct pmu *pmu)
 {
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
-- 
2.54.0.545.g6539524ca2-goog

