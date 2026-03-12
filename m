Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919631FDA61
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773311438; cv=none; b=XmDn0sW5FrSTPax0ZCPMMpQsBPANhJhkxJGigPrrhyAYnpw/4MKfkjfFXiKhdbXp77B0fOITh32R5EPJ9aglfSia9hkyRfwt6jqWvU5pK5mip+IWvWyugXb3Slb00Ggf59pcYCj7n2BksKlce9T4ajaNrqQQJCsR4cs3UJL157Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773311438; c=relaxed/simple;
	bh=AyXFsmDJUCozY6rSpw74QhgERTg2l2RQ8xHZngKetwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCTr1WsgIwHWnV0hE9q+t5xuCJ7uZW96fkC2nZjnnbYgvEz+dNNvzDcIo0rCYSsko6T/CEpA0+1cRYroYtWgUwFsrTee10ITKU+sJIh5OwgN7NzVkH/cyMlgvQvTmpiQvUjawx3OCrC9LfpvpLAdYr/ncUkmXY6UKVG9T+YdSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+jkiyEM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cvKuWhkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+jkiyEM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvKuWhkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773311435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32DVdFVoSSIS89IzKF6JWHAvaVblS/d3/X9dpjjM4Ns=;
	b=Q+jkiyEMdNkYRtBsWIe/9Io+6XmQ3rxer/CGD6AENMKH1dCMgaZw9N9KpjEzZEd9GWus6M
	8yd9nn5zIik2KgCIUlwxQMFOrtIw0l/dYCVOwk1kvbku4dyTVhc8VpQpwPrUALOgyD1rWy
	TiHlMgW44TS72kTdtje6U2ikOpFh2c8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-qf9YKP-hMsiDOIX8X_2Wpw-1; Thu, 12 Mar 2026 06:30:32 -0400
X-MC-Unique: qf9YKP-hMsiDOIX8X_2Wpw-1
X-Mimecast-MFC-AGG-ID: qf9YKP-hMsiDOIX8X_2Wpw_1773311431
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c73783c96baso383790a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 03:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773311431; x=1773916231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32DVdFVoSSIS89IzKF6JWHAvaVblS/d3/X9dpjjM4Ns=;
        b=cvKuWhkOsTWpzeiqlagaEUreIEQkYa+jwBJMa2WJpZGfBVv01hskjXWDguqAYwn6bn
         qakNBqBDo/HiugWDso3YvrZiPObq2w4Fm0Mn8C0PgV4jZNcjkyPwLtOPbakZjvX/L0hH
         zgX7b4e+dLsf368qIkCz/T2f9gciZkvEJvN8ehJptdUxLaqmTW51Jaz119T4oQmWhihH
         x+Ncgsb/dhKBbbQxQ/729FYJW8O/j3JiKxVrgJ1AlQUxeHVDbKX3B0uo25a7xt/DZYJ1
         xl4n1t93LvV5hT4ffqWKLVGAIfsXdAHp4SVStkGd2sVNya9yx3ddLsGjN135jVZwWmr8
         9nvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773311431; x=1773916231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32DVdFVoSSIS89IzKF6JWHAvaVblS/d3/X9dpjjM4Ns=;
        b=B/qEvuCF+b1fRjd+VOIrosUEW+hIxXQQu4EPReyhRDgIJYsXxKv/B24CgZk43pXjaQ
         qgcQyH4j1ffLfg26ouJ59q2TZheWO4WP9SaktoC6UtIZGdeWnlsBbSu4GVMkd8nldqLR
         nP8UGvPBzjypxpNe8aeGGzq+BfXe2CnARmQfniUm1EgAlzGhBLRe0zR9AI+EE+8aQlGd
         3ljutk1Np1jX+SWZbPLTJ+FsvW2bk+u4qtvQPA+wIS4WoaJAW2tiRu1n/nva5TwPiKtT
         m0GztplXxlqZnJ2LpoPtg9Lb/3E0KkyQPrVMiTCWeMH2RknyoLpTagInzUKt75qWwtgH
         7YtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRZk3Zb436/l36aC9fMvMyo/1neNhasOalpIRg5BWvi1uQX9XNUh4TMOp9bujjs1IO+qy4jMz31rf8nqpxHJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3aCbL+yFZl8izYMXsddu9RWftHeJjc9I2WNvZQ/5WUNFw3DX
	0aeF1ExQR0HaJwp4Zkw1i+pkiwTpd8/HKcQDgqNWOIatSwfPtcNWaLzmbagtzxi/HxVxcYMDyxY
	7cVr8Z2pKTmXWqvQn/YQF9Y16faVsB+OThwpap6/nfKJ8nwLXdoVqSFVHHdVfbLudgmpPKw==
X-Gm-Gg: ATEYQzzs7h0pWa0Xs3MGVEU91uv0wJh9JwU5KgY8T/sLfJGqs8nwzGi55/pj44lOj8o
	oU00QWbm3qkngyYG4xqhN09YkMqx7vwKwU5nhkMXp5vA/ThyXfrqb8TvQTISgMrHK9+CGrewtD5
	By3VoRcF7wthBowzJCsMr6bGDzMjC7qdwmSZIURdkh4TBrZSCsu4g69a5syonjwbnPJt0Prel5F
	y2/p0mgpGijL1ryb9Fx25t+RD0PbLuC8/FM9o3jgHc4eo4A9G/uYOqmr094Ge4qyKOqBlt56WRX
	pJ6oi63Gzw9VzD3Gt8OW67MalmC+wXmMD/PoT6WgVcz0wt6qv1K98vz7wNBklJSlIWU9NRE3QDk
	n+M9hWIjrtn9cbCNBQg==
