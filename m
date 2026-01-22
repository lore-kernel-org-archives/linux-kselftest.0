Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFA038F936;
	Thu, 22 Jan 2026 06:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769061936; cv=none; b=GEuvtSi0ihJefMgbX+ivojbVOl2DBbGcQ5sN+EeUzBg0JYlLlvqAXMPAgy1e4c2U7J/FYrCsEG3vDfs60K83b1XkJGq/y5FXOptuawGpKnqQ3AasZmqGN9xdXhnGIstHK7n6NDhYdYeh30Wtp05p92xDTYX6AvXW2KgjHb6j6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769061936; c=relaxed/simple;
	bh=0UTMVOfmsyjSuf284okZ7pWzDu/mQRqV6zIa0E4iotY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boG0cJct5Ns8TMhA+pDaJxkdnIy8Ra519NrjrjcCmRegOPKneZK8+iHCMLzf6D3tJFdCClxYO223wQ8Pvws5UqVe5riLvQmq51K7R6ccGhhEIn1teGKJz4Kw7WZ1JsUjnxlnv8zsPNxQRVrWgytW75tJoUgcUI1b0zIszt/4qlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01F691476;
	Wed, 21 Jan 2026 22:05:26 -0800 (PST)
Received: from [10.164.18.63] (MacBook-Pro.blr.arm.com [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCEF93F740;
	Wed, 21 Jan 2026 22:05:29 -0800 (PST)
Message-ID: <a2549671-da39-4827-a534-32f128f233a1@arm.com>
Date: Thu, 22 Jan 2026 11:35:27 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] selftests/mm: introduce helper to read every page
 in range
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
References: <20260107164842.3289559-1-kevin.brodsky@arm.com>
 <20260107164842.3289559-6-kevin.brodsky@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260107164842.3289559-6-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 07/01/26 10:18 pm, Kevin Brodsky wrote:
> FORCE_READ(*addr) ensures that the compiler will emit a load from
> addr. Several tests need to trigger such a load for every page in
> the range [addr, addr + len), ensuring that every page is faulted
> in, if it wasn't already.
>
> Introduce a new helper force_read_pages_in_range() that does exactly
> that and replace existing loops with a call to it. Some of those
> loops have a different step size, but reading from every page is
> appropriate in all cases.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  tools/testing/selftests/mm/hugetlb-madvise.c     |  9 +--------
>  tools/testing/selftests/mm/pfnmap.c              | 16 ++++++----------
>  .../testing/selftests/mm/split_huge_page_test.c  |  6 +-----
>  tools/testing/selftests/mm/vm_util.h             |  6 ++++++
>  4 files changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hugetlb-madvise.c b/tools/testing/selftests/mm/hugetlb-madvise.c
> index 05d9d2805ae4..1f82568ae262 100644
> --- a/tools/testing/selftests/mm/hugetlb-madvise.c
> +++ b/tools/testing/selftests/mm/hugetlb-madvise.c
> @@ -47,14 +47,7 @@ void write_fault_pages(void *addr, unsigned long nr_pages)
>  
>  void read_fault_pages(void *addr, unsigned long nr_pages)
>  {
> -	unsigned long i;
> -
> -	for (i = 0; i < nr_pages; i++) {
> -		unsigned long *addr2 =
> -			((unsigned long *)(addr + (i * huge_page_size)));
> -		/* Prevent the compiler from optimizing out the entire loop: */
> -		FORCE_READ(*addr2);
> -	}
> +	force_read_pages_in_range(addr, nr_pages * huge_page_size);
>  }

Yeah this should be fine to do.

>  
>  int main(int argc, char **argv)
> diff --git a/tools/testing/selftests/mm/pfnmap.c b/tools/testing/selftests/mm/pfnmap.c
> index f546dfb10cae..35b0e3ed54cd 100644
> --- a/tools/testing/selftests/mm/pfnmap.c
> +++ b/tools/testing/selftests/mm/pfnmap.c
> @@ -33,20 +33,17 @@ static void signal_handler(int sig)
>  	siglongjmp(sigjmp_buf_env, -EFAULT);
>  }
>  
> -static int test_read_access(char *addr, size_t size, size_t pagesize)
> +static int test_read_access(char *addr, size_t size)
>  {
> -	size_t offs;
>  	int ret;
>  
>  	if (signal(SIGSEGV, signal_handler) == SIG_ERR)
>  		return -EINVAL;
>  
>  	ret = sigsetjmp(sigjmp_buf_env, 1);
> -	if (!ret) {
> -		for (offs = 0; offs < size; offs += pagesize)
> -			/* Force a read that the compiler cannot optimize out. */
> -			*((volatile char *)(addr + offs));
> -	}
> +	if (!ret)
> +		force_read_pages_in_range(addr, size);
> +

LGTM

>  	if (signal(SIGSEGV, SIG_DFL) == SIG_ERR)
>  		return -EINVAL;
>  
> @@ -138,7 +135,7 @@ FIXTURE_SETUP(pfnmap)
>  		SKIP(return, "Invalid file: '%s'. Not pfnmap'ed\n", file);
>  
>  	/* ... and want to be able to read from them. */
> -	if (test_read_access(self->addr1, self->size1, self->pagesize))
> +	if (test_read_access(self->addr1, self->size1))
>  		SKIP(return, "Cannot read-access mmap'ed '%s'\n", file);
>  
>  	self->size2 = 0;
> @@ -243,8 +240,7 @@ TEST_F(pfnmap, fork)
>  	ASSERT_GE(pid, 0);
>  
>  	if (!pid) {
> -		EXPECT_EQ(test_read_access(self->addr1, self->size1,
> -					   self->pagesize), 0);
> +		EXPECT_EQ(test_read_access(self->addr1, self->size1), 0);
>  		exit(0);
>  	}
>  
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index 40799f3f0213..65a89ceca4a5 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -652,11 +652,7 @@ static int create_pagecache_thp_and_fd(const char *testfile, size_t fd_size,
>  	}
>  	madvise(*addr, fd_size, MADV_HUGEPAGE);
>  
> -	for (size_t i = 0; i < fd_size; i++) {
> -		char *addr2 = *addr + i;
> -
> -		FORCE_READ(*addr2);
> -	}
> +	force_read_pages_in_range(*addr, fd_size);

LGTM

>  
>  	if (!check_huge_file(*addr, fd_size / pmd_pagesize, pmd_pagesize)) {
>  		ksft_print_msg("No large pagecache folio generated, please provide a filesystem supporting large folio\n");
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index 6ad32b1830f1..74bdf96161d7 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -54,6 +54,12 @@ static inline unsigned int pshift(void)
>  	return __page_shift;
>  }
>  
> +static inline void force_read_pages_in_range(char *addr, size_t len)
> +{
> +	for (size_t i = 0; i < len; i += psize())
> +		FORCE_READ(addr[i]);
> +}
> +

Reviewed-by: Dev Jain <dev.jain@arm.com>

>  bool detect_huge_zeropage(void);
>  
>  /*
