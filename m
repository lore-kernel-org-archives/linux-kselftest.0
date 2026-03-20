Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343238E5F7
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003210; cv=none; b=TTGkRgPdnW/o8+YAJ43sK1EXxFhDmZUC1X7nUM4IT4+HsVjarloNl9A86GKhKzOvY8LLcPB5ELeG+dc7FqTCjTOJnzEozKHu/uYeL19+SExV968B9GHmBdBzbgJoon+WXSca4D2ngtJY6HuUf+OZTi0ehIj/HVbQU40yrru6rt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003210; c=relaxed/simple;
	bh=KhvGOABQwXa6rkGgYv9t6dQ9Z9yU5u0qnrdOnEi/t5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mttxXwIC3sPv4eCwaVbRzeEcQi6eBHgs7WbB3D8PZEf9NVwSdbsBAIBwVobUFadoVqeMN5m0vjrDvSEPztDGG1/6eFs4Nto2itF31we1AUArss31MfeGjpFv7P9AXPiOMC6CJY6pNUPl+WwZI5EZyZdlGlqlFtk1DwcrUsRB0Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D+YvyVpd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzzrDqSk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D+YvyVpd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzzrDqSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774003206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x3EfRhA4fDW6Hdtad/Pghe6EEW3AEZgUxlL1m715MFE=;
	b=D+YvyVpdufFFkX3ltikMY5kAMBAl1Wh+fvQAjfIu0FAgK7HidVcs+hyvRXBwXuwP0kGV3P
	iJsxFocHZTCqWOHq2QIyEKAjKMehCRzGm4PSQ64en6c6cYWBqb8Hwp0mM8YRzKeU4f9J8C
	oZInWDSYedWr1F9fO9UaFkxyu3P53tI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-7klAZzM5M7KM-Eja6WqosQ-1; Fri, 20 Mar 2026 06:40:05 -0400
X-MC-Unique: 7klAZzM5M7KM-Eja6WqosQ-1
X-Mimecast-MFC-AGG-ID: 7klAZzM5M7KM-Eja6WqosQ_1774003204
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061868724so132210925ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 03:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774003204; x=1774608004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x3EfRhA4fDW6Hdtad/Pghe6EEW3AEZgUxlL1m715MFE=;
        b=fzzrDqSkjELU5PHPyBu/7lBkssFHWKqVhJRRrdqG/uS8LQDXLY0ozJrx3OdPrm95ig
         zT6GQTpASawFTTkFXCrHDZQYe+wgS5i4w7/5q9ePvGM2bYbr6AvmWbY2Oo9VEKNOt4Qq
         HhohRP0x75kO7shcP88mqJt5lNrLtV8Yr6gtnGqaui3H1tcqoaQW01cmxwMsIT+dCC8U
         mMhJSV2/ycf/bTNKWfstAHu5B40tCYlVhQRZYH8fuURdiBQGlWIeGPdcZFaWAYU9Zdlf
         7UcXAlh+l1dviri9Gvz1DRmZZ2lUmzeVWl1mVmigWt5csSFanHLakNFa+hLTn8AuOdYc
         r9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003204; x=1774608004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3EfRhA4fDW6Hdtad/Pghe6EEW3AEZgUxlL1m715MFE=;
        b=KpQpR0hE5EUGFdsTa/cWtJy36UIjXkZiUf5qFIPd33PgNOEukoE6Ucxvh3I2PksBJB
         T7yfyTeWOmj6W8xkP5S5wdwAA8zywQ28By2aeoyTEbADB9h5fVP0lii63mKNPThBEVjT
         1B2/ysDl9CPWzFawGxOUYkWPDlNga4T6ydbvh3OVMxn31+UpidBYhSC7esIMywuzitDA
         hYs8aMo9CafslxhEsJS+PsqHWPqfQDWS73nhgpcZzwjAbbv7LyWqys0LJK9UenXBpP5Z
         TXDdgTeQa9OphG/GxAkdW9sMY9jxcfU5W2VRaT6/FpKTmlnitjggT8sUwOznrdtlm3ZV
         gceA==
X-Forwarded-Encrypted: i=1; AJvYcCVvlJGJD1ImPvd4ko1TJjKEAe7wQSNsauxGcdohk45ivpPmUwPW8r2IVc4i77rR+2PNv11kprhcZZP1V9HWVkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXa8q04WMTMltMEr6ajcbyAKBrMKlkz5N8Eeh9uyGzAxRlj74R
	wpufZb0KWvGOYUJnpl3nOtA74j9/Y9NltwlrYrwWtzjdG2hWKwE3au+/EtIk3Ae7ZbNrzczk8Qd
	hhrLi0WdLVvbFlauNpuDgxs8Ls17oS3dNaxW8LlKKd6oHdulIK+RXycuRtkIqFBbC5gn3Cg==
X-Gm-Gg: ATEYQzwZSx31s0ZBU13rLFjA9npgpNJa97bGUyOL5nC6foJAy+kxwrN67KhSadkmvGX
	waK1d9LtJ4pkOWc3to96hzRgcuGijsb6zVmOoBmYJTDn3b6xRmarUFuyXaBmsB6jMqdHVOhIKjV
	URlQLFa16TkIaDXd0PCEGHBOO0ELF/iNh2aDTgPY8Ld+zkLUnmWT9+MSCfULBT+sFRKyl50iPqF
	5AZ6NS2qdKG9ErNF65dAJ6uGnYWpq9Uo9ufixaySVfFZzIY88AzN7gjU02IymZCm5rYlkbPl2zw
	94o+0iI8kr3nQRVGWbcy+n2B6EJxmb552ZhiXrfXyiqp1rystNAfWmJTXt4HMla955wFbFULxbT
	0Xj6XsoRrfmiZLXQbEQ==
