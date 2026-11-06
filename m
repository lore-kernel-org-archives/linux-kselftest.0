Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794009594;
	b=OYXs+03ux6OzO4oS+ygjZ1DDXjwTnnYVFzaS1nJy440Q1wiVJuo82CnYbvagwq8Lteql
	 ZadI8TqDoBv/2cFrhEpnElNKO1Lfk+WaokSm2MFJaWNmNMcRT5gujMTZXSDpeAyDAmZvo
	 zHy22zzplQ0UNPsiJYi4GuTXCAsLgceGKjsqrnqGfvRtFJF1Gkp5Pk3HcUNf++3/aQ1BX
	 TEdaY42n942qpH3gXft5AceGn5w2fwuPKBFh5WPHGGu4AOmWAD3prX4ssnxKEmcqY70xb
	 1nNe6fA2/UrBalCjEBtwDhi6EQqKbS4BI75fZD4xVvg/LNZ3IuVCqOk/wiYvL1Zq7sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794009594;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u7Zc6qRQcGfsS6WH5n/ba6aIAh9dXwOzPltZs2m8etY=;
	b=Iga+zjnYwiVTYQAA8+fKJYiwtFdBL7p2DIZ4HQLKs/ESkX7Tm4jxMPCIfjSROrU383hT
	 3WsIkmGis58wfIHZzS4nlUCPrhyNyIaIav5vlfJD64Mo+ouv6tMRoelHY/Fx23QyHyMQS
	 J9/H5SmVYxRJEJWEcCbW3I8wO8PtLUIC9zGgHu113/3GVMlkznI9NNN/jWvjbzQ5Cduu0
	 c2/TdjNfzALSyt81E2u7IVWXPIxPLc6VTc+dsGmT85a04TH2O+hd112vEn47yiPAT5a/6
	 Nj4A25RRlWNjrp7timN03hikXBXIqJdTKBl46CJtfV7lHrYHIxfL5veVK0Jy8ECd9Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=MVJU1cX3;
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB9606D803;
	Fri,  6 Nov 2026 23:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FB9606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=MVJU1cX3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794009588;
	bh=u7Zc6qRQcGfsS6WH5n/ba6aIAh9dXwOzPltZs2m8etY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVJU1cX3oGWXBtHSbqwt+Q+i//B4J85EXV/DyS0TGEbTXScb7+HurZGjHTbv66QSX
	 0thZS7bFyJRb9bPPbBv9+X+CtLleciTqZKJdoevFKcMTay86zdY5NyYr+OPM6b5dpl
	 7ZatSHLejgbyil/pXprF8A0HnTNBRva8G490asBRAPmSU4PnKDpy6yDaUqn0yiMuyU
	 6gVly0wPafPI+HwAv9pm21dBac1nxy7rt9yrypABq+SBm6qvc1ZHr9H4ttWw2Amb9c
	 QXKKstEUTyKNV328ee3pi8A9HH+YF/KUQchYjdLkLQAh9QqI580jonJwPVupv+r7gF
	 hAavj8MWVDAvA==
Received: from thinkos.internal.efficios.com (unknown [64.58.40.251])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jLx4M5rKpzLxM;
	Fri, 06 Nov 2026 18:59:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	will@kernel.org,
	boqun@kernel.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	shuah@kernel.org,
	juri.lelli@redhat.com,
	linux-rt-devel@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 5/5] locking/ww_mutex/test: Time an ABBA with both owners running
Date: Fri,  6 Nov 2026 18:59:31 -0500
Message-Id: <20261106235931.1478800-6-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261106235931.1478800-1-mathieu.desnoyers@efficios.com>
References: <20261106235931.1478800-1-mathieu.desnoyers@efficios.com>
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

The ABBA cases of test-ww_mutex let neither context run while the other
blocks on it. With PREEMPT_RT a ww_mutex waiter spins on a running
owner, and the wound that resolves an ABBA reaches it through a wakeup.
Add a wound-wait case where both contexts run, each on a CPU of its own
at SCHED_FIFO, the younger one blocked on the older one's lock when the
older one blocks on the younger one's: the older context must get its
second lock within 10ms on average over 10 rounds.

On v7.4-rc1 with PREEMPT_RT the case fails every time, 96ms on average,
0.95s at most, in 2 VMs of 2; with "locking/rtmutex: Stop spinning on
the owner when the waiter is woken", earlier in this series, it passes.
Without PREEMPT_RT it passes on both.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
---
 kernel/locking/test-ww_mutex.c | 213 +++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index 838d631544ed..1bf3a91adfec 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -6,10 +6,12 @@
 #include <linux/kernel.h>
 
 #include <linux/completion.h>
