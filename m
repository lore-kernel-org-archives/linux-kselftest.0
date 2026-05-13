Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EB63AEB40;
	Wed, 13 May 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669885; cv=none; b=p2JG8M8k0eD99AwWGn8+o4gDFsC72DnipFSSI5GtEgQAJQutPRTuwpF75S39DmJLsoIG+3qFJNY2/RRxtE465JNWb1u08taztDHRUBOwqC0vGL5gPXvndhMu1OTCeYjNrzZdEaLmOi+gPQKODtaPxgg2JZKJPjQ1EMl3tGbAoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669885; c=relaxed/simple;
	bh=8dhOi+LcaAZswGzRl4JIrjmJt8FqOC6s0xrrgcCEoI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osDR4NapTCqzrTxyLG3JLXaoFcdW2WzBp8cNF9L6VD8PTA0ywx3QqUfmrA5vEfxk0wcfWUvpdlpU40vLNqa+GpirvQhd4QfXsZktBgMXIVMorHI3fBtnLE9qNrdpamFei35Ruyp+bypmvLdxYg/snwCO6a7IJAboGZplrFcKrzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIschZxi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIschZxi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 783EEC2BCC7;
	Wed, 13 May 2026 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669885;
	bh=8dhOi+LcaAZswGzRl4JIrjmJt8FqOC6s0xrrgcCEoI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIschZxiNsmY8s0D03sHvQp9kqpVbF1FRYyVa/C7nS2E0/uCwWfbBDvO+sCnilM5k
	 /K3wBIuosK1gk9aviKsftT+26UqXjZyf3voiAAR4Ld1606I2fwyoVZyNZBU4nO+gmx
	 qNRFhh5qkmteIhtO0lMdR9Ts2GktfnxDWtWZHM6n6LaRmg5oXlS0EvFZKEPSFbQXCU
	 fDItq2cZJjr7vabuQcAEVpjxb8CsWipZLPlu1913MCiaG6Uj31rNpHtaUFw2AuN7P8
	 3KtEOtnV0Ih/0abPYHTW+Jq5gUwg1kDD1IbYJ9NhSSzVLo7hMyzkkZohvT8thj6evq
	 sO8kPAISOzhHQ==
Date: Wed, 13 May 2026 11:57:59 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH v2] selftests/mm: Fix incorrect mmap() error handling
 with NULL instead of MAP_FAILED
Message-ID: <agRX7BXxuv-VWqN4@lucifer>
References: <20260513095609.789935-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513095609.789935-1-lihongfu@kylinos.cn>

On Wed, May 13, 2026 at 05:56:09PM +0800, Hongfu Li wrote:
> mmap() returns MAP_FAILED, which is defined as (void *)-1, on error,
> not NULL.  Several selftests incorrectly check the return value of
> mmap() using !ptr or ptr == NULL, which would erroneously treat
> MAP_FAILED as a valid pointer since MAP_FAILED is non-zero and
> non-NULL.  This can lead to segfaults when mmap() actually fails
> under memory pressure.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: Dev Jain <dev.jain@arm.com>

You forgot my tag :)

Also, please do not send a respin right away if you can, multiple revisions in
one day can be tricky to deal with.

As per David's points - please update the commit message to reflect the fact
you've added a missing assert too and replace the (void *)-1 with MAP_FAILED.

Cheers, Lorenzo

