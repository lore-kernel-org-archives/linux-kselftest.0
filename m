Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30C3FB7C7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702981; cv=none; b=PzdvYOWL8tp1O+w7b6BBqMTMMoVn59q4F/bwHtsNNCu7+DtgxgMN2NRfwUGwirJV2PHmfjawKh7P9ZhdxB2vc9mylys95yyzJfdTgbw4cobGcSLuUIzqtHfOCCL5FGp95+CX1VR4yN0YVOv0fZvatiLrZK8a2Vu2TBxI3DkdbWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702981; c=relaxed/simple;
	bh=aBkOaovDmCOVZZHolmZ5nommSM2U/0R+0JcIuWJu4NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXH4IIhfArZUtsZFDiVfYNJMhuGCB1mB0WqhLhaFZJFQJaFKVImKLqa1MlsTA8rqDqVOwkA0IyxkYVOLAhm2rKc2BGbet4MrOX8nrpeWeURAXxrnviCr/zoPZKdudAOTnXcWJaW+EDYLpzwT+VaBl6wQmVBEfkGlUv3gq+Gzhm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUF4YcaC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUF4YcaC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84864b41100so975275b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 10:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702980; x=1784307780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJt4dduVMLAOIcmpuYMBgvu3eT4RLvOgifRZbg/Z4kQ=;
        b=VUF4YcaCCCyInq90IWtdRjj5gOkVjqBxg2VY1I9myy1ULGQmo/0AQk4vfAcFMi6nD5
         ThuFDH43hsenbYxtB6HjzqwbXG5AYWA3fjxbseKR5eSxUWP0lzGEraIgM8j8UcPNZdwm
         pnbiNqd2UpuWKAiny+ZPCBg4dqmKom3clt4LG3Jo2wUmURS7lwYJkk50dG1hS/UXXtSO
         HRq7T88j7iw+q4FgAeiYCOTS4Gu0dBXaZXV+RhDMRcOy1JU6fLkAP6y7PQtdCKS8k469
         YHNqxLS7B3BN1nWUTLwxkTOIwLUU+Wzhy622XHjyOHvlilT2phaR0UyPuLRuSkHjY7Tj
         0YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702980; x=1784307780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJt4dduVMLAOIcmpuYMBgvu3eT4RLvOgifRZbg/Z4kQ=;
        b=ftIhBOoi2sa1YR3LVTCkmwKp6tdtm5ySnhdhgD7FMrtJ2o+AFDyqNtmvK7wdP6zfvh
         q8cHjPEAsG/GId0hDsQqGlMoHu9kjq4fO7iC3y3MSNu0lDd5oyS4SKhj6WJT/4XuAQko
         9GkFpwuIifJZEY+rWAp9eD+sdPoolJRYhydkA1Ooq5FEUAJrkOoI8+VE6l6AtPvXqMUP
         FS5GOFqF8qWqf0O56MuFJXGdVsh+A+9XOIv9fMeaLUBiUp29NEF4nmicZUhHK2I0ts08
         SzuttPG0k9PfizwZgUZnvSHHvkvyegkFsHqj1fsvzjXMlXIOrGgRxDSCPH31DWwuFWrw
         u9zA==
X-Forwarded-Encrypted: i=1; AHgh+RooBPCy+aZDbjUpZoXcPP3hyfZUC8hAfuNaXZHhpcMdUz//65GsMIluUIYmixsERHcU4M8nbXr2Awhw771uKc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL84hg9+uSthDIaL4xRva7eJHDzB0b4OFgFU1QHEnP7dLYpQsk
	58YmU/MR8DhlqS2N2fPfeQ67+XOni0HCwHqgdDmIxDX4oTruYcxD7z+E
