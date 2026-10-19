Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C884331EB8
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413725; cv=none; b=prclDad+dJoAICD+SG6eA7w7Jay7jWNMZgH8lC+gNQaDPPl9IeAXzYc6vWRaSmPuuCtCqkHY1uEf9mUpygyd1H8pat+rehwpoMiIdVHFzE/CgLKywQ+lpDeIdB2ZTlNoD6jAh/dNiMBGg1DwtfYp6rVJZhhlI3GXrWyscH8modU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413725; c=relaxed/simple;
	bh=FlBQwdip4g4HHV/g4pwDPD+JRcfp+uQYehDQvnDw7uY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otqKdlyaM5NQczaiBSGjTQcihX5oc2X8OeSYHfng+foSF+94LBDTJH0Rv4q85/PGvz/EFUvaGnimJ6Gkhlh3xqp0WaMTnHNCRpTyvVEJegGaYW9JfwPes6uzTiAI7Zl3CDzLCVCOP+6WgC0uGVCqfb6x21lzPMbEv3goLWniZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTgnloRi; arc=none smtp.client-ip=209.85.218.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--michalblk.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTgnloRi"
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c41b03cd1dcso173176866b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 05:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792413714; x=1793018514; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LoRGSkasm8ghLjUGPktte7l/3lMtd3+HJlK+733NI4=;
        b=OTgnloRinqYgv0F8i05sXj+7GJXN/UEUxXRg4L58ojRA6uXsoNWmEV4sLKLed3j4Po
         ObFjw40/FbBRdPhDZR+zLraU6AGble/58uVs7V7TWr9kxwJAsr7uJ3fY4F2wsqSYHrOU
         PkKTCwtT+Y9YpZJxH3pSIl4DbXOxNs8hOe0PGlDMGEWnUie8U6xw1L/9bZMFt4bKpGZb
         kwitH9+W+MpazdoCW5I7o0GIbC0M4wm1oxC56C+jY3QQ3yf4ZPjEHGIr5RZfx54cq4cw
         0a7gTnMSJXTpcq0eNJTy5DEcmqgL/LFlqQuRvRvmeZLfA1RcAQ8nRsuE78pUjH3tmXp7
         HFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413714; x=1793018514;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LoRGSkasm8ghLjUGPktte7l/3lMtd3+HJlK+733NI4=;
        b=RthGXTM55rEMW/5t9El6euwPGfoxpDqItFfil9m9F9FT5TI7vLGFKZHChW8hTjNHOn
         79vudejmHZBeEqoaM/ujebsCA83LKKLv2stLRtWQ08mXGvYBSM9WLg0M7Skg5tFa9hSb
         /JT1rkcF4iB0TzTOLCh+00xi+u127alSRGR8SiXcse8lpNeGegYR0/0ogd241dK0XX2X
         fGiKtq7/lehf9MXEawRkm3zAzORQoOWFIBLXiHq5V3ATdF+aan2BcM5e5T+C+KQNUERz
         jDhEHxDpsTq4xt7/pLgTLzYbKeC3ZpQLzFEX4tZ/b/9+qAEceu1saNMELf58RWeBeL6o
         FUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBynoSYIDNCBPX39n/dUL9uwDO0zmCBl741FxwfjdbJNpgXPoqItYxbwZobS9cHGidJ1UcxU9WgEsJw7jEX1oEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxtmlk0yDyzB8kXnSMhkPe8qYX+hOvvt9MrQ9Wc1t7v1nqIn9t
	Btqxc1J7ZqoXQrVzor+3SPCFJ0A5f5NTx3yeJfISwRpegqVSp4cPEqdQmTFVU9sSwpaYBQuofiA
	De5bPMoEGG/kJuMb3RQ==
X-Received: from ejgi17.prod.google.com ([2002:a17:906:3c51:b0:c3f:bf12:31eb])
 (user=michalblk job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d08d:b0:c41:8736:8c38 with SMTP id a640c23a62f3a-c419f703a50mr462018766b.30.1792413713899;
 Mon, 19 Oct 2026 05:41:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:41:45 +0000
In-Reply-To: <20261019124146.3582127-1-michalblk@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261019124146.3582127-1-michalblk@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261019124146.3582127-2-michalblk@google.com>
Subject: [PATCH 1/2] sched_ext: Reset runnable_at when a task leaves its scheduler
From: Michal Blaszczyk <michalblk@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Kuba Piecuch <jpiecuch@google.com>, 
	Michal Blaszczyk <michalblk@google.com>
Content-Type: text/plain; charset="UTF-8"

The watchdog measures how long a task has been waiting from
p->scx.runnable_at, which set_task_runnable() resets when the task becomes
runnable after it last ran. ops_dequeue() never asks for a reset, as the
dequeue of a waiting task is temporary, e.g. for a migration or an
attribute change.

Leaving the scheduler isn't temporary. A task which is switched out of
SCHED_EXT while it's waiting keeps its runnable_at. When it's switched back
and becomes runnable, its wait appears to have started before it left, and
the time it spent in another class counts towards the timeout. If the
watchdog checks before the task runs, it aborts the scheduler:

  sched_ext: class_switch_stall: runner[418] failed to run for 3.010s

Here, the task waited for a few milliseconds before it was switched to
SCHED_OTHER, slept outside of SCHED_EXT for three seconds, and was charged
for all of it as soon as it woke up on SCHED_EXT again.

The same happens when scx_sub_enable_workfn() hands a waiting task over to
a new sub-scheduler, which can then be blamed for time the task waited
under the parent. scx_rehome_task() isn't affected, as it moves the task
through SCX_TASK_INIT, which resets runnable_at. The stale runnable_at also
skews the default core-sched ordering in scx_prio_less().

Reset runnable_at in scx_disable_task(), when the task leaves the control
of its scheduler.

Fixes: 8a010b81b3a5 ("sched_ext: Implement runnable task stall watchdog")
Assisted-by: LLM
Signed-off-by: Michal Blaszczyk <michalblk@google.com>
---
 kernel/sched/ext/ext.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 07857039aee69..120df09b9e0af 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -2424,7 +2424,11 @@ static void ops_dequeue(struct rq *rq, struct task_struct *p, u64 deq_flags)
 	struct scx_sched *sch = scx_task_sched(p);
 	unsigned long opss;
 
-	/* dequeue is always temporary, don't reset runnable_at */
+	/*
+	 * Don't reset runnable_at. If @p is waiting, the wait continues across
+	 * temporary dequeues, e.g. for a migration or an attribute change.
+	 * scx_disable_task() ends it if @p leaves its scheduler.
+	 */
 	clr_task_runnable(p, false);
 
 retry:
@@ -4517,6 +4521,14 @@ static void scx_disable_task(struct scx_sched *sch, struct task_struct *p)
 	scx_set_task_slice(p, 0);
 	p->scx.reenq_cnt = 0;
 
+	/*
+	 * If @p is runnable but not running, its wait started at runnable_at,
+	 * which ops_dequeue() didn't reset. Leaving @sch ends the wait. Reset
+	 * runnable_at the next time @p is enqueued on SCX, so that the watchdog
+	 * doesn't count the time @p spends elsewhere.
+	 */
+	p->scx.flags |= SCX_TASK_RESET_RUNNABLE_AT;
+
 	/*
 	 * Verify the task is not in BPF scheduler's custody. If flag
 	 * transitions are consistent, the flag should always be clear
-- 
2.56.0.176.g3575e65682-goog

