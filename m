Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AB4848AA;
	Mon, 28 Sep 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586719; cv=none; b=YuXXpvDKniLUs+lAl0SIMoB0lK86AFv72qnS8tWAx/J1u9c9teZE5vMGsOp6nI6h9cNeTkxrghdGWUfsvAsZPp25/Z4OxoKaW5Fe6OHdoxJKJ/J9S9iWGQ5uxTC90FuPAtxiclyeMlT2dgCSegUO40sYPvbGBE25KSFzENAKIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586719; c=relaxed/simple;
	bh=LruxEbhmF6IGdxuRygoRSb1UZhzzw1t+jcqvjEZErcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3Es0t9jUt+jMcoBaDcsK+6uTfUewvvJGA5OfkHIXC/9BeMgft9Jznxi6zuu9A7Fez+pC1e9DOhyMFzct7wV+Dn094MU7cRXQu47UkU01MDl7XYeaCqn3rihVVTPOy2axfhCQjLuUDPorDqIGJ3Cr0JTf5nsqBJ3fMEBVolSuFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fU8GXNtN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fU8GXNtN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1691D1F00893;
	Mon, 28 Sep 2026 09:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790586718;
	bh=05NX/KueojKbo1FusJ/pQWHXEPJws9b0LGfxeblMA/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fU8GXNtNeuPrs802+rjWChGkvfufVE4OLG5EwtQwcuenhC6m8FhzlFRr8MwKJEnvK
	 MANc9vUSA2xGzmnHx3AzxE0AHBFdHi+X3tzkwuSeLIY534ly4y09dL5up8EPY58MO2
	 gHDGUl3fT21h6W9c0xaCoCEXu7iC0sfuprPdMHfec7HSZygKWioZawZfdOsb6zIRR5
	 4RnF3Qh83zb6BPRTMNdp+5A1UXcQw3k6ePLq0fZfUHeYS0am8F4bqWg2tuQy5SBeB7
	 5tX927u56A75jbpXnycES5HhLo+41TES7GpZF4NP79CYNq/M2eEQm8ZbicAus3zifB
	 JISbXt0JFnDnQ==
Message-ID: <cc123233-5b48-4069-8f84-f95301a83dcf@kernel.org>
Date: Mon, 28 Sep 2026 11:11:50 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] selftests/mm: add tests for UFFDIO_MOVE of a
 uffd-protected swap entry
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, akpm@linux-foundation.org,
 rppt@kernel.org
Cc: peterx@redhat.com, surenb@google.com, aarcange@redhat.com,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, mhocko@suse.com,
 shuah@kernel.org, kirill@shutemov.name, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
 <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/26/26 14:41, Donggeun Yoo wrote:
> Move a swapped-out page out of a write-protected or RWP-protected area into
> a destination registered for missing faults only, and read pagemap bit 57
> at the destination.  The destination was never protected, so the bit must
> be clear.
> 
> Assisted-by: LLM
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index ef9b3956bdcfd..580178630eded 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -2037,6 +2037,75 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
>  			      uffd_move_pmd_handle_fault);
>  }
>  
> +/*
> + * Moving a swapped-out page out of a write-protected or RWP-protected area
> + * must not carry the uffd bit into a destination registered for missing
> + * faults only: such a bit is never cleared afterwards, so pagemap keeps
> + * reporting the page as uffd-tracked.
> + *
> + * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
> + */
> +static void uffd_move_swap_test_common(uffd_global_test_opts_t *gopts,
> +				       bool rwp)
> +{
> +	unsigned long page_size = gopts->page_size;
> +	struct uffdio_move move = { };
> +	int pagemap_fd;
> +
> +	if (rwp) {
> +		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
> +			err("register src failure");
> +	} else if (uffd_register(gopts->uffd, gopts->area_src, page_size,
> +				 false, true, false)) {
> +		err("register src failure");
> +	}

Why not combine it with the protection?


	if (rwp) {
		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
			err("register src failure");
		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
				page_size, true);
	} else {
		if (uffd_register(gopts->uffd, gopts->area_src, page_size,
				 false, true, false))
			err("register src failure");
		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
			 page_size, true);
	}


> +	if (uffd_register(gopts->uffd, gopts->area_dst, page_size,
> +			  true, false, false))
> +		err("register dst failure");
> +
> +	if (rwp)
> +		rwprotect_range(gopts->uffd, (unsigned long)gopts->area_src,
> +				page_size, true);
> +	else
> +		wp_range(gopts->uffd, (unsigned long)gopts->area_src,
> +			 page_size, true);
> +
> +	pagemap_fd = pagemap_open();

Why not do that at the very top?

	int pagemap_fd = pagemap_open();

> +	if (madvise(gopts->area_src, page_size, MADV_PAGEOUT))
> +		err("MADV_PAGEOUT");
> +	if (!pagemap_is_swapped(pagemap_fd, gopts->area_src)) {
> +		uffd_test_skip("MADV_PAGEOUT did not swap the page; is swap enabled?");
> +		goto out;
> +	}
> +
> +	move.dst = (unsigned long)gopts->area_dst;
> +	move.src = (unsigned long)gopts->area_src;
> +	move.len = page_size;

You can set that all already when initializing aboce

struct uffdio_move move = {
	.dst = (unsigned long)gopts->area_dst,
	[...]
};

> +	if (ioctl(gopts->uffd, UFFDIO_MOVE, &move))
> +		err("UFFDIO_MOVE");
BTW, why do we fail the entire test here instead of only this test case?

-- 
Cheers,

David
