Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA15286D63;
	Thu, 22 Jan 2026 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062570; cv=none; b=roqz/fd2wvfIrrA3yAZ9XvqIbcn+AAC9ttubEjwPOARd7pAhPBwHmzUn8JheHBP4H5tbVhS18XRFtI0K2xyK5vkDmF04iaNUnFJpQqXwMZxTgu1YCfHjG5bWPJhOnlOJfLufNog9+m1W/91HXXxRPifaeENWujlAhNkiBtlMC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062570; c=relaxed/simple;
	bh=0axUIC+JvkCjnkJ5W4oGGIcrOJHUgpE1/rzuLhyZIL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPY9Kf+fkAVlc3frEZoZdHXr3WHrbgXQms8eiACNnXzXpSxbK840tuD3SF0Gc3yHMh1jIQk1Y/Ne6jKG6wZUwGgENl8aPhlqwFzVraAHjqw8itja47ZOlJ+0spXthy/q1NFbMVq3x7woYdaXyok943D8mcX4q/h0R5yQY6G6zmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B9D81476;
	Wed, 21 Jan 2026 22:16:00 -0800 (PST)
Received: from [10.164.18.63] (MacBook-Pro.blr.arm.com [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC71D3F740;
	Wed, 21 Jan 2026 22:16:03 -0800 (PST)
Message-ID: <a3a8784b-4a4d-457c-8fba-1f27a71d5a0e@arm.com>
Date: Thu, 22 Jan 2026 11:46:01 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] selftests/mm: fix faulting-in code in
 pagemap_ioctl test
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Usama Anjum <Usama.Anjum@arm.com>
References: <20260107164842.3289559-1-kevin.brodsky@arm.com>
 <20260107164842.3289559-7-kevin.brodsky@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260107164842.3289559-7-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 07/01/26 10:18 pm, Kevin Brodsky wrote:
> One of the pagemap_ioctl tests attempts to fault in pages by
> memcpy()'ing them to an unused buffer. This probably worked
> originally, but since commit 46036188ea1f ("selftests/mm: build with
> -O2") the compiler is free to optimise away that unused buffer and
> the memcpy() with it. As a result there might not be any resident
> page in the mapping and the test may fail.
>
> We don't need to copy all that memory anyway. Just fault in every
> page.
>
> Cc: Usama Anjum <Usama.Anjum@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Dev Jain <dev.jain@arm.com>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index 2cb5441f29c7..80d7c391f8f5 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1056,7 +1056,6 @@ int sanity_tests(void)
>  	struct page_region *vec;
>  	char *mem, *fmem;
>  	struct stat sbuf;
> -	char *tmp_buf;
>  
>  	/* 1. wrong operation */
>  	mem_size = 10 * page_size;
> @@ -1167,8 +1166,7 @@ int sanity_tests(void)
>  	if (fmem == MAP_FAILED)
>  		ksft_exit_fail_msg("error nomem %d %s\n", errno, strerror(errno));
>  
> -	tmp_buf = malloc(sbuf.st_size);
> -	memcpy(tmp_buf, fmem, sbuf.st_size);
> +	force_read_pages_in_range(fmem, sbuf.st_size);
>  
>  	ret = pagemap_ioctl(fmem, sbuf.st_size, vec, vec_size, 0, 0,
>  			    0, PAGEMAP_NON_WRITTEN_BITS, 0, PAGEMAP_NON_WRITTEN_BITS);
