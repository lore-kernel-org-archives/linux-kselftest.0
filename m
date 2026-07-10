Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB2372EDB
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703210; cv=none; b=ISkglpgWO7JY8v+1LfVNdfewMlcpxL/bqRZSopEVY+XJjGyMKq5v9bUNsyfMZMGSOzIn31gz2mEZ7iv7K5KuIvDyQhdFlcBnBY74/SdPvT8e716CRObKtQ1OBZdRRJOeSHWOtKSMMeZa+f+WouXOoIggqp6+krW260w2h42+psM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703210; c=relaxed/simple;
	bh=9lSzgAW8+FmEe+Hp7Rve4vbC7ZImzNSGMC/0E8OnJU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFlHF30ylY4fmfGJytHD9jp5vgy7BObsSu/rgT8rBWCdrO58Co/sVz3Jt9IG/Sxe5+j6AgRfLG3NnrCkyQJGAME3MEoABWIMvQH99np6LWr0lO+Irv77T86VIRQSIW1MI7OtwkEXDNlR31ftj1U6ewikxmHHNfqev+pSVmM8iXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVe+s+im; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVe+s+im"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84847f60deeso2034033b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783703207; x=1784308007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SpFBfA7wdgGokfuzCR83lopKSZdMUZgccIdXLTCA/gs=;
        b=UVe+s+imfdj2zLvI6r5wP+Z4/k6qUc5bZgmJ/1j24jXUTjNUo7KCbZe1mKBeoIwdXK
         GVlHfwzz2SjrPsRBD3JLvfw8xU4FJCAHOBRQdi8mPgMzysC5DZdXKWnzxQQUOJdbF08+
         A5K56Vu5SJ8cvJURFUyh3RuxGN8s8GHmKJ+5OfaFWXLJueu3xSB8kRYa72YirkSKoFBo
         jovSI71te5CCZCel7ZKm+LugxzzLMtoJtphYHN6w/22q8BTQQV38nDmifGX2LXp+EY22
         OHzYbEh7a+IoCc5iIuYuo0+QZZ9jUKNB4dlLkQWdI3q2UxjXMR1G+CftIKNd6uJklOxh
         4fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703207; x=1784308007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpFBfA7wdgGokfuzCR83lopKSZdMUZgccIdXLTCA/gs=;
        b=QTTj39nKXSJvMRBMvPcAWYFmU62mkV7ptcgyjjpqf4ynFpBUocXsbYz6DGWF93byNJ
         092nCAk6p74SkhOBt7klHATFW7IVfh6r9h4iJblB8l2ZKrvjhtddVG8dqNBFaJqKdUp8
         LiGQmhSVjljGI+StI4iipsD2nnrNqTKjFW2pdgbOO5cKkQIkTd7mIOUN6CKXK0ZYY5O1
         IxOjb3uDefM2kG2riZaTf3vrRwMQDTCiugf298BsBRZ7E4IpdhTIwwtUV3rnr3Picsw1
         LW7u/CtkMTNKCdYX9DaIIUU+ppKyo1Q3N1MxBZTSFAXHbRAV1UpN/8JSL4TmuTMy38nk
         tCLw==
X-Forwarded-Encrypted: i=1; AHgh+RpTDNbK8weWJuYr51aYPiOIBR1D/PDuQvrJGw8aoMJ8KKE+w3h0Bm+ZUgop6JOOWX7X8oJM1x1qr5OROWLnZ4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9XjNOzfeOSB1FHjvwmWHXI5+ONHfjtplcebS2Aegluxrp5xsd
	W7tXAXdEoOrpYmPwT9L0fck2F13O5LRXn21KDd2EOv2n/2EZt/Wlh4Fw
X-Gm-Gg: AfdE7cm0zL1nnP/1ZLvyTtQIYYtFPjLfr6omNUYu3Q0fanx8Hmw7uQpWHlXXM6bN5i0
	xit06i/2lCgoJKFauG1vjouvjR38WO+TPbwHr/fFVcwjBS/0hqkzEtM+4oV4N2vLsxdSOLiE9Tk
	0BMfJ0NZP0Q8/spLe2gXcRMsUWmFlxFm4kSc4iYGAOh6ju9yq+GkSiCxG1BdMAgsJ1cImLfKLFY
	HZb9nwy+mm7yku8Rpatod4baPV7d0W69SB79tM6qfJEjAKf9l5cK38B/Os6/+CYos69Vrk8xS4x
	t9TmdiA3G4oBqhXZ/TzfuAoCaAlUApsHMy4tRhBc9D7vdPBFnuDgWWalLPBRUu/u518fNBMqk5Y
	AJIkEDr9ZrFLwh6HPsntrcq4fDuT2B37y07zoPm1KG/DPzKYKX9iXZ+RGf50O2j60t7y/+9+IG+
	xVO+rJY9yI5JDb/yCBIkirptcazSoyODCjrzfNfkQ5lcnj/l7CxlX4qBE=
