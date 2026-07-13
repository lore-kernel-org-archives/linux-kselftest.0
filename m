Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B1F279792
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962087; cv=none; b=cbQHCXyJlrom7nAopljNb2MYwsq2Bc2TCB+nox/O/naCgG7qP1PhIwVq5P37XQZqfbN/BklJRWhnEBZyBXKs9vEEaRboMA5vnQkKfnOuwqYt+bWwWxobIYUPpn0qHSFy+5AhRGDIyXzr9BhW+h5czKz90vKT8pHMmGt11k+iOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962087; c=relaxed/simple;
	bh=SqPTyIhNXXnGeYnJM9ztptY4dZp2tvlRUebzoP8AMpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfRpnLtwGG7jIbr2bCv5/Io0j4ljPyc5v38dLGXPy6AUpxt7KeW0tnp9b8vkF0Fo0lvOIOzcoadyGlN0C6ZkltAAQ6paF0RCZTl73xTwN2oEBNIwZUXQnHZt4F18U8ddwA3v8myBb+DeJhG0JltePiKjG6B6W10ZyNPC+IqBq+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkhOldmC; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkhOldmC"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce9e39fccbso887955ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783962086; x=1784566886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9LV+16tD32KS6yXCzCBkB0u2lL8SNr6pDg+a+HPC20=;
        b=AkhOldmCDDLl6AWrOAH2b4PKTeRjNceHNnP8hN2To4OzZo/dmzYg09EBRQ3/kR4/Xp
         TOYV6mNhKy2x/GMEqloSARoWonpxnlEzKaj/yZoJ0JzZlMyn8oyoGBQy5aUZrNHC+aui
         ReaybeVbyIieMUdbUBfF2G44VVLzOZ0gilHtNkFeGXG/KyCEvZHRZKbzyqUnDHP8O6d/
         Sfh0lzrb5T+VFSVQajjx2HY/kA5rh+DCPORYWO372r2nXBV9+rkzJTkxWBzfIasEeE5Z
         MZpSC10KcG8GTdXC0/Z39118LkAj5g0qDKa8anHxoLyqTYpCz1w+LNjoAFqNTrXFVUJz
         xrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962086; x=1784566886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9LV+16tD32KS6yXCzCBkB0u2lL8SNr6pDg+a+HPC20=;
        b=KeSD103TI4lJZacMRzoYpKTl+EAjqoNzoL2/kgS/HAsHbHPxozcAknhec7BNELSl8/
         MPwMGMs948Jdn+bqlFT3sU8Q52fb8PkAqrjmb08DnP7jgfjQ13AjoqCkQBjF5xnfZqgz
         er8xJEFmpgivWsMcopNi18Onwntf2t5w66BtTWQUkRmI0mEU2zG+Gy87uovNbRLiAFEo
         zzECwUQH1vFEt+anJfDD43MVPKP1nMMgSkkzFUylaFzLwM0LREFYBJ9Jyyca9Ub1+zjx
         fNkrhygKNYPQ4MXZE9Dm6grnX1lWmvxKIbdmaOvTwg2fbWSAI0pfjCfPZmuuAo2qRaKC
         zFgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjlOLJgNmlkcVDqs6bZT4pWQp+oPCAdnCfFYOxXVquKKdKwnoLY6CDQXuohKX3QrCa5vKyx1IEIA8IIYyvVKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvVWg7t6KP7f7YZpnep5B8rfUazCJU3bIONnSjLYw+GRnAatb
	6FPv7eVTKIcInbSmB5Lzwgrs1ECNp0/N3AsCzFysz9GPAB6ByQkE9Qp3
