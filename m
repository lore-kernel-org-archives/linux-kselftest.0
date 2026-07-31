Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C4C438023
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 19:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526011; cv=none; b=SYHmWijKOdM+OiaBfZUm7Sm+uE63C+kXCcWPsDmo8BE19V51ivar0GchjcUdAOsqm9IE3rZa1LJj516NZs201RFEf6Hn1KZc+rMmjQTtGohBq2Un2QonmBzthIVnrdcMRoJNINi+925bn2U2yQf0Oa1V4qwPpy4f2l/JQNy4/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526011; c=relaxed/simple;
	bh=jU6UYytjY3AFFrVy0qdbdv/IWSusOxrvD3h6qJD6fFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byafFep6vLFPfnFP58MWjoe2LOfGmHK3ruK8OCfCH+AEr0jHGFuk5PY1QMrgs3l+3eIT2YN8uIKy86/dza4Tbc8r7I/d/QrAc1WkSHQAkN64WmsD/aEd/SzlaClSJjojQiKncfqgJF3P31uucSma3dbM/DW9nPess0Sdx2xtKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Psssxxpp; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Psssxxpp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785526005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ld4l7r6m5QLBkZmwYEz1rs+iqEDUsqkuE4Lyo1OSGKU=;
	b=PsssxxppJE9xcpru1Qb2+wChVaTC0VIw8VcSSwUHmruAYdudcL14BVY6JEUr/QTlcZcGG+
	+PUso8oOZX1gtSZ93Fff2cuZW8a761zy4QIuYqXPgT5j9px3szlbW3t9TZcyLd0HWRCRWf
	79Ma6UYTEBUH0ZiI8VsAkngrj1Ey5vI=
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	peterz@infradead.org,
	andrealmeid@igalia.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	mingo@redhat.com,
	shuah@kernel.org
Cc: shakeel.butt@linux.dev,
	hannes@cmpxchg.org,
	riel@surriel.com,
	d@ilvokhin.com,
	kernel-team@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
Date: Fri, 31 Jul 2026 12:26:24 -0700
Message-ID: <20260731192624.140399-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

futex_wait_setup() increments the bucket waiter count in futex_q_lock() and
takes hb->lock before checking whether the futex word matches the expected
value. A mismatch then immediately undoes the waiter accounting and drops
the lock again without queueing anything.

In a fleet-wide sampled profile at Meta, among samples whose leaf was
native_queued_spin_lock_slowpath(), the top call paths were:

        shrink_inactive_list()   (lru_lock)   25.0%
        futex_wait_setup()       (hb->lock)   21.6%
        futex_wake()             (hb->lock)   19.5%
        raw_spin_rq_lock()       (rq lock)     6.1%
        __remove_mapping()                     3.3%
        lock_list_lru_of_memcg()               3.1%

Together, the two futex paths represented 41.1% of sampled qspinlock
slowpath events in this profile.

Read the futex word once before taking hb->lock. That read sits outside the
waiters/value ordering documented at the top of waitwake.c and may be
stale, so it may only be used to refuse to block: a mismatch is a valid
outcome for the wait as a whole and is returned as -EWOULDBLOCK without
locating the hash bucket. A match proves nothing and is discarded; the
decision to queue is still taken by the existing test under hb->lock. This
reaches the futex_wake() side too, as dropping the transient
futex_hb_waiters_inc()/dec() pair lets a concurrent waker find the bucket
empty in futex_hb_waiters_pending() and skip hb->lock as well.

get_futex_key() runs get_user_pages_fast() only for shared futexes, so
their page has just been faulted in and the non-faulting
futex_get_value_locked() normally succeeds. The reference is dropped again
before get_futex_key() returns, so the page can go away; the locked path
below recovers when it does. A private futex may still be nonresident, so
read it faultably with get_user_inline().

The precheck stays after get_futex_key() so that its address validation,
alignment and access_ok() included, keeps taking precedence over
-EWOULDBLOCK. All three callers, __futex_wait(), futex_wait_requeue_pi()
and io_futex_wait(), already treat a nonzero return as failure with
hb->lock not held. futex_wait_multiple_setup() keeps the old sequence:
FUTEX_WAITV has to set TASK_INTERRUPTIBLE before queueing the first futex
of the vector.

