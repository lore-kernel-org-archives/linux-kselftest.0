Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697531A0728;
	Sun,  3 May 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777798123; cv=none; b=h15W4SC3eRuAUoZ26Sj4/jD+/9dlpOaeVKG+KjsHpLadz+4WC07iEUqZzerAwm8321WR13IGgaV3HjJlTsHUFppnN7jjBs3y7IOoKzExUSXN66rCq4C122jXxMBGq2F8tRXKRkM/5W8TraJPYcA734RYW+ydPR+m85LqFiSCT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777798123; c=relaxed/simple;
	bh=Wbux98YSlt9p4yMEYN/6OibBDq2tLkjqLsbaIfyloMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYDmqol427+nqlg2Mf9husQ3izUDKrJveaF/0IrKe5MYDq9rF7KBrx32+TvcTRF3+7EJG624Um/5x1+HRijeWjl8PgYSn8HDghcj2J0MS0hszdAMlQz4aUVoVkSbSE6MzUchExrU44tFhwjvL3kZ3M9YVUtRrN1jlqWsULvFUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImGibRl4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImGibRl4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FA9C2BCB4;
	Sun,  3 May 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777798123;
	bh=Wbux98YSlt9p4yMEYN/6OibBDq2tLkjqLsbaIfyloMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImGibRl4GZlBpEsgk89z5akvxGngy7i/7SEdecQsQ4Y3z2LkRW68bkdabl77lARru
	 6Bwm4bS3xqNdn/tDbw7O74JBIrsqWEM8lL39w040M6BtrN94FBhJkBYsWAmrAmouUx
	 YgPVuWE1RkPtPKVwJLkuOb+DYld/b7zxZe/Pnv8/lgBGcWNkchILygEPxbhtkC7Y8/
	 eViGATJVpH+o0/zdnO37KjpjmRH5VdRXsdVpavB6qpB687SbmJYdJLnmZIqlvJu/Gz
	 nhT/eoEOkslbrsWb2Zh8muryP/dI0LGx7Tm4mx+bmpYD1dZJRZCmml/KGeqjoJAxzY
	 3eBXcY4sGjRqw==
Date: Sun, 3 May 2026 10:48:36 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: shuah@kernel.org, akpm@linux-foundation.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com
Subject: Re: [PATCH v2] selftests/mm: ksm-functional-tests: fix partial write
 handling
Message-ID: <afcL5KGuOuUev8by@kernel.org>
References: <20260502005702.593878-1-agarwal.vineet2006@gmail.com>
 <20260503060234.644650-1-agarwal.vineet2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503060234.644650-1-agarwal.vineet2006@gmail.com>

On Sun, May 03, 2026 at 11:30:30AM +0530, Vineet Agarwal wrote:
> Update write() checks to properly detect and handle partial writes.
> 
> Previously, partial writes (ret > 0 && ret != len) would return
> -errno, but write() does not set errno in this case. This could
> result in returning 0 and incorrectly signaling success.
> 
> Fix this by:
>   - returning -errno only on actual failures (ret < 0)
>   - returning -EIO when a partial write is detected
> 
> This ensures partial writes are treated as errors and prevents
> false success reporting in tests.
> 
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
> 
> Changes in v2:
> - Fix incorrect use of -errno on partial writes
> - Return -EIO when write() completes partially

Please start a new thread for a new version of the patch.

> ---
>  tools/testing/selftests/mm/ksm_functional_tests.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
> index 9a8c852acd68..c80254cda926 100644
> --- a/tools/testing/selftests/mm/ksm_functional_tests.c
> +++ b/tools/testing/selftests/mm/ksm_functional_tests.c
> @@ -507,9 +507,13 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
>  	if (write(ksm_fd, "1", 1) != 1)
>  		return -errno;
>  
> -	ret = write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan));
> -	if (ret < 0 || ret != strlen(pages_to_scan))
> +	ssize_t len = strlen(pages_to_scan);

The v2 diff should be against the base, not against v1.

> +
> +	ret = write(pages_to_scan_fd, pages_to_scan, len);
> +	if (ret < 0)
>  		return -errno;
> +	if (ret != len)
> +		return -EIO;

Just return -1 if write() != strlen(), the actual error code does not
matter anyway.

>  	ret = write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms));
>  	if (ret < 0 || ret != strlen(sleep_ms))
> @@ -531,8 +535,10 @@ static int stop_ksmd_and_restore_frequency(void)
>  		return -errno;
>  
>  	ret = write(pages_to_scan_fd, "100", 3);
> -	if (ret < 0 || ret != 3)
> +	if (ret < 0)
>  		return -errno;
> +	if (ret != 3)
> +		return -EIO;
>  
>  	ret = write(sleep_millisecs_fd, "20", 2);
>  	if (ret < 0 || ret != 2)
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.
