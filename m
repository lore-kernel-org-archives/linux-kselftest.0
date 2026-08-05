Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBC42980C
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936537; cv=none; b=MhoaxQ5LBKYQ91NBaDhaXs1BmtxHbF5rF1qjEwTp75SQqXLeDYTi15Hb/jSVutAngFLngBNYpTuyiVUGoAOGl8gDj2BmymlWzFPfMVy1y1B8Oos0hoZ4+x2yUuZVBLiZuW4pRH9LACEVagBhRdQDKfGh9QvTwemrA2/1Q/YOycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936537; c=relaxed/simple;
	bh=yqAR600Lwn1JBAgWbch+26YWFKLW6PwAVse8HOYZ4P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVPcNGBw+ZCbfqCTE5iu2ObBYVtHZrTFrc0htFpPgdo5ufmvm+/Q90BDrdKIdNsvsdekUHTF/BY94EmHfjpGSZHYBoH2Rsq4RfAKFPOtOk3Lo6zOrt606HFn4Q8Y8VXnpDJjw1tN+JPmMKQdiCIyhtMknrtmz++rpjAbMBGES30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qYvXCyd6; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qYvXCyd6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785936523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ohWIiFiZQMMaj44Q5qxYSozUAgqaRbIPDottHMZtMEo=;
	b=qYvXCyd6XjFSVKtIH+4UdmSzgHdnGiAxZ4ea5QF20VAkBqEl68jPtxxlUvVfYWRUAmaHc6
	7hIkfzKB08MLuvTWX572KM8IHms34o9CC2yBAa6eu4OuYgXSatS9mMsA/ZbcNqIMz/QRxh
	jNsuM3Ejmjc58c1kbpDX/kaIIpMEsi4=
From: Usama Arif <usama.arif@linux.dev>
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	tglx@kernel.org,
	peterz@infradead.org,
	andrealmeid@igalia.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	mingo@redhat.com,
	shuah@kernel.org,
	shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	riel@surriel.com,
	kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
Date: Wed,  5 Aug 2026 06:28:30 -0700
Message-ID: <20260805132831.2852771-1-usama.arif@linux.dev>
In-Reply-To: <anIcb6Y_WbS9Z9Z8@shell.ilvokhin.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrote:

> On Fri, Jul 31, 2026 at 12:26:24PM -0700, Usama Arif wrote:
> > futex_wait_setup() increments the bucket waiter count in futex_q_lock() and
> > takes hb->lock before checking whether the futex word matches the expected
> > value. A mismatch then immediately undoes the waiter accounting and drops
> > the lock again without queueing anything.
> > 
> > In a fleet-wide sampled profile at Meta, among samples whose leaf was
> > native_queued_spin_lock_slowpath(), the top call paths were:
> > 
> >         shrink_inactive_list()   (lru_lock)   25.0%
> >         futex_wait_setup()       (hb->lock)   21.6%
> >         futex_wake()             (hb->lock)   19.5%
> >         raw_spin_rq_lock()       (rq lock)     6.1%
> >         __remove_mapping()                     3.3%
> >         lock_list_lru_of_memcg()               3.1%
> > 
> > Together, the two futex paths represented 41.1% of sampled qspinlock
> > slowpath events in this profile.
> 
> I couldn't work out from the changelog how much of that hb->lock
> contention is actually the uval/val mismatch. A contended userspace
> mutex would produce the same profile, and the two want different fixes,
> so I had a look on a couple of Meta workloads.
> 
> -EWOULDBLOCK reaches futex_wait() only from futex_wait_setup()'s value
> check, so the return value is the outcome:
> 
>     timeout 10s bpftrace -e 'fexit:futex_wait { @[retval] = count(); }'
> 
> On a workload available to me:
> 
>     @[-516]: 29
>     @[-512]: 48
>     @[-11]: 7039       1.9%  -EWOULDBLOCK
>     @[-110]: 35296     9.5%  -ETIMEDOUT
>     @[0]: 328583      88.6%  woken
> 
> So 1.9% of calls take the path this patch optimises. Another host
> running a different application gives 6.2%, so it varies, but not by
> anything like the margin perf bench futex hash suggests.

