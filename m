Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2283803FD
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731473; cv=none; b=L4uVth9xQSykF4AHKiuwCvTfj1Jns1VR3XeMm2qK4592A2sAleqGez6F3AF/Aq7F4pF7NL5sVedsN7yfCYhIhhM2Z1K+rot0efnJ3DXzHqydLOqU+wpVbE33W78/fmAlqIt6VlQaRpeDnVDq0mWrS07UaPRz8Cw7WkoXfPTj0No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731473; c=relaxed/simple;
	bh=rGxbw1h/TQdAc6lVq+5VHtXog01UUxIR3lm4oWVA6s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boXWcZpQIIeOAoE1ARHjqO94sWVJvNPPns3vKjTEODcEml/IElJCaNdPzDhodxlrQXRFiI8ZsrtIgUSUrjYE26dbPhSx5acv65OiM5Mjfepqa/voHleRsoRdWVpYFgAsjXsVEo45rK9oq2bjcfS/+vtarn8jegnOgPptTDk/vd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R1W5YWRi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R1W5YWRi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so86309866b.3
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787731469; x=1788336269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB7gr+OEBdPvQV2wk9lYHYxAzB0Tgui+S11+5Xp/rXE=;
        b=R1W5YWRiA0ACyDk7AhfWjBk089Tkkd4qwCjYDfbmM5kc+tlzkUa1v1E++ANc7hwFRh
         7S+7w3NfDeWLHm/MSjdFVBOaJ+Nv4TINnG0tqhlAltscWHLvVpgfvINjTqywBaBfhyOC
         au1l9BJJ+njysAr7bGpP/V6ic330oGjNP2sZfnhvEKmDSm45meSyTt+/A+1b1eXg/7dD
         pd+9+cjDhXm4PWgdtz6NWHdft/7i3hJ+ijXW6u2h7i8xB1y2lTCNMAFmbaeQHzQcpN0V
         xG3u3bExxaZ8OteUJAlE2VWJwRiUDj68C9HjVvxkHO41KJGE2pSYEZD0QMHGbsZ4hhr3
         1NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731469; x=1788336269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB7gr+OEBdPvQV2wk9lYHYxAzB0Tgui+S11+5Xp/rXE=;
        b=BXucoNnBPKPcj8Ec6ZZKg/KJ9i4atdLDjjZGu2PYYTSb1JGHazuwcBYosyJ5E7FxXX
         mgMiWUhzCII2ponMz8GPk0wLtPum4nj984QKJmTXMUocDARgxrTPtbsXA984tV2SnvxN
         P2w908Le8MjUxRG5Ag8nvYcIOx58IGs4SACUY4G88O7CX0VBMfUdNpZYssCuF+DxQMhK
         XgehDqOzmcw9Zo/n8tLN/ecWRwthdPzLdMvdLuQaP5oM1NqU4z9Lj+AnjWDXrrPDvuRE
         Ez90yXpOnI5uK5x8t00rNRUBWRpkoUoFDsEykCx5IvipxZC8zMi6Zm17pjuhLNiitlmg
         9tqQ==
X-Forwarded-Encrypted: i=1; AHgh+RotB19pzMPUN7/pFwchCeTfWpk0MhcAdxD95dVqduq/ZbY4vW6qz3wzBP1yPj/Gbc0o6AI0MIoTd1Fih5uL28Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nkCG9L8rPbdZM2LAP5dLhDIqnPtCNIsJnR7/f9vgK55hJz2pp8
	cO52DR6K6NQ4bev4ZS6eRkAkv+IasFrjjBEbtOV/KDLs+BFaBfxeLwM0rrBCymOppiI=
