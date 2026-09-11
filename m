Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C0A33B6D6;
	Fri, 11 Sep 2026 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136293; cv=none; b=F/qVM5MkboKLkXQWJ7YwQsWVq4rSKlrd8PO5VQ7Vdg7KgXpAEh6UMEPtPigIUTulFJ1xfVlmaPnXyw9l8u9363KzEJPw7BrFpFMp0NNOQbZjC9XuKoQHHkp/EYUcD7afa0ty+gEC3MFQo6fmURw+z5xo97R4EkB5rmXx32sjxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136293; c=relaxed/simple;
	bh=SMWTVWYkHCdUnE1Ea2H43xOdc3TkjyJelBC5ssmIAow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFobbTjV+cBesZGn5dhiciS9jKHjfJMNuZOySqIuCy68ffRsUOgcbBB762Zja1KrAjQCRsWNKK1aKM2pP5rV7hbntf6FWZhfouAOTwqqwWCkokebXjA033w7CW5vd5r6DZDeBykx3mGrk1DupSCr2UzVAASIY2WuFytbtqf1YcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Bbhpiekw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bbhpiekw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AD9316A3;
	Fri, 11 Sep 2026 07:18:06 -0700 (PDT)
Received: from e129823.arm.com (unknown [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 535DE3F7B4;
	Fri, 11 Sep 2026 07:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789136290; bh=SMWTVWYkHCdUnE1Ea2H43xOdc3TkjyJelBC5ssmIAow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bbhpiekw4vPtMuSsZQAsZFKlWtlBiNZqWOGJYa2TIZ7tf2EDzfoA4yJdja9s9TwSC
	 aqPhmIMiLGxUG3I8yFttZOXdPfb5XYZmn5G0AD0U1IgwHhCMWc2scpQNxBeJ9pr5g/
	 t3+tyW6g4se59IaKlJahdDLa4IbzqgPavRxnjBxA=
Date: Fri, 11 Sep 2026 15:18:05 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com
Subject: Re: [PATCH] kselftest: mm: fix potential failure for merged VMA in
 guard-regions
Message-ID: <aqQNnTe3TGkyzjqA@e129823.arm.com>
References: <20260911123534.1181501-1-yeoreum.yun@arm.com>
 <aqP29-H0iKl-2CVH@gremlin>
 <aqQDbfMOVasuejA3@e129823.arm.com>
 <aqQG5LgqXnrmY1_l@gremlin>
 <aqQMKAjwpvf9dMfa@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQMKAjwpvf9dMfa@gremlin>

> On Fri, Sep 11, 2026 at 02:51:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Sep 11, 2026 at 02:34:37PM +0100, Yeoreum Yun wrote:
> > > On Fri, Sep 11, 2026 at 01:59:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > > On Fri, Sep 11, 2026 at 01:35:34PM +0100, Yeoreum Yun wrote:
> > > > > check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> > > > > but this can fail if the mapping is merged with an adjacent VMA.
> > > > >
> > > > > To avoid this potential failure, first allocate a temporary region with
> > > > > extra pages at both ends, unmap it, and then map the test region within
> > > > > the temporary address range, leaving an unmapped page on each side to
> > > > > prevent VMA merging.
> > > > >
> > > > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > > > ---
> > > > >  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
> > > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> > > > > index 5c8ec3ca75d7..a28a57d34e97 100644
> > > > > --- a/tools/testing/selftests/mm/guard-regions.c
> > > > > +++ b/tools/testing/selftests/mm/guard-regions.c
> > > > > @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
> > > > >  	char *ptr, *ptr2;
> > > > >  	int i;
> > > > >
> > > > > -	/* Map a region. */
> > > > > -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > > > > +	/* Try to Map a region. */
> > > >
> > > > Map -> map
> > > >
> > > > > +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > > >
> > > > Should be PROT_NONE otherwise it'll merge with the below.
> > >
> > > It doesn't matter. since this memory is unmapped and then second map
> > > at ptr + page_size.
> > >
> > > IOW, though the first one is merged, it unammped and then
> > > the second is allocated at ptr + page_size, it wouldn't be merged:
> > >
> > >   after unmap:
> > >    [existing VMA][ 12 pages ][existing VMA]
> > >
> > >   second:
> > >    [exiting VMA] [hole (page)] [ 10 pages (for test)] [hole (page)] [existing VMA]
> > >
> > > Am I missing something?
> >
> > Yeah, unmapped (unfaulted) VMAs can be merged with mapped (faulted) VMAs.
> >
> > In general it's also better to be explicit by specifying distinct attributes
> > anyway to spell out clearly that the VMAs are intended to perform that task.
> 
> Oops, I missed that you immediately unmapped the VMA too :)
> 
> In that case it's fine but I'd still prefer it PROT_NONE to clearly single it
> out as a placeholder.
> 
> Also a comment above it like:
> 
> 	/* Map then unmap placeholder to avoid adjacent merges */

Might the ASSERT() made you miss the unmap :).

I'll post soon again.

Thanks!

-- 
Sincerely,
Yeoreum Yun
