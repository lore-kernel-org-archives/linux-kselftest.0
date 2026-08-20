Received: from mail.ilvokhin.com (mail.ilvokhin.com [178.62.254.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C3647ACE2;
	Thu, 20 Aug 2026 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.62.254.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787242996; cv=none; b=ugqgdgxICC7mESfkK0o3kf2Zje1cKBvZtQPG2KUsEIfyHPbjxfOPS8IiFh1RoPB9zC/FwZqyCegToznpNyfMiLDBpugpRJfvE/9Bkgp4o/7A0HEWIzFTJFIOe/Y0+McdSz33UWkCXVcMPa0iKXTtWrSH1j5bTMXwHxzuQLNtzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787242996; c=relaxed/simple;
	bh=BJJuelgwhOeOx0UX/MHD4RWXmTi6bz4uJs2PqmuiRTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTkXNNGXKQzrKkSPZyKt7KcSQQ5dZnFe25usKYWfO0WE7WChKjtBiyGWKX1SD0bcg+JtMrqyzYWJL2XVf5LpXgI2srnGVYCRETh8HrjFgqQecHez38tta3KwYD+ObaB3+O7ZbAMvPXsXbcuybtab/C0Rjh8eS3+o/i3iN8+8CTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com; spf=pass smtp.mailfrom=ilvokhin.com; dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b=QYS/Hlq/; arc=none smtp.client-ip=178.62.254.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ilvokhin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ilvokhin.com header.i=@ilvokhin.com header.b="QYS/Hlq/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1787242467;
	bh=MoHi9MTLkk1snWCzMEg334td60/azkZWo+f68RaYw/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYS/Hlq/a9D9tCD0wDb028zOu9zTBl5IubpU4Chcuxor3WLoGWye5qGtC6rEXmSzR
	 i9v6L63hDIvUT5vhJztDRqeMHJajkSiGGwk7Xch3Nl26Euhn7Wpt73wKXjenPksUeZ
	 hNouBO+O0xebCuMIKtMa3Er/012IIXaiJjkHCa/E=
Received: from shell.ilvokhin.com (shell.ilvokhin.com [138.68.190.75])
	(Authenticated sender: d@ilvokhin.com)
	by mail.ilvokhin.com (Postfix) with ESMTPSA id 8D7FCE1FF5;
	Thu, 20 Aug 2026 16:14:27 +0000 (UTC)
Date: Thu, 20 Aug 2026 16:14:26 +0000
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>, peterz@infradead.org,
	andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	mingo@redhat.com, shuah@kernel.org, shakeel.butt@linux.dev,
	hannes@cmpxchg.org, riel@surriel.com, kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
Message-ID: <aocn4kp5F_2Y2e5O@shell.ilvokhin.com>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13>
 <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13>
 <87v79clmfu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v79clmfu.ffs@fw13>

On Fri, Aug 14, 2026 at 06:02:45PM +0200, Thomas Gleixner wrote:
> On Fri, Aug 14 2026 at 18:01, Thomas Gleixner wrote:
> > On Mon, Aug 10 2026 at 13:17, Usama Arif wrote:
> >> On 07/08/2026 16:42, Thomas Gleixner wrote:
> >>> On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
> >>>> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:
> >>>> The above data shows the significance of the patch.
> >>>> It provides a very meaningful improvement (22.4% of time spent in futex_q_lock()
> >>>> will be significantly optimized and will also deliver second-order effects)
> >>>> and has no measurable impact on latency in the matching path.
> >>>> IMHO, this patch is a free lunch.
> >>> 
> >>> Not really free. The user space access is not exactly cheap either
> >>> because CLAC/STAC are memory fencing to meet the SMAP guarantees.
> >>
> >> My understanding from 86e6b1547b3d is that STAC/CLAC “end up serializing
> >> execution on older Zen,” while Zen 5’s AC renaming “improves performance
> >> of STAC/CLAC a lot a lot.”  Architecturally, they only change the AC bit.
> >> They are not memory-ordering instructions like LFENCE.
> >
> > It's not a memory ordering instruction, but it has to guarantee that the
> > AC change is effective when the subsequent permission check
> > happens. That's true for both STAC and CLAC.
> >
> > So it _cannot_ be free by definition and the penalty depends on the
> > micro architecture.
> >
> >> I am currently testing on Zen5 which could be why I didn't see any
> >> wall-time regression in futex_wait_timeout.c from [1].
> >
> > It's not relevant whether your ZEN5 works fine or not. We are not
> > optimizing for a particular machine.
> >
> > A trivial futex bouncing test case with two threads degrades on a ZEN3
> > by ~20% and when looking at it with perf top clearly the extra user
> > access stands out very prominently.
> >
> > The below variant does not expose that behavior and actually improves
> > the same test case by ~5% on that machine.
> 
> Bah. Included the broken version. Fixed one is below.
> 
> Thanks,
> 
>         tglx
> ---
>  kernel/futex/waitwake.c |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> --- a/kernel/futex/waitwake.c
> +++ b/kernel/futex/waitwake.c
> @@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
>  		CLASS(hbr, hbr)(&q->key);
>  		auto hb = hbr.hb;
>  
> -		futex_q_lock(q, hb);
> +		futex_hb_waiters_inc(hb);
> +		q->lock_ptr = &hb->lock;
> +
> +		if (!spin_trylock(&hb->lock)) {
> +			ret = get_user_inline(uval, uaddr);
> +			if (ret) {
> +				futex_hb_waiters_dec(hb);
> +				return ret;
> +			}
> +			if (uval != val) {
> +				futex_hb_waiters_dec(hb);
> +				return -EWOULDBLOCK;
> +			}
> +			spin_lock(&hb->lock);
> +		}
>  
>  		ret = futex_get_value_locked(&uval, uaddr);
>

I looked at production data to understand better where
futex_wait_setup() calls are coming from. Majority of the cost is
contended userspace mutex hammering the same futex word from different
threads, where amount of threads differ from usecase to usecase.

The userspace mutex implementation is pthread_mutex_t from glibc, which
has only three states: free (0), locked (1) and locked with waiters (2).
When critcal section is short, mutex releaser and winner acquirer switch
the state from 2 to 0 and 1 and this produces high futex value missmatch
rate. The higher contention is, the higher futex value missmatch rate
is.

I've built a benchmark to simulate this behaviour on the smaller scale
and run it with two threads and `nproc` threads to simulate low and high
contention cases. The benchmark is a bit on a extreme side, but I think
it approximates the real world case quite well.

The numbers below are averaged across 10 runs.

SKYLAKE (2 NUMA NODES, 80 CPUS, Intel(R) Xeon(R) Gold 6138 CPU)

Threads   Baseline (ops/sec)    Patched            95% CI        Diff
-----------------------------------------------------------------------
2           5,917,777          6,441,061     [ -1.98%, +19.67%]   +8.84%
80            122,926             77,801     [-41.17%, -32.25%]  -36.71%


BERGAMO (1 NUMA NODE, 176 CPUS, AMD EPYC 9D64)

Threads   Baseline (ops/sec)    Patched            95% CI        Diff
-----------------------------------------------------------------------
2            14,952,962        14,482,494     [ -4.62%, -1.68%]   -3.15%
176             161,294           127,563     [-21.72%, -20.11%] -20.91%


Skylake two thread case seems in line with ~5% improvement you measured,
but numbers are quite noisy. Other runs do not look encouraging.

It looks like early bail out amplifies contention problem even more.
Instead of letting thread spin on the hb->lock, early check returns just
for userspace to retry again moment later. Ideally, it would be better
to park spinning thread as fast as possible and with early bail out we
do opposite of that.

Anyway, I would be curious to know what do you think about it. Maybe
there is a better way to measure this optimization.

From 34184a0324ca734dc46aa957242c59ff9522ac54 Mon Sep 17 00:00:00 2001
From: Dmitry Ilvokhin <d@ilvokhin.com>
Date: Wed, 19 Aug 2026 10:13:34 -0700
Subject: [PATCH] perf bench futex: Add wait/wake benchmark

Userspace uses futex_wait() and futex_wake() to implement sleepable
synchronization primitives. Currently, there is no benchmark to measure
futex_wait()/futex_wake() calls throughput.

Introduce perf bench futex wait-wake benchmark that stresses kernel's
futex_wait()/futex_wake() implementation and measures throughput of
paired calls.

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 tools/perf/Documentation/perf-bench.txt |   3 +
 tools/perf/bench/Build                  |   1 +
 tools/perf/bench/bench.h                |   1 +
 tools/perf/bench/futex-wait-wake.c      | 254 ++++++++++++++++++++++++
 tools/perf/builtin-bench.c              |   1 +
 5 files changed, 260 insertions(+)
 create mode 100644 tools/perf/bench/futex-wait-wake.c

diff --git a/tools/perf/Documentation/perf-bench.txt b/tools/perf/Documentation/perf-bench.txt
index c5913cf59c98..4f8d23890ef5 100644
--- a/tools/perf/Documentation/perf-bench.txt
+++ b/tools/perf/Documentation/perf-bench.txt
@@ -294,6 +294,9 @@ Suite for evaluating wake calls.
 *wake-parallel*::
 Suite for evaluating parallel wake calls.
 
+*wait-wake*::
+Suite for evaluating parallel wait/wake calls.
+
 *requeue*::
 Suite for evaluating requeue calls.
 
diff --git a/tools/perf/bench/Build b/tools/perf/bench/Build
index 67b76fe20ba6..0c4faa001e7d 100644
--- a/tools/perf/bench/Build
+++ b/tools/perf/bench/Build
@@ -7,6 +7,7 @@ perf-bench-y += futex.o
 perf-bench-y += futex-hash.o
 perf-bench-y += futex-wake.o
 perf-bench-y += futex-wake-parallel.o
+perf-bench-y += futex-wait-wake.o
 perf-bench-y += futex-requeue.o
 perf-bench-y += futex-lock-pi.o
 perf-bench-y += epoll-wait.o
diff --git a/tools/perf/bench/bench.h b/tools/perf/bench/bench.h
index 8519eb5a42fa..a3317a5d4fe6 100644
--- a/tools/perf/bench/bench.h
+++ b/tools/perf/bench/bench.h
@@ -33,6 +33,7 @@ int bench_mem_find_bit(int argc, const char **argv);
 int bench_futex_hash(int argc, const char **argv);
 int bench_futex_wake(int argc, const char **argv);
 int bench_futex_wake_parallel(int argc, const char **argv);
+int bench_futex_wait_wake(int argc, const char **argv);
 int bench_futex_requeue(int argc, const char **argv);
 /* pi futexes */
 int bench_futex_lock_pi(int argc, const char **argv);
diff --git a/tools/perf/bench/futex-wait-wake.c b/tools/perf/bench/futex-wait-wake.c
new file mode 100644
index 000000000000..9685a8af7e87
--- /dev/null
+++ b/tools/perf/bench/futex-wait-wake.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <sys/mman.h>
+#include <pthread.h>
+#include <string.h>
+#include <signal.h>
+#include <err.h>
+
+#include <subcmd/parse-options.h>
+#include <perf/cpumap.h>
+#include <linux/compiler.h>
+
+#include "bench.h"
+#include "futex.h"
+#include "util/cpumap.h"
+#include "../util/mutex.h"
+#include "../util/stat.h"
+
+static bool done;
+static int futex_flag;
+
+/*
+ * Simple futex assisted mutex implementation to stress futex_wait() and
+ * futex_wake() calls. This implementation ideologically similar to
+ * pthread_mutex_t from glibc.
+ */
+struct simple_mutex {
+	/* 0: free, 1: locked, 2: locked with waiters. */
+	u_int32_t lock;
+};
+
+static void simple_mutex_lock(struct simple_mutex *mutex)
+{
+	u_int32_t expected = 0;
+
+	if (!__atomic_compare_exchange_n(&mutex->lock, &expected, 1,
+					 false,
+					 __ATOMIC_ACQUIRE,
+					 __ATOMIC_RELAXED)) {
+		while (__atomic_exchange_n(&mutex->lock, 2, __ATOMIC_ACQUIRE) != 0)
+			futex_wait(&mutex->lock, 2, NULL, futex_flag);
+	}
+}
+
+static void simple_mutex_unlock(struct simple_mutex *mutex)
+{
+	if (__atomic_exchange_n(&mutex->lock, 0, __ATOMIC_RELEASE) == 2)
+		futex_wake(&mutex->lock, 1, futex_flag);
+}
+
+/* Lock to stress. */
+static struct simple_mutex lock;
+
+static struct mutex workers_lock;
+static struct cond workers_ready, workers_go;
+static unsigned int workers_starting;
+
+struct worker {
+	int tid;
+	unsigned long ops;
+	pthread_t thread;
+};
+
+static struct bench_futex_parameters params = {
+	.runtime  = 10 /* seconds */,
+};
+
+static const struct option options[] = {
+	OPT_UINTEGER('t', "threads", &params.nthreads, "Specify amount of threads"),
+	OPT_UINTEGER('r', "runtime", &params.runtime, "Specify runtime (in seconds)"),
+	OPT_BOOLEAN('s', "silent",  &params.silent, "Silent mode: do not display data/details"),
+	OPT_BOOLEAN('S', "shared",  &params.fshared, "Use shared futexes instead of private ones"),
+	OPT_BOOLEAN('m', "mlockall", &params.mlockall, "Lock all current and future memory"),
+
+	OPT_END()
+};
+
+static const char * const bench_futex_wait_wake_usage[] = {
+	"perf bench futex wait-wake <options>",
+	NULL
+};
+
+static void *workerfn(void *arg)
+{
+	struct worker *w = (struct worker *)arg;
+	unsigned long ops = w->ops;
+
+	mutex_lock(&workers_lock);
+	workers_starting--;
+	if (!workers_starting)
+		cond_signal(&workers_ready);
+	cond_wait(&workers_go, &workers_lock);
+	mutex_unlock(&workers_lock);
+
+	while (!done) {
+		simple_mutex_lock(&lock);
+		simple_mutex_unlock(&lock);
+		++ops;
+	}
+	w->ops = ops;
+
+	return NULL;
+}
+
+static void run_workers(struct worker *workers, struct perf_cpu_map *cpu)
+{
+	cpu_set_t *cpuset;
+	size_t size;
+	int nrcpus = cpu__max_cpu().cpu;
+
+	workers_starting = params.nthreads;
+
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
+	for (unsigned int i = 0; i < params.nthreads; i++) {
+		pthread_attr_t thread_attr;
+
+		pthread_attr_init(&thread_attr);
+		CPU_ZERO_S(size, cpuset);
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
+
+		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
+			CPU_FREE(cpuset);
+			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+		}
+
+		workers[i].tid = i;
+		if (pthread_create(&workers[i].thread, &thread_attr, workerfn, &workers[i])) {
+			CPU_FREE(cpuset);
+			err(EXIT_FAILURE, "pthread_create");
+		}
+		pthread_attr_destroy(&thread_attr);
+	}
+	CPU_FREE(cpuset);
+
+	gettimeofday(&bench__start, NULL);
+	mutex_lock(&workers_lock);
+	while (workers_starting)
+		cond_wait(&workers_ready, &workers_lock);
+	cond_broadcast(&workers_go);
+	mutex_unlock(&workers_lock);
+}
+
+static void toggle_done(int sig __maybe_unused,
+			siginfo_t *info __maybe_unused,
+			void *uc __maybe_unused)
+{
+	done = true;
+	gettimeofday(&bench__end, NULL);
+	timersub(&bench__end, &bench__start, &bench__runtime);
+}
+
+static void join_workers(struct worker *workers)
+{
+	for (unsigned int i = 0; i < params.nthreads; i++)
+		if (pthread_join(workers[i].thread, NULL))
+			err(EXIT_FAILURE, "pthread_join");
+}
+
+static void calc_stats(struct worker *workers, struct stats *stats)
+{
+	for (unsigned int i = 0; i < params.nthreads; i++) {
+		unsigned long t = bench__runtime.tv_sec > 0 ?
+			workers[i].ops / bench__runtime.tv_sec : 0;
+
+		update_stats(stats, t);
+		if (!params.silent)
+			printf("[thread %3d] %ld ops/sec\n", workers[i].tid, t);
+	}
+}
+
+static void print_summary(struct stats *stats)
+{
+	unsigned long avg = avg_stats(stats);
+	double stddev = stddev_stats(stats);
+
+	printf("%sAveraged %ld operations/sec (+- %.2f%%), total secs = %d\n",
+	       !params.silent ? "\n" : "", avg, rel_stddev_stats(stddev, avg),
+	       (int)bench__runtime.tv_sec);
+}
+
+int bench_futex_wait_wake(int argc, const char **argv)
+{
+	struct perf_cpu_map *cpu;
+	struct sigaction act;
+	struct worker *workers;
+	struct stats stats;
+
+	argc = parse_options(argc, argv, options, bench_futex_wait_wake_usage, 0);
+	if (argc) {
+		usage_with_options(bench_futex_wait_wake_usage, options);
+		exit(EXIT_FAILURE);
+	}
+
+	cpu = perf_cpu_map__new_online_cpus();
+	if (!cpu)
+		exit(EXIT_FAILURE);
+
+	memset(&act, 0, sizeof(act));
+	sigfillset(&act.sa_mask);
+	act.sa_sigaction = toggle_done;
+	sigaction(SIGINT, &act, NULL);
+
+	if (params.mlockall) {
+		if (mlockall(MCL_CURRENT | MCL_FUTURE))
+			err(EXIT_FAILURE, "mlockall");
+	}
+
+	/*
+	 * At least two threads are required: one to call wait() and another
+	 * one to call wake().
+	 */
+	if (!params.nthreads)
+		params.nthreads = max(2u, perf_cpu_map__nr(cpu));
+	else
+		params.nthreads = max(2u, params.nthreads);
+
+	workers = calloc(params.nthreads, sizeof(*workers));
+	if (!workers)
+		err(EXIT_FAILURE, "calloc");
+
+	if (!params.fshared)
+		futex_flag = FUTEX_PRIVATE_FLAG;
+
+	printf("Run summary [PID %d]: %d threads, each operating on a %s futex for %d secs.\n\n",
+	       getpid(),
+	       params.nthreads,
+	       params.fshared ? "shared" : "private",
+	       params.runtime);
+
+	mutex_init(&workers_lock);
+	cond_init(&workers_ready);
+	cond_init(&workers_go);
+	init_stats(&stats);
+
+	run_workers(workers, cpu);
+	sleep(params.runtime);
+	toggle_done(0, NULL, NULL);
+	join_workers(workers);
+
+	calc_stats(workers, &stats);
+	print_summary(&stats);
+
+	cond_destroy(&workers_go);
+	cond_destroy(&workers_ready);
+	mutex_destroy(&workers_lock);
+
+	free(workers);
+	perf_cpu_map__put(cpu);
+
+	return 0;
+}
diff --git a/tools/perf/builtin-bench.c b/tools/perf/builtin-bench.c
index 02d47913cc6a..8df3c5da60df 100644
--- a/tools/perf/builtin-bench.c
+++ b/tools/perf/builtin-bench.c
@@ -74,6 +74,7 @@ static const struct bench futex_benchmarks[] = {
 	{ "hash",	"Benchmark for futex hash table",               bench_futex_hash	},
 	{ "wake",	"Benchmark for futex wake calls",               bench_futex_wake	},
 	{ "wake-parallel", "Benchmark for parallel futex wake calls",   bench_futex_wake_parallel },
+	{ "wait-wake", "Benchmark for futex wait/wake calls",           bench_futex_wait_wake },
 	{ "requeue",	"Benchmark for futex requeue calls",            bench_futex_requeue	},
 	/* pi-futexes */
 	{ "lock-pi",	"Benchmark for futex lock_pi calls",            bench_futex_lock_pi	},
-- 
2.53.0-Meta

  
