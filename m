Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E83FE367;
	Mon, 27 Jul 2026 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155478; cv=none; b=CKfQhPtxPJHzcv/XX4eaxbZeJkcjYyHeO3wfiwvNOdxw6kiSOY9j+5vrzVhZ9SxnAMoR39HbIDC5afggh+2zBE1DI/SRNJmtj28huy3BE5MtQ6d0qC14kFnPsZCsDGfaZhhU4v3UW7T4bI89ia7yGej0SokbJ1zjOvcy8M9CpLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155478; c=relaxed/simple;
	bh=j+BHzPEFRkbiKFn4w3p1I6Wl+rj0OzkRLffo/FmX4LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+8/SX8KiHLqQ4H+4n7QfvnQZviDqnYXxBjwKsVLHfM6Zz7+vY0j+ykA99Jtb3H72sA/n6ZOn5SM65dc60pZlR8AQk0k19uMuEssTQEDPnXcb1X/ZUE78qGq23kJfwQjWXYGlZlMRc0jG2r1uLgfNRox1Loysl5AUnApgT9oZnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JoTWzgdQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JoTWzgdQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBFE1F000E9;
	Mon, 27 Jul 2026 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785155477;
	bh=1LqId8m1vq2FGslYePEEUuishiJMVsFHV0R9ARG65yI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JoTWzgdQGhtdQmvGGNiKuhMTuSefXoyFJnOl+4BRdR7ZK68BBtaYSZkKoUiR2n1Dq
	 nZCU18j1nkp27QFu6JsHHVz4qhzYE9Fsffiibsk1YhcyAUMXoabkjCA8UlI8IJhM+3
	 35uQJvVNzO0V/QiZn8v3nqjVmhsKIgrmrlm7EuKGWuX5KEB+LuwuCjABvJE66Qzek1
	 B0CrFfRyG9mMKQDy32LU3tAIUIMqFrnKUvN3gbGPeI8agjBGOlR/GKK6cMZD0e5R/t
	 4SnXCiPCrvneAX6O4FjAuFp8R6iyjQ7pnRFt8icskOMGeYud0ctHrcsoB9+4PqMvYV
	 2ORyxsb4ecNLA==
Message-ID: <a811c371-ef3d-4932-a9d4-2390a98e1382@kernel.org>
Date: Mon, 27 Jul 2026 14:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: unpoison pages in memory-failure teardown
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727095415.385026-1-usama.anjum@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260727095415.385026-1-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/27/26 11:54, Muhammad Usama Anjum wrote:
> The memory-failure tests call cleanup() only after all result checks.
> A failed ASSERT_* invokes fixture teardown and aborts the test, so it
> skips cleanup() and leaves the injected page hardware-poisoned.
> 
> Invoke cleanup() from FIXTURE_TEARDOWN() instead. Guard it with
> self->triggered so tests that exit before injection do not try to
> unpoison a page when no injection was attempted. This runs the existing
> HWPoison and HardwareCorrupted checks on both normal and assertion-failure
> paths.
> 
> Fixes: ff4ef2fbd101 ("selftests/mm: add memory failure anonymous page test")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---
>  tools/testing/selftests/mm/memory-failure.c | 26 +++++++++------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/memory-failure.c b/tools/testing/selftests/mm/memory-failure.c
> index 5d00aab31f9b5..eaa8b9bd401a1 100644
> --- a/tools/testing/selftests/mm/memory-failure.c
> +++ b/tools/testing/selftests/mm/memory-failure.c
> @@ -122,13 +122,6 @@ static void teardown_sighandler(void)
>  	sigaction(SIGBUS, &sa, NULL);
>  }
>  
> -FIXTURE_TEARDOWN(memory_failure)
> -{
> -	close(self->kpageflags_fd);
> -	close(self->pagemap_fd);
> -	teardown_sighandler();
> -}
> -
>  static void prepare(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
>  		    void *vaddr)
>  {
> @@ -200,8 +193,7 @@ static void check(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure
>  	ASSERT_EQ(pfn_flags & KPF_HWPOISON, KPF_HWPOISON);
>  }
>  
> -static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self,
> -		    void *vaddr)
> +static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failure) * self)
>  {
>  	unsigned long size;
>  	uint64_t pfn_flags;
> @@ -217,6 +209,16 @@ static void cleanup(struct __test_metadata *_metadata, FIXTURE_DATA(memory_failu
>  	ASSERT_EQ(size, self->corrupted_size);
>  }
>  
> +FIXTURE_TEARDOWN(memory_failure)
> +{
> +	if (self->triggered)
> +		cleanup(_metadata, self);

If the variant->inject(self, addr) fails, self->triggered would already have
been set.

Wouldn't it be cleaner to have a new self->poisoned that we set only after
->inject succeeded?

-- 
Cheers,

David
