Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DE2263F5E
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701101; cv=none; b=gmZrm0V7AZHMOjS9mm1Lu464QYX/zLH6laFzC4mibEsBstXmp8df3mt9NHG+FBq1tkEO7qwUjMhxPqyPRtlXwfNMmK+unSTZ0AKGyQ3/7LU7OuCritWVbxpWbHTlH5Zpm7S0yT5DQgYZ924tnc3WoydxK100+iMeI0BhSJtd9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701101; c=relaxed/simple;
	bh=Sbx8vXWqQQ/M0W9UlsuLQM8Ua5Q1vedFs+JL66TJWSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJ+9IMhL3H17oXulQBWjhQ+BBLRVghKys/NUyROY63Z8lZySQhEns6e4Z5VaT9GKWAS4IyQq04rcM8k/0M3JB7mKAWNMIVrAYf8ZBALayBK8s17Qp3KB5YRKFUEcwGnjm6cvClr4GY95YqyIirLqL7mZ8aEAHTFo3NujmSC89jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=C9B0DUBQ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="C9B0DUBQ"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so6978036d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701099; x=1784305899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihr9TBqVvOWsgDH+NpkUYsK2K2fCkLkiaNuX2IHUYwY=;
        b=C9B0DUBQrFvmPqU9NSXU7hegpl7ojs8/mhmMnr9+I8B5xI9cbJN4vquMR+TKjoSRbe
         hRVqntMatUOMVwQ77aec0J9Doya+aG8IZxs5XirF5Ku3Ah35eFZG0l4ACmfIwbWBJMhX
         oVNossKW2Twv3Vh/obtosrQ/pXr9DDd7KelvhktBuY09jEM5IGYcXMOnzEoGs6Q/7Jdj
         K7AUzEdbaXOvsXR0zmLhfvAaQjl+FLj+w+DzYga35xmOl5qsbr94OSq0jOzS2tfeoYeK
         6EJs8zXW2Mz1qdRSBb4NWbEFf6BK3WwdCTjumyD2SidvzWStaTThJnCiasO0muhiqMZ2
         k0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701099; x=1784305899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihr9TBqVvOWsgDH+NpkUYsK2K2fCkLkiaNuX2IHUYwY=;
        b=jNBMr8pGtuQe5mavFtdCYIx1/9fJ/PyJC/HiMWC5BKiEXPzEoORPdCndgTei8083S9
         59FGEUfTLOZd6eYh+ZhZFJYHSASR2HQz8KUreY+k2WeHB66bMzvpgONvx1L9Ad1AXs9M
         JTf60NUnDnlAA7Ck1OGGiQoYDNpAGq3LT1qX4jEPJQWLNZbGoS5ahWpo0IFED2TZCM4j
         FnrP5kZRwYUUOoVC+jirbHA1xle3+m3ndFi+/xKICwGpD7FMwUazFVpIdWETU2H/VXCW
         jeggoZeW3gdEkQ5Vk92OeHEB2r4Pw5UhHKGT+238kOJ8/2njupFXr9vE0ggdoH3swjxl
         GyVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0VNB2qeOKP5B0agdM+z5yZ301VJJmWEs7QpXofUgr8SXRp0mWW9xa3Yuo//rVW2x1iUsmZUIUwQT4zc0/Xb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW4IC+w/kTv05Le5PBA/+DmetgnQ9raxqV/bKP1izqO9BmU9yW
	Sb7cn+NKIf1vza/Mg/e7akpf0mcuoYRfEy3kVqKRc+8zLLqo6eWDQTRxrSUct407g+M=
X-Gm-Gg: AfdE7ck8qurdEulrnoUTPJgPynm8N9137K4XB6u8lpGt0WUXJ67r6I0JSMpd494wWpx
	g/xAMevnHu3OLwZh7fqHCjLxnxqkIZLNAVY3QF2ZJGRpQnWwfyKMZxGkBcIicJjFITaRqoGHXJv
	7Airyw4xpq5gJwQO8NDrmlrlaYxeUu7mtO+GWLFw18E8nk/aqOoYMo1ySbbXZSDU/G2FwLaDfNN
	/2OJH53b2LkqDnstAFCWPRB61EImUUC6FoGthoL1qxAIBZjOduRwppHAkDkFYlfijV7B2swkgVt
	3Ua/52yBsTo5lrQMFHkBTTcN0Fk63ldhopWdNPHwV79eebSY/2KmQHbIV/YmgGtXWDsbpN6bEr7
	HolTnaXKVg2Ift0UY0P+FApFvTo8xJVFBAcVDm1jVxFVXUm4Wbl28yLi75wbc1OEvSAXSqTM=
X-Received: by 2002:a05:6214:4710:b0:903:12c9:cba6 with SMTP id 6a1803df08f44-90312c9dcb8mr32500716d6.47.1783701099176;
        Fri, 10 Jul 2026 09:31:39 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm44753226d6.16.2026.07.10.09.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:31:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiE8X-00000007Xks-3Vyo;
	Fri, 10 Jul 2026 13:31:37 -0300
Date: Fri, 10 Jul 2026 13:31:37 -0300
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
Subject: Re: [PATCH v7 1/8] mm/hmm: move page fault handling out of walk
 callbacks
Message-ID: <20260710163137.GQ118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345361483.660027.16455119612963295072.stgit@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345361483.660027.16455119612963295072.stgit@skinsburskii>

On Tue, Jul 07, 2026 at 12:46:54PM -0700, Stanislav Kinsburskii wrote:
> hmm_range_fault() currently triggers page faults from inside the page-table
> walk callbacks: hmm_vma_walk_pmd(), hmm_vma_walk_pud(),
> hmm_vma_walk_hugetlb_entry() and the pte-level helper all call
> hmm_vma_fault(), which in turn calls handle_mm_fault() while the walker
> still holds nested locks.  The pte spinlock is dropped explicitly by each
> caller, and the hugetlb path manually drops and retakes
> hugetlb_vma_lock_read around the fault to dodge a deadlock against the walk
> framework's unconditional unlock.
> 
> This layering does not extend cleanly to fault handlers that may release
> mmap_lock (VM_FAULT_RETRY, VM_FAULT_COMPLETED). If the lock is dropped
> while walk_page_range() is mid-traversal, the VMA can be freed before the
> walk framework's matching hugetlb_vma_unlock_read(), turning that unlock
> into a use-after-free.
> 
> Split the responsibilities the way get_user_pages() does. Walk callbacks
> become inspect-only: when they detect a range that needs to be faulted in,
> they record it in struct hmm_vma_walk and return a private sentinel
> (HMM_FAULT_PENDING). The outer loop in hmm_range_fault() then drops out of
> walk_page_range(), invokes a new helper hmm_do_fault() that calls
> handle_mm_fault() with only mmap_lock held, and restarts the walk so the
> now-present entries are collected into hmm_pfns.
> 
> No functional change for existing callers. As a side effect the hugetlb
> callback no longer needs the hugetlb_vma_{un}lock_read dance, and every
> fault-path exit from the callbacks now releases the pte spinlock on a
> single, common path. This refactor is also a precursor for adding an
> unlockable variant of hmm_range_fault() in a follow-up patch.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  mm/hmm.c |  118 +++++++++++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 75 insertions(+), 43 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
