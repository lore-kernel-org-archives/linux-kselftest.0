Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA99426D2E;
	Wed, 23 Sep 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174788; cv=none; b=AYAjNUW11ikJTGiL676BtnkjblBdueBZk17holzIoFE1XZqpsNweuJ/8VkNs4Rrrv+i7yP4Hs9l73Zk4b9ELDj77usGb2hb+qJpvGVinT+yGS8sDTxAUNeCIbl2bstEovQIREAjdQXki2KxBc7Mtz5D8RjI12Wlf/3oreNDuMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174788; c=relaxed/simple;
	bh=9rEwpBAWoBWOYU8bZGMdK83lLxkU10zEJ5HeyPpqwM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmibvzWa7gowVEKJUgSH2pEP1yjbsZwNx2kSQ1DzWM3HN38G+8uOA0totyeLhQsZA5ypHRY6856+2ZcXcY2lVBFBySL2jhWDNNgNM2Jih9IvANTIbJ+hEU0q7r2Gwwoylgi2gbZRRx01RnQ+UeUI96PCpgpB2ZauLElTtiu57d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzblyvSK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzblyvSK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D231F00898;
	Wed, 23 Sep 2026 14:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790174786;
	bh=Ia/uJnJgEt3TppJ3oghshuBusp1+GVmLdKrLBHFvgNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fzblyvSK+VcTOEf3Gl4rbuJnipZbM6qJdn0loZfx8fEC5s0jd5vSZ8LlQnGeHlfr4
	 Lh8zKFnLns+2fj993IPMrTD7J+71r4i4Gfb/7W3Ii2OMpAueu1cNzbmLmnCEhT11Ds
	 wN/NuviMrwTQ3Qe4GO5Tgn5o2S0V4g6XTfGh6hdUYmz8wFGikbrR7HgD/PY/BXH+CZ
	 UhPKnSLnW7XdBgQ8hqrDslLv8xkSmLDdvFMDFUSgyZij+r/4PVrZw/3sWdk77cjMy4
	 bCgkxl6s2587Nks4DKhk1MtVaEuWQuNkh9JzIuKgJ+h+u+86pyalz5CcT2n4VAZlEd
	 xwuuVv441rrtg==
Date: Wed, 23 Sep 2026 15:46:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, david@kernel.org, vbabka@kernel.org, jannh@google.com, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Subject: Re: [PATCH 01/10] selftests/mm: exercise MADV_COLD and MADV_PAGEOUT
Message-ID: <arPl6UhNDbwds4uR@gremlin>
References: <20260922235830.2350770-1-gourry@gourry.net>
 <20260922235830.2350770-2-gourry@gourry.net>
 <arPgwegm8XgbEUrO@gremlin>
 <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPjwPwVxdvdR5S0@gourry-fedora-PF4VCD3F>

On Wed, Sep 23, 2026 at 10:44:17AM -0400, Gregory Price wrote:
> On Wed, Sep 23, 2026 at 03:26:05PM +0100, Lorenzo Stoakes (ARM) wrote:
> >
> > I think in general we want to avoid putting stress tests as part of the
> > selftests in general? Or at least if they might take a long time to run or
> > excessive memory usage, etc.
> >
> > Though that might be benchmarks, as we have the THP stress tests so maybe it's
> > OK?
> >
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> >
> > In any case I really do think this should be split out into smaller parts, this
> > is a _gigantic_ change :)
> >
>
> Absolutely, but alas my poor email hosting throttles me if i send too
> many emails - and sending a 38-part series where the important part is
> the endpoint of the refactor moreso than the individual tests...
> instant 24-hour timeout.
>
> I'm working on a solution.  Need better hosting.

Thanks! But yeah damn indeed you do! :)

Though larger series can scare people off so maybe better to send the tests
separately?

>
> > Since you list a whole bunch of different test areas and you're exercising
> > different things you should be able to split this out logically across those I
> > think?
>
> As mentioned, this was originally ~28 patches split out, but i think
> ultimately only the contractual tests should be shipped.
>
> Maybe there's an argument for keeping some of the implementation
> details - they're fairly easy to find in the code below for individual
> inspection.
>
> Examples
>
> contractual: These tests won't change behavior based on implementation
>  - authorized file PAGEOUT evicts a clean file page;
>  - unauthorized shared-file PAGEOUT leaves the page resident; and
>  - private-file PAGEOUT reclaims a COW page but preserves a file page.
>
> implementation detail: behavior can change without breaking a contract
>  - full and partial MADV_COLD on a PTE-mapped THP

Yeah doesn't sound unreasonable.

>
> ~Gregory

--
Cheers, Lorenzo
