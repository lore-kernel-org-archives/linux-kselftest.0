Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E38B3DAAAC;
	Tue, 18 Aug 2026 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048753; cv=none; b=LKDcVVtB+BnslabaCi1uLkQz4QsnjZj+1wul8gIYgBQ/ULpACGNhjW+bBTComOFNA62luZwWW3lsZ9ucUzzmPpKqcnNEdr+0mK5bLELFl64BYNvk8BfH54GqezpBbY3fgzUuvp2QPHAlcWYA1KNJbkMwvt6WKsIJzXJK4WqoG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048753; c=relaxed/simple;
	bh=H+7KrMZXmNJamgCTdpD3g3rAhaqNEBVgqDVjtH9VAWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+pWoQOiJv3FgMLfdOF/26IO0FyBbf2EF2PIlNvKXWCwaQN+Vj/O2w7qs0v79EnfwwrRREON/nU7PJHBuquG4aoEYmoGV/1Z8SRWNIJptdqgEBg00pYtQ4cOOPAbSe464CxrWn9BtjypYulSWwPPXAMqVjqsyPKPz7/m8JeRNQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQGfEf4S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQGfEf4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7A71F000E9;
	Tue, 18 Aug 2026 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787048749;
	bh=9venlAYI7bc+4UF3P+DsNZ7UbsjWk6/adcKmtx/yJEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQGfEf4Sjm0ecEEdEi7v/xrseuBpYZHAmo+r1TVdH/Suu9l1kSwUkIpdROZ8L9Bba
	 7Rtbzq39W022yjAIC+ffKOFr9Jgo5oN0JCCv3evZG6Pgnv+Gu/Z5n/+wLuNYpRzjp3
	 HUuyxmJBiQCQENoSTw/vN61x5nNYf+HCAlXpZyl/2LI1yE7y/WqTWhU+WR8y7/Ooln
	 n5w40LWFVGT2AQuHtpxwROQwqIhKsX+uirM48GMhGbvgdtniYn7fnLDmKEydrr0wP/
	 XcoPdKamXHCfApYT5TfAJZoYe08HtZG1BtwhDh2sfJk8RYitTOOje0mNWb1ZQoVH5X
	 hAS8Pl5ntln5w==
Date: Tue, 18 Aug 2026 11:25:27 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 08/19] selftests/mm: add folio-order check for address
 ranges
Message-ID: <aoQxLVg3IsTuA9NE@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-9-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-9-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:50AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> An mTHP collapse test needs to know that a range is backed by folios of the
> target order, and that they sit where a collapse would put them.  Nothing
> answers that today: is_backed_by_folio() classifies the folio behind a
> single page, and check_huge_anon() reads smaps AnonHugePages, which only
> accounts PMD mappings.
>
> Add is_range_backed_by_folio_orders().  For every order-aligned window of
> the range it requires a present head PFN at its natural alignment and a
> contiguous PFN run across the window.
>
> A window backed by two smaller folios fails the contiguity check, and a
> folio mapped off the window's alignment fails the head check.  The mTHP
> cases need both to tell a collapsed window from the one beside it.
>
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  tools/testing/selftests/mm/vm_util.c | 42 ++++++++++++++++++++++++++++
>  tools/testing/selftests/mm/vm_util.h |  2 ++
>  2 files changed, 44 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 5db1a7774f49..c9bd6c92fa41 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -556,6 +556,48 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>  	return false;
>  }
>
> +/*
> + * Check whether every order-@order window of [start, len) maps exactly one

Strange to reference @order in a non-kdoc comment. And then to start referring
to start and len without @? :)

And I'm not sure 'window' is really clear here as a term...

> + * folio of that order, head to tail.  The address range must be naturally
> + * aligned, each window's PFN run must be contiguous, and a window's first
> + * PFN must be the folio head.

Also 'PFN run' is adding a new vague term.

> + *
> + * This is the check "did this range collapse into order-@order folios": a
> + * window assembled from parts of several folios, or mapping a folio shifted
> + * from its natural position, fails.

I think you could simplify this to something like:

	Check that the buffer @start of @len bytes is mTHP-backed by @order
	folios wholly contained within the range.

	This requires that @buffer is aligned to @order and that every folio
	is fully contained head-to-tail.

	Returns: true if wholly mTHP backed, false otherwise.

> + */
> +bool is_range_backed_by_folio_orders(char *start, size_t len, int order,

is_range_mthp_backed() seems a lot clearer?

> +				     int pagemap_fd, int kpageflags_fd)
> +{
> +	const unsigned long nr_pages = 1UL << order;
> +	const size_t window = nr_pages * psize();

folio_size seems clearer?

> +	char *vaddr;
> +
> +	if ((uintptr_t)start % window || len % window)
> +		return false;
> +
> +	for (vaddr = start; vaddr < start + len; vaddr += window) {
> +		unsigned long pfn = pagemap_get_pfn(pagemap_fd, vaddr);

NIT: can const-ify.

> +		unsigned long i;
> +
> +		/* Not present, or not mapping the folio head. */

'Or a tail page' maybe?

> +		if (pfn == -1UL || pfn % nr_pages)
> +			return false;
> +
> +		for (i = 1; i < nr_pages; i++) {
> +			if (pagemap_get_pfn(pagemap_fd, vaddr + i * psize()) !=
> +			    pfn + i)
> +				return false;
> +		}

NIT: can drop the {}.

> +
> +		if (!is_backed_by_folio(vaddr, order, pagemap_fd,
> +					kpageflags_fd))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  /* If `ioctls' non-NULL, the allowed ioctls will be returned into the var */
>  int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
>  			      bool miss, bool wp, bool minor, uint64_t *ioctls)
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 56a28ce7d029..39dfb18dc10c 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -99,6 +99,8 @@ int gather_folio_orders(char *vaddr_start, size_t len,
>  		int pagemap_fd, int kpageflags_fd, int orders[], int nr_orders);
>  bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>  			int kpageflags_fd);
> +bool is_range_backed_by_folio_orders(char *start, size_t len, int order,
> +				     int pagemap_fd, int kpageflags_fd);
>
>  int uffd_register(int uffd, void *addr, uint64_t len,
>  		  bool miss, bool wp, bool minor);
> --
> 2.54.0
>

--
Cheers, Lorenzo
