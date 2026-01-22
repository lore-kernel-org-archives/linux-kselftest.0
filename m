Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C7B3EBF13;
	Thu, 22 Jan 2026 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103391; cv=none; b=hSrXZQ3+1HxeOiYnaplt3w0Zfb+UvUL6RmvC5TzJ9e5scX/a6cPJ9J+rZE/BDTwxGbYgLXgjy8irVmfZel5Rujuc7dxMHcV6rxhpjvcjFWMMdpCS8zAMd8QOyoUGZJubdyG6vsKjC2uhmCcav2sl/qXictR2RN+3v0HNZRGvAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103391; c=relaxed/simple;
	bh=wuUXmZA7ZfomimMvLlm7n5cxnu/gHSFgjcfABIq04+0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JZhC85w2hMY5zkhfqMdqwTZ8qFSL4PW0NaQKQZqnDvysv9fZz0N/Tnd8wLam+3fdTSfsDVn5dVhgUucZpk2Jie2eXVYXOSWZNsxP5cf1pV6/m+Brl4lRmUXQO431qWRb/6iszv3qGp5xGQGwCC9IyrBfAiWgHw/Cowb8t/DXcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37A4E1476;
	Thu, 22 Jan 2026 09:36:09 -0800 (PST)
Received: from [10.1.194.63] (e142334-100.cambridge.arm.com [10.1.194.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F4573F632;
	Thu, 22 Jan 2026 09:36:14 -0800 (PST)
Message-ID: <ab021f50-60c9-4d5c-99a0-255ead6e2288@foss.arm.com>
Date: Thu, 22 Jan 2026 17:36:13 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@foss.arm.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 5/9] selftests/mm: check that FORCE_READ() succeeded
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
 <20260122170224.4056513-6-kevin.brodsky@arm.com>
Content-Language: en-US
From: Usama Anjum <usama.anjum@foss.arm.com>
In-Reply-To: <20260122170224.4056513-6-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2026 5:02 pm, Kevin Brodsky wrote:
> Many cow tests rely on FORCE_READ() to populate pages. Introduce a
> helper to make sure that the pages are actually populated, and fail
> otherwise.
> 
> Suggested-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   tools/testing/selftests/mm/cow.c | 43 ++++++++++++++++++++++++--------
>   1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
> index 83b3563be26b..d9c69c04b67d 100644
> --- a/tools/testing/selftests/mm/cow.c
> +++ b/tools/testing/selftests/mm/cow.c
> @@ -75,6 +75,18 @@ static bool range_is_swapped(void *addr, size_t size)
>   	return true;
>   }
>   
> +static bool populate_page_checked(char *addr)
> +{
> +	bool ret;
> +
> +	FORCE_READ(*addr);
> +	ret = pagemap_is_populated(pagemap_fd, addr);
Very useful. Maybe extending FORCE_READ can help the entire suite?

> +	if (!ret)
> +		ksft_print_msg("Failed to populate page\n");
> +
> +	return ret;
> +}
> +
>   struct comm_pipes {
>   	int child_ready[2];
>   	int parent_ready[2];
> @@ -1549,8 +1561,10 @@ static void run_with_zeropage(non_anon_test_fn fn, const char *desc)
>   	}
>   
>   	/* Read from the page to populate the shared zeropage. */
> -	FORCE_READ(*mem);
> -	FORCE_READ(*smem);
> +	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
> +		log_test_result(KSFT_FAIL);
> +		goto munmap;
> +	}
>   
>   	fn(mem, smem, pagesize);
>   munmap:
> @@ -1612,8 +1626,11 @@ static void run_with_huge_zeropage(non_anon_test_fn fn, const char *desc)
>   	 * the first sub-page and test if we get another sub-page populated
>   	 * automatically.
>   	 */
> -	FORCE_READ(*mem);
> -	FORCE_READ(*smem);
> +	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
> +		log_test_result(KSFT_FAIL);
> +		goto munmap;
> +	}
> +
>   	if (!pagemap_is_populated(pagemap_fd, mem + pagesize) ||
>   	    !pagemap_is_populated(pagemap_fd, smem + pagesize)) {
>   		ksft_test_result_skip("Did not get THPs populated\n");
> @@ -1663,8 +1680,10 @@ static void run_with_memfd(non_anon_test_fn fn, const char *desc)
>   	}
>   
>   	/* Fault the page in. */
> -	FORCE_READ(*mem);
> -	FORCE_READ(*smem);
> +	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
> +		log_test_result(KSFT_FAIL);
> +		goto munmap;
> +	}
>   
>   	fn(mem, smem, pagesize);
>   munmap:
> @@ -1719,8 +1738,10 @@ static void run_with_tmpfile(non_anon_test_fn fn, const char *desc)
>   	}
>   
>   	/* Fault the page in. */
> -	FORCE_READ(*mem);
> -	FORCE_READ(*smem);
> +	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
> +		log_test_result(KSFT_FAIL);
> +		goto munmap;
> +	}
>   
>   	fn(mem, smem, pagesize);
>   munmap:
> @@ -1773,8 +1794,10 @@ static void run_with_memfd_hugetlb(non_anon_test_fn fn, const char *desc,
>   	}
>   
>   	/* Fault the page in. */
> -	FORCE_READ(*mem);
> -	FORCE_READ(*smem);
> +	if (!populate_page_checked(mem) || !populate_page_checked(smem)) {
> +		log_test_result(KSFT_FAIL);
> +		goto munmap;
> +	}
>   
>   	fn(mem, smem, hugetlbsize);
>   munmap:

