Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5740B6D3
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553830; cv=none; b=FcXQT9TdsIvG7NqT9KuX+MeImluH09ayJJGw2PK9++8WwLEpsUBWQE5ipl9qo/HnTrWqRRySzJbGUkcvC5YitW75lDaRf3n/6z5gGG9ZOPvOcfZsfCAWn8l1lvjhgKWMZECfU4SI5it/jBsPjNc9r8pMD51EWSeGAdaCz69o4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553830; c=relaxed/simple;
	bh=P0lvRDMWr0hxlfkYMCqXoiVGKuIQDuojU9m2UMbz44A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWNB+zSfy0XHdci2PQkHmFZLhyhFxB5pI2h6GElwbGbHe6t7vp7MbA5xQMFunxnIileWmxPX+3QT49gcKyuVHcA6ns6j2sgtx1OzNkT8ZkjKqWOqoWNQYe1+cSc9v7GOlA2t99t1WVOXTpkyEDNbFtzXG5rUvIb2jMTKswmcQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D0Ea+dwH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0Ea+dwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777553827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZZ3aQQwYdPunNFnwwJxNtofjpkArYVbGRVkNFGYFLg=;
	b=D0Ea+dwHl7oS53fsnWv6d7SLD8RAzLiJuQ4CM7e0n7EeBQJ1f60mT6eAutX/BivHeHKyAE
	2zdpua4Qfe0H03oCW8q/fkSm/xIT0Xek+Har8IViSgVHti0KgpLCMnlg3ZJlQWfKsRIyhu
	zt+DXWxS3gttxMouaUyoCn7VpmbkmzY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-s3m5gKWNNym6jMuR5oq4-Q-1; Thu, 30 Apr 2026 08:57:06 -0400
X-MC-Unique: s3m5gKWNNym6jMuR5oq4-Q-1
X-Mimecast-MFC-AGG-ID: s3m5gKWNNym6jMuR5oq4-Q_1777553826
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf01172bso19420271cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Apr 2026 05:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553826; x=1778158626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZZ3aQQwYdPunNFnwwJxNtofjpkArYVbGRVkNFGYFLg=;
        b=RrRQ73mqHegwiX44wqwDHIAuz6+QaroZyaoQWy8Sxnrw670JrxeFfuclEdDNh+vSia
         ZjyqifJsUVKZU7v29iBbhxG2MPopnLL9i/+YC80UDSfQg/KQ1uFjEm2q7DFWKt8/rVZ5
         UKzJETShv4+b5OzNXh9qVwzP53ZRprDKolLnCxo5TN1o6VgpiO86rSSsFjCPW7QvlwMy
         TCYfM9d8bnSbnocg3OICG+OD27aPZLOLMvXqqn7JaGxF5CWsotSzJg4LLS5f4pnZlVOz
         mUR3x/VjS2aJ2q5Yg+FDhXq0S0L/LoQqY1ohxvDdwOkEuXU/tGZXtNAD41bjegJIc1jW
         OtTg==
X-Forwarded-Encrypted: i=1; AFNElJ8jnhtFVwnMCzUWK5eX4sEP8lKHMZhXCMU7DIV/gCKJtgvaM/7QJz6g1PqTcgZC33VFPxmuc+F80oqDdBvL2d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHzI3WhRifLn1SbQecRj1tkD/0pgKsn9MKom6qbQcB3c2/2O5
	bR8YPY9Z1rx0PDsEZqgQ6i1/Rtx5Yq4NVpSSYrQMnvYU1VZwt/W2XIrlMUPNkSYWWJktK6Hh6m9
	dXlEjSVbqBTgx2ks5hibmKSvVhbb31w5+TXFECahytXx5KGZJAbORiqftlcHFRGQkDhbX2A==
