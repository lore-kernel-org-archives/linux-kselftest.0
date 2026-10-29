Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232285;
	b=mCSqnmbi5LzcNrNRzPPRGp/JCr0WJZ4L5jTZ1gcrlq6eQcLrYdZIViqywM0zVRpJiQXv
	 ZFKC3UEO8Jj/vlTL1N35Ls+WZT+5PYl/7LGynHLCX/Aa5Mtix1ecp+NDOpaKPGIZIRChK
	 +5xKhOL581H3UrA3WSTwh+8DFQ2MDasV9yz2r04EOjN34VQuKdYagSxbQ4+5tsQ85g5wj
	 DhzinKLIBXgGs55/woaAgnX7vrBjOi4DIl9iB1mdkivXqrzoJkOzNjP7NgwIYeTAhRkKM
	 GL6oKO06xhbX0LQhg8mTk4Eo7ZYsfUGRT2SMVKZqZ0Q9ZlsA6g0gOQnByl5sL/RaSZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
	b=Qb1hkmJ2JcSNr2Z/P5wP/DOh4HET6EjAnKRtnuMcQPLOnXtBUzMtcCOIjyRiRu88fd6V
	 D7ZWwLMCI2UkAB197yoBAmaHCtvsiKwcVcuwApQqMh+SrTGWJyAMrjuL0gnuDHQSvUkFi
	 GerFgSEHToxjVqrhS5e4gWE0JQx8gn9q3Da0kFyqHkHTzdVol2o5LIS5lFtJWwPA0xwkS
	 EUWRm63rU6R2UY5Zh0RjtPQTyATrTwP7rCa/GZls+w9fCwXAGYEMo7NVRlaUIKsBnwhWs
	 /A9yJmKV9eVAiIVI3zbXs6Sb2YoJnxUf6Ba0is0OWT7vw8SwbXglHYHqhh2r6ZuJSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE0F606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 00:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE0F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=BDLaQPpE
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cbbb7b90efso485126137.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 17:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793232283; x=1793837083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=BDLaQPpEQkC/NOGErHzNgMqNEFgiZW+qixJDZ5RtDffvwjsqxm93mYTldZW4Txe7YC
         KOlzFcRPqQr1N7PzdaxoW1U9MQgJBHjgARqwrgxXEZIU7JNfwIwgLxfO92G6pOC4G4rk
         4OSF6jFiqrA40z8orm3/UNdvF1RJjCFi7ClJV0vWr8MykRtBgdBxnizZAivW6aZRN3kx
         l5uvOty6CRBiTWGUrkgmOuKvd2MUI35gla4/qmesv+YfLyi3mwck9NijjEVz8zhSCgxi
         pcgFazOCNQkh0LbGTfZyXdh3RejNnsqgBCJkWvDATwo+Kuk2B2721o1lMZ/ETjyXrhG9
         LPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232283; x=1793837083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/xBVtBLk16U8qItuEo0/3JxmIlfapOJCXoA5AObKSA=;
        b=BuTUcdSLe+DGH21HJRjGbPYsjoc/TDwTVx++ewCE8+cZnGSIbOnVl5GWg6irQye5ne
         MtCO46XV+okHWcSi6wAc7j//iUv1tpQvoR8QaJH31eow9hLjcc6yxAW+WxRlHwkUDlcv
         JilqZL8aqs6pa6isjepIWfB2vF5WYpMrnQyKE5iG7gCVbPEqR4OMYOmEFqkogXbTeZi0
         DpsIB055fXvRPubCUgaKDPsU2RMfjeYRrV7SKj5mdJOqdAuX1SVGO6VVu68Oq/XY3EfF
         JXqzkW2o5+kq5AfgLTwfPPBcnM+cRhrcawD3l8bG4q34xbOPAk3lHN/r8OQPHaomTeo3
         wQsA==
X-Forwarded-Encrypted: i=1; AKwUvBzeibmV1U4uruGEu4yEPSoPWYMmBLUKM8fCnUV6CZJAIPRs9LPChiI44NMRsCWtoHcuINYs1ITyXC5a8AvZQec=@vger.kernel.org
X-Gm-Message-State: AFq9FYIys8a93xlmtywLXSgIbskFnKM8+x3LswB6HXhEdLqsiK95lzDK
	cpk3WjaCAdTqrwbdalRegsJ6Op8w+zH8AL0n1JjBaou/7bSQi0Kwev9J3ZznyVMJQ6I=
