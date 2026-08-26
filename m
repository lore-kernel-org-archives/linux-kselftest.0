Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6FE32E73E
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775360; cv=none; b=WLZ1riCs3ZTnYyUX7X+KXbJtKfYAQ5LTTuCbR2G1GjLoslx30CtDP4fyBVUrDuWiCsJM4b7oU1ucf/Qhoyq+OaNV/3mgoPRV9MiHCYnYVR8LsVYFepkAGqQO3f2dX0mj4kFbecQKXmDOlioJeIgtJI0u0YaH7E2QPu5rG7dRWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775360; c=relaxed/simple;
	bh=PW8N1IgTlrulZyKeLd423puC2qwQejHBLTHJOwUtobI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvMFDu84vDGPQlxR8T0C4FFTKACStFq9AYRpkW99nHgsxPV23gL8fKwcBTWmN042X4zy2VSnpH5EA9qT0G5SBWOSnO2iO6S98J5d1Gi0G5yfYEPI9E4YuTEQWImtbf9lt4PBr55B1SmSldgIFPI7x2lg8hnJ6uNp0gOwqeOJuHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnD15MZL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jGKLdrvd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnD15MZL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jGKLdrvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787775358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XOoAhfyz9xtKGJKuczZNY14PVIcWN7EMcbfAjCg3O0=;
	b=bnD15MZLvhgLAfEQgcoWDNHu42nQC8I1A23KXTndOA0jShNqsL5Iim33yOtfveCs7dYRmL
	t+s5Np5C5fKmKbfcNbAOvvFFxh1gTkt/QqlpXnZ7b1N8uXXlWvxKHYRbUeiy7aHMYFgzjx
	PxOSizYCKjVfqvDMX/TPEscf+M5v+nQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-pdHYcpe6PdmOG3SqmR3PnQ-1; Wed, 26 Aug 2026 16:15:56 -0400
X-MC-Unique: pdHYcpe6PdmOG3SqmR3PnQ-1
X-Mimecast-MFC-AGG-ID: pdHYcpe6PdmOG3SqmR3PnQ_1787775356
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e52306621so133874185a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787775356; x=1788380156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5XOoAhfyz9xtKGJKuczZNY14PVIcWN7EMcbfAjCg3O0=;
        b=jGKLdrvdS84sl5YO5wfp/iGYQua5fev9zMbo0s6pYSpp1q0ey8+aTe/gD6SASgTjG/
         M3WN8Jx3NxAoJJ+1392ipM/zyWcDNV0F66B6WFOVcpjtpPIgloFncqb2eZ0ot6My/VpC
         6zQAt45sus0ap3D9d+IyZbxRzavaRqODrMFjkDSvR4tyZUv6JjvW3JjkAZ39ssNrYD7W
         r7flFOb77UoLxolD1jrTJuroKuu5dSE8sCtq60rDKZSZoiDSJZzTJr5L+/AeSI/HleQY
         3Q/KZaeBu5w1OcTQRoguIbKa6dGm37NG+nnmiRsgPvKZAKl3CspIgbRAjJpUO2q9TrbT
         ouaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775356; x=1788380156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XOoAhfyz9xtKGJKuczZNY14PVIcWN7EMcbfAjCg3O0=;
        b=ZVCuPBB6Xdr1LlJZXqzdCnvZiO9yR32gkOUdj6Yq9Kpoeh2JXM3Trs3hkeQFjwKr7u
         dnCaJUYdaujNmi40W2o2GPi6ybTPfZtJ8zHLA85hq6zyAJWen80yJUANQj2QI0iF5HDj
         WMs/wMhwQjPO0qnxPN3UV8ayKhzfprDc5d7K6rUKmm37tNB7Hdcun5gItGtoURqBdQnf
         NXPIREbk9DOwCX0WSmsM/Kqm8KnPgo1ariJp2nrXPDa1bKbCeing2bn850fkdFwoyd6C
         wOjKtN7fKWEdQ6g5nX76EEHSCfun2BRfrXERmWswv0Fq3QRQe2g6k6kaJhhi+RV1J7LM
         f1jw==
X-Forwarded-Encrypted: i=1; AHgh+RrT1h/+adEk8j7HITCW02sHd2DkADBlsUcYnHon+CNc7k4ZSqbbeoGJ8zIaWC3U6zZjkRyhkQqrNQkpmKKs9nE=@vger.kernel.org
X-Gm-Message-State: AFuF++n8VvinJaULRE9AbIomOD0xd6sJU7bhrXMQ+h16drfOkAZIkX0M
	yqyLPIiYuvihP1ONMEHXLo7X/ExICEkYW0EuLMvMMKt5A7jYF5WGawHgwXudTjIx1f8M8krFk0u
	xk4udg+eH5QSWIQWcZ1TvpJmZ0VE4GX8KP7BAC627tQKlHB5RmX6M7J6KvhGVFDCePcbz2A==
