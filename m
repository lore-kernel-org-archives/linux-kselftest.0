Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8401B42980C;
	Mon, 11 May 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515231; cv=none; b=mSEE8oSWmRyHxGAoClXQp2QBik0IY94qQ6z322NVJTv7Qukmsr7lWiuV8aSCZt3Y770YaGgQro7UYOT0Z2aCp7GmCrBgbQa3uj+LrbYJOSkI/mvNuc4EaUfSRKfegVXIHnu9oaPGBJJ/WpimrybqPEewyA1vyNbSIf1ufnZCT5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515231; c=relaxed/simple;
	bh=GgxxrQrunYOFdtUHMzxvGZxhYSNwjak4ACzMLjqG6O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FL+4pDGab0Ho9bvj1S00lV2SCiMZQrpHo4+GuY5/+EdEUhD4pQ61+67P4wKpM5iVUCD5hBlLCC/oJgDua/kehnJsx+yM22cMGevQXE+zGt67milZdnH77iaMD3WYmNyARGlNjam/i0IIFNrVcC+jb3ZBTOtNhyAe8wfLSrHZOYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDrY8vrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDrY8vrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A5CC2BCB0;
	Mon, 11 May 2026 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515231;
	bh=GgxxrQrunYOFdtUHMzxvGZxhYSNwjak4ACzMLjqG6O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDrY8vrTp7dO3FIZueKI7NbApDBdmFwkIQV6hL8v/oYR8yxFGGb4jBvRnhMLp0SNQ
	 YKAl9sHSjrvWni1g4typz6JsrgfLXWW3IB97KZRgY6zlhhFdjZHuEaPdAU1PBIzwWy
	 a+ztmz0LmdsaBY84OusUk6uNOwhx3uZTxhkY+NW+YfggdMlrF+BULmxQSOx295Vg4S
	 Iw0tqn7Hm0hCQ40FdeQfO0lm1sA32DKh9RWln9uej4R678dshC8lLNBDRxtW1Dm65x
	 lqkY8f4J27r3uOGQ7IcvVI68vJO1XbYs+YC8LARK4OFGxMBTmNCKg6Ku7sr5Ek3ChQ
	 IKseDzbyNf5Iw==
Date: Mon, 11 May 2026 17:00:27 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
Message-ID: <agH7ONBSX7XLzS6q@lucifer>
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
 <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>

On Mon, May 11, 2026 at 05:40:24PM +0200, Jann Horn wrote:
> On Mon, May 11, 2026 at 5:32 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > On Mon, May 11, 2026 at 05:19:50PM +0200, Jann Horn wrote:
> > > On Mon, May 11, 2026 at 5:05 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > > > Hmmm I think it's a bit debateable honestly. The ability to handle there being
> > > > gaps is a _new thing_, so there are no semantics to speak of. Prevoiusly
> > > > mremap() simply required that you only span across a single VMA.
> > >
> > > FWIW, I think mremap() on a source region with gaps is such a
> > > hazardous operation that nearly no userspace code should be doing it -
> > > gaps are areas in which any mmap() call without a fixed address could
> > > place unrelated mappings (unless stack VMAs are involved, which would
> > > also be a weird scenario), so to use it safely, you have to, among
> > > other things, make sure not to use libc malloc() at a time when that
> > > could place an allocation in the gap (which means you also can't use
> > > printf(), and so on, unless you have swapped out the memory
> > > allocator), and make sure that you have no other threads that could be
> > > doing that, and so on. There are rare circumstances under which it
> > > could be safe, but I think it is almost always better to have a
> > > PROT_NONE anonymous VMA or such as a placeholder.
> >
> > Well, we're holding the mmap write lock so none of that could happen
> > _during_ the operation right?
>
> Not during the operation, but right before the operation. So from the
> userspace perspective, you have to know that there are no concurrent
> threads that could be creating memory mappings at non-fixed addresses,
> and you have to know that no mappings can have been created in the
> memory range between when you checked that it's empty and when you
> make the syscall.

That's a very good point :)

But I guess applies to any operations that operate over a range of mappings
anyway (madvise() lets you also do this, though it'll give an error code
_at the end_ _after having done the operations_ if there are gaps).

So madvise() can have the exact same thing happen right? which is... fun :)

I actually wonder if we shouldn't just change this to disallow gaps. It'd
simplify the code and we could even do the check upfront in one pass. It's
doubtful anybody is relying on the gaps behaviour for anything real.

>
> > You might debate also the fact we hold that for an extended period.
>
> Eh, I mean, that's also true if you call mmap() with MAP_FIXED on a
> gigantic virtual address region with lots of populated PTEs in it or
> such, or if you call mprotect() on a big region. I don't think it is
> problematic that there are some very chonky MM syscalls you can make
> that will hold the mmap_lock for a long time, as long as we don't
> expect heavily multithreaded code to be doing those operations
> frequently. (Being able to keep the mmap lock held in write mode for a
> long time can be useful as an exploitation trick in some cases, but I
> don't think that's easy enough to fix to be worth the trouble of
> addressing it.)

Yeah true.

>
> > Honestly I probably shouldn't have allowed for this, I've had to do at
> > least one fixup relating to it I seem to recall and the semantics are
> > _clearly_ confusing.
> >
> > >
> > > I think the right documentation for this is "do not use this on a
> > > source region with gaps, it is technically possible but extremely
> > > hazardous".
> >
> > Yeah, I mean on reflection, allowing it was probably a mistake.
> >
> > The real use case was 'my VMAs are fragmented and I don't want to have to
> > know about VMA merge rules in order to move them', i.e. no gaps.
> >
> > I will do a manpage update and indicate that it probably shouldn't be used
> > but if it is, the sematics are such that gaps are not propagated (i.e. it
> > is as if you mremap()'d each individually).
>
> Thanks!

Cheers, Lorenzo
