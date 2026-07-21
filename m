Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4342D5436;
	Tue, 21 Jul 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645724; cv=none; b=qbxHBKb2UUxZVOGtCW020V+W0UkTrw4qamvtTFHtDn1/6GEh+T0AxTRqk1ghxzO8eBapxeipf02CmF1mjrQQM7NQis5shX6tK/CUnOpBr6IH0ngSjRcttv6Id80Ti7n6sZGKQ8IUsxAYL9xLZBGZQBKzM7ERPNitr1c6IzdAQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645724; c=relaxed/simple;
	bh=eVaFqj7Kr+842nz6y3VHZfm8hMWJJbZoaaw6rAgu0Ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4dbDlCyjEhKPNAjBojvGTFYdkIGqPKDNlgVwizfHkMxQk//wJ3f7xVrsfpHKD0vTl4GD0BgNrsN2zJ1OHmvLNJkS3IOUmXglKSF4Bvr+PNt8rnUEGxPSK+La5S7V/Yzwtvtudk5QLiVv1IGm6HjZh9gGInbQkgOwxafXb++pNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU3VfTMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU3VfTMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E792C1F000E9;
	Tue, 21 Jul 2026 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645722;
	bh=JqgP6/1vZQA9GBdH0LWRXjquTgO0fEILyJc7crNbr3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nU3VfTMzLIQcVaYqBxNGhgYRoq3QlIqshzL3yW/teYN46bR5pNHJPuvsoDCITMvgi
	 TmS1x+BttZyJrMOPNX5uZ0EnRZZQu0/eS8lma8g5dsFqB6htaA5sXYcwDtfW3NlZQW
	 tFyC8oG4YR1vSDgRrYlEFkkQ/6aS2oWjtxv1TdxR3CcU6baNYfgL1sKGk9RE3p+tX9
	 ush6g7c4SxoTyCGkMfTZ4uTa+/vr0TcjGaXsdg/RbX977gONO6tm7r5qVlYHdf9jNe
	 NRr+pFzb2cY/hW8x/Z6iK1a/l4+e+7L+ZxS5YNZT9/L8SPf01CpKAxpp7o/bVZLhfE
	 8YMCFPu5ISkbA==
Message-ID: <2ea6ee0f-ae22-4961-ba8e-7c4794a692fc@kernel.org>
Date: Tue, 21 Jul 2026 16:55:19 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm/pagemap_ioctl: Fix missing NULL checks after
 calloc()
To: longlong yan <yanlonglong@kylinos.cn>, akpm@linux-foundation.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, shuah@kernel.org
References: <20260721063611.342-1-yanlonglong@kylinos.cn>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260721063611.342-1-yanlonglong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/21/26 08:36, longlong yan wrote:
> The pagemap_ioctl selftest allocates memory via calloc() in several
> places but does not check the return values. If calloc() fails, the
> subsequent code will dereference a NULL pointer and crash.
> 
> Additionally, in sanity_tests(), the calloc() failure check incorrectly
> uses MAP_FAILED (the mmap() error constant) instead of NULL. Since
> calloc() returns NULL on failure, the check never triggers and a
> failed allocation goes undetected.
> 
> Add NULL checks after each calloc() call, and fix the wrong error
> constant in sanity_tests(). Use ksft_exit_fail_msg() consistent with
> the existing error handling pattern in the file.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index f9bcff8e78fa..f6629f44a13d 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -212,6 +212,8 @@ int userfaultfd_tests(void)
>  
>  	vec_size = mem_size/page_size;
>  	vec = calloc(vec_size, sizeof(struct page_region));
> +	if (!vec)
> +		ksft_exit_fail_msg("error nomem\n");
>  
>  	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
>  				vec_size - 2, PAGE_IS_WRITTEN, 0, 0, PAGE_IS_WRITTEN);
> @@ -699,6 +701,8 @@ int base_tests(char *prefix, char *mem, unsigned long long mem_size, int skip)
>  	vec_size = mem_size/page_size;
>  	vec = calloc(vec_size, sizeof(struct page_region));
>  	vec2 = calloc(vec_size, sizeof(struct page_region));
> +	if (!vec || !vec2)
> +		ksft_exit_fail_msg("error nomem\n");
>  
>  	/* 1. all new pages must be not be written (dirty) */
>  	written = pagemap_ioctl(mem, mem_size, vec, 1, PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
> @@ -1000,6 +1004,8 @@ int unmapped_region_tests(void)
>  	int written, len = 0x00040000;
>  	long vec_size = len / page_size;
>  	struct page_region *vec = calloc(vec_size, sizeof(struct page_region));
> +	if (!vec)
> +		ksft_exit_fail_msg("error nomem\n");
>  
>  	/* 1. Get written pages */
>  	written = pagemap_ioctl(start, len, vec, vec_size, 0, 0,
> @@ -1116,7 +1122,7 @@ int sanity_tests(void)
>  
>  	vec = calloc(vec_size, sizeof(struct page_region));
>  	mem = mmap(NULL, mem_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
> -	if (mem == MAP_FAILED || vec == MAP_FAILED)
> +	if (mem == MAP_FAILED || !vec)
>  		ksft_exit_fail_msg("error nomem\n");
>  
>  	wp_init(mem, mem_size);

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
