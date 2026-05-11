Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEACF29B8D0;
	Mon, 11 May 2026 15:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513578; cv=none; b=Iv9zQTD310V5i3NZzQo3xgk0x0gRdn+AYRqY005iBJps3YH78lfThGJV6oj/K7sTmeLGBQmv0g0y1MXAc/tXdFVG/LmJOiywzuSF/Jo7+iL0+lUEz76M11vl32gwmgE9RWagRpbgdJQTkmkhfrazkNKPgQpdUs987opywpqs5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513578; c=relaxed/simple;
	bh=oY/dHyH+Y8UtkwvZvzcd4kYBZgahoB9UOj/6bh+miOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSllAH9oJiPa+rNkZk1M9OSkti0/JMv6ubvk6xarxbpK81ziEVtCMumEICKK1c36T3a7sfePPgtkObQwEL8b1YKy0dIXrPAtLJT5p8xHH7g7zqKGaKYcI4zM4J6fCZ86Tj6BGsN6VTWpyQYxsQ3GYXts62DW5eY1fwtu8jY06vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f163O4vD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f163O4vD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3F0C2BCB0;
	Mon, 11 May 2026 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778513578;
	bh=oY/dHyH+Y8UtkwvZvzcd4kYBZgahoB9UOj/6bh+miOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f163O4vDyOPdc0JOyCKRpy0lRzjCWKbjjKUkj/3k83d2qiJTRJijGRViJ7jxmVH8u
	 haHq3+i8v3z88OUkEpqNcCbpuk/F7rvLI1b/b0hQaRVBpnrCpj1jfukHSBkLq9Mghj
	 oHeswfHFyQKQiuNg1AuajeDj4CgD4Pmvzi1N4pBrq1vH6z0ODsIRieCvN2DJ4VNv51
	 StU3TkCqXGxEE9TRIX++ykRNNCb+FgPu6X3kw3GgMfNzm45/ZwR8P6Qt+cxH4VCWbu
	 rtCCwnxtOBWt1NljSVkAWD5rX8qyDZjwwOpEqpKk8v/YcTTaUQmCTRo6sGg1W7fWlM
	 2aeYKrAoTmVNQ==
Date: Mon, 11 May 2026 16:32:54 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
Message-ID: <agH1ZSdX_7QF8P_I@lucifer>
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>

On Mon, May 11, 2026 at 05:19:50PM +0200, Jann Horn wrote:
> On Mon, May 11, 2026 at 5:05 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > On Thu, May 07, 2026 at 06:24:45PM +0000, fujunjie wrote:
> > > When MREMAP_FIXED moves a range spanning multiple VMAs, remap_move()
> > > iterates over the source VMAs and skips source holes.  For each source
> > > VMA segment it narrows vrm->new_len to that segment length before calling
> > > mremap_to(), so the MREMAP_FIXED destination unmap is also limited to the
> > > current segment.
> > >
> > > If the source range contains holes and the destination range is already
> > > mapped, the destination subranges corresponding to those source holes can
> > > therefore survive the move.  That violates MREMAP_FIXED semantics, where
> > > the destination range is supposed to be unmapped before the move, and it
> > > also means that preserved source gaps do not necessarily become gaps in
> > > the destination.  Userspace can then observe mappings at destination
> > > addresses that should have become holes.
> >
> > Hmmm I think it's a bit debateable honestly. The ability to handle there being
> > gaps is a _new thing_, so there are no semantics to speak of. Prevoiusly
> > mremap() simply required that you only span across a single VMA.
>
> FWIW, I think mremap() on a source region with gaps is such a
> hazardous operation that nearly no userspace code should be doing it -
> gaps are areas in which any mmap() call without a fixed address could
> place unrelated mappings (unless stack VMAs are involved, which would
> also be a weird scenario), so to use it safely, you have to, among
> other things, make sure not to use libc malloc() at a time when that
> could place an allocation in the gap (which means you also can't use
> printf(), and so on, unless you have swapped out the memory
> allocator), and make sure that you have no other threads that could be
> doing that, and so on. There are rare circumstances under which it
> could be safe, but I think it is almost always better to have a
> PROT_NONE anonymous VMA or such as a placeholder.

Well, we're holding the mmap write lock so none of that could happen
_during_ the operation right?

You might debate also the fact we hold that for an extended period.

Honestly I probably shouldn't have allowed for this, I've had to do at
least one fixup relating to it I seem to recall and the semantics are
_clearly_ confusing.

>
> I think the right documentation for this is "do not use this on a
> source region with gaps, it is technically possible but extremely
> hazardous".

Yeah, I mean on reflection, allowing it was probably a mistake.

The real use case was 'my VMAs are fragmented and I don't want to have to
know about VMA merge rules in order to move them', i.e. no gaps.

I will do a manpage update and indicate that it probably shouldn't be used
but if it is, the sematics are such that gaps are not propagated (i.e. it
is as if you mremap()'d each individually).

Cheers, Lorenzo
