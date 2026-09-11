Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889563128AB;
	Fri, 11 Sep 2026 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136085; cv=none; b=jhKHtX35fuxVIkEL692udRM/vxSgmYye+8bYSrjhLd/7FMWciUZIZB4Wv4WM8w+X4+suKRnMA4HJggAeZAariDB+qh8c9uqze3j4gXh3cDERJhXy+bukXcnz/ImHHvA5HZDADKilIVAGPqlw1xaTgmJYnN2gKj1pPx6pfzsg6kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136085; c=relaxed/simple;
	bh=JpRn1uofAnQ0yYDTpJsabuQSlCIWjiR6qBw0w5BCgPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6+7n2Ip/9fLCso8EqQbVU5UX5P0x5rBcjyLKm4txnWOwxem0UE+HTRliKW1fLpHTFGkMqQ8QNLK9p8cbrmVsQi1ymxIqQTK625e0swldy7vHW1LhpiyHpz5i51Pyk6koXSmvmmCbqnSVTJ2ONPlUrsD8+CWXwyW8BfJltModM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RG3+G+x2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RG3+G+x2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2B91F008A2;
	Fri, 11 Sep 2026 14:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789136084;
	bh=Vl7wtwlKjWj9kG+1Rk8/BQ+oiCTCw1b09aebu1WqEcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RG3+G+x2UV6fCbVtatMP+dcn5QzA2lx8x95K/GC88eWoQ+HywGLGvmgbTuT3oaiL4
	 H+989DvjJ+e8s6Uv1XIsCznIYTj/g02LxIjqW1lQOGH85wYg7Cunqujq3COmyamcPp
	 B0SWH3AqlpPqMXcX601xGAcB/Z+G5pNZIQ0BpoVGmXliYUkNdyli6vmGc2W+rSSnHJ
	 cjba6gQyGjeKqsxtIH6CWkV3D5RvpikYR+BI7dGPT7v3OEH1vU2Q7scVZCpcbVEGj8
	 XXS2ILR9st8du5Oh9ihnzojkxkJhJLPDiYDOIWPoIlkzSvvIRTrZqZgFPluFL1ymbP
	 6y/RsDdju71Jw==
Date: Fri, 11 Sep 2026 15:14:39 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH] kselftest: mm: fix potential failure for merged VMA in
 guard-regions
Message-ID: <aqQMKAjwpvf9dMfa@gremlin>
References: <20260911123534.1181501-1-yeoreum.yun@arm.com>
 <aqP29-H0iKl-2CVH@gremlin>
 <aqQDbfMOVasuejA3@e129823.arm.com>
 <aqQG5LgqXnrmY1_l@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQG5LgqXnrmY1_l@gremlin>

On Fri, Sep 11, 2026 at 02:51:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Fri, Sep 11, 2026 at 02:34:37PM +0100, Yeoreum Yun wrote:
> > On Fri, Sep 11, 2026 at 01:59:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Fri, Sep 11, 2026 at 01:35:34PM +0100, Yeoreum Yun wrote:
> > > > check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> > > > but this can fail if the mapping is merged with an adjacent VMA.
> > > >
> > > > To avoid this potential failure, first allocate a temporary region with
> > > > extra pages at both ends, unmap it, and then map the test region within
> > > > the temporary address range, leaving an unmapped page on each side to
> > > > prevent VMA merging.
> > > >
> > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > ---
> > > >  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
> > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> > > > index 5c8ec3ca75d7..a28a57d34e97 100644
> > > > --- a/tools/testing/selftests/mm/guard-regions.c
> > > > +++ b/tools/testing/selftests/mm/guard-regions.c
> > > > @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
> > > >  	char *ptr, *ptr2;
> > > >  	int i;
> > > >
> > > > -	/* Map a region. */
> > > > -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > > > +	/* Try to Map a region. */
> > >
> > > Map -> map
> > >
> > > > +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > >
> > > Should be PROT_NONE otherwise it'll merge with the below.
> >
> > It doesn't matter. since this memory is unmapped and then second map
> > at ptr + page_size.
> >
> > IOW, though the first one is merged, it unammped and then
> > the second is allocated at ptr + page_size, it wouldn't be merged:
> >
> >   after unmap:
> >    [existing VMA][ 12 pages ][existing VMA]
> >
> >   second:
> >    [exiting VMA] [hole (page)] [ 10 pages (for test)] [hole (page)] [existing VMA]
> >
> > Am I missing something?
>
> Yeah, unmapped (unfaulted) VMAs can be merged with mapped (faulted) VMAs.
>
> In general it's also better to be explicit by specifying distinct attributes
> anyway to spell out clearly that the VMAs are intended to perform that task.

Oops, I missed that you immediately unmapped the VMA too :)

In that case it's fine but I'd still prefer it PROT_NONE to clearly single it
out as a placeholder.

Also a comment above it like:

	/* Map then unmap placeholder to avoid adjacent merges */

>
> >
> > --
> > Sincerely,
> > Yeoreum Yun
>
> --
> Cheers, Lorenzo

--
Cheers, Lorenzo
