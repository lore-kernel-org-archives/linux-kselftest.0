Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C33124DCF6;
	Wed, 15 Apr 2026 08:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242117; cv=none; b=ItJYENLIy8cJyGwhWOYoEQcJCtUqYrgzWbC2NXcMcz/pFvn0pH8UBf2BK5Vehx4Ye61kfTUk/wCtawkudK7JIsFiiiV6JMA89o4XXbpzpXnnR2ff5ksoCpSSVUIXSx/oS57h5iMB2aLKU9gjmPUbcCEgAX2vvyR09WcWZ9oDi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242117; c=relaxed/simple;
	bh=wqq1jxfb037jdTdgNzItw0yzIyAC7MxkmAXbXkvvQVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKJKZi/egOaaKdEUoJtDwvnGFeYohLTx4/G00T6f8iR502yBK0smrLChsjhbINxKZC0mbgGm2eLxgb8xUIO2hfSJ9S6OdME9buWaA4ZROlNr2EYEf76hZtpgz6wKpJHI/hv8c2X6ttZcen0vARKuuCqqjzbiLsp75aSfMviG52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ghv78G0w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ghv78G0w"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0946D4FBA;
	Wed, 15 Apr 2026 01:35:10 -0700 (PDT)
Received: from [10.164.148.46] (MacBook-Pro.blr.arm.com [10.164.148.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D44233F86F;
	Wed, 15 Apr 2026 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776242115; bh=wqq1jxfb037jdTdgNzItw0yzIyAC7MxkmAXbXkvvQVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ghv78G0w0VxXymddvIAQe/GYkOoBW2u+eNE+Z+KEpDpD0TeyUFyfrNwpeGdbDnTBu
	 P96PJ+u86gXFeE2pmbjUPnoZAJV9/JwiSXylZIEjYjyuxFAdsP7Y9BdE6yMi6YT4bV
	 OG+wbMatZn8FPMQ+/fnqx05q8vD6nsBaMpnWKojc=
Message-ID: <57b5d0f9-3e56-4f96-9e3a-2f475a78a8eb@arm.com>
Date: Wed, 15 Apr 2026 14:05:01 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: Simplify byte pattern checking in
 mremap_test
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
 shuah@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, anshuman.khandual@arm.com,
 Sarthak Sharma <sarthak.sharma@arm.com>
References: <20260415044509.579428-1-dev.jain@arm.com>
 <2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/04/26 1:18 pm, David Hildenbrand (Arm) wrote:
> On 4/15/26 06:45, Dev Jain wrote:
>> The original version of mremap_test (7df666253f26: "kselftests: vm: add
>> mremap tests") validated remapped contents byte-by-byte and printed a
>> mismatch index in case the bytes streams didn't match. That was rather
>> inefficient, especially also if the test passed.
>>
>> Later, commit 7033c6cc9620 ("selftests/mm: mremap_test: optimize
>> execution time from minutes to seconds using chunkwise memcmp") used
>> memcmp() on bigger chunks, to fallback to byte-wise scanning to detect
>> the problematic index only if it discovered a problem.
>>
>> However, the implementation is overly complicated (e.g., get_sqrt() is
>> currently not optimal) and we don't really have to report the exact
>> index: whoever debugs the failing test can figure that out.
>>
>> Let's simplify by just comparing both byte streams with memcmp() and not
>> detecting the exact failed index.
>>
>> Reported-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> Tested-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
> 
> I'll note something interesting: before 7033c6cc9620, we would check
> random bytes in the stream. With 7033c6cc9620 we only check the first
> threshold bytes IIUC.

Before 7033c6cc9620, the block of code was:

	/* Verify byte pattern after remapping */
	srand(pattern_seed);
	for (t = 0; t < threshold; t++) {
		char c = (char) rand();

		if (((char *) dest_addr)[t] != c) {
			ksft_print_msg("Data after remap doesn't match at offset %llu\n",
				       t);
			ksft_print_msg("Expected: %#x\t Got: %#x\n", c & 0xff,
					((char *) dest_addr)[t] & 0xff);
			ret = -1;
			goto clean_up_dest;
		}
	}

which is still checking the first threshold bytes only. Note that
pattern_seed remains constant at runtime, so 7033c6cc9620 just replaces
this with a buffer filled with the rand() stream.

> 
> That means, that we are not actually verifying most of the area at all
> anymore?
> 
> 
> The whole test options are extremely questionable:
> 
> $ ./mremap_test --help
> ./mremap_test: invalid option -- '-'
> Usage: ./mremap_test [[-t <threshold_mb>] [-p <pattern_seed>]]
> -t       only validate threshold_mb of the remapped region
>          if 0 is supplied no threshold is used; all tests
>          are run and remapped regions validated fully.
>          The default threshold used is 4MB.
> -p       provide a seed to generate the random pattern for
>          validating the remapped region.
> 
> Nobody will ever set these parameters, really. And tests that test
> different things each time they are run are not particularly helpful.
> 
> We should just remove all that and do something reasonable internally.
> 
> That is
> 
> a) Remove all the perf crap (ehm sorry, "advanced tests that don't
>    belong here and that nobody ever runs") from this functional test

Hmm... perhaps this is useful, we can keep this by default so we can
detect if a bug comes up in PMD/PUD mremap? If the test takes too long
we know we have messed up something there. Although "test taking too
long" is not a nice way to know that there is a bug ...

and test won't even take long perhaps since memcmp on 1G will be fairly
fast. In case we mess up PMD/PUD mremap real bug reports will come sooner
than anyone detecting this from mremap_test.

So I'll remove this.

> 
> b) Remove all options from the test. Nobody ever uses them. They are
>    stupid.

Agreed.

> 
> c) Remove any randomization from the test. There is no need for random
>    patterns, just fill pages with increasing numbers.

Agreed.

> 
> d) Just always verify the whole regions. Without the rand() magic this
>    will probably be just ... fairly fast?

Yeah we are doing a simple memcmp() so it is fine.

I'll implement these changes.

> 

