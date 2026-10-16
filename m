Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB80C47FB17;
	Fri, 16 Oct 2026 12:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153086; cv=none; b=uOOkyBc3F7nCcCNzaGhuf45t6mUdhn9X+1ZNp68AGpstmo24CVDvbvASdR+efohXus8D0DcQhMVivjQHjyC5jm0zyUY1Ur6m0vyYDY5KpygZhVkTF6rv5ti8g0YwRpMtXCzEOpqE0S+P8ope7+unpWVI9oRZ+ya4JkJOWZiXXFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153086; c=relaxed/simple;
	bh=Xy8QFx0pIXL4ldv8r+Coyw+l10AZN2VdWJ1iwbxurkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCgSH1NKdFB6TKpLJoykUmYgqVNJxxCRC4Ggf60m/Hx6u9PBZ4nQIFy2ZgslbBYDvULE6PB+kRaTVr0EiigusJYkono/7HIq61r9DfPFziNlshUlVzlegNvlcevSrLprSjbOqAFPXDqTTBG2tvV4mT8Oe3YiiCQ1c5+U2yeWgxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fmqSEu8/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fmqSEu8/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A170414BF;
	Fri, 16 Oct 2026 05:18:00 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 591853F871;
	Fri, 16 Oct 2026 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792153083; bh=Xy8QFx0pIXL4ldv8r+Coyw+l10AZN2VdWJ1iwbxurkY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmqSEu8/7BGE35IAOlnvU9aPOhwvcym+dmE0vNJzMFe17rZUeyZoXiVtNNPcHe4Cv
	 OCVWlMF+ah71unR8czVXVlK2jyc+DjB6p0C1LWHHht63Yze6mlaK4lnMFjCzVf7g19
	 69pFRHHiM6se11dgZ3QLoOuGQZVK7sHvVbZIckJQ=
Message-ID: <73c55ce6-67a5-471d-811c-facf712b2fe9@arm.com>
Date: Fri, 16 Oct 2026 17:47:57 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] selftests/mm: check MADV_COLD and MADV_PAGEOUT range
 handling
To: "Gregory Price (Meta)" <gourry@gourry.net>,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20261014175756.2035176-1-gourry@gourry.net>
 <20261014175756.2035176-4-gourry@gourry.net>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261014175756.2035176-4-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Gregory!

On 10/14/26 11:27 PM, Gregory Price (Meta) wrote:
> madvise(2) accepts a zero-length range, rejects an unaligned start, and
> reports an unmapped gap in the range with ENOMEM while still applying the
> advice to the mapped pages on either side.
> 
> Check each of these for both hints. Around the gap, only MADV_PAGEOUT has
> an effect the test can observe, so only MADV_PAGEOUT is checked for
> paging out both neighbours, after a control page shows that swap works.
> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---

[...]

> +/*
> + * An unmapped gap in the range makes either hint fail with ENOMEM, after
> + * advising the mapped pages on both sides of the gap. Only MADV_PAGEOUT has
> + * an effect on those pages that the test can observe.
> + */
> +TEST_F(madvise, unmapped_gap_fails_after_advising)
> +{
> +	char *mapping, *control;
> +	bool swapped = false;
> +	int retry;
> +
> +	pin_to_current_cpu(_metadata);
> +
> +	/* Make sure MADV_PAGEOUT can swap at all before relying on it. */
> +	control = mmap(NULL, page_size, PROT_READ | PROT_WRITE,
> +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(control, MAP_FAILED);
> +	control[0] = 1;
> +	if (!pageout_until_swapped(_metadata, control, page_size,
> +				   self->pagemap_fd))
> +		SKIP(return, "MADV_PAGEOUT did not swap the page");

This test is checking for both MADV_COLD and MADV_PAGEOUT. So if we skip
here because we couldn't pageout, then we don't test for MADV_COLD
behaviour at all. Do we want it this way, or should the tests for both
of these be separate?

> +
> +	mapping = mmap(NULL, 3 * page_size, PROT_READ | PROT_WRITE,
> +		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(mapping, MAP_FAILED);
> +	mapping[0] = 1;
> +	mapping[2 * page_size] = 1;
> +	ASSERT_EQ(munmap(mapping + page_size, page_size), 0);
> +
> +	ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_COLD), -1);
> +	ASSERT_EQ(errno, ENOMEM);
> +	ASSERT_EQ(mapping[0], 1);
> +	ASSERT_EQ(mapping[2 * page_size], 1);
> +
> +	for (retry = 0; retry < PAGEOUT_RETRIES && !swapped; retry++) {
> +		ASSERT_EQ(madvise(mapping, 3 * page_size, MADV_PAGEOUT), -1);
> +		ASSERT_EQ(errno, ENOMEM);
> +		swapped = pagemap_is_swapped(self->pagemap_fd, mapping) &&
> +			  pagemap_is_swapped(self->pagemap_fd,
> +					     mapping + 2 * page_size);
> +		if (!swapped)
> +			usleep(10000);
> +	}
> +	ASSERT_TRUE(swapped)
> +		TH_LOG("MADV_PAGEOUT did not page out both sides of the gap");
> +	ASSERT_EQ(mapping[0], 1);
> +	ASSERT_EQ(mapping[2 * page_size], 1);
> +
> +	ASSERT_EQ(munmap(mapping, page_size), 0);
> +	ASSERT_EQ(munmap(mapping + 2 * page_size, page_size), 0);
> +	ASSERT_EQ(munmap(control, page_size), 0);
> +}
> +
>  /* Neither hint may fault a swapped page back in. */
>  static void check_skips_swapped_pte(struct __test_metadata *_metadata,
>  				    int pagemap_fd, int advice)

