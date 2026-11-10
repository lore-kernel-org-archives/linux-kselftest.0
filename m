Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309289;
	b=TAHIOzCk7srpHtRsU1wkTNcnxaPkjPr5VJhbmbszsPJs3203/CZwHXT7eyV3jlwBmK+P
	 KnDmzip/llwRtM6+wrZOV0C6ToGVkuPlkQc90/p81FII1BCD6nZy72E2yANteJHEiyhaf
	 laYB6qSPwLge/7pIUS9I6CO6gMBfP+WQhckuF54Ts04n8zCC6P3pUYVx2iFh6xIIOkTMc
	 1OCofuJnmfiEyz7roQda/zjfC0TB08+nuB/MOvciCmAc88TRMyXaltgV8L/KhF2ja4nVr
	 hmLK1QTuxlvEIt1jgRbqf7vyRFnpWqg+9QjHUeZvQSZmVQgiW90rdobD3mbMHivntog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309289;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qOR1to8DwDNMHvVPWKTNupvvaYNTxEjClRGA3vc5Xw0=;
	b=hoDh9u4BYYKGGZrEworyd3LfkDoT9zedLnayMqzfo5Il8Z/kdiwRboGsZZsbMFd55KL0
	 f0oPoHpxtpMmNYT15IEeLk4PTTjAqY7T1lN+EGlkJRRFiYpRBscaSOSF8UaAuZ9G3aLsb
	 NYUVaBmXucfa7gKgknFXQ4yRv7dJXSUz2Acu3vSrvHNGAurJd4+6fQAoaWuu90winG5hJ
	 9vLgpjVXfgTJr+GsqL7VU7sV6yT4ezazQSHVMqPCQWe3u/tByIiBRETLgMl9UCh5COPb7
	 8SS5wWQOk8u/ulB0awjKGSr084fzKkef3W8Noc8lAsqqEICNAp1vtA0B5QehfzqriUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eGX9K1Ri;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fue1uWIB;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B96606A333
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 11:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B96606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eGX9K1Ri;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fue1uWIB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794309288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qOR1to8DwDNMHvVPWKTNupvvaYNTxEjClRGA3vc5Xw0=;
	b=eGX9K1RiprlgDLcN03x69X8D8WVtOnwfkz5UhhlmqbVXEX2Vl42IV9Zn35l96PGnteFie3
	5w9h0ro5bvGflRQkZ5V9gme+R/AiDiwbCML1/WA6W4Y55CyNlf8Tp3R6Yca57GYVsPloQI
	ljAHtglsXE1zN5bvK5Cf2dg4yiISmmw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-f9CFZCTaOVWQS4YUsed2Uw-1; Tue, 10 Nov 2026 06:14:46 -0500
X-MC-Unique: f9CFZCTaOVWQS4YUsed2Uw-1
X-Mimecast-MFC-AGG-ID: f9CFZCTaOVWQS4YUsed2Uw_1794309285
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4916d47eeb5so1560573f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 03:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794309285; x=1794914085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOR1to8DwDNMHvVPWKTNupvvaYNTxEjClRGA3vc5Xw0=;
        b=fue1uWIB/eOIEC6nITbNo0WpinwOJCTHvtyX9cgkZIGGR81840Ve0tmtEXGzWvZxN8
         5oT+VqUh4XCfLPtQjkOMnIaKc7eElRr5mK4nR9Cpl7JgoqDpwA4hPoQjBAYrK0pJh7vI
         pr5i3qV14ZYTz0CkLgIMvbii9isWK0o1QP3gtuEiOBtjgJxljsba6H1M2HgUycHcaYYt
         +bLbJeNx5dh16egiaGxdlgUxchbiJDcRhX48BiJXQLUu4fhJcHW2a5HBDrHnVJtiCTyX
         Z5DAbCYFt+jNC0vnY11c8TroCrqmy4MUIItjSSu0cM2QAxwrqW+b4hxxZGWtx16fvJkv
         G49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309285; x=1794914085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOR1to8DwDNMHvVPWKTNupvvaYNTxEjClRGA3vc5Xw0=;
        b=yu4RVDUKNRIGMXwJFE/bNcd3n46lgmNTHlisQewm5sUnVgKFscg+zDYGhN+RQC96Xw
         tGjKlAeJ5DXRsrwsNpnMrQnw3cm+8fU1S0n5YYuewD4fFc0XntkTsn9yuG7INGbgwRAM
         6xr6ntNjTza76LVoYQhfhEpMD/XOLQ1eOljE9QiwFOEtBM2sLGMdhGXhxnWLHWrdjOQH
         Ci8cjS3QhN9uqOeV+E7LyLQPHI05mtr+/B8Qzgpdy3T3XVaxYeYUSKTyszdWk8mKQ0XH
         WVU3nDibREplqoOT4+Kru/A/Gb7RPIssKlFS9kXXeKuqBCwGoubg/aQnNHl/SqrQ1n+6
         SQxQ==
