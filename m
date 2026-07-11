Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A740330650;
	Sat, 11 Jul 2026 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755090; cv=none; b=ussceP/EERmbITaC24taQKAxNibp0q1VTrN2MrcmQBU36GM3RFQKxg9iyn7E3mLwBjXgf5lUq17UhEk9PMBUOZNeAVKxHQCmtQ4zkFSpQKAVijLFPuBBw/zUVWC9Pxm1PGSZlmekqtvS4zGcympbmktLmT1x/+WaMA4Maqn3wIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755090; c=relaxed/simple;
	bh=DKPgquJCYN9zIomY/o2ia2mQ5GCyHVdSRvRz+k97MOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qV072EW5XnrobajfhZGh4visGqLM+FKcEKNXkhOVKAsRGYSxzo3pkzC/X3n+Gaoj9ViI82dpyIscEBuVoSgo+5OHYs+XukDYBZYxvgk4hAoE/oidpt2A5LoJp3GB3JPq43vUhnbr9cxGWcJ9e23pcq9tn+LWXShntm4247jMokY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhO/XnPL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhO/XnPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AA91F000E9;
	Sat, 11 Jul 2026 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755088;
	bh=pXKkMbE8S50fgci7zV//UdWNphx5itNGzvWESRKObgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KhO/XnPLypEcN+qXIRTWLzu8O2Y/F16+kdI29zDTSrvLklMfo7TQcpfnonmGvvJG7
	 pP52IH5+GRUjeVRbg5Yy4rSKY7/AewvEcTgb/jgyIOTouLqc4kxiFUTT56uKE2mmHQ
	 ItFhV1PI/gf3irZiMqfcv6mG//q1/aSvea078Todvek8GmXbnMs2iJktQkf5aNNVP+
	 ofJJDnK5Kv2qKXdMj5pPwq6dJeYEhrzbIpFKkwz2zxTb/8vKn1GpPEdiF7H3pOY324
	 klFrHq8C6cmF7Lh3uFdxDiHR9LbkvO+bcPmUL9IZkzit5qoQogkYEQp4PVfvtmwegY
	 7SCmG5BTmBNsQ==
Date: Sat, 11 Jul 2026 08:31:16 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, hongfu.li@linux.dev
Subject: Re: [PATCH] selftests/mm: Fix memleak in migration benchmark
Message-ID: <alHxLNTQFJlb3cLV@lucifer>
References: <20260708103705.840679-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708103705.840679-1-lihongfu@kylinos.cn>

On Wed, Jul 08, 2026 at 06:37:05PM +0800, Hongfu Li wrote:
> Several early return paths in run_migration_benchmark() skip
> hmm_buffer_free(), leaking the buffer. Replace with a single cleanup
> label.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

LGTM. With the Fixes tag added as requested by David, feel free to add:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/hmm-tests.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index e4c49699f3f7..e8046675a0c3 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2828,8 +2828,10 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
> -	if (buffer->ptr == MAP_FAILED)
> -		return -1;
> +	if (buffer->ptr == MAP_FAILED) {
> +		ret = -1;
> +		goto cleanup;
> +	}
>
>  	/* Apply THP hint if requested */
>  	if (use_thp)
> @@ -2838,7 +2840,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
>
>  	if (ret)
> -		return ret;
> +		goto cleanup;
>
>  	/* Initialize memory to make sure pages are allocated */
>  	ptr = (int *)buffer->ptr;
> @@ -2848,11 +2850,11 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
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
> @@ -2861,7 +2863,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>
>  		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>
>  		end = get_time_ms();
>  		s2d_total += (end - start);
> @@ -2871,7 +2873,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>
>  		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
>  		if (ret)
> -			return ret;
> +			goto cleanup;
>
>  		end = get_time_ms();
>  		d2s_total += (end - start);
> @@ -2886,8 +2888,9 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  				 (results->dev_to_sys_time / 1000.0);
>
>  	/* Cleanup */
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
