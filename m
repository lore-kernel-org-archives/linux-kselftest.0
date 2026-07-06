Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04103B14AA;
	Mon,  6 Jul 2026 11:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337077; cv=none; b=YXRkyNxAnBLQW4bssJeesbJ8G0mZY8APmr1cBqSOkgcDyDzCeCwqJW5jzFMxMdKmBl1GYOLfMCjsNPMlE1q7mT2ixI4KHLcVuonqLqQlLdlgNzpMIQiraPk7WTG5IUIm2Ia8zQyC/o6bGQZhx8OghTMIgfHkWxmWDNCeFG0zsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337077; c=relaxed/simple;
	bh=nksThHYYtp1spOq1lTaFgCg8RXykVXLFsYCM3LOZgsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FayISeZSni0ge+sKzyL745C7ml1iuckxu1kO13B42cC3Qo6zprjzJ/++Nb2lSfAKir1Lpm1ONMSqvHSW8zV+2xSK9oyTp5qCqIMJvPvRvA1Xhk7bBOt39VtT2FFDZVJc83ZLU4kvxArBNP/FDP9vcHNsdFL0GCFdwWNZhmfqwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRViuTMC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRViuTMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E14F1F000E9;
	Mon,  6 Jul 2026 11:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783337076;
	bh=YvZOkeuj6Jz+Vl/DDhv83e0XazYYb0gyHTufoIWjdys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dRViuTMC4dzD/BkkmAu7v1QO9lFTFk8gLpKC6/L9wm0+i8SkxP0QrdqW8//zbRd4Z
	 VQCq/5ex7W8mnUPn/usQSNkbCedvelcCq0jeJTSQn/oA1amJoczYsnseCgSu4ACuU3
	 7daAeIxjxLVYU/LLcpJMSlZpudmqW757h9wEX0vJLFW1SZiiodXqPBI2rd2JtRPC+6
	 C+wrq7l9fmVBxA15MTJY5Yf7Fu069HZI6RoqOWKUDbBiN1fr0m7URbc77rTQuUx3U+
	 FQh/4yVDwN1CuUUjnbcBzE1T+VHNztuNqjqC8v0wJc3cs6o5o+SK9tE8tpVN+h2aW9
	 0eZGaruac+GXw==
Date: Mon, 6 Jul 2026 14:24:30 +0300
From: Mike Rapoport <rppt@kernel.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm/mseal_test: Fix mmap return value check in
 test_seal_zero_address
Message-ID: <akuQbvgVR8vrEFvo@kernel.org>
References: <20260706083049.187-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706083049.187-1-yanlonglong@kylinos.cn>

Hi,

On Mon, Jul 06, 2026 at 04:30:48PM +0800, longlong yan wrote:
> test_seal_zero_address() uses mmap() with MAP_FIXED to map at address 0,
> but only checks if the return value equals 0. If mmap() fails, it returns
> MAP_FAILED ((void *)-1), not 0. The existing check FAIL_TEST_IF_FALSE(ptr == 0)
> would pass when ptr == -1 (since -1 != 0 is true), causing the test to
> continue with an invalid pointer.
 
> Add a check for MAP_FAILED before verifying ptr == 0, consistent with all
> other mmap() checks in this file which use FAIL_TEST_IF_FALSE(ptr != (void *)-1).

The changelog looks like an LLM generated. Can you please instruct your LLM
to produce more concise descriptions that communicated the gist of the
change?
 
> Fixes: 4926c7a52de7 ("selftest mm/mseal memory sealing")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Other than that,

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/mseal_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> index faad4833366a..a6ecc81c6aa0 100644
> --- a/tools/testing/selftests/mm/mseal_test.c
> +++ b/tools/testing/selftests/mm/mseal_test.c
> @@ -482,7 +482,7 @@ static void test_seal_zero_address(void)
>  	/* use mmap to change protection. */
>  	ptr = mmap(0, size, PROT_NONE,
>  		   MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> -	FAIL_TEST_IF_FALSE(ptr == 0);
> +	FAIL_TEST_IF_FALSE(ptr == (void *)-1);
>  
>  	size = get_vma_size(ptr, &prot);
>  	FAIL_TEST_IF_FALSE(size == 4 * page_size);
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