X-Forwarded-Encrypted: i=1; AL+hErHMZUrKN0vOuT/glDBg1aB+oMvLwOWvAh+U6+QRBJhxISP0WUvAXdE+06rg19V1tcwZr5mwkaBppwekHyhdy/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YvzRiSXzQxgu7kbLmaTL5l4a4Vt2qDd/wgd3eE96vuSUEFXtt
	cB82tqX4UrbazvShh7rqtIjNElXc/ltzuDhHfynSdlecRVDofVOnPxzX7GslifryqKDCL4Pk+t+
	1JwiMKTg2T2A4uN77735Fjc/t7Uz7ebST+0JEEaQMP62mqnGKPbWqOJX+cAcETiLvve5brQ==
X-Gm-Gg: AYBFou0ntzT2OIRjxS/DNGiAj6Sk62j+FeFbNruSx8mhjGFn1ws1tgYzl16704Wm88w
	t7EMe8ZF/y85i3XkoA9HwKOvpJIUbEVmSOWvJTBqllHijl9FyiCx03iuoyJWlBrXDgsbqvkkQ72
	279PzCzhya8vgz9uVb1VJalFQMyUORVAPVBfKI1DjqPlv3JRHfd00Ej2vKxzfDuM6RflErE/0L5
	YaQgRiOitGb04iz1822iMRqEm4G1D5tgozywURC+fqhPRDX1H+HGjbsbJ1TQR6YP2tJ2cLm60+L
	E3sHxK2zp1WMyI/O3IcGqqqHqt8ku9WQSRQrm2cjbRAcSRSoM6oAz6TG/6xh22iTm3LbwFkmoZ4
	IrszXXbQ+3JTFhjixq9HlWe3aFHPmxy7XKs+OaN4xtSbSEU1tBsS6/FH1hEWdPf4JweGHrpXfFB
	M3Uuc=
X-Received: by 2002:a05:6000:2010:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-498305da0dfmr4850197f8f.39.1794309284998;
        Tue, 10 Nov 2026 03:14:44 -0800 (PST)
X-Received: by 2002:a05:6000:2010:b0:490:50c1:f359 with SMTP id ffacd0b85a97d-498305da0dfmr4850140f8f.39.1794309284563;
        Tue, 10 Nov 2026 03:14:44 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988f5b1ce3sm2904341f8f.14.2026.11.10.03.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:43 -0800 (PST)
Date: Tue, 10 Nov 2026 12:14:40 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 08/29] sched/deadline: Take a deadline boost from the
 waiter's rt_mutex node
Message-ID: <avL8oOtjKqVNR7-l@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-9-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108185406.1549770-9-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> When a SCHED_DEADLINE waiter boosts the owner of an rt_mutex, the owner
> runs on the waiter's live parameters, through dl.pi_se. The waiter can
> leave SCHED_DEADLINE, and have them cleared, before the owner is
> deboosted. When the owner's runtime runs out, replenish_dl_entity()
> loops forever on a dl_runtime of 0. It holds the rq lock, with
> interrupts off. The owner's CPU warns there and locks up.
> 
> rt_mutex_setprio() also reads the waiter's live priority, not the one in
> its rt_mutex node. Commit acd58620e415 ("sched/rtmutex: Refactor
> rt_mutex_setprio()") found this fine: if they differ, a PI chain update
> is imminent.
> 
> But the update can come too late. Leaving SCHED_DEADLINE clears the
> parameters, so that admission control counts the task again when it
> comes back. __sched_setscheduler() walks the chain only after it drops
> the waiter's rq lock. In the change itself, task_non_contending() clears
> the parameters of a waiter woken past its 0-lag time.
> inactive_task_timer() clears them later, when a sleeping waiter reaches
> that time.
> 
> O is a SCHED_OTHER task that holds the rt_mutex L. W is a SCHED_DEADLINE
> task. T is any other task:
> 
>   CPU 0 (O)                         CPU 1 (W)                     CPU 2 (T)
> 
>   locks L
>                                     blocks on L
>                                       rt_mutex_setprio(O, W)
>                                         O->dl.pi_se = &W->dl
>                                     sleeps
>                                       task_non_contending()
>                                         arms W's inactive timer
                                               ^^^
We know that PI is broken with DEADLINE and this adds to the count of
broken points. :)

