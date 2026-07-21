Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A633065C
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784652576; cv=none; b=pLEoS1Z8c4dInPnjRs08scwoLILFuTX7UTGN14+WQ2uTCiAKdNCslT4WqGp2pB+5CWDyM88d0OqXpTdOPukA+AViatMaFFJYaw7ZTlawSuvwd9A8Y+KYel1sY8U3YNvRMlrtAQyB2txPe+zzHr61uLH66DxmYwE9s6jaN4IrSNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784652576; c=relaxed/simple;
	bh=1Eewe62A+0W0Tj8OlkqWwebX8DuY99PcvPtXyaE4KnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcyLMMKIlQhINbbTZ0urAqJa0655LhFBUL49XM9YtHTCWSoKMByPwDOFOFLpxs1WjPHzk5B261Knn2wvw0r/eHtXqfBiLZsAA2bSzPicmEqwQamD8PCtmG46ZDQOFRz7yUSIErdKAk49+FzkTkv9I8cxGOwJGwLQHJx6A4YrZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3dVJ2T0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3dVJ2T0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84874b52eabso10900712b3a.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Jul 2026 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784652574; x=1785257374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
        b=X3dVJ2T03PUCWc2hQlcjesoleW222Gl/XDcL9L/y2HmrUNhA4ZQR6uAiyQqwNTSuDM
         Og79l0p0EGCO1tfaTNwp5Nx+J3Kpb3Wmb5ttiaVoU90tTfsSxicuXAG8cETB7LwMSwoH
         KTFvd1BJI8i0GuI7rCa1J3suSYPLcncxpd8VsjlmMDKwzEJ8Kpqw4XiNcSECCCm1+iDe
         GVrHOJMTU6DOUEh2e+8jTbuSCCtQF4fDZx6RVjKIjNv6xE0bt/rspSeZqUtbBPZ3CZ6k
         gmkrg2dLDUXicwewJrKyX9WJB/BEG3rHqjr9lzjZrFEO4TvMy1jhK7c8MCBEJTKnakl6
         cclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784652574; x=1785257374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jz3tCmNLomhxeSHRRM/RsgqxQHXL6/1WUZFNVLX32Kw=;
        b=kwvRXxM/YID/mNQcTvYomRAC5lRsorBq60bWEgQuQlKHSHqB43r59Ftf1bjL+UzUZy
         0dbb2N68Oejs9gXlJv5l/E2enA8P1BtgclA45nBF5cGFlBoiEudaNc0aBWmLwWg59pcc
         vRhPHlmmToBwaGNo/bvs6xXd75txfFIcQtL7v5/I+iFKQrqi17dEzZd11onY1DbFBv+n
         rxJ5l+b6EnGAdK6GIFuNl+KT+dbaiWuI/BO2QfoTmMG4T3nuq5oVITf1ZAZkn5q/xVi6
         CgiiBrr614xlg4Vnu1Fvzo42P9+j1Zxf5HYBB3QpTygeXQBbQUv9WeyUR0/zreQ1h6Ym
         Anwg==
X-Forwarded-Encrypted: i=1; AHgh+Rpeu6CZi/dFyoR+9I1lXhhFZcfKnF7wu6HZxdRrmrnL9yXcg7Xz8I5EataByIPOQXuuVQcuu96bPjkoEpXVmWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvv9Q2O/OxQZ4qtGE+R+QtE+muceBLY0Fazu2Ac3LA22duXhh
	VlsV/403tqIlsz0zilYlN+BsaCCQrpDMury9flzkaiE5VmSNz6QNqj06
X-Gm-Gg: AR+sD10XJzKwFDiE3R8LgPnWIpjtfSsJK5waQgTUQ7vnbpP6aZ3AnZ/Hx1a0WOnBlkq
	4veWD8hFCasEKEfKRhibxzeX561gxjoOuNxD6gC14DGwLPilNpShoB9jMgGjdBpync2knUWB1c1
	T+KLn4ooVUzRy/9IgcQQWEiY7aEx3LE+xgz0b2p75U9BAjaVbuJaknEvDNg//jNZkBSGFluaGvi
	wljONO2WGZTxwEI2uvfJh2JiYZ898HXK1Px1MR4LrfegsyckHhX3JhoSxTSbcUpImoJobN8yzXH
	9s1FsvfY56KwnJKk6xAMueF2jmkuOb0sqpyeolByBIR4Nb6LZwNdnoWBDxGqBObyoKspbniisXh
	mG6OULCM+mUfdNXgQiarUIrzn/o5KApCTRiCjhZH5wxDHOJYGtQ5lN1BTJ/YRQFnpIxBnsygWPP
	b3u/cIhPJgbZFRIGYpx3eWBACJ1KY46D8rLapLb8K0Ddw8
X-Received: by 2002:a05:6a00:cc7:b0:848:6f5c:a327 with SMTP id d2e1a72fcca58-84c29270ea2mr18663190b3a.15.1784652574553;
        Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm5186b3a.44.2026.07.21.09.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:49:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:49:31 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, decui@microsoft.com,
	haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
	kys@microsoft.com, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
	lyude@redhat.com, maarten.lankhorst@linux.intel.com,
	mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
	nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
	rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
	skhan@linuxfoundation.org, surenb@google.com, tzimmermann@suse.de,
	vbabka@kernel.org, wei.liu@kernel.org,
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v9 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <al-jG2fROgMWUq_T@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
 <178413936536.1155966.8918127042760531802.stgit@skinsburskii>
 <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed2043b-88e7-4a86-9efb-fe788191e8e8@kernel.org>

On Tue, Jul 21, 2026 at 05:42:53PM +0200, David Hildenbrand (Arm) wrote:
> On 7/15/26 20:16, Stanislav Kinsburskii wrote:
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> > 
> > Add hmm_range_fault_unlocked_timeout() for callers that do not need to hold
> > mmap_lock across any work outside the HMM fault itself. The helper takes
> > mmap_read_lock_killable() internally, calls the common HMM fault
> > implementation, and releases the lock before returning if it is still held.
> > The timeout is specified in jiffies; passing 0 retries indefinitely, while
> > a non-zero timeout makes the helper return -EBUSY when the retry budget
> > expires.
> 
> The timeout does not / cannot affect how long we might be stuck without the mmap
> lock in e.g., the userfaultfd handler. And also not how long it would take to
> actually grab the mmap lock.
> 
> That's expected with the timeout, right?
> 
> [...]
> 

You are right. Ideally, the timeout should account for the time needed
to acquire the lock.

However, this timeout is not strict, especially with userfaultfd. It is
more of a sentinel to make sure the kernel does not get stuck for too
long and that progress is being made.

The default value used by most callers is 1000 ms, so accounting for the
time needed to acquire the mmap_lock does not really make much sense to
me yet, given the sentinel goal.

Thanks,
Stanislav

> 
> Nothing else jumped at me.
> 
> -- 
> Cheers,
> 
> David
