Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1BD3D890D
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691539; cv=none; b=S0BeITo67Jvn2stcp7Lj6xY42NQ3QXOXXKsCVzVk1wsExKr5YQFBFiOJ6ZeV1uKmeLTIOcX0y63H1qiXeeDBCZeiClFoxFEvsMV72cjHWBoUJyene4xq1XnKIGUEjI5uPxXhOW8rEvXaC5l1/envG9x+mhPL5SzMmT9Tc4U745g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691539; c=relaxed/simple;
	bh=9fNdKR8XEjzzSExf6v/OnIkyzVCVXUCBZgfJ0b6HJog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrnCp26G1v9kazv3UEkWR51jddGhJ/UbuppwmKV8xwoHPaMeowFyyXC++zxZKCpQ1ORp0TanIyFUG6b/6+PgFww0FDALZ7g5AYcG2PLTR3nmKN+9NGpgf2gQfUSrFkdi5Kzv+GmJ0rZW2R0kyT+NEeLmYjY6UVOWysXt/RiTcp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fWeUmXir; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jbl1CHwK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fWeUmXir";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jbl1CHwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787691536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B5Bz6gO+Bvo75SwX7Av3lT6AmsBGemBy+OoHD+/7QDw=;
	b=fWeUmXirJ8cB2Osr2r5Tgcba7An5Yy0Uia7neCUN7w8EZGnqbkpOucc8nXOpsaIzR8nm77
	PpT2EsAQ1Fl0MwknhpG3SeWDX+hjnyxNh43KpIOAcpyF8fvt8C973yWKEGMbHTXOPEW6UJ
	TIFqrWWFZoFLRhc5kqikaCh5gk8sahE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-0q_mLoG6PIGkTWyAJ1xceA-1; Tue, 25 Aug 2026 16:58:55 -0400
X-MC-Unique: 0q_mLoG6PIGkTWyAJ1xceA-1
X-Mimecast-MFC-AGG-ID: 0q_mLoG6PIGkTWyAJ1xceA_1787691534
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f4fso2621136d6.0
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787691534; x=1788296334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B5Bz6gO+Bvo75SwX7Av3lT6AmsBGemBy+OoHD+/7QDw=;
        b=Jbl1CHwKlG4mXH2PhFBXKTNBMVOLBTFHs/2MX43QHf1Yj1xGra31W7LENY+sBT5en1
         zJkFfezrA0VqQbahL35YeZorokBTjxxN1BBtASXDbZVSyEQwNgE3JWQPONmenuX2Ukce
         APpBQypI+FEhdOlYDsD/QKUJjkjWjQEfDbGLMMy1+cWr9oFrufNLBlu/PWkBWRLo7/x7
         FW7e57roYN2mLat7D1xcPRF2iSqiQUAul60ShFvmxwFY6hCCiH8zEqQpqPno4mZngFk0
         xmpcAldN6EXGCBSx3XWyZpF9AL54HplGt/V3Zchhe4MOPklabtz8uRBmiZVMGTdeZiTP
         zbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691534; x=1788296334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5Bz6gO+Bvo75SwX7Av3lT6AmsBGemBy+OoHD+/7QDw=;
        b=j45cn1EHViLXuL6rikR07vkO/EDeoWp82LmhN+8xY8fOjsyFDFmsCcQ8r4Xop/uMQ5
         exZw1lxaZJgHneddjnoM+AJ93eC9I6SrJxmT4yyQ5uM/Dvr9gly25BzOYvgG+rhKpOIc
         l02iDosgn8u61G7FILZbQL/X2ZjuoWHxEvG4IQUAfF4YxKeSnOIjo49uAVrm1cUoR7DJ
         IqgHteIWqt20IM2k5wYac/dnjMx/Am8cTiq7hWkqVhoy+o2FgMMeKx8pHm6lidPTqpje
         +/GNeZiWWAjGSAzSgdvfVXuKH5v+ZQeNyFeMJvlPG4X8IRCUC2osIAf4YdN3S06EgZKp
         FgiA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0/+PGrYp9HbkdhnfACbjEfznMt/djgzKsu+fOVQa1jwKrj0jzaauYUUxC9SPt9msMcdDZICRsVYd419OcIb8=@vger.kernel.org
