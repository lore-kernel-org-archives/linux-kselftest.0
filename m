Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9906D3CDBD7;
	Mon,  3 Aug 2026 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755081; cv=none; b=MoAiA9n/L6BWgVGJqVcXQcgQoDz2Xfd7w6+eq7VqmrZxltOaTHLhSZhWKu/wEjogauAlldnYUVZjD/ITMT8HupElyBRj7VNSJT3AmF1e5nDvwCTihdsYxX+0q1JfwRGjpYXhXVbkuBW3rTp050U0E3/YFQb15SSUOpWWRZa2nyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755081; c=relaxed/simple;
	bh=JI7GyjjSMFA79ghaTfx/7iWy+BtYjircZY9O//20rsM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NCYuEaDCbaAVQAEQyC34KmJjCnGCqkgHoOUIDaSZF60Cf1jpBmeVNRHE0n51k9soW3Zs8IvjjexjNC1qeNDpOOElZmj8kXdxt5BBOuaSkq+2tjqqNeKtQ/TSmdAV1NxOSN7aj+ePbifvGwYOZ63Qt7SQoODlRYM8UhdH0qezGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PMmVCiB5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMmVCiB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9924C1F000E9;
	Mon,  3 Aug 2026 11:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755076;
	bh=hp7zTybQm+mhJAOmq6bcq40GTnQfmEk+v4OwIE/uVhQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=PMmVCiB5ZCcTFUg9590+cZFq0NC623ucq0Yv3SR5aFPDWWOoWLQK1SQ5auxZcBrsE
	 iI/cYCUI6qWJoBbo9we88l2JCOmGLNsveFXqQVwDAKA0uEE/OkyoUOzLA1F2jZhyIU
	 fENuy/PG0sfJvOdzQ/RVrc96m9MPLUh0uVIva682LQsMcrWo6nJQpjKh1ZgYIPuVpr
	 QXKb5gCr0Dkj/qvRuRtejUbJJHG6IdtBsyj6WfuBgmekGLigeCr6+B/1jD/nLFP4TE
	 gUFVwTqsiYCha8/1n97UtkllzZt7WUYhF9kmM1O4/o7ARat6qVawKabzlGaZxAYnwy
	 5gwXhHkV1jaUA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 00/16] selftests/mm: improve khugepaged coverage
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506321.1561566.145327646496245621.b4-review@b4>
X-Mailer: b4 0.16-dev

> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> mTHP collapse went in for 7.2 with no functional selftest coverage. Every
> khugepaged collapse case is PMD-shaped, down to the detection: it reads
> smaps AnonHugePages, which cannot see anything below the PMD order.
> 
> I am also reworking khugepaged's collapse mechanism, and that wants a suite
> worth trusting before the mechanism changes underneath it. Nothing here
> depends on the rework -- everything passes on an unmodified kernel and
> documents what khugepaged already does.

My overall feeling is that changelogs need more human touch to be
parseable.

>  - vm_util grows folio-order helpers: is_backed_by_folio() moves out of
>    split_huge_page_test.c, and a range-level form asks whether every
>    order-aligned window of a range is backed by one folio of exactly that
>    order, mapped head to tail.
> 
>  - folio_order_check validates those helpers against the kernel for every
>    anon THP order it supports, before any collapse test trusts them.
> 
>  - khugepaged_full_pass() drives exactly one scan pass through the sysfs
>    wake path, so a barrier completes on the daemon's own cadence instead of
>    needing a short scan_sleep_millisecs.
> 
>  - khugepaged -o <order> runs order-parameterized anon collapse cases: a
>    full table, only the populated window, default max_ptes_none and
>    max_ptes_none=0, and collapse upward from smaller large folios. Any
>    order up to the PMD order, where the same cases baseline the PMD path.
> 
>  - khugepaged_race races two faulters, MADV_DONTNEED, transient FOLL_PIN,
>    fork and mremap against one of three collapse drivers: khugepaged a pass
>    at a time, khugepaged free-running, or a MADV_COLLAPSE loop. Every
>    racing page must read as its pattern or as zero. -z collapses
>    hole-bearing windows; -p adds pageout and compaction, the only threads
>    that elevate a source folio's refcount from the reclaim side. DEBUG_VM,
>    page_table_check, KASAN and lockdep are the other half of the oracle.
> 
>  - A shared-source write race pins the CoW isolation contract: a co-sharer
>    writing throughout a collapse must not see the collapsing side's pages.
> 
>  - Four tests fail on the environment rather than on the kernel: the
>    collapse wait is a fixed three seconds whatever a huge page costs to
>    build, collapse_compound_extreme wants a 512M page from the fault path,
>    the shmem cases want a PMD-order page cache folio the page cache caps
>    below, and the swap cases fail instead of skipping without swap. Scale
>    the wait (a 2M PMD is unchanged) and skip the other three. This is why
>    the suite now runs on arm64 with 64K pages.
> 
> Tested on mm-new (1dbd7c34bb92):
> 
>   x86-64 4K    105 pass, 3 skip, 0 fail
>   arm64 64K     87 pass, 7 skip, 0 fail
> 
> The skips are structural: sub-PMD cases decline at the PMD order and the
> mixed-source case at the smallest order, and on 64K pages
> collapse_compound_extreme and the shmem cases skip for the reasons above.
> 
> Kiryl Shutsemau (Meta) (16):
>   selftests/mm: move is_backed_by_folio() into vm_util
>   selftests/mm: add folio-order check for VA ranges
>   selftests/mm: add folio-order detection self-check
>   selftests/mm: add order-parameterized khugepaged collapse cases
>   selftests/mm: add khugepaged completion barrier helper
>   selftests/mm: add khugepaged race harness
>   selftests/mm: cover a shared-source collapse write race
>   selftests/mm: skip collapse_compound_extreme where the PMD is too
>     large
>   selftests/mm: skip khugepaged swap tests when no swap is configured
>   selftests/mm: verify synchronous khugepaged driving is attributable
>   selftests/mm: race-harness variant for permissive hole occupancy
>   selftests/mm: add memory-pressure threads to the khugepaged race
>     harness
>   selftests/mm: parameterize the mixed-source collapse case by source
>     order
>   selftests/mm: zap whole PTE tables in the khugepaged race harness
>   selftests/mm: scale khugepaged's collapse wait with the PMD size
>   selftests/mm: skip khugepaged shmem cases without a PMD page cache
>     folio

I'd put the commits that update the existing tests at the top of the
series and than add the new tests and infrastrucure.

-- 
Sincerely yours,
Mike.

