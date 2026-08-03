Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651672D9780;
	Mon,  3 Aug 2026 01:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720083; cv=none; b=lnZnGLSL5hNBKMkFM1lsyS6BZ6yno5/IjKwTIzFgLab3aGf/as7PzmWdtisQYW3ziifue9fidXPp6p/b+D9DGgbbVuKDVBm/jvtoB1+rTQoCXrImDb9qmLfttyJtcEptzMQ95imuCnXpsqWQVCG65sVNs1sPdrw9KyKIyssBXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720083; c=relaxed/simple;
	bh=sZzecVOQkjCVnu+hLzIf9KwEe3NedOfLz9Tt02jQRiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHC4UrihWvCVsIG4F5XXJ8ZM8QcuSFknOr5dCwXT2wL7EoqkhAyb9qBgSMXOXWy1wqVAxb9yIFg4CTXpcvACj0sAxbd0jIRKjNvDUBnfb5/BD2ho8ARyVTm5U1JiZ2n6+JOCa1sOC5MNJ6LohtON5Q/OKU3cwDVj1FP8nLoREKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QEISm6gV; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QEISm6gV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785720072; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=42NsJQFvkSGCAxhpN3JTXKrMrElWaI1s02NNzRaLxS0=;
	b=QEISm6gVTo32Ga+cDIWZ8shxdgRPC9jmN1zUk+DA4RI+Rd6RnXLZqiAbLyxuCZsPnktdzV0izZOtOhh5c1RoFkO0zn9B+UehAZ1kbOZAgDIzo7ZKV7FzjdJYSWmqe5vFb4KcASMtruHhpwKfi0Mouroj2BeKBcqPNjyHmh/jYYE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X8D0ULo_1785720070;
Received: from 30.74.144.148(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8D0ULo_1785720070 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 03 Aug 2026 09:21:10 +0800
Message-ID: <f9f01bc0-490b-4d06-85a0-e4693b80696c@linux.alibaba.com>
Date: Mon, 3 Aug 2026 09:21:09 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] selftests/mm: improve khugepaged coverage
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Nico Pache <nico.pache@linux.dev>
Cc: Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Hugh Dickins <hughd@google.com>, Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260802195254.1937477-1-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260802195254.1937477-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/3/26 3:52 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> mTHP collapse went in for 7.2 with no functional selftest coverage. Every
> khugepaged collapse case is PMD-shaped, down to the detection: it reads
> smaps AnonHugePages, which cannot see anything below the PMD order.