X-Gm-Message-State: AFuF++kmLZOP9TotJ5UarwSmVxRICmXi6BWO5kkNxseA27D6yCqyMSs+
	Rm72b83rqKyyJiBdl6kfx5Sn513PcCtctQrVxRR93sfT2hhZI+pJjtKNoH/EsLjXE3YXpNCEeTI
	dDfW8eCDIeaHruBD5ItFbvm/gal1HeKL23mVZj37sDcw0lEJHb2SZ5mZm1qR/IemJG9R3vw==
X-Gm-Gg: AR+sD13QEOM3eio/YHaguPKwT8ctY96BtFlweiJ/Ah2cj90tM/32LHyOzJ8qLW3FXmq
	N8L7BdX9j4CqcrkaCvOpVdOESOYnryfyYHRPj0y8yxB6Tmfl1yOeDFZqcIZ5OjGP/ZyK7SacbeD
	9gF5CLx3rbdpPR8UNcTxuTiWmxv6oL4+vEKXkIy0Gnr64hNyYyaehAyxmgS/iJfFBl17w4TH50s
	VAnAj13JTsXAw0pMqJX2j/A6GUYd0ydd9uolrKklzaTfc0UA7KA2Bm6j2lKZBu0JCTOdRp4gjEz
	KY8frRLc+oTj0lFNpS3vR+7HAqVq3VOjloHHiD3vUctMcn4J0Jt2Wdjt1grXX6or6BE+62TepHf
	fBx61h4j2ixKk96l4LSOhlQDJBb5f0OIdk/F8kEGiwhuA
X-Received: by 2002:a05:620a:4725:b0:937:2762:ef33 with SMTP id af79cd13be357-9378044f08bmr147506185a.41.1787691534410;
        Tue, 25 Aug 2026 13:58:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:937:2762:ef33 with SMTP id af79cd13be357-9378044f08bmr147496085a.41.1787691533101;
        Tue, 25 Aug 2026 13:58:53 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36879asm65847385a.17.2026.08.25.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 13:58:52 -0700 (PDT)
Date: Tue, 25 Aug 2026 16:58:51 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao3tFg4JLNlbylTR@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao2t6HP-Zt5KDg30@tiehlicka>
 <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao3quaSze8YjPjxZ@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3quaSze8YjPjxZ@tiehlicka>

On Tue, Aug 25, 2026 at 09:19:21PM +0200, Michal Hocko wrote:
> On Tue 25-08-26 14:33:48, Eric Chanudet wrote:
> > On Tue, Aug 25, 2026 at 04:59:52PM +0200, Michal Hocko wrote:
> > > On Tue 25-08-26 10:47:53, Eric Chanudet wrote:
> > > > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > > > > On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > > > > > CMA allocations are currently unaccounted for by cgroup memory
> > > > > > controllers. As system resources, they should fall under memcg, but CMA
> > > > > > areas partition the available space for different purposes and memcg
> > > > > > doesn't have a good representation for that.
> > > > > 
> > > > > Which CMA usecases are covered by this work? It would be also great to
> > > > > spend more time describing usecases.
> > > > 
> > > > We would like to offer some usage guaranties to userspace processes
> > > > ending up doing allocations in CMA.
> > > > 
> > > > For example, a shared CMA area is described in device-tree for an ARM64
> > > > platforms. Userspace components could then, for example, allocate from
> > > > it through the dmabuf heap, or a device or framework-specific ioctl for
> > > > that matter, to use the buffer with sensors. The dtb may have other CMA
> > > > areas described additionally that may or may not be used by that
> > > > component. In this context, we would like the ability to limit one of
> > > > the userspace component to over-allocate and choke the other(s).
> > > 
> > > How exactly is this supposed to work? How is the CMA access controled
> > > and opted in for accounting. What happens when memcg limits are hit. And
> > > many more details, please.
> > > 
> > 
> > The administrator opts in by mounting cgroupfs with
> > memory_cma_accounting. At which point the cma allocator will charge CMA
> > allocations against memcg and manages a per area counter depending on
> > what area the allocation was made into.
> 
> So each CMA area will have its own counter and limits?