+#include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/prandom.h>
+#include <linux/sched/task.h>
 #include <linux/slab.h>
 #include <linux/ww_mutex.h>
 
@@ -279,6 +281,213 @@ static int test_abba(struct ww_class *class, bool trylock, bool resolve)
 	return ret;
 }
 
+/*
+ * ABBA with both contexts running, each on a CPU of its own at SCHED_FIFO:
+ * the younger one, holding B, blocks on A, which the older one holds while
+ * it stays on its CPU; the older one then blocks on B, which wounds the
+ * younger one, and stays on its CPU too. A waiter that spins while its
+ * owner runs sees the wound only if the wakeup that tells it ends the
+ * spin: until something else gets to run on one of the two CPUs, the two
+ * spin on each other. The older context must get B within 10ms on
+ * average, over 10 rounds; it takes microseconds. Wound-wait only: with
+ * wait-die, the younger context backs out as it blocks on the older one.
+ */
+struct test_abba_spin {
+	struct ww_class *class;
+	struct ww_mutex a_mutex, b_mutex;
+	struct completion start, done[2];
+	struct task_struct *young;
+	atomic_t stage;
+	u64 wait_ns;
+	int err[2];
+};
+
+static bool abba_spin_until(struct test_abba_spin *s, int stage)
+{
+	u64 end = ktime_get_ns() + 5ULL * NSEC_PER_SEC;
+
+	while (atomic_read(&s->stage) < stage) {
+		if (ktime_get_ns() > end)
+			return false;
+		cpu_relax();
+	}
+	return true;
+}
+
+/* Spin until the younger context waits on a lock, its state no longer TASK_RUNNING. */
+static bool abba_spin_until_waiting(struct test_abba_spin *s)
+{
+	u64 end = ktime_get_ns() + 5ULL * NSEC_PER_SEC;
+
+	while (task_is_running(s->young)) {
+		if (ktime_get_ns() > end)
+			return false;
+		cpu_relax();
+	}
+	return true;
+}
+
+static int abba_spin_old(void *arg)
+{
+	struct test_abba_spin *s = arg;
+	struct ww_acquire_ctx ctx;
+	u64 t, end;
+	int err = -ETIMEDOUT;
+
+	sched_set_fifo_low(current);
+	wait_for_completion(&s->start);
+	ww_acquire_init_noinject(&ctx, s->class);
+	atomic_set(&s->stage, 1);
+	if (!abba_spin_until(s, 2))
+		goto fini;
+	err = ww_mutex_lock(&s->a_mutex, &ctx);
+	if (err)
+		goto fini;
+	atomic_set(&s->stage, 3);
+	err = -ETIMEDOUT;
+	if (!abba_spin_until(s, 4) || !abba_spin_until_waiting(s))
+		goto unlock;
+	/* The younger one is in its wait on A: let it reach the spin. */
+	end = ktime_get_ns() + NSEC_PER_MSEC;
+	while (ktime_get_ns() < end)
+		cpu_relax();
+	t = ktime_get_ns();
+	err = ww_mutex_lock(&s->b_mutex, &ctx);
+	s->wait_ns = ktime_get_ns() - t;
+	if (!err)
+		ww_mutex_unlock(&s->b_mutex);
+unlock:
+	ww_mutex_unlock(&s->a_mutex);
+fini:
+	ww_acquire_fini(&ctx);
+	s->err[0] = err;
+	complete(&s->done[0]);
+	return 0;
+}
+
+static int abba_spin_young(void *arg)
+{
+	struct test_abba_spin *s = arg;
+	struct ww_acquire_ctx ctx;
+	int err = -ETIMEDOUT;
+
+	sched_set_fifo_low(current);
+	wait_for_completion(&s->start);
+	if (!abba_spin_until(s, 1))
+		goto out;
+	ww_acquire_init_noinject(&ctx, s->class);
+	err = ww_mutex_lock(&s->b_mutex, &ctx);
+	if (err)
+		goto fini;
+	atomic_set(&s->stage, 2);
+	if (!abba_spin_until(s, 3)) {
+		err = -ETIMEDOUT;
+		ww_mutex_unlock(&s->b_mutex);
+		goto fini;
+	}
+	atomic_set(&s->stage, 4);
+	err = ww_mutex_lock(&s->a_mutex, &ctx);
+	if (err == -EDEADLK) {
+		/* Wounded: back out of B, wait for A, then take B again. */
+		ww_mutex_unlock(&s->b_mutex);
+		ww_mutex_lock_slow(&s->a_mutex, &ctx);
+		err = ww_mutex_lock(&s->b_mutex, &ctx);
+		if (err) {
+			ww_mutex_unlock(&s->a_mutex);
+			goto fini;
+		}
+	} else if (err) {
+		ww_mutex_unlock(&s->b_mutex);
+		goto fini;
+	}
+	ww_mutex_unlock(&s->b_mutex);
+	ww_mutex_unlock(&s->a_mutex);
+fini:
+	ww_acquire_fini(&ctx);
+out:
+	s->err[1] = err;
+	complete(&s->done[1]);
+	return 0;
+}
+
+static int test_abba_spin(struct ww_class *class)
+{
+	int (*fn[2])(void *) = { abba_spin_old, abba_spin_young };
+	unsigned int c, cpu[2] = { nr_cpu_ids, nr_cpu_ids };
+	u64 total = 0, longest = 0;
+	struct test_abba_spin s;
+	int i, round, ret = 0;
+
+	if (class->is_wait_die)
+		return 0;
+	cpus_read_lock();
+	/* The last two online CPUs, the ones boot and housekeeping use least. */
+	for_each_online_cpu(c) {
+		cpu[0] = cpu[1];
+		cpu[1] = c;
+	}
+	for (round = 0; cpu[0] < nr_cpu_ids && round < 10 && !ret; round++) {
+		struct task_struct *t[2];
+
+		ww_mutex_init(&s.a_mutex, class);
+		ww_mutex_init(&s.b_mutex, class);
+		init_completion(&s.start);
+		atomic_set(&s.stage, 0);
+		s.class = class;
+		s.wait_ns = 0;
+		for (i = 0; i < 2; i++) {
+			init_completion(&s.done[i]);
+			s.err[i] = -EINVAL;
+		}
+		for (i = 0; i < 2; i++) {
+			t[i] = kthread_create_on_cpu(fn[i], &s, cpu[i], "ww_abba_spin/%u");
+			if (IS_ERR(t[i])) {
+				ret = PTR_ERR(t[i]);
+				if (i)
+					kthread_stop(t[0]);
+				goto unlock;
+			}
+		}
+		s.young = t[1];
+		/* Held, for kthread_stop() to reap a thread that already returned. */
+		for (i = 0; i < 2; i++) {
+			get_task_struct(t[i]);
+			wake_up_process(t[i]);
+		}
+		/* Asleep until both are woken: neither spins ahead of the other. */
+		complete_all(&s.start);
+		for (i = 0; i < 2; i++) {
+			int err;
+
+			wait_for_completion(&s.done[i]);
+			err = kthread_stop(t[i]);
+			put_task_struct(t[i]);
+			if (err && !ret) {
+				pr_err("%s: kthread_stop: %d\n", __func__, err);
+				ret = err;
+			}
+		}
+		if (s.err[0] || s.err[1]) {
+			pr_err("%s: ABBA with both owners running not resolved, err %d and %d\n",
+			       __func__, s.err[0], s.err[1]);
+			ret = -EINVAL;
+		}
+		total += s.wait_ns;
+		longest = max(longest, s.wait_ns);
+	}
+	if (cpu[0] >= nr_cpu_ids)
+		pr_info("%s: skipped, two online CPUs needed\n", __func__);
+	if (!ret && round && total > 10 * NSEC_PER_MSEC * round) {
+		pr_err("%s: ABBA with both owners running resolved in %llu us on average, %llu us at most\n",
+		       __func__, div_u64(total, round * NSEC_PER_USEC),
+		       div_u64(longest, NSEC_PER_USEC));
+		ret = -EINVAL;
+	}
+unlock:
+	cpus_read_unlock();
+	return ret;
+}
+
 struct test_cycle {
 	struct work_struct work;
 	struct ww_class *class;
@@ -664,6 +873,10 @@ static int run_tests(struct ww_class *class)
 			return ret;
 	}
 
+	ret = test_abba_spin(class);
+	if (ret)
+		return ret;
+
 	ret = test_cycle(class, ncpus);
 	if (ret)
 		return ret;
-- 
2.47.3

