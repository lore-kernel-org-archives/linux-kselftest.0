Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F63FB071;
	Fri,  8 May 2026 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252701; cv=none; b=eJpAKqfsHC/EPG88MBQeK17FaT+b0Cb9V1iGVY2jcg8ou6vB+lx6E5qq7DpEafINBOtTEvBF6XBkornNhxDc0bVr/yvlC3M3A3k30/Y6ncobuVTB4i8gaWhyKB2MRkTxsejAMnx8neO3pcUtWH1UgVZXeFFAUtTOw0WPEVs4s8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252701; c=relaxed/simple;
	bh=pHhXaYIL6lMr7VyVYgXjxrjXvNYn0pBdbl82D6nEY1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdz69sQG1DkU1NGyLS3Hwg4CBtKzYVSA5bnkEwYKYEe46TEM5ffZxfyuwcJJjpS6wZCIf6eZObK+2z4BcEnCWvwL537rRnAIhynW9sw+q6Aoi5tthu7KFy/ml3A4fQp9lKmhMZOeFkJdifgpp2VPSsWfO8at+fibVbfzT2r42ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJ7xyntZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJ7xyntZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81ACC2BCB0;
	Fri,  8 May 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252700;
	bh=pHhXaYIL6lMr7VyVYgXjxrjXvNYn0pBdbl82D6nEY1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ7xyntZWU58Of0vyAiLFFEf2zOU9qg0NMn1RaF/ZqBdWkU7NlK9DAHDMGeFngvHw
	 /R0rPd+GiRT2CWWIGMgC+yZEEkyOW5pY/IiltvtesqkM6o0ilZO9jN7bEoICq/nXE1
	 4HqiK5RaOl0sPiL9zam1U6Q8wxNIbsrISWt0qJjSW9VmCM0F2idhPWcguh4bNyrVYa
	 LAjlAYDCSVTCjQU6PomeHgbxLi5rhvQWuzkNrGVzs8iR35InVb4gcCMgR9Kb5ZWQsP
	 R1zsdv19/yGy6/CQOyTq+sWjy1I34AfHCwL6nxWuUtobpDP5A6zvtml82i4AGaCSzL
	 Qp7JX4tFckgkg==
Date: Fri, 8 May 2026 16:04:54 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chen Wandun <chenwandun1@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	akpm@linux-foundation.org, shuah@kernel.org, zokeefe@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/khugepaged: fix spurious -EINVAL from sub-PMD
 MADV_COLLAPSE range
Message-ID: <af37aPMyMV8JSIPH@lucifer>
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
 <20260507070558.3064142-2-chenwandun@lixiang.com>
 <9eea2afb-8c35-47eb-b1de-6a08503c9679@kernel.org>
 <af30otSSGbPxHbxM@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af30otSSGbPxHbxM@lucifer>

On Fri, May 08, 2026 at 04:02:37PM +0100, Lorenzo Stoakes wrote:
> On Fri, May 08, 2026 at 02:27:37PM +0200, David Hildenbrand (Arm) wrote:
> > On 5/7/26 09:05, Chen Wandun wrote:
> > > madvise_collapse() computes the THP-aligned window:
> > >
> > >   hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
> > >   hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
> > >
> > > Previously this was done after kmalloc_obj(), so problem arose when
> > > the range contained no complete PMD-aligned window (hstart >= hend).
> > >
> > > When hstart > hend, (hend - hstart) wraps unsigned to a huge value, the
> > > final comparison fails and -EINVAL is returned instead of 0.  Consider
>
> I think both should return -EINVAL.

Correction: I changed my mind (see below), and think == should return 0 simply
for compatibility reasons. Though honestly both really should have been -EINVAL
from the start...