X-Gm-Gg: AfdE7ckunMzGB3RDW+rOphjA8OLiqUJXIPc3pI8na4ANXstMeS2Qm+4Pb+gL1Oh46rO
	VwD/i2dLTocInL5lltk8A8rNIlIU4NvU8pirE1iuacyg6qowoqrv8fP1E/DSAgMmRY6R5odxj0P
	QfCnrgPRvOmoVX7yVkg/JV3P6+3BBIrKsN2MEQFoB8jBnuTxH08KQrfsvzlTolk9inEuGjzCqC0
	9viAm3XU5TvdttMV2U7d+ybJiQwBIzQZjQ62upAfVXDqZeozEUfRWs4UTZrKq4fj/plDBwuv/0r
	HH6OdXqR2GJtxygPCAzR81udKMFe+FcfKSimX/NMkHzhNNgNr5f77+x0ynINKxyO1HheKwMvQH1
	ttL8UNFPRSrYIet7heDvpUdL+h/pnBCxCHmAg+/TDXmA3pRG3zrRDzT8RpJP8cVm/fRdUT9dHXv
	dZA0NGAkcxcGIvWKhX4ietQDvBb9YR3ZAeFX6rRCKJzkfs/UhDYu1Qgu0=
X-Received: by 2002:a05:6a00:1f13:b0:848:6ba2:4139 with SMTP id d2e1a72fcca58-8486ba24522mr4844235b3a.36.1783702979579;
        Fri, 10 Jul 2026 10:02:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484519580csm4394040b3a.32.2026.07.10.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:02:58 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:02:55 -0700
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
Message-ID: <alElv0EKjLQXMNK8@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710164743.GX118978@ziepe.ca>

On Fri, Jul 10, 2026 at 01:47:43PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 10, 2026 at 01:27:49PM -0300, Jason Gunthorpe wrote:
> > On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> > 
> > > +int hmm_range_fault_unlocked_timeout(struct hmm_range *range,
> > > +				     unsigned long timeout)
> > > +{
> > > +	struct mm_struct *mm = range->notifier->mm;
> > > +	unsigned long deadline = 0;
> > > +	int locked, ret;
> > > +
> > > +	if (timeout)
> > > +		deadline = jiffies + timeout;
> > > +
> > > +	do {
> > > +		if (fatal_signal_pending(current))
> > > +			return -EINTR;
> > > +
> > > +		if (timeout && time_after(jiffies, deadline))
> > > +			return -EBUSY;
> > 
> > I really dislike there is a timeout here, HMM is supposed to be more
> > deterministic. GUP doesn't have a timeout, what is this about?
> 
> It looks like you've moved the timeout processing related to the mmnu
> notifier sequence from the callers into this helper. I'm fine with
> that, but maybe add some comments that this timeout is helping
> implement the mmu notifiers, and we do expect that the HMM part will
> not timeout.
> 
> Though it is a little hard to see how your stated purpose of enabling
> userfaultfd is going to work, aren't you pretty much guarenteed to hit
> a timeout if the userfaultfd process is adversly scheduled? That's
> going to end up broken.
> 

The main customer for this new feature I have in mind is the MSHV driver
which backs VMs memory with HMM, requires userfaultfd support for
post-copy live migration and fast restore and it doesn't timeout.

I agree, that this current timeout value used by the other callers might
not be enough to repopulate the mappings with userfaultfd, but there
drivers would get -EFAULT for uderfaultfd-backed mappings without this
change anyway, so getting -EBUSY with the change instead doesn't look
like a significant change to the behaviour from my POV.

> So, maybe the deadline should be resetting after every handled fault?
> ie the timeout really is only about the mmu notifier and we don't
> count the time spent handling faults or walking?
> 

The timeout was inherited from existing HMM users rather than introduced
as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
budget for the whole range population operation, including HMM retries
and subsequent driver mapping work.

Moving retry handling into the unlocked helper would otherwise hide
repeated -EBUSY returns from those callers and silently turn their
bounded operation into an unbounded one. So the timeout argument is
there to preserve existing caller semantics during conversion.

I'd say it's up to the caller to provide big enough timeout for
userfaultfd to succeed.

Thanks,
Stanislav

> Jason
