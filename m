Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46C42EED0;
	Tue, 28 Apr 2026 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380513; cv=none; b=aK5kDwR6C9Fjmdq9sHvTl9j/64PWtqBICjCcWC/g0tJULP8zrDwqE52wP2UytfSL9zi7sHxqbXfCgE+tlr5rdPuEu/u1Qq+Cm+XCscBzWx1vkcO97xE1bsUTOSsoaQ8M4blxmoq9jqRsqzGH+XaIicbHpDGw6dSNlpzmdfk+9J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380513; c=relaxed/simple;
	bh=oQjOesn0QFNCXponj/qUCJDf5fNkoAhxVXCSVjtGEc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qld6B8iQtfxIwPczZ9JwR5xY01B+LooZtI2FTn88CXvUrw/6nXzZQJGoQaKnBJp3b+c6VOiYcnV41fDrYPtqkJfXZZdWa6ZSvj7qdCkAvnkclM0zeG1gQC/ZMD9vqYJFtfto2sbZcPWkNZkmpCM78E+eeyamR3rpr+BbHbmlZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=loGtKdxZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="loGtKdxZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m1ltKbSNOcAPySDFkz9gwE534DkWQBgzNDQztVuKfSU=; b=loGtKdxZKUuiqZonj4gSOYnc0S
	h0jTmBVcXDQPLX4odDEFWU1FEuTLu4fxT0CDZBIv0oulTx978M8tQ080ceHwMbsydKRMY4dT8rZgE
	GGvw7R5V8Qdvj9UNKp4qj6NXn5zH97WuZgifLEYRKpnu43B2yT8lIa0vbDqqD2R8ZlCuwt8rPYkEI
	DaK4/DsQhS1j85+FR/WBDtvNA9JU7MWqsT322WvYmc7ARZQk1tsBfmVH/bcrUA1uC+yERy2UWu+9D
	6KfczGdr4a+NG3ODE94uRqGrGXIZ97qML66HGOz+YysgaC3K+SdTECTb2LWlvJcJA1KYQJ97Smy6d
	FlDoWWjg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhrV-000000033m4-0aNy;
	Tue, 28 Apr 2026 12:48:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 84AF6300BD2; Tue, 28 Apr 2026 14:48:23 +0200 (CEST)
Date: Tue, 28 Apr 2026 14:48:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aniket Gattani <aniketgattani@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Ben Segall <bsegall@google.com>,
	Josh Don <joshdon@google.com>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] sched/membarrier: Use per-CPU mutexes for
 targeted commands
Message-ID: <20260428124823.GY3102624@noisy.programming.kicks-ass.net>
References: <20260415232106.2803644-1-aniketgattani@google.com>
 <20260415232106.2803644-2-aniketgattani@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415232106.2803644-2-aniketgattani@google.com>

On Wed, Apr 15, 2026 at 11:21:05PM +0000, Aniket Gattani wrote:

> @@ -358,14 +371,19 @@ static int membarrier_private_expedited(int flags, int cpu_id)
>  	if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
>  		return -ENOMEM;
>  
> -	SERIALIZE_IPI();
> +	if ((unsigned int)cpu_id >= nr_cpu_ids || !cpu_possible(cpu_id))
> +		return 0;

Right, so this is broken, sorry about that. This makes the whole
cpu_id == -1 branch below dead code, and that cannot be right.

> +	SERIALIZE_IPI_CPU(cpu_id);
> +
>  	cpus_read_lock();
>  
>  	if (cpu_id >= 0) {
>  		struct task_struct *p;
>  
> -		if (cpu_id >= nr_cpu_ids || !cpu_online(cpu_id))
> +		if (!cpu_online(cpu_id))
>  			goto out;
> +
>  		rcu_read_lock();
>  		p = rcu_dereference(cpu_rq(cpu_id)->curr);
>  		if (!p || p->mm != mm) {


How about something like so?

---
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
index 623445603725..5b056fff7d1d 100644
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
@@ -313,9 +326,10 @@ static int membarrier_global_expedited(void)
 	return 0;
 }
 
+DEFINE_LOCK_GUARD_0(mb, smp_mb(), smp_mb())
+
 static int membarrier_private_expedited(int flags, int cpu_id)
 {
-	cpumask_var_t tmpmask;
 	struct mm_struct *mm = current->mm;
 	smp_call_func_t ipi_func = ipi_mb;
 
@@ -352,30 +366,46 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 	 * On RISC-V, this barrier pairing is also needed for the
 	 * SYNC_CORE command when switching between processes, cf.
 	 * the inline comments in membarrier_arch_switch_mm().
+	 *
+	 * Memory barrier on the caller thread _after_ we finished
+	 * waiting for the last IPI. Matches memory barriers before
+	 * rq->curr modification in scheduler.
 	 */
-	smp_mb();	/* system call entry is not a mb. */
-
-	if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
-		return -ENOMEM;
-
-	SERIALIZE_IPI();
-	cpus_read_lock();
+	guard(mb)();
+	guard(cpus_read_lock)();
 
 	if (cpu_id >= 0) {
 		struct task_struct *p;
 
-		if (cpu_id >= nr_cpu_ids || !cpu_online(cpu_id))
-			goto out;
+		if (cpu_id >= nr_cpu_ids)
+			return 0; // -EINVAL ?
+
+		if (!cpu_online(cpu_id))
+			return 0;
+
+		SERIALIZE_IPI_CPU(cpu_id);
+
 		rcu_read_lock();
 		p = rcu_dereference(cpu_rq(cpu_id)->curr);
 		if (!p || p->mm != mm) {
 			rcu_read_unlock();
-			goto out;
+			return 0;
 		}
 		rcu_read_unlock();
+		/*
+		 * smp_call_function_single() will call ipi_func() if cpu_id
+		 * is the calling CPU.
+		 */
+		smp_call_function_single(cpu_id, ipi_func, NULL, 1);
 	} else {
+		cpumask_var_t __free(free_cpumask_var) tmpmask = CPUMASK_VAR_NULL;
 		int cpu;
 
+		SERIALIZE_IPI();
+
+		if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
+			return -ENOMEM;
+
 		rcu_read_lock();
 		for_each_online_cpu(cpu) {
 			struct task_struct *p;
@@ -385,15 +415,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
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
@@ -420,18 +441,6 @@ static int membarrier_private_expedited(int flags, int cpu_id)
 		}
 	}
 
-out:
-	if (cpu_id < 0)
-		free_cpumask_var(tmpmask);
-	cpus_read_unlock();
-
-	/*
-	 * Memory barrier on the caller thread _after_ we finished
-	 * waiting for the last IPI. Matches memory barriers before
-	 * rq->curr modification in scheduler.
-	 */
-	smp_mb();	/* exit from system call is not a mb */
-
 	return 0;
 }
 
