Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99D36494B;
	Mon, 17 Aug 2026 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786965580; cv=none; b=g85PzoEl2TMPM5/pWK7bR4KuWlJl07cToWBaRp9MCZoTn124L1sj5rvJeIvXmz5c+//U3kJtuIgi+eFC7nDtXLFIRMLreJj5gkXjSg3A95OK/Fa37dSNsvQKREzFXvw/Zt6YmxKjS+8cSQ2Cm6tmLse2UJT8QAMQnQe5jl+CX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786965580; c=relaxed/simple;
	bh=Z7n9J5fZM6Me6nzMXgcSNh8P/FmCIbTtU/2UlRwb+Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lP4LgrwQdFJViVgqUK4BJVGfnC3Gc6wXtENKMi/K0hL7eXFOfecyNGZEYPDsA3vPwngNNPEnRzVPacTs40NsyGSuZtcWniPRAbRpE/4moXRy7H5wurKwH0Y+Pu5Zb6EtLtyVdCUHqfV62hE4vTrO0L/gEgrtOoiubjErSAGCqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4zeGcmT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4zeGcmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F400A1F000E9;
	Mon, 17 Aug 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786965578;
	bh=/wjAZePGPW+1lTeTzAWETwTnmwk0ye6Pox92ahi7Up8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z4zeGcmT+UuQPCMGh2Qb1ampLn0x8kI6lKKajPy+kHr/YJdDeQZ5PUvwAVY/DMOi9
	 eZ+DhB2uGw0nOayDEqNh9xGOlS8+qeJ40L51RIC/DeHnHs36kagJgiIm670DUy+/OC
	 YuaZTE57Riz1BHN8QGFwLslEOQM5DY0NWlS9XcVjB9XK4jWL5CFtbCIIX85OmtjjKT
	 ikX9U0LnSac9ik3xEwuQtUA3RIvW3WcWWK8XBlmaEb4gYGr6f30AGPgc2EUDhEQCgH
	 +Gi9sjIPEQ7DoBafyqYdggJkiO9TPteLICZ9YxYO6yHaLR8+KZm18P5/4Xdh/ns77A
	 pjwAdRGxvraFg==
Date: Mon, 17 Aug 2026 14:19:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: khugepaged: consolidate error exits via
 kselftest helpers
Message-ID: <aoLuQV-mGq-4wKf4@kernel.org>
References: <20260817061955.45454-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817061955.45454-1-hongfu.li@linux.dev>

On Mon, Aug 17, 2026 at 02:19:55PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> Replace the perror()+exit(EXIT_FAILURE) pattern with
> ksft_exit_fail_perror() so failures are reported through the
> kselftest framework, consistent with the rest of the file.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 0d6c71ed2fae..8d1b87f2195c 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -358,21 +358,15 @@ static void *file_setup_area_common(int nr_hpages, enum file_setup_ops setup)
>  		ksft_exit_fail_perror("open()");
>  
>  	size = nr_hpages * hpage_pmd_size;
> -	if (ftruncate(fd, size)) {
> -		perror("ftruncate()");
> -		exit(EXIT_FAILURE);
> -	}
> +	if (ftruncate(fd, size))
> +		ksft_exit_fail_perror("ftruncate()");
>  	p = mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE,
>  		MAP_SHARED, fd, 0);
> -	if (p != BASE_ADDR) {
> -		perror("mmap()");
> -		exit(EXIT_FAILURE);
> -	}
> +	if (p != BASE_ADDR)
> +		ksft_exit_fail_perror("mmap()");
>  	fill_memory(p, 0, size);
> -	if (msync(p, size, MS_SYNC)) {
> -		perror("msync()");
> -		exit(EXIT_FAILURE);
> -	}
> +	if (msync(p, size, MS_SYNC))
> +		ksft_exit_fail_perror("msync()");
>  	close(fd);
>  	munmap(p, size);
>  	success("OK");
> @@ -447,7 +441,7 @@ static bool file_check_huge(void *addr, size_t len, int nr_hpages,
>  	case VMA_SHMEM:
>  		return check_huge_shmem(addr, len, nr_hpages, hpage_size);
>  	default:
> -		exit(EXIT_FAILURE);
> +		ksft_exit_fail_msg("Unknown VMA type\n");
>  		return false;
>  	}
>  }
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.
