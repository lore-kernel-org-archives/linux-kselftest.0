Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0B63E9F83
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776180525; cv=none; b=ezu4wWqxlMsrtJIli2rUZoCok0zUauQd7gdpLaBjwWqaYrEvilgaiDE1x4Vc9/P72xI70vnvQWdh3FQdFFm+NRM3vKJHBSsAHOrJGCcbx0lEykHa+k2t5jIwpMPg3RRC3AtLodQqwJ0YacV734fhGtLTbvzfY4a1EF0aNw5YQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776180525; c=relaxed/simple;
	bh=MzYVanG4BGpx9RDhwtBMmu174CqftxZMIG+S6GlO+jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9GYw+oE5Ncjc4wwIfqVCq+zO04MxcrHx16sGzho3aFXBOiUg2k0uHGvxh0XdgIGvHdjRr+Rgyp3aYH9hnt3Ha6CKGNsbfUWgt1N2LUMBcNXWIUOEUkM0BdLsJy1w/SAKuHfRmirn+zAxXQ7n4YAH4QBRwLMQ1Ofn3NM/JK+rX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4cRofnk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H1wYe296; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4cRofnk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H1wYe296"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776180519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eTbXvKaxwhs+y3kG83ryFZztyaR2djpY/Q1BdL5kUs=;
	b=c4cRofnkLh+uLL/9hq+Cc80b+gCqbV+xYNuV2pnEA6omybBaMfbjVWCElS4zZv4KFHXqzd
	sI0gH4oVgRjpXqG19W6+7tJyKItU8sbCVC7cLLUwO4oFJtUEHK/2rQPPjT4oX2hDYZWvCu
	tOwy8tSkU4+OCp/Q++tgu+gzE60jMnA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-xCZNf-A_PVWYq6L2uNUanQ-1; Tue, 14 Apr 2026 11:28:38 -0400
X-MC-Unique: xCZNf-A_PVWYq6L2uNUanQ-1
X-Mimecast-MFC-AGG-ID: xCZNf-A_PVWYq6L2uNUanQ_1776180517
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d4c2906fdfso609432785a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 08:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776180517; x=1776785317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/eTbXvKaxwhs+y3kG83ryFZztyaR2djpY/Q1BdL5kUs=;
        b=H1wYe296HNX7HKnNKJvl1vNBgCdVB2ZMPmzIH+zqFRQoYZNZ5AGO14k4WOWFFd6ksG
         PmTqqXmPqHK0SY4rbq3GFKMNmwz4srGOEe2hfZL3BHNRLQmmcdkWGWFKXL8adjgJUc5c
         wdxikZlJMoRcplRmErrxl7CxpLoXapmfjpkz8guQC7quryf/j9se7nEz6l1sGe3UETIg
         b+lX0thq/2g/Pte9Lmhk7+t3jhVQyPWpE1R5/S/jWFtRG4xsg+3f8bNQ0l/mEZxf5YOr
         JYz32BO2lSktzEqU1NIAzN8VNX4NAs320IqqVvWQELUkDBp89y3ZglvuJwlmIiEgwsRE
         03Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776180517; x=1776785317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/eTbXvKaxwhs+y3kG83ryFZztyaR2djpY/Q1BdL5kUs=;
        b=QfvcUcuGVRHvj1GBMChGKmdzfmVwjMZplbFKsnB1kBWYF5sRBsdjwJqWeAO3/oM/tO
         TL0w4fEFmQji1cx4rT9VxFgfAZRwgHRUWzc4DgQob/2S7OskuP3omrCH8/fAHFsCgLj5
         KxSmWqFauQpskaXe6Ye0bPA0C2kM8lGDo8YEY1nfj1h0jDysnlOb+ydGf5WqyZ+I3oMQ
         HxXEYFWL3gPJIiKatp9KaNPLnsot3tLneIsyh2H//N/SE4SjjYkfldsPNSwwAyavdmLH
         Mmg4m2qJY7xuIYbFCUyZ6uoaduWZ46Qf43cV0EdR0yvPO5fnaJti+jWTP5L3tkOu6mdZ
         NjrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dD2EQyoDXwcapPburpQ1I+FV++ZtzJ/nua5WLesjMbDP4lRNBig2ytMdrHX9cMgTYOCgvFJSqhwDgOgxwKf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOi8K1utHUaJUhR0Oj53VzHvukKHmiirhaSE0790ocfDCGYqQr
	MDh5m6IHOn8QjJ65PmwTZHmxPVN9S6jerlphkKnFdtSKewmu9M45nLh1tDsd4pF/ZEzJKLHj2T9
	jNuy7EKDAB10CKsytmCpdfMG2YPryQXoRz7D1rSOYZf82zNU5sVLjsopt4K/xzIVUeIIfaQ==
