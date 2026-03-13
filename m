Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15D344DBE
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 02:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773370782; cv=none; b=RE6khEq6tpzU9xgD6EvT8wXuO0Gu/8NB6WBgACmTAXSi9aKRviKiBhwUcCnD1TClRCj9Gf0f4Vsl5HdX8Pkh0z+aB++n8Zs5t4rIA9+e2+ied34DbIEN9lYYGsIJ5HyYrZWP1p2FfpKE0lDdm8K2XJzGVVRKUfYkJYtXCYYYE/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773370782; c=relaxed/simple;
	bh=Zid73PJbEhallMOTVKoz2UcS8Tcekced9/pwoDxRnx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKY7dkVmYOWYfsdNeqL9X1hDwxhpqDG1s5F3soGj0vXDIONbNPcCli4YDMYGRUoFZ7woEjlhQ2L2vzlqT0MKkJ7Y00mDKfEe1YEl+k3EGRwV5IP9nvk6AUw5PFU+7POkFGTeayFhu5lfzfORn9n/bbZFFOYLmC9V0BAFLS1mQOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cOF4LczW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F0LTXCu9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cOF4LczW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F0LTXCu9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773370778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W07lB+nqOb4v/YFLt4B41Nbfgmo7j1hIVujW5lbRkYs=;
	b=cOF4LczWm2i1yoQbsxUU6PrV15t0abZpSWn401JrHyGhDHFuj8j3J49DDwcJV9FV42+QKi
	6vOhE6rGFPI7WRikpXLyvycHaTPgEJrDei5tQV4VnLRkPU7a9sJO5Z6y/PEEnxWX3HEniM
	/m9aQXE6uPsLjI+JH0Dg7pQJ/Eavmw4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-2hxxHOegM3Ck-ey6ZiZmbw-1; Thu, 12 Mar 2026 22:59:36 -0400
X-MC-Unique: 2hxxHOegM3Ck-ey6ZiZmbw-1
X-Mimecast-MFC-AGG-ID: 2hxxHOegM3Ck-ey6ZiZmbw_1773370776
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a1e725a8fso5095247a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Mar 2026 19:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773370776; x=1773975576; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W07lB+nqOb4v/YFLt4B41Nbfgmo7j1hIVujW5lbRkYs=;
        b=F0LTXCu9G8DZYPUaL25m57KxPfveveS4uVNrNTKiXmVK48UhBhnha+SmiqshcHaWOH
         Kx9ZcX5H/er4qbWwE/f2Ka8lHs/ccY0Um6JHA521JIcVPTwjPP0ply8I8l1/ZS5w8+g0
         XFF5xTlSjFSfkAPDQvNsZEXVwj3EKRiMZT4OW9Y0cEfMFjSmGsJdpODIBhKGcTJIjGBj
         y2rYNSIvDkumj/TXPnvjklnbnZFtB4KJT2V4Ol/FTZ1NUSzKCRnyiz/0Xw7MGwkWEcsF
         ymtzmVzgkEHv0SdXWGg1ZP24PyNPatsExVmC/hZ0RO/LJTX+3a4CSYy5Lazx27npbRSZ
         7Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773370776; x=1773975576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W07lB+nqOb4v/YFLt4B41Nbfgmo7j1hIVujW5lbRkYs=;
        b=Tg0aNVeuO4yexK8TRg/EysGp3+/geRRIN1ug9JDwFDaFKlo39hoYqYnJt2yGPlwNME
         fy7UUZ+hnSW9lRvtZ9QyQJkFw8RQ8nTv2eYca245CyB7sW8dyxCow/MaZycxDzwfFVKx
         FDyIO3hKSGr6DacWQ22R9+HmomAF5GiGmT79ySG6tJVOW1S+FkCEM//sS4Y2aA1CWNPV
         DCpahjH1KYSBEcqNaGo6mQJQoz1KlMNnBg0ioNjkC2W3CqTIW4a3NPads5miytiYkqMJ
         YzboZZkJikiiNdGq5PFecO7yiN+0fK0SvK5lhPjQCRqDFhnNm9mj6m9JhUIcGhlu2LSR
         jR6A==
