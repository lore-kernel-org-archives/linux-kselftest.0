Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AA3AF67F
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778702033; cv=none; b=u1Xh+Tf0CejT8cjsboG+x/4lCjuEP2szU8vM+D3FxlKrkAeNj+C7cSJiolrOiOUXKSqYtCfLkE6qxRFt6p3dlXGSF3wcOjolXqnqqsUvTSg290EMuDKT40W5O9VgR319lQQ9J45/tSJK91ea6sfQPwVNGMdUCWE1K54g17kRVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778702033; c=relaxed/simple;
	bh=uzXz859mZmPM6Kqg6l8wgBKQ/yE6jGtupKq4N9PQxlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFDcAYQgUbaCRyRuG1aBVZddrh8H4PusLstfM/fDvaCfYll0EBCAMOxkVlR1n7YhlAbmGMwoNd0HHwy4sOhPtqCFRCgFJIT+YUujcUWN5/xUFZTkc/QQ2PngeGm74WBb3J1m0bO/YJ6FwVvIB9GP3/AItu4mG0DDAsOaLsRxZTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NorOiyVu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NorOiyVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778702030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjFJ6xkcThQO6uaR5c4WCYeu7ze7JvLAoJZ1WfmzNyQ=;
	b=NorOiyVu+kbmtNC6Zja7vbGHNklSw4EiwAARQnyYUfsccFor6faXN4kvZrsFdFjUYqnU1P
	G7ZRh5PdGi79Qdl8FyFiU4MhWjqoF28KHt6XVSZv/KmDQD1sMyHJnjnnGtk4dWL/XZu3GK
	ytmqLbqQcvlE4GYtLaRThMe04FlZ2Gc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-tdxswe6ZOV-aNUlV1Emg_g-1; Wed, 13 May 2026 15:53:47 -0400
X-MC-Unique: tdxswe6ZOV-aNUlV1Emg_g-1
X-Mimecast-MFC-AGG-ID: tdxswe6ZOV-aNUlV1Emg_g_1778702027
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca29dcd69so175156226d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 12:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778702027; x=1779306827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjFJ6xkcThQO6uaR5c4WCYeu7ze7JvLAoJZ1WfmzNyQ=;
        b=seonxceMoUn+3XTC8RIbtECfywRBbvrnzx9vNMOj4RyQHIwUdxK87LhM2qB4WvpCTa
         4tIOlO7Nx3dcVOkl3vLiS//XK+qyiVpCejsdOzn/lh7K4XDgiMheGOXh8c4HhWbVc2x7
         dw2qe98Zrhigul2YTbg7FVfhu5snlRVhPbEG5d6lkTK9LHUkQwC0yeRD8Gn6NDbtO1DL
         U4v7SAvPwqRV/9zYKaUny5h0kr8h+Du7nfZv/MJ7r6fM1tELVK6EqjGzNqHkRty8pdgs
         +j7jl/6dtb3z5NDkm8JiZYyPDNHiu8F5DLrFd/JzxMLoj+fBKr2EXw2sBncigMTlXKHu
         mgqw==
X-Forwarded-Encrypted: i=1; AFNElJ+VVuK1JNeTbN0qCaEYSvReqxtfI/sAebZxsp8IWqmudm2qO/GzYzOHGKWHUM03s94vA5CKeEQEEsoGrWRB3rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ/j23CZh90sNtbMDS6ayH9PbCBNtxSxTdITxsaR82JfxiX9iS
	DXfv/KWwExhUn/pwXqQ4rgV35PYCLIcFBZwXZxLLAPSEC0WKG+rM0q5ZcmyvqWd7YT8OZcuNo7M
	mp0uzO6kOXhAzLSQvFiQ7s3fUVjZ67+T+pEPXF+7F58Fk+iURS8ROCFryqLF0ecLGzInhhQ==
