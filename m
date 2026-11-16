Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863573;
	b=ySHuisy/gjcVDgjBDSE6pPXzhEd0bdokYlQJ3P/n9GjiytFxGtJjsiAQG6zL+x395o5X
	 /HeAIHDEMIeCHxHtntiyMbF/PBEkKGACaYO1ArYBCWfE2wDj4e4LxgI2ZihXnduJNw/Z2
	 ua9jj++AlGVcRJhdALLuaZGHN1ZYpZ/ZfHWttOZV5DpqMdWNGX06OzTJpsUBKxMsYOgs6
	 0HTwEP8JleUiaOhvZaXFBr1KdhatSEeGQaamCGcJFTfYK/qbF2s1hgEY3zmozjfwiDeW7
	 kE1u3xxNorN5Hwiu4AU1oCwBxqo+1IWSAV44bWcBR8ZZYvPdZyMSxHYujA74yhvJpxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
	b=hzH7LhUx0uGRvFfKOSAER8XSMTnFac/Gu8KD+eXkLl4+aVHxphudQq9/9KJlObHRpAp4
	 3kM0ZzbV1o7F/qbVrS49wdMRZqxbCSp1PtReRoyIUYrRakfumvVSpefmXdsAUhZJlcbMn
	 g59tlEwgMOYzgRvnxDynzolLJEebrjYTCAC3whoe6+jCeWrYzK0qQ/uvwezVisso2V01V
	 uSMeRuJIrFmUsNH78VIk0vh6pBpMEfP4m+US9evVUddKQZRXws8Qvn4u7mYve1SIhrhwn
	 0FRgzaG4fP3Ed4i+VAcsyvvBhhF/zLJ1qD56kKZ2oA4EnCR95hRX9ktBRbHDLcMAdFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fMBYHCzd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1598606A887
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 21:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1598606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fMBYHCzd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14640765e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 13:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863569; cv=none;
        d=google.com; s=arc-20260327;
        b=kMdSAPo+bST1H6EnvBED00GxaoI0bfsDD3XruqMFbzCDiOlMFqYo/B7byOdp9z7ejF
         CdyqmlS8RZNxl5bwB4XheJzIa+B+VI10gAbMq6zYmSvykjYQCgGRAYyv4inkG+ewf8MQ
         r2Szxi6/Eh+wNNi9gHXXD9puIc9cDNh1+hA403SaeuLnE+LmrsW5uVcG6vamjBqVCXe6
         6hGx6Al847Q/svHJ5x6zgso+P/n94xcgYueFkEg0ejO0sbsXNmBcHf3MCg8Uv7YKSwy+
         99tKlmGnyfjeFU9kPzZ1kep8sXd6kYc0R41Cw8zfXSsSU/9pMm+QTIB8OuwIdP1Pf2b/
         DOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        fh=+FyNJhE00+Hg0NH3gunziS4NFknw/4voeliwUuMxHL0=;
        b=fvnlSoqL4RX+1LPyxLbzfOLw8/qME3yobTHoFX72fcZ4eMgjICwcbtm9gWLgXNa3Oi
         TJlBP07oLi7pZaPaaWo+SfjUPztlhbNoy8+3a7/litMz/9cwYdpQViCsLbLvI7cMZ0e4
         oQefrpCsyR2FfXNTUc97SWftlQGbKLHQuLnsHYsMEWmXelcw7NSI14L41OsgGFLiadvF
         Yg1wkv9mRHKNhwjFw1GnwDzIhoU3OHEVVHNAU+3prO/G4H4eTmwck3c5SHBDbB5IJJ8Z
         hKCJf7fyjLHRCopVT2/KsoHRB2PqZLCaPQkdfaNLkoHxAcp87DFcneEWd4KCXv3jvRsI
         cPjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794863569; x=1795468369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        b=fMBYHCzd06LovLLME8aQkedzRHJ0gmu5w/QBtnPIt1dTWaNPaVtltJl8CUKAcz9FZt
         71/dY3X1H/P2TJaKxoUUFJ69cAEK4+oO5A9Y0b2HuFWEwDzgj6f9PERh8G5TAPVDlqoP
         O/nWM/NmlE57cMxf2ac9/GZ1wSqwL5FueF/KlWiUOK9EIt0OtSbaPX2g1Fl27HuvUZjB
         ld1jpajZRLGfz1oiX301P87gDF+Ik7RnkYHw4hG8PiNsgl02KAn6c4mwLLpruTR9i/N3
         Az5680TsGBWRdoqZoBns26Z7ySbt3WxwN9KLrzMrfVW6zCpmtjU1UiR5rZ0P8Sm9M3pJ
         kQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863569; x=1795468369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        b=fi6rxz+xI2oOykoepL8jcLy8qSghCSkeBNN1ViPlu0ktXZwGOLTSjl8iFkoGWtrEx5
         v5LCK0+eq7FOUISvUJm6Ir9cRk4W+64KmDjqHyzOe6M0tBezl8rOCa1LrHUIC0Urs8c/
         fY+9jbbjhi/IqU5zYPwhRholdnCPQytGaN/UEpy2+G+NkBquux+/X5tWrVGirkVw/rds
         r0RHfPIZ3AjGoMuTR6Y9eTfOt0mcv/11V7+Nn/wL266wCQwaKvMgKapgj8mO4eZ1YnVX
         yM2MsX25bjHVAHsULOv4nx5WVEqDk4WZayEZlCDVe0uLt4PjhUfXaR/ZG3fBIi+MsizO
         2kag==
