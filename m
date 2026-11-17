Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891186;
	b=QvQ4bn54zf6DMXRma+p1daVf4iaVbGyC2lmGeuTc07oPPR5QrGFaQxhfhzvMoQNsA9JF
	 u01u2c8oFJaOemzsWOt0b69EY9iM/Kj/A4SJMfU3MEJDDRZFHUPbIpGQxNwaj8AZ7MWJv
	 Y4i7vqWw4sHvKEzzbMrbl2LEq37KAVaSUQZQ9UDPcfitTgh2Gw+s2BjEiaVqnZJihR8XM
	 A5Q83YNmxrReo19MEG/wt1VZJIkR2HeEr5k6s9aB84bQESEXJw+9OQORZrUViu5J/e6vE
	 PXuAdsAf/M/Rxobv8I/GOncBz7zvf6c6cz6MsfdeB/sH1ss/AHlpdLIs7eTCwKkqyQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fN22KBOTScvrwmw++3dnOESml/CWiaCxPlZ9R+mGDfI=;
	b=QkPhSwF4UTdVSgPeOaVS5xVH52dtq4U3HWfIaZyl+58vU+vLw0WbrsKJazJsEjFLrhWg
	 wFvJ2qliqaEyTuvN0Iy9O9cHFljMrvaMCoFFHoBcm0jPcwFFCHOIAssRNteHSTVt7V82h
	 6gPtmJdEMoMycXKfzwWWJ5CAp/zNPA+h8eux47Z9EsO0RM50GcG46AqJK7gXlEoGO40Yx
	 rUnQNRzd/2YwX9fvsrze7EnQXdRXTK5yCujemnqnJFjWCAF6dC4W4vhlh2CMK4rnO7KRA
	 ggBGkUnm902D2VsJCE3cPI9HT8JK4HgWuKpO0Bb6tzz7uLcg7TpBPXkwJu3vVIZU7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=in6qnkgC;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC6606A336
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 04:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBC6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=in6qnkgC
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so4254241a12.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794891185; x=1795495985; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fN22KBOTScvrwmw++3dnOESml/CWiaCxPlZ9R+mGDfI=;
        b=in6qnkgCY9elVezeHjtPo3lzsyuVBhxQMFlh+v/veDnqQqV8A7Unf5023qp94pHz0O
         wGnBOKLLcofjnnHsMxufzS6qXrUPKXLBAO1+az4OTKoOrmgDNKEwPc0UmOSsVr+hK6Ea
         3ub8U/TD0/jht+fuMucHa3Lah75zD0+WahGKiR5PiyESX/EzVZxL51on/ymtorBOv35i
         rzAuNwkSRsbkocZIgk5UuwZp4m/3G8UwcHxNAmbUaD/sUkzxPfz3t7b9NvQNQ6XTQjXQ
         BxdWemp4YkrYzYxnb2/BbGBTj+W9vgKWXNUo40IIY+XsjmUGrbvsCQKmuFE3Pq+lpPWr
         RUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891185; x=1795495985;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fN22KBOTScvrwmw++3dnOESml/CWiaCxPlZ9R+mGDfI=;
        b=0tBs8F2MDzzv284vz0KVoBX3KrEB/l57n21IhJjT3k090RW/psdLqaBsbBCiNjU8fK
         C9siwOrZfqDkuWybg5Ebo6RVI0r0dn5A+WW03CIAdrWTbQaZ4PRBUg4pV2BQ7N6dLhOl
         HgRDFRiAyk9f0SU7QyggZwprZcpkGZsoOVv1BHYF7iW3U4YngE5rjFQXF87q0y1wS+Xn
         JuRLF34WcP+m/azLw9aByP33W/eBEVpzoFaDDWpWSODTnOMS4YFfgHXDzbnp3hMthVQN
         yRNfRBhkWqWyIBsNkBdn8HbdzElGTNKjJZLsgDeuCCQW5jELG3127aZrBLfLveXwyLxU
         hArg==
X-Forwarded-Encrypted: i=1; AL+hErEFODre1yjhycqlkxTXdE78RpLr1MO44y+h4mI6X2He33XjLCE8+hEXIjM7SaqcVvm6wYHHeioCDgQrh5teIsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1IRRrXbnrL/uxXfXwUKtEEuNe5v98F/sU5QVf+UeTmIPB3SrG
	CRwZRph4jQwWsqZTexKRtZUrKaOQeemGd6N9AIEJMjrvTFJ7phwxmmnDJ1KWw3l+sxc8bOmMdm2
	XLv2SLCtdWoNSGeUjHEn5ye4yxw==
