Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228140;
	b=4xAdXvf6WoPh73PmNyK48u827rU4poy3raODUPul3jmbrbNNGpDJQ5Ck1bPdLpxLBwbu
	 sxsuswVeGR8N9lg6bUCtYojEsbBPPeBc85n+McLUeu3aoWY3MFelm0pu+hztWYPSht0Qm
	 N4t+I8ObU0RuK9B3lrQFa+LOratcEaujRt9lYjU4EMUbGNf3tWrFQuKWkvppQh42qSKnz
	 zKJ+BiStObtPwEeNzV8aZ+6OEcozmB/aULuK8BmNdDQ2xMpkZvC40FBLlc0JZiBrU7cdP
	 Lq5XhUA7CQgVUUDzN8R+EQGfdH7mp23CSReUv7OZ+gIKPy7Rm1qUtwKIrFetlSwVqtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228140;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
	b=1y/eOQ1qpNRNsG9xjcZ+ptMYDlb5sjvag956ScG8DZ58uvF+5yuAY3bF/Y1QrQDgoo8i
	 H7YM/VkU/Uy2sbe65YmKyVY0i4r0qM3M5ydZpcSGVeSWaBn+0gsE6sBckY9mf+qK5Ws9k
	 ZaNlA1/up33fpv9FR7Eeqv28qdbWJsKMR9XyVwnfp46BBTot5nWK2fju+ibGBAlVHxIyH
	 GWySD8Io/u03S36MehXKYKWjEnVvaaCxvHaRzxRiYA51moKHiVAXaEeHYi9p3efPJftOR
	 U9TpFIGHofcjq2upU+S/EJ4BLNlkUuRUL0rMms5hBowsRV9uPtfJIz5O9gScOJJreTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCTbZtzC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pluYaXYO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A17606A322
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 12:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A17606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SCTbZtzC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pluYaXYO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794228138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
	b=SCTbZtzCgH4lSPIUFIytRFcMYuiQAz/Rmb7MdGZlDEbOPqx+zpoK4p6C0e2rFoJP0xvC0F
	mzY3SX0rFpFOx3nywftco7L5vuT8wE948sphvbm4IThab+w1yyQFGDl6JznwgitpE5r/D6
	Gb6GXm3aGMBM3Snld+Xu6bNHe+YGj2E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-tgwFwYBjP3qoJRnzeNLyeA-1; Mon, 09 Nov 2026 07:42:17 -0500
X-MC-Unique: tgwFwYBjP3qoJRnzeNLyeA-1
X-Mimecast-MFC-AGG-ID: tgwFwYBjP3qoJRnzeNLyeA_1794228136
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so7043655e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794228136; x=1794832936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
        b=pluYaXYO9Z9mXrCtps+gEWLNOMtSEIvVsckq8L6y6OF0oItWFAJi09sk5bpViNP0hJ
         DPBx71ZOSSQ9us5U1YqnNGdn7FtDYxG/FW9j0+rng1m8YxNMvD9DfdfoPhvCtb7A5L15
         Fn3nMMR+k3dJunGbtTqqFzHkg1MLG8DwOJbYUw49Qk8+tdVRvRrSTJpvP0PItBX5d/GW
         hPq3BIlO1XCWUijlavaO9KSClYoyqy0tQHDnKXhQ0UNGlq5ehxbS1M/srm5x9PYofhgv
         jQ7oNlvu9a2HPdJdaBflXSgz0tjEkAQFuDYMxnMrfmdcv3lNlzRXzDpkTR+pN9iySGUa
         3S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228136; x=1794832936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
        b=yk4VwOP3Ew+pwnYfNXazAORB9oL/wskVDsQp4ocdAV96wr3G+CzbiwyM4n53z2V/ek
         aD8PFz/Rmf9YUjcYAa84rqhRNiDxE1iBdaYFPgudD0vkziGt2celMk6W2sFJP0zhkslD
         Xah/7r/xj15A0a+XA1p5Nurc70gtUm+FFqgpkz9ay5TlXZ5JdXp6VS1SRYHxSt+6frzd
         3UQmoFbbCA2UfL6p2fIVSenHdiOU8PEWNFM8RYhR+c8KtiJOSwzUTKuxHXzRV9zBA2az
         jMFrj5UuvnReUqHeGBGXHeFcAxm3EaronUNvjQSiX12tYcyo5sVVbXQpXcre+G688zzA
         9NbQ==