X-Gm-Gg: AR+sD13ajz3k6WH/ynHuirzDOdYW2pJZzcx1cdAG4nT9h45mem3ZrkAggAlf6W5OOK8
	4lb3oyoGQAo1hXppEQp3ovKBPHCSKwsd8LrNiZb4RhQxqfBJU0wZww3zLNBHdxKe7gvQZcR30sp
	9MaaHdDhWBCoW2JUJ+v5JuNy7CeaCU+Pqd5Y4qnwHyX9/ygDMCD2bjZ333YhtEkBA77tfqvL/yK
	YfJImkeG1pc0Oa56iqJqERiKXdHpGBY+oQ90GkYD1fOKjxtUrNa9uPsMoFMpKYkwq80xPDtF8dB
	debWM74qrpMZQAMbSC0CSjmWWSwdHb/2dK/aJM/CiwnmgonBkTj5BcN3W4mm+cYeUn8J1fc0/qC
	QhbAG4PT6iopmNIA/F93ueTgwVOkam4Z5Wls5z3q3TvUYkVD/N3d6rCVe/h81MuHlugaZn3vz8Z
	IPn+BFXhZe8ZMtCez2BeFxiDjWDB86HI2dECB4E923xOwXsxOTd01qqgU/M+3jZ1yN/6+/ntY=
X-Received: by 2002:a17:906:f58b:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c250bbcc64amr476059866b.6.1787731469299;
        Wed, 26 Aug 2026 01:04:29 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm356259366b.37.2026.08.26.01.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:04:28 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:04:27 +0200
From: Michal Hocko <mhocko@suse.com>
To: Eric Chanudet <echanude@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
	Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 00/11] mm/cma: charge cma allocation to memcg using per
 area counters
Message-ID: <ao6eC2SUIGVz3Qct@tiehlicka>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao2t6HP-Zt5KDg30@tiehlicka>
 <ao3UKM5SbxBmxuR0@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <ao3quaSze8YjPjxZ@tiehlicka>
 <ao3tFg4JLNlbylTR@echanude-thinkpadx1carbongen13.rmtusma.csb>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao3tFg4JLNlbylTR@echanude-thinkpadx1carbongen13.rmtusma.csb>

On Tue 25-08-26 16:58:51, Eric Chanudet wrote:
> On Tue, Aug 25, 2026 at 09:19:21PM +0200, Michal Hocko wrote:
> > On Tue 25-08-26 14:33:48, Eric Chanudet wrote:
> > > On Tue, Aug 25, 2026 at 04:59:52PM +0200, Michal Hocko wrote:
> > > > On Tue 25-08-26 10:47:53, Eric Chanudet wrote:
> > > > > On Mon, Aug 24, 2026 at 10:58:18AM +0200, Michal Hocko wrote:
> > > > > > On Fri 21-08-26 14:56:52, Eric Chanudet wrote:
> > > > > > > CMA allocations are currently unaccounted for by cgroup memory
> > > > > > > controllers. As system resources, they should fall under memcg, but CMA
> > > > > > > areas partition the available space for different purposes and memcg
> > > > > > > doesn't have a good representation for that.
> > > > > > 
> > > > > > Which CMA usecases are covered by this work? It would be also great to
> > > > > > spend more time describing usecases.
> > > > > 
> > > > > We would like to offer some usage guaranties to userspace processes
> > > > > ending up doing allocations in CMA.
> > > > > 
> > > > > For example, a shared CMA area is described in device-tree for an ARM64
> > > > > platforms. Userspace components could then, for example, allocate from
> > > > > it through the dmabuf heap, or a device or framework-specific ioctl for
> > > > > that matter, to use the buffer with sensors. The dtb may have other CMA
> > > > > areas described additionally that may or may not be used by that
> > > > > component. In this context, we would like the ability to limit one of
> > > > > the userspace component to over-allocate and choke the other(s).
> > > > 
> > > > How exactly is this supposed to work? How is the CMA access controled
> > > > and opted in for accounting. What happens when memcg limits are hit. And
> > > > many more details, please.
> > > > 
> > > 
> > > The administrator opts in by mounting cgroupfs with
> > > memory_cma_accounting. At which point the cma allocator will charge CMA
> > > allocations against memcg and manages a per area counter depending on
> > > what area the allocation was made into.
> > 
> > So each CMA area will have its own counter and limits?
> 
> Yes, in order to enforce a limit per CMA area this series add a page
> counter for each area. Areas are fixed and discovered early so the
> counters are added to struct mem_cgroup and initialized when the cgroup
> is created.
> 
> An admin would then use the cgroupfs entries to assign an area limit to
> a given cgroup, something like the following, using the reserved area
> for example:
>   mount -o remount,memory_cma_accounting /sys/fs/cgroup
>   echo +memory > /sys/fs/cgroup/cgroup.subtree_control
>   mkdir /sys/fs/cgroup/mycg
>   echo 16M > /sys/fs/cgroup/mycg/memory.cma.reserved.max
>   echo 64M > /sys/fs/cgroup/mycg/memory.max

