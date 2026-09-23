Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FE8522EF3;
	Wed, 23 Sep 2026 17:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183677; cv=none; b=hyi3oFQgBs2iXIvKUBk6HWMSrAgpMgwFNOzISPheWOwCY6/kKi7k9QYvuSjtRlmu8KWOtMkcOaMHIYQNKI6qm0Ik38/+2gDmF3Xude1AVSBSO/tgxQ8TPQSFgxxCf/vGErEmxvvZ4a8AuZuM1jKvisl8b7bLhN1dAOsNJ2rEjDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183677; c=relaxed/simple;
	bh=5tJeiggtw+gqmQp35LCNFu/BDu+RTKZTXudaN+GaHYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFfPmUaCDHu0BO9+dBNroLVPx1B7d4YcQ/X9jvQAZ3TYX+VBsqahlU8iYljg1Dxqe+q49PClvoDrZ4hcoJO/v9VcuBSPmKFkBklTjrwC+4uFUNX8jUKlgD3Wy2A3/7Lcaks8R4FqiK0Ti+SIajyszYEkxxVCHhmB4b+vvrhxzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDZk1B/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDZk1B/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A931F000FF;
	Wed, 23 Sep 2026 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183676;
	bh=rb+Cq8oR05KtpukUE9vRoODPKnztoTGRs8NKfaj7ft0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mDZk1B/hl2XtyOeNXAwFCKEQb8I79T3hZm+ieG0KZ7/2+LbDR2vrarfRpdpwV2hFg
	 dXFcp2xZgmBz/FZqpbCJcJYYahWFzrhYgcwd24+xw+nILmK3rUYgD+wIKx/+CL5WxP
	 mpokFMBKGwu1YzoTQFZiisa9IFMSpe3e0poyeS2BCJYK5ymh/3724o92cve2UoHlwr
	 sMNOWtf7plyGOY+kdSRbuSmPgA1v98+uZ/dppv7siv5k1uG69vfBexsg8N6wW80iBP
	 bLnD11iASlLG1/Z/XTjCt1lpib/ng/dqwC6CGdm/pIcNcSxyH4SqCSyfLuMOnQc7J2
	 D2DfyK1O81cKg==
Date: Wed, 23 Sep 2026 18:14:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 05/10] mm/madvise: factor huge-PMD folio processing
Message-ID: <arQItpXkh7WV4yyR@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-6-gourry@gourry.net>
 <arP4Igew3iL9qVKW@gremlin>
 <arQGK4RbYWYm4En7@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arQGK4RbYWYm4En7@gourry-fedora-PF4VCD3F>

On Wed, Sep 23, 2026 at 01:06:45PM -0400, Gregory Price wrote:
> On Wed, Sep 23, 2026 at 05:43:59PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > +/* Return a locked, referenced folio only when it must be split. */
> >
> > I find it really weird that when it:
> >
> > a. succeeds
> > b. mapped folio is missing/invalid/filtered
> >
> > In both cases it returns NULL.
> >
> > And it's also weirdly returning a folio in a kind of failure case, or it's
> > more like a defer-to-the-rest-of-the-code case I suppose.
> >
> > I wonder if the split could be done as part of the function?
> >
> > Then maybe have it return bool and document that true means it's fully
> > processed (invalid folio cases, success case), false means that it's been
> > split and the rest of the code should continue.
> >
> > Awkward one actually.
>
> Yes this was an awkward one to futz around with.  I took a couple tries
> at it and this is ultimately what fell out and passed the tests.
>
> I think there's some tweaks that could be made here, but I err'd on the
> side of "don't break shit" before I went twiddling.
>
> It is at least easier to understand, but certainly this shows how poorly
> the original code was structured.

Yeah, if this is an intermediate state I won't necessarily insist but it just
feels so odd.

Maybe have a look at it doing the split in the function and see how that
sits?

>
> >
> > > +static struct folio *
> > > +madvise_lru_huge_pmd_locked(pmd_t *pmd, pmd_t orig_pmd,
> > > +		unsigned long addr, unsigned long next, struct mm_walk *walk,
> > > +		struct list_head *folio_list, bool pageout_anon_only)
> > > +{
> > > +	const struct madvise_walk_private *private = walk->private;
> > > +	struct vm_area_struct *vma = walk->vma;
> > > +	struct folio *folio;
> > > +
> > > +	folio = vm_normal_folio_pmd(vma, addr, orig_pmd);
> > > +	if (!folio || folio_is_zone_device(folio))
> > > +		return NULL;
> > > +	if (madvise_lru_folio_is_filtered(folio, pageout_anon_only))
> > > +		return NULL;
> > > +
> > > +	if (next - addr != HPAGE_PMD_SIZE) {
> >
> > NIT: Maybe could define above as:
> >
> > 	const bool spans_pmd = next - addr == HPAGE_PMD_SIZE;
> >
> > And then make this:
> >
> > 	if (!spans_pmd)
> >
>
> seems reasonable. ack
>
> ~Gregory

--
Cheers, Lorenzo