Yes, in order to enforce a limit per CMA area this series add a page
counter for each area. Areas are fixed and discovered early so the
counters are added to struct mem_cgroup and initialized when the cgroup
is created.

An admin would then use the cgroupfs entries to assign an area limit to
a given cgroup, something like the following, using the reserved area
for example:
  mount -o remount,memory_cma_accounting /sys/fs/cgroup
  echo +memory > /sys/fs/cgroup/cgroup.subtree_control
  mkdir /sys/fs/cgroup/mycg
  echo 16M > /sys/fs/cgroup/mycg/memory.cma.reserved.max
  echo 64M > /sys/fs/cgroup/mycg/memory.max

> > Assuming memory_cma_accounting is set, if a non-root cgroup makes a CMA
> > allocation over either memcg's max limit or the per-area limit set by
> > the admin, the allocation fails with ENOMEM.
> 
> No memory reclaim is triggered?

Oh I see, try_charge_memcg() may try to reclaim and would do so before
the area counter is checked. So a dmabuf heap allocation in CMA could
end up with a page cache eviction if the memcg limit is reached by the
allocation. That is down to the configuration setup by the admin, I
didn't put any check that would prevent say
  echo 1M > ..mycg/memory.max
  echo 16M > ..mycg/memory.cma.reserved.max
, which would exacerbate that scenario.

> > If memory_cma_accounting is dynamically unset, no the CMA allocator no
> > longer issues charges. Whatever was already charged can be uncharged
> > when it gets released.
> 
> I do not follow

I mangled my sentence halfway, I'm sorry. I meant that the charges
persist until the resources are released. Enabling memory_cma_accounting
only controls if new charges are issued.

> > It looked consistent to use memcg since movable pages from regular
> > allocations may end up in available CMA regions until a CMA allocation
> > needs the space and has them moved. So in an extreme case, hogging the
> > CMA space of a large enough area could trigger system memory pressure.
> 
> I really do not understand what you mean here. 

Non-CMA allocations can end up in CMA physical regions when necessary
(ALLOC_CMA flag). Since both CMA allocations and other system
allocations are represented the same way, with differences only in
properties, and they can live in the same regions, it sounds reasonable
to account for both under the same counter.

> > > > memcg
> > > > looked like a good fit to achieve this, albeit handling the areas, so a
> > > > cgroup has a quota in a given CMA resource.
> > > 
> > > Please expand more on why do you think this fits into the memcg model.
> > > AFAIU we are talking about a unreclaimable memory and reservations of
> > > CMA areas.
> > 
> > Since memcg already accounts for some unreclaimable memory (kmem,
> > hugetlb),
> 
> hugetlb pages have their own controller
> 
> > or induces failure if no reclamation is possible, I did not
> > see CMA allocations being unreclaimable to be a blocker to track what is
> > otherwise system memory.
> 
> yes, we can have unreclaimable memory charged to memcg, that is not a
> real problem. We have all sorts of memory consumers that need to be
> capped charged to the memcg. If dmabufs are another ones then fine, just
> charge allocated pages from the cma area. It is the "make all cma users
> memcg aware and have per cma limits" that I am really struggling with.

CMA is system memory independently from its usage though, and in cases
with shared CMA areas multiple users can allocate from them. Yet the
kernel cannot enforce usage limits.

> You cannot really assume usecase, requirements, lifetime etc. for an
> arbitrary cma area. I do not think this is a viable way forward. Focus
> on your real usecase, which seems to be dmabufs.

While dmabufs are indeed my main use case, they are quite generic and
may not always have system memory backing them (device memory). Working
at the CMA allocator alleviated these disparities.

> Explain what do you want to achieve and then we can think whether memcg
> is the right model for that usecase

Hopefully I expressed this in a better way by now. In short, enforce
usage limits for concurrent CMA users using shared CMA resources.

> -- 
> Michal Hocko
> SUSE Labs
> 

-- 
Eric Chanudet

