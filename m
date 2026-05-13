Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D803E5A01;
	Wed, 13 May 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664339; cv=none; b=cJ5vPqHaozloEsmYEhd6Sr7Z7UnUS5lbYjrub1BMKWOljmGLvxoFD+UXpOjGbZ9WuXJ9UhyU+V6q+eh6cMpg5KqCnhg/f3GNLsS5VU0s2Q6mjwtOcgFt2Tf+lsruYEhPYrhRAUI8it3PUvU8CbOwzGM2WqHrKlig7jg4j3UnExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664339; c=relaxed/simple;
	bh=arxih0bDE+7RIMMJ1ElB/+tYtHu5uDaWxFo/FiWSgHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHrZJtzmwDzhpX5N/QnwpMUM7yokU7C0v4BBzPmN5byG06M7U2/yDRZwfI9su3zmS/8Gg0WW5n8uY9Y40fZgwiQGYFjuR7JzjPNDi+qfiqGSC1bKEpjN9MNVrWIkcB2tSZBc1mkUNPY7peK2BWevF0aq3XHgJZVpEMf8qxNIKqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNJ/sVju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNJ/sVju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821C8C2BCB7;
	Wed, 13 May 2026 09:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778664339;
	bh=arxih0bDE+7RIMMJ1ElB/+tYtHu5uDaWxFo/FiWSgHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNJ/sVjuY+qBCCj/spXjuhopa6eqywKyu91VKIYkBVaVEbXB0E2HA598AiElBV4YD
	 oFRs3Rryan4aVKqjlH5n++sbj3zU6gsXt34Ut2w74aidSogOdD0LUJ1vbLGst43asT
	 P9rWPcdnNAcX5osE9S5TVIaPMc0kswwxyJuUx50of4g0syRYg86iMqnzKfZykQbCPS
	 ZbZ5dfUCcTUHld0K0olZP+M0aOEQs8rmKnM9016+8JopRbY3oIYF7Khu1uC5XCs9dd
	 3jj3g21JuodgpVNF+AyhavzVaDVFXaajclFt0y4Ra1j2PfjOfr+zgmSJ/1sJHPRQME
	 AshkCw2gcxbvA==
Date: Wed, 13 May 2026 10:25:33 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix incorrect mmap() error handling with
 NULL instead of MAP_FAILED
Message-ID: <agRDVWDvId9Jx9Q0@lucifer>
References: <20260513025223.592766-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513025223.592766-1-lihongfu@kylinos.cn>

On Wed, May 13, 2026 at 10:52:23AM +0800, Hongfu Li wrote:
> mmap() returns MAP_FAILED, which is defined as (void *)-1, on error,
> not NULL.  Several selftests incorrectly check the return value of
> mmap() using !ptr or ptr == NULL, which would erroneously treat
> MAP_FAILED as a valid pointer since MAP_FAILED is non-zero and
> non-NULL.  This can lead to segfaults when mmap() actually fails
> under memory pressure.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Ugh how did we end up with all of these :) thanks for the fix, assuming you get
all of the other cases on respin, feel free to attach my tag to that:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

Cheers, Lorenzo

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
> --
> 2.25.1
>
