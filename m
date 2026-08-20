Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2E2EBB8D;
	Thu, 20 Aug 2026 08:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215257; cv=none; b=Ho3zmwAL++1wYZAD9aymKRoWWqKmD5NA7durG/LobpcJBDEKq6ylHJZrGGsLrYSBHeUKXuL40gryvD+0yQ2lneZUkyWzEWSV4J5macADg7MfyK00GvY5GYnfbdcOxs91SqLKzsCrj9j5GvWgVzvR90ImW6pKtmYD+c+RNS5mb4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215257; c=relaxed/simple;
	bh=zlEcv6yiOLdHir22+kkdgf6q2jJyPudv5uH94YWZkQo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=E13RiMaUDUsTYRrzfgLqY7fKhAFjlhf9kdvPB0ocbFIPETmOmYyz+JpXHwNIdSBznKfI21zaYoFqNXUQyCWA5vLow0ceC5IMYBt/5YMMUegMXZ1GQXZT1Z/nBmK9wmDGrSZlboI/Tt9JE9HZ8kHkhwwo7W70hotiifmsMY2DkwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivA5gWwo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivA5gWwo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA301F000E9;
	Thu, 20 Aug 2026 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215256;
	bh=gBdjBx1YsDTFwnZ3I58K5RxANHs66TKFjnUSFDktRdc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ivA5gWwoA5e/8ObfYdUslPWKBktQN8We+u7eqmXGqWx6wV4i3FnezogcK8DARaDdD
	 qvLOAaM1T7LfWWSXrpreNCWDD2U9MLDfdkHiAuRhQzzglatIj38K8m00QbYdLrUcWg
	 nvAbMLQ2wDbCgb/Rgi9VI4F3aXWQOft3d6/xD68fThfOlyUAG3fc8A5qxpMZKAwbCw
	 889CtZwTeWR2cxPrNTq075JIDkUA7HDYG1cajaZWy4unl8e5Ltrfkb8yt7MZDEJvC/
	 XPccEyXGiUQuWgytEw0ZgcrYoH1O3ZzGWw9djkNFB6UeAlvYOVr/Cdf8QPpMKCaUTf
	 yMBZJITjP6IYQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 05/19] selftests/mm: make the swap cases' swapout
 reliable
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260815015901.1236937-6-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-6-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523516.2799959.17614116166980239496.b4-review@b4>
X-Mailer: b4 0.17-dev

> collapse_swapin_single_pte() and collapse_max_ptes_swap() swap a range out
> and then require smaps to report exactly the count they asked for.  Two
> things keep that count from arriving.
> 
> MADV_PAGEOUT is best effort, so the count often turns up a moment late.
> 
> And wait_for_scan() leaves MADV_HUGEPAGE behind, so khugepaged is still

"... leaves range as eligible for collapsing, so khugepaged is still
working on it."

> working on the range.  Collapsing a range with up to max_ptes_swap pages
> swapped out means reading them back in, so the daemon empties the swap as
> fast as the case fills it.  On arm64 with 64K pages max_ptes_swap is 1024
> pages, which is 64M a step, and the case loses:

".. the case looses the race:"

> 
>     # Swapout 1024 of 8192 pages... Fail
>     not ok 10 collapse_max_ptes_swap
> 
> Ask again for up to two seconds, with the range held out of the daemon's
> reach while asking.  The collapse each case runs next puts MADV_HUGEPAGE
> back, so only the setup is affected.

"Retry several times for up to two seconds meanwhile holding the range
out of the khugepaged reach. The collapse each case runs next restores
MADV_NOHUGEPAGE, so only setup is affected"

> 
> If the pages still will not go, skip.  A machine with no swap, or swap too

"If the pages still won't swap out, skip".

> small, full, capped by a memcg or busy with writeback, is not the kernel
> under test refusing.  An error from madvise() itself still ends the run.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index b436b401e2ea..a3d14cc1a2bf 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -241,6 +241,41 @@ static bool check_swap(void *addr, unsigned long size)
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

I'd replace this cumbersome comment with

> + */
> +static bool swapout_range(void *p, unsigned long size)
> +{
> +	int i;
> +

	/* prevent khugepaged from swapping into this range */

> +	if (madvise(p, size, MADV_NOHUGEPAGE))
> +		ksft_exit_fail_perror("madvise(MADV_NOHUGEPAGE)");
> +

	/*
	 * retry several times because MADV_PAGEOUT is best effort.
	 * sleep between the retries to give a chance for outstanding
	 * writebacks for pages being swapped out to finish.
	 */

-- 
Sincerely yours,
Mike.

