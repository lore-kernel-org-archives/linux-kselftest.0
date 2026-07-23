Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE53E2752
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845357; cv=none; b=F63Z7WxlwLQA/l8P35my4EbHA7gWBBQ+mWvz4dM0wtaUpoRLyy2FBuEk7PFj7O/e8jO5bCwXQwaADSouN1nBpf0DztxI9q+yDFZTc8jpoK+PXAoT08uvFZkxD3wDLGkK7C+6hGaUFTno5h4A4EPNDa1IBFdN67bGBzEVSvGI5ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845357; c=relaxed/simple;
	bh=Wvd75UyM3t5SH/M552skzv7ZTvYbtFThnmEOgAthFuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J18aC0IXRh5MU7ey9U3w+J0GPBhN1o416U106dDQlHD3FrZwPC17yGbo/CvshgmxwyLvGCFsTPe5fvUNKHDslh9DPmtUDRh6uHEVNNfHlnmrejJOLUwxz0JKM2W5oQoyCp80UfegbYyRsf4VBo9duUA7TdyKGtAU4fJSKV3AyvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnhdiESF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnhdiESF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cacb8416a1so11757355ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 23 Jul 2026 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784845349; x=1785450149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=TnhdiESFNVee+/U2SlhG1d5C8d33gpY2U5q9rvR+za+5edsgbVRJ2KygeDUSPGNmwE
         nNL5VWLWBSRrOd+WiAL35Mv94IrHxwhp+nbkF9f50UTB+30QNNu/203dDPg5UvK6gzPb
         +J4XuIJctudBv4vgO6hYlMVEi4zlGu7LV7dVEEj/M7+3sTAQz9gaCB5EHcPzJra4PYXJ
         8eblodvrNtVlOQ21kGfIBcqrv2x/dAZVzb1Tkxq8SPE3zCzMZf7+1W4FBDAY0XDPt83Y
         fJWq+R8rIP5tXQIxBJ81mSegmXIggPxBUFr/tVwAYyLONUnJyv/QkO7K7KoMoQK50MU7
         eUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845349; x=1785450149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzwHTZR2iosFUiZOe0Oy97LjUFogfrOTmiFLxNsdVTA=;
        b=rT9xWhkvxCUA3aTG2OkrmqsWzC8yU+aklD5g7AOz2zJKXFRggr1hSLb+Q/6+N27X8b
         dbVSVvUmQok+KOQXYsIT1oncniLOVLsiKQTVHD1dqt+DBkCTq4xW75SamoO+7DrNpC7m
         zNEALIjsE7ljZ21gP/EaYCbYN54vOE8XI4KwSnxfYOqfTuZyVTg+EG7tLfIlfco/7deI
         Q6JpZNQmWIcxpn0jzZFx2FpRTujafFefOdYCzUIPuD/vmApMHwBmqn3WRCsj6th3dEUy
         gN9dm74BhOdB3BqPUdAgpkkjpn5gNy9TlUFTumUK4/lnb2Bu8988unoGMV1cFci37Lwt
         5hAA==
X-Forwarded-Encrypted: i=1; AHgh+RpPinrr8dasxTAIxm+kQ8whSvhxz0i/EufSNsKUf62SUQuZs48Rn39IAC2KgeTtMQBxwt6y1//UOG3TR41qgNw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9iNFEV+oWR4C554TojfRlIZxhlM145Ngpsl3arN+5BsQ+VN0Z
	nXUBq8TGU6GSN2OTVi6MWLy8JCGFHXg5NvXvLe6SV+qK2j+HFEhlBT2A
X-Gm-Gg: AR+sD13oF9xW+KdqM17qUXhRtx+gTkGy5chR0McwpcIhmixHdh8dU7WMnkQKPiEVJwa
	1VWD97Yv8VGaYSPPZEOxLM6lcMiUqQcwo5Xn6CCbu8yWM5eL6eGT4eDDDoZuKJzyo7OaU3RX8XH
	fPs4jpFy7bJEynQlTGvVOEKgWLTsE8NFT48zzVMepP3emDtuenb2WnIRswH+Kcoe5E15WpjG1Q0
	NoMwt0dLtznsrTcGlWG6OmhPQ3/8xbGffNjLJwQDx57r/Xk3HZpazwfuSVCeGd+Ddwe0mg8Pl0w
	cKao9/icu5QGclwAQ6I09fF5YBNbFjIKxSu106olq3YWcSo0LHO82fLCTH8sCHlon5lCIagccZ8
	E3/FfIYp5DGOd0sIwSZ3eBjqPvb2cIO9uAiYexQgzRZB7kPXKBWeR6HWBiUONYQiRrt9b1ojWdA
	Yaz6eXje4Bev+hkQqHHOKM7W75h5SJ1TFos2rmoNJMx8Bt
