Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876014;
	b=Lr/THIm7A1Wbb/OsxdrfO9wQ6W1UAWraYe1TrzwxpH4zr9foya0AmrqbyYzFpG8jWxsK
	 KOe90HOt1WeNWPZWGrOoIO1xZQ8EdSS0KbYrrQRHTFW+ga4fs3rFay3VXR6er8Ql1ZWr5
	 Ioz9xb3Pzqk+sS4jekxo28JSoDkNXKRFSN2/wJECDEKGI4+imAAZ51w8Mcj2IFi1jpILW
	 hHDjc7hw39oDSapUfvWWwzAaIey4uhjPOvfmRzo8KaBwYIpeOmnkAQS95vtOQRJNcJaFK
	 5NNvfw4Q3D7KZLZEV0L6L78aPNDBFR3WqXkLJX8COHXEllwb/8uccGbs64/dx54ZnMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876014;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oydf0WShTzs9KXsUGEwBFf3FiP0jpqy13hriGlAhxmA=;
	b=L3GdGnwa889jg+/a0hpc8hW1Z7LRNTLUqvIy9+DWn8El8IHzUmThyi1aTQR80M4SbrK+
	 50A4M5C6qjMSTvKcYvxe4MVgdfR9NttWSTPhx68hfndNcIEPoA/EHHwiyLzz5MmjIuKhH
	 6OfaisRvdHn1CWCiLuU4H31zBudOnRpg8op9fLAbqDA1gg33HQzPENAx/bIaFRKQAbKtg
	 nhlDLUEjjOv1/j7iEkhiW9R1Qovu604GmqvAxkZ8WKZTPvBdniLsS5HFoirumw8m1bJQ4
	 DwYiG/Pk+L1cWg4tOyNzfgBvpoVOhmXPQzkaNzz3XuCzgJH+VZprmRllLcN/8Z3M9xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="L/5Ix1nm";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S1OsPTBy;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5190A606A338
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 10:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5190A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L/5Ix1nm;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=S1OsPTBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793876013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oydf0WShTzs9KXsUGEwBFf3FiP0jpqy13hriGlAhxmA=;
	b=L/5Ix1nmmbPPC4D0gWalKYKBB++M25taHWzvVQMmgRQUKS5mKjroctpU4ZYSV3laq6iYS8
	JX0Nglx5LcHZxKdOD7mmlKXO5hG5/yp1yveiRtozh56XCtLHdys4Tj8UjN4yL46YKq2SQO
	q/3/CfSKosKliRJ6r7pi+PWDBJiRZXY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-mAPlVUNPN_etC4PLEkOYgQ-1; Thu, 05 Nov 2026 05:53:32 -0500
X-MC-Unique: mAPlVUNPN_etC4PLEkOYgQ-1
X-Mimecast-MFC-AGG-ID: mAPlVUNPN_etC4PLEkOYgQ_1793876011
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a318cd95e8so5774415e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793876011; x=1794480811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oydf0WShTzs9KXsUGEwBFf3FiP0jpqy13hriGlAhxmA=;
        b=S1OsPTByJTbRLrKHdMGTdTmTlpv9n+/9C54Tti7YoqWpSY6U/A9+hOVHvrdv2P/uwb
         p9F0s0+MYbFvlJQSL2wQOxpFJUVVVKM13exzubPT78i39t06KOquNikeEsAXS1UD593T
         +paZu1YCbLV8CF1nebrRbge/+rr3C5mIgfi0tY3heJw+CwRVOJtzJgPE8pd/WOPh69hB
         CJoruC7tgIDkEn2lPnYlqpxesu3wpwe5tJ0fPr/h9O//XMBE/ulrAXFZjLu+eyWZuzGv
         22tmBu/yvfYNUtOuDtKPEqLeDxZZPahDofkpnjyeL9SDGzthr+jkavHsyeDlAggO4z+B
         MbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876011; x=1794480811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oydf0WShTzs9KXsUGEwBFf3FiP0jpqy13hriGlAhxmA=;
        b=L69JnA8LlLn9DuYBFZxirYv2Spq3ShtQruJmg4d806uK6onqySEYgGX/teH4W3NJen
         3P0yUpVW0K5Th+b6WwAZtbRwmN6dN8wN/CScZHFuh3priXwMa365W1IIIBTfhIUcEVZ+
         fc31wwGafKHQ1SpQBmyVvmdP9KPvyJHTW+3vUSXbjtyurqCeiIEAfHu+iGCEzIdAeaSI
         lF1z0xo0yqQ0TaS1mmHU893FClzhQi3sTqHKpUqxfdTNOJv9iZe53QYQpkjFeyNqbBXV
         0KIzJBniXn5g0YX6vrE48Dxi+au4ijXG4sjwm99sz9gX4Fk+XGS1nmLFj/lweqf5Fdk0
         CoFg==
X-Forwarded-Encrypted: i=1; AKwUvBxNS+ht8hx/y8/bN+M6elLUuy91/LXd9o7bJ5aHOPQj8m77/n3iiPETp6FTpJXEdjAbJMGHAGzJtcF8nMLIFuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xtjc1NWXegYZ+qONFTd0gM0sm1zrNuwczN94YRayB8JWWgJhF
	O7NHyGrjxkCvLt9m2xQXcn894O6YenJ3geROMDDJ7bDaknmDmdYMyM0J8O4TDZN3qOGVi7h7SPH
	w3VzSj4+2Nxp/JinHhDwMiG+XJG1/W3QNA1mjlrRo+kD+HfnUL787z8TRj9BIe9CikDTJuQ==