X-Gm-Gg: AeBDietIghkGaSKe1H1Z5lk4SxaUJoGLwEMkXXJ7CofQMayjvnwr7SADXO8wjumXIdY
	LPIvnYwr9foZRdaCvKrk9XLMXRil4r37IIbs0C65gC124IKlIilu3EVeY4M21+Ymf7Fx8yxbzpo
	cpEjSeO2MVzScx8iFm2I/+Y3C5nuLT1JeAlfMoPrIKDyPfycJYQdCt6JviuWTAAH/pCCSXLQIwd
	RalRkqS4fm3QTp0rL3j7DhjJYJJQhclTi/3P+/PTp6E9NSMw2Hzwx9csPeuWiStiEUSN6e+S76+
	vU3L7zVWbVKafIcA3laDyADUNNZJn7+jwn/dp+uVUk5CAZa30eEWdRHN0E0PsIrK1jlTK9rXqo+
	ueGRo6WoBFX6yVzjx8X3LQtl+5+TXPo0mdTg=
X-Received: by 2002:a05:622a:408e:b0:50d:597e:4b50 with SMTP id d75a77b69052e-5102ab23012mr41255681cf.13.1777553825531;
        Thu, 30 Apr 2026 05:57:05 -0700 (PDT)
X-Received: by 2002:a05:622a:408e:b0:50d:597e:4b50 with SMTP id d75a77b69052e-5102ab23012mr41254981cf.13.1777553825018;
        Thu, 30 Apr 2026 05:57:05 -0700 (PDT)
