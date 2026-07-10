Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310ED224234
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706596; cv=none; b=iJE93jmxJ3WIz1A2DKKJbH5w0NmRRV0hm6NkOWYRaREAvlNlOQAaY+XoTQeEqdVud0AUYTFcBp3qB7dKaAb+RiS9y9FaKP8zyDjJjPknvEXnD7wjJp6dRrwPfAgVNdEkz29PALbpAj1A1zplHjz8YGkQk0A8sgztdVBvIj0vBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706596; c=relaxed/simple;
	bh=JK0Z967O7a8Bl55D2zvwLZqTqZpUiSqVWqaZiixu9aY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyYLlmjAaBDrKu08alk1IUO6un6ucG0FHcCtAJjoylW54+fimuUjbUa0DK942xhbkAd7F4DwblbOIKwqspiWurBtJTJZyIwLN3Nsz14E/2SjNQ8/H41SMS199azMp+pjFYgB0dgViBTz2f1OVVhx0+gkFu1PwYz45hvT6JDe3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XwYTQHDC; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XwYTQHDC"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfbe05683so7212431cf.2
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783706594; x=1784311394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=XwYTQHDCXEb07KED5ajRKK6taRPykEMNgPlbxgCoJ4mfSIU0+sBiMJHRZvdL3kDHT8
         WQDYq82uKGVSKALSD9uEckizEuWQ2DNoYU63JJ+9rkYmF4JV6xkEWtvhkBJBR7bOI8Ve
         hdLqNf/imepRfwD/zhfXO415m1vIlJmlKR/Q8WaW2vExCXpBIfva58QADaj8xAfogDMx
         Nmes74qpwPyzJV1r7mdIV8ROCQq1aSF4UabkGgEs/994EN5u8W9eaU4JK49IMLDDM9Hd
         JAnfM7tOFwVTmMx0vJEgkpnMbRCPvl8dHdpcEhdItpTA+2L8Ss1sw4xDaMYfAX6TCA09
         Bg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706594; x=1784311394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pchhQjIZYIsHA+IyTP+kMOXOCiYK49mahPv3eolm7bw=;
        b=rhJFvK+RTKFhmPflbMUyvvMlk/aGDirqY0A7f1xaedVQly4Abfphrc4KVxbrw1fY66
         9ZLOScnJv9XywlWzVYl0qo2UTUbjcWwtg1P4MxSs13XxPNnhTZ8/1gMy8QRQSmBmZnjn
         1TE6J3adKamUIDafTHc2/dVikwwsc7Dpnj3KsF7Un01avXU/iTRN8joo+KoY1k0TfWXB
         /WdmOFRYZHtZIggyO8GovcB7r63WVm7cSG48+nnHxXJNJdB8Am5LMApdv40EchSnW5Sp
         g8ZAJ16mWTqTNN0Uqr3Yr5fTsQysu1aKSrc2KHnpmhMGsWQ7a6Iv6TNM8M2ovz7b5ZQw
         Ytzw==
X-Forwarded-Encrypted: i=1; AHgh+RpehBP81Du/DqfcVKs6A7QyyZVCei0IISTk4yHvA7GVFhnX3Nf95CkVzPv+YiyyV+XEdYwDJcJEMyYl9nLivCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTpM0BFBd4mgDa7+BLZRBquYgKcr+JqficWmUez16uVD/s/TX
	EL9/a2kii5Kpp8LeOclWA4alTSuzHZLmroSJ9M3Z+EVjXg78cea4T/wgP868LJOgTrw=
X-Gm-Gg: AfdE7ckHKGrzLI7Id7nVzLOvaLY3Q8Xw8LgRoAx0ncuryZmSsYCE/HQASgOuRZ1AOgS
	Zy4L5AfvJQ9z7TwBNNJnBGuivk5WLz4WDz+VZv23d6+sxUWcEDb/czl7iBAexwBAvL6dZeY1Pmg
	2rI6aK/AY/znNMxF0EVLXwCxtli+ZsWX3PEQp2J2Tef9kHY/hhkEHv6te4edkxh0BgLcr6iR7Uz
	AXr4lrlp42Pah/9PpBjzYmO6HnBB/Xi46bA1WT4H5yxO8BHktXycBiQvfIeQ70uoSahQHxDdgZK
	apsCF3gQzgc/ql18KCv6Gd6G7u2s33Y5V+WPqNkWUJdqjwevD4QvMDM9zo9rAvUOBaS2mlSC36R
	juA3lM277/4zcte5DRhnBgDiPuWGT2UrgvD0Uxuq8yPlyPAXH847esKBrvFoa
X-Received: by 2002:ac8:7e8c:0:b0:51c:7b13:62fa with SMTP id d75a77b69052e-51c8b438c0dmr129494461cf.80.1783706594020;
        Fri, 10 Jul 2026 11:03:14 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1fd2bsm47060696d6.27.2026.07.10.11.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:03:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiFZA-00000007fhc-13JV;
	Fri, 10 Jul 2026 15:03:12 -0300
Date: Fri, 10 Jul 2026 15:03:12 -0300
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
Message-ID: <20260710180312.GD1803712@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
 <alElv0EKjLQXMNK8@skinsburskii>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alElv0EKjLQXMNK8@skinsburskii>

On Fri, Jul 10, 2026 at 10:02:55AM -0700, Stanislav Kinsburskii wrote:
> The main customer for this new feature I have in mind is the MSHV driver
> which backs VMs memory with HMM, requires userfaultfd support for
> post-copy live migration and fast restore and it doesn't timeout.
> 
> I agree, that this current timeout value used by the other callers might
> not be enough to repopulate the mappings with userfaultfd, but there
> drivers would get -EFAULT for uderfaultfd-backed mappings without this
> change anyway, so getting -EBUSY with the change instead doesn't look
> like a significant change to the behaviour from my POV.

It sounds like it won't be reliable either then.

> > So, maybe the deadline should be resetting after every handled fault?
> > ie the timeout really is only about the mmu notifier and we don't
> > count the time spent handling faults or walking?
>
> The timeout was inherited from existing HMM users rather than introduced
> as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
> budget for the whole range population operation, including HMM retries
> and subsequent driver mapping work.

Yes, because we always had a timeout around the notifier because that
scheme can sort of live lock. The timeout was to protect that only, ie
limit the number of notifier retries.

Expanding the timeout to be outside what is bounded by the notifier
retry is not right, and heavy stuff like mapping should be done after
the hmm side succeeds and the notifiers concluded so they can rely on
normal locking instead.

This is why I'm suggesting to reset the deadline as hmm makes forward
progress, we really only want to bound the notifier retry loop not
anything else.

Jason
