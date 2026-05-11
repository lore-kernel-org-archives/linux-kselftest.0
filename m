Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652C43CED5;
	Mon, 11 May 2026 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517028; cv=none; b=rhauX22MAgm4rmPK6udKj7uFOtyLGzPsw7a7GF0SLhLXiUtxhrK4U7F1ICDleCbO2N4/4dqLE0T7n94/gv0eiV/d/k2K1Pk5c+KFOVeJYrosfqFl/rsD/a4H7FgI2NB4LIwwQhH0LdByWHS2kO2sxP2pDZ+CIVeySxLOScwU4xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517028; c=relaxed/simple;
	bh=tKzB3n2pZ3f6uHbbaVkoKRbJGh4urMLgKHF9vhSQNpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UP/k2yU/t2VsE5GDOPTK3HNrdCWaWbngAeM1zE9o67x4YFCc1JUIJ9UTHH4FHWI9jmcH58IJlxO/vRRAXUoo4RGrA4UfZPQnZECKlaw8QVIc0iO6A6GsEJqEQZ8vVGE+1wWKsTtdeEQINR+9aFiLLieP3sR7a3YBfiobmeOqxdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBN9ChgE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBN9ChgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40EFC2BCF6;
	Mon, 11 May 2026 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778517027;
	bh=tKzB3n2pZ3f6uHbbaVkoKRbJGh4urMLgKHF9vhSQNpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBN9ChgECFXikL4CiwRCWlR+GJQL9QQffkEc6rcM5TI8MIdev0o/ha7GkDQoUNO0C
	 7hrjkfgjgLDjnRjR9lD58KA08S+zZILNxCrcnf6mDwbUS6K0y82V0Mky/At29fZVRn
	 X7npXMta/u3/4WDSou8l3DVig/us8BkUUO2XfsIMrPPNBEr636fRU4fLjkOENF+8Td
	 ir1t7eccTSYDnlVKrhGtFGRlD5GXfxWHOTMSVrSBiPKieTFyQ6+hYa5ImXMoJVrk5c
	 9xbVg/0sYsxMwoipVjZzBEKJTI8DUIE8wbd8QjtWWWcC7n0Jbkk9OVU8rZcTTF7zed
	 kF7HW9Mmzu9Mg==
Date: Mon, 11 May 2026 17:30:23 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Jann Horn <jannh@google.com>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
Message-ID: <agICeiIEshWf-1xa@lucifer>
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
 <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
 <agH7ONBSX7XLzS6q@lucifer>
 <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>

On Mon, May 11, 2026 at 06:02:37PM +0200, Jann Horn wrote:
> On Mon, May 11, 2026 at 6:00 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > On Mon, May 11, 2026 at 05:40:24PM +0200, Jann Horn wrote:
> > > On Mon, May 11, 2026 at 5:32 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > > > On Mon, May 11, 2026 at 05:19:50PM +0200, Jann Horn wrote:
> > > > > On Mon, May 11, 2026 at 5:05 PM Lorenzo Stoakes <ljs@kernel.org> wrote:
> > > > > > Hmmm I think it's a bit debateable honestly. The ability to handle there being
> > > > > > gaps is a _new thing_, so there are no semantics to speak of. Prevoiusly
> > > > > > mremap() simply required that you only span across a single VMA.
> > > > >
> > > > > FWIW, I think mremap() on a source region with gaps is such a
> > > > > hazardous operation that nearly no userspace code should be doing it -
> > > > > gaps are areas in which any mmap() call without a fixed address could
> > > > > place unrelated mappings (unless stack VMAs are involved, which would
> > > > > also be a weird scenario), so to use it safely, you have to, among
> > > > > other things, make sure not to use libc malloc() at a time when that
> > > > > could place an allocation in the gap (which means you also can't use
> > > > > printf(), and so on, unless you have swapped out the memory
> > > > > allocator), and make sure that you have no other threads that could be
> > > > > doing that, and so on. There are rare circumstances under which it
> > > > > could be safe, but I think it is almost always better to have a
> > > > > PROT_NONE anonymous VMA or such as a placeholder.
> > > >
> > > > Well, we're holding the mmap write lock so none of that could happen
> > > > _during_ the operation right?
> > >
> > > Not during the operation, but right before the operation. So from the
> > > userspace perspective, you have to know that there are no concurrent
> > > threads that could be creating memory mappings at non-fixed addresses,
> > > and you have to know that no mappings can have been created in the
> > > memory range between when you checked that it's empty and when you
> > > make the syscall.
> >
> > That's a very good point :)
> >
> > But I guess applies to any operations that operate over a range of mappings
> > anyway (madvise() lets you also do this, though it'll give an error code
> > _at the end_ _after having done the operations_ if there are gaps).
> >
> > So madvise() can have the exact same thing happen right? which is... fun :)
> >
> > I actually wonder if we shouldn't just change this to disallow gaps. It'd
>
> That would be nice...

Yeah let's go with that then I think :)

>
> > simplify the code and we could even do the check upfront in one pass. It's
> > doubtful anybody is relying on the gaps behaviour for anything real.
>
> (I remember that in the past, there were concerns that MM operations
> with multiple passes are slow, but I guess mremap() is probably not
> such a hot operation that that's a concern here.)

Yeah not at all, it's rather an expensive operation and if it's on your hot path
then you did something wrong :)

Cheers, Lorenzo