The number of calls is not the right thing to measure here. Whats important
is time spent in futex_q_lock().

I ran the script at the end the reply on one of the largest workloads in our
fleet, running on hundreds of thousands of servers.

@calls[mismatch]: 83033
@calls[match]: 1214134
@lock_ns[mismatch]: 155373529
@lock_ns[match]: 539660978
@lock_us[mismatch]:
[0]                61175 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@| 
[1]                 6250 |@@@@@                                               | 
[2, 4)              5253 |@@@@                                                | 
[4, 8)              4755 |@@@@                                                | 
[8, 16)             4048 |@@@                                                 | 
[16, 32)            1429 |@                                                   | 
[32, 64)             123 |                                                    | 

@lock_us[match]:
[0]              1186732 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@| 
[1]                19845 |                                                    | 
[2, 4)              3860 |                                                    | 
[4, 8)              2110 |                                                    | 
[8, 16)             1197 |                                                    | 
[16, 32)             273 |                                                    | 
[32, 64)             116 |                                                    | 
[64, 128)              1 |                                                    | 


As you can see, eventhough its 6.4% of the calls, 22.4% of the lock time:
1871ns per mismatching wait against 444ns per matching one.

Counting waits that spent over a microsecond in futex_q_lock():

    mismatch  21,858 / 83,033     26.3%
    match     27,402 / 1,214,134   2.3%

A mismatching wait is about twelve times more likely to land on a
contended lock.

A second-order effect pushes the same way. On a mismatch the patch also
skips futex_hb_waiters_inc()/dec(), so the concurrent waker's
futex_hb_waiters_pending() can find the bucket empty and skip hb->lock
altogether.

> 
> The other 98% might be worth a number too. We expect __futex_wait() to
> end up waiting, and for that common case uaddr is now read twice: once
> in the precheck and once under hb->lock. Probably fine, but do you have
> a measurement for it?
> 

I measured the matching path separately because perf bench futex hash only
exercises mismatches. I used a prefaulted private futex that is never changed
and a 100-us timeout, so every call matches, queues under hb->lock, exercises
the blocking timeout path, and returns ETIMEDOUT.

Over 5 boots, the median wall time was 167.092us on the parent and
166.984us patched (-0.06%). There is no latency regression because of an
extra read.

> > perf bench futex hash only ever mismatches, as its futex words are
> > calloc()ed to zero while every operation waits for 1234. On a 16-vCPU,
> > 8-GiB guest, median of five 'perf bench futex hash -r 5 $args' runs
> > of the reported mean per-thread throughput, in operations per second:
> > 
> >         $args    benchmark                  parent      patched     change
> >         -b 2     private, two buckets      303,410    4,392,639      14.5x
> >         -b 0     private, global hash    2,776,498    4,397,887     +58.4%
> >         -b 0 -S  shared                  1,990,412    2,727,487     +37.0%
> > 
> > This benchmark no longer measures futex hash bucket contention, because its
> > words never match and every operation now returns before the bucket is
> > located: neither futex_hash() nor hb->lock is reached, and the -b knob
> > stops affecting the result (both patched rows are ~4.4M).
> >
> 
> After this patch perf bench futex hash no longer really measures what it
> was written for, since the bucket is never located. It is probably not
> the best benchmark for this change either, as it only ever exercises the
> path being skipped. Might be worth a look as part of the series?

Yes, this is what I meant when I wrote above that

"This benchmark no longer measures futex hash bucket contention".

I would be happy to rewrite perf bench futex to something more meaningful,
I wanted to first get reviews on the kernel change itself.

