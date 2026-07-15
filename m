Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D06C3B47FC
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133582; cv=none; b=F23NwJrBwpIOEhk8HdfqGlO2lLNhydWm4rggS/51imA7V1q5ggazDZ7lh3HVNQIbVo4jw7ppsgmeM8Bfleqb9wGzZLJLZfNb1h/XYWXPWEg1wiROKB0pj4CIPx9jdVAP1z7XMWyrHVDDdsxSDq/iouGiUYzUaLKHN/Epgu8GBgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133582; c=relaxed/simple;
	bh=G4wqe4OD41MRjFF6wLLEL5vW+yPd/9CHRf/8/z9uJAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoM8Z6dF38BJbmtUZaTuXE3ccbm7Y7rg7h4sQY9TKlGVlAI3Am3NDA8vXT0r6dUW5mwACU6RNkywutQbYHjxFxPZiQrh0W8Ca3ktS9x/qtV3iCaWMS8Y8JOS/E3qw5EV4ZLxvjFlitv3hy4bf9qxOvNzxvDUjVgIj4H23lbSBZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TH+puIl/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TH+puIl/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso745985a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133581; x=1784738381; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=or7RxpRNzsjVzPQB5YJNcUrM8L7o9Zk9H3H5s18AhOk=;
        b=TH+puIl/QDSLVfP1AAotOhqr1o3PwF7yWtDYaHTS5AM96VmDTHNvjHsgvipRA+Duxx
         Lqm8BlDHaa0OOcjsXiFyhjeZb2onFANkyls896m3T2ODk8Ug6mBpz3FSl+o3Nz7ZKvu9
         CiI22bz+Blsqe10eHyuQ5mw3yzSx3w/k5uBeRn9B10GvutQxCVAYVF9jNhcSuWKRVJxE
         R5nxzsKWslNsUVrLkXCSyUJMIO9UeB/yeoczMPNILIzf2l5oxf9ZDvqX5h8oyXApa7Zv
         +eiUHt0J3FUk0lIUvKzL+CV3uUlSZXGUJF+04TVsDv8eP6XqMttJx/a9raT7cS7xtdtE
         3e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133581; x=1784738381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=or7RxpRNzsjVzPQB5YJNcUrM8L7o9Zk9H3H5s18AhOk=;
        b=BIoohiOgX3Ljhd0qh5s49njUnJCTw6zqbINSKPHtadEtzwfqhRLOoTyCdtr5QnMAOK
         TLgipivEWdI7McMEnODF3dT88nb0eMp+1Rjh/UKTccsUkE4eDRPKtkU4zMXAF2y/TWTd
         pPos5H3DPMxeCnGlhjGsQAsdXsVj8mudOm1fMFBYsD1jjF2EErKmrZk2of7Uh95u+sf6
         rKND6aqblUr262Kct+lE67VMLpCzFktlpIHcyn8H7RScCfAufmNwXF2ECizCKDPPgpd5
         kGs+/kM+sMl7Qtdut9H99BR9DtOSV3Rh/2N49C56rIc5qX6Jw07DKG/JwX6+cJJsqbYA
         XzSA==
X-Forwarded-Encrypted: i=1; AHgh+RoF9Pms5uRayBu8Hj8UhNCC7iHB6pFrfk41OCa7LGy3QFUSLs9660SFnAE6Kwvx468bEBSvAL4wEFTtv6jHb/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0hZiAgONBVPzIOfOIfIn7WYRgYJBSrxsPaMdUrBiStdHFnco
	emhRvlWocrf55H9D4bSTkox6fT+c14Ub0U/U2yMI3Sy6QmcAUEOiKFCW
X-Gm-Gg: AfdE7cmzeeNP//F8UE3mU/1eC8Qz64wHRnTy/uww4qPV+ewFVsVa92doqa7AU5PkFy7
	fCVUPrA60YVc9P0gE2d+BYdKCbdvG6zqqPvi/XA4X1tIqtDmzKEjPvgXq36jH5dXLuBX4U/42WF
	RmOgRUL/+7p73tkVZrEQEihT/dnZ7Ot7e/nMjXA89Jp8//091nRs830FzrdVOVz235MSIXaOYjO
	Sc9294lTdzg6TosTVEDb1GNNsk27u7OpEw2VCE/DWNF5R6xZDB/9G7ZNHaYRFmIv8GpYgGLcNwF
	LwjgBqhBXKF9tucDrmNfBs6Z6gT7pBbo5Bbh7ux2WFglKWbnz17OPqvkaoFIebUXG4mVOXI3w27
	g7Prk5rtA7Nw6wela2rpRGw6OKnsdnSsAiIoLpA2Wt25tapGCln+S49hTZkLtgS7MFMvCZO1LIp
	iZJuTY9L9NN61hiBPIg7Pu//K1GVtM5GTUnYVohun0/9tqcxXDh8bFjn4CrC/YNWA8yQ==
