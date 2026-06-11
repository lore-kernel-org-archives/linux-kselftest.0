Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD543594A;
	Thu, 11 Jun 2026 06:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158751; cv=none; b=Vow5EN7D4vljfKxL/XxsBa3iEuu+3nYWROQPKP9FHsNQ9733hI8v4FvJVxsleASu1OjzJhlm4i6xiDgk3RDn2aZuIUfkmjwndWK2Yn0YMtN2v9duGE5qOVxEqGEIeQaBWfKIelCeJeZ020+Ep5uwiZZ2Q49h7/R9AeY4WoMyrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158751; c=relaxed/simple;
	bh=5ielNzdy7pQG+QERCHUszabsGuDEDDJL2FysnECKnls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivREoVFRqjchrJJezidbUnIDhhGPDTXCWm6ekFFEh6+vW+MRSpxeNN/1fGMtybKOudPPkDcb5xkuO2YR0sv46QiAfYhcH949OSrijKlYAVWf5YXxoUh5M7Z0csLTnX05vHGCJTxDqAQYZI0ckdkd9C6gUHcLXjTheSearm0+++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhLzDqo5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhLzDqo5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB3B1F00893;
	Thu, 11 Jun 2026 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781158750;
	bh=6aSwxGmpETKMO5gOuGeJq7TjqE4KH6CoAq7LEyPtOgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PhLzDqo5Cvrc1JYXyvEiz6ZvyzPSZs0EJwhq36Uf6vxl5qrM08p7VaOaG0m1oep+w
	 n9B1+3LdImwuDTcMKpJzcT30v77sbUKgMEXEWBSatXHD1IKWvCIDFbu4+cm5DWqU+A
	 jpokZDBR1qS4saVx83JIZ8PCml2r8hsFEgCusas/Wwjby17a08Z2WGqJ8euYVUkwnU
	 UXSqgZYrHb8ijTXvOuIfKlLcqxnEZre/RTMh0cauC5r4tQCUK0niR6sZu5ntaBFXqs
	 4oaA9r182MOJMtSMYnwKz97Sc3M3621e/hask6ityxPBJQsoe9UM5BU8SsU9KLp+iw
	 jOgzrQ3ToKvrw==
Date: Thu, 11 Jun 2026 07:18:55 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, hughd@google.com, 
	willy@infradead.org, ziy@nvidia.com, liam@infradead.org, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/11] add shmem mTHP collapse support
Message-ID: <aipSe9Snx5x0esQx@lucifer>
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781083630.git.baolin.wang@linux.alibaba.com>

On Wed, Jun 10, 2026 at 06:29:08PM +0800, Baolin Wang wrote:
> (Note: this patchset is not targeting v7.2, but posted for early feedback.)

Hi Baolin,

Speaking broadly, and to repeat what I said to Nico - I'd like to
re-emphasise my _strong_ desire for us to pay down technical debt in THP
code before adding any further major features.

Really I'd have liked to see us do this _before_ khugepaged mTHP, but I
didn't want to put Nico through more than he already endured with that
series :)

So I'd really like to see some action on that before we embark on any
further significant changes.

This is no comment on your changes, just something that we really need to
address in THP generally.

Will try to give some detailed commentary on the actual changes when I have
time also :)

Cheers, Lorenzo

>
> This is a follow-up patchset for mTHP collapse to support shmem mTHP collapse,
> which is based on Nico's patchset[1].
>
> The shmem mTHP collapse strategy follows the anonymous mTHP collapse approach:
> track present pages via a bitmap while scanning PMD ranges for collapse candidates,
> then use the bitmap after the scan completes to determine the most efficient
> mTHP order to collapse to. Built on the basic framework added for anonymous
> mTHP collapse, the shmem mTHP collapse implementation is straightforward
> (Thanks for Nico's work).
>
> In addition, I have added some anon/shmem mTHP collapse selftests, and now all
> khugepaged test cases can pass.
>
> Note: I have not yet enabled large order collapse for file folios (file folios
> currently only support PMD-sized large folio collapse). Although file large order
> collapse would be more straightforward to implement after shmem mTHP collapse
> support is added (requiring some changes to file_thp_enabled()), I think this
> still need some discussion on whether it is necessary to support other large
> orders collapse for file folios.
>
> Comments are welcome. Thanks.
>
> Changes from RFC v1:
> https://lore.kernel.org/all/cover.1755677674.git.baolin.wang@linux.alibaba.com/
>  - Rebase on the new code, and update to use the new functions.
>  - Add more test cases.
>
> [1] https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/
>
> Baolin Wang (11):
>   mm: khugepaged: add max_ptes_none check in collapse_file()
>   mm: khugepaged: generalize collapse_file() for shmem mTHP support
>   mm: khugepaged: add an order check for PMD-sized THP statistics
>   mm: khugepaged: add shmem mTHP collapse support
>   mm: shmem: run khugepaged for all shmem mTHP orders
>   mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
>   mm: khugepaged: skip large folios that don't need to be collapsed
>   selftests: mm: extend the check_huge() to support mTHP check
>   selftests: mm: move gather_after_split_folio_orders() into vm_util.c
>     file
>   selftests: mm: implement the mTHP-sized hugepage check helpers
>   selftests: mm: add mTHP collapse test cases
>
>  include/linux/shmem_fs.h                      |   4 +-
>  mm/khugepaged.c                               | 174 ++++++++++++----
>  mm/shmem.c                                    |  10 +-
>  .../selftests/mm/folio_split_race_test.c      |   2 +-
>  tools/testing/selftests/mm/khugepaged.c       | 195 +++++++++++++-----
>  .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
>  tools/testing/selftests/mm/run_vmtests.sh     |   4 +
>  tools/testing/selftests/mm/soft-dirty.c       |   2 +-
>  .../selftests/mm/split_huge_page_test.c       | 139 +------------
>  tools/testing/selftests/mm/uffd-common.c      |   4 +-
>  tools/testing/selftests/mm/vm_util.c          | 184 ++++++++++++++++-
>  tools/testing/selftests/mm/vm_util.h          |   8 +-
>  12 files changed, 492 insertions(+), 236 deletions(-)
>
> --
> 2.47.3
>
