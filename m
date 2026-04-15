Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6E837F733
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 23:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295303; cv=none; b=VItODd0ahkYHLT9+X5MfCePOS4pAfKmtzbdxEEaeMJUlE/3Gcgb+hAM9g7BdwqokcdpNsu5IHMkTVYxTOCMFmGd7b6jjPMocyP6t1gHWoNLYvLwJlECmK6Mcv4St7RXM3y82hoL8lPf1tOodahovTR7HY7QEwq+VkSdNKt+1mbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295303; c=relaxed/simple;
	bh=ae1xtS698SoRwAl9b81gcSSYyvLVQWskSnVOPWRdDMs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LrhqvD2/Lv5xZ/lBkxvts5ZM16z6v7ImIVHajEt6OFtM+sKwEgh/z0wq9R/0qzUYWLgK5j+CWB9jMMiS8f35reQsNZf/VFOtOyGAleVfLZWp7eep/CcVzLV0bPGoyyNQlG0hGVEtZa7I+vjEdzI7JGzwJ/IF+tkqe45bHAAu+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WlP/NUIX; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WlP/NUIX"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5747990eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Apr 2026 16:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776295301; x=1776900101; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K0dDu/Q1pEDYYyPsxnES/b7A20+EKuhYKKH9BmyTXkk=;
        b=WlP/NUIXW4Y+xcwMN2H2rOqFUEVuHMAhyAV70OPV5UybgoKy0Y9/t5a26qDaaVdnS2
         xueO5G3CqHCp1N6CTiDAHAr7xiilIYS7s19a1tKBsN28ZIh02EIpTSdyv1Wrdr30+yDK
         wRqVBGTq8jiq0dDnvAI7h8qvKr15leCFvz+dyRO84w0GJKvjRYvKErl0HHl3WYXeu0+Y
         /6/6/EjyvcmPDfcIllJEtAZ4GE1A9FUSGFQJ5ZN39Dd5bvcCzhun1Zibaukqh5uNGX8M
         hu5YapXbnepK/EvKpFRWd9te46K+nSYjiI69Lz+2CvMtRDOG+s1390cxX9g8ZYIcr3uG
         1BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776295301; x=1776900101;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0dDu/Q1pEDYYyPsxnES/b7A20+EKuhYKKH9BmyTXkk=;
        b=lGOv6FMwD+eoBlg6tcGL3/xtbDJDOuHgFAlu+3fp4KEw0AIhvtSk166A+soG1lPoBo
         qkVEY8Io/n3C01rFqQ6WsHRFPIqdxDhKsSQeSLYjpSw75G9AN1qNaZFPule12eM1tig9
         S99Iq8FGHwliXvyzJh6k4wy2okXeYPiZoJs8nOGyrgdMALOFETxqInOQScXnI5FL5i4r
         zjvc81ctiKOCeHgMICa6goSVw8FCBdwa1CHchuqv7y7jRsO5I1PlvHImYPK9KSKi+TmF
         e2CYpF3/rqux/4Kw8PY4nh1hcI90S8auUG2eznQsUxshjFkPV/tH6gGVekayTpJicuzS
         htQw==
X-Forwarded-Encrypted: i=1; AFNElJ/XWmi09N1bIU4zmqJDtGdNeI0r3zlh0PUAo0U4vpXDCsHktWlBLYTqEAf67HCrlwua13uhqvMHp1xjejlLIMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7lNIgZI+Pp7GbF9aX3ENO9Xqtdx5pUq6O4U0nSfdAYmsSl4vz
	sfyHxnw1jUpO6w7YG8613nNMdVuRfht6Gn6PK9itxF5PAEEHhELkIlU1JI+TrAeMjquG/GiQ+sh
	bkxGeJxITSd5plAJ6gPH2T4tofEBU6s8vqg==
X-Received: from dyjf14.prod.google.com ([2002:a05:7300:680e:b0:2d9:9fa3:5aa6])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7c0c:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-2d586ea78eamr14457155eec.13.1776295301091;
 Wed, 15 Apr 2026 16:21:41 -0700 (PDT)