Yes, I’ve already sent out several versions of mTHP collapse test 
cases[1]. Not sure if you’ve seen my patchset, and it looks like some of 
our work overlaps :(

[1] 
https://lore.kernel.org/all/cover.1785564857.git.baolin.wang@linux.alibaba.com/

> I am also reworking khugepaged's collapse mechanism, and that wants a suite
> worth trusting before the mechanism changes underneath it. Nothing here
> depends on the rework -- everything passes on an unmodified kernel and
> documents what khugepaged already does.
> 
>   - vm_util grows folio-order helpers: is_backed_by_folio() moves out of
>     split_huge_page_test.c, and a range-level form asks whether every
>     order-aligned window of a range is backed by one folio of exactly that
>     order, mapped head to tail.
> 
>   - folio_order_check validates those helpers against the kernel for every
>     anon THP order it supports, before any collapse test trusts them.
> 
>   - khugepaged_full_pass() drives exactly one scan pass through the sysfs
>     wake path, so a barrier completes on the daemon's own cadence instead of
>     needing a short scan_sleep_millisecs.
> 
>   - khugepaged -o <order> runs order-parameterized anon collapse cases: a
>     full table, only the populated window, default max_ptes_none and
>     max_ptes_none=0, and collapse upward from smaller large folios. Any
>     order up to the PMD order, where the same cases baseline the PMD path.
> 
>   - khugepaged_race races two faulters, MADV_DONTNEED, transient FOLL_PIN,
>     fork and mremap against one of three collapse drivers: khugepaged a pass
>     at a time, khugepaged free-running, or a MADV_COLLAPSE loop. Every
>     racing page must read as its pattern or as zero. -z collapses
>     hole-bearing windows; -p adds pageout and compaction, the only threads
>     that elevate a source folio's refcount from the reclaim side. DEBUG_VM,
>     page_table_check, KASAN and lockdep are the other half of the oracle.
> 
>   - A shared-source write race pins the CoW isolation contract: a co-sharer
>     writing throughout a collapse must not see the collapsing side's pages.
> 
>   - Four tests fail on the environment rather than on the kernel: the
>     collapse wait is a fixed three seconds whatever a huge page costs to
>     build, collapse_compound_extreme wants a 512M page from the fault path,
>     the shmem cases want a PMD-order page cache folio the page cache caps
>     below, and the swap cases fail instead of skipping without swap. Scale
>     the wait (a 2M PMD is unchanged) and skip the other three. This is why
>     the suite now runs on arm64 with 64K pages.
> 
> Tested on mm-new (1dbd7c34bb92):
> 
>    x86-64 4K    105 pass, 3 skip, 0 fail
>    arm64 64K     87 pass, 7 skip, 0 fail
> 
> The skips are structural: sub-PMD cases decline at the PMD order and the
> mixed-source case at the smallest order, and on 64K pages
> collapse_compound_extreme and the shmem cases skip for the reasons above.
> 
> Kiryl Shutsemau (Meta) (16):
>    selftests/mm: move is_backed_by_folio() into vm_util
>    selftests/mm: add folio-order check for VA ranges
>    selftests/mm: add folio-order detection self-check
>    selftests/mm: add order-parameterized khugepaged collapse cases
>    selftests/mm: add khugepaged completion barrier helper
>    selftests/mm: add khugepaged race harness
>    selftests/mm: cover a shared-source collapse write race
>    selftests/mm: skip collapse_compound_extreme where the PMD is too
>      large
>    selftests/mm: skip khugepaged swap tests when no swap is configured
>    selftests/mm: verify synchronous khugepaged driving is attributable
>    selftests/mm: race-harness variant for permissive hole occupancy
>    selftests/mm: add memory-pressure threads to the khugepaged race
>      harness
>    selftests/mm: parameterize the mixed-source collapse case by source
>      order
>    selftests/mm: zap whole PTE tables in the khugepaged race harness
>    selftests/mm: scale khugepaged's collapse wait with the PMD size
>    selftests/mm: skip khugepaged shmem cases without a PMD page cache
>      folio
> 
>   tools/testing/selftests/mm/.gitignore         |   3 +
>   tools/testing/selftests/mm/Makefile           |   3 +
>   .../testing/selftests/mm/folio_order_check.c  | 138 +++++
>   .../testing/selftests/mm/hugepage_settings.c  |  66 ++-
>   .../testing/selftests/mm/hugepage_settings.h  |   2 +
>   tools/testing/selftests/mm/khugepaged.c       | 430 +++++++++++++++-
>   tools/testing/selftests/mm/khugepaged_race.c  | 483 ++++++++++++++++++
>   .../selftests/mm/khugepaged_sync_check.c      | 198 +++++++
>   tools/testing/selftests/mm/run_vmtests.sh     |  17 +
>   .../selftests/mm/split_huge_page_test.c       |  62 ---
>   tools/testing/selftests/mm/vm_util.c          | 157 ++++++
>   tools/testing/selftests/mm/vm_util.h          |   7 +
>   12 files changed, 1490 insertions(+), 76 deletions(-)
>   create mode 100644 tools/testing/selftests/mm/folio_order_check.c
>   create mode 100644 tools/testing/selftests/mm/khugepaged_race.c
>   create mode 100644 tools/testing/selftests/mm/khugepaged_sync_check.c
> 

