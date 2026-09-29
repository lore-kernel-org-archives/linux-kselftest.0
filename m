Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DA14E8E06;
	Tue, 29 Sep 2026 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673488; cv=none; b=RqnGRbufC0Fp5iVlmVnkET2nbvNB+qJCwLxXvDrkScwipJl84CJdxDc+tX7prY5nAvyi6IdHAsrJ9Awq0OIs8OscYqibBv9LEHtSiFWM2fEu4TGkccOAnRa7h5NJ1EuZdv0LuL7TXMYQEUbWSotHyGV+V/ONXDqo5rvwuH8f3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673488; c=relaxed/simple;
	bh=nOSEEl79eSk48PAKP3/2NBE1Ft2bwBsVgVFfWHWUJic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy7FHsi6kpYOF8ZxVjkPZyPRCO7AA+vv72EvJJ6l1U4sa1O3xfNF4d2/S9bA73dZ5M30AaLo0B7iY66c99bd5lkYWxJ7CZaPcC7B2BdzWzgbWWdwMAzK7O5feK0vDtI3GSq64hnPauOH1pItiCoiIKNvrrOtBJyqhLShO1jViWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q8KFZd3B; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q8KFZd3B"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC601516;
	Tue, 29 Sep 2026 02:17:52 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60D093F85F;
	Tue, 29 Sep 2026 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790673475; bh=nOSEEl79eSk48PAKP3/2NBE1Ft2bwBsVgVFfWHWUJic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q8KFZd3BBRBMJlgeMlWCKTfZDXQpc/UYxzhqcGtJ3aV/FDT5ME+QXAg3YCkZlL6Rq
	 AUMJUmTWDbftCUh2+hDIII0FpkYzmhCqwziZkSilBbPkuW4/3qguitLTadWAhQdEYx
	 Y3ll8F4B24bnf4hQfC8CHD0dtxvi5f0VmKw/xEmo=
Message-ID: <62fc6a5b-2eaf-462b-af90-ecdc52673f4a@arm.com>
Date: Tue, 29 Sep 2026 14:47:48 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/9] selftests/mm: mremap_test: skip test when
 userfaultfd is unavailable
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
 <20260924050009.19974-3-sarthak.sharma@arm.com>
 <49b0b8c5-4605-41af-9a83-26ec6a07bb96@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <49b0b8c5-4605-41af-9a83-26ec6a07bb96@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 9/29/26 1:30 PM, David Hildenbrand (Arm) wrote:
> On 9/24/26 07:00, Sarthak Sharma wrote:
>> The userfaultfd syscall can return ENOSYS even when __NR_userfaultfd is
>> defined by the architecture headers, for example when the kernel is
>> built without CONFIG_USERFAULTFD. The test currently skips for EPERM
>> when the caller lacks permission to use userfaultfd but treats
>> ENOSYS as a failure.
>>
>> Handle ENOSYS like EPERM and skip the mremap_move_multi_invalid_vmas()
>> test when userfaultfd syscall is not implemented.
>>
>> Fixes: 742d3663a577 ("selftests/mm: add test for invalid multi VMA operations")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>>  tools/testing/selftests/mm/mremap_test.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
>> index 5532d3151ed0..a5813a5e8f5b 100644
>> --- a/tools/testing/selftests/mm/mremap_test.c
>> +++ b/tools/testing/selftests/mm/mremap_test.c
>> @@ -721,7 +721,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
>>  	if (uffd == -1) {
>>  		err = errno;
>>  		ksft_perror("userfaultfd");
> 
> Should we rather move that below the if? Doesn't quite make sense to print the
> error if we are skipping and printing a proper message.

Yes, I'll put it below the if block.

> 
> Maybe that should go into the previous patch?

Yes, will include in the ksft conversion patch.

> 
>> -		if (err == EPERM) {
>> +		if (err == EPERM || err == ENOSYS) {
>>  			ksft_test_result_skip("%s - missing uffd\n", test_name);
>>  			return;
>>  		}
> 
> Apart from that LGTM.
> 
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

