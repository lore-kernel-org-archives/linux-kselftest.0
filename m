Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19BE46D547;
	Fri, 11 Sep 2026 13:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134676; cv=none; b=df4YuN6adu/acvYVXMNEJnKEQPGuBpXTGNme0RBvXP56wa5b1crd5dMTDvBP2Ixu6y2yLBmI3qER8N/rJ5N7AGbXnsuXBvRhtXwIyeKKjjpD2wvYfaqJjsKKGfz/ovj+9BjMPSTK1ukwxgj+Jg0yk4wVkLBr4Nh7KvYizQVnh+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134676; c=relaxed/simple;
	bh=O8AiVgv+7ZnNDH5DozKhDd6mASEQNTU+oE4OIbRt9Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgnBsHR3fJcphN+70fkHeUfaQFux4V1FN5Mi5M5QKhoIq4ZPWzJa/G5i3QTT+aEt/oNKzDuUlEyLZeXiPBW0iMSe7yNLBcrz2umlhVsTgIvMxfdbMuBy2v4OjnaiDdaDAs3bZmpkSm8zlSOtcYUFeDwQkoXR9zB19pVBDmp2UzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK6EuNJm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK6EuNJm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E561F000FF;
	Fri, 11 Sep 2026 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134674;
	bh=fvaClzPibMX8sDId7DsBxokq538mDXT63zj8aRNKY7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JK6EuNJmEr0lM0l1PtHdk05vdILf1KZ3cHgK0LH1/k3ct3M/29gKSqzM5MLwZbHAe
	 1gUFS6ovwrEcu/B9ZWAcXtG9bvRJHVAH5z4f0Yd6I42s3f5SbhyIbGxJoewuXr6FDB
	 dFducW2cgv4lQDDhHwDWxedcTAtQNfEsaMek6YQEPExnKaYpOgoxx7dyd2M/vAG1A5
	 a/mlov04vWmIQ+nWhSaCYLqCOYyiF/6ZwcsuSz3nwv5d9tECM0gUPedD4kvHGFwE9f
	 Zwt60k8LPtqiGwoWswLdjb5wD6pPNvcA+eF4Or99UGjoWpnMO+GnHyhkiL42dlYKpq
	 wtWxeBy/4zWvA==
Date: Fri, 11 Sep 2026 14:51:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com
Subject: Re: [PATCH] kselftest: mm: fix potential failure for merged VMA in
 guard-regions
Message-ID: <aqQG5LgqXnrmY1_l@gremlin>
References: <20260911123534.1181501-1-yeoreum.yun@arm.com>
 <aqP29-H0iKl-2CVH@gremlin>
 <aqQDbfMOVasuejA3@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqQDbfMOVasuejA3@e129823.arm.com>

On Fri, Sep 11, 2026 at 02:34:37PM +0100, Yeoreum Yun wrote:
> On Fri, Sep 11, 2026 at 01:59:31PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Sep 11, 2026 at 01:35:34PM +0100, Yeoreum Yun wrote:
> > > check_vmflag_guard() uses /proc/self/smaps to retrieve the VMA flags,
> > > but this can fail if the mapping is merged with an adjacent VMA.
> > >
> > > To avoid this potential failure, first allocate a temporary region with
> > > extra pages at both ends, unmap it, and then map the test region within
> > > the temporary address range, leaving an unmapped page on each side to
> > > prevent VMA merging.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > ---
> > >  tools/testing/selftests/mm/guard-regions.c | 14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> > > index 5c8ec3ca75d7..a28a57d34e97 100644
> > > --- a/tools/testing/selftests/mm/guard-regions.c
> > > +++ b/tools/testing/selftests/mm/guard-regions.c
> > > @@ -2257,8 +2257,18 @@ TEST_F(guard_regions, smaps)
> > >  	char *ptr, *ptr2;
> > >  	int i;
> > >
> > > -	/* Map a region. */
> > > -	ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> > > +	/* Try to Map a region. */
> >
> > Map -> map
> >
> > > +	ptr = mmap_(self, variant, NULL, 12 * page_size, PROT_READ | PROT_WRITE, 0, 0);
> >
> > Should be PROT_NONE otherwise it'll merge with the below.
>
> It doesn't matter. since this memory is unmapped and then second map
> at ptr + page_size.
>
> IOW, though the first one is merged, it unammped and then
> the second is allocated at ptr + page_size, it wouldn't be merged:
>
>   after unmap:
>    [existing VMA][ 12 pages ][existing VMA]
>
>   second:
>    [exiting VMA] [hole (page)] [ 10 pages (for test)] [hole (page)] [existing VMA]
>
> Am I missing something?

Yeah, unmapped (unfaulted) VMAs can be merged with mapped (faulted) VMAs.

In general it's also better to be explicit by specifying distinct attributes
anyway to spell out clearly that the VMAs are intended to perform that task.

>
> --
> Sincerely,
> Yeoreum Yun

--
Cheers, Lorenzo