X-Received: by 2002:a17:903:90f:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2cfa6c793d3mr60755125ad.35.1784845349134;
        Thu, 23 Jul 2026 15:22:29 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f38757esm40198575ad.75.2026.07.23.15.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:22:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:22:25 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-hyperv@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH v11 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <amKUIWpMfVS6OFkQ@skinsburskii>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
 <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723142242.5d3f87208d47819d873ae458@linux-foundation.org>

On Thu, Jul 23, 2026 at 02:22:42PM -0700, Andrew Morton wrote:
> On Thu, 23 Jul 2026 10:36:32 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> > 
> 
> Thanks, I've updated mm.git to this version.
> 
> AI review suggests there may be some problems.  Sorry, I don't recall if
> these were considered in previous versions of the patchset:
> 
> 	https://sashiko.dev/#/patchset/20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com
> 

These look like new findings, perhaps from a newer model or review prompt.

I do not think they apply here.

The unlockable path sets FAULT_FLAG_ALLOW_RETRY only when HMM provides a
non-NULL lock state pointer. The legacy hmm_range_fault() path passes NULL
and therefore does not opt in to lock-dropping faults. Fault handlers are not
supposed to return VM_FAULT_RETRY/VM_FAULT_COMPLETED with the mmap lock
dropped unless FAULT_FLAG_ALLOW_RETRY allows that, so the NULL locked state is
not expected to be dereferenced on the legacy path.

For the FAULT_FLAG_TRIED concern, HMM is not trying to emulate GUP's exact
single-address retry loop. If a fault drops mmap_lock, HMM has to restart the
range walk because the VMA/page table state may have changed. Resetting the
timeout on that path is intentional: a lock-dropping fault made progress, and
the timeout is meant to bound mmu-notifier retry churn rather than the time
spent servicing faults.

Also, the newly converted HMM users are not using this path for ordinary
file-backed page-cache population, and process-context callers can still be
interrupted by fatal signals. All the existent kernel thread callers are
capped by a timeout.

So I do not think this requires a code change.

Thanks,
Stanislav


> > 
> > Changes in v11:
> >   - Reject unstable address spaces in hmm_range_fault_unlocked_timeout()
> >     after taking mmap_lock and before walking page tables.
> >   - Compute the remaining HMM timeout budget before the time_after_eq()
> >     check in drm_gpusvm_get_pages() to make sure it can't result in zero
> >     and lead to infinite HMM range faulting loop.
> 
> Here's how v11 altered mm.git:
> 
> 
>  drivers/gpu/drm/drm_gpusvm.c |    4 ++--
>  mm/hmm.c                     |    6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> --- a/drivers/gpu/drm/drm_gpusvm.c~b
> +++ a/drivers/gpu/drm/drm_gpusvm.c
> @@ -1422,11 +1422,11 @@ int drm_gpusvm_get_pages(struct drm_gpus
>  	struct dma_iova_state *state = &svm_pages->state;
>  
>  retry:
> +	remaining = timeout - jiffies;
> +
>  	if (time_after_eq(jiffies, timeout))
>  		return -EBUSY;
>  
> -	remaining = timeout - jiffies;
> -
>  	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>  	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
>  		goto set_seqno;
> --- a/mm/hmm.c~b
> +++ a/mm/hmm.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/mmzone.h>
> +#include <linux/oom.h>
>  #include <linux/pagemap.h>
>  #include <linux/leafops.h>
>  #include <linux/hugetlb.h>
> @@ -806,6 +807,11 @@ int hmm_range_fault_unlocked_timeout(str
>  		if (ret)
>  			return ret;
>  
> +		if (check_stable_address_space(mm)) {
> +			mmap_read_unlock(mm);
> +			return -EFAULT;
> +		}
> +
>  		if (timeout && time_after(jiffies, deadline)) {
>  			mmap_read_unlock(mm);
>  			return -EBUSY;
> _
> 