perf bench futex hash only ever mismatches, as its futex words are
calloc()ed to zero while every operation waits for 1234. On a 16-vCPU,
8-GiB guest, median of five 'perf bench futex hash -r 5 $args' runs
of the reported mean per-thread throughput, in operations per second:

        $args    benchmark                  parent      patched     change
        -b 2     private, two buckets      303,410    4,392,639      14.5x
        -b 0     private, global hash    2,776,498    4,397,887     +58.4%
        -b 0 -S  shared                  1,990,412    2,727,487     +37.0%

This benchmark no longer measures futex hash bucket contention, because its
words never match and every operation now returns before the bucket is
located: neither futex_hash() nor hb->lock is reached, and the -b knob
stops affecting the result (both patched rows are ~4.4M).

The futex functional selftests pass with PROVE_LOCKING, DEBUG_ATOMIC_SLEEP
and FAIL_FUTEX enabled.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 kernel/futex/waitwake.c                       | 30 +++++++++++++++----
 .../selftests/futex/functional/futex_numa.c   |  6 ++--
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d4483d15d30a..dc22aea9808a 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -627,17 +627,18 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 	int ret;
 
 	/*
-	 * Access the page AFTER the hash-bucket is locked.
-	 * Order is important:
+	 * Perform the authoritative value check AFTER the hash-bucket is
+	 * locked. Order is important:
 	 *
 	 *   Userspace waiter: val = var; if (cond(val)) futex_wait(&var, val);
 	 *   Userspace waker:  if (cond(var)) { var = new; futex_wake(&var); }
 	 *
 	 * The basic logical guarantee of a futex is that it blocks ONLY
 	 * if cond(var) is known to be true at the time of blocking, for
-	 * any cond.  If we locked the hash-bucket after testing *uaddr, that
-	 * would open a race condition where we could block indefinitely with
-	 * cond(var) false, which would violate the guarantee.
+	 * any cond.  If the decision to block came from a test of *uaddr taken
+	 * before the hash-bucket is locked, that would open a race where we
+	 * could block indefinitely with cond(var) false, violating the
+	 * guarantee.  The unlocked test below may only refuse to block.
 	 *
 	 * On the other hand, we insert q and release the hash-bucket only
 	 * after testing *uaddr.  This guarantees that futex_wait() will NOT
@@ -649,6 +650,25 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 	if (unlikely(ret != 0))
 		return ret;
 
+	/*
+	 * A mismatch here refuses the wait without locating the hash bucket;
+	 * a match is rechecked under the lock below before queueing.
+	 *
+	 * get_futex_key() runs get_user_pages_fast() only for shared futexes,
+	 * so their page is resident and the non-faulting read suffices, with
+	 * the locked path recovering if it does not.  A private futex may
+	 * still be nonresident, so read it faultably here.  Note that
+	 * futex_get_value_locked() only disables faults, it does not need
+	 * hb->lock.
+	 */
+	if (flags & FLAGS_SHARED)
+		ret = futex_get_value_locked(&uval, uaddr);
+	else
+		ret = get_user_inline(uval, uaddr);
+
+	if (!ret && uval != val)
+		return -EWOULDBLOCK;
+
 retry_private:
 	if (1) {
 		CLASS(hbr, hbr)(&q->key);
diff --git a/tools/testing/selftests/futex/functional/futex_numa.c b/tools/testing/selftests/futex/functional/futex_numa.c
index e0a33510ccb6..029a9a6afd95 100644
--- a/tools/testing/selftests/futex/functional/futex_numa.c
+++ b/tools/testing/selftests/futex/functional/futex_numa.c
@@ -144,9 +144,9 @@ static void *contendfn(void *_arg)
 
 	while (!*args->done) {
 		/*
-		 * futex2_wait() will take hb-lock, verify *var == val and
-		 * queue/abort.  By knowingly setting val 'wrong' this will
-		 * abort and thereby generate hb-lock contention.
+		 * By knowingly setting val 'wrong' this wait is always
+		 * refused.  futex2_wait() now detects that before taking
+		 * hb-lock, so this no longer generates hb-lock contention.
 		 */
 		futex2_wait(&args->lock->val, ~0U, fflags, NULL, 0);
 		args->val++;
-- 
2.53.0-Meta

