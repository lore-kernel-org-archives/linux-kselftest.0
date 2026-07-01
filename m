Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31FE3F6C59;
	Wed,  1 Jul 2026 08:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895747; cv=none; b=HsGD9LMZEYjE4y+tupeaXYn3GtUk2YFQZEywVHRPITU+2X3/j8HUrbLpx7JfgqRsPm5EtZMbvMIXjcxAKpkQCbb2jHlylz8IlzYdn+nuMcDTHvNzJsjsxUGvlgoAZd1SAvdO5hlPPOGgQ9W2+CcieJ4K9xZeXiplf8A7guEs89M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895747; c=relaxed/simple;
	bh=Z4DMcLKWNEYBuHOrNSOaBA8OkObvEM97eR0cmiDbrSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZaNcn8sbROes5kdqsNi7VRZWjUla13tVJOEmjlgA57fXdqaCYJQO/E66zZVBS549uxyQ74pBu1lnqf4f0xVK/WuDl2CqNCzpfgkIhXBp84HIpkFTxYsH6Di//2HXriz4ZxnzMYJEiKlGdNv/Eg2ZOy1yvB092U+Ag7GDDqHBsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DCF8E1hK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DCF8E1hK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E50981691;
	Wed,  1 Jul 2026 01:48:59 -0700 (PDT)
Received: from [10.57.81.2] (unknown [10.57.81.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F3343F85F;
	Wed,  1 Jul 2026 01:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782895744; bh=Z4DMcLKWNEYBuHOrNSOaBA8OkObvEM97eR0cmiDbrSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DCF8E1hKCX/we4jcQFdCXBz1KdtORPITdZo51MlCPaSJZwsdEwfn/OMwrVmIClW08
	 Fj5iilMuHRihIExwCZU5voiOTqw4AROJqmKAAPIkpS9DgVw5SArlhsu56Cicpiaw5i
	 CGISkScX2vqKL5phTgG+z5jzzaC/gNgui67syTBc=
Message-ID: <8cb49784-9083-4595-8be8-6c64d5d4dfd4@arm.com>
Date: Wed, 1 Jul 2026 10:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] selftests/mm: add missing mmap() return checks in
 pkey tests
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, keith.lucas@oracle.com, maddy@linux.ibm.com,
 usama.anjum@collabora.com, yury.khrustalev@arm.com, jhubbard@nvidia.com,
 joey.gouly@arm.com, zwisler@google.com, hongfu.li@linux.dev
References: <20260630073235.3802271-1-lihongfu@kylinos.cn>
 <20260630073235.3802271-5-lihongfu@kylinos.cn>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260630073235.3802271-5-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/06/2026 09:32, Hongfu Li wrote:
> Add missing checks against mmap() return value, replace (void *)-1
> with MAP_FAILED for better readability and consistency.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  tools/testing/selftests/mm/pkey-powerpc.h          |  2 +-
>  tools/testing/selftests/mm/pkey_sighandler_tests.c |  2 ++
>  tools/testing/selftests/mm/protection_keys.c       | 12 +++++++-----
>  3 files changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
> index 17bf2d1b0192..2ce85580b404 100644
> --- a/tools/testing/selftests/mm/pkey-powerpc.h
> +++ b/tools/testing/selftests/mm/pkey-powerpc.h
> @@ -126,7 +126,7 @@ static inline void *malloc_pkey_with_mprotect_subpage(long size, int prot, u16 p
>  			size, prot, pkey);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, prot, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  
>  	ret = syscall(__NR_subpage_prot, ptr, size, NULL);
>  	if (ret) {
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 882928f2912b..d185d3da26cf 100644
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
> @@ -492,6 +493,7 @@ static void test_pkru_sigreturn(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	pkey_assert(sigstack.ss_sp != MAP_FAILED);
>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>  
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index e504544e2197..96a4eb26f326 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -586,7 +586,7 @@ static void *malloc_pkey_with_mprotect(long size, int prot, u16 pkey)
>  			size, prot, pkey);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, prot, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	ret = mprotect_pkey((void *)ptr, PAGE_SIZE, prot, pkey);
>  	pkey_assert(!ret);
>  	record_pkey_malloc(ptr, size, prot);
> @@ -609,7 +609,7 @@ static void *malloc_pkey_anon_huge(long size, int prot, u16 pkey)
>  	 */
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	ptr = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	record_pkey_malloc(ptr, size, prot);
>  	mprotect_pkey(ptr, size, prot, pkey);
>  
> @@ -667,7 +667,7 @@ static void *malloc_pkey_hugetlb(long size, int prot, u16 pkey)
>  	size = ALIGN_UP(size, HPAGE_SIZE * 2);
>  	pkey_assert(pkey < NR_PKEYS);
>  	ptr = mmap(NULL, size, PROT_NONE, flags, -1, 0);
> -	pkey_assert(ptr != (void *)-1);
> +	pkey_assert(ptr != MAP_FAILED);
>  	mprotect_pkey(ptr, size, prot, pkey);
>  
>  	record_pkey_malloc(ptr, size, prot);
> @@ -696,7 +696,7 @@ static void *malloc_pkey(long size, int prot, u16 pkey)
>  		pkey_assert(malloc_type < nr_malloc_types);
>  
>  		ret = pkey_malloc[malloc_type](size, prot, pkey);
> -		pkey_assert(ret != (void *)-1);
> +		pkey_assert(ret != MAP_FAILED);
>  
>  		malloc_type++;
>  		if (malloc_type >= nr_malloc_types)
> @@ -1114,6 +1114,7 @@ static void arch_force_pkey_reg_init(void)
>  	 * doing the XSAVE size enumeration dance.
>  	 */
>  	buf = mmap(NULL, 1*MB, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +	pkey_assert(buf != MAP_FAILED);
>  
>  	/* These __builtins require compiling with -mxsave */
>  
> @@ -1680,7 +1681,8 @@ int main(void)
>  		ksft_print_msg("running PKEY tests for unsupported CPU/OS\n");
>  
>  		ptr  = mmap(NULL, size, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -		assert(ptr != (void *)-1);
> +		if (ptr == MAP_FAILED)
> +			ksft_exit_fail_perror("mmap");
>  		test_mprotect_pkey_on_unsupported_cpu(ptr, 1);
>  		ksft_test_result_pass("pkey on unsupported CPU/OS\n");
>  		ksft_finished();