> ---
> v2:
> - Add missing mmap() return value checks in pkey_sighandler_tests.c
>   and protection_keys.c
> ---
>  tools/testing/selftests/mm/ksm_tests.c             | 2 +-
>  tools/testing/selftests/mm/madv_populate.c         | 2 +-
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 2 ++
>  tools/testing/selftests/mm/protection_keys.c       | 1 +
>  tools/testing/selftests/mm/soft-dirty.c            | 4 ++--
>  tools/testing/selftests/mm/vm_util.c               | 2 +-
>  6 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
> index a0b48b839d54..ed481f817282 100644
> --- a/tools/testing/selftests/mm/ksm_tests.c
> +++ b/tools/testing/selftests/mm/ksm_tests.c
> @@ -174,7 +174,7 @@ static void  *allocate_memory(void *ptr, int prot, int mapping, char data, size_
>  {
>  	void *map_ptr = mmap(ptr, map_size, PROT_WRITE, mapping, -1, 0);
>
> -	if (!map_ptr) {
> +	if (map_ptr == MAP_FAILED) {
>  		perror("mmap");
>  		return NULL;
>  	}
> diff --git a/tools/testing/selftests/mm/madv_populate.c b/tools/testing/selftests/mm/madv_populate.c
> index 88050e0f829a..7fce5d0b622b 100644
> --- a/tools/testing/selftests/mm/madv_populate.c
> +++ b/tools/testing/selftests/mm/madv_populate.c
> @@ -34,7 +34,7 @@ static void sense_support(void)
>
>  	addr = mmap(0, pagesize, PROT_READ | PROT_WRITE,
>  		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
> -	if (!addr)
> +	if (addr == MAP_FAILED)
>  		ksft_exit_fail_msg("mmap failed\n");
>
>  	ret = madvise(addr, pagesize, MADV_POPULATE_READ);
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 302fef54049c..4637809192f9 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -317,6 +317,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	assert(sigstack.ss_sp != MAP_FAILED);
>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>
> @@ -490,6 +491,7 @@ static void test_pkru_sigreturn(void)
>  	/* Set up alternate signal stack that will use the default MPK */
>  	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
>  			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	assert(sigstack.ss_sp != MAP_FAILED);
>  	sigstack.ss_flags = 0;
>  	sigstack.ss_size = STACK_SIZE;
>
> diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
> index 2085982dba69..580bf1668c71 100644
> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -1217,6 +1217,7 @@ static void arch_force_pkey_reg_init(void)
>  	 * doing the XSAVE size enumeration dance.
>  	 */
>  	buf = mmap(NULL, 1*MB, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> +	pkey_assert(buf != (void *)-1);

Should use MAP_FAILED here as David pointed out.

>
>  	/* These __builtins require compiling with -mxsave */
>
> diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
> index bcfcac99b436..67c26c265880 100644
> --- a/tools/testing/selftests/mm/soft-dirty.c
> +++ b/tools/testing/selftests/mm/soft-dirty.c
> @@ -143,7 +143,7 @@ static void test_mprotect(int pagemap_fd, int pagesize, bool anon)
>  	if (anon) {
>  		map = mmap(NULL, pagesize, PROT_READ|PROT_WRITE,
>  			   MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
> -		if (!map)
> +		if (map == MAP_FAILED)
>  			ksft_exit_fail_msg("anon mmap failed\n");
>  	} else {
>  		test_fd = open(fname, O_RDWR | O_CREAT, 0664);
> @@ -155,7 +155,7 @@ static void test_mprotect(int pagemap_fd, int pagesize, bool anon)
>  		ftruncate(test_fd, pagesize);
>  		map = mmap(NULL, pagesize, PROT_READ|PROT_WRITE,
>  			   MAP_SHARED, test_fd, 0);
> -		if (!map)
> +		if (map == MAP_FAILED)
>  			ksft_exit_fail_msg("file mmap failed\n");
>  	}
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index db94564f4431..63aaa2d9ec0b 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -463,7 +463,7 @@ bool softdirty_supported(void)
>  	/* New mappings are expected to be marked with VM_SOFTDIRTY (sd). */
>  	addr = mmap(0, pagesize, PROT_READ | PROT_WRITE,
>  		    MAP_ANONYMOUS | MAP_PRIVATE, 0, 0);
> -	if (!addr)
> +	if (addr == MAP_FAILED)
>  		ksft_exit_fail_msg("mmap failed\n");
>
>  	supported = check_vmflag(addr, "sd");
> --
> 2.25.1
>