X-Received: by 2002:a05:6a20:d494:b0:3c0:9acb:400 with SMTP id adf61e73a8af0-3c0f13a6583mr4025578637.37.1783703207546;
        Fri, 10 Jul 2026 10:06:47 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3a2e42bsm5458929a12.30.2026.07.10.10.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:06:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:06:44 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Message-ID: <alEmpEv-Q_bQFzNu@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710163835.GR118978@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710163835.GR118978@ziepe.ca>

On Fri, Jul 10, 2026 at 01:38:35PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> 
> sashiko could not apply v7 for some reason but the remarks on v6
> seemed meaningful, did you see them were they delt with?
> 

Yes, I dealt with them.

> https://sashiko.dev/#/patchset/178336023903.504354.7500950448226027718.stgit%40skinsburskii
> 
> > diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> > index 7d61b7a8b65b..70885f153d03 100644
> > --- a/Documentation/mm/hmm.rst
> > +++ b/Documentation/mm/hmm.rst
> > @@ -208,6 +208,69 @@ invalidate() callback. That lock must be held before calling
> >  mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
> >  update.
> >  
> > +Dropping the mmap lock during page faults
> > +=========================================
> > +
> > +Some VMAs have fault handlers that need to release the mmap lock while
> > +servicing a fault (for example, regions managed by ``userfaultfd``).
> > +``hmm_range_fault()`` cannot be used on such mappings because it must hold the
> > +mmap lock for the duration of the call. Drivers that need to support them
> > +should call::
> 
> Given the majority of callers use this API it should probably be the
> focus of the documentation and example, regulate the existing API to a
> 'BTW if you really need the mmap lock, and you really shouldn't, this
> exists too'
> 

Sure, I'll update the doc to reflect it this way.

> > @@ -32,6 +32,7 @@
> >  
> >  struct hmm_vma_walk {
> >  	struct hmm_range	*range;
> > +	int			*locked;
> 
> Let's use bool if you have to respin this
> 

Sure.

> > @@ -651,37 +663,33 @@ static int hmm_do_fault(struct mm_struct *mm,
> >  		fault_flags |= FAULT_FLAG_WRITE;
> >  	}
> >  
> > -	for (; addr < end; addr += PAGE_SIZE)
> > -		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
> > -		    VM_FAULT_ERROR)
> > -			return -EFAULT;
> > +	for (; addr < end; addr += PAGE_SIZE) {
> > +		vm_fault_t ret;
> > +
> > +		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
> > +
> > +		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
> > +			*hmm_vma_walk->locked = 0;
> > +			return HMM_FAULT_UNLOCKED;
> > +		}
> > +
> > +		if (ret & VM_FAULT_ERROR) {
> > +			int err = vm_fault_to_errno(ret, 0);
> > +
> > +			if (err)
> > +				return err;
> > +			BUG();
> 
> Linux will be upset if he sees this.  
> 
> if (WARN_ON(!err))
>    err = -EINVAL
> 

It will. I copied it from GUP.
I'll change it the way you propose it.

> > +/**
> > + * hmm_range_fault - try to fault some address in a virtual address range
> > + * @range:	argument structure
> > + *
> > + * Returns 0 on success or one of the following error codes:
> > + *
> > + * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
> > + *		(e.g., device file vma).
> > + * -ENOMEM:	Out of memory.
> > + * -EPERM:	Invalid permission (e.g., asking for write and range is read
> > + *		only).
> > + * -EBUSY:	The range has been invalidated and the caller needs to wait for
> > + *		the invalidation to finish.
> > + * -EFAULT:     A page was requested to be valid and could not be made valid
> > + *              ie it has no backing VMA or it is illegal to access
> > + *
> > + * This is similar to get_user_pages(), except that it can read the page tables
> > + * without mutating them (ie causing faults).
> > + *
> > + * The mmap lock must be held by the caller and will remain held on return.
> > + * For a variant that allows the mmap lock to be dropped during faults (e.g.,
> > + * for userfaultfd support), see hmm_range_fault_unlocked_timeout().
> > + */
> 
> Add a comment discourging anyone from using this function and prefer
> hmm_range_fault_unlocked_timeout()
> 

Will do.

Thanks,
Stanislav

> Other than the concern about the timeout and minor nits this looks
> fine
> 
> Jason
