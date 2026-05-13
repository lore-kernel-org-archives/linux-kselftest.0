Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896E01991D4;
	Wed, 13 May 2026 04:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646465; cv=none; b=YKkCS74GQ39ugkHIivi1UOFYv/5kraG36LnXskBX973Q7f2zn/Zx92DD7QmZjo0OWiuwrJES9MOkx8I4KJmn9DdqCKWx8wxgoSyJCOB8CcFss000d9qeOXvatGU139bF2/m7hW+y/hIbub5nWSjSAd8chLBZOO016Kqtvtf2UBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646465; c=relaxed/simple;
	bh=exUFgKkNOkgX3YbRJeprGMKAC+3rhwrdVrR7Yx6ey4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2n1kCZIFKy/iR+qXasmxJOZ+vwlZNWNuaBTktJfHKXCpGeNU9fLxfiXymYLQI+DLsU0dwj4Zjyrnsvi0lMh7rgChm8QVTVD6kHAMYpfJzNPVvCss8FBapSY8amjsH+bJbGCJXvKaEhO7jpCtq/4K0EAj84aWFHpg5nSLTheXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MisppLS7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MisppLS7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34DD9175D;
	Tue, 12 May 2026 21:27:36 -0700 (PDT)
Received: from [10.164.148.43] (MacBook-Pro.blr.arm.com [10.164.148.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160763F7B4;
	Tue, 12 May 2026 21:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778646461; bh=exUFgKkNOkgX3YbRJeprGMKAC+3rhwrdVrR7Yx6ey4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MisppLS7KSQE6vaB5iWyhqRQsWvqws7p6GFbzW+ZqOvt/9JO13Z5DsRmJCDGP/aiH
	 Jv6aCL2jgu+FrSxLuE/vDcGWk9c5VGW9ejelVN12ErUz3QCVGaoekVw2R2OvDIBC8U
	 0kdtyL6lQvRQ7ZlTXTJ/MME/jdUPvE7Y/kP8qHzA=
Message-ID: <04203abd-b729-40cf-87e4-186b12c17298@arm.com>
Date: Wed, 13 May 2026 09:57:27 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix incorrect mmap() error handling with
 NULL instead of MAP_FAILED
To: Hongfu Li <lihongfu@kylinos.cn>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260513025223.592766-1-lihongfu@kylinos.cn>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260513025223.592766-1-lihongfu@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/05/26 8:22 am, Hongfu Li wrote:
> mmap() returns MAP_FAILED, which is defined as (void *)-1, on error,
> not NULL.  Several selftests incorrectly check the return value of
> mmap() using !ptr or ptr == NULL, which would erroneously treat
> MAP_FAILED as a valid pointer since MAP_FAILED is non-zero and
> non-NULL.  This can lead to segfaults when mmap() actually fails
> under memory pressure.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Hopefully you have fixed all instances in selftests/mm :)

Reviewed-by: Dev Jain <dev.jain@arm.com>

> ---
>  tools/testing/selftests/mm/ksm_tests.c     | 2 +-
>  tools/testing/selftests/mm/madv_populate.c | 2 +-
>  tools/testing/selftests/mm/soft-dirty.c    | 4 ++--
>  tools/testing/selftests/mm/vm_util.c       | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
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

