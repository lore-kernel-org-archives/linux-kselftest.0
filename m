Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E981DF261;
	Mon, 12 Oct 2026 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803336; cv=none; b=O6q1SayTRts7lh4B+4scKzkBJrAzv8cz1WThYdZcO1ugxxdrr35z/0LnCP8ubHfqSu51tul547Sp54CScURY5YzD6a49p2f7WBxQ/TfRVQv9PtydMcXfge0rG8An5j9Jh+Of3hzCa3Je9ufTG6UN4l8uaftxB3KFP0ciqsqwJ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803336; c=relaxed/simple;
	bh=1Hcxmhs7YzpUmvxySV5KGDi41fGrFGMMIIK6BavKtUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=keJACp3NJtkAX+89wVlMfExhAR9TxSxXL2hA/qgrpA+cv00W8AUk8nOJ/wND9kVNdegqxIjYYy9DwEyh/qlr4QgCkXpWPMFF3M7rc6+1sz7sn1sS4c9pu/fBYMxv7IUuTlWqlWfUYLCSBKCjn3x5mY2BNyrRWoFsW3Tal0yPqPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qcB4a4H/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qcB4a4H/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5510E1655;
	Mon, 12 Oct 2026 04:08:50 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4EB93F882;
	Mon, 12 Oct 2026 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791803333; bh=1Hcxmhs7YzpUmvxySV5KGDi41fGrFGMMIIK6BavKtUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qcB4a4H/e3/zyLeuwjBKRzIOz4KxK8O9Pd/mFnszBix80X4+DM9h5gXTQz46PIE2D
	 651GcNke9l8jveaCHusuOFxFKeF58ksUFNEKrLgjZwKzSEFzYqvOyW4gNDMCICpMjF
	 4EDe/ST+m/BnWzEW7xfx0XwwZ7y4TdR597OBef9M=
Message-ID: <68905ee7-83b1-4d5f-a1e6-8ddd2ae291d1@arm.com>
Date: Mon, 12 Oct 2026 16:38:47 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] selftests/mm: improve mremap_test
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org,
 vbabka@suse.com, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 shuah@kernel.org, jhubbard@nvidia.com, kaleshsingh@google.com,
 anshuman.khandual@arm.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
 <3a0673a6-744b-45a1-80fd-737a366fafc4@arm.com> <asyxQbp8EfVE9yQs@gremlin>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <asyxQbp8EfVE9yQs@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lorenzo!

On 10/12/26 3:43 PM, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 12, 2026 at 10:20:45AM +0530, Sarthak Sharma wrote:
>> On 10/6/26 2:54 PM, Sarthak Sharma wrote:
>>> This series fixes correctness issues in mremap_test, simplifies its
>>> test infrastructure and strengthens validation of remapped mappings.
>>>
>>> Patches 1-3 remove unused command line handling, unnecessary cleanup
>>> checks and redundant errno handling. Patch 4 converts the test to use
>>> kselftest helpers and removes manual failure tracking.
>>>
>>> Patches 5-8 fix handling of unavailable userfaultfd support, unexpected
>>> mremap() successes, data-corruption failures and cleanup after mmap()
>>> failures. Patch 9 removes perf tests and timing infrastructure.
>>>
>>> Patches 10 and 11 replace threshold-based random-data validation with
>>> sampled validation and a deterministic data pattern. Patch 12
>>> strengthens multi VMA validation by also checking the mapping state
>>> of holes after remapping.
>>
>> [...]
>>
>>> ---
>>> Sarthak Sharma (12):
>>>   selftests/mm: mremap_test: remove command line options
>>>   selftests/mm: mremap_test: drop munmap() checks from cleanup paths
>>>   selftests/mm: mremap_test: simplify errno handling
>>>   selftests/mm: mremap_test: use kselftest helpers
>>>   selftests/mm: mremap_test: skip test when userfaultfd is unavailable
>>>   selftests/mm: mremap_test: fail unexpected mremap successes
>>>   selftests/mm: mremap_test: fail on data corruption
>>>   selftests/mm: mremap_test: handle cleanup after mmap failures
>>>   selftests/mm: mremap_test: remove perf tests and timing
>>>   selftests/mm: mremap_test: replace validation threshold with sampled
>>>     checks
>>>   selftests/mm: mremap_test: replace random data with deterministic
>>>     pattern
>>>   selftests/mm: mremap_test: strengthen multi VMA validation
>>>
>>>  tools/testing/selftests/mm/mremap_test.c | 701 ++++++++++-------------
>>>  1 file changed, 291 insertions(+), 410 deletions(-)
>>>
>>
>> I wanted to address the concern Sashiko has over this patch series [1].
>> It says that mremap(..., MAP_FIXED) over a range containing multiple
>> VMAs should unmap the whole range first and then map the VMAs.
> 
> I don't think you need to spend time worrying about sashiko stuff about
> mremap() behaviour in a test series :)

:)

> 
>>
>> But this is not the case, as was discussed on the list earlier as well.
>> We iterate over the VMAs in the range and only unmap and then map the
>> region that the VMAs occupy. IOW, as quoted by Lorenzo [2], "the
>> sematics are such that gaps are not propagated (i.e. it is as if you
>> mremap()'d each individually)". So if we remap over an existing mapping,
>> the mapping region on which a hole is remapped should not be affected at
>> all. So this is a false positive.
> 
> I will be removing the gaps stuff in any case (as discussed elsewhere
> too).
> 
> It's problematic, more so for the fact stuff can get mapped in gaps before
> the mremap() operation.

Yup, makes sense.

> 
>>
>> While here, requesting for some feedback on this series, if anyone has
>> had a chance to look at it :).
> 
> Thanks for the series, this cycle has been very busy so I think this is one
> for the next cycle (i.e. targeting 7.5).
> 
> So I'd recommend resending at 7.4-rc1?

Sure, I'll resend around that time.

> 
>>
>> [1]
>> https://sashiko.dev/#/patchset/20261006092511.145776-1-sarthak.sharma%40arm.com
>>
>> [2] https://lore.kernel.org/linux-mm/agH1ZSdX_7QF8P_I@lucifer/
>>
> 
> --
> Cheers, Lorenzo