X-Received: from pjrx15.prod.google.com ([2002:a17:90a:bc8f:b0:3b3:ad37:918c])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:380f:b0:3ab:e588:c29b with SMTP id 98e67ed59e1d1-3b1b0816e0dmr12919214a91.5.1794891184644;
 Mon, 16 Nov 2026 20:53:04 -0800 (PST)
Date: Tue, 17 Nov 2026 04:52:53 +0000
In-Reply-To: <20261117045254.1048298-1-dylanbhatch@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117045254.1048298-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117045254.1048298-2-dylanbhatch@google.com>
Subject: [PATCH 1/2] sched, livepatch: Fix transition stall for CPU-bound tasks
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
live-patching") moved klp_sched_try_switch() from cond_resched() into
__schedule() and gated it on READ_ONCE(curr->__state) & TASK_FREEZABLE.
This causes livepatch transitions to stall when a CPU-bound kthread or
PF_USER_WORKER thread (such as vhost-<pid>) spins in a kernel loop with
cond_resched() for two reasons:

1. A sole runnable task on a CPU (cfs_rq->nr_queued == 1) never has
   TIF_NEED_RESCHED set during sched_tick(), and wake_up_state(task,
   TASK_INTERRUPTIBLE) in klp_send_signals() is a no-op for a
   TASK_RUNNING kthread. Because _cond_resched() is a no-op under
   CONFIG_PREEMPTION=y, the task only enters __schedule(SM_PREEMPT) on
   return from interrupts via irqentry_exit_cond_resched() when
   TIF_NEED_RESCHED is set.
2. Even when __schedule() is entered via preemption or an unfreezable
   sleep (such as PF_NOFREEZE kthreads or PF_USER_WORKER threads
   sleeping in TASK_INTERRUPTIBLE), curr->__state does not have
   TASK_FREEZABLE set, so klp_sched_try_switch() skips the task.
   Livepatch safety in __schedule() is already guaranteed by
   stack_trace_save_tsk_reliable() inside klp_check_stack().

Fix both issues by:
- Removing the TASK_FREEZABLE check from klp_sched_try_switch() and
  checking TIF_PATCH_PENDING inline via klp_sched_need_resched().
- Calling resched_curr(rq) in sched_tick() when klp_sched_need_resched()
  is true for the current task, ensuring CPU-bound tasks with a pending
  livepatch enter __schedule() at the next timer tick.

Note that when a CPU-bound task is the sole runnable task on its CPU,
entering __schedule(SM_PREEMPT) from preempt_schedule_irq() leaves an
in-kernel interrupt pt_regs frame on the stack during
klp_sched_try_switch(). Completing the transition in that context
requires arch_stack_walk_reliable() to support unwinding across
in-kernel exception frames (as CONFIG_UNWINDER_ORC=y does on x86_64);
configs and architectures whose reliable unwinder rejects in-kernel
exception frames (x86 with CONFIG_FRAME_POINTER=y, arm64, powerpc, and
s390) still require another runnable task to context-switch the spinning
task out until exception-boundary reliable unwinding (e.g. via SFrame)
is available.

Fixes: 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and live-patching")
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 include/linux/livepatch_sched.h | 13 +++++++++++--
 kernel/sched/core.c             |  3 ++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_sched.h
index 065c185f27638..748b6012e2e06 100644
--- a/include/linux/livepatch_sched.h
+++ b/include/linux/livepatch_sched.h
@@ -11,15 +11,24 @@ void __klp_sched_try_switch(void);
 
 DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
 
+static __always_inline bool klp_sched_need_resched(struct task_struct *curr)
+{
+	return static_branch_unlikely(&klp_sched_try_switch_key) &&
+	       unlikely(test_tsk_thread_flag(curr, TIF_PATCH_PENDING));
+}
+
 static __always_inline void klp_sched_try_switch(struct task_struct *curr)
 {
-	if (static_branch_unlikely(&klp_sched_try_switch_key) &&
-	    READ_ONCE(curr->__state) & TASK_FREEZABLE)
+	if (klp_sched_need_resched(curr))
 		__klp_sched_try_switch();
 }
 
 #else /* !CONFIG_LIVEPATCH */
 static inline void klp_sched_try_switch(struct task_struct *curr) {}
+static inline bool klp_sched_need_resched(struct task_struct *curr)
+{
+	return false;
+}
 #endif /* CONFIG_LIVEPATCH */
 
 #endif /* _LINUX_LIVEPATCH_SCHED_H_ */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8ca..fcea9cea3edf1 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5854,7 +5854,8 @@ void sched_tick(void)
 	hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
 	update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
 
-	if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY))
+	if ((dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY)) ||
+	    klp_sched_need_resched(curr))
 		resched_curr(rq);
 
 	donor->sched_class->task_tick(rq, donor, 0);
-- 
2.56.0.679.gc527c65306-goog

