Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7621EB5F8
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288088; cv=none; b=EhFLGeGDr3no7O5+joKhNo6j04/NM3J4ncrBSO0hgs8tNLLT4KOm8UTHAvD+RGaAefCtp9VJoSe7UYhQ8GW1bGDZ6VSVwYcLkKHhNwTJhyjI5KJGFqR5COlU6pIm4H8TwFE+ZI5/XHgqA3h5mD5ltHOScum8QpSBhpb9OplL878=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288088; c=relaxed/simple;
	bh=3dnL8OP1sS3JUUBh6YtjwfJPKK6poajEmzTKb2h768k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biwUz/zNNTmweL3iwmzNWFuLj8mxkcvZiZmVaDQspBL37+EHVePz7/zwrme2lhNV1jFU4AQ6L+7w1wxbGso3n/LFr7OJPSK6hljJteHxS5hMgdgAN1fZvqO6TnXrILyKqfN37fKPEkF85wdykLENphUQvOzd9JYyGd6To/By/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9Lj9wXF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpN8KdNi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9Lj9wXF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpN8KdNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773288085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3F/TPouEKOtKEG/BcHdx1b7FzxI3fZ8Dplaod3ZcPp8=;
	b=K9Lj9wXF2Bq7hFh7b+2i9v4ebjyfywumudAm4E3rv/3f5nHwBXyaoL+1714jFJvRgkBZGY
	Pb7b9+4MhQoUjz5yKiANWgm7vO3MrulI2lS/q7issZbjq/PwsIIg9Mi8MkPQilHUrWbMhL
	xuIB/QOUSqY+k+I7Fn/NXc9A5QA1gjY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-PrUDembLNCOThA-GRb0gfg-1; Thu, 12 Mar 2026 00:01:24 -0400
X-MC-Unique: PrUDembLNCOThA-GRb0gfg-1
X-Mimecast-MFC-AGG-ID: PrUDembLNCOThA-GRb0gfg_1773288083
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359fdf17147so340401a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 21:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773288083; x=1773892883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3F/TPouEKOtKEG/BcHdx1b7FzxI3fZ8Dplaod3ZcPp8=;
        b=NpN8KdNi/k4r0h686LLSG1fgTnjETTpB7wLGBe9uAb6Vv8EzYYCL+YU89qpkqu/p2r
         LqA/trlVRzjTxrdg24DCQDPCicCleOO9G9Y3GLstwc4bTe1lu4TE29103lTsVkD+yJks
         rRgKHvaepG87OnZpgXn6Ube9X0IWoto6Q1BSP4RKm9/JwFzX/U181BSkE5IT3YrV6/XF
         ABISA5j62tFABi30VKirV67kBGKj7AY99E9c7fqG839jXByaFx/g1BDrLs0csyK4pn4/
         KiARHjM/BYNAOEfgMG1MaGyD+UTH2YSCyybZg/fUTm1e73ZRIHhvhv5cX29dkArNQXwF
         hWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773288083; x=1773892883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3F/TPouEKOtKEG/BcHdx1b7FzxI3fZ8Dplaod3ZcPp8=;
        b=Tz5G50YLczSCC47Q/OsHjbYWvDV8wbkSiCmoRsRe88r/oFhQuNg/vs/nxzyfg9fCnz
         VZJkXy3TXLCoTA9qLm0T5ozQiy3mj0BiEYkvb9JNUvTJrZlfJ1iaByn5BKXI8wENpM//
         vmk0XCbie9eXIa9BJyNlsQjUtkMkdYW7uMtqwDQyEd2GpO3o0cFnyPRdjPFqtpj98CyG
         0huqmx5qLf2dbDVV4AzHyq95a/qmEBlwOd2DTTZ2a+3ehCcvqX5lt/FZ0hjVrsGNeQaC
         ph8GtQTcGXeJR9JAZ8nSK8d2OjRBhXgjM3ALq+Kr1y2CzvZFRWqwi6VzN3VvTj5BR4pq
         c0dA==
