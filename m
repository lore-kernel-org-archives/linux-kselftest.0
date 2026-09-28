Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D349D37206F;
	Mon, 28 Sep 2026 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597873; cv=none; b=EHSaOD1KLHkUxbNfzuarAszjHhCwn99i1TL21o4LjPOwpZupMfu3av9fHu1X448wmCEfA+YD9RYhvB4n0wi2MDGFb9t4NNDgetnJkdFsHZLQMWp5VSUbCRw54454l/JLR6B2111ci4X+I0KmytleSCiPcmUnqPHQWT2AyrMAcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597873; c=relaxed/simple;
	bh=ErFpJtbE+YPmaNoZM7+kwJwpJlwxQ9c6cPLysUWBqnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMsx2HhyBuJsGqSOyOhQUf2cYqHmA1ClbTwR07wMyWQutc8ffG+QFqpIRWbRDAU14rtVRI7C0vjUDrJNH1vy8Uo9ADyLeQy2ANY8DVOi/6kSyaf2evmYnDt2aIjURBdbpNe89eIYg448jNcQ7LHhSmRWuBMCazEQcaNu3GCHeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPEG/58+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPEG/58+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B015C1F000FF;
	Mon, 28 Sep 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790597871;
	bh=qUWE1Nns7BSebGwQ1gbt/Sg0nKXkGgJZK1GCdXS2Jc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JPEG/58+zJnmurdypr8TjzQsxuvsVil0Pev1L5z1BFKhc3aAa54QqiISdgVscORKH
	 Xn3S7sfgSQ4Ep/sfoXQXEK4Mdr2AW2mf5/Ssk7kUaO16YpjNxY+2jFJ1+nCpeXKA3p
	 Xp1phBI/6Ir5ODbctL5zt78mymPzKYxCTUPiZrFPimEk196Mp6ae9udyzsA7d7g0LK
	 cMiTxdeWkjMkeqiZYlfvZS2XzDtZmsxSxMTjf2katOZz8HaNN6xdNtwK3q06EGeFQC
	 K4wgQ0Z3Eoh/Spdk+vCQz2k8S3wT9jeteeGQ/mUYvlQMFw1dqI4t2Wzn9KTdR73wcf
	 7v2I8DqZy8h3w==
Date: Mon, 28 Sep 2026 13:17:46 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: check MREMAP_DONTUNMAP mlock accounting
Message-ID: <arpayEY9Xk5dB-rj@gremlin>
References: <20260928111055.482136-1-azpijr@gmail.com>
 <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae606df5-7d14-47b4-8569-fe47321bfac7@kernel.org>

On Mon, Sep 28, 2026 at 02:08:51PM +0200, David Hildenbrand (Arm) wrote:
> On 9/28/26 13:10, Jose A. Perez de Azpillaga wrote:
> > MREMAP_DONTUNMAP keeps the source VMA in place, but clears its mlock flags
> > for the whole VMA while setting them on the destination VMA.  Two cases
> > leak mm->locked_vm as a result:
> >
> >  - an unfaulted mlock-on-fault VMA moved behind itself self-merges, so the
> >    single resulting VMA loses the flags without the accounting being
> >    dropped;
> >
> >  - a partial mremap() moves only part of the range, leaving the pages which
> >    are not moved accounted as locked in a VMA whose flags were cleared.
> >
> > Add three cases to the MREMAP_DONTUNMAP selftest which mlock() the source
> > VMA, with and without MLOCK_ONFAULT, perform the operation and check that
> > VmLck comes back to zero once everything is unmapped.  Each case runs in
> > its own process, so it starts from a clean mm with VmLck at zero and a
> > failure cannot propagate to the cases which follow.
> >
> > Verified on x86_64: the three cases fail on v7.3-rc5 and pass on
> > mm-unstable with the fixes from the "mm/mremap: fix two issues with
> > MREMAP_DONTUNMAP" series applied.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> >  tools/testing/selftests/mm/mremap_dontunmap.c | 273 +++++++++++++++++-
>
> @Lorenzo, could something like this also be implemented (maybe with less churn)
> in the vma.c selftests?

It's unfortunately a bit tricky and the work touches mm/mremap.c which is not
isolated in such a way that the VMA userland tests can exercise them.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