X-Forwarded-Encrypted: i=1; AJvYcCVCUalPsNmW6RSB2x8Iy0OHSUsUlsHrFqpfZG/Ven6dSTEk0r2SdUdi6YF+49UC0x5mWQcyPCklC5djuG5FksU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3yRS49tzb9Z4CGfbPfBEUnMRU8AoyjPpPjifbCoKLalNrpYC
	qVe05jAgb/eEuXvShvXQyaxmN+bN4fAqy1ILb/o0Dr82Fmib3rHhxQF0Q1WwM5oAOK1jGmJqLFM
	Nki+ieCx5KRQNVFafOuym7h+mu04+d5wRXMk1eqnEx09T+EgnCRGSw96gkzBJTcUTUSuE+A==
X-Gm-Gg: ATEYQzx6cqQlHP1+ZjgtfvPsucfpZlGHSd46jNDxa1y3dQZJLuqqNO3+I1ch+brZe/4
	OWgILmgh3QGFcUObG5ft+mT5cqnmm0v6KqbdLaAMSkl/jPubXwif5kjo1zZkFP78Xks9Xbm4gRs
	0KMLzvz/eyaFZ2WbSiR7uz+qJ1lNZHpATPc7FRdQcbtOOYiCwYcdv8S87WtJ31AkaaARP+8Rwih
	tnn5dZ6tS080dwbTXEw4vmRTH3GnR89BEIRyne/c0Gi0Bng4vMcv90DmzxgSSYm+58IaUBu0AE5
	Uekb1KaNiDN9EPBKY5jUCa1Ki+Yj29N+pfydV5YdqhDLRw3PS1V9HDaP2XCcwkY3m+F4ZupPTSk
	ftLaQ75nwFo9q82PYzg==
X-Received: by 2002:a17:90b:2b44:b0:34c:a29d:992f with SMTP id 98e67ed59e1d1-35a221081ddmr1469637a91.31.1773370775735;
        Thu, 12 Mar 2026 19:59:35 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:34c:a29d:992f with SMTP id 98e67ed59e1d1-35a221081ddmr1469609a91.31.1773370775205;
        Thu, 12 Mar 2026 19:59:35 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f06ff204sm10705641a91.7.2026.03.12.19.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:59:34 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:59:31 +0800
From: Li Wang <liwang@redhat.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Yosry Ahmed <yosryahmed@google.com>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH 2/5] selftests/cgroup: avoid OOM in test_swapin_nozswap
Message-ID: <abN9k5A8rJaA8mkR@redhat.com>
References: <20260311110523.26624-1-liwang@redhat.com>
 <20260311110523.26624-2-liwang@redhat.com>
 <CAJD7tkZn0LupDzCX61oQWbVvVmoMYmsnxBcHZYMjVvB58BqVqA@mail.gmail.com>
 <abI6jydN-XnagHmt@redhat.com>
 <CAKEwX=O69LepTsB1tJO1otDziyE4Oi3PAW=jShiTxQ=Hg7dB-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKEwX=O69LepTsB1tJO1otDziyE4Oi3PAW=jShiTxQ=Hg7dB-Q@mail.gmail.com>

