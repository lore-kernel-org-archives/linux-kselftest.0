Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76CB3A6B65;
	Tue, 18 Aug 2026 10:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047889; cv=none; b=nKa4XMUz0ecZO51q4RsyPKuwuFgepsKAd6hxIiYOI+9I7NPoPHjbg/Z5xXQp3cFHhGfn/UPQE3dA9oVcpyBE5cR9fZ085UvHkRHmoR1k/u7dQLgFpkzN0pgkwoHP9xZBbSRerEO446Q40EpXg76aKfjVOU6Xb5RNNnV1DLjHO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047889; c=relaxed/simple;
	bh=DCbuBDOSHbpfAg1bii4TBcCRolcZGlhWZ4wKh1xtoj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBEQPRSvuB2WBtqZF5r+YCDHmOynZuAzNRHUNfMflIQmDr3o448Ihcybz2YKFm4qSDuDTJSTeiv6GdR9Z7zcnZIhxbP1v7r48J37RD7Qcb1/Bl5jTL/9JPmySMqJhT3vO6SiC7TLsVrMvG2TG9ZJ2RMNs2YQuSBTavX/pp4p+kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TG6lUBXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TG6lUBXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D561F000E9;
	Tue, 18 Aug 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047887;
	bh=VbQXsDHeiEZVSZYhBtiXerG/ChW5kGrPyhOfZsr0oQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TG6lUBXEGl96pjFeOwujMG+E90mrmdWMQ1E9eM7NtYcKMqHiSc8SN810u579PLg3/
	 vq76DoI3mluVgsHMjJGMVT9ZMbGnglOHSpQhEtTDeoXFYtMHs5XWz8HjUeETm9a2+y
	 4742/sptD+d11W09R40BLPfO6VJBDYt7qCvxG+lb87LvudG6mvKuXMZiSv6XLES46R
	 ncLRLcRS6iMU064ya5cOu3YI2uZqdhgk+M2gnBU8kkbsid35zkh3hGb700Atc4dpaX
	 6B7JHXOA1J3OzilKoEbmSUnAo4FSoRDzSlrd2M+xKZ+ZQpbm7W32BHQ+Q6G0RFGtnI
	 8ZT1BrxJEZPrw==
Date: Tue, 18 Aug 2026 11:11:05 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 05/19] selftests/mm: make the swap cases' swapout
 reliable
Message-ID: <aoQvTjRbcnQNCAuY@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-6-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-6-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:47AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_swapin_single_pte() and collapse_max_ptes_swap() swap a range out
> and then require smaps to report exactly the count they asked for.  Two
> things keep that count from arriving.
>
> MADV_PAGEOUT is best effort, so the count often turns up a moment late.
>
> And wait_for_scan() leaves MADV_HUGEPAGE behind, so khugepaged is still
> working on the range.  Collapsing a range with up to max_ptes_swap pages
> swapped out means reading them back in, so the daemon empties the swap as
> fast as the case fills it.  On arm64 with 64K pages max_ptes_swap is 1024
> pages, which is 64M a step, and the case loses:
>
>     # Swapout 1024 of 8192 pages... Fail
>     not ok 10 collapse_max_ptes_swap
>
> Ask again for up to two seconds, with the range held out of the daemon's
> reach while asking.  The collapse each case runs next puts MADV_HUGEPAGE
> back, so only the setup is affected.
>
> If the pages still will not go, skip.  A machine with no swap, or swap too
> small, full, capped by a memcg or busy with writeback, is not the kernel
> under test refusing.  An error from madvise() itself still ends the run.
>
> Assisted-by: Claude-Code:claude-opus-5
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 53 +++++++++++++++++++------
>  1 file changed, 41 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index ec5c36a19d92..7eb9db0005a0 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -219,6 +219,41 @@ static bool check_swap(void *addr, unsigned long size)
>  	return swap;
>  }
>
> +/*
> + * Page the range out and wait for the swap count to say so.
> + *
> + * Two things get in the way.  MADV_PAGEOUT is best effort:
> + * shrink_folio_list() leaves a folio alone when it cannot reclaim it right
> + * away, and one still under writeback from an earlier pageout is the common
> + * case, so the count the caller asks for arrives a moment later.  And a range
> + * an earlier collapse left MADV_HUGEPAGE is one khugepaged is still working
> + * on: collapsing a range with up to max_ptes_swap pages swapped out means
> + * reading those pages back in, so the daemon undoes the pageout as fast as it
> + * is asked for.  Keep the range out of its reach; the collapse the caller runs
> + * next puts MADV_HUGEPAGE back.
> + *
> + * Failing to get the pages out is the machine's answer, not the kernel's --
> + * swap too small, swap full, a memcg cap, a folio still under writeback -- so
> + * callers skip rather than fail.  An error from madvise() is different, and
> + * ends the run here.
> + */

This is a schloppy comment again. Please trim.

Walls of text are not wanted anywhere.

> +static bool swapout_range(void *p, unsigned long size)
> +{
> +	int i;
> +
> +	if (madvise(p, size, MADV_NOHUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_NOHUGEPAGE)");
> +
> +	for (i = 0; i < 40; i++) {
> +		if (madvise(p, size, MADV_PAGEOUT))
> +			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
> +		if (check_swap(p, size))
> +			return true;
> +		usleep(50 * 1000);
> +	}
> +	return false;
> +}
> +
>  static void *alloc_mapping(int nr)
>  {
>  	void *p;
> @@ -827,12 +862,10 @@ static void collapse_swapin_single_pte(struct collapse_context *c, struct mem_op
>  	ops->fault(p, 0, hpage_pmd_size);
>
>  	ksft_print_msg("Swapout one page...");
> -	if (madvise(p, page_size, MADV_PAGEOUT))
> -		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
> -	if (check_swap(p, page_size)) {
> +	if (swapout_range(p, page_size)) {
>  		success("OK");
>  	} else {
> -		fail("Fail");
> +		skip("Could not swap out");
>  		goto out;
>  	}
>
> @@ -853,12 +886,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>  	ops->fault(p, 0, hpage_pmd_size);
>
>  	ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap + 1, hpage_pmd_nr);
> -	if (madvise(p, (max_ptes_swap + 1) * page_size, MADV_PAGEOUT))
> -		ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
> -	if (check_swap(p, (max_ptes_swap + 1) * page_size)) {
> +	if (swapout_range(p, (max_ptes_swap + 1) * page_size)) {
>  		success("OK");
>  	} else {
> -		fail("Fail");
> +		skip("Could not swap out");
>  		goto out;
>  	}
>
> @@ -870,12 +901,10 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
>  		ops->fault(p, 0, hpage_pmd_size);
>  		ksft_print_msg("Swapout %d of %d pages...", max_ptes_swap,
>  		       hpage_pmd_nr);
> -		if (madvise(p, max_ptes_swap * page_size, MADV_PAGEOUT))
> -			ksft_exit_fail_perror("madvise(MADV_PAGEOUT)");
> -		if (check_swap(p, max_ptes_swap * page_size)) {
> +		if (swapout_range(p, max_ptes_swap * page_size)) {
>  			success("OK");
>  		} else {
> -			fail("Fail");
> +			skip("Could not swap out");
>  			goto out;
>  		}
>
> --
> 2.54.0
>

--
Cheers, Lorenzo
