Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000850;
	b=M49F5/UHqncj1uWlKlbrmgI0rLbpY0BQ0PKHEjdrugKA+D5v74aXqkG7O/zrWnd0kOfE
	 l9UFPshYdict+e7dLir2NWPCUESfdHw+Jd6m94l0Y4q3zCNhB/6tfpL5rxPxGMomPl7Uc
	 Nku23lOi9W8J+6PYT4KywnSQ3eE3gctfFLmGIXh+lpCmdcNjlzf8GtfFR68zBxivoH1Ow
	 sQX/4ppDWxEH3kt4q7MKVcKn1i/t5K7Wi2OzghhG+Qc0HC5yr40dNjBrYWWHmMnJFJhWV
	 MOVIxy9TRed7EW2c5R01hxQIfoL/P8kJrGSwZC1j7gGkO0UeYkoZAf1J6jIQZsKlijw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000850;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
	b=msVZwxUBoAZ0BNq8P/ikHcP8Bwx2wV49rTD8Jb2fQW0O+mOi+K6Ffv4nExsqiwipp3Ug
	 8UGQ5R0kQKIyDVQuImrgH/QTJcmqlKtXqDul1hOuvNukpkdUG516t2Fc6mhK6uDyGqRi6
	 oFCi5LAcE5tx8zu50HUPxY6zLR5pyEBDurRq47MHH2PXiuF6aViNlulF2ZbDd/ziruh2a
	 1Jn1TqgQlEGmDjzZEdAMepJX+NoBIyb4qMtxQYzhbRvUSyOnzvZrXv6wou4bkcQYg+93M
	 dYzKGiachnWJNWAYRTBcLzJlDh0x9AAFIZM5OyhZ/yXEDT1Rj0u+11vwJJ9WOpQw4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iORFFgFd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GpL06LLH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58673606A32F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 11:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58673606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iORFFgFd;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=GpL06LLH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795000848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
	b=iORFFgFd322gO9ZgYGy1IvDR74Gf36yEqNGJxd4+VfnSq0mZFQdnH9+yCpx8U86A6I9LPH
	JpHIUxeOoDT7gA1XSbyb7LQOPjXqz0u8A7H94AuXpi5sYcdLE1YWMFt8IGbXONS1johxXg
	eE2ofvemC7h+RRHZ5H5HchRrYgU04No=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-cWL5Qzg-NF6ZkrwMtrADhg-1; Wed, 18 Nov 2026 06:20:47 -0500
X-MC-Unique: cWL5Qzg-NF6ZkrwMtrADhg-1
X-Mimecast-MFC-AGG-ID: cWL5Qzg-NF6ZkrwMtrADhg_1795000846
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so6975015e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 03:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795000846; x=1795605646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
        b=GpL06LLH6he6KY83Kswtjf5NHWlqseEgBMeWpf2WQ9het2uamRVdPeeUrDLQVbR8Ox
         Ihmv8Dm7c5v5zBi5IjZccJR6pEt6C5XIvcsNl13QVzxOELXQqg4jacsBtZYJBI82gSnF
         umpvBG6Js4CqPHi0EOoMyzjVGBEfZ6XkWovAbifhSzhGHTl+17Wv8+v/tHqY/zsZJ2kx
         VZsk2YPsYg+VEb1uqA+vP6I1CbgFYe+ZLa4GUU/o/FO+WGBBllgGRvxjlbmuq2UnWK6f
         klwuHSjRZY9jP/SIH2Q7ejD96q1Kv/pVsiZoDEhIrEVyaPJKv5jXtojriGafP4FU/TSI
         BMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000846; x=1795605646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYZeLko8ARh+TMZJ/jcaVMaBZpqH4WAJB7a5zPUzakg=;
        b=F9UsS8tky5UBdTgItqocJNW6xTuWQZy1QTfDfp8OpHCA502qrSpbmZ0S7cc/SksFWM
         0qAmQcRQaEEaTQYVkl7TVmRMI2h4NBJJZi1Tc0AbDWNWdk5l7M4HDsIRyfcaWapaGYKN
         Yt1aMLmrayYtqpY8cMZyW45Dxa50yMxqbhbUUqlQ2uWhSh0XRk0Li5nI/LsCfTq+EZr9
         Ggq0GLeVnr/3V8byc8G6cKJBMdTs1p9Jf/yL6NErq1djjg7p9xWfBEKgqHqqt95+4Jra
         LKpYRTnsgAqz9Y9Ucj10nAfYVGawcH6T58im5VSCDJKkwdnZN2s4m+EhBOP3S9ZUTxzB
         abtA==
