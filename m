Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2353747CC6A
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 16:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702129; cv=none; b=pQwWgLB8XNt9mMp6kCtVy0g9Tlf508Fx/Ew8aybNPBNAbmfUz0XhNM4jgtavndWo1LUQKOz9IwcYUWuH5DGskHtOxI92aKNtc0wprYAFTGvUQ7WaZgWn/EPhuWRHStuTu/cqOKjrDPoYJ3A7uRmMW6UEWrCOyuaIhIVTDLWZ3Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702129; c=relaxed/simple;
	bh=gpGH/Q6yZYnkzQY2k0xRm/7mc5sBuLAhp6W6fGmbMLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlDATP3o9fpIQRRCdnHsbKW+aPGwkPXMhW+6pFWuOB0hQDAfDiQbKn5ZRpbKSXIa5C+07tRua5H0qeCpVUenKxx3OnJRfCi2DmVFweVpIalUopp6blkm+h43H8KDgNUY5USHXM2UtADmF7SaIytbqWag1q5ejLIDzonXRxtyuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1WlVrvZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1WlVrvZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8486672f03cso1044421b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702127; x=1784306927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=Z1WlVrvZUUSrvSnSylau+EjoBytzRjh0FvlcvopGl/53I/6TMyLyo0K3jdbTWmkxnY
         CeZadAsfKW8dFZdYQ/lr0S7/oM740hhNxhH+JD8OW0CzgH4Rw/btLC30q1Hu166MhLNh
         iOAA5lxfxwKu8ouM8/DC7ktuG2m/23J210FJXd4R+ZudxAkdEl2raRufro+w0mKvaKAl
         awCBXUYKVSyqm7+TkzMjFogHg2hkoyoy2YLjogT9vwuj8K8/JONbigrkt1aPBLIvV7a4
         D+kmxtgEGOHuZeKwUD1isANdpEM6FY+h+Vo5d8V7eWyMjVHIUgDp0glo4ji1AZBWiBB8
         U8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702127; x=1784306927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/T7cJaVh+vpdnCnVWowF/GJXIiYthZ82xWXxPXNVVI=;
        b=XuED8VX+X9mC6yg2hvkrNnUGDcnyZ66e+ju+cFc/qnJujssSbpH1PlNQRkxwzE2eRs
         Qk1nAYHb/0EPncLT8/dNtPBJidhXi9BucS8o1iPh3tZ83ToxH/nOoD4EV9t86ecv2+Bh
         1GmwSEQBNdrvvMC0RT5tWdJ9nPMZMk2ROiw4KjXkr4JvoQd4TWMnSUT+8kT0/HjrLxKS
         5r2e5FX/b4uOyAUSXwzqkuunNzza97ep6Cvv7VLvbr6t9TVs6PFqLBDlRqsVQgu3gf5v
         nofQbo/8KKxYnTvZfbOFiVC/+2mIrkVVsGVaglyrBRRGgFO/KXaP/QKwO8PXVOLUBNGn
         oMZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCgG/JDDdOTjqNcdmUjiH9WRT2n+pyhYJukfUcVpE4adwgxCprBkRSCq1mLdY8I0KeFAoFip9qHPtHEckj3EM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5kGfQclGJqc2a5CToveP3YZrbYlsb+yqgzjVPmSEDQOoLdnXJ
	GmLGXyRG3Fh5kEF2FwHVswZRSjlCwDkfJejlfvCPy5wrRzVV7uWmrJQ6
X-Gm-Gg: AfdE7cnGJSjsiptN2plDzjOOWRG9q6PKrlW0a55QY2fJustDsze8GzPBEP8K/3sEDAX
	qLNwYIQv50XWxsei0/KPNlFiJNTbZ29nTy3gE9n8FewCbCT8pAN968BhnqKvARYdbQYkr5EeJXk
	xEwgTrV4EsNFuCU7Jqow8LO2Qa+wMMmBIZNk/VoHNubJDJ9Mw27AStoguIC9+KfA0AVIoTO4RsQ
	7DeXtSF7GQHz7OcFSZoBy80f3p7hMxXJbpMk01EzfmCpuaQdEEeO72gihjGMm7DPhDezj1k2xz4
	rvYBmR3erYR7Y83FLYc3ogQqA+++Rmh/3vPJHjTFXWs/hlbdMFXJtdjIcCFH9V7bgV75LRtQNTc
	6sZ/QEuYeZEzr8NmvfxBhP1mvAgExz2RwRut8y+z37TuDndsXBUfjq7Fpjzk3AaJ4VNTPuktmsf
	AZQzmaiuEP4NEgjjGpfkt4s3U+rR+IWwZH3XAiwNEw4YPhmx/d+OVDtzg=
X-Received: by 2002:a05:6a00:6c9a:b0:848:2f7a:2e57 with SMTP id d2e1a72fcca58-848438a63damr12313317b3a.70.1783702127271;
        Fri, 10 Jul 2026 09:48:47 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b609acsm10408336b3a.1.2026.07.10.09.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:48:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:48:44 -0700
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
Message-ID: <alEibBRYmWQvf1z1@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710162749.GP118978@ziepe.ca>

On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> 
> > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > +				     unsigned long timeout)
> > +{
> > +	struct mm_struct *mm = range->notifier->mm;
> > +	unsigned long deadline = 0;
> > +	int locked, ret;
> > +
> > +	if (timeout)
> > +		deadline = jiffies + timeout;
> > +
> > +	do {
> > +		if (fatal_signal_pending(current))
> > +			return -EINTR;
> > +
> > +		if (timeout && time_after(jiffies, deadline))
> > +			return -EBUSY;
> 
> I really dislike there is a timeout here, HMM is supposed to be more
> deterministic. GUP doesn't have a timeout, what is this about?
> 

The timeout was added because this version makes the unlocked helper own
the internal retry loop, including -EBUSY retries.

Several existing HMM users already bound those retries with
HMM_RANGE_DEFAULT_TIMEOUT, so the timeout argument was meant to avoid
silently turning those call sites into unbounded waits.

That said, I agree this mixes driver retry policy into HMM. A cleaner
split may be to make the new helper timeout-free and have it retry
internally only when mmap_lock was dropped by the fault path, since that
is the part HMM must hide for userfaultfd-style faults.

If the walk fails with the normal HMM invalidation -EBUSY, the helper
would return -EBUSY to the caller, preserving the existing driver
timeout loops and keeping HMM deterministic, closer to GUP.

Is it better from your POV?

THanks,
Stanislav

> Jason