X-Gm-Gg: AeBDievloEaEhnb2xZVKupKnHi82FCSHjRbuBAsL2UoOxn4bxDCZBO2oyh0EsHiBA4P
	/n6Z9b8KaeGGK0LhjUK1LMxj6BRQJDyJ/PqpfSeJUbbZ7TNtxjsjbiDF11UDbHLiAvPtSbkHrTO
	QJ3227fvXdWAL1gTr3unSj6gY7YER3KLXYJeLTt0WNlY52/8xTax8EehaBmK3jCc4oCgWZLObNE
	uFWrO0XbgeSuDMOYEaKi0w4R1PtVVGoIbWdbYjF/g6IbCSgQyRqkt+9hX0EA4Iq1pSfsscyEy6K
	SQthTO/U9fhP1bL4Ne5tw4uLAxzgHPTrgCrrcENXDkVj/vZRsr6KxTtkeKznlgbUMOKInIEpcRQ
	29g8TJXr0njbd1jui+bMPtI1DdFYVmj3j5vSsameKBjVB+RY=
X-Received: by 2002:a05:620a:4487:b0:8d6:2beb:9470 with SMTP id af79cd13be357-8ddcf8b07a9mr2656285885a.40.1776180517038;
        Tue, 14 Apr 2026 08:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:8d6:2beb:9470 with SMTP id af79cd13be357-8ddcf8b07a9mr2656278685a.40.1776180516369;
        Tue, 14 Apr 2026 08:28:36 -0700 (PDT)
