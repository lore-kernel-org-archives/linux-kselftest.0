Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795580298;
	b=gv7Y+mPl34HppcziRgtjTzNNpDZ3DkZVQlDKQQssQOZGRQWab7Le/26cSCSbXp/TrjHX
	 H/VW947SfHcvKipt7r7/ITSPNvs2bC67+z5ktqDes3Cm7nGv/MQP68YSl7vNjpyRrXMOA
	 MUHk2TF7LViLQLLXKjPzdm+MjiA4jgblVi+DPoEv6hpW140FokAyVm15wg6XDWNtHtARe
	 AVZLFYvsKrk6LPZABTAY42q0wzeZD38ndBtm4m+E+t/ufk7wSF+ImG5Z3pLaOjQUYDHTF
	 dySR7Pc2aoRjFTDtV97uJqOJyea+jm4D6tFz1SximnTsLIOpwm0ITt2KHUbWcfWGZgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
	b=dj0N50dAOCFhAEu9iqbCJMbC6bV6hpUOFnsghRfM1iv19f9uqbrqgczis3VNdFMpCRKd
	 n/O62yj75HC+sHHAXrc4BbYdzZLYcejKTJ5cgGWDExjkdcFkNgtMTBRP9GYy/nzGWvpbD
	 LFP70niOpbGZNI+gOzBnahWJuuH2Kqq78ntCritF4jAwSNQ5SvKyule++RuWqDxhIJ43f
	 ggJ+bopPkibGPUIrOXUFQIQitolVMx+yXhNsJTBd6qr02zfHsGR0zwzyOyvYKvvpoTwzY
	 edi8nABflUiUgQnM8RN7OEZRa2Y5JQUUhC+uH9K/o0pbAO7Q+Z4yYuoLwoyfpJc8bFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gr4V25J5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26924606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 04:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26924606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gr4V25J5
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so4360018137.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 20:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795580296; cv=none;
        d=google.com; s=arc-20260327;
        b=gJh8MYy6MZt5U8Fga4IXuGTtciFcM2YAHGdkfar5cPMq2u/pXoYjhXfAwgrY0JuYpo
         R6BApPJnfqlQyvGgFOK668bzUw1xz92blyqT8e5vI5YM1vRRc+vDprzSkmri4fvRfqST
         JO6OlkbUkQIIAoI54F5HdgPrrCnMWdPsTlln3gluy0qudX6yQqNqaCmzN9+uPbcbOQgo
         KVQERkChcMhqzt4FTZ8iZZ0J4mrSeJWRXzv1dWGoZEOHz2CJH3KqPTljiRoz7aAVlNjt
         1PfBQlGjfIjaj/0E5o6EXisG1Lk+YqeVmc2Pn3WqZkSJ3cfDuzCUHh4fe4YvQXEXt4t2
         ZhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        fh=Y9tnenppwWo5hL/3CMKqRUHJl1dYuCxILbMwB7931zs=;
        b=ZbPo4DMbS3oi6Nko+1mv7DhMKJr8bkER15+oruPKtgMcoctYIqJ5jng5cAWro9DRAE
         J3R+jfw61TSzbafmeMudqs1SLv067cF9apCw6SDf9L7zuiOtWrUJXJ1+vJgw4fBd1ofv
         sQtJNMxKVU+zzYLNfij2DoPidMJtVcrcJbEXLZmFhiQjpzGCTJIPfypLJcZsCrgiOJKN
         FPWSrOOGU0srF8R+bjL4t1apPLGH7IGqI4v8zvKwlJkQqg1iW/Io7gCt6vaCk2QYVA6r
         T8LKupwqQWCpQBbwaBkwLl27WlYNubm3ENLxD8CHEi76H70dJ+haj3o4cpJ4m1nzF1C5
         NnGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795580296; x=1796185096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        b=Gr4V25J5P7BKBn0hrLKwdOaxCKfi33xlDSKABVG9b3SBg7R49I/LmFG/rHdDo+/IDj
         8ABDwK3CAw+gRQE7tMTvB/me+goYNKDSPf/+CXTiO4lsY4mdOSgJsUYeFwKxy7tKNkcn
         N8qi46Fw3QR151tdVh3lddwqDAv2gPij7WkmvoLz8Lirw4fjJvx5OZemRS1kTSkZXLTa
         kfo1Lm+wSMhAtdWExiTl9EsbBYmC+J8d/1dfUSmExuybUJmGpKmfhYSzQU7VfqjIAz95
         pmjSXmMMZ28kMPG69JhJltRejSQFGg5AMgKnOKhgRX2ShFWSfenhoeYPOmRYbQQisxhA
         oYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580296; x=1796185096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLeHDG2VnEXhT3JsLotiTiwhgWFVUUN1QQojkOZhb2I=;
        b=j8Cuq+O9voBLN++OPC51O7YTuy7upR/yWDbMyK+SqhOM1FOpKCEBSO6d+NZNVsFGck
         Q0sk4V3hRcX45iZzQQbJN2cHOm7ejUHBjrtV5aGIsijf3bGQeqU/cMg7RuhcrD7758xD
         AB+FguucXzN0G1g3IC0bH6PdwFU143HWkeS8Pd7u/3Euw732J7i8FiinPjpeyKHifHde
         gBIekZeYTxl6Q1ceaGyUxWknGn+9pSlvU5p6T1vqr9464bhlReRO/+uitNrwlaHcs+U3
         2mAQnPAeV4grsWjhlJy7Scq3NZsO8eDqlDcrdFc/yDce3C0sjEtIZVyI7ygeYIqnFrW/
         lgNQ==