X-Gm-Gg: AYBFou0hE4v3d0UYZ2VjT/GcFj0A7IICrhDlcClsu1ADtP9wrturXXCstyTjQO73OWB
	/YKTCKvfmXcS5cyfKbJnSi87ABr4B8CVUP0qQxVZod6hxAEDAwR6KACqWbpOdk1AGpdqF/dgJ4d
	nAFAW0IlMFdskd43W7ueq+Fv418blJ8SBTpmc36GlmDrcENLUSbtVkWYpjvjVR1NIJNahp3erkp
	BwObYVNm1XidP5OnIz/K/tAdQ1u3wnOW0IcxwP7Hud+ocdTeejGVYrSpZGNeFWEsYSqvRq8qGtr
	JMI/ZOtV1/jX4zUk2yxEddN9fj6gknz+VqklYhzdcYUNAzrYOgu23CvE+KDU0Sy20d0QY0kcUt1
	/m11QOIapdiKfJEnEQDymDSEioyurkVJULz9BVXg3c94HQ1y6gwQ+VhpG8bxRj5zlbcq6vH3Dkr
	tApuFbrBItBFmoIrd5ixDqq7tnRZNKQvIuzyvGNy3TXx1kIk6OVAmP/cR6/C2cO7RdojXd42wCS
	UEtcJQ5fTL75PW2evurOMBNX95IZjdTMKf5DBkSqM4b9no/sKRbqB3rKbSO682ztHwK8i30HadI
	PFgQTQOYKuii9qN7CP6mIGUgfTQ6lcKy7x4qXmYAZD3mogldWH4bawj6KOjK60ba/Aba+ipsdXe
	kVKMCXys1jZfnDEbmsiEpRDjYscpCzTt/
X-Received: by 2002:a05:6102:3e92:b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7d03a29c54fmr1908368137.5.1793232283543;
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125931983sm7622737241.2.2026.10.28.17.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:04:43 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:04:42 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christian Brauner <brauner@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <auKND0n3LyivCrir@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-8-dmatlack@google.com>
 <179322496574.1894369.544573858973645958.b4-review@b4>
 <auKAlcPN0Lt6Y3Wm@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auKAlcPN0Lt6Y3Wm@google.com>

On 10-28 23:09, David Matlack wrote:
> On 2026-10-28 06:02 PM, Pasha Tatashin wrote:
> 
> > > +/*
> > > + * Whether @inode is on the internal shmem mount, which is used by
> > > + * shmem_file_setup() and thus by memfd_create().
> > > + */
> > > +bool shmem_inode_on_internal_mount(const struct inode *inode)
> > > +{
> > > +	return inode->i_sb == shm_mnt->mnt_sb;
> > > +}
> > 
> > Please fix the warning reported by kernel test robot.
> 
> Will do.
> 
> The prototype for shmem_inode_on_internal_mount() is in mm/internal.h,
> which mm/shmem.c only includes if CONFIG_SHMEM=y, but the robot was
> building without CONFIG_SHMEM. I've moved the definition of this
> function into CONFIG_SHMEM in v3 to fix this.
> 
> > Looking at this together with Pratyush's mapping-freeze series ([PATCH
> > 0/3] mm: allow freezing mappings), I think we should extend the mapping
> > freeze lifecycle from preserve() -> retrieve() to preserve() ->
> > finish().
> >
> > When retrieve() returns an fd, its mapping should still come out frozen
> > and only become fully user-owned/mutable once a successful session
> > finish() happens. That keeps the index -> folio mapping invariant across
> > the entire live update until every fd in the session (e.g. vmfd,
> > iommufd, vfiofd that depend on the memfd) has been retrieved, passed
> > can_finish(), and been finalized together in finish().
> >
> > (Doesn't have to block this series, we can do it on top or as part of
> > Pratyush's AS_FROZEN series.), but I think we must fix it either here or
> > there.)
> 
> Ok that sounds reasonable. Should we do that as part of Pratyush's
> series then?
> 
> Pratyuh's series replaces shmem_freeze() with mapping_set_frozen(), so
> retrieve() would freeze the new file and finish() would unfreeze it.
> That should work the same for memfds and tmpfs files..
> 
> BTW, this tmpfs series does a lot of renames and code motion so it
> conflicts with Pratyush's series. How should we order these?

Initially, I thought Pratyush's patch series would land after yours. 
However, since he plans to separate the LU changes from the rest, I 
expect both series to land in this cycle. The order does not matter; 
whoever lands in liveupdate/next first, the other will need to resolve 
the merge conflicts.

-- 
Pasha