X-Gm-Gg: Acq92OFRp5MJwnlaCRC/0PI4uX1tIYqnTq87QYyU5VeHLcNMkR+AA5dRzwXb57ewlSN
	/cxAOEufc/L3qaGezrd1ZCZ30gPyW99LecHq12J+sAK6WnHnCtQjbBNdGHR0UUwoprTA7q3yjFF
	zmmRhMDUMPZ9pE1Qux6deYccDQO5DU9MiYMNmnJouROPdl9koKHPPrhGr0dyrhYIwO8MN5C43Om
	p47SujTsfsYMEeFXe+OetW8406UXxECj7s5Jpq3sgXdPyQWi/iRUkQ/rZg1f5b/WlviFjAE91TQ
	4w39c9CH4apTl9deEZeVLakOosXtnOAOaFuT62mwv9I+v+IgVGidl40acHmEMngS4jcxGe1a7Ge
	LGN1d79E3QFA9E+kIpYdNk/hOUUBBrfQuNV1etH/8JwZ2wwSbGpl2tHI2XfnAZ9ZeIxXrn1t6PL
	Zi+HgwbtrittQAr53xNlKkRS0=
X-Received: by 2002:a05:6214:3198:b0:89c:806c:93 with SMTP id 6a1803df08f44-8c7bb0cf75amr76266736d6.30.1778702026781;
        Wed, 13 May 2026 12:53:46 -0700 (PDT)
X-Received: by 2002:a05:6214:3198:b0:89c:806c:93 with SMTP id 6a1803df08f44-8c7bb0cf75amr76266146d6.30.1778702026202;
        Wed, 13 May 2026 12:53:46 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-22-70-53-202-134.dsl.bell.ca. [70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90bb8241dsm4617986d6.34.2026.05.13.12.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 12:53:45 -0700 (PDT)
Message-ID: <e25811f5-8f5e-4ba5-8eab-95e351c94e95@redhat.com>
Date: Wed, 13 May 2026 15:53:44 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/55] make MM selftests more CI friendly
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Li Wang <li.wang@linux.dev>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Nico Pache <npache@redhat.com>,
 Peter Xu <peterx@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260511162840.375890-1-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260511162840.375890-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-05-11 12:27, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> There's a lot of dancing around HugeTLB settings in run_vmtests.sh.
> Some test need just a few default huge pages, some require at least 256 MB, and
> some just skip lots of tests if huge pages of all supported sizes are not
> available.
> 
> The goal of this set is to make tests deal with HugeTLB setup and teardown.
> 
> There are already convenient helpers that allow easy reading and writing of
> /proc and /sysfs, so adding a few APIs that will detect and update HugeTLB
> settings shouldn't be a big deal. But these nice helpers use kselftest
> framework, and many of HugeTLB (and even THP) test don't, so as a result this
> patchset also includes a lot of churn for conversion of those tests to
> kselftest framework (patches 7-19).
> 
> The series break out:
> patches 1-5:   small fixes
> patch 6:       merge of hugetlb mmap tests
> patch 7:       renaming of hugepage-* to hugetlb-*
> patches 8-21:  mechanical conversion to kselftest framework
> patches 22-28: extension of thp_settings to hugepage_settings to also include
>                 HugeTLB helpers
> patches 29-30: add helpers for setting up SHM limits in hugetlb-shm and
>                 thuge-gen tests
> patches 31-53: integrate the new APIs in all the tests that use HugeTLB
> patches 54-55: drop HugeTLB setup from run_vmtests.sh

I re-tested this as I did for previous versions and it works for me.
I see my my Tested-by is already there, but just in case:

Tested-by: Luiz Capitulino <luizcap@redhat.com>

Also, this is a great series Mike. Thanks for doing it!