X-Forwarded-Encrypted: i=1; AL+hErE05eu0Un5SzBV+URrKQMV05lirzke+FNoU/ZDQqaocPTbWfEBcWuUZrykZdWN1s5AnG6DXx871n2FOI4V8DbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbGmptunwEiJkoRc4/K7BBU8QS/6km6aQp8b/jKIPGZRwAmf2
	vxbuPdwAsnl5pTiVWHZaXV6uQTd8ZAQu4RngksqoWUpnPGL6foB0OMsAEdp3XU0F5H2NLm+tXoJ
	ZkREqWiytfiiUATDS7fMzr+GL2tcWLEn+uB7fEUhI
X-Gm-Gg: AZFdTZfiMYZlYuxhaE0G55pacC2YVqNGQ8nDjlsYP27ZpG7dA2UqdvXN4LKbR5Y24J4
	Os8jxkkUuLyc14RAAWn0+zANqmCSRUs/Yf1KVOWEy30JLDdSyyu+pcR61L1bXXV5sMZi2LldMm1
	R8x/ejEZagM/4TlMlSG88uuT/oCiumuVvdVtxeVO3/iBnmTqXsCy+e1ikaxIXNzfQWGxy9/KmJT
	tt6PdWZ8QpjVJwkG9Ye15qWMUJyl90qg3hW/Ou4GD3tGNDX53FqdMGD3DhkQyO2riRxBY55qNAY
	uaqTcA3ct6k7r/OoYW11QyKmyL94o1sv4i6pVpH2sfcLloTE5wZu44AiCkUZP3+bXOyIrgmNeJQ
	QnLwoaWx+k8kR1467yOeRxZ22ulNUs7Pp7K7RYzaEpbxu0RA3hrWhgRam2Q==
X-Received: by 2002:a05:6102:41a3:b0:7a3:b2c2:2e70 with SMTP id
 ada2fe7eead31-7d7395e32c3mr5734305137.11.1795580295324; Tue, 24 Nov 2026
 20:18:15 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117045254.1048298-1-dylanbhatch@google.com>
 <20261117045254.1048298-2-dylanbhatch@google.com> <awIMltMpXzhXiDpU@jpoimboe>
