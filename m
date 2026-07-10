Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024E435ED5
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701520; cv=none; b=eeXjAVDA5uYyxv5UwvNjFCvVK+bSKOu6BnWMMYu/q2A614rFqksYxoF7NXdQQtqkEQmGvNPMWKz4pTVXPhotoojfgMlvO9N47d4w8IZG0xjKjAxHRkr8bsPrg5ydhXA9aqcLDd3PiZ9us4dBsoxowemxAbvPJvld4mjvKBhZbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701520; c=relaxed/simple;
	bh=vTdToXVujk74qBKh74vvECPnjgofqJDrLpjoPE4cKsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zey7FJRSYcQNMFh8DzS4mFFAf/kkaVrDAxM6elGP6/fuALfQpkxiF67vSSiwx4OiKe6SEGciKHr3kwIUCEnS4I/Dyu3NqS30E+PofNzlxQ4U/3SKRmIOxbTLhAC1c4ZjlmcDM7hgObshAZS779BHoFk40PpFLRBIsxGk4kYi4X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Dtj3Fzyg; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Dtj3Fzyg"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so8501536d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701517; x=1784306317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjPC+dGtl7NWTD2gQsmUUpevrDX1aRJ0R6Q1EEoKDOI=;
        b=Dtj3FzygiHO0Ijtq8NJkTj+A8XCmtTgtY/WdFTEByh+1CaGGRHY2XebV/Bve6bTsI1
         roaNiMvL37FyiC57NTbTRYXfUTjDHb9B770JS/DkCRYfUWfPVdtF0ky9otnhyAT8t9EA
         NuYggfNxRWprzMobO1AkQKmDulQYG2MBjRdJlRJXRG4Wbh4JEIwVWGKkuGkHLp8TyvRz
         Vb/GoWYERXPx6dZ8l/7+9VMSi4NKy7I1g3xqsruP7OBC5A/yVs7So9NZcKgcF7mIW8K+
         bghhMlCjlNg8QCSvfevIov4KoCn8zcoxlbD46hxHH9o2a1pSzSeDcIMi80TSLJCDQYKO
         NNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701517; x=1784306317;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjPC+dGtl7NWTD2gQsmUUpevrDX1aRJ0R6Q1EEoKDOI=;
        b=S0EfrZ/tMtkm6n8VcgyqnAdouJ6WRRgACstk0ThwnCF6KZgsGJy/CWY+fBLupF5sHF
         /43Jdr2y8nZUJE7qTmK00xi2pJxXkR0vrkdO/yMNAsh/zl3N1QvznVgVgJV+hQ0HyrP9
         7ueuEjBrd7n6adm/DmBuZvq89Gm/tStO8hWi778r7H/NlZibAKi8HqYF11Bqoq7BmHkS
         XVfGV/No0bNXqMFBoATA4qn0Eto9HEHr+xk5g7Jx5UslpcbFzKOH9wZu+lydlqSglvRM
         go7wGcUw/XJl9GLEunWDq7my4KJQi/7XeZztGBQ+aRoI/0OiF6ySJ6jF58yYXe40XVMp
         pOiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBsKZLl/G674v1bRkblSBbSVO/+0j1wTFOkJ1Ep/BeXaCmU1RUTe/6fxHBwY1Nj5q+ol9Pm3ZToiKn0e3nSWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCP0YjhQ8jSisaT7pkUH040gjjKlbiOgCX4R2AmruFE7H2j1Ef
	Bpxe1A2hwkFmH5WmJ3lvkdTLPCVsFRLC2l04qQWjr+wn+7/0CGlq+Iqw8Cyry/bzWZo=
X-Gm-Gg: AfdE7cnlKqTpk5GhzGxdTRh+3ArOQ0vLW3hfP/1pZnNbmL1VachjAQYHDDDT5MOmi+k
	0sh9DN2TkUJi8nDnpRpHiCDZTwt0ePysCyeGc0ORyUFEuyYduMxpr2+8V7rjINB2v62XYmPVh1j
	ayk5YfiuXYfsNizh34+2ldiLY0o3VUMawYJDg2GgJ+hR+j5IEjV0ThNW+UPRQg7tC5ieCvLZr1q
	0yGEq7hT6x9vDIHOq2tfcnSSyyzmctaDkWaa5b8YEJmDyT3wRlyLTSu5MPX0ENen97lQCf4mJrU
	kuFebRgN62N5XaGUXWhgfW3hMLpNsioHCDyYoJ7VsF4GihaAikwE6Kln7dojbfWdtNjSbmPxQoj
	Gc31r1iYX4cQnxJB1BYDmAeh31rt4+GssFHnz1yrtOvriR3T3aKsZxTnZFESF
