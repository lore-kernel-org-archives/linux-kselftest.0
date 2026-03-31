Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E9736F41C;
	Tue, 31 Mar 2026 05:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934973; cv=none; b=T+qTEoCdb8GzxbkO+n2uFDM5HaXAka8nYO1gew+nbVtFlObAuGChxaEaF+a6ms+VtyqZLUpp5rYYTIFqFf27+4e3eyfcm6bBJjboUQ89zAOrJjtK3FzW3LQ2i+slfI3lHsUojDKSE3K/XiW8+Ebn+R/4zFau07bvnxR4mIzJ000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934973; c=relaxed/simple;
	bh=tEuorD7P4k0F88Y2/3UlSKoS5UGxiHdE86z8UjNtlT8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eZATnlejUTCo+Y3q7i2DcfLpYoV562ulynYfBT7odsZczicxkTMKiBwm7kTtmHLxRSNjrnJcDKM0Fc318/gQeM3aq1IjI+/Ssp79M+XmYE4pKX1hmd3lVwldLEssKS1kRqtpoS+Aaeg1w5TgwOQ1/qLCPSl5kTkGBhuiqdzOaDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LPPWc142; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LPPWc142"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20A8C2BCB0;
	Tue, 31 Mar 2026 05:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774934973;
	bh=tEuorD7P4k0F88Y2/3UlSKoS5UGxiHdE86z8UjNtlT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LPPWc142i4SCKqqkXT3ER2o4Air3R/3gnyEcgYDs/11m1tvEDnuCFLAxsF2m36G0/
	 nNnsWZQ0Yon2OsLJ63qLWvPcKm8M/jJmQuqERSxsp8XLiMapPlUyVvLV8zFUu7+aow
	 108/Jiobk6K0Gkbw66borcbzoZy5ZcL/C5l1sh7o=
Date: Mon, 30 Mar 2026 22:29:32 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests/mm: respect build verbosity settings for
 32/64-bit targets
Message-Id: <20260330222932.a8c10bb3ea3e86581fcea8a0@linux-foundation.org>
In-Reply-To: <20260331040156.119158-1-liwang@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 31 Mar 2026 12:01:53 +0800 Li Wang <liwang@redhat.com> wrote:

> The 32-bit and 64-bit compilation rules invoke $(CC) directly, bypassing
> the $(Q) quiet prefix and $(call msg,...) helper used by the rest of the
> selftests build system. This causes these rules to always print the full
> compiler command line, even when V=0 (the default).
> 
> Wrap the commands with $(Q) and $(call msg,CC,,$@) to match the
> convention used by lib.mk, so that quiet and verbose builds behave
> consistently across all targets.
> 
> ==== Build logs ====
>   ...
>   CC       merge
>   CC       rmap
>   CC       soft-dirty
>   gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
>                 -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
>                 -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
>                 -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
>                 -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
>                 -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c
>                 -lrt -lpthread -lm -lrt -ldl -lm
>                 -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
>   gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..
>                 -isystem /usr/src/25/tools/testing/selftests/../../../usr/include
>                 -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi
>                 -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE=
>                 -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests
>                 -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c
>                 -lrt -lpthread -lm -lrt -ldl -lm
>                 -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
>   ...
> 
> Reported-by: Andrew Morton <akpm@linux-foundation.org>

wow, thanks, do you want my credit card number?

>  tools/testing/selftests/mm/Makefile | 6 ++++--

Before: 

ts:/usr/src/25/tools/testing/selftests/mm> make -j100
CC="gcc" CFLAGS="-Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests " ./check_config.sh
  CC       cow
  CC       compaction_test
  CC       gup_longterm
  CC       gup_test
  CC       hmm-tests
  CC       hugetlb-madvise
  CC       hugetlb-read-hwpoison
  CC       hugetlb-soft-offline
  CC       hugepage-mmap
  CC       hugepage-mremap
  CC       hugepage-shm
  CC       hugepage-vmemmap
  CC       khugepaged
  CC       madv_populate
  CC       map_fixed_noreplace
  CC       map_populate
  CC       map_hugetlb
  CC       memfd_secret
  CC       memory-failure
  CC       migration
  CC       mkdirty
  CC       mlock-random-test
  CC       mlock2-tests
  CC       mremap_dontunmap
  CC       mrelease_test
...
  CC       merge
  CC       rmap
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
  CC       folio_split_race_test
  CC       soft-dirty
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m64 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -o /usr/src/25/tools/testing/selftests/mm/protection_keys_64
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m64 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_64
  CC       write_to_hugetlbfs


after:

ts:/usr/src/25/tools/testing/selftests/mm> make clean
...
ts:/usr/src/25/tools/testing/selftests/mm> make -j100
CC="gcc" CFLAGS="-Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests " ./check_config.sh
  CC       cow
  CC       compaction_test
  CC       gup_longterm
  CC       gup_test
  CC       hmm-tests
  CC       hugetlb-madvise
  CC       hugetlb-read-hwpoison
  CC       hugetlb-soft-offline
  CC       hugepage-mmap
  CC       hugepage-mremap
  CC       hugepage-shm
  CC       hugepage-vmemmap
  CC       khugepaged
  CC       madv_populate
  CC       map_fixed_noreplace
  CC       map_hugetlb
  CC       map_populate
  CC       memfd_secret
  CC       memory-failure
  CC       migration
  CC       mkdirty
  CC       mlock-random-test
  CC       mlock2-tests
  CC       mrelease_test
  CC       mremap_dontunmap
  CC       mremap_test
  CC       mseal_test
  CC       on-fault-limit
  CC       pagemap_ioctl
  CC       pfnmap
  CC       process_madv
  CC       prctl_thp_disable
  CC       thuge-gen
  CC       transhuge-stress
  CC       uffd-stress
  CC       uffd-unit-tests
  CC       uffd-wp-mremap
  CC       split_huge_page_test
  CC       ksm_tests
  CC       ksm_functional_tests
  CC       mdwe_test
  CC       hugetlb_fault_after_madv
  CC       hugetlb_madv_vs_map
  CC       hugetlb_dio
  CC       droppable
  CC       guard-regions
  CC       merge
  CC       rmap
  CC       folio_split_race_test
  CC       soft-dirty
  CC       protection_keys_32
  CC       pkey_sighandler_tests_32
  CC       protection_keys_64
  CC       pkey_sighandler_tests_64
  CC       va_high_addr_switch
  CC       write_to_hugetlbfs

Tested-by: Andrew Morton <akpm@linux-foundation.org>