X-Gm-Gg: AYBFou0E45VIxdySg1efx9MxFh88l3QJT4b2zvTRmjaVqPHDDgEKNTouM43SMB207xB
	oKebSufPVvuSiQ/tjfqI2w4U7YJSOHdxdjUPGqxKiC42JLrZb2C5Wg0lCZ3jFoRdxdOR6o+pvGw
	eTSdvAG2n/1mLeJwddPLSQBteIio5sCFw8/hhqH+8ePREBFCgXbLFzJRoNnvoSXxP40hFoCbrj5
	aXAluf6dVy6EoGPqxL+uAkozsvBAuxn32ykfpMBIij4Ipa8WfwGWLwl8QZ7aB/uGVKflQlbAWXn
	+LslD631c3RCTxlD71vMIgV54j+3T5HJnDB0CEEINq6jeGp3Lpoi6MHJQqAej+qrP6/jPLuWmVH
	1eZtYF5/36dlZ9oD/HPJYkOuOnbV1vZ08y/PNG52IZYZZC2V8/Vr5XAkQwc2/zrpPIlMe4YMac8
	r+1g==
X-Received: by 2002:a05:600c:1989:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4b55dbb09dfmr39301535e9.13.1793876002248;
        Thu, 05 Nov 2026 02:53:22 -0800 (PST)
X-Received: by 2002:a05:600c:1989:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4b55dbb09dfmr39281275e9.13.1793875986470;
        Thu, 05 Nov 2026 02:53:06 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56eb4da1esm94641375e9.6.2026.11.05.02.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:53:05 -0800 (PST)
Date: Thu, 5 Nov 2026 11:53:02 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 04/21] sched/deadline: Do not divide by zero active
 CPUs of a root domain
Message-ID: <auxgDv4hE-MLnM4b@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-5-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261104211207.1392343-5-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> __dl_sub() and __dl_add() spread a change of a root domain's total_bw
> over the extra_bw of its active CPUs, dividing it by their number, which
> their callers take from dl_bw_cpus(). That number is 0 for a root domain
> whose CPUs all went offline, such as the default root domain, which
> holds the offline CPUs: the division then traps.
> 
> A debugfs write of a fair server's runtime or period reaches it while
> its CPU goes offline or comes online. From the rebuild of the root
> domains in sched_cpu_deactivate() until the CPU is offline, and from the
> CPU online until sched_cpu_activate(), the CPU sits in the default root
> domain, with no active CPU. A write that leaves the server's bandwidth
> as it is passes admission there, __dl_overflow() comparing that root
> domain's capacity, 0, with total_bw less the old bandwidth plus the new,
> 0 as well, and dl_server_apply_params() divides. Any other value is
> refused with EBUSY, higher directly, lower through the unsigned
> subtraction. Once the CPU is offline the write is refused, since
> commit 4043f5498416 ("sched/deadline: Reject debugfs dl_server writes
> for offline CPUs").
> 
> Writing a fair server's own runtime back in a loop while its CPU goes
> offline and online oopses on the first round, in 8-CPU VMs of v7.4-rc1
> with the four deadline fixes of sched/urgent:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   CPU: 6 UID: 0 PID: 110 Comm: dl_server_div0
>   RIP: 0010:dl_server_apply_params+0x335/0x380
>   Call Trace:
>    <TASK>
>    sched_server_write_common.isra.0+0x1c0/0x260
>    full_proxy_write+0x58/0x90
>    vfs_write+0xcb/0x550
>    ksys_write+0x6c/0xe0
>    do_syscall_64+0x109/0x5d0
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> inactive_task_timer() can reach it too, found by reading: it releases
> the bandwidth of a task that left SCHED_DEADLINE, or died, before its
> 0-lag time from the root domain of the CPU the task is on, and that CPU
> may go offline before the timer fires. With admission control off, so
> may sched_setattr() to SCHED_DEADLINE of a task asleep on an offline
> CPU.
> 
> With no active CPU there is no extra_bw to update: change total_bw
> alone. 20 rounds of the reproducer leave no warning then.
> 
> Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/deadline.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 963fda6ddb7f..dadda1a528ec 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -189,18 +189,25 @@ void __dl_update(struct dl_bw *dl_b, s64 bw)
>  	}
>  }
>  
> +/*
> + * @cpus is the number of active CPUs of the root domain, whose extra_bw
> + * shares the change: none once they all went offline, and total_bw alone
> + * changes then.
> + */
>  static inline
>  void __dl_sub(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
>  {
>  	dl_b->total_bw -= tsk_bw;
> -	__dl_update(dl_b, (s32)tsk_bw / cpus);
> +	if (cpus)
> +		__dl_update(dl_b, (s32)tsk_bw / cpus);
>  }
>  
>  static inline
>  void __dl_add(struct dl_bw *dl_b, u64 tsk_bw, int cpus)
>  {
>  	dl_b->total_bw += tsk_bw;
> -	__dl_update(dl_b, -((s32)tsk_bw / cpus));
> +	if (cpus)
> +		__dl_update(dl_b, -((s32)tsk_bw / cpus));
>  }

I wonder if it makes sense to add/sub from total_bw when cpus == 0.

Wouldn't be better, if possible, to avoid calls with 0 cpus?

Thanks,
Juri

