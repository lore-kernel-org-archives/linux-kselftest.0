Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DD422550;
	Tue,  7 Jul 2026 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460874; cv=none; b=ioutYp8TmM7OmAxTw6DjdZGgr6XORZTLBGwv/YbuoDNiXVcWdg8iSdB0QOWdbyrmAlU4sZY+OC/1tWLALZDvg37CkmA/lOOmt7TMZXdzh0yhR6geGYDBnq+hHwpdwcysdfbIYv39GVStsV7HaM92CJpVjWhNLD6p9LRO14tGk4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460874; c=relaxed/simple;
	bh=cJVH0flxbPZCGqEfhpCxPKNtq54aZfR54DVWTuV2zC4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oHlcOwN3Q2Ed9hieTr6UlHVF1w+GM5zX+cvKR15XxY2tI4nQ8GqNoiYwLyAyItl7AkhrUEVlY0cdPitDKH6N3+73GZoGnv0iA1aXzWvQ057uVcMHCKJW+fVaGlk8RK8a3MDv/xmF8AOQetU+gi0GXc7pTV3OGFTNhT/KMO0jCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=uXtZIhhe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="uXtZIhhe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DCA1F00A3F;
	Tue,  7 Jul 2026 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783460872;
	bh=B/ZwkE1X/o1VkF0vxEq6jcgIp5Z3jnaP92+5KW9PAIc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=uXtZIhhegdYykPXHXq8FGb+zPLvgGwC4D3aBl58RPTA1LUBQB6oaizJFNtzInclqq
	 P1wevONQAD/tMzoph/KQC9sNYT/rXdDaxF6jJ73pUL8k7D7hxZ+JrqV+BZBAGgsb6L
	 TQC9VJxGe6zm5Cj5mGPnF9D6bE0eJbbTM/L55gbs=
Date: Tue, 7 Jul 2026 14:47:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: rppt@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] selftests/mm/mseal_test: Fix mmap return value check
 in test_seal_zero_address
Message-Id: <20260707144751.fbd08a3dd6839371d001173e@linux-foundation.org>
In-Reply-To: <20260707031745.1039-1-yanlonglong@kylinos.cn>
References: <akuQbvgVR8vrEFvo@kernel.org>
	<20260707031745.1039-1-yanlonglong@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  7 Jul 2026 11:17:45 +0800 longlong yan <yanlonglong@kylinos.cn> wrote:

> The return value for a failed mmap function is MAP_FAILED.
> According to the definition of FAIL_TEST_IF FALSE,ptr must be
> determined to be distinct from MAP_FAILED
> 
> ...
>
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

Has this been tested?

AI review is suggesting the code was supposed to be this way and it
appears to have a point:
	https://sashiko.dev/#/patchset/20260707031745.1039-1-yanlonglong@kylinos.cn
