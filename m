Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967F34F052A;
	Tue, 13 Oct 2026 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897748; cv=none; b=aKOSdTESAnbj5icyDTkF1VCfDX1IlbllljweafXdm09XOW+gmfal5XSnV3xHxIhd8cWJf0lSoo+uPiQj/nujYvFdlJKTQvQDRmltT+CeKMyPUYRU+RvQjX1gEBAHpvypBC8k6B9t8nmoCaRKcBuTK8Iob0sNRDEATJGxQSeihqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897748; c=relaxed/simple;
	bh=KvSmlKFbjkTRQEKMvGdx6JVkm0ni6XVXzbdGKQPPi0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+d8SPa26nbJal4tIHWH/E0g6AFYRVycNOjh+oWBBv3DYxxoUJIuAu/62ji7HuDB3iwetNrfH8wXYZK//a+rHHycgp2Q8ubLXl9fw5YgiLhINEeti7we443lb9/BJuvMUWvEE3XR89WVeaFdG6wCvHNPuhkZoeYVOVKZ5jf34MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KDCWdy1G; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KDCWdy1G"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57DA1169E;
	Tue, 13 Oct 2026 06:22:22 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64F173F66F;
	Tue, 13 Oct 2026 06:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791897745; bh=KvSmlKFbjkTRQEKMvGdx6JVkm0ni6XVXzbdGKQPPi0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDCWdy1GI4NRVe6JVzl0CtXO+z8Nl+hsvTWJVf6t8wulzADsasUz4vk5dozXfWCN6
	 3/B3T2qrdMMn681P9l673j7NAxA/BVnnjZjBFu6hvJf3hDTdlrZpQ6pXfib61qKQIC
	 Sby+v6WNBWnsl/VX4FC4982TYbdwqnv5rTpKMo2I=
Message-ID: <b3f2a0bf-7b41-4cc9-958e-34f1a88ff5bf@arm.com>
Date: Tue, 13 Oct 2026 18:52:16 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT
 macro
To: Yeoreum Yun <yeoreum.yun@arm.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
References: <20261013-fix_hpage_macro-v7-0-3d77129e0557@arm.com>
 <20261013-fix_hpage_macro-v7-2-3d77129e0557@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261013-fix_hpage_macro-v7-2-3d77129e0557@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yeoreum!