> 
> --
> @Andrew, I think it's good to go now.
> 
> I'm sure Sashiko will still have somehting to say, but there is really a lot of
> room for imporvement in our selftests and with Sashiko being overly pedantic
> we'd be stuck forever.
> 
> v4 changes:
> * rework fork()ed process cleanup in migration test to be more robust
> * rework HugeTLB setup to use free pages before allocating new ones,
>    add hugetlb_setup_default_exact() for compaction test
> * guard against double save/restore of THP and HugeTLB settings
> * convert uffd error macros to use ksft reporting
> * fix ksft reporting in several tests
> * gracefully bail out if default huge page size is 0 in several tests
>    and gup_test
> * add more tags, thanks everyone!
> 
> v3: https://lore.kernel.org/all/20260428204240.1924129-1-rppt@kernel.org
> * add patches that fix cleanup of fork()ed processes in migration test
> * drop MADV_REMOVE changes to khugepage test
> * properly setup memfd for non-default hugepages in hugetlb-mmap test
> * add forgotten hugetlb_save_settings() to hugetlb_setup()
> * fixes for ksft reporting
> * rebase on v7.1-rc1
> * add more tags, thanks everyone!
> 
> v2: https://lore.kernel.org/all/20260418105539.1261536-1-rppt@kernel.org
> * fix hugetlb mmap tests to actually test file mappings
> * increase maximal tests number in khugepaged
> * add tags, thanks everyone!
> 
> v1: https://lore.kernel.org/all/20260406141735.2179309-1-rppt@kernel.org
> 
> Mike Rapoport (Microsoft) (55):
>    selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
>    selftests/mm: migration: don't assume huge page is TWOMEG
>    selftests/mm: migration: make nthreads represent number of working threads
>    selftests/mm: migration: properly cleanup fork()ed processes
>    selftests/mm: run_vmtests.sh: don't gate THP and KSM tests on HAVE_HUGEPAGES
>    selftests/mm: merge map_hugetlb into hugepage-mmap
>    selftests/mm: rename hugepage-* tests to hugetlb-*
>    selftests/mm: hugetlb-shm: use kselftest framework
>    selftests/mm: hugetlb-vmemmap: use kselftest framework
>    selftests/mm: hugetlb-madvise: use kselftest framework
>    selftests/mm: hugetlb_madv_vs_map: use kselftest framework
>    selftests/mm: hugetlb-read-hwpoison: use kselftest framework
>    selftests/mm: khugepaged: group tests in an array
>    selftests/mm: khugepaged: use ksefltest framework
>    selftests/mm: ksm_tests: use kselftest framework
>    selftests/mm: protection_keys: use descriptive test names in the output
>    selftests/mm: protection_keys: use kselftest framework
>    selftests/mm: uffd-common: use kselftest framework
>    selftests/mm: uffd-stress: use kselftest framework
>    selftests/mm: uffd-unit-tests: use kselftest framework
>    selftests/mm: va_high_addr_switch: use kselftest framework
>    selftests/mm: add atexit() and signal handlers to thp_settings
>    selftests/mm: rename thp_settings.[ch] to hugepage_settings.[ch]
>    selftests/mm: move HugeTLB helpers to hugepage_settings
>    selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
>    selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages
>    selftests/mm: hugepage_settings: rename and rework get_free_hugepages()
>    selftests/mm: hugepage_settings: add APIs for HugeTLB setup and teardown
>    selftests/mm: move read_file(), read_num() and write_num() to vm_util
>    selftests/mm: vm_util: add helpers to set and restore shm limits
>    selftests/mm: compaction_test: use HugeTLB helpers ...
>    selftests/mm: cow: add setup of HugeTLB pages
>    selftests/mm: gup_longterm: add setup of HugeTLB pages
>    selftests/mm: gup_test: add setup of HugeTLB pages
>    selftests/mm: hmm-tests: add setup of HugeTLB pages
>    selftests/mm: hugepage_dio: add setup of HugeTLB pages
>    selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
>    selftests/mm: hugetlb-madvise: add setup of HugeTLB pages
>    selftests/mm: hugetlb_madv_vs_map: add setup of HugeTLB pages
>    selftests/mm: hugetlb-mmap: add setup of HugeTLB pages
>    selftests/mm: hugetlb-mremap: add setup of HugeTLB pages
>    selftests/mm: hugetlb-shm: add setup of HugeTLB pages
>    selftests/mm: hugetlb-soft-offline: add setup of HugeTLB pages
>    selftests/mm: hugetlb-vmemmap: add setup of HugeTLB pages
>    selftests/mm: migration: add setup of HugeTLB pages
>    selftests/mm: pagemap_ioctl: add setup of HugeTLB pages
>    selftests/mm: protection_keys: use library code for HugeTLB setup
>    selftests/mm: thuge-gen: add setup of HugeTLB pages
>    selftests/mm: uffd-stress: use hugetlb_save and alloc huge pages
>    selftests/mm: uffd-unit-tests: add setup of HugeTLB pages
>    selftests/mm: uffd-wp-mremap: add setup of HugeTLB pages
>    selftests/mm: va_high_addr_switch: add setup of HugeTLB pages
>    selftests/mm: va_high_addr_switch.sh: drop huge pages setup
>    selftests/mm: run_vmtests.sh: free memory if available memory is low
>    selftests/mm: run_vmtests.sh: drop detection and setup of HugeTLB
> 
>   Documentation/admin-guide/mm/hugetlbpage.rst  |  15 +-
>   tools/testing/selftests/mm/.gitignore         |   4 +
>   tools/testing/selftests/mm/Makefile           |  13 +-
>   tools/testing/selftests/mm/compaction_test.c  | 115 +-----
>   tools/testing/selftests/mm/cow.c              |  31 +-
>   .../selftests/mm/folio_split_race_test.c      |  25 +-
>   tools/testing/selftests/mm/guard-regions.c    |   2 +-
>   tools/testing/selftests/mm/gup_longterm.c     |   5 +-
>   tools/testing/selftests/mm/gup_test.c         |  15 +
>   tools/testing/selftests/mm/hmm-tests.c        |  24 +-
>   tools/testing/selftests/mm/hugepage-mmap.c    |  78 ----
>   .../{thp_settings.c => hugepage_settings.c}   | 316 +++++++++++++--
>   .../{thp_settings.h => hugepage_settings.h}   |  82 +++-
>   tools/testing/selftests/mm/hugetlb-madvise.c  | 215 ++++------
>   tools/testing/selftests/mm/hugetlb-mmap.c     | 143 +++++++
>   .../{hugepage-mremap.c => hugetlb-mremap.c}   |  15 +-
>   .../selftests/mm/hugetlb-read-hwpoison.c      | 121 +++---
>   .../mm/{hugepage-shm.c => hugetlb-shm.c}      |  69 ++--
>   .../selftests/mm/hugetlb-soft-offline.c       |  45 +--
>   .../{hugepage-vmemmap.c => hugetlb-vmemmap.c} |  46 +--
>   tools/testing/selftests/mm/hugetlb_dio.c      |  15 +-
>   .../selftests/mm/hugetlb_fault_after_madv.c   |   9 +-
>   .../selftests/mm/hugetlb_madv_vs_map.c        |  22 +-
>   tools/testing/selftests/mm/khugepaged.c       | 380 ++++++++----------
>   tools/testing/selftests/mm/ksm_tests.c        | 182 ++++-----
>   tools/testing/selftests/mm/map_hugetlb.c      |  88 ----
>   tools/testing/selftests/mm/migration.c        | 147 ++++---
>   tools/testing/selftests/mm/pagemap_ioctl.c    |  13 +-
>   tools/testing/selftests/mm/pkey-helpers.h     |  15 +-
>   .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
>   tools/testing/selftests/mm/protection_keys.c  | 130 +++---
>   tools/testing/selftests/mm/run_vmtests.sh     | 174 ++------
>   tools/testing/selftests/mm/soft-dirty.c       |   2 +-
>   .../selftests/mm/split_huge_page_test.c       |   2 +-
>   tools/testing/selftests/mm/thuge-gen.c        |  96 +----
>   tools/testing/selftests/mm/transhuge-stress.c |   2 +-
>   tools/testing/selftests/mm/uffd-common.h      |  18 +-
>   tools/testing/selftests/mm/uffd-stress.c      |  43 +-
>   tools/testing/selftests/mm/uffd-unit-tests.c  | 138 ++++---
>   tools/testing/selftests/mm/uffd-wp-mremap.c   |  20 +-
>   .../selftests/mm/va_high_addr_switch.c        |  42 +-
>   .../selftests/mm/va_high_addr_switch.sh       |  41 +-
>   tools/testing/selftests/mm/vm_util.c          | 134 +++---
>   tools/testing/selftests/mm/vm_util.h          |  15 +-
>   44 files changed, 1500 insertions(+), 1609 deletions(-)
>   delete mode 100644 tools/testing/selftests/mm/hugepage-mmap.c
>   rename tools/testing/selftests/mm/{thp_settings.c => hugepage_settings.c} (58%)
>   rename tools/testing/selftests/mm/{thp_settings.h => hugepage_settings.h} (51%)
>   create mode 100644 tools/testing/selftests/mm/hugetlb-mmap.c
>   rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (92%)
>   rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (55%)
>   rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (76%)
>   delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c
> 
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --
> 2.53.0
> 