X-Received: by 2002:a17:903:acb:b0:2b0:44da:6245 with SMTP id d9443c01a7336-2b082797679mr24677825ad.31.1774003204403;
        Fri, 20 Mar 2026 03:40:04 -0700 (PDT)
X-Received: by 2002:a17:903:acb:b0:2b0:44da:6245 with SMTP id d9443c01a7336-2b082797679mr24677495ad.31.1774003203994;
        Fri, 20 Mar 2026 03:40:03 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083679867sm23410205ad.65.2026.03.20.03.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:40:03 -0700 (PDT)
Date: Fri, 20 Mar 2026 18:40:00 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH 1/7] memcg: Scale up vmstats flush threshold with
 log2(nums_possible_cpus)
Message-ID: <ab0kAE7mJkEL9kWb@redhat.com>
References: <20260319173752.1472864-1-longman@redhat.com>
 <20260319173752.1472864-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319173752.1472864-2-longman@redhat.com>

On Thu, Mar 19, 2026 at 01:37:46PM -0400, Waiman Long wrote:
> The vmstats flush threshold currently increases linearly with the
> number of online CPUs. As the number of CPUs increases over time, it
> will become increasingly difficult to meet the threshold and update the
> vmstats data in a timely manner. These days, systems with hundreds of
> CPUs or even thousands of them are becoming more common.
> 
> For example, the test_memcg_sock test of test_memcontrol always fails
> when running on an arm64 system with 128 CPUs. It is because the
> threshold is now 64*128 = 8192. With 4k page size, it needs changes in
> 32 MB of memory. It will be even worse with larger page size like 64k.
> 
> To make the output of memory.stat more correct, it is better to
> scale up the threshold logarithmically instead of linearly with the
> number of CPUs. With the log2 scale, we can use the possibly larger
> num_possible_cpus() instead of num_online_cpus() which may change at
> run time.
> 
> Although there is supposed to be a periodic and asynchronous flush of
> vmstats every 2 seconds, the actual time lag between succesive runs
> can actually vary quite a bit. In fact, I have seen time lags of up
> to 10s of seconds in some cases. So we couldn't too rely on the hope
> that there will be an asynchronous vmstats flush every 2 seconds. This
> may be something we need to look into.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  mm/memcontrol.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 772bac21d155..8d4ede72f05c 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -548,20 +548,20 @@ struct memcg_vmstats {
>   *    rstat update tree grow unbounded.
>   *
>   * 2) Flush the stats synchronously on reader side only when there are more than
> - *    (MEMCG_CHARGE_BATCH * nr_cpus) update events. Though this optimization
> - *    will let stats be out of sync by atmost (MEMCG_CHARGE_BATCH * nr_cpus) but
> - *    only for 2 seconds due to (1).
> + *    (MEMCG_CHARGE_BATCH * (ilog2(nr_cpus) + 1)) update events. Though this
> + *    optimization will let stats be out of sync by up to that amount but only
> + *    for 2 seconds due to (1).
>   */
>  static void flush_memcg_stats_dwork(struct work_struct *w);
>  static DECLARE_DEFERRABLE_WORK(stats_flush_dwork, flush_memcg_stats_dwork);
>  static u64 flush_last_time;
> +static int vmstats_flush_threshold __ro_after_init;
>  
>  #define FLUSH_TIME (2UL*HZ)
>  
>  static bool memcg_vmstats_needs_flush(struct memcg_vmstats *vmstats)
>  {
> -	return atomic_read(&vmstats->stats_updates) >
> -		MEMCG_CHARGE_BATCH * num_online_cpus();
> +	return atomic_read(&vmstats->stats_updates) > vmstats_flush_threshold;
>  }
>  
>  static inline void memcg_rstat_updated(struct mem_cgroup *memcg, int val,
> @@ -5191,6 +5191,13 @@ int __init mem_cgroup_init(void)
>  
>  	memcg_pn_cachep = KMEM_CACHE(mem_cgroup_per_node,
>  				     SLAB_PANIC | SLAB_HWCACHE_ALIGN);
> +	/*
> +	 * Logarithmically scale up vmstats flush threshold with the number
> +	 * of CPUs.
> +	 * N.B. ilog2(1) = 0.
> +	 */
> +	vmstats_flush_threshold = MEMCG_CHARGE_BATCH *
> +				  (ilog2(num_possible_cpus()) + 1);

Changing the threashold from linearly to logarithmically looks smarter,
but my concern is that, on large systems (hundreds/thousands of CPUs),
the threshold drops dramatically.

For example, 1024 CPUs it goes from 65536 (256MB) to only 704 (2.7MB),
that's almost 100x. Could this potentially raise a performance issue
as frequently read 'memory.stat' on a heavily loaded system?

Maybe go with MEMCG_CHARGE_BATCH * int_sqrt(num_possible_cpus()),
which sits between linear and log2?

-- 
Regards,
Li Wang

