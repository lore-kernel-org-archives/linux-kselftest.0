Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFE739DBC0;
	Wed,  7 Oct 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374516; cv=none; b=RaoBK+WxL2pQXTif7/c0aKrfa/wzoWiVui5P48wtPve42qNnzQ3WGONySMb2wdNiS21paVZhh7XixXRBDolb4RLNcFE/HDobyrXII2Uho44DxWLjvFuBiQnGw4Hjt0gSC3IdOZTG6LWqvy8+zK6Ep2Vx5Ko2/maXOo4hAL94lk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374516; c=relaxed/simple;
	bh=fVxFt1CGQ1LaSt6H7lvlcV39UU1RhYn2V+45OkcADVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a++8Sx1Io02I7rCQCV1yC8ZGAuHgrS7/Yhurz1FWEf4ZOgte9dIet33R2eSM1bS+nEhpVha+KdEmRfvF4aawYLjjtaskF7ALaGWC7glbLGLInDYzSafnV8wgsLCGfWDkV77bcDDHGpnSvGbue8woY8FPGqc5yleKZ0qVP6tRvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cgwT5fiD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cgwT5fiD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B101595;
	Wed,  7 Oct 2026 05:01:43 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952693F66F;
	Wed,  7 Oct 2026 05:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791374506; bh=fVxFt1CGQ1LaSt6H7lvlcV39UU1RhYn2V+45OkcADVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgwT5fiDtyBCDxHzWCj4UX9zGaiMM1gi91eR1mllNLBjhmR2s/oVWsdfy7y6PGhlm
	 +WIqKf29N21gX6bsO7zAVDkHvXIK5eV1oNBTmQym+jNyEegbUsJGLcQQmWpMxbeVVX
	 3lWMblvRXoIBqaMUpp2zJYC0D7Zdi+FNWMgon3pU=
Message-ID: <ce49e816-ae77-4c64-bd28-168d8ca52d8d@arm.com>
Date: Wed, 7 Oct 2026 17:31:39 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/mm: hugetlb_madv_vs_map: fix TAP plan
 mismatches
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guillaume Morin <guillaume@morinfr.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007092801.35649-1-jaeyeon.lee.dev@gmail.com>
 <022ec915-62ab-40d9-8705-90692e75acfb@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <022ec915-62ab-40d9-8705-90692e75acfb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/7/26 3:46 PM, David Hildenbrand (Arm) wrote:
> On 10/7/26 11:28, Jaeyeon Lee wrote:
>> The plan was raised from 1 to 3, but the HugeTLB setup check that may
>> call ksft_exit_skip() still runs after ksft_set_plan(), so a setup
>> failure reports one result against a plan of 3. Move ksft_set_plan()
>> below the setup check.
>>
>> Also, when the underflow check fails, or munmap() fails,
>> test_underflow() jumps to err_cleanup and exits without reporting the
>> remaining results. Report the munmap() failure as a test result and
>> skip the final HugePages_Rsvd check in err_cleanup, so these failure
>> paths report all 3 planned results.
>>
>> Fixes: 827149aad495 ("selftests/mm: hugetlb_madv_vs_map: add underflow test")
>> Assisted-by: LLM
>> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
>> ---
>> Changes in v2:
>> - Drop the duplicate ksft_perror() and report errno in
>>   ksft_test_result_fail() (Sarthak Sharma).
>>
>>  tools/testing/selftests/mm/hugetlb_madv_vs_map.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
>> index 1d111f42dd59..0f6afb834dbf 100644
>> --- a/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
>> +++ b/tools/testing/selftests/mm/hugetlb_madv_vs_map.c
>> @@ -168,7 +168,7 @@ void test_underflow(void)
>>  
>>  	/* First unmap, this will close the vma */
>>  	if (munmap(huge_ptr, mmap_size) != 0) {
>> -		ksft_perror("munmap failed");
>> +		ksft_test_result_fail("munmap failed: %s (%d)\n", strerror(errno), errno);
>>  		goto err_cleanup;
>>  	}
>>  
>> @@ -203,18 +203,20 @@ void test_underflow(void)
>>  	if (waitpid(pid, NULL, 0) <= 0)
>>  		ksft_exit_fail_perror("waitpid failed");
>>  
>> +	ksft_test_result_skip("HugePages_Rsvd check after child exit\n");
>>  	ksft_exit_fail();
> 
> That looks odd. SKIP + fail on the same path?

Seemed odd to me too when I read it. But it seems like one function
contains 2 tests:

i) Check resv_hugepages when parent unmaps the VMA and child is holding
the hugetlb page

ii) Check resv_hugepages when child exits

So we're skipping the third test if the munmap fails or the second test
fails. Skipping incase of munmap failure makes sense but I'm not sure
about the case when the second test fails, ig this could still run in
that case.

Anyways, the original code also calls a ksft_exit_fail() in err_cleanup,
so this skip is just preserving the TAP test count, else we'll get that
planned tests != run tests message.