X-Received: by 2002:a05:6a21:7785:b0:3c3:682d:9fbb with SMTP id adf61e73a8af0-3c384b91e5amr105261637.21.1784133580580;
        Wed, 15 Jul 2026 09:39:40 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258fd10d2sm486006a12.16.2026.07.15.09.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:39:39 -0700 (PDT)
Date: Wed, 15 Jul 2026 09:39:37 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, airlied@gmail.com,
	akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
	dakr@kernel.org, jgg@ziepe.ca, kees@kernel.org, leon@kernel.org,
	liam@infradead.org, lizhi.hou@amd.com, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <ale3ydkx1xt6ruuP@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alet21wLwM6P_Km2@lucifer>

On Wed, Jul 15, 2026 at 05:02:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> To avoid confusion: obviously please don't merge this series Andrew.
> 
> On Wed, Jul 15, 2026 at 07:42:48AM -0700, Stanislav Kinsburskii wrote:
> > On Wed, Jul 15, 2026 at 02:41:43PM +0200, David Hildenbrand (Arm) wrote:
> > > On 7/15/26 00:21, Stanislav Kinsburskii wrote:
> > > > This small fixup series applies on top of:
> > > >
> > > >   [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for userfaultfd-backed mappings
> > > >
> > > > The first patch updates the HMM documentation example to make the
> > > > mmu_interval_read_retry() state explicit: callers should use the notifier and
> > > > notifier_seq stored in the same hmm_range that was passed to
> > > > hmm_range_fault_unlocked_timeout().
> > > >
> > > > The remaining patches adjust nouveau, amdxdna, and drm_gpusvm users so the
> > > > timeout passed to hmm_range_fault_unlocked_timeout() is treated as a relative
> > > > HMM retry budget. These callers no longer keep an absolute deadline around
> > > > their outer driver retry loops or pass a computed remaining time into HMM.
> > > >
> > > > This keeps the timeout scoped to HMM's internal mmu-notifier retry handling. If
> > > > HMM succeeds and the driver later observes an invalidation through
> > > > mmu_interval_read_retry(), the driver retries the operation with a fresh HMM
> > > > retry budget.
> > > >
> > > > Changes in v2:
> > > >   - Kept the nouveau outer absolute timeout around the
> > > >     mmu_interval_read_retry() loop. hmm_range_fault_unlocked_timeout() only
> > > >     bounds HMM’s internal retries, while nouveau faults are handled from a GPU
> > > >     fault worker, so userspace fatal signals cannot break an endless stream of
> > > >     invalidations there.
> > > >   - Updated nouveau to use time_after_eq() before calling HMM, so the remaining
> > > >     timeout passed to hmm_range_fault_unlocked_timeout() is always positive and
> > > >     never 0, which would mean retry indefinitely.
> > > >   - Updated the nouveau fixup commit message to explain the worker-thread
> > > >     timeout issue and the time_after_eq() boundary behavior.
> > > >   - Fixed the amdxdna fixup commit message. It now describes
> > > >     aie2_populate_range() correctly instead of carrying stale nouveau prose,
> > > >     and notes that command submission still keeps its broader timeout while HMM
> > > >     gets a fresh relative retry budget.
> > > >
> > > >
> > > > ---
> > > >
> > > > Stanislav Kinsburskii (4):
> > > >       fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
> > > >       fixup! drm/nouveau: use hmm_range_fault_unlocked_timeout() for SVM faults
> > > >       fixup! accel/amdxdna: use hmm_range_fault_unlocked_timeout() for range population
> > > >       fixup! drm/gpusvm: use hmm_range_fault_unlocked_timeout() for range faults
> > >
> > > Why a fixup series instead of properly resending the full thing?
> > >
> >
> > The goal was to get a Sashiko review, and v8 has already been applied to
> > both `mm-new` and `linux-next`.
> 
> Please don't do this, this is completely impossible to track for review :)
> 
> mm review is currently very difficult based on volumes, it'll become impossible
> to manage if people sound fragments of series.
> 
> Please just resend the whole thing at this point.
> 

Well, I followed the guidance provided by Andrew, and I believe he
applied all of the changes, including these, to the `mm` tree.

Do you still want me to send v9 under these circumstances?

Thanks, Stanislav

> >
> > You can find more details here:
> >
> >   https://sashiko.dev/#/message/alaWmUEeIBeSkmO0%40skinsburskii
> >
> > Thanks, Stanislav
> >
> > > --
> > > Cheers,
> > >
> > > David
> 
> Thanks, Lorenzo