Date: Wed, 15 Apr 2026 23:21:05 +0000
In-Reply-To: <20260415232106.2803644-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415232106.2803644-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260415232106.2803644-2-aniketgattani@google.com>
Subject: [PATCH v2 1/2] sched/membarrier: Use per-CPU mutexes for targeted commands
From: Aniket Gattani <aniketgattani@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ben Segall <bsegall@google.com>, Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Aniket Gattani <aniketgattani@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, the membarrier system call uses a single global mutex
(`membarrier_ipi_mutex`) to serialize expedited commands. This causes
significant contention on large systems when multiple threads invoke
membarrier concurrently, even if they target different CPUs.

This contention becomes critical when combined with CFS bandwidth
throttling/unthrottling, during which interrupts can be disabled for
relatively long periods on target CPUs. If membarrier is waiting for a
response from such a CPU, it holds the global mutex, blocking all other
membarrier calls on the system. This cascade effect can lead to hard
lockups when thousands of threads stall waiting for the mutex.

Optimize `MEMBARRIER_CMD_PRIVATE_EXPEDITED_RSEQ` when a specific CPU is
targeted by introducing per-CPU mutexes. Broadcast commands and commands
without a specific CPU target continue to use the global mutex.

This prevents the cascade lockup scenario. As measured by the stress test
introduced in the subsequent patch, on an AMD Turin machine with 384 CPUs
(2 NUMA nodes with SMT=2), this optimization yields 200x more
throughput.

Signed-off-by: Aniket Gattani <aniketgattani@google.com>

---
Changes in v2:
  - Use different mutex macros for global vs targeted cpu membarrier (Mathieu).
  - Use (unsigned int) cpu_id >= nr_cpu_id (Peter).
---
 kernel/sched/membarrier.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 623445603725..7f995bd48280 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -165,7 +165,20 @@
 	| MEMBARRIER_CMD_GET_REGISTRATIONS)
 
 static DEFINE_MUTEX(membarrier_ipi_mutex);
+static DEFINE_PER_CPU(struct mutex, membarrier_cpu_mutexes);
+
 #define SERIALIZE_IPI() guard(mutex)(&membarrier_ipi_mutex)
+#define SERIALIZE_IPI_CPU(cpu_id) guard(mutex)(&per_cpu(membarrier_cpu_mutexes, cpu_id))
+
+static int __init membarrier_init(void)
+{
+	int i;
+
+	for_each_possible_cpu(i)
+		mutex_init(&per_cpu(membarrier_cpu_mutexes, i));
+	return 0;
+}
+core_initcall(membarrier_init);
 
 static void ipi_mb(void *info)
 {
@@ -358,14 +371,19 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 	if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
 		return -ENOMEM;
 
-	SERIALIZE_IPI();
+	if ((unsigned int)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
+		return 0;
+
+	SERIALIZE_IPI_CPU(cpu_id);
+
 	cpus_read_lock();
 
 	if (cpu_id >= 0) {
 		struct task_struct *p;
 
-		if (cpu_id >= nr_cpu_ids || !cpu_online(cpu_id))
+		if (!cpu_online(cpu_id))
 			goto out;
+
 		rcu_read_lock();
 		p = rcu_dereference(cpu_rq(cpu_id)->curr);
 		if (!p || p->mm != mm) {
@@ -373,6 +391,11 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 			goto out;
 		}
 		rcu_read_unlock();
+		/*
+		 * smp_call_function_single() will call ipi_func() if cpu_id
+		 * is the calling CPU.
+		 */
+		smp_call_function_single(cpu_id, ipi_func, NULL, 1);
 	} else {
 		int cpu;
 
@@ -385,15 +408,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 				__cpumask_set_cpu(cpu, tmpmask);
 		}
 		rcu_read_unlock();
-	}
-
-	if (cpu_id >= 0) {
-		/*
-		 * smp_call_function_single() will call ipi_func() if cpu_id
-		 * is the calling CPU.
-		 */
-		smp_call_function_single(cpu_id, ipi_func, NULL, 1);
-	} else {
 		/*
 		 * For regular membarrier, we can save a few cycles by
 		 * skipping the current cpu -- we're about to do smp_mb()
-- 
2.54.0.rc1.513.gad8abe7a5a-goog

