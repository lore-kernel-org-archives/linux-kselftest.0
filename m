Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082C547DD64
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792159645; cv=none; b=h+sUjsMw0dKs1wY8XHYydRvSOCG6PvEewossnalUKW+vYEZ6DYyfe0P06P567CRWlxoDiDUr9uq36+BaWmUCqdQ4Yq3cP2A1w7BPAwRDrsrBH9V7EiYAvPQJsYrSOkSUIBavnJgDxARaBCBMg+4deUVNqIfwYX28bzLZ8UyhaKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792159645; c=relaxed/simple;
	bh=v3IclZjlbi9Z4IjYxWogGj9IRDfhQqXoI8k1HAKfqv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8JyE2zPgkXx5/vG5UHJnqo3yGhXRjOGXJxyQenvHD2t1JBmNss1/hH0jORnhPvFCWJADcsV52SBF2X9iJpvMVVoYqfY+LFZDDZYyYPnqIxDHKrylWJctRvxtUOiG+KQOoxIiU1ToaWH0yxr82m+9I6r0nIReySN3XXvusDComc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EPYnfoto; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EPYnfoto"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917b78dfe30so406356d6.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 07:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792159643; x=1792764443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QayzQmhnTMuUa2ajrFbaahJ0XP47WZ2WayG+9I0E9kQ=;
        b=EPYnfoto7IJQjmAM5CmvrMhdK+nbSPInx9j0cMSqDlF/nK2jrZwAK8V5K+k47rxM7b
         kvKkuf+SKnH/8AYCeUihIetv6P0xwBTrTr4wWFXoT+pFpJvbXxKehCYNgarvFL3rejGc
         kZW4neR+1G8nwqUMbm4e5S+qrB+/Kyu931+6FquFPeo57qjOFGFfkW5qulTIY86ZAA5q
         lDNk5IAZVAAMKSCvNMNyV2XnKEDOHN6OJY7W5JcRdYsvM/62f/sHwrXancAvUvQSYJ9h
         /jKA3VKa15/Cn83WCOWjNPpJ/hXtS1khOxe8LDF4BPFqGpsgjdwCQ6RwUmwR9GzUZiMO
         hfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792159643; x=1792764443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QayzQmhnTMuUa2ajrFbaahJ0XP47WZ2WayG+9I0E9kQ=;
        b=zJFkbCAOs8azMihObrCBIvePxW10tZ5bNwVwcOhjdeJuxrzWtaELMLyAG+31kACqXB
         8OppVO+X81s6/punm600jcRfvmJ5Fa0mDJVzfBdO+Kr4UIlMJlhExRjGssLY0WQTGUet
         8HUGvVqKao7ZI8hIPKYr63Sy5LuxOA7ioKmCoPVT839oh+jiOaAxcyn4KoBokpRprNOs
         nb+QydLijR6h9zd1QupRDShYhsNeXZug9ucEEvQR7ewSiiPViwWLlMJe6wzPneQkD0xs
         kTn997ZT0ACnuKu30IOkvwlApr6XOZA+zq6HFKZbTp25I7NlcojrWmvP705WoRlSHEkf
         nQeg==
X-Gm-Message-State: AFq9FYJYKdlP0X0XdpvgeP4NQO0MPYni4mNtq1/n5Q6cz7FH/JW2gvy5
	WCca9oHjX5A9PAckVbur0bqlXtPZkemNcScDU5JrZrQtMO9/Id/ymtQewu8sOANaGELhCAVi6cG
	9E2R5xsk=
X-Gm-Gg: AYBFou0NSKX0xNqepBo6pfjaiLgNh47QXtK/5M1Mb7BOSZscpLkWpDuteuH4RbuMhZV
	roSxpp5r8cKuLvKFdXzljmvocPZ/Zva2JTz4TsVY2zb9t4memJXc8LrP1s87SVMjvenURYZLemR
	QLtuqfT9F3+Mfp0ZWfzyLDvXRHZofRPqHVcvR7Jisgv964U4ALKFsDNPaZNq0d9cd9umNlpAX8n
	SjWuCo3u6eXRghBV/Kf3DcP4DDb+J1MlO7rreuePZrmwDQqlRb1Q3qDcssV5Cc5HDZcLfKrJyII
	dK+KzsBiznzWiRKzhBs2PWs7UdI6jBpDedxikPl+rXLKi/DkkLHvMI5SUcjg0TVerT+3SL5veFH
	x/PD2X9bFAF7zS7gKFeIRo5hM+XwY+ai8cNJ26Uw3xEWrIbChGvUkE8gP648+cgspf+8z8Lwtjw
	ITjJ7goA5k45mbzO37s9uNPmmSPhbRVEcgHuH9jBNUzirc7qoaTXykVMk6J3Ngxmv2dIozzQ5CS
	UTKPN02ObZLtX2dBMR4aMKkSF84ni9pzTy4xKM19bXaQeYvIj1ds/TT3CVNAt17nQ==
X-Received: by 2002:a05:6214:3a8a:b0:917:a1a7:6369 with SMTP id 6a1803df08f44-91bdf07e362mr1076226d6.22.1792159642853;
        Fri, 16 Oct 2026 07:07:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb75af3sm23592056d6.40.2026.10.16.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:07:22 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:07:20 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
Message-ID: <atIvbzEGUcyCqdC7@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
 <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
 <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>

On Fri, Oct 16, 2026 at 09:22:54AM -0400, Gregory Price wrote:
> On Fri, Oct 16, 2026 at 05:47:57PM +0530, Sarthak Sharma wrote:
> > > +/*
> > > + * An unmapped gap in the range makes either hint fail with ENOMEM, after
> > > + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
> > > + * an effect on those pages that the test can observe.
> > > + */
> > > +TEST_F(madvise, unmapped_gap_fails_after_advising)
> > > +{
> > > +	char *mapping, *control;
> > > +	bool swapped = false;
> > > +	int retry;
> > > +
> > > +	pin_to_current_cpu(_metadata);
> > > +
> > > +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
> > > +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> > > +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > > +	ASSERT_NE(control, MAP_FAILED);
> > > +	control[0] = 1;
> > > +	if (!pageout_until_swapped(_metadata, control, page_size,
> > > +				   self->pagemap_fd))
> > > +		SKIP(return, "MADV_PAGEOUT did not swap the page");
> > 
> > This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
> > here because we couldn't pageout, then we don't test for MADV_COLD
> > behaviour at all. Do we want it this way, or should the tests for both
> > of these be separate?
> > 
> 
> If swap is off, the behavior of COLD and PAGEOUT look pretty much the
> same, and we can't actually test them meaningfully.
> 
> We check that madvise(COLD) returns -1, but that's also largely
> meaningless if this initial pageout_until_swapped() call fails.
> 
> At least that's my thought.  If you think I should split it, I can.
> 

on second look, i will just move the cold checks above the rest, since
they're mostly checking failure paths.  those are mostly unchanging
regardless of swap status.

so basically no need to split, just a mild reorder.

~Gregory