Received: from [192.168.2.110] ([70.53.202.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff301dd3sm17442166d6.7.2026.04.30.05.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:57:04 -0700 (PDT)
Message-ID: <749c836e-30e0-44b9-a85a-34c6575bde18@redhat.com>
Date: Thu, 30 Apr 2026 08:56:48 -0400
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/54] make MM selftests more CI friendly
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lance Yang <lance.yang@linux.dev>,
 Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Sarthak Sharma
 <sarthak.sharma@arm.com>, Shuah Khan <shuah@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>,
 Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <20260428204240.1924129-1-rppt@kernel.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <20260428204240.1924129-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-04-28 16:41, Mike Rapoport wrote:
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
> patches 8-20:  mechanical conversion to kselftest framework
> patches 21-27: extension of thp_settings to hugepage_settings to also include
>                 HugeTLB helpers
> patches 28-29: add helpers for setting up SHM limits in hugetlb-shm and
>                 thuge-gen tests
> patches 30-52: integrate the new APIs in all the tests that use HugeTLB
> patches 53-54: drop HugeTLB setup from run_vmtests.sh
> 
> v3 changes:
> * add patches that fix cleanup of fork()ed processes in migration test
> * drop MADV_REMOVE changes to khugepage test
> * properly setup memfd for non-default hugepages in hugetlb-mmap test
> * add forgotten hugetlb_save_settings() to hugetlb_setup()
> * fixes for ksft reporting
> * rebase on v7.1-rc1
> * add more tags, thanks everyone!

I reran my testing that previously reveled some of the bugs I reported
for v2, they pass now. I ran them on an x86-64 guest with 88 vCPUs and
also on a small s390 guest. The suite as a whole works as before (I also
checked the HugeTLB state gets restored for each test).

I'll be reviewing some of the individual patches, but for the suite as
whole:

Tested-by: Luiz Capitulino <luizcap@redhat.com>

> v2: https://lore.kernel.org/all/20260418105539.1261536-1-rppt@kernel.org
> * fix hugetlb mmap tests to actually test file mappings
> * increase maximal tests number in khugepaged
> * add tags, thanks everyone!
> 
> v1: https://lore.kernel.org/all/20260406141735.2179309-1-rppt@kernel.org
> 
> Mike Rapoport (Microsoft) (54):
>    selftests/mm: hugetlb-read-hwpoison: add SIGBUS handler
>    selftests/mm: migration: don't assume hupe page is TWOMEG
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
>    selftests/mm: protection_keys: use descriptive test names in TAP output
>    selftests/mm: protection_keys: use kselftest framework
>    selftests/mm: uffd-stress: use kselftest framework
>    selftests/mm: uffd-unit-tests: use kselftest framework
>    selftests/mm: va_high_addr_switch: use kselftest framework
>    selftests/mm: add atexit() and signal handlers to thp_settings
>    selftests/mm: rename thp_settings.[ch] to hugepage_settings.[ch]
>    selftests/mm: move HugeTLB helpers to hugepage_settings
>    selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size
>    selftests/mm: hugepage_settings: add APIs to get and set nr_hugepages
>    selftests/mm: hugepage_settings: rename get_free_hugepages()
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
>    selftests/mm: hugetlb-soft-online: add setup of HugeTLB pages
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
>   tools/testing/selftests/mm/.gitignore         |   4 +
>   tools/testing/selftests/mm/Makefile           |  13 +-
>   tools/testing/selftests/mm/compaction_test.c  | 113 +-----
>   tools/testing/selftests/mm/cow.c              |  29 +-
>   .../selftests/mm/folio_split_race_test.c      |   2 +-
>   tools/testing/selftests/mm/guard-regions.c    |   2 +-
>   tools/testing/selftests/mm/gup_longterm.c     |   3 +-
>   tools/testing/selftests/mm/gup_test.c         |  12 +
>   tools/testing/selftests/mm/hmm-tests.c        |  24 +-
>   tools/testing/selftests/mm/hugepage-mmap.c    |  78 ----
>   .../{thp_settings.c => hugepage_settings.c}   | 286 +++++++++++--
>   .../{thp_settings.h => hugepage_settings.h}   |  75 +++-
>   tools/testing/selftests/mm/hugetlb-madvise.c  | 209 ++++------
>   tools/testing/selftests/mm/hugetlb-mmap.c     | 145 +++++++
>   .../{hugepage-mremap.c => hugetlb-mremap.c}   |  13 +-
>   .../selftests/mm/hugetlb-read-hwpoison.c      | 123 +++---
>   .../mm/{hugepage-shm.c => hugetlb-shm.c}      |  64 +--
>   .../selftests/mm/hugetlb-soft-offline.c       |  45 +--
>   .../{hugepage-vmemmap.c => hugetlb-vmemmap.c} |  46 +--
>   tools/testing/selftests/mm/hugetlb_dio.c      |  15 +-
>   .../selftests/mm/hugetlb_fault_after_madv.c   |   7 +-
>   .../selftests/mm/hugetlb_madv_vs_map.c        |  22 +-
>   tools/testing/selftests/mm/khugepaged.c       | 380 ++++++++----------
>   tools/testing/selftests/mm/ksm_tests.c        | 182 ++++-----
>   tools/testing/selftests/mm/map_hugetlb.c      |  88 ----
>   tools/testing/selftests/mm/migration.c        | 152 ++++---
>   tools/testing/selftests/mm/pagemap_ioctl.c    |  13 +-
>   tools/testing/selftests/mm/pkey-helpers.h     |   6 +-
>   .../testing/selftests/mm/prctl_thp_disable.c  |   2 +-
>   tools/testing/selftests/mm/protection_keys.c  | 130 +++---
>   tools/testing/selftests/mm/run_vmtests.sh     | 177 ++------
>   tools/testing/selftests/mm/soft-dirty.c       |   2 +-
>   .../selftests/mm/split_huge_page_test.c       |   2 +-
>   tools/testing/selftests/mm/thuge-gen.c        |  80 +---
>   tools/testing/selftests/mm/transhuge-stress.c |   2 +-
>   tools/testing/selftests/mm/uffd-common.h      |   1 +
>   tools/testing/selftests/mm/uffd-stress.c      |  44 +-
>   tools/testing/selftests/mm/uffd-unit-tests.c  | 110 +++--
>   tools/testing/selftests/mm/uffd-wp-mremap.c   |  12 +-
>   .../selftests/mm/va_high_addr_switch.c        |  42 +-
>   .../selftests/mm/va_high_addr_switch.sh       |  41 +-
>   tools/testing/selftests/mm/vm_util.c          | 133 +++---
>   tools/testing/selftests/mm/vm_util.h          |  15 +-
>   43 files changed, 1424 insertions(+), 1520 deletions(-)
>   delete mode 100644 tools/testing/selftests/mm/hugepage-mmap.c
>   rename tools/testing/selftests/mm/{thp_settings.c => hugepage_settings.c} (60%)
>   rename tools/testing/selftests/mm/{thp_settings.h => hugepage_settings.h} (55%)
>   create mode 100644 tools/testing/selftests/mm/hugetlb-mmap.c
>   rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (94%)
>   rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (57%)
>   rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (76%)
>   delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c
> 
> 
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --
> 2.53.0
> 