On Thu, Mar 12, 2026 at 10:09:10AM -0700, Nhat Pham wrote:
> On Wed, Mar 11, 2026 at 9:01 PM Li Wang <liwang@redhat.com> wrote:
> >
> > On Wed, Mar 11, 2026 at 11:50:05AM -0700, Yosry Ahmed wrote:
> > > On Wed, Mar 11, 2026 at 4:05 AM Li Wang <liwang@redhat.com> wrote:
> > > >
> > > > test_swapin_nozswap can hit OOM before reaching its assertions on some
> > > > setups. The test currently sets memory.max=8M and then allocates/reads
> > > > 32M with memory.zswap.max=0, which may over-constrain reclaim and kill
> > > > the workload process.
> > > >
> > > > Raise memory.max to 24M so the workload can make forward progress, and
> > > > lower the swap_peak expectation from 24M to 8M to keep the check robust
> > > > across environments.
> > > >
> > > > The test intent is unchanged: verify that swapping happens while zswap
> > > > remains unused when memory.zswap.max=0.
> > > >
> > > > === Error Logs ===
> > > >
> > > >   # ./test_zswap
> > > >   TAP version 13
> > > >   1..7
> > > >   ok 1 test_zswap_usage
> > > >   not ok 2 test_swapin_nozswap
> > > >   ...
> > > >
> > > >   # dmesg
> > > >   [271641.879153] test_zswap invoked oom-killer: gfp_mask=0xcc0(GFP_KERNEL), order=0, oom_score_adj=0
> > > >   [271641.879168] CPU: 1 UID: 0 PID: 177372 Comm: test_zswap Kdump: loaded Not tainted 6.12.0-211.el10.ppc64le #1 VOLUNTARY
> > > >   [271641.879171] Hardware name: IBM,9009-41A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW940.02 (UL940_041) hv:phyp pSeries
> > > >   [271641.879173] Call Trace:
> > > >   [271641.879174] [c00000037540f730] [c00000000127ec44] dump_stack_lvl+0x88/0xc4 (unreliable)
> > > >   [271641.879184] [c00000037540f760] [c0000000005cc594] dump_header+0x5c/0x1e4
> > > >   [271641.879188] [c00000037540f7e0] [c0000000005cb464] oom_kill_process+0x324/0x3b0
> > > >   [271641.879192] [c00000037540f860] [c0000000005cbe48] out_of_memory+0x118/0x420
> > > >   [271641.879196] [c00000037540f8f0] [c00000000070d8ec] mem_cgroup_out_of_memory+0x18c/0x1b0
> > > >   [271641.879200] [c00000037540f990] [c000000000713888] try_charge_memcg+0x598/0x890
> > > >   [271641.879204] [c00000037540fa70] [c000000000713dbc] charge_memcg+0x5c/0x110
> > > >   [271641.879207] [c00000037540faa0] [c0000000007159f8] __mem_cgroup_charge+0x48/0x120
> > > >   [271641.879211] [c00000037540fae0] [c000000000641914] alloc_anon_folio+0x2b4/0x5a0
> > > >   [271641.879215] [c00000037540fb60] [c000000000641d58] do_anonymous_page+0x158/0x6b0
> > > >   [271641.879218] [c00000037540fbd0] [c000000000642f8c] __handle_mm_fault+0x4bc/0x910
> > > >   [271641.879221] [c00000037540fcf0] [c000000000643500] handle_mm_fault+0x120/0x3c0
> > > >   [271641.879224] [c00000037540fd40] [c00000000014bba0] ___do_page_fault+0x1c0/0x980
> > > >   [271641.879228] [c00000037540fdf0] [c00000000014c44c] hash__do_page_fault+0x2c/0xc0
> > > >   [271641.879232] [c00000037540fe20] [c0000000001565d8] do_hash_fault+0x128/0x1d0
> > > >   [271641.879236] [c00000037540fe50] [c000000000008be0] data_access_common_virt+0x210/0x220
> > > >   [271641.879548] Tasks state (memory values in pages):
> > > >   ...
> > > >   [271641.879550] [  pid  ]   uid  tgid total_vm      rss rss_anon rss_file rss_shmem pgtables_bytes swapents oom_score_adj name
> > > >   [271641.879555] [ 177372]     0 177372      571        0        0        0         0    51200       96             0 test_zswap
> > > >   [271641.879562] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=/,mems_allowed=0,oom_memcg=/no_zswap_test,task_memcg=/no_zswap_test,task=test_zswap,pid=177372,uid=0
> > > >   [271641.879578] Memory cgroup out of memory: Killed process 177372 (test_zswap) total-vm:36544kB, anon-rss:0kB, file-rss:0kB, shmem-rss:0kB, UID:0 pgtables:50kB oom_score_adj:0
> > >
> > > Why are we getting an OOM kill when there's a swap device? Is the
> > > device slow / not keeping up with reclaim pace?
> >
> > This is a good question. The OOM is triggered very likely because memcg
> > reclaim can't make forward progress fast enough within the retry budget
> > of try_charge_memcg.
> >
> > Looking at the OOM info, the system has 64K pages, so memory.max=8M gives
> > only 128 pages. At OOM time, RSS is 0 and swapents is only 96. Swap space
> > itself isn't full, the charge path simply gave up trying to reclaim.
> >
> > The core issue, I guess, is that with memory.zswap.max=0, every page
> > reclaimed must go through the real block device. The charge path works
> > like this: a page fault fires, charge_memcg tries to charge 64K to the
> > cgroup, the cgroup is at its limit, so try_charge_memcg attempts direct
> > reclaim to free space. If the swap device can't drain pages fast enough,
> > the reclaim attempts within the retry loop fail to bring usage below
> > memory.max, and the kernel invokes OOM, even though swap space is
> > technically available.
> >
> > Raising memory.max to 24M gives reclaim a much larger pool to work with,
> > so it can absorb I/O latency without exhausting its retry budget.
> 
> Hmmm, perhaps we should change all these constants to multiples of
> base page size of a system?

Yeah, this may better, let me try it in next version.

-- 
Regards,
Li Wang

