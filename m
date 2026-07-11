Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B72DCF6C
	for <linux-kselftest@vger.kernel.org>; Sat, 11 Jul 2026 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783739699; cv=none; b=hqUjjLZwpkJxupI3Ea6RWkDcTMtj+1YMo8G3zGlhtqpyIClRw4RR1If7GYfUsatbr11WUGPYMmyKY+d5V5Leb/o2hAMStC1CENr7aJSWpOuxDRg45Dh62pwkH5FGkE4u20/Dvz8BU4+wdyKiy4oCfJPJnNThsnsld9w842w1bIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783739699; c=relaxed/simple;
	bh=qqBMc1pIZ4OwB1WOwiQC+Ffr8ykArNIN3N1czmLBQLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ts0NyNru6PS/9XnzTf0VHr0L4fr7DW7iKAve5UOmz0NDVJjxaKSecdsLGtkdbQ/63pI90U4T4CD5ol14s09FWT1Dws1wsCDoUZYH0ODDvII53ZT8wXqG0ON8glAN0pYwq+yFUVHKJozLvsyBAKFfTje65J8g/3zy8lpcNt8eAPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9usNja3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9usNja3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381b831d535so2006764a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783739697; x=1784344497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=j9usNja3Rw5jRvVQMhlvbBICaZdQiWUjddeAsYDi9fiyL8Joamdn0JxMIZ5dk38bIQ
         /dornZxQMlIROVUjVoRhbGHUKuukf6Og8glDQTCDAJbg4K0QgRqqm/1/PM97bWK8yUzb
         cDMHXHbpXI7+NZzaaVzeYzRIphjIJgazuYXMlodgbRGw9iEFgEltoznH76c8Y5kiH7/l
         sCjepKEumOcKyeYvn7JtRE9U0wehywpYEDvMG7zDQKECSL9yoKlNaJvg3/R2NRKxJ/aE
         FTNW2+vTGF6P2K39qMI8aKDaAcI8+pI9elzMZpeldCoY2Ji70VUFBU9h7WkHDCr1dQob
         ZG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783739697; x=1784344497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrd/oJTRX2Uc0zxJ+R9Qjxy6xmTV66E4ZoYglWTlGgs=;
        b=KhRKi+ez5qSktOa9N4eWVHa9wVlHhYihbV7eigINlkkDfYdmccVqKL2s+u7jLx17aU
         KtrS9EFB/mXe4Z5YJUj193rpnWMuTCvhqxlpctN40QNncaLP3pqSjpb61LuaWwE0naoN
         UqgDyS6k8c+olILMG2uLQWPsPS6fqwI0l+5OLzlAZ7riwe3I4BHLDJwnEevMU1RjsOVN
         iXwj6ayv2MlXi5txs+tgM/7VEHe0oaEsJkxjjfXmiZ6XCntM33YkGQsTUj80y98nYzhg
         7SG1Z/EJBWOHgzYNPSM0T5UWQ1L3BWShhjg8CqZyrcSamvWXdoNuriSno3+0Nic/nzNA
         netg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9zKZbLSmcQQ9nvJzibFnv072Gi0QbTQDluWicSEPpJW4pwOqhzdVNiV4lLVVYj54wlXB7ZUgSxIJWgkO/+Is=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz87E8XJ0ehCJHYoOh6GIXMxssQWNhy8vqp6m7xE9xt7YskPF1D
	CpTWYhFgmSC2REQ2BOHqCG7ufPOplrlS9rYt9Qfn+TaU395kSKdhlyaU
X-Gm-Gg: AfdE7cngb/HP4O9z1Hwmzw+5F8DDi/shb5pZSmmPm+6brsRLfIXqqIvbJEa8cc9UHj4
	f9+bS/B0KzD19jSqrHVX13o2Ss1+Q/P22cwRhsPmuI8JLTQtS/OJuu4/veGrepCSV0jzP4MflsY
	6shJU7tPpb3v4l6SlxWjrqSdkJa3glxnQh6wFPuAcibCBjs6wGW0XHwEcZIKLErPvluMA4o+kYd
	RdhC0qIl2SX+k0hxqIsLdrLZsBUI8Jr2+o3D4msHIti25/V3i48HQIJg26DcJsbsJOuD3sbHQfc
	LbY+vkSLO0n1SXohyXXSbJq9zqAihp/FuIoeJF2LpqxXH7eqR94IigPWpSaafSuVfrVTKoz1B/K
	ZuCr9IP9u6hk+r9IWvX758O6bCuPQRb5UM/kpFq59//QYJkaWRMQsm0xrkvBg2cjMwt5v4bHTYI
	97mrlkA1Z2qimgSAHHz8V6GBEYWXzIg6TY3SYQmgJGbYL/jVBHltFOXfQ=
X-Received: by 2002:a17:90b:5688:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-38dc74cbe73mr1405854a91.11.1783739697430;
        Fri, 10 Jul 2026 20:14:57 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm3463061a91.10.2026.07.10.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:14:56 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:14:47 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, corbet@lwn.net,
	dakr@kernel.org, david@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
Message-ID: <alG1JwgUK44dCiN4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881034.900500.5214601525971121683.stgit@skinsburskii>
 <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151216.0397a6f9ac5c7b4ccd274cc1@linux-foundation.org>

On Fri, Jul 10, 2026 at 03:12:16PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:50 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > MSHV currently faults movable memory regions by taking mmap_read_lock()
> > around hmm_range_fault(). That prevents the fault path from handling VMAs
> > whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
> > mappings.
> > 
> > Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
> > preserves MSHV's existing unbounded retry behavior while letting the HMM
> > helper own mmap_lock acquisition and refresh range->notifier_seq internally
> > before walking the range. After the fault succeeds, MSHV still takes
> > mreg_mutex and checks mmu_interval_read_retry() before installing the pages
> > into the region, so the existing invalidation synchronization is preserved.
> > 
> > Fold the small fault-and-lock helper into mshv_region_range_fault(), since
> > the remaining retry path is just the standard "fault, take the driver lock,
> > check the interval notifier sequence" pattern.
> > 
> > ...
> >
> > @@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
> >  	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
> >  	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
> >  
> > -	do {
> > -		ret = mshv_region_hmm_fault_and_lock(region, &range);
> > -	} while (ret == -EBUSY);
> > -
> > +again:
> > +	ret = hmm_range_fault_unlocked_timeout(&range, 0);
> >  	if (ret)
> >  		goto out;
> >  
> > +	mutex_lock(&region->mreg_mutex);
> > +
> > +	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
> > +		mutex_unlock(&region->mreg_mutex);
> > +		cond_resched();
> > +		goto again;
> > +	}
> > +
> 
> If the calling process has realtime scheduling policy and either a)
> we're uniprocessor or b) this process and the holder of
> interval_sub->invalidate_seq are both pinned to the same CPU then
> cond_resched() won't do anything, and this might be an infinite loop?

Yes, looks like it might.
What can be done to prevent this?

Thanks,
Stanislav