X-Gm-Gg: AR+sD10LaSkykQDkbFW+VYmNGxHQj8wQbGJVUTY3rAkxuZ5sCGRmN44B2J2wAzvZkGJ
	iaCVCIs1cGnbcapfO13KX7oy1LPb5x35Ky+M9axHo6cG5ULBAJqOADVs6QAADMiQRm3b2obDA24
	h6lSMwiNZj+BfBTORpIOrj+6khhhJ121JiAkTA0OcdRjp88Ge+foEOlriHn5R5+Nw0inDNu5saW
	RdeD1cr77yN9fP8CcLHa/B4hc7zatJsGWvf0dhDsiEVyUpKx0nX+gmE9eB4HQjd/cBj32DyMXIr
	9Fc6CSV4ml/NO8bavbyMGo0ZswBFTTOys95NYyqIegcHkx2xVPwepQVLJmO85oBUgAB8B0MEVuJ
	aYMpxMRMLcYqYhSzslMsqV1G1HxPfGEnBm1Ni9FzZnhON
X-Received: by 2002:a05:620a:3bd0:b0:936:a407:98bb with SMTP id af79cd13be357-937800f72b0mr763367885a.9.1787775355638;
        Wed, 26 Aug 2026 13:15:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3bd0:b0:936:a407:98bb with SMTP id af79cd13be357-937800f72b0mr763358185a.9.1787775355027;
        Wed, 26 Aug 2026 13:15:55 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e30ed19sm292126185a.8.2026.08.26.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:15:53 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:15:52 -0400
From: Eric Chanudet <echanude@redhat.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
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
Message-ID: <ao89rgCB4VhNt7n0@echanude-thinkpadx1carbongen13.rmtusma.csb>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
 <aowHqqaqK7TeexQH@tiehlicka>
 <ao2gA_m3BCBu2esy@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <5970a8d4-fe7c-4dde-bdc8-1c66bfb57f12@kernel.org>
 <ao3CQicH0t-k95NA@tiehlicka>
 <ao3gLqsF4WSeKBIa@echanude-thinkpadx1carbongen13.rmtusma.csb>
 <7e4e9662-d876-4493-a0b3-e31640937dd1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e4e9662-d876-4493-a0b3-e31640937dd1@kernel.org>

On Wed, Aug 26, 2026 at 10:02:08AM +0200, David Hildenbrand (Arm) wrote:
> On 8/25/26 20:50, Eric Chanudet wrote:
> > On Tue, Aug 25, 2026 at 06:26:42PM +0200, Michal Hocko wrote:
> >> On Tue 25-08-26 17:45:56, David Hildenbrand wrote:
> >>>
> >>> How does this e.g., relate to hugetlb allocating from CMA, to then charge to a
> >>> hugetlb cgroup?
> >>>
> > 
> > AFAIU the system defines CMA areas to allocate hugepages from. For this
> > initial series, I failed to handle it. The intend was to consider it as
> > any other CMA area. It entirely missed that hugepages are already
> > accounted for by their controller (cgroupfs opt
> > memory_hugetlb_accounting) and they are charged when faulted in from
> > their available pool.
> > 
> >>> I always thought of CMA being a low-level allocation mechanism with various
> >>> different use cases, and actually the higher-level users should decide how
> >>> to/what to charge instead.
> >>
> >> Exactly. There are many different users of CMA all with different
> >> requirements. Then there is CMA reservations if an area is shared and
> >> the overall memory consumption. That is why I am really not able to
> >> wrap my head around this proposal.
> > 
> > It is nonetheless available almost directly to userspace via dmabuf
> > heap, or as a result of drivers ioctl providing a contiguous buffer, and
> > unaccounted for by existing controllers, with the exception of CMA
> > hugepages with memory_hugetlb_accounting.
> 
> No. The charging really only makes sense for selected mechanisms that built onto
> CMA.
> 
> It does not make any sense for subsystems that declare CMA for their own use only.
> 
> Like hugetlb. Or s390x's VMCP region. Or PPC KVM stuff. Or the crash kernel area.

I see. The crash-kernel does not use the CMA allocator it would not be
affected, VMCP or PPC KVM HPT use specific areas and do not have
userspace use AFAIU. They would default to the root cgroup that does not
get charged. Maybe it should instead be more like GFP_ACCOUNT, making
charging opt-in when the allocation happens on behalf of userspace?

From the other thread it doesn't seem like memcg is a good fit either.

> 
> -- 
> Cheers,
> 
> David
> 

-- 
Eric Chanudet