On 10/13/26 4:07 PM, Yeoreum Yun wrote:
> HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> When this macro is used in some test, test result would be strange in
> the system where PAGE_SIZE is more then 4KB.
> 
> Here is the example with transhuge-stress test with 16KB PAGE_SIZE:
> 
>   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
>     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
>     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
>     ...
>   ok 1 Completed
> 
> Remove the HPAGE_SIZE and HPAGE_SHIFT macro and introduce pmd_pshift()
> helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-existing
> helper, pmd_psize().
> 
> Also, run the KSM_MERGE_TIME_HUGE_PAGES test with a size of 512 MiB,
> which is the least common multiple of the PMD sizes for 4 KiB, 16 KiB,
> and 64 KiB base pages. Since allocate_transhuge() allocates mappings in
> PMD-sized units, the test may fail with the previous size of 100 MiB,
> which is not a multiple of the PMD size when the base page size is
> 16 KiB or 64 KiB.
> 
> After this patch, output of transhuge-stress:
> 
>   transhuge-stress: allocate 3817 transhuge pages, using 122146 MiB virtual memory and 119 MiB of ram
>     2.558 s/loop, 0.670 ms/page,  47755.759 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>     2.640 s/loop, 0.692 ms/page,  46268.432 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>     2.635 s/loop, 0.690 ms/page,  46360.298 MiB/s	2585 succeed, 1232 failed, 2585 different pages
>     2.782 s/loop, 0.729 ms/page,  43899.795 MiB/s	2616 succeed, 1201 failed, 2616 different pages
>     2.692 s/loop, 0.705 ms/page,  45380.876 MiB/s	2627 succeed, 1190 failed, 2627 different pages
>     2.612 s/loop, 0.684 ms/page,  46765.812 MiB/s	2628 succeed, 1189 failed, 2628 different pages
>     2.683 s/loop, 0.703 ms/page,  45520.990 MiB/s	2630 succeed, 1187 failed, 2630 different pages
>     2.727 s/loop, 0.714 ms/page,  44789.321 MiB/s	2631 succeed, 1186 failed, 2631 different pages
>     ...
>   ok 1 Completed
> 
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/mm/guard-regions.c    | 10 +++++--
>  tools/testing/selftests/mm/ksm_tests.c        | 16 ++++++-----
>  tools/testing/selftests/mm/run_vmtests.sh     |  4 +--
>  tools/testing/selftests/mm/transhuge-stress.c | 25 +++++++++++-------
>  tools/testing/selftests/mm/vm_util.c          | 38 +++++++++++++++++++++++----
>  tools/testing/selftests/mm/vm_util.h          |  9 +++----
>  6 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/guard-regions.c b/tools/testing/selftests/mm/guard-regions.c
> index f7d53ea3c2527..02f69244f9a42 100644
> --- a/tools/testing/selftests/mm/guard-regions.c
> +++ b/tools/testing/selftests/mm/guard-regions.c
> @@ -2194,14 +2194,20 @@ TEST_F(guard_regions, pagemap_scan)
>  TEST_F(guard_regions, collapse)
>  {
>  	const unsigned long page_size = self->page_size;
> -	const unsigned long size = 2 * HPAGE_SIZE;
> -	const unsigned long num_pages = size / page_size;
> +	const uint64_t hpage_size = pmd_psize();
> +	unsigned long size, num_pages;
>  	char *ptr;
>  	int i;
>  
>  	if (!thp_available())
>  		SKIP(return, "Transparent Hugepages not available\n");
>  
> +	if (!hpage_size)
> +		ksft_exit_fail_msg("reading hpage_size failed\n");

I'm sorry for not catching this earlier, but I don't think calling a
ksft_exit_fail_msg() for not being able to calculate PMD size is a good
idea. Maybe call an ASSERT*() here, something like

ASSERT_NE(hpage_size, 0);

so that just this test fails, instead of the whole run exiting with a
bail out?

> +
> +	size = 2 * hpage_size;
> +	num_pages = size / page_size;
> +
>  	/* Need file to be correct size for tests for non-anon. */
>  	if (variant->backing != ANON_BACKED)
>  		ASSERT_EQ(ftruncate(self->fd, size), 0);
> diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
> index 6711f4c613711..9e6e1633d0b53 100644
> --- a/tools/testing/selftests/mm/ksm_tests.c
> +++ b/tools/testing/selftests/mm/ksm_tests.c
> @@ -520,19 +520,23 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
>  	struct timespec start_time, end_time;
>  	unsigned long scan_time_ns;
>  	int pagemap_fd, n_normal_pages, n_huge_pages;
> +	const uint64_t hpage_size = pmd_psize();
>  
>  	if (!thp_is_enabled()) {
>  		ksft_print_msg("Transparent Hugepages not available\n");
>  		return KSFT_SKIP;
>  	}
>  
> +	if (!hpage_size)
> +		ksft_exit_fail_msg("reading hpage_size failed\n");

Similarly here, maybe this would be better?

if (!hpage_size) {
	ksft_print_msg("Reading hpage_size failed\n");
	return KSFT_FAIL;
}

> +
>  	map_size *= MB;
>  	size_t len = map_size;
>  
> -	len -= len % HPAGE_SIZE;
> -	map_ptr_orig = mmap(NULL, len + HPAGE_SIZE, PROT_READ | PROT_WRITE,
> +	len -= len % hpage_size;
> +	map_ptr_orig = mmap(NULL, len + hpage_size, PROT_READ | PROT_WRITE,
>  			MAP_ANONYMOUS | MAP_NORESERVE | MAP_PRIVATE, -1, 0);
> -	map_ptr = map_ptr_orig + HPAGE_SIZE - (uintptr_t)map_ptr_orig % HPAGE_SIZE;
> +	map_ptr = map_ptr_orig + hpage_size - (uintptr_t)map_ptr_orig % hpage_size;
>  
>  	if (map_ptr_orig == MAP_FAILED)
>  		err(2, "initial mmap");
> @@ -546,7 +550,7 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
>  
>  	n_normal_pages = 0;
>  	n_huge_pages = 0;
> -	for (void *p = map_ptr; p < map_ptr + len; p += HPAGE_SIZE) {
> +	for (void *p = map_ptr; p < map_ptr + len; p += hpage_size) {
>  		if (allocate_transhuge(p, pagemap_fd) < 0)
>  			n_normal_pages++;
>  		else
> @@ -577,11 +581,11 @@ static int ksm_merge_hugepages_time(int merge_type, int mapping, int prot,
>  	ksft_print_msg("Average speed:  %.3f MiB/s\n", (map_size / MB) /
>  					       ((double)scan_time_ns / NSEC_PER_SEC));
>  
> -	munmap(map_ptr_orig, len + HPAGE_SIZE);
> +	munmap(map_ptr_orig, len + hpage_size);
>  	return KSFT_PASS;
>  
>  err_out:
> -	munmap(map_ptr_orig, len + HPAGE_SIZE);
> +	munmap(map_ptr_orig, len + hpage_size);
>  	return KSFT_FAIL;
>  }
>  
> diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
> index a1b45a3dedaee..f3ec767f562b8 100755
> --- a/tools/testing/selftests/mm/run_vmtests.sh
> +++ b/tools/testing/selftests/mm/run_vmtests.sh
> @@ -343,8 +343,8 @@ fi
>  CATEGORY="memfd_secret" run_test ./memfd_secret
>  fi
>  
> -# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
> -CATEGORY="ksm" run_test ./ksm_tests -H -s 100
> +# KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 512
> +CATEGORY="ksm" run_test ./ksm_tests -H -s 512
>  # KSM KSM_MERGE_TIME test with size of 100
>  CATEGORY="ksm" run_test ./ksm_tests -P -s 100
>  # KSM MADV_MERGEABLE test with 10 identical pages
> diff --git a/tools/testing/selftests/mm/transhuge-stress.c b/tools/testing/selftests/mm/transhuge-stress.c
> index 96f72898ebe0a..ad2831c864dc3 100644
> --- a/tools/testing/selftests/mm/transhuge-stress.c
> +++ b/tools/testing/selftests/mm/transhuge-stress.c
> @@ -34,12 +34,17 @@ int main(int argc, char **argv)
>  	size_t map_len;
>  	int pagemap_fd;
>  	int duration = 0;
> +	const uint64_t hpage_size = pmd_psize();
> +	const uint64_t hpage_shift = pmd_pshift();
>  
>  	ksft_print_header();
>  
>  	if (!thp_is_enabled())
>  		ksft_exit_skip("Transparent Hugepages not available\n");
>  
> +	if (!hpage_size || !hpage_shift)
> +		ksft_exit_fail_msg("reading hpage_size failed\n");

Makes sense to call an ksft_exit_fail_msg() here since it requires PMD
size to run its one and only test.