In-Reply-To: <awIMltMpXzhXiDpU@jpoimboe>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Tue, 24 Nov 2026 20:18:04 -0800
X-Gm-Features: Aa3M54pyIniNB_vn7eg13DbCLk1cWp5ylttVhb4AKr3piHRNkIg2PU3xZVlnsAY
Message-ID: <CADBMgpzifnY=3wF2vt01UTaqPE68N2e9oe5WoSMDUrdgBSWgvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched, livepatch: Fix transition stall for CPU-bound tasks
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Sat, Nov 21, 2026 at 1:55=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Nov 17, 2026 at 04:52:53AM +0000, Dylan Hatch wrote:
> > Commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
> > live-patching") moved klp_sched_try_switch() from cond_resched() into
> > __schedule() and gated it on READ_ONCE(curr->__state) & TASK_FREEZABLE.
> > This causes livepatch transitions to stall when a CPU-bound kthread or
> > PF_USER_WORKER thread (such as vhost-<pid>) spins in a kernel loop with
> > cond_resched() for two reasons:
> >
> > 1. A sole runnable task on a CPU (cfs_rq->nr_queued =3D=3D 1) never has
> >    TIF_NEED_RESCHED set during sched_tick(), and wake_up_state(task,
> >    TASK_INTERRUPTIBLE) in klp_send_signals() is a no-op for a
> >    TASK_RUNNING kthread. Because _cond_resched() is a no-op under
> >    CONFIG_PREEMPTION=3Dy, the task only enters __schedule(SM_PREEMPT) o=
n
> >    return from interrupts via irqentry_exit_cond_resched() when
> >    TIF_NEED_RESCHED is set.
> > 2. Even when __schedule() is entered via preemption or an unfreezable
> >    sleep (such as PF_NOFREEZE kthreads or PF_USER_WORKER threads
> >    sleeping in TASK_INTERRUPTIBLE), curr->__state does not have
> >    TASK_FREEZABLE set, so klp_sched_try_switch() skips the task.
> >    Livepatch safety in __schedule() is already guaranteed by
> >    stack_trace_save_tsk_reliable() inside klp_check_stack().
> >
> > Fix both issues by:
> > - Removing the TASK_FREEZABLE check from klp_sched_try_switch() and
> >   checking TIF_PATCH_PENDING inline via klp_sched_need_resched().
> > - Calling resched_curr(rq) in sched_tick() when klp_sched_need_resched(=
)
> >   is true for the current task, ensuring CPU-bound tasks with a pending
> >   livepatch enter __schedule() at the next timer tick.
> >
> > Note that when a CPU-bound task is the sole runnable task on its CPU,
> > entering __schedule(SM_PREEMPT) from preempt_schedule_irq() leaves an
> > in-kernel interrupt pt_regs frame on the stack during
> > klp_sched_try_switch(). Completing the transition in that context
> > requires arch_stack_walk_reliable() to support unwinding across
> > in-kernel exception frames (as CONFIG_UNWINDER_ORC=3Dy does on x86_64);
> > configs and architectures whose reliable unwinder rejects in-kernel
> > exception frames (x86 with CONFIG_FRAME_POINTER=3Dy, arm64, powerpc, an=
d
> > s390) still require another runnable task to context-switch the spinnin=
g
> > task out until exception-boundary reliable unwinding (e.g. via SFrame)
> > is available.
> >
> > Fixes: 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and live=
-patching")
>
> Oof, so Peter's patch broke all non-ORC for this case :-(
>
> Not sure what we can do about that other than get kernel sframe/eh_frame
> working for exception boundary unwinding, as you mention.
>
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > ---
> >  include/linux/livepatch_sched.h | 13 +++++++++++--
> >  kernel/sched/core.c             |  3 ++-
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_=
sched.h
> > index 065c185f27638..748b6012e2e06 100644
> > --- a/include/linux/livepatch_sched.h
> > +++ b/include/linux/livepatch_sched.h
> > @@ -11,15 +11,24 @@ void __klp_sched_try_switch(void);
> >
> >  DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
> >
> > +static __always_inline bool klp_sched_need_resched(struct task_struct =
*curr)
> > +{
> > +     return static_branch_unlikely(&klp_sched_try_switch_key) &&
> > +            unlikely(test_tsk_thread_flag(curr, TIF_PATCH_PENDING));
> > +}
> > +
> >  static __always_inline void klp_sched_try_switch(struct task_struct *c=
urr)
> >  {
> > -     if (static_branch_unlikely(&klp_sched_try_switch_key) &&
> > -         READ_ONCE(curr->__state) & TASK_FREEZABLE)
> > +     if (klp_sched_need_resched(curr))
> >               __klp_sched_try_switch();
> >  }
> >
> >  #else /* !CONFIG_LIVEPATCH */
> >  static inline void klp_sched_try_switch(struct task_struct *curr) {}
> > +static inline bool klp_sched_need_resched(struct task_struct *curr)
> > +{
> > +     return false;
> > +}
> >  #endif /* CONFIG_LIVEPATCH */
> >
> >  #endif /* _LINUX_LIVEPATCH_SCHED_H_ */
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 04b62c16fa8ca..fcea9cea3edf1 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -5854,7 +5854,8 @@ void sched_tick(void)
> >       hw_pressure =3D arch_scale_hw_pressure(cpu_of(rq));
> >       update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure);
> >
> > -     if (dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY)=
)
> > +     if ((dynamic_preempt_lazy() && tif_test_bit(TIF_NEED_RESCHED_LAZY=
)) ||
> > +         klp_sched_need_resched(curr))
> >               resched_curr(rq);
>
> Hm, so for unpatched tasks this forces a full preemption and stack walk
> on every scheduler tick?
>
> Instead can we just kick the thread in the existing klp_send_signals()
> escalation path like below (untested)?