X-Gm-Message-State: AOJu0YzR3pgJLT1jxEwTtoq8+TQpl0PsdHk2PasvCEHd+QsSGMHStYVv
	2YtNCv6uRb5TeFkHOa18hFcDsgngU61vZuOZf8/WfqvbdNl71nSMvu657SludD6uUbcoIn444f+
	vrZLtkMtXsveEkMgDg6S2tgIpjIJLLO/oM7/yFaxLJZ9w80SEJg0E2jgr060rW9mpILNK+tegZl
	WD+Q==
X-Gm-Gg: ATEYQzydkOM2kBqwZJYRhM3Z6zQtVqSKylHDSB+5ajqUfz1i+ff9LEDeSx9hZSPB/rE
	aKRiBb1tvesayRfQubaF3FmRPmCcg54ZAwfGTilpR2z+ykcgShlFNGWwEeduwF4RQup+8qBBHUS
	zlCPKHzyu0NxPsSk8Rvoe0RWfpVuayFb+sWzCgDtJPn55weAMzMmb+imIP1gh2Q8tLA//St7FCA
	hEh3UTHqprlvtzi1NbBQDuQut6GCzD/YxHZoBKj3uuDVK/ikrEmBYFE0Z4xjrJJYWXS+2gSeDeC
	byRXLpkwr7TRA/5Rz/8i6PBSOgmegOIZA0qR7/nalSI9Q6AXPR3nEuQjnjEG4tREZODXaZNH5hO
	KYvoKWrrkCwJkvwuMpw==
X-Received: by 2002:a17:90b:4a8d:b0:359:8256:19f9 with SMTP id 98e67ed59e1d1-35a012dd184mr4558806a91.15.1773288082729;
        Wed, 11 Mar 2026 21:01:22 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8d:b0:359:8256:19f9 with SMTP id 98e67ed59e1d1-35a012dd184mr4558769a91.15.1773288082296;
        Wed, 11 Mar 2026 21:01:22 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee4a7sm7779151a91.4.2026.03.11.21.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:01:21 -0700 (PDT)
Date: Thu, 12 Mar 2026 12:01:19 +0800
From: Li Wang <liwang@redhat.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 2/5] selftests/cgroup: avoid OOM in test_swapin_nozswap
Message-ID: <abI6jydN-XnagHmt@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <20260311110523.26624-2-liwang@redhat.com>
 <CAJD7tkZn0LupDzCX61oQWbVvVmoMYmsnxBcHZYMjVvB58BqVqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJD7tkZn0LupDzCX61oQWbVvVmoMYmsnxBcHZYMjVvB58BqVqA@mail.gmail.com>

