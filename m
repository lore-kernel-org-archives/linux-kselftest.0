Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9243F9F2E;
	Wed, 27 May 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779881823; cv=none; b=mk1hNX4HmHEivKRB5/yZlo0/qVqFxbqzFw0ztNl9mHO6wxOVqdn/iv48mITS8vkqClC4wP9TgCVuudOalKRQXQ1uJOKwyTzxn7tJopxVdug8c2/fUMs9HT4E9PH4ZUMuN1mhv4HHi0NNeJDrW/g87ZO+fOp+HaL+8zPmvhKmRd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779881823; c=relaxed/simple;
	bh=01pqk+mu/FNKALGnch/bkTjfgXYOHQ+Ln98CKL3PkGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFUmNtJk9YY5qBfOxdkl5W3Oaj2DL4uaHzL6XAzGwRKPR2+mR0xFwK0FrOIABLbkj5R6EM52AhverkoZCebnhkJfnTg/c/ADBdjS5se/oSSawgpYhuj+RCeVds1W1TGtRmvJa6uRsuTpX1VQxNnekuRBAlBLrc5yyvgDh33dizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EL6n3kFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EL6n3kFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F4D1F000E9;
	Wed, 27 May 2026 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779881813;
	bh=cWyAXfxkJ0OK1+aWG2AROwswRdbTKVGE9pihFAZOTCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EL6n3kFfdtIfCsJ9lWwI/tSIgLOF+l8Rj8FjYOpyiP8WTfOe5RswzNNJDMiVP3UQy
	 WMWAeB/75WeuoflS2JUxgfMHw2e2ZeqqLe11x5RZUJQWjvtq8OyRF5Ekxf7As1RV4R
	 L3WR8T1nTK5gPb/92U9M6tM1a/q+KKLBqGoqBMAe0UXlzLGuCS6+tsOYL2zZHDAxfP
	 PjuIgFguXEOUuYxlvzsh5N1Kr/1BrKripB5HQen1yZfJ/m/E3JWb0Li7sAD8WLVh05
	 JBn1gxiHgUk/8HRx5ad4y0mutfnoe0hprHYd6JKi8u0DX0zSeYE7QOnn1BasvNLy2Q
	 /lZjI2AazqKTA==
Date: Wed, 27 May 2026 14:36:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] selftests/mm: add missing mmap() return checks in
 pkey tests
Message-ID: <ahbXTqLLLcYmeTp2@kernel.org>
References: <20260527013825.1134225-1-lihongfu@kylinos.cn>
 <20260527013825.1134225-3-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527013825.1134225-3-lihongfu@kylinos.cn>

On Wed, May 27, 2026 at 09:38:25AM +0800, Hongfu Li wrote:
> Add missing checks against mmap() return value, replace (void *)-1
> with MAP_FAILED for better readability and consistency.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  tools/testing/selftests/mm/pkey-powerpc.h        |  2 +-
>  .../testing/selftests/mm/pkey_sighandler_tests.c |  2 ++
>  tools/testing/selftests/mm/protection_keys.c     | 16 ++++++++++------
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
> index 17bf2d1b0192..f482b1abcf55 100644
> --- a/tools/testing/selftests/mm/pkey-powerpc.h
> +++ b/tools/testing/selftests/mm/pkey-powerpc.h
> @@ -126,7 +126,7 @@ static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 p
>  			size, prot, pkey);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, prot, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != (void *)MAP_FAILED);
>  
>  	ret = syscall(__NR_subpage_prot, ptr, size, NULL);
>  	if (ret) {
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 231dfb079075..475aa3e3208a 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	pkey_assert(sigstack.ss_sp != MAP_FAILED);
>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>  
> @@ -486,6 +487,7 @@ static void test_pkru_sigreturn(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	pkey_assert(sigstack.ss_sp != MAP_FAILED);
>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>  
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index 3c0cbf8f3eaa..ae474e65f3aa 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -585,7 +585,7 @@ static void *malloc_pkey_with_mprotect(long size, int prot, u16 pkey)
>  			size, prot, pkey);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, prot, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	ret = mprotect_pkey((void *)ptr, PAGE_SIZE, prot, pkey);
>  	pkey_assert(!ret);
>  	record_pkey_malloc(ptr, size, prot);
> @@ -608,7 +608,7 @@ static void *malloc_pkey_anon_huge(long size, int prot, u16 pkey)
>  	 */
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	ptr = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	record_pkey_malloc(ptr, size, prot);
>  	mprotect_pkey(ptr, size, prot, pkey);
>  
> @@ -688,7 +688,7 @@ static void *malloc_pkey_hugetlb(long size, int prot, u16 pkey)
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, PROT_NONE, flags, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	mprotect_pkey(ptr, size, prot, pkey);
>  
>  	record_pkey_malloc(ptr, size, prot);
> @@ -717,7 +717,7 @@ static void *malloc_pkey(long size, int prot, u16 pkey)
>  		pkey_assert(malloc_type < nr_malloc_types);
>  
>  		ret = pkey_malloc[malloc_type](size, prot, pkey);
> -		pkey_assert(ret != (void *)-1);
> +		pkey_assert(ret != MAP_FAILED);
>  
>  		malloc_type++;
>  		if (malloc_type >= nr_malloc_types)
> @@ -1135,6 +1135,7 @@ static void arch_force_pkey_reg_init(void)
>  	 * doing the XSAVE size enumeration dance.
>  	 */
>  	buf = mmap(NULL, 1*MB, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +	pkey_assert(buf != MAP_FAILED);
>  
>  	/* These __builtins require compiling with -mxsave */
>  
> @@ -1693,7 +1694,10 @@ int main(void)
>  		printf("running PKEY tests for unsupported CPU/OS\n");
>  
>  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -		assert(ptr != (void *)-1);
> +		if (ptr == MAP_FAILED) {
> +			perror("mmap");
> +			return EXIT_FAILURE;
> +		}

Just stick to pkey_assert() everywhere, it already prints errno and exits.

>  		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
>  		exit(0);
>  	}
> @@ -1706,5 +1710,5 @@ int main(void)
>  		run_tests_once();
>  
>  	printf("done (all tests OK)\n");
> -	return 0;
> +	return EXIT_SUCCESS;

Completely unrelated and not needed.

And you may want to base your work on mm-unstable to get up to date version
of protection_keys tests.

>  }
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.
