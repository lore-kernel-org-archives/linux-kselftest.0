Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E7F485CF7;
	Mon, 28 Sep 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585638; cv=none; b=E3tPf6dC9LjvLBgHrS1O5l8QpKbmGPu+viZo3Mw9TLTcybnabkvjtp76nzbJSpf25pCaQW+GrnT0hizjmK0jXxhYZg/hQmeVHyRUVQLy6RZoteKGpb1shmpoqeAEOef4h5tYFQJbwIhS1DgDsFz2wg0xiTukEYpkKUmdUoo8uy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585638; c=relaxed/simple;
	bh=U7p+ll+lx6MHhl2gZLm9ZnSx1Cc3HreKMd2uTg2Ay0U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L5iinYQxptRvdOJgj+Q9EaKmwqt3apbVPwrZRi/MQwxEgm65dnlCGKka/Y9HWMZ+ntV+jBF+MdHujvjrrXatOhk9K9LAVYhjejfx2uXcR111pJAiQYeFhxyIoafndIaFf6rFdxzHC1PPdsUdVDYd9Ipk1EoZpnX3Wg8+FF6JYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc49o/Gj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc49o/Gj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFC51F000FF;
	Mon, 28 Sep 2026 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790585637;
	bh=SoMUT2BwfJC5COzbHfnGci4NZdcVm+iQPUkVyhkFY0Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Lc49o/GjqegLQqj0XCZDeVz5FkD9g8IF9bKFYEUjp4Y3OB81Sw7NlOmJpVplTGR6e
	 YFgr6CsScU19Q6DXfkHkm5D3S+C7znPTicVnirUwx2eG02C13dY2Nr8/mj5mxN2ue3
	 BPlIybV2xEW0mqgJEyVuDpmtktYJ6wDfnObzWKEpyEQw+2hNjdkjHcZWO6hiE15GVx
	 b6dj/Qoc0EKruxMHbjx9xilKEBDJWVStMT2koRkSebYcosSpP7WMw0vs8kPjcxRD31
	 Z3rpvKi8lwtcxU3s/2WjY64ryo2hB91DOfvMq6GHoAM/DVawc1gIYfuFhAs+tfCdYM
	 UbcNStzifoHkQ==
Message-ID: <4facb8d8-2ccc-4337-bdbf-3e8c03351b7e@kernel.org>
Date: Mon, 28 Sep 2026 10:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] selftests/mm: add tests for UFFDIO_MOVE of a
 uffd-protected swap entry
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, akpm@linux-foundation.org,
 rppt@kernel.org
Cc: peterx@redhat.com, surenb@google.com, aarcange@redhat.com,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, mhocko@suse.com,
 shuah@kernel.org, kirill@shutemov.name, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
 <20260926124145.2878520-3-donggeunyoo.kernel@gmail.com>
 <4e4223f4-dfec-4e82-97fe-25ae3a3b0f73@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <4e4223f4-dfec-4e82-97fe-25ae3a3b0f73@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 10:53, David Hildenbrand (Arm) wrote:
> On 9/26/26 14:41, Donggeun Yoo wrote:
>> Move a swapped-out page out of a write-protected or RWP-protected area into
>> a destination registered for missing faults only, and read pagemap bit 57
>> at the destination.  The destination was never protected, so the bit must
>> be clear.
>>
>> Assisted-by: LLM
>> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
>> ---
>>  tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
>> index ef9b3956bdcfd..580178630eded 100644
>> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
>> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
>> @@ -2037,6 +2037,75 @@ static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_a
>>  			      uffd_move_pmd_handle_fault);
>>  }
>>  
>> +/*
>> + * Moving a swapped-out page out of a write-protected or RWP-protected area
>> + * must not carry the uffd bit into a destination registered for missing
>> + * faults only: such a bit is never cleared afterwards, so pagemap keeps
>> + * reporting the page as uffd-tracked.
>> + *
>> + * Needs a swap device; skipped if MADV_PAGEOUT cannot evict the page.
>> + */
>> +static void uffd_move_swap_test_common(uffd_global_test_opts_t *gopts,
>> +				       bool rwp)
>> +{
>> +	unsigned long page_size = gopts->page_size;
>> +	struct uffdio_move move = { };
>> +	int pagemap_fd;
>> +
>> +	if (rwp) {
>> +		if (uffd_register_rwp(gopts->uffd, gopts->area_src, page_size))
>> +			err("register src failure");
>> +	} else if (uffd_register(gopts->uffd, gopts->area_src, page_size,
>> +				 false, true, false)) {
>> +		err("register src failure");
>> +	}
> 
> if ()

Clicked sent by accident ... let me reply once more.

-- 
Cheers,

David
