Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC76415B7E;
	Fri, 28 Aug 2026 10:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913116; cv=none; b=FGXeiv1r5il8XRTE3erkEV7OKhXp6/pE+Ey/tbxDIvior16EVhRfluVlaC/yZ6TLNOFQFf1kcJ9z0BHUG26/4sWVrSAjJ8vu1ybWmYRcmldNkhO/skQOJFqpr7yKMvK/YClpvQHmILnJ6nGQJs0oWvgMJjU634PH49WoO3NFAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913116; c=relaxed/simple;
	bh=VLmy+23wSUMzFyOWBFEJkdW6wQyehsnhIV8JJJbWhJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0ony8afwkaGlnWZwzZElbJCdlr6evD4BofTS7zaKUz6D+pby5d74N4jloG5vige61wMcuRn9b/EB15OvG1gV4xnt6lzvDetBzR1DaKCop7/WTSUYDvxlRSl5KdpWpEYt07N2jqV/l2ZdNsBmsNOyhRvrg46SX8vGWcJI7E+fKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P989eIXz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P989eIXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B03E1F000E9;
	Fri, 28 Aug 2026 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787913115;
	bh=VLmy+23wSUMzFyOWBFEJkdW6wQyehsnhIV8JJJbWhJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P989eIXze+S82yL2CVHsL74+giO6o33ilLH9BPNZn0niAdRKaHqMhWO7/NSTDr6H9
	 Eew7wwFmGkmovJVq+UmD64uLpJoJDCxE7UbFoBXxEeCbcJk/H4Mm3PN19Txi9312Ew
	 +lE0dy0ry+lkzp2WJKe39CpBwaPy3dql9U7K2CNbU9iBq4bXJNwVoltY8BROi7R5qb
	 Hc4O59X2WWHfTaw+95o/hy8Ie8Bc8UFT9aeLV1gL5ELMOEKoekGQ+5wUUhCqiafGx+
	 iuqeChfF+32+ZTbGrv2DG7FhlXkz8EQZa/ueGq0p+zzPy7Ak+KtnGLtJ4DKSGVrx2m
	 y8sH74ZBQiJgA==
Date: Fri, 28 Aug 2026 11:31:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <apFhDA4e1sBfDOeh@gremlin>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-2-374022586a4b@arm.com>
 <apFMvo8pCzaGKope@gremlin>
 <apFgVvNMbdhYnu6p@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apFgVvNMbdhYnu6p@e129823.arm.com>

On Fri, Aug 28, 2026 at 11:17:58AM +0100, Yeoreum Yun wrote:
> > On Fri, Aug 28, 2026 at 09:11:34AM +0100, Yeoreum Yun wrote:
> > > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > > made by memalign().
> > >
> > > The underlying VMA may start at a different address from the aligned
> > > address returned by memalign(). Furthermore, a subsequent
> > > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > > already set.
> > >
> > > This causes split_huge_page_test to fail because the check_huge_xxx()
> > > helpers incorrectly require the address returned by memalign() to
> > > match the VMA start address reported in /proc/self/smaps.
> >
> > Hmm, is the test correctly putting sentinels either side of the VMA? Any test
> > that doesn't risks flaking due to unwanted VMA merges.
>
> I believe that with this change, we don’t need to worry about unwanted
> VMA merges when checking for huge pages, since the test no longer relies
> on VMA sentinels but directly checks whether the mapping is huge or not.

We always need to worry about that though, anything that asserts stuff on a
VMA level must prevent unwanted merges first.

I guess I'm asking you in a roundabout way to go check and if there isn't
isolation like that (i.e. mapping PROT_NONE VMAs around the VMA you want)
then to go do that :)

I think glibc going off and mapping a bigger VMA is possibly a symptom
of this not being done.

>
> Also, this flaky failure was not caused by a VMA merge, but by a change
> in glibc’s behavior that sets HUGEPAGE for sufficiently large areas.

Yep your change is worthwhile reagrdless! :)

>
> Might for the *NO_HUGEPAGE* setup, there would be a chance to merge
> VMA area, But since it seraches the mapping directly, it's fine.

As above, generally we should put this protection in case, even if it's
unlikely for a VMA with VMA_NOHUGEPAGE_BIT set!

>
> >
> > >
> > > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> > > /proc/self/smaps to detect huge pages.
> >
> > You should probably call out the fact you're doing some refactoring here
> > also!
>
> Okay. I'll spell out with some detail. Thanks!

Thnks!

>
> >
> > >
> > > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> >
> > Should always have a Closes: tag if Reported-by: ideally.
>
> Yes. but talked with personally nothing to close. So Reported-by tag
> only. Would it be better to remove?

Yeah or Suggested-by maybe? If he said it to you on-list then a Closes:
<lore link> works also!

--
Cheers, Lorenzo
