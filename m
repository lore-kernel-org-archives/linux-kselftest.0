Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4383101CE;
	Tue,  7 Jul 2026 05:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783403877; cv=none; b=Bq+TQUwHnYBS5q1jSuUka7lF+YnKh2tm9u0spoQE2dUJEdO/09Spi0IFVIbkO9Eo9T+GYAHYPhgHbjq9jPqFVQoPnYo0xaSkie4AAE8LPNCcBf5/iilMWDAaLufHtGd/IUyQTNB9cI+z+kj0b0ZVYgN6Ecto+8W+pXhvVluhtFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783403877; c=relaxed/simple;
	bh=Hco3LTWoWt84qIm5xEnlVsLfJknqcTHANQ7mTmAF+Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AT7EezaA/+xJ2ghYH41j6UwAo5QGcVIcQ4muwAt14QEIHIu7weXmta93cjAkFirvaqex7WVCpf7OXhWMf/jMbLfgDrNqOC5k1bZ+jIuqHXQhNZi8+sNBlY2i0x1kP1OE6djfj+/GvQ+ASJrPDh/I5wAfP4rrfZTx76vuBrhX14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ9kTZVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ9kTZVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767161F000E9;
	Tue,  7 Jul 2026 05:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783403876;
	bh=3iJynP4kRwvLyws2F7vEyjqsIEzMYchfgfzrFW9gLc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQ9kTZVHkjSf2cdBbNxi7liZaZFy9C7kpYceHELbwh8LOTRGi+a6Bm4/mUVcc66e0
	 TfoWbDpBPeIH9OLm7Oxrs003CBLJKe63+VfM1Ac7hPXDxzLsdnPtntBZ639nz/qTaE
	 Evqb/q6Y3oKHVZQ+lrHTP9OqbqX75V3bADemQr2lq8KtG6jU38zDi3ftORuPAztetF
	 MdzRBQYWXGoRdVa3AYzhERTEG4zolLkrZGtjS8FDw/rN1EzW/HRQRl2pDuiIdMi313
	 aoM83Cu01DJ7iOLz+Vcq4CP4tVQPdoIKlYNxMBO43dOz+DqwK5VcyflS2hNAPUVvGs
	 6muiVlGaNUhdg==
Date: Tue, 7 Jul 2026 08:57:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] selftests/mm/mseal_test: Fix mmap return value check
 in test_seal_zero_address
Message-ID: <akyVXpECB19-H9Q8@kernel.org>
References: <akuQbvgVR8vrEFvo@kernel.org>
 <20260707031745.1039-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707031745.1039-1-yanlonglong@kylinos.cn>

On Tue, Jul 07, 2026 at 11:17:45AM +0800, longlong yan wrote:
> The return value for a failed mmap function is MAP_FAILED.
> According to the definition of FAIL_TEST_IF FALSE,ptr must be
> determined to be distinct from MAP_FAILED
> 
> Fixes: 4926c7a52de7 ("selftest mm/mseal memory sealing")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/mseal_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
> index faad4833366a..277c8fda3f5e 100644
> --- a/tools/testing/selftests/mm/mseal_test.c
> +++ b/tools/testing/selftests/mm/mseal_test.c
> @@ -482,7 +482,7 @@ static void test_seal_zero_address(void)
>  	/* use mmap to change protection. */
>  	ptr = mmap(0, size, PROT_NONE,
>  		   MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
> -	FAIL_TEST_IF_FALSE(ptr == 0);
> +	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
>  
>  	size = get_vma_size(ptr, &prot);
>  	FAIL_TEST_IF_FALSE(size == 4 * page_size);
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