X-Forwarded-Encrypted: i=1; AL+hErH5VmiJt0X1yjzuYw6gOjnJ0meEa/mQdRFfz52lG/4+rvXfYb4MfksBkdptmAoRoJEizdvrEHWvqv/dHooGp9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jKewo4adM5a5gj80mw3ReuybJTWSxeqZjVClL2BfoAWdluuuh
	7gSmwMZy7og14Tpmur6RmgRtI76LdS9Jw6XJipZwvHIRhDSa7Z3Y5d1p+cQzBG9j/D14ACBB/0G
	shsSLGRz5ohdAINzY0sJX5grFryEwjbnonkJiUYhIHPH2UsRQEzfuHwYPpLpMQm3AFAKgVA==
X-Gm-Gg: AYBFou3BZAjnxqAmL1oQ8iUsmUXw8zc6dHTstRMt8mwB0MvQb+MmvRKrj+xfrs+tMby
	7VhRJZgmsbLOZHD3vvqj8qcLr9IWi0IddBAFkCBbW7CM9MHRDbr2s2Kl4kPVt6BY9KOVATfqSlf
	73MVTKMfXHNYaO4O5HYKW6K4yfC9Kof01Sl0qCxVUiitN/njQscoYXBrw3v1zOItZnHeFRgX/EH
	agQvxSqvy2+VSXd6WZqNo0no2GxNugniXQNMDj91OynhZxxZIbvVsDq9cFEMAdPJl/HMjGWuL34
	q+FznLbm4k441XZIQ5AXoB1puz8V/ZC3DDLbYV4tpFw9KDnAWlmIsvuJbo5MSiAlYKCYxKCcJvw
	DftbYa8AwnZqSXcTAdYeBiMjbI3/XLkcd45T6lLMjyw576vZ4lgPxTq9p30JAUN008QX0kJvWzq
	Mk+7I=
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr39551995e9.17.1795000845961;
        Wed, 18 Nov 2026 03:20:45 -0800 (PST)
X-Received: by 2002:a05:600c:8b02:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb7da1b48dmr39551335e9.17.1795000845561;
        Wed, 18 Nov 2026 03:20:45 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm195748985e9.8.2026.11.18.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:20:44 -0800 (PST)
Date: Wed, 18 Nov 2026 12:20:41 +0100
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
Subject: Re: [PATCH v7 04/40] sched/deadline: Do not divide by zero active
 CPUs of a root domain
Message-ID: <av2KCeKAnXAi6saN@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <31f723a7dab4d58045cc60fac0fea09ea1841c7b.1794922146.git.mathieu.desnoyers@efficios.com>
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
In-Reply-To: <31f723a7dab4d58045cc60fac0fea09ea1841c7b.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:
> __dl_sub() and __dl_add() divide by their cpus argument. Most callers
> pass dl_bw_cpus(), the number of active CPUs of a root domain. That
> number can be 0, and the division then traps.
> 
> Commit daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl
> tasks") added extra_bw, the bandwidth that deadline tasks can reclaim
> on a runqueue. A change of a root domain's total_bw is spread over the
> extra_bw of its active CPUs.
> 
> During hotplug, a CPU sits in the default root domain, which can then
> have no active CPU. This lasts from the rebuild in
> sched_cpu_deactivate() to the offline, and from the online to
> sched_cpu_activate(). A debugfs write to the runtime or period of its
> fair or ext server divides there. A write of the current value passes
> admission in the window. In 8-CPU VMs of v7.4-rc2, a loop of such writes
> oopses at the first offline and online:
> 
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:dl_server_apply_params+0x335/0x380
>   Call Trace:
>    sched_server_write_common.isra.0+0x1c0/0x260
>    full_proxy_write+0x58/0x90
>    vfs_write+0xcb/0x550
> 
> By reading, two other paths would divide by zero:
> - inactive_task_timer(), for a task that left SCHED_DEADLINE or died,
>   if its CPU went offline.
> - sched_setattr(SCHED_DEADLINE) on a task asleep on an offline CPU,
>   with admission control off.
> 
> Fix this by changing total_bw alone when the root domain has no active
> CPU.
> 
> With this patch, the reproducer survives 20 rounds with no warning.
> 
> Fixes: daec57983670 ("sched/deadline: Reclaim bandwidth not used by dl tasks")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> Cc: stable@vger.kernel.org
> ---

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