>
> > > two single-page calls on a 2 MiB-aligned address:
> > >
> > >     /* hstart == hend == aligned  ->  0 == 0  ->  returns 0 */
> > >     madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);
>
> What's aligned? You're putting a random variable name in there? Presumably a PMD-aligned address?
>
> > >
> > >     /* hstart = aligned + 2MiB, hend = aligned
> > >      * (hend - hstart) wraps unsigned  ->  returns -EINVAL */
> > >     madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE);
> > >
> > > Both calls cover less than one THP and collapse nothing; both should
> > > return 0.
>
> Disagree.
>
> >
> > Okay, so we talk about a "userspace is being stupid" scenario.
>
> Yes!
>
> I feel that -EINVAL is correct for hend > hstart, and I think it might even be a
> userland A[BP]I break to change it (maybe somebody, somewhere is being foolish
> enough to use this to also validate input ranges).
>
> The weirdness is when hstart == hend being 0 but that's sort of established
> behaviour I guess.
>
> >
> > >
> > > In addition, kmalloc_obj(), mmgrab() and lru_add_drain_all() were all
> > > called before discovering there was nothing to do, only for the code
> > > to kfree() and return immediately after.
> >
> > Just a comment as you motivate here why this is suboptimal: we do not care about
> > a "userspace is being stupid" scenario being fast.
>
> Yes, in general - so what? The user is doing stupid things, so the user wins
> stupid prizes?
>
> >
> > >
> > > Fix both by computing hstart/hend after thp_vma_allowable_order() but
> > > before kmalloc_obj(), and returning 0 early when hstart >= hend.
> > >
> > > Fixes: 7d8faaf15545 ("mm/madvise: introduce MADV_COLLAPSE sync hugepage collapse")
> >
> > Fixes: is likely ok, but I don't think we want to treat this as a hotfix or CC
> > stable.
>
> I'm not sure I want a fixes here, this isn't really fixing anything. This isn't
> a bug afaik, it's just us not handling this brilliantly, but (possibly by
> mistake) getting the right output.
>
> >
> > > Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
>
> I put this patch through AI detection and it's telling me there's an 80% chance
> this whole thing is LLM-generated, which is making me grumpy.
>
> Can you confirm that this is, in fact, your own work? Plagiarism is not a nice
> thing to do, and THP doesn't need more traffic, we're overloaded as it is.
>
> > > ---
> > >  mm/khugepaged.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > index b8452dbdb043..92473d93e837 100644
> > > --- a/mm/khugepaged.c
> > > +++ b/mm/khugepaged.c
> > > @@ -2836,6 +2836,12 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
> > >  	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_FORCED_COLLAPSE, PMD_ORDER))
> > >  		return -EINVAL;
> > >
> > > +	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
> > > +	hend = end & HPAGE_PMD_MASK;
>
> See below re: conflict.
>
> > > +
> > > +	if (hstart >= hend)
> > > +		return 0;
>
> 	if (hstart > hend)
> 		return -EINVAL;
> 	/* For compatibility, users may rely on this. */
> 	if (hstart == hend)
> 		return 0;
>
> Is probably better.
>
> But I'm not sure what the point is if we're already doing this behaviour?
>
> > > +
> > >  	cc = kmalloc_obj(*cc);
> > >  	if (!cc)
> > >  		return -ENOMEM;
> > > @@ -2845,9 +2851,6 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
> > >  	mmgrab(mm);
> > >  	lru_add_drain_all();
> > >
> > > -	hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK;
> > > -	hend = end & HPAGE_PMD_MASK;
> > > -
> > >  	for (addr = hstart; addr < hend; addr += HPAGE_PMD_SIZE) {
> > >  		enum scan_result result = SCAN_FAIL;
> > >
> >
> > In general, LGTM, but see for conflict:
> > https://lore.kernel.org/all/20260409014323.2385982-1-ye.liu@linux.dev/
>
> Please use mm-unstable as a basis for your mm work Chen, this is something you
> need to fix, the patch above has been around for a while and is in
> mm-unstable.
>
> You have patches in mm already so you should know better by now.
>
> But I'm really not sure I'm in favour of this anyway. I'll defer to David but
> this feels useless to me.
>
> >
> >
> > --
> > Cheers,
> >
> > David
>
> Thanks, Lorenzo
