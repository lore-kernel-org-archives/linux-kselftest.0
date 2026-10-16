Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041046D2A9
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156979; cv=none; b=rck+ZmWQg08O5jKycRTD9Z7cJjlHyYUsYGsgc+VNyegHXKTMwyXNYKpOEGY0HUaYZ6Byqzs5A2nIs+tR6MSVi9Vh0O8SQkfNHeC7zgpg8Sf6/GnS0fqgJv37zdH2YVwJptmcq6JFP0OpDAJqSygaG4Dx6+32kPxrd9xIUBsmYz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156979; c=relaxed/simple;
	bh=Zoh3g5792438IIctiUeh8nECzubz/AI0R3YK2S7Ak+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCVvM81b7K8hr9SWcx7XJ00G7ggj+pqpXTHL9XrgNCrp9r2AfH+/FtEG3Sq5nvGkxQcQCVD32/ETDCU3aJzppCHBzMVypT/r/XNCZD+B8/GP2M9q3ogL7xH9CK3BGtZX02FDscz6bKZ0nwygPQwjsdnYruDKbvSBI+dmaoCXy3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=aIRxyiBd; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="aIRxyiBd"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b63bd2030so75937226d6.3
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792156977; x=1792761777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UZ+jg+YnV/4Rx7SNrmGuegpLMiyUs48QsBYMqR/oF7c=;
        b=aIRxyiBdQKFslLI7IwkstdBnBMGLfGlEWoFqH10Jjz+Y2g0YfcV5P6lStNPSpwdtwL
         aLkNPbmpmGqNRi6yrtFAtO0ulHS2hktyQuc6V/zZwCP/6321xiYHogrghmfvWro3mSUU
         IMWSV2BzIglZdKIW4fCxT6J4HypF96Bc8/QTehx6Im/fd3VDD46vLJUXcR8/fYQcRKGt
         VTebs8IKKfD2LzpP5o7Dtx6ls53jPpjoMH3QN82tsB1OdcCG/SOifAc+lMbH6w+JtyUt
         WG3Wn2TW48Mx18iYv0YqS3nDd0rij3I3wMyzeiT6aILQ2DB3jR90U9a4XKFdZPmTZZa3
         57YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156977; x=1792761777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZ+jg+YnV/4Rx7SNrmGuegpLMiyUs48QsBYMqR/oF7c=;
        b=F/ZSG39xjj0Cg/8/ufkxQ3yUs7XPsvRuxbd5fgHYJDclnPfgquDldKXVDB+tb4HJPl
         fHL1qaRQz+mUtZ85WE9LPi2AXKf06loYL+l7641N5o9CqpvWJYmESfNgbikgdf3DCce1
         DXGP7L2HVzDiyPuhSJWpLqPnLQOjWxqbZWafI9xxmvKoz1sfIXGrHcuE/GROXonGkfz1
         CjXDsZQCFZpkipE7Jnz1p6ILLD9W1vYZalGDu2OPYzh1Gr6a+EQ0d1iJPxtdW0U6y9J2
         2gS0gOooDaxQZBjsjKcDxlERbNmA7l79TmPd9i8lo0PTPSkaxrUvelljxCANZtY1PbR3
         0dug==
X-Gm-Message-State: AFq9FYIDhcyF2UVdK7CU9iOGMmyDzsj9RvGgLkr1kQqzkak+3ACtHDUy
	0NBb0aD6d5pEyl8GS8v3fwCZxobRzHA8ucKaGJvwkSVyD6NUnjRznPL+Sbmlt+2nUwg=
X-Gm-Gg: AYBFou1DreMCSoBpcOwCY/CqI6hhI0AV63+8Tr03JDxczQDZjPZsFxlBOwPnlZO7Sf8
	Pi4ErBJ3uLFKYouViWl2rwhsO51Lx2dull7IJR0PGsQZMVEoYfO1+s3yJQm0dW/wivKJWtf+pda
	6APsig/0zBpsz002kdiwDVXQXHv5VRYPmfG3vBqeTRWJz+7BwBPG9mrCvorfgSBHyXr7Iohthcs
	KiZ4x5uL2fEPFSih/yDgYMX2I3ih7ZKysG09J4atvgsWmhLAU0ONUgAglqld9wYg6KU7pPqHpbu
	feFUeM2uqp6uLtumBFcxC+7eqFpO2Xb7/K6Z8exCXOfh3rQLTDJvegfjgkum5gQvwfwdyedkNhX
	FgUG2CqHMmwiwMxHM050uQkEmU36XWdNnTWsfqcBNri/e+Rdw1FLdtvzEgQk9ZFqBglg5GKWdsP
	gdd+tGRZFwVJdTAMTCLFl+6AuHiV3k5Fmj6QZcCcyIJzEMdq8ORgXCJpa2BUvnpvUTvza72KQSA
	b0UIWI5Ch8CQCglruwTBAcnjov+h5IEF4nuou41z7IlJs52VQemplQ=
X-Received: by 2002:a05:6214:4808:b0:917:8b5a:8e81 with SMTP id 6a1803df08f44-91b55564619mr403547436d6.29.1792156976561;
        Fri, 16 Oct 2026 06:22:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcbb756fcsm22569936d6.42.2026.10.16.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:22:56 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:22:54 -0400
From: Gregory Price <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
Message-ID: <atIkDw9r6CVDJaG7@gourry-fedora-PF4VCD3F>
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
 <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>

On Fri, Oct 16, 2026 at 05:47:57PM +0530, Sarthak Sharma wrote:
> > +/*
> > + * An unmapped gap in the range makes either hint fail with ENOMEM, after
> > + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
> > + * an effect on those pages that the test can observe.
> > + */
> > +TEST_F(madvise, unmapped_gap_fails_after_advising)
> > +{
> > +	char *mapping, *control;
> > +	bool swapped = false;
> > +	int retry;
> > +
> > +	pin_to_current_cpu(_metadata);
> > +
> > +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
> > +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> > +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > +	ASSERT_NE(control, MAP_FAILED);
> > +	control[0] = 1;
> > +	if (!pageout_until_swapped(_metadata, control, page_size,
> > +				   self->pagemap_fd))
> > +		SKIP(return, "MADV_PAGEOUT did not swap the page");
> 
> This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
> here because we couldn't pageout, then we don't test for MADV_COLD
> behaviour at all. Do we want it this way, or should the tests for both
> of these be separate?
> 

If swap is off, the behavior of COLD and PAGEOUT look pretty much the
same, and we can't actually test them meaningfully.

We check that madvise(COLD) returns -1, but that's also largely
meaningless if this initial pageout_until_swapped() call fails.

At least that's my thought.  If you think I should split it, I can.

~Gregory
