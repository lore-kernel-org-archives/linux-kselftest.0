Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA95D3793AB
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 21:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775769862; cv=none; b=JKuZ46CYI3tf8wN5YJ59NW4mzQGYbBxUc14AIMArkbapBC6U3BYI0f+AVGWx24LHz6LGSjRS2pwK2VyTZ7s53v1XC7JFxvtyxCAGGkNItMzavqdR8diTpRgEzg7ljRJJigiuYCwbMPnEt2ocnkK/wiX1PVN87SVjdMcIX7tZw9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775769862; c=relaxed/simple;
	bh=hBAkrSd1V0t3ZE2DRIBQY239KLij4ByxWEW+zsOQxpk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oIrPfIwueWT4SFzq2LFg7cVLgSV/j38CXQYIMtTqEmeriikHuY7rCyzKFCNjLZuTHvap3RT4hurVteNHPdyklCEi5E65zWH424xHzsjHIYlSDQtA8PnDpEv+u8m6VkwF4POkDgeqKvj80gUiAT6oCbZxgOK4Iuk0iM6l1E6djeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=coUSVzqC; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aniketgattani.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="coUSVzqC"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-12bf9974587so4912758c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 14:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775769861; x=1776374661; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcUuGOmqdKm972EK7vDrUoxfwHS2ERZzZpJq54vkYGc=;
        b=coUSVzqCA3+Kbx0R5I0pNjQnm7+5nUYoi5lHEclDKGUCpo6S8vP2fuzesl8OTl2XNr
         YBte/RdLox7cx4q7iX/m/yCWptSwt/FBW4+g5qu1XpJ8lfSoPewrvqXdD2sTW3I0ufE7
         v3U1EyRaL7S5gY8zRsag8V++O03AFHxur9TfVIlfYFQ78+YC2ANdGJDZnxDztHEvJiKf
         DitPD7j4lMufgzgNYTuYza242vgv0+W3mWn/N11ZgbSEAcsDQ6UmTcuypFZjUu5ZUwWv
         Z1/SBT2CviFhn6hP+NiIO1FlXhuNmTAuSEj92VYx59qM9WmqgQh+INY9BkOfqHbPdTha
         YAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775769861; x=1776374661;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcUuGOmqdKm972EK7vDrUoxfwHS2ERZzZpJq54vkYGc=;
        b=jct7edl7SoH0b+Z/seBAmeGWVBAZmfectc3VAG5uLQ+597+L0HKxKYYMfCiw7aQz3B
         t6VVAP05GaNFhNcJvgP78NcTrs/ZQvlD57737AkbT21Esgfs+JSZauydYH02i/nQu+62
         3dR6mStFaJ5SP7t3P6XwitJORoaBRO12hu416SveSJnw8sHwhNkRxwPnjN9dSu610/O7
         70k/j+QF2GOlC2LBnj9YrL3OBffxIp2TZm+uBD+4QP7T8lg6+WjItz5iwZLCqzDRReUj
         TsibDuK8LN5EpCCcCaLqxdGjEo3XAW8oNB9H5NUX9g/UxeMXqXrM+9QKfPKSByqYTPMc
         a8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdJh0E5ZPxUrVpZQ0DEtTsJLXxCI48T/9iGZqK+pCaDSWZL6lSMtJ31CUSSJCK0Z5mkc9URXK06WefVp4zd7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZKY0DafIzBkbKdYb4l6oHr3g+QBcCDqyPWc0qYJRm1vel+JCI
	aIMJsp0o6te1F8wP1tcHewQowXbA3dG2Fyj5FkJ/Rn8hJoKCaMRmxQe0Q+v5fymNP/PQxmUGr5p
	nQjZZ2P95mDKnJBEqtWoPm+BqT/4XBeFG5g==
X-Received: from dyckx2.prod.google.com ([2002:a05:7300:c7c2:b0:2d3:51a9:d76c])
 (user=aniketgattani job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:fb04:b0:12b:fc21:8770 with SMTP id a92af1059eb24-12c34edea1amr464034c88.23.1775769860656;
 Thu, 09 Apr 2026 14:24:20 -0700 (PDT)
Date: Thu,  9 Apr 2026 21:22:22 +0000
In-Reply-To: <20260409212223.2072418-1-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260409212223.2072418-1-aniketgattani@google.com>
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Message-ID: <20260409212223.2072418-2-aniketgattani@google.com>
Subject: [PATCH 1/2] sched/membarrier: Use per-CPU mutexes for targeted commands
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
 kernel/sched/membarrier.c | 48 +++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 623445603725..dc916e6541d2 100644
--- a/kernel/sched/membarrier.c
+++ b/kernel/sched/membarrier.c
@@ -165,7 +165,26 @@
 	| MEMBARRIER_CMD_GET_REGISTRATIONS)
 
 static DEFINE_MUTEX(membarrier_ipi_mutex);
-#define SERIALIZE_IPI() guard(mutex)(&membarrier_ipi_mutex)
+static DEFINE_PER_CPU(struct mutex, membarrier_cpu_mutexes);
+
+static inline struct mutex *membarrier_get_mutex(int cpu)
+{
+	if (cpu >= 0)
+		return &per_cpu(membarrier_cpu_mutexes, cpu);
+	return &membarrier_ipi_mutex;
+}
+
+#define SERIALIZE_IPI(cpu_id) guard(mutex)(membarrier_get_mutex(cpu_id))
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
@@ -264,7 +283,7 @@ static int membarrier_global_expedited(void)
 	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
 		return -ENOMEM;
 
-	SERIALIZE_IPI();
+	SERIALIZE_IPI(-1);
 	cpus_read_lock();
 	rcu_read_lock();
 	for_each_online_cpu(cpu) {
@@ -358,14 +377,19 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 	if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
 		return -ENOMEM;
 
-	SERIALIZE_IPI();
+	if (cpu_id >= 0 && (cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id)))
+		return 0;
+
+	SERIALIZE_IPI(cpu_id);
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
@@ -373,6 +397,11 @@ static int membarrier_private_expedited(int flags, int cpu_id)
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
 
@@ -385,15 +414,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
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
@@ -472,7 +492,7 @@ static int sync_runqueues_membarrier_state(struct mm_struct *mm)
 	 * between threads which are users of @mm has its membarrier state
 	 * updated.
 	 */
-	SERIALIZE_IPI();
+	SERIALIZE_IPI(-1);
 	cpus_read_lock();
 	rcu_read_lock();
 	for_each_online_cpu(cpu) {
-- 
2.54.0.rc0.605.g598a273b03-goog