> 
> None of this is an objection to the approach, just that we likely need
> more data than a benchmark which is not exactly measuring what we care
> about.
> 

Thanks for taking a look!

The above data shows the significance of the patch.
It provides a very meaningful improvement (22.4% of time spent in futex_q_lock()
will be significantly optimized and will also deliver second-order effects)
and has no measurable impact on latency in the matching path.
IMHO, this patch is a free lunch.



futex-mismatch-cost.bt
---------------------

config = {
    max_map_keys = 65536;
}

fentry:futex_wait
{
    @in[tid] = 1;
    $a = delete(@acc, tid);
}

fentry:futex_q_lock
/@in[tid]/
{
    @qs[tid] = (int64)nsecs;
}

/* __futex_wait() retries, so accumulate rather than overwrite. */
fexit:futex_q_lock
/@qs[tid]/
{
    @acc[tid] += (int64)nsecs - @qs[tid];
    $b = delete(@qs, tid);
}

fexit:futex_wait
/@in[tid]/
{
    $outcome = retval == -11 ? "mismatch" : "match";
    $ns = (uint64)@acc[tid];

    @calls[$outcome] = count();
    @lock_ns[$outcome] = sum($ns);
    @lock_us[$outcome] = hist($ns / 1000);

    $c = delete(@in, tid);
    $d = delete(@acc, tid);
}

interval:s:30 { exit(); }

END
{
    clear(@in);
    clear(@qs);
    clear(@acc);
}



futex_wait_timeout.c
-------------------

#include <errno.h>
#include <inttypes.h>
#include <linux/futex.h>
#include <stdatomic.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/resource.h>
#include <sys/syscall.h>
#include <time.h>
#include <unistd.h>

static _Atomic uint32_t futex_word __attribute__((aligned(64)));

static uint64_t now_ns(void)
{
	struct timespec now;

	if (clock_gettime(CLOCK_MONOTONIC_RAW, &now)) {
		perror("clock_gettime");
		exit(1);
	}
	return (uint64_t)now.tv_sec * 1000000000ULL + now.tv_nsec;
}

int main(int argc, char **argv)
{
	uint64_t iterations = 20000;
	uint64_t timeout_ns = 100000;
	uint64_t start, elapsed;
	struct timespec timeout;
	struct rusage before, after;
	uint64_t i;


	/* Prefault the resident private word before measuring it. */
	atomic_store_explicit(&futex_word, 0, memory_order_relaxed);
	timeout.tv_sec = 0;
	timeout.tv_nsec = timeout_ns;

	if (getrusage(RUSAGE_SELF, &before)) {
		perror("getrusage");
		return 1;
	}
	start = now_ns();
	for (i = 0; i < iterations; i++) {
		int ret;

		errno = 0;
		ret = syscall(SYS_futex, &futex_word, FUTEX_WAIT_PRIVATE, 0,
			      &timeout, NULL, 0);
		if (ret != -1 || errno != ETIMEDOUT) {
			fprintf(stderr,
				"iteration %" PRIu64 ": ret=%d errno=%d\n",
				i, ret, errno);
			return 1;
		}
	}
	elapsed = now_ns() - start;
	if (getrusage(RUSAGE_SELF, &after)) {
		perror("getrusage");
		return 1;
	}

	printf("iterations=%" PRIu64 " timeout_ns=%" PRIu64
	       " elapsed_ns=%" PRIu64 " ns_per_wait=%.3f waits_per_sec=%.3f\n",
	       iterations, timeout_ns, elapsed, (double)elapsed / iterations,
	       (double)iterations * 1000000000.0 / elapsed);
	printf("voluntary_cs=%ld involuntary_cs=%ld voluntary_cs_per_wait=%.6f\n",
	       after.ru_nvcsw - before.ru_nvcsw,
	       after.ru_nivcsw - before.ru_nivcsw,
	       (double)(after.ru_nvcsw - before.ru_nvcsw) / iterations);
	return 0;
}