Sounds good to me, moving to klp_send_signals() for v2. I encountered
two issues with your suggested diff as-is:

1. Based on kernel/trace/rv/monitors/opid/opid.c it looks like we
can't call set_tsk_need_resched from here:

rv: monitor opid does not allow event sched_need_resched on state any
with env irq_off=3D0,preempt_off=3D1

It looks like resched_cpu() works (suggested by my AI tool), so
sending v2 calling this instead.

2. I think this also misses user tasks stuck in the kernel with the
same behavior, so I moved the resched logic out of the (PF_KTHREAD |
PF_USER_WORKER) block. I also added coverage in the selftest, so the
same cond_resched situation is also created from a user task.

>
> diff --git a/include/linux/livepatch_sched.h b/include/linux/livepatch_sc=
hed.h
> index 065c185f27638..77161f5725dcc 100644
> --- a/include/linux/livepatch_sched.h
> +++ b/include/linux/livepatch_sched.h
> @@ -13,8 +13,7 @@ DECLARE_STATIC_KEY_FALSE(klp_sched_try_switch_key);
>
>  static __always_inline void klp_sched_try_switch(struct task_struct *cur=
r)
>  {
> -       if (static_branch_unlikely(&klp_sched_try_switch_key) &&
> -           READ_ONCE(curr->__state) & TASK_FREEZABLE)
> +       if (static_branch_unlikely(&klp_sched_try_switch_key))
>                 __klp_sched_try_switch();
>  }
>
> diff --git a/kernel/livepatch/transition.c b/kernel/livepatch/transition.=
c
> index e058d21d84b75..1ccbae2051c72 100644
> --- a/kernel/livepatch/transition.c
> +++ b/kernel/livepatch/transition.c
> @@ -402,12 +402,22 @@ static void klp_send_signals(void)
>                  * Meanwhile the task could migrate itself and the action
>                  * would be meaningless. It is not serious though.
>                  */
> -               if (task->flags & PF_KTHREAD) {
> +               if (task->flags & (PF_KTHREAD | PF_USER_WORKER)) {
>                         /*
>                          * Wake up a kthread which sleeps interruptedly a=
nd
>                          * still has not been migrated.
>                          */
> -                       wake_up_state(task, TASK_INTERRUPTIBLE);
> +                       if (wake_up_state(task, TASK_INTERRUPTIBLE))
> +                               continue;
> +
> +                       /*
> +                        * If it's running, force it through __schedule()=
 so
> +                        * it can switch itself in klp_sched_try_switch()=
.
> +                        */
> +                       if (task_curr(task)) {
> +                               set_tsk_need_resched(task);
> +                               kick_process(task);
> +                       }
>                 } else {
>                         /*
>                          * Send fake signal to all non-kthread tasks whic=
h are
>
