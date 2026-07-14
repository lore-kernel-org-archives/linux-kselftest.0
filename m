Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749F357702;
	Tue, 14 Jul 2026 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784023656; cv=none; b=OGJNPbEOdK37SYU/Mff5Pgg1AR05ea8lgd0tC3acQA1HKHSzMBn9rDf2o3ByLGdO8WBtRrNkZRaMfR6oB2uSBdKl2AnVJEiEQOU26ew8F7FwDNH0j0R4LelNIySIEiQg1wtC0O4SNFQjqsgY472iFvX1kwVNBuOGnuPap/WShEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784023656; c=relaxed/simple;
	bh=PqeCepdYL0vcZ1zaORMjFyWWLZx+O4lwJSJ8B6jsKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ol52c9UadC3GvUKQvB6eWTosefbBBcHGvC5DbdIPlPm/rBRP9aQEoURT3IaipKIjCPeqd619ffZ0sr0/YQSxJimaWlrYtqy9ST53e876yyKY33crWErgRn5ehPbmjkci1wsvcCvfES0Q5YuB/BvsAh3LmSh0v178jGN1KUi/eGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJyD9QEX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJyD9QEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F6B1F00A3A;
	Tue, 14 Jul 2026 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784023655;
	bh=/175y28NB+ZFC3yHKio3eZe/JFspmgrkZa1O3kEAj9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gJyD9QEXespHpA+2dReUkty/xaWk1Mf7m6uy1vuLe2wGx4K5bgW81Pj7zaGIuljgD
	 2RejCTkR9Evunw8dM4kLlDUXTVeEA7HkjN2GZqqURC0rLNiyFW2UdarzMyUlwtvfG/
	 r7yXxQdWlIvMk+pgiO8txJjuFf9FV4aAN8S7FTBHKfdz5xQDpUmMpEZbdEMfu4MSLe
	 v17e88C4bRLQoO4zPMJIgh+xb2ZWBU6Dm1+7nGGN181gf9rkIfyoQa597Uo+eSphpn
	 jVEr3A3ANQwx7/tmM2xN9oJ7GTaz5jjThOBeYxsgbX5VgqqCjyW2dqFqrlXlTL4Q6J
	 zhoEm847xH63g==
Date: Tue, 14 Jul 2026 11:07:21 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, shuah@kernel.org, balbirs@nvidia.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hongfu.li@linux.dev, SJ Park <sj@kernel.org>
Subject: Re: [PATCH v2] selftests/mm: Fix memleak in migration benchmark
Message-ID: <alYJzrQOXY1AoV6j@lucifer>
References: <20260709081843.1451202-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709081843.1451202-1-lihongfu@kylinos.cn>

On Thu, Jul 09, 2026 at 04:18:43PM +0800, Hongfu Li wrote:
> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.
>
> Fixes: 271a7b2e3c13 ("selftests/mm/hmm-tests: new throughput tests including THP")
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: SJ Park <sj@kernel.org>

LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> v2:
>  - Set buffer->ptr to NULL on mmap failure to avoid passing MAP_FAILED
>    to munmap() in hmm_buffer_free()
>  - Drop the redundant "/* Cleanup */" comment
>  - Add Fixes tag for the commit that introduced the leak
>  - Collect Reviewed-by tags from David Hildenbrand and SJ Park
> ---
>  tools/testing/selftests/mm/hmm-tests.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index e4c49699f3f7..402c6f6f5f09 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2828,8 +2828,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
> -	if (buffer->ptr == MAP_FAILED)
> -		return -1;
> +	if (buffer->ptr == MAP_FAILED) {
> +		buffer->ptr = NULL;
> +		ret = -1;
> +		goto cleanup;
> +	}
>
>  	/* Apply THP hint if requested */
>  	if (use_thp)
> @@ -2838,7 +2841,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
>
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>
>  	/* Initialize memory to make sure pages are allocated */
>  	ptr = (int *)buffer->ptr;
> @@ -2848,11 +2851,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	/* Warmup iteration */
>  	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>
>  	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>
>  	/* Benchmark iterations */
>  	for (i = 0; i < iterations; i++) {
> @@ -2861,7 +2864,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>
>  		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>
>  		end = get_time_ms();
>  		s2d_total += (end - start);
> @@ -2871,7 +2874,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>
>  		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>
>  		end = get_time_ms();
>  		d2s_total += (end - start);
> @@ -2885,9 +2888,9 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
>  				 (results->dev_to_sys_time / 1000.0);
>
> -	/* Cleanup */
> +cleanup:
>  	hmm_buffer_free(buffer);
> -	return 0;
> +	return ret;
>  }
>
>  /*
> --
> 2.25.1
>

Cheers, Lorenzo