X-Gm-Gg: AfdE7cldjwH/ElHbgslwRDK2SBp6/OOgGsYUkxJfNOTz5D7XJP+8POqWZ4zsloqvsnk
	IcRzE+dp45DOtarGsXDT94mBIe64L9r7ULgzfnucAyhCMvzTL2Qdsdak0fyMGzRAWdi3jllA5JK
	tYvvmAV/sbvGCCaXW7UcPUw8FNDu5MmUht1yvnyfKOQBQS7Y35G+7DcxPeCyRdnasHKoj+zKmYo
	Vqdd7rHZpq1cI9oNk5+vXrr36YIIbzkhSpsrt1FnJkp2V/oJFX/CLgyxtVjM/OEMcAoghQbzCJr
	c2TJy211zOTTlxcc7rBBFAVnHkz/s72+xfNoFuBzuwV7YyJO45g0fl6apW5f+QF+86AL/IHNt7P
	KrswAUL1F1vcQ6T5g9CrncKXgtTWpZ+64etvhTx87qVw0VupSUaESf8DR8hlJ3Ep3Z3uBtdOL5S
	D/t0cRfHRbgrg/siOiA/Av+YMcI2et1EkeufA8hJepOmXrk7AUIzA3ukw=
X-Received: by 2002:a17:902:e88a:b0:2ca:de3:15d7 with SMTP id d9443c01a7336-2ce8292bad0mr123460335ad.16.1783962085860;
        Mon, 13 Jul 2026 10:01:25 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm102224465ad.65.2026.07.13.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:01:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:01:20 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org,
	decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca,
	kees@kernel.org, kys@microsoft.com, leon@kernel.org,
	liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
	longli@microsoft.com, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org,
	wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v8 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <alUZ4NQptiD9fRfz@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371883977.900500.2198446134676328631.stgit@skinsburskii>
 <alUSq0o7CC2Pnr+H@gsse-cloud1.jf.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUSq0o7CC2Pnr+H@gsse-cloud1.jf.intel.com>

On Mon, Jul 13, 2026 at 09:30:35AM -0700, Matthew Brost wrote:
> On Fri, Jul 10, 2026 at 02:27:19PM -0700, Stanislav Kinsburskii wrote:
> 
> Please send series like this to intel-xe@lists.freedesktop.org list too
> as this will trigger our CI which expercises the change paths changed in
> this series.
> 
> > Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
> > then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
> > MMU interval notifiers whose mm matches the mm that was locked for the HMM
> > fault.
> > 
> > Use hmm_range_fault_unlocked_timeout() for those faults and pass the
> > remaining retry budget to HMM. The helper owns mmap_lock acquisition and
> > refreshes range->notifier_seq internally for each retry, while GPU SVM
> > keeps its existing driver-lock validation with mmu_interval_read_retry()
> > after a successful fault.
> > 
> > Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> > called with the mmap lock already held by its caller.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
> >  1 file changed, 7 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 958cb605aedd..6b7a6eaebcd9 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> >  	hmm_range.hmm_pfns = pfns;
> >  
> >  retry:
> > -	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -	mmap_read_lock(range->gpusvm->mm);
> > -
> > -	while (true) {
> > -		err = hmm_range_fault(&hmm_range);
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > -	mmap_read_unlock(range->gpusvm->mm);
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +					       max(timeout - jiffies, 1L));
> >  	if (err)
> >  		goto err_free;
> >  
> > @@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  	}
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (true) {
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +				max_t(long, timeout - jiffies, 1));
> 
> Unaligned indentation.
> 
> So I'd write this like this to avoid weird wraps:
> 
> ctimeout = max_t(long, timeout - jiffies, 1));
> err = hmm_range_fault_unlocked_timeout(&hmm_range, ctimeout);
> 
> >  	mmput(mm);
> >  	if (err)
> >  		goto err_free;
> > @@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  		return -ENOMEM;
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (!time_after(jiffies, timeout)) {
> > -		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -		if (time_after(jiffies, timeout)) {
> > -			err = -ETIME;
> > -			break;
> > -		}
> > -
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -		if (err != -EBUSY)
> > -			break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +				max_t(long, timeout - jiffies, 1));
> >  
> 
> Same here.
> 
> Nits, aside LGTM.
> 

Will change as requested and send to intel-xe@lists.freedesktop.org next time.

Thanks,
Stanislav

> Matt
> 
> >  	kvfree(pfns);
> >  	mmput(mm);
> >  
> > -	return err;
> > +	return err == -EBUSY ? -ETIME : err;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> >  
> > 
> > 