X-Forwarded-Encrypted: i=1; AL+hErHrE6YjQAyUXeNgSiepkm+25zrfwz38oKi+i1vJWrrEWb2ce0gkHEIa+VClE8XVs3pRq6UWXKUGk6DxNaIn2eA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IqNm97tRuDA7G0GEtYjKEhrmAAkL3DRZqbLdhFiAR9ZuzBJSX
	4WhAtAUDzirtlTdYl6F0xHvkf/1xCLA2Gzox+WAUXuPosLQbpcSopvxgEN+BWW8E+ZS5md48LMn
	3ck02xSoartgj2rvc66Y2ATkJkP9Y3xJW41nnuEA=
X-Gm-Gg: AYBFou3ElgbCRFZSZrXqqcNVKvzsx4EtrPYvGC9LgmwYNykKwqN+Y91PhAaL+dH5oRT
	Pgk8ChLZBBt29TAFkmbwFQaITlAsEnC2XQYA5mVHRIrzjc3SlmIu1VQWGAK36q4cLb17Qc4uSdO
	DB80XY7dI7v+3nLMyTCo9zotTRzEiZa/YCnqmj+W4TaXO5TDeoDf9nP0CcUQWM+X5J7yXSbavLU
	HOIL8Fyfee8BcXSVTg5UNXVw7D1j5H6WgGKJ7V76d0ckUeyB21L5c9MqPuxqhyBgIgDP2NUVSFB
	Jd0+b1bPdlJMFs3UB66vxMd1ZI67cxfBcQs2bbr/ZlPidGdUwbZNHLhw2mbedbsHGUDA3jcCipy
	w4cU31ZZ0gbuRxb70S5Cf+TeN4XG4ULPbeDdLG0ol6Iz/e+duWD8++voDhCOs5I7Jl8svk7pPMU
	vUYb493GWo8nXmk0xVvKAXBv5TuKF98bRhROQ3G3FwdHdTcwOsfqDFLxNeAeevkOxTtjeK31xZV
	Msseb4yBH3rY4i8AHn4FeuEejNAuad3cq4rQP+ND6n8WQfJpDbBzQ==
X-Received: by 2002:a05:600c:8b82:b0:4bb:6814:7391 with SMTP id
 5b1f17b1804b1-4bb681476a8mr151902015e9.25.1794863568642; Mon, 16 Nov 2026
 13:12:48 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 13:12:35 -0800
X-Gm-Features: Aa3M54pKctKGXB1zsDszLWVjgZbbqKABzvcHoB3xDMhImH51M6VYE6PyFT3QX8I
Message-ID: <CANDhNCqmsDUC1hx6GnB_2ROQ2rYm3wKYfnbkVAuAjecducsSsQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/8] sched/proxy: Reschedule when a blocked task is
 woken under a proxy
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> With proxy execution, a task blocked on a mutex stays on its runqueue.
> The scheduler can pick it as the donor and run the mutex owner in its
> place. When the donor is woken, the CPU must stop running the owner on
> the donor's context.
>
> Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
> wakes a blocked task in place when it is still on its original CPU.
> ttwu_runnable() then relies on wakeup_preempt() to preempt the running
> task. But every class compares the woken task with rq->donor. When the
> woken task is the donor, it compares the task with itself, and no
> reschedule is requested. Only sched_ext handles this, with WF_TTWU_RQ.
>
> So the old owner keeps the donor's context after the mutex hand-off or
> after a signal. With a SCHED_FIFO donor nothing bounds this: the owner
> runs at the donor's priority until it blocks. With a SCHED_DEADLINE
> donor the owner consumes the donor's runtime.
>
> In a test on one CPU, a SCHED_OTHER owner kept spinning in user space
> after it released the mutex. A SCHED_FIFO waiter then ran 800ms late. A
> SCHED_DEADLINE waiter ran one period late.
>
> The same would happen when a task in the middle of a chain is woken.
> proxy_needs_return() resets the donor only when the woken task is the
> donor.
>
> Fix this in ttwu_runnable(). When a blocked task is woken on a runqueue
> that runs a proxy, reschedule. The next pick walks the chain again. A
> blocked task outside the donor's chain causes a harmless reschedule
> too.
>
> Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dc270a23179d..326026ba0b2b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4057,9 +4057,20 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>
>         update_rq_clock(rq);
>         if (p->is_blocked) {
> +               bool returned;
> +
>                 if (p->se.sched_delayed)
>                         enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DEL=
AYED);
> -               if (proxy_needs_return(rq, p))
> +               returned =3D proxy_needs_return(rq, p);
> +               /*
> +                * @p was blocked and this CPU runs a proxy. If @p is the=
 donor
> +                * or a task of its chain, the donor no longer waits for =
the
> +                * task that runs. wakeup_preempt() compares @p with the =
donor,
> +                * so it does not see this. Pick again.
> +                */
> +               if (rq->donor !=3D rq->curr)
> +                       resched_curr(rq);
> +               if (returned)
>                         return 0;

I need to think on this some more, but my gut reaction is this feels a
bit too subtle or possibly too broad. Particularly the check being
done after proxy_needs_return, but before the exit, it feels like it's
leaning too much on a non-obvious side-effect of proxy_needs_return().

Both the comment and the commit message are also confusing, as if at
the start of ttwu_runnable() if p is the donor, proxy_needs_return()
will have called proxy_reset_donor(), setting rq->donor =3D rq->curr
(and already calling resched_curr()).

So it seems this patch is mainly trying to handle the case of a
mid-chain wakeup, where p isn't the current donor, but is in the
current chain? I agree that looks to be a problem, but the donor !=3D
curr check just is testing that we are proxying, not that p is in the
active chain. It could be previously blocked on a different unselected
chain. That said, this may be a good enough approximation (especially
as doing the donor->curr chain walk feels expensive).

Though it feels like maybe the check should be pushed into
proxy_needs_return() instead so it can be more clearly aligned with
the similar proxy_reset_donor() call?

Or am I missing something more?

thanks
-john