Received: from x1.local ([142.189.10.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb963d7edsm1115242285a.39.2026.04.14.08.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:28:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 11:28:33 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Zi Yan <ziy@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	James Houghton <jthoughton@google.com>,
	Andrea Arcangeli <aarcange@redhat.com>
Subject: Re: [RFC, PATCH 00/12] userfaultfd: working set tracking for VM
 guest memory
Message-ID: <ad5dIUpAMs4MuBvV@x1.local>
References: <20260414142354.1465950-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260414142354.1465950-1-kas@kernel.org>

Hi, Kiryl,

On Tue, Apr 14, 2026 at 03:23:34PM +0100, Kiryl Shutsemau (Meta) wrote:
> This series adds userfaultfd support for tracking the working set of
> VM guest memory, enabling VMMs to identify cold pages and evict them
> to tiered or remote storage.

Thanks for sharing this work, it looks very interesting to me.

Personally I am also looking at some kind of VMM memtiering issues.  I'm
not sure if you saw my lsfmm proposal, it mentioned the challenge we're
facing, it's slightly different but still a bit relevant:

https://lore.kernel.org/all/aYuad2k75iD9bnBE@x1.local/

Unfortunately, that proposal was rejected upstream.

For us, it's so far more about migration and how migration process
introduce zero impact to guest workloads especially on hotness.  I'm not
sure if we have any shared goals over that aspect.

> 
> == Problem ==
> 
> VMMs managing guest memory need to:
> 1. Track which pages are actively used (working set detection)
> 2. Safely evict cold pages to slower storage
> 3. Fetch pages back on demand when accessed again
> 
> For shmem-backed guest memory, working set tracking partially works
> today: MADV_DONTNEED zaps PTEs while pages stay in page cache, and
> re-access auto-resolves from cache. But safe eviction still requires
> synchronous fault interception to prevent data loss races.
> 
> For anonymous guest memory (needed for KSM cross-VM deduplication),
> there is no mechanism at all — clearing a PTE loses the page.
> 
> == Solution ==
> 
> The series introduces a unified userfaultfd interface that works
> across both anonymous and shmem-backed memory:
> 
> UFFD_FEATURE_MINOR_ANON: extends MODE_MINOR registration to anonymous
> private memory. Uses the PROT_NONE hinting mechanism (same as NUMA
> balancing) to make pages inaccessible without freeing them.
> 
> UFFD_FEATURE_MINOR_ASYNC: auto-resolves minor faults without handler
> involvement. The kernel restores PTE permissions immediately and the
> faulting thread continues. Works for anonymous, shmem, and hugetlbfs.
> 
> UFFDIO_DEACTIVATE: marks pages as deactivated. For anonymous memory,
> sets PROT_NONE on PTEs (pages stay resident). For shmem/hugetlbfs,
> zaps PTEs (pages stay in page cache).
> 
> UFFDIO_SET_MODE: toggles MINOR_ASYNC at runtime, synchronized via
> mmap_write_lock. Enables the VMM workflow: async mode for lightweight
> detection, sync mode for race-free eviction.
> 
> PAGE_IS_UFFD_DEACTIVATED: PAGEMAP_SCAN category flag for efficient
> batch detection of cold (still-deactivated) anonymous pages.
> 
> == VMM Workflow ==

AFAIU, this workflow provides two functionalities:

> 
>     UFFDIO_DEACTIVATE(all)            -- async, no vCPU stalls
>     sleep(interval)
>     PAGEMAP_SCAN                      -- find cold pages

Until here it's only about page hotness tracking.  I am curious whether you
evaluated idle page tracking.  Is it because of perf overheads on rmap?  To
me, your solution (until here.. on the hotness sampling) reads more like a
more efficient way to do idle page tracking but only per-mm, not per-folio.

That will also be something I would like to benefit if QEMU will decide to
do full userspace swap.  I think that's our last resort, I'll likely start
with something that makes QEMU work together with Linux on swapping
(e.g. we're happy to make MGLRU or any reclaim logic that Linux mm
currently uses, as long as efficient) then QEMU only cares about the rest,
which is what the migration problem is about.

The other issue about idle page tracking to us is, I believe MGLRU
currently doesn't work well with it (due to ignoring IDLE bits) where the
old LRU algo works.  I'm not sure how much you evaluated above, so it'll be
great to share from that perspective too.  I also mentioned some of these
challenges in the lsfmm proposal link above.

>     UFFDIO_SET_MODE(sync)             -- block faults for eviction
>     pwrite + MADV_DONTNEED cold pages -- safe, faults block
>     UFFDIO_SET_MODE(async)            -- resume tracking

These operations are the 2nd function.  It's, IMHO, a full userspace swap
system based on userfaultfd.

Have you thought about directly relying on userfaultfd-wp to do this work?
The relevant question is, why do we need to block guest reads on pages
being evicted by the userapp?  Can we still allow that to happen, which
seems to be more efficient?  IIUC, only writes / updates matters in such
swap system.

Also, I'm not sure if you're aware of LLNL's umap library:

https://github.com/llnl/umap

That implemnted the swap system using userfaultfd wr-protect mode only, so
no new kernel API needed.

Thanks,

> 
> The same workflow applies to shmem, with a different PAGEMAP_SCAN mask
> (!PAGE_IS_PRESENT instead of PAGE_IS_UFFD_DEACTIVATED).
> 
> == NUMA Balancing ==
> 
> NUMA balancing scanning is skipped on anonymous VM_UFFD_MINOR VMAs to
> avoid protnone conflicts. NUMA locality stats are fed from the uffd
> fault path via task_numa_fault() so the scheduler retains placement
> data. Shmem VMAs are unaffected (UFFDIO_DEACTIVATE zaps PTEs there,
> no protnone involved).
> 
> == Testing ==
> 
> The series includes 6 new selftests covering async/sync modes,
> PAGEMAP_SCAN cold detection, GUP through protnone, UFFDIO_SET_MODE
> toggling, and cleanup on close. All 73 uffd unit tests pass
> (including hugetlb) across defconfig, allnoconfig, allmodconfig,
> and randomized configs.
> 
> Kiryl Shutsemau (Meta) (12):
>   userfaultfd: define UAPI constants for anonymous minor faults
>   userfaultfd: add UFFD_FEATURE_MINOR_ANON registration support
>   userfaultfd: implement UFFDIO_DEACTIVATE ioctl
>   userfaultfd: UFFDIO_CONTINUE for anonymous memory
>   mm: intercept protnone faults on VM_UFFD_MINOR anonymous VMAs
>   userfaultfd: auto-resolve shmem and hugetlbfs minor faults in async
>     mode
>   sched/numa: skip scanning anonymous VM_UFFD_MINOR VMAs
>   userfaultfd: enable UFFD_FEATURE_MINOR_ANON
>   mm/pagemap: add PAGE_IS_UFFD_DEACTIVATED to PAGEMAP_SCAN
>   userfaultfd: add UFFDIO_SET_MODE for runtime sync/async toggle
>   selftests/mm: add userfaultfd anonymous minor fault tests
>   Documentation/userfaultfd: document working set tracking
> 
>  Documentation/admin-guide/mm/userfaultfd.rst | 141 ++++-
>  fs/proc/task_mmu.c                           |  11 +-
>  fs/userfaultfd.c                             | 184 +++++-
>  include/linux/huge_mm.h                      |   6 +
>  include/linux/mm.h                           |   2 +
>  include/linux/sched/numa_balancing.h         |   1 +
>  include/linux/userfaultfd_k.h                |  21 +-
>  include/trace/events/sched.h                 |   3 +-
>  include/uapi/linux/fs.h                      |   1 +
>  include/uapi/linux/userfaultfd.h             |  40 +-
>  kernel/sched/fair.c                          |  13 +
>  mm/huge_memory.c                             |  33 +-
>  mm/hugetlb.c                                 |   3 +-
>  mm/memory.c                                  |  51 +-
>  mm/mprotect.c                                |   9 +-
>  mm/shmem.c                                   |   3 +-
>  mm/userfaultfd.c                             | 164 +++++-
>  tools/testing/selftests/mm/uffd-unit-tests.c | 458 +++++++++++++++
>  18 files changed, 1096 insertions(+), 48 deletions(-)
> 
> Kiryl Shutsemau (Meta) (12):
>   userfaultfd: define UAPI constants for anonymous minor faults
>   userfaultfd: add UFFD_FEATURE_MINOR_ANON registration support
>   userfaultfd: implement UFFDIO_DEACTIVATE ioctl
>   userfaultfd: UFFDIO_CONTINUE for anonymous memory
>   mm: intercept protnone faults on VM_UFFD_MINOR anonymous VMAs
>   userfaultfd: auto-resolve shmem and hugetlbfs minor faults in async
>     mode
>   sched/numa: skip scanning anonymous VM_UFFD_MINOR VMAs
>   userfaultfd: enable UFFD_FEATURE_MINOR_ANON
>   mm/pagemap: add PAGE_IS_UFFD_DEACTIVATED to PAGEMAP_SCAN
>   userfaultfd: add UFFDIO_SET_MODE for runtime sync/async toggle
>   selftests/mm: add userfaultfd anonymous minor fault tests
>   Documentation/userfaultfd: document working set tracking
> 
>  Documentation/admin-guide/mm/userfaultfd.rst | 141 +++++-
>  fs/proc/task_mmu.c                           |  11 +-
>  fs/userfaultfd.c                             | 184 +++++++-
>  include/linux/huge_mm.h                      |   6 +
>  include/linux/mm.h                           |   2 +
>  include/linux/sched/numa_balancing.h         |   1 +
>  include/linux/userfaultfd_k.h                |  21 +-
>  include/trace/events/sched.h                 |   3 +-
>  include/uapi/linux/fs.h                      |   1 +
>  include/uapi/linux/userfaultfd.h             |  40 +-
>  kernel/sched/fair.c                          |  13 +
>  mm/huge_memory.c                             |  33 +-
>  mm/hugetlb.c                                 |   3 +-
>  mm/memory.c                                  |  51 ++-
>  mm/mprotect.c                                |   9 +-
>  mm/shmem.c                                   |   3 +-
>  mm/userfaultfd.c                             | 164 ++++++-
>  tools/testing/selftests/mm/uffd-unit-tests.c | 458 +++++++++++++++++++
>  18 files changed, 1096 insertions(+), 48 deletions(-)
> 
> -- 
> 2.51.2
> 
> 

-- 
Peter Xu

