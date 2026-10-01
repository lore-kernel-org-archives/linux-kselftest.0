Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713894BA1D8;
	Thu,  1 Oct 2026 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858584; cv=none; b=BkWuEZGgCaloCyTHnXQxA4+WK/Q9bbHgfOLvooXAVZTCLebtkRjL+kKyAg/9jT0h4einZ06RKIAMx/opTIs7Ony+LCOp5p3u43bmj5UDnt37mZL7CksVBbGn6VXcGHNPNvQveNU9b5UZO11R3Kf48+BX7qDpIPaQSD0d9ayWljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858584; c=relaxed/simple;
	bh=qvewlw/Btz4CWYKXaWo7kc/e0lrDVpSgqkNIen4sfq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv4x7/qc+NEk4L7Y35luz16jue1GVAjK640nF4M41FeYFUMUtLASSYNTgcltt9GJLuizeFjrCk8bhwBusnGROnx3dnc9ZyKZQonfl1T6QIDuRN6fodBXEAqTb6aD7n4WScPjXHIYEy7q88zSGaN79yNhKVY+30VMfWokBIlzkMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qjY3z5xS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qjY3z5xS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67165497;
	Thu,  1 Oct 2026 05:42:58 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C09393F85F;
	Thu,  1 Oct 2026 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790858581; bh=qvewlw/Btz4CWYKXaWo7kc/e0lrDVpSgqkNIen4sfq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qjY3z5xSIVBzLjhjRFSAaxKTdMPP9C3kr+4Wkak6jqEWyQRyjgcztYf3mpofcS3Ru
	 R1clqJGcAJxIcFoQj8TB6EEfEPlDJy3h4j7P70y0kHvoQdyaKq87Vi5Er6Fwxyl4HI
	 Adiung6RyI60Ndt0Ujgzld7AZQBrqwEQOK7NnZSs=
Message-ID: <59c330ba-211f-46d9-902f-59ca5f0f8120@arm.com>
Date: Thu, 1 Oct 2026 18:12:55 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 4/9] selftests/mm: mremap_test: correct multiple
 VMA range size
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
 <20260924050009.19974-5-sarthak.sharma@arm.com>
 <3d13be9d-a4c9-4123-a047-67371fa4586e@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <3d13be9d-a4c9-4123-a047-67371fa4586e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 10/1/26 5:24 PM, David Hildenbrand (Arm) wrote:
> On 9/24/26 07:00, Sarthak Sharma wrote:
>> In the test mremap_move_multiple_vmas(), pages 4
>> to 6 form a single VMA. But the helper function
>> is_multiple_vma_range_ok() checks pages 4 and 5 as
>> one range and treats page 6 separately.
>>
>> Check all three pages as a single range and skip
>> the page 6 iteration to match the actual VMA layout.
>>
>> Fixes: d53f248258e1 ("tools/testing/selftests: extend mremap_test to test multi-VMA mremap")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>  tools/testing/selftests/mm/mremap_test.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
>> index ba9b7f7566d0..869df22d46db 100644
>> --- a/tools/testing/selftests/mm/mremap_test.c
>> +++ b/tools/testing/selftests/mm/mremap_test.c
>> @@ -373,7 +373,10 @@ static bool is_multiple_vma_range_ok(unsigned int pattern_seed,
>>  	for (i = 0; i <= 10; i += 2) {
>>  		int j;
>>  		char *buf = &ptr[i * page_size];
>> -		size_t size = i == 4 ? 2 * page_size : page_size;
>> +		size_t size = i == 4 ? 3 * page_size : page_size;
>> +
>> +		if (i == 6)
>> +			continue;
>>  
>>  		for (j = 0; j < size; j++) {
>>  			char chr = rand();
> 
> What is the impact of this that it warrants a Fixes? Will the test fail?

I read through this again, and realized it is just populating and
validating parts of one VMA in two iterations, which is not wrong, just
a bit odd since others VMAs were being validated in one go. I think I'd
gotten confused with the layout and pictured something else :).

So you're right, this doesn't require a Fixes tag. Infact I think I'll
drop this patch altogether since it is validating stuff correctly.

