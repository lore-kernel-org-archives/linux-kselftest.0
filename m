Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03793FE65C;
	Mon, 11 May 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510710; cv=none; b=ex/B4+guuEU+KL2nbVZ22ucuVuIQsv9WZwnCgOG7Z3oR3y1N8CJA7J/h2lsWyZzptQa3jqnwuV9NMO9iZOigbMQr4T4zi1myCR+FlWUZ+68i7dYJoy5TCq5I8eUUcuXwvK9H6M80ZPmJAwtRPHe/OkAZQjL6fNrojpJDEL13WDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510710; c=relaxed/simple;
	bh=I58VxrthrFE2hsqt1f7n8z3Ftt+pNK/sskUmzPCZk1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRKMtSr2mpuMBAVFTjCOCEnmrCE1cAfCoC6Q4DUwvwhMxcTaQoeX68EFmiaUAdJPn6xEcB+dgAoCKI7K1qo/KgeA9HubfQy3LWlYvCM20jvxj1ltfERTi7JDuVO05wwXwAL/jaUQIZSO1rkghZ36Zk/TE9krogbfu5Doa91rX4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Mps5e0bE; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Mps5e0bE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YzVPJqG/qdv32dfB2Pkj62g8vYaU78q3x/Fdun8yAf8=; b=Mps5e0bEcBN3c6hLG1mDHddHe8
	T6BRb3fiN7sc5Hzeli/1STuk7ycdAKTgb3rjbAHWToMkD8PEXHy1Adc+wcl/+swdZUd008CTrfz2D
	Upl9Ed0ruLyktChEP1lRgtR4Xnwbscv+0uNTyM1wNSIHtw/VYQ6Tzn/e4h2FJRzaRau6X2h2abohs
	0MM1BMesq8alM58ecHo2ycyq5MMC4E2HvQH5HPC9wUKgD0ATYcWhjfchBkZno3qhULcOw2SnMRsHM
	H5xS3flH0kgoZjn1mrEygDqpIZletQmtUDfUvJMNYVFdEAatMIpefdFfWfY4SQzmMLpdPqIc8NElc
	631D6ItQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wMRsB-001fjV-1u;
	Mon, 11 May 2026 14:44:43 +0000
Date: Mon, 11 May 2026 07:44:37 -0700
From: Breno Leitao <leitao@debian.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
	akpm@linux-foundation.org, corbet@lwn.net, skhan@linuxfoundation.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 2/4] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <agHp-wFHe3FjWAAV@gmail.com>
References: <aftnSfb15G92JON5@gmail.com>
 <20260510144220.92522-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510144220.92522-1-lance.yang@linux.dev>
X-Debian-User: leitao

On Sun, May 10, 2026 at 10:42:20PM +0800, Lance Yang wrote:
> 
> On Wed, May 06, 2026 at 09:18:12AM -0700, Breno Leitao wrote:
> >On Tue, Apr 28, 2026 at 11:07:21AM +0800, Lance Yang wrote:
> >> 
> >> On Mon, Apr 27, 2026 at 05:49:28PM +0200, David Hildenbrand (Arm) wrote:
> >> >> +	switch (type) {
> >> >> +	case MF_MSG_KERNEL:
> >> >> +	case MF_MSG_UNKNOWN:
> >> >> +		return true;
> >> >> +	case MF_MSG_KERNEL_HIGH_ORDER:
> >> >> +		/*
> >> >> +		 * Rule out a concurrent buddy allocation: give the
> >> >> +		 * allocator a moment to finish prep_new_page() and
> >> >> +		 * re-check. A genuine high-order kernel tail page stays
> >> >> +		 * unowned; an in-flight allocation will have bumped the
> >> >> +		 * refcount, attached a mapping, or placed the page on
> >> >> +		 * an LRU by now.
> >> >> +		 */
> >> >> +		p = pfn_to_online_page(pfn);
> >> >> +		if (!p)
> >> >> +			return true;
> >> >> +		/*
> >> >> +		 * Yield so a concurrent allocator on another CPU can
> >> >> +		 * finish prep_new_page() and have its writes become
> >> >> +		 * visible before we resample the page state.
> >> >> +		 */
> >> >> +		cpu_relax();
> >> >> +		return page_count(p) == 0 &&
> >> >> +		       !PageLRU(p) &&
> >> >> +		       !page_mapped(p) &&
> >> >> +		       !page_folio(p)->mapping &&
> >> >> +		       !is_free_buddy_page(p);
> >> >
> >> >I don't get what you are doing here. The right way to check for a tail page is
> >> >not by checking the refcount.
> >> >
> >> >Further, you are not holding a folio reference? If so, calling
> >> >page_mapped/folio_mapped is shaky. On concurrent folio split you can trigger a
> >> >VM_WARN_ON_FOLIO().
> >> >
> >> >
> >> >Maybe folio_snapshot() is what you are looking for, if you are in fact not
> >> >holding a reference?
> >> 
> >> Right! Maybe we should not try to make this decision in
> >> panic_on_unrecoverable_mf().
> >> 
> >> By the time we get here, we only know the final MF_MSG_* type. The
> >> real reason why get_hwpoison_page() failed is already lost.
> >> 
> >> Wonder if it would be better to split that earlier, around
> >> __get_unpoison_page()/get_any_page(). That code still knows why
> >> grabbing the page failed, either an unsupported kernel page or
> >> just a temporary race we cannot really trust :)
> >> 
> >> Then the later panic logic can be simple: panic for the stable
> >> unsupported kernel page case, and not for the temporary race case.
> >> 
> >> That would also avoid trying to guess MF_MSG_KERNEL_HIGH_ORDER here:)
> >
> >This is a very good feedback, and definitely what I wanted to do, but,
> >failed. Once we have the reason, we don't need this dance to guess the
> >reason.
> >
> >I've hacked a patch based on this approach. How does it sound?
> 
> Yes. This direction makes sense to me, not an expert though :D
> 
> I played with something similar (untested) on top of patch #01:

Thanks!

I'll prepare a new series addressing all the feedback from both
reviewers and AI analysis. I will resend soon and we can catch up
on the next revision,

Thanks for the review,
--breno
