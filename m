Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F012FE05C;
	Sat, 26 Sep 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432237; cv=none; b=uRwNWcSkUHe/fhoHYbgk8sZe0sM34zJkIhciYkYx7t6KXTP/25rq3hDlXOBJqo3bRHY6YFsx9kj6TVfkPGrn73cTlA3zPnE7+56+3moMjQgH5ZUVBRPKeW3I+FQrRST/MSA821LxIuLW0ilAVnVQBrOgDtDbK8F7jjzIAgyU1cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432237; c=relaxed/simple;
	bh=uMkjKL6sYXgRLOC+vUhP+qOY3YZYTjw5RbQ2fuxz6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Clwd0/2VfmpUfNOW2VqezTIbxAaWuR+vdz5lMs8xmZez2FibfBx+bz3czs7A0KgiP7OWxuQrMitdqZQ+/rWIIAGcMabuIVMab6/79p01+YU3QqjU61+GblwhGb/JfwkDf8rZSZOfG6vbIbmkAmc8edcTgVzGz4dL+mVCwby9vU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MzX7/y5P; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MzX7/y5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790432230;
	bh=uMkjKL6sYXgRLOC+vUhP+qOY3YZYTjw5RbQ2fuxz6S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzX7/y5PH/XpYmeD7tmbK1yj+ezmzUntd/5hDrh2SXkocu/IcCIPMFvSrLXDMPjGm
	 L0u5zuGB1NAM4BTQ+90utqaiu2IePFuzDRp3MHaAhjbHkhnpTdu4uMoC7gjR1eMTNT
	 v8MVGj2AKtiUpfMPV9jkKvcibUQJN3l4NXPTKmm4=
Date: Sat, 26 Sep 2026 16:17:10 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/nolibc: check for overflow in malloc()
Message-ID: <adcc9b9a-5788-48ef-af23-2895e4c8a924@t-8ch.de>
References: <20260926134332.58184-1-danishkhateeb03@gmail.com>
 <20260926134332.58184-2-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926134332.58184-2-danishkhateeb03@gmail.com>

On 2026-09-26 08:43:31-0500, Danish Khateeb wrote:
> malloc() adds the size of its header to the requested size and rounds
> the sum up to a multiple of 4096, without checking either step for
> overflow. For a size within the header size of SIZE_MAX, the sum wraps
> around to a few bytes, and malloc() returns a single page instead of
> NULL. For a slightly smaller size, the rounding wraps around to 0, and
> malloc() fails with EINVAL from mmap() instead of ENOMEM.
> 
> calloc() checks its multiplication for overflow, but then passes the
> product to malloc(), so calloc(SIZE_MAX, 1) returns a single page too.
> So does realloc(ptr, SIZE_MAX).
> 
> Such a size is usually a bug in the caller, for instance a length of -1
> used as a size_t, and returning a page instead of NULL can turn it into
> a heap overflow.
> 
> Fail with ENOMEM when adding the header or rounding up overflows, as
> glibc does for sizes this large.
> 
> Fixes: 0e0ff638400b ("tools/nolibc/stdlib: Implement `malloc()`, `calloc()`, `realloc()` and `free()`")
> Assisted-by: LLM
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> ---
>  tools/include/nolibc/stdlib.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> index 6c3c620a04cf..ea315e60cdeb 100644
> --- a/tools/include/nolibc/stdlib.h
> +++ b/tools/include/nolibc/stdlib.h
> @@ -130,9 +130,15 @@ void *malloc(size_t len)
>  {
>  	struct nolibc_heap *heap;
>  
> -	/* Always allocate memory with size multiple of 4096. */
> -	len  = sizeof(*heap) + len;
> -	len  = (len + 4095UL) & -4096UL;
> +	/*
> +	 * Always allocate memory with size multiple of 4096, and reject sizes
> +	 * which would wrap around once the header is added and rounded up.
> +	 */

The rounding to a multiple to 4096 is probably meant to align the size
to a page boundary. But this is insufficient on systems where the page
size is not 4k. The kernel doesn't actually seem to care.
Let's drop the rounding instead, and then add the overflow check on top.

Also the unittest doesn't seem to be worth it.

> +	if (__builtin_expect(__builtin_add_overflow(len, sizeof(*heap) + 4095UL, &len), 0)) {
> +		SET_ERRNO(ENOMEM);
> +		return NULL;
> +	}
> +	len &= -4096UL;
>  	heap = mmap(NULL, len, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE,
>  		    -1, 0);
>  	if (__builtin_expect(heap == MAP_FAILED, 0))
> -- 
> 2.55.0
> 
