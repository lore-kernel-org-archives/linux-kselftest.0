Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4F476CF7;
	Tue, 18 Aug 2026 13:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787059796; cv=none; b=t3b3cjNLFRToq+o0R3FdpeJpUFmmj+qUHqQdKSYL+12QiwFSXxb2Gx/VgYwG5k88JKZSMO5z7Bq2sbH070RDmvmp+3FoSJppW/dJQLPneH45S7Gm0BrJSFO2O4Z59+mpLSsI2zDx0bPmPjYhErGvKllcQmp1WDVfnMtHrs/Il7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787059796; c=relaxed/simple;
	bh=NHZIcNNG/xqTVgyw+FQrrk73J8fNwBZRCpYtEERPZ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKUZ79K35GsIxPRXIEJOIQtgLYGFdQ6EiX5cD7MDN24a1p0SZ12kyVq1peOOVMid5i/ITbq5pCSiUEsCxbAa05fA6wZ1o5zSeCnskI1WDGfbiZWe4F7hXi+s9vDdKgAMe9o20f2sc6+jirpJlEAmFTIohVgMC0DWOFIlAuwhSGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhKgXKmP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhKgXKmP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5166D1F000E9;
	Tue, 18 Aug 2026 13:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787059794;
	bh=N9rUv4TdujbZ6/XxkM7SFbymVzpaYaqLUiO3R4LX8BY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PhKgXKmPhaLMzw9XPrcieo79uQDMA03R6DrXspM/ddU2BF3zoc2D9RP3+9ywMsPGQ
	 wgbkqFGoiAQS4Bidix2KKA2cys14vJbFcaiSIUKCkUML1UMpO/5y/g/te2G6JJtFtI
	 mT3+joG7lapBBRFcihK8rH1bh4aPFQez1gd2GGavkSz9SNk6uaI/ya2inHaLpKI67N
	 wCffB/E4eLIOmJ6rGpIIBdBkDKODZtzg6cpAY1pzZxTs0UrJLjNj4CVsInHkq+jgKk
	 +YbqwHss5uhCtsh1MypAXf/TqiCkSc2CPJo4NnohNID/NThsTNhC8Zxx4g7DmwQm4x
	 QARzujdhkA1EQ==
Date: Tue, 18 Aug 2026 14:29:35 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Hemanth Selam <hemanth.selam@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Yury Khrustalev <yury.khrustalev@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: remove the local PKEY_UNRESTRICTED fallback
Message-ID: <aoRcdLGWaNhUFIPU@lucifer>
References: <20260818114945.1312987-1-hemanth.selam@gmail.com>
 <9e533fcd-c80f-42df-847c-c15c4e3a1a70@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e533fcd-c80f-42df-847c-c15c4e3a1a70@kernel.org>

On Tue, Aug 18, 2026 at 03:11:50PM +0200, David Hildenbrand (Arm) wrote:
> On 8/18/26 13:49, Hemanth Selam wrote:
> > pkey-helpers.h defines PKEY_UNRESTRICTED itself when the macro is not
> > already known, a stopgap from when the generic definition was still
> > under review.  It has been merged since, commit 6d61527d931b ("mm/pkey:
> > Add PKEY_UNRESTRICTED macro"), and pkey-helpers.h already includes
> > <linux/mman.h>, so the guard is never taken.  Honour the FIXME and drop
> > it.
> >
> > The mm selftests build against the headers of the kernel source, see
> > Documentation/dev-tools/kselftest.rst.  Building them without "make

This is incorrect. We explicitly do not have this requirement in mm selftests,
and they're often built without having to do this step and tooling has been
provided _explicitly_ to allow for that, which is why this kind of thing exists
right now.

> > headers", against system headers predating the macro, now fails to
> > compile instead of quietly falling back.
> >
> > No functional change intended.
> >
> > Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> > ---
> >  tools/testing/selftests/mm/pkey-helpers.h | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
> > index 2c377f4e9df1..626c2e1655dc 100644
> > --- a/tools/testing/selftests/mm/pkey-helpers.h
> > +++ b/tools/testing/selftests/mm/pkey-helpers.h
> > @@ -112,13 +112,6 @@ void record_pkey_malloc(void *ptr, long size, int prot);
> >  #define PKEY_MASK	(PKEY_DISABLE_ACCESS | PKEY_DISABLE_WRITE)
> >  #endif
> >
> > -/*
> > - * FIXME: Remove once the generic PKEY_UNRESTRICTED definition is merged.
> > - */
> > -#ifndef PKEY_UNRESTRICTED
> > -#define PKEY_UNRESTRICTED 0x0
> > -#endif
> > -
> >  #ifndef set_pkey_bits
> >  static inline u64 set_pkey_bits(u64 reg, int pkey, u64 flags)
> >  {
>
> tools/include/uapi/asm-generic/mman-common.h:#define PKEY_UNRESTRICTED  0x0
>
> So that looks good.
>
> But we seem to have the same ifdef also in
> tools/testing/selftests/powerpc/include/pkeys.h.
>
> So likely that should be removed as well (after making sure that it compiles?)

It will break people right now :) it might compile on one system but not
another.

There's been a bunch of discussion on this, often quite painful. See [0] and
surrounding thread for some history on this...

IOW - this isn't really costing us much so I'd prefer we kept this kind of
thing.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

[0]:https://lore.kernel.org/all/5b0b8e1e-6f50-4e18-bf46-39b00376c26e@nvidia.com/