On Wed, Mar 11, 2026 at 11:50:05AM -0700, Yosry Ahmed wrote:
> On Wed, Mar 11, 2026 at 4:05 AM Li Wang <liwang@redhat.com> wrote:
> >
> > test_swapin_nozswap can hit OOM before reaching its assertions on some
> > setups. The test currently sets memory.max=8M and then allocates/reads
> > 32M with memory.zswap.max=0, which may over-constrain reclaim and kill
> > the workload process.
> >
> > Raise memory.max to 24M so the workload can make forward progress, and
> > lower the swap_peak expectation from 24M to 8M to keep the check robust
> > across environments.
> >
> > The test intent is unchanged: verify that swapping happens while zswap
> > remains unused when memory.zswap.max=0.
> >
> > === Error Logs ===
> >
> >   # ./test_zswap
> >   TAP version 13
> >   1..7
> >   ok 1 test_zswap_usage
> >   not ok 2 test_swapin_nozswap
> >   ...
> >
> >   # dmesg
> >   [271641.879153] test_zswap invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
> >   [271641.879168] CPU: 1 UID: 0 PID: 177372 Comm: test_zswap Kdump: loaded Not tainted 6.12.0-211.el10.ppc64le #1 VOLUNTARY
> >   [271641.879171] Hardware name: IBM,9009-41A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW940.02 (UL940_041) hv:phyp pSeries
> >   [271641.879173] Call Trace:
> >   [271641.879174] [c00000037540f730] [c00000000127ec44] dump_stack_lvl+0x88/0xc4 (unreliable)
> >   [271641.879184] [c00000037540f760] [c0000000005cc594] dump_header+0x5c/0x1e4
> >   [271641.879188] [c00000037540f7e0] [c0000000005cb464] oom_kill_process+0x324/0x3b0
> >   [271641.879192] [c00000037540f860] [c0000000005cbe48] out_of_memory+0x118/0x420
> >   [271641.879196] [c00000037540f8f0] [c00000000070d8ec] mem_cgroup_out_of_memory+0x18c/0x1b0
> >   [271641.879200] [c00000037540f990] [c000000000713888] try_charge_memcg+0x598/0x890
> >   [271641.879204] [c00000037540fa70] [c000000000713dbc] charge_memcg+0x5c/0x110
> >   [271641.879207] [c00000037540faa0] [c0000000007159f8] __mem_cgroup_charge+0x48/0x120
> >   [271641.879211] [c00000037540fae0] [c000000000641914] alloc_anon_folio+0x2b4/0x5a0
> >   [271641.879215] [c00000037540fb60] [c000000000641d58] do_anonymous_page+0x158/0x6b0
> >   [271641.879218] [c00000037540fbd0] [c000000000642f8c] __handle_mm_fault+0x4bc/0x910
> >   [271641.879221] [c00000037540fcf0] [c000000000643500] handle_mm_fault+0x120/0x3c0
> >   [271641.879224] [c00000037540fd40] [c00000000014bba0] ___do_page_fault+0x1c0/0x980
> >   [271641.879228] [c00000037540fdf0] [c00000000014c44c] hash__do_page_fault+0x2c/0xc0
> >   [271641.879232] [c00000037540fe20] [c0000000001565d8] do_hash_fault+0x128/0x1d0
> >   [271641.879236] [c00000037540fe50] [c000000000008be0] data_access_common_virt+0x210/0x220
> >   [271641.879548] Tasks state (memory values in pages):
> >   ...
> >   [271641.879550] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rss_shmem pgtables_bytes swapents oom_score_adj name
> >   [271641.879555] [ 177372]     0 177372      571        0        0        0         0    51200       96             0 test_zswap
> >   [271641.879562] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/no_zswap_test,task_memcg=/no_zswap_test,task=test_zswap,pid=177372,uid=0
> >   [271641.879578] Memory cgroup out of memory: Killed process 177372 (test_zswap) total-vm:36544kB, anon-rss:0kB, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:50kB oom_score_adj:0
> 
> Why are we getting an OOM kill when there's a swap device? Is the
> device slow / not keeping up with reclaim pace?

This is a good question. The OOM is triggered very likely because memcg
reclaim can't make forward progress fast enough within the retry budget
of try_charge_memcg.

Looking at the OOM info, the system has 64K pages, so memory.max=8M gives
only 128 pages. At OOM time, RSS is 0 and swapents is only 96. Swap space
itself isn't full, the charge path simply gave up trying to reclaim.

The core issue, I guess, is that with memory.zswap.max=0, every page
reclaimed must go through the real block device. The charge path works
like this: a page fault fires, charge_memcg tries to charge 64K to the
cgroup, the cgroup is at its limit, so try_charge_memcg attempts direct
reclaim to free space. If the swap device can't drain pages fast enough,
the reclaim attempts within the retry loop fail to bring usage below
memory.max, and the kernel invokes OOM, even though swap space is
technically available.

Raising memory.max to 24M gives reclaim a much larger pool to work with,
so it can absorb I/O latency without exhausting its retry budget.

-- 
Regards,
Li Wang

