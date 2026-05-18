Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C333EDADC;
	Mon, 18 May 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101133; cv=none; b=QdDri2mURGARZUOXZ1Wil1dC43YWQxnX5NH5Q5TwSk7G6YjpOg+lkTzgYt8sM8vqxQ9TJgyHGZiIvrIsD+tRgiY0YixIBey2OzSpm+twkylWIMFzZL610q6YyommyYUm5HRH/DHseq2ZayHuMO85sbcrWSvR2CJF4AuVwaDQGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101133; c=relaxed/simple;
	bh=LpK5PBAbXOh54FapZmUdMQXTHQuvbKcipo4+4fbRVkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmzB3RWGLa24v6u9EvY9e7PTWhN9/ozruZa03Ko0sNImF5l2C++fFq+EjaddLGD0bgj1ct8WUuS94ViLe2un/CP7IFsC8a0tBt03A23sLkFKixd+xjuCLrub1uEI/rhGlOAJf569Bhl/F6BZkTjE8voXBDDY8fKnEqIA6bX4WL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfzoxB+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfzoxB+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0FAC2BCB7;
	Mon, 18 May 2026 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779101131;
	bh=LpK5PBAbXOh54FapZmUdMQXTHQuvbKcipo4+4fbRVkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfzoxB+PTe9Vhy4Q3RWjZ6nDr0bipMjQX7KLb/KTwHdcFZNy/GrQWfjOC/RAVrO2y
	 MS3RK9Um2YgMmG1BsEydMZh3SILuOPvoRtmSUFY6mPqJDBRbRZ4ZNwVRSZdHkhgvAu
	 r9mayV4zKRHMeMq4B7t9Hs6GrY6eca29N1THiuXUbYsxCQJyh0DWiAZIZnY77Wi8lE
	 6BYsZew48hmKuLgryfLLNCinyQZw4oLuipzfWq77jXwGUJGCMr7uiWj49odxNpgM6k
	 lqbRkY4kEy/t/dYegItNkpKGESbUgc0PUkjNdFXcaGAk9IjctSj94S/P5B5JiScKHq
	 QKd1RRARK4MNw==
Date: Mon, 18 May 2026 11:45:25 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: add missing mmap() return checks in pkey
 tests
Message-ID: <agrrp5fRWWuMSoYB@lucifer>
References: <20260518082120.3890552-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518082120.3890552-1-lihongfu@kylinos.cn>

Hmm you're sending this separete from the other MAP_FAILED checks, and not
referencing that in any way? (original patch at [0]).

Please just send this as a 2 patch series _with a cover letter_ and both patches
in-reply-to the cover letter.

Also make sure to propagate tags correctly.

[0]:https://lore.kernel.org/all/20260513095609.789935-1-lihongfu@kylinos.cn/

On Mon, May 18, 2026 at 04:21:20PM +0800, Hongfu Li wrote:
> Several mmap() calls lack error checks and would crash on failure.
> Add the missing checks. Also replace bare (void *)-1 with the

Well you're assert()'ing so you're causing a crash on failure anyway?

I'd just say that you are adding missing checks against the mmap() return value,
as well as improving readability and consistency by replacing (void *)-1 with
MAP_FAILED in instances where that was used rather than MAP_FAILED.

> standard MAP_FAILED macro in protection_keys.c for consistency.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Some comments below.

> ---
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 2 ++
>  tools/testing/selftests/mm/protection_keys.c       | 9 +++++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 302fef54049c..4637809192f9 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	assert(sigstack.ss_sp != MAP_FAILED);

Why not pkey_assert()?

>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>
> @@ -490,6 +491,7 @@ static void test_pkru_sigreturn(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	assert(sigstack.ss_sp != MAP_FAILED);

Why not pkey_assert()?

>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index 2085982dba69..d53bdc540a74 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -667,7 +667,7 @@ static void *malloc_pkey_with_mprotect(long size, int prot, u16 pkey)
>  			size, prot, pkey);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, prot, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	ret = mprotect_pkey((void *)ptr, PAGE_SIZE, prot, pkey);
>  	pkey_assert(!ret);
>  	record_pkey_malloc(ptr, size, prot);
> @@ -690,7 +690,7 @@ static void *malloc_pkey_anon_huge(long size, int prot, u16 pkey)
>  	 */
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	ptr = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	record_pkey_malloc(ptr, size, prot);
>  	mprotect_pkey(ptr, size, prot, pkey);
>
> @@ -770,7 +770,7 @@ static void *malloc_pkey_hugetlb(long size, int prot, u16 pkey)
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, PROT_NONE, flags, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	mprotect_pkey(ptr, size, prot, pkey);
>
>  	record_pkey_malloc(ptr, size, prot);
> @@ -1217,6 +1217,7 @@ static void arch_force_pkey_reg_init(void)
>  	 * doing the XSAVE size enumeration dance.
>  	 */
>  	buf = mmap(NULL, 1*MB, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +	pkey_assert(buf != MAP_FAILED);
>
>  	/* These __builtins require compiling with -mxsave */
>
> @@ -1775,7 +1776,7 @@ int main(void)
>  		printf("running PKEY tests for unsupported CPU/OS\n");
>
>  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -		assert(ptr != (void *)-1);
> +		assert(ptr != MAP_FAILED);

Probably best to convert to pkey_assert() at the same time?

>  		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
>  		exit(0);
>  	}
> --
> 2.25.1
>

Cheers, Lorenzo