OK, thanks for the clarification. This confirms my initial suspicion but
it is better to have it clearly articulated. I can see several problems
with this approach. First and formost I do not think dealing with all
cmas this way is manageable. This can become a mess very quickly if we
have one limit per cma and too coarse if there is a single one. I also
have my doubts about space allocation control through a simple limit for
something that is effectively a reserved physical space.

I might be proven wrong but unless cma serves objects of a uniform
size then this will simply not work in practice. Hitting ENOSPC without
hitting limits and thus impractical for shared space management.

[...]

> > > It looked consistent to use memcg since movable pages from regular
> > > allocations may end up in available CMA regions until a CMA allocation
> > > needs the space and has them moved. So in an extreme case, hogging the
> > > CMA space of a large enough area could trigger system memory pressure.
> > 
> > I really do not understand what you mean here. 
> 
> Non-CMA allocations can end up in CMA physical regions when necessary
> (ALLOC_CMA flag).

Correct. But those are a subject of migration so any such placement
should not be blocking real CMA allocations.

> Since both CMA allocations and other system
> allocations are represented the same way, with differences only in
> properties, and they can live in the same regions, it sounds reasonable
> to account for both under the same counter.

From the memcg POV we do account physically consumed memory. So yes,
it makes no difference where the memory comes from. We only care about
the overall capacity you can constrain or protect. Generally speaking it
makes sense to charge heavy memory consumers directly triggerable from
the userspace.

That is all memcg can provide you with. Specific requirements for
specific types of memory is a different story. We currently cannot
control per-numa node for example. There is an ongoing work to make
memcg memory tier aware. 

> > > > > memcg
> > > > > looked like a good fit to achieve this, albeit handling the areas, so a
> > > > > cgroup has a quota in a given CMA resource.
> > > > 
> > > > Please expand more on why do you think this fits into the memcg model.
> > > > AFAIU we are talking about a unreclaimable memory and reservations of
> > > > CMA areas.
> > > 
> > > Since memcg already accounts for some unreclaimable memory (kmem,
> > > hugetlb),
> > 
> > hugetlb pages have their own controller
> > 
> > > or induces failure if no reclamation is possible, I did not
> > > see CMA allocations being unreclaimable to be a blocker to track what is
> > > otherwise system memory.
> > 
> > yes, we can have unreclaimable memory charged to memcg, that is not a
> > real problem. We have all sorts of memory consumers that need to be
> > capped charged to the memcg. If dmabufs are another ones then fine, just
> > charge allocated pages from the cma area. It is the "make all cma users
> > memcg aware and have per cma limits" that I am really struggling with.
> 
> CMA is system memory independently from its usage though, and in cases
> with shared CMA areas multiple users can allocate from them. Yet the
> kernel cannot enforce usage limits.

Correct. Those are effectively a shared memory pools without any
control. I do not think memcg is a good method to enfore any usage
limits for that though for reasons mentioned above. Memcg is effective
at capping the overall memory consumption of a workload. Not really
great when it comes to a specific memory pool control.

> > You cannot really assume usecase, requirements, lifetime etc. for an
> > arbitrary cma area. I do not think this is a viable way forward. Focus
> > on your real usecase, which seems to be dmabufs.
> 
> While dmabufs are indeed my main use case, they are quite generic and
> may not always have system memory backing them (device memory). Working
> at the CMA allocator alleviated these disparities.
> 
> > Explain what do you want to achieve and then we can think whether memcg
> > is the right model for that usecase
> 
> Hopefully I expressed this in a better way by now. In short, enforce
> usage limits for concurrent CMA users using shared CMA resources.

Thanks. Yes this is more clear now. And it resembles hugetlb situation
more than memcg. You simply need a memory pool specific access and usage
control. Dispersing that to a global memcg limit seems rather coarse and 
I would say impractical. So it really calls for a per pool control with
an understanding of how the specific pool really works.
-- 
Michal Hocko
SUSE Labs