X-Received: by 2002:a05:6a21:7103:b0:398:c0ba:9cee with SMTP id adf61e73a8af0-398c5e6c8d1mr5178037637.8.1773311429548;
        Thu, 12 Mar 2026 03:30:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7103:b0:398:c0ba:9cee with SMTP id adf61e73a8af0-398c5e6c8d1mr5177736637.8.1773311424350;
        Thu, 12 Mar 2026 03:30:24 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf9303csm5128727a12.18.2026.03.12.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:30:23 -0700 (PDT)
Date: Thu, 12 Mar 2026 18:30:21 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>, Lucas Liu <hongzliu@redhat.com>
Cc: cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Li Wang <liwan@redhat.com>
Subject: Re: [ISSUE] cgroup: test_percpu_basic fails on PREEMPT_RT due to
 lazy percpu stat flushing
Message-ID: <abKVvQc7NPAnoWq8@redhat.com>
References: <CAEnjF8FxM2CGgGC0R42R7R4=udHMtkwV9bCVcw7NDq7KTZMLkg@mail.gmail.com>
 <4238fec3-1a37-4924-b13e-a42d2454412c@redhat.com>
 <abKS4Qt72UP8rYS_@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abKS4Qt72UP8rYS_@redhat.com>

On Thu, Mar 12, 2026 at 06:18:09PM +0800, Li Wang wrote:
> Waiman Long wrote:
> 
> > On 3/11/26 4:49 AM, Lucas Liu wrote:
> > > Hi recently I met this issue
> > >   ./test_kmem
> > > ok 1 test_kmem_basic
> > > ok 2 test_kmem_memcg_deletion
> > > ok 3 test_kmem_proc_kpagecgroup
> > > ok 4 test_kmem_kernel_stacks
> > > ok 5 test_kmem_dead_cgroups
> > > memory.current 24514560
> > > percpu 15280000
> > > not ok 6 test_percpu_basic
> > > 
> > > In this test the memory.current 24514560, percpu 15280000, Diff ~9.2MB.
> > > 
> > > #define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())
> > > 
> > > in this part (8cpus) MAX_VMSTAT_ERROR is 4M memory. On the RT kernel,
> > > the labs(current - percpu) is 9.2M, that is the root cause for this
> > > failure. I am not sure what value is suitable for this case(2M per cpu
> > > maybe?)
> > 
> > Li Wang had posted patches to address some of the problems in this test.
> > 
> > https://lore.kernel.org/lkml/20260306071843.149147-2-liwang@redhat.com/
> > 
> > It could be the case that lazy percpu stat flushing can also be a factor
> > here. In this case, we may need to reread the stat counters again several
> > time with some delay to solve this problem.
> 
> When memory.stat is read, the kernel calls mem_cgroup_flush_stats(), which
> invokes cgroup_rstat_flush() to drain per-cpu counters before returning
> results. So in the normal read path, stats are flushed, they aren't
> arbitrarily stale at the point this test reads them.
> 
> The "lazy" aspect, my understand, is that background flushing maybe skipped
> sometime, as there is an situation: __mem_cgroup_flush_stats() skips the
> flush if the total pending update is below a threshold, i.e.
> 
>   575  static bool memcg_vmstats_needs_flush(struct memcg_vmstats *vmstats)
>   576  {
>   577          return atomic64_read(&vmstats->stats_updates) >
>   578                  MEMCG_CHARGE_BATCH * num_online_cpus();
>   579  }
> 
> So the "lazy" could happen on a machine with too many CPUs, that threshold
> can be non-trivial and could contribute a few MB of discrepancy.
> 
> But my failure observed on a 3CPUs box, it shouldn't go with "lazy" skip.
> 
>  # ./test_kmem
>  TAP version 13
>  1..6
>  ok 1 test_kmem_basic
>  ok 2 test_kmem_memcg_deletion
>  ok 3 test_kmem_proc_kpagecgroup
>  ok 4 test_kmem_kernel_stacks
>  ok 5 test_kmem_dead_cgroups
>  memory.current 11530240
>  percpu 8440000
>  not ok 6 test_percpu_basic
>  # Totals: pass:5 fail:1 xfail:0 xpass:0 skip:0 error:0
>  
>  # uname -r
>  6.12.0-211.el10.aarch64
>  
>  # getconf PAGE_SIZE
>  4096
>  
>  # lscpu
>  Architecture:                aarch64
>    CPU op-mode(s):            32-bit, 64-bit
>    Byte Order:                Little Endian
>  CPU(s):                      3
>    On-line CPU(s) list:       0-2
>  ...
> 
> Even on Lucas's test system, (8cpus), I assume the pagesize is 4k, the
> threashold is 2M is still less than the failed result:
>   64 × 8 = 512 pages = 512 × 4096 = 2 MB
> 
> Bose on the above two testing, the lazy produce deviation is not
> like the root cause.

BTW, if the lazy flush does become a problem on large-CPU machines
in real test, we can add a retry loop (like Waiman suggested) in a
seperate patch. But I'd prefer to keep this one focused on the
missing slab accounting first.

-- 
Regards,
Li Wang