X-Forwarded-Encrypted: i=1; AL+hErF8KuCfWlSRc9MZwPRJ1dKlKWKbAyqHyM2Zego6f1oCqB0roIOYFJENxeb/5jtrBzPTYNJTxoEBAXF7vXgtRwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nJSkf77/ZdpNDuEbpITMnJB+KsuUBVDeu6XIyG/64TpWMZBg0
	fwWN/3DvF9G6cE9hA9aU9txNarWBhy/810zl42s0c6tSfNMAniIoM5oQMqE/AgCvv57FS1ifGcw
	VpVVkfAsuk2O7De0nRfzJuPwmDsdz8cJ1k05bXz9fggQhlhAf8nNzGgWS2324uFejwDdsAA==
X-Gm-Gg: AYBFou0xxpWvxJBtFTJCJFRpXHF1IZZbvhpxXMyYBeXkFHZnQb+N/g3oI8gnmEvv/cz
	DDh4adrqZ26U/sTuHZXvU8Wkj93c/25PErT0i3OcZ2ivF43sfEdVi+E9LbaGIOdLP7I3hy2gSIw
	ftCk6pDHTsFSQjJWYHUKpOS6RWQ5b5G9wKOY1wWy9icMqPESugl+ndGMKh5ALChRLPUY0HeheKM
	8UKhXFLcKgp6ePIcru8YoXbT455Gqw8O4QMrfev+qoiklwpLcsCMGZB2wxVEyHSU0iCjjbGeZRk
	fnCghWwwaOI5z3v8DzorhJ/VIkgmN3Mnyzkaw3+gO04q10fEY4/EEVVWJ7B/z8xaj78AkvQNFOy
	VzYJ5C7ZFLaaJgJxF7Yt6DhLKbZJb4wPmhglrOtWuXmddwWYrquLoDsa057uS7P/glr66JUxInZ
	oV+A==
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr75986255e9.7.1794228136213;
        Mon, 09 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr75985755e9.7.1794228135838;
        Mon, 09 Nov 2026 04:42:15 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm247331855e9.14.2026.11.09.04.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:42:14 -0800 (PST)
Date: Mon, 9 Nov 2026 13:42:12 +0100
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
Subject: Re: [PATCH v5 03/29] sched/deadline: Do not admit bandwidth for
 parameters that are kept
Message-ID: <avG_pJmgQr3V-PXZ@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-4-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-4-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> __sched_setscheduler() runs the deadline admission test on a request
> with SCHED_FLAG_KEEP_PARAMS. But the task keeps its parameters: the
> call skips __setscheduler_params().
> 
> Commit f4dddf90d58d ("sched: Skip priority checks with
> SCHED_FLAG_KEEP_PARAMS") made sys_sched_setattr() copy the task's own
> parameters into such a request. Then the priority checks pass.
> get_params() copies them without a lock.
> 
> Another call can change the task's parameters before
> __sched_setscheduler() takes the runqueue lock. The request is then
> stale, and dl_param_changed() takes it for a change. sched_dl_overflow()
> would put the stale bandwidth in place of the task's own in total_bw,
> and in this_bw for a sleeping task. But the task keeps its own dl_bw.
> Its release at the 0-lag time takes that dl_bw, and the difference
> stays behind.
> 
> Fix this by skipping sched_dl_overflow() for SCHED_FLAG_KEEP_PARAMS.
> There is nothing to admit for parameters that are kept.
> 
> Found by reading, after the Sashiko AI review of the first posting of
> this series raised the boosted case of the previous patch. Not
> reproduced: the parameter change must land inside that window.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

The change looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

>  kernel/sched/syscalls.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 0e8b5c7324f6..894f93a80d5d 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -690,8 +690,13 @@ int __sched_setscheduler(struct task_struct *p,
>  	 * of a SCHED_DEADLINE task) we need to check if enough bandwidth
>  	 * is available. Keep this check last. If a later check failed,
>  	 * nothing would give back the bandwidth it reserves.
> +	 *
> +	 * With SCHED_FLAG_KEEP_PARAMS, the task keeps its parameters, so
> +	 * there is nothing to admit. The parameters in attr may also be
> +	 * stale: sys_sched_setattr() read them from the task without a lock.

However I had to wonder what usecase would still make sense for a
KEEP_PARAMS call on a SCHED_DEADLINE task, I would say a !DL params
change (UCLAMP for example) for a (at the moment) DEADLINE task that
might become !DEADLINE in the future? Maybe we could add this to the
comment.

Thanks,
Juri