X-Received: by 2002:a05:6214:19e7:b0:8f1:36c7:497c with SMTP id 6a1803df08f44-8fec217aa9emr148367176d6.33.1783701516760;
        Fri, 10 Jul 2026 09:38:36 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d8fcsm45350946d6.25.2026.07.10.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:38:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEFH-00000007YQp-17rB;
	Fri, 10 Jul 2026 13:38:35 -0300
Date: Fri, 10 Jul 2026 13:38:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, kees@kernel.org,
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
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <20260710163835.GR118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345362182.660027.12809852179204464964.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> hmm_range_fault() requires the caller to hold the mmap read lock for the
> duration of the call. This is incompatible with mappings whose fault
> handler may release the mmap lock, notably userfaultfd-managed regions,
> where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> after dropping the lock. Drivers that need to populate device page tables
> for such mappings have no way to do so today.

sashiko could not apply v7 for some reason but the remarks on v6
seemed meaningful, did you see them were they delt with?

https://sashiko.dev/#/patchset/178336023903.504354.7500950448226027718.stgit%40skinsburskii

> diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> index 7d61b7a8b65b..70885f153d03 100644
> --- a/Documentation/mm/hmm.rst
> +++ b/Documentation/mm/hmm.rst
> @@ -208,6 +208,69 @@ invalidate() callback. That lock must be held before calling
>  mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
>  update.
>  
> +Dropping the mmap lock during page faults
> +=========================================
> +
> +Some VMAs have fault handlers that need to release the mmap lock while
> +servicing a fault (for example, regions managed by ``userfaultfd``).
> +``hmm_range_fault()`` cannot be used on such mappings because it must hold the
> +mmap lock for the duration of the call. Drivers that need to support them
> +should call::

Given the majority of callers use this API it should probably be the
focus of the documentation and example, regulate the existing API to a
'BTW if you really need the mmap lock, and you really shouldn't, this
exists too'

> @@ -32,6 +32,7 @@
>  
>  struct hmm_vma_walk {
>  	struct hmm_range	*range;
> +	int			*locked;

Let's use bool if you have to respin this

> @@ -651,37 +663,33 @@ static int hmm_do_fault(struct mm_struct *mm,
>  		fault_flags |= FAULT_FLAG_WRITE;
>  	}
>  
> -	for (; addr < end; addr += PAGE_SIZE)
> -		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
> -		    VM_FAULT_ERROR)
> -			return -EFAULT;
> +	for (; addr < end; addr += PAGE_SIZE) {
> +		vm_fault_t ret;
> +
> +		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
> +
> +		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
> +			*hmm_vma_walk->locked = 0;
> +			return HMM_FAULT_UNLOCKED;
> +		}
> +
> +		if (ret & VM_FAULT_ERROR) {
> +			int err = vm_fault_to_errno(ret, 0);
> +
> +			if (err)
> +				return err;
> +			BUG();

Linux will be upset if he sees this.  

if (WARN_ON(!err))
   err = -EINVAL

> +/**
> + * hmm_range_fault - try to fault some address in a virtual address range
> + * @range:	argument structure
> + *
> + * Returns 0 on success or one of the following error codes:
> + *
> + * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
> + *		(e.g., device file vma).
> + * -ENOMEM:	Out of memory.
> + * -EPERM:	Invalid permission (e.g., asking for write and range is read
> + *		only).
> + * -EBUSY:	The range has been invalidated and the caller needs to wait for
> + *		the invalidation to finish.
> + * -EFAULT:     A page was requested to be valid and could not be made valid
> + *              ie it has no backing VMA or it is illegal to access
> + *
> + * This is similar to get_user_pages(), except that it can read the page tables
> + * without mutating them (ie causing faults).
> + *
> + * The mmap lock must be held by the caller and will remain held on return.
> + * For a variant that allows the mmap lock to be dropped during faults (e.g.,
> + * for userfaultfd support), see hmm_range_fault_unlocked_timeout().
> + */

Add a comment discourging anyone from using this function and prefer
hmm_range_fault_unlocked_timeout()

Other than the concern about the timeout and minor nits this looks
fine

Jason