>                                                                   sched_setscheduler(W)
>                                                                     W leaves SCHED_DEADLINE
>                                                                     task_rq_unlock(W)
>                                     <W's inactive timer>
>                                     inactive_task_timer()
>                                       __dl_clear_params()
>                                         W->dl.dl_runtime = 0
>   <tick>
>   update_curr_dl_se()
>     replenish_dl_entity()
>       runtime += W->dl.dl_runtime
>       loops forever
>                                                                     rt_mutex_adjust_pi(W)
>                                                                       rt_mutex_setprio(O, W)
>                                                                         spins on O's rq lock

The hang of course is real though.

> A copy of the parameters at the boost is not enough. rt_mutex_setprio()
> would read the waiter's priority, then its parameters. A change of the
> waiter can clear them in between. A stress test switches the waiter in
> and out of SCHED_DEADLINE. With such a copy, the owner's CPU locked up
> within a second. With this patch, the test runs for 600 seconds.
> 
> The rt_mutex node records the waiter's priority and deadline under the
> waiter's pi_lock, which every change of its parameters holds. Fix this
> by recording the reservation there too. A deadline boost then takes the
> priority, the deadline and a copy of the reservation from the node of
> the top pi waiter. rt_effective_prio() now reads that node too. It used
> p->pi_top_task, which try_to_take_rt_mutex() does not update. The chain
> walk and rt_mutex_adjust_pi() also compare the reservation, so that a
> change of it alone reaches the owner.
> 
> This needs "locking/rtmutex: Clone the sort keys in
> rt_mutex_enqueue_pi()". struct rt_mutex_waiter grows from 112 to 160
> bytes on 64-bit. With PREEMPT_RT, every sleeping lock waiter has one on
> its stack.
> 
> A 300ms debug delay before rt_mutex_adjust_pi() locks up v7.4-rc1 in
> 8-CPU VMs, but not a kernel with this patch. The locking API, ww_mutex,
> locktorture and futex tests still pass with and without PREEMPT_RT.
> 
> Found by the Sashiko AI review of v3. Before v4, a second model found
> the window of a copy, and the stale node of a waiter that becomes the
> top waiter.
> 
> Fixes: a5e7be3b28a2 ("sched/deadline: Clear dl_entity params when setscheduling to different class")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

I am not completely sure that we want the additinal machinery below
though, if we can find a simpler stop-gap solution until proxy execution
makes things right.

I was thinking 2 alternative potential bandaids:

 1. Don't clear the parameters of a blocked waiter. Every live donor is,
 by construction, a task blocked on an rt_mutex. Guard the
 __dl_clear_params() calls in task_non_contending() and
 inactive_task_timer() with p->pi_blocked_on (both sites hold pi_lock,
 which is also what pi_blocked_on is written under). The bandwidth
 release still happens at the 0-lag time; only the parameter wipe waits
 until the task is no longer blocked. 
 
 2. Even simpler, considering that the above is of course still far from
 ideal: replenish_dl_entity() already WARNs on pi_of(dl_se)->dl_runtime
 <= 0, and then hangs. Make the condition bail instead. The deboost is
 already in flight: the sched_setscheduler() that clears the donor's
 parameters ends with rt_mutex_adjust_pi(), which walks the chain and
 deboosts the owner through rt_mutex_setprio() and needs the owner's rq
 lock to do so, which is exactly what the infinite loop holds. Bailing
 releases it; the owner then sits throttled until the walk lands
 (dl_task_timer() is a no-op for boosted entities) and moves it back to
 fair. The stall is bounded by the walk's latency. 

Don't get me wrong, the proposed fix looks OK to me, but it also looks
more complex to backport to stable, it will be anyway ripped apart by
proxy exec and doesn't unfortunately make DEADLINE PI less broken (yes
of course the system won't hang, which is very desirable :).

Thoughts?

Thanks,
Juri

