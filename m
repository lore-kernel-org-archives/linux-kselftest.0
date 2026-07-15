Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8947839184A;
	Wed, 15 Jul 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126865; cv=none; b=TPFX+VW22OzCIr+GxWqikdpv5QeMYpRJbNXpC+O2x/vrPFiVnChdyRji4OwPMKvrkXJ02P3JkjAFE+HijaTtLmpIAJnYObLrYxHM03BaKpl21aW7P7daMnL55L8AkxxaMJkXkP08eYvJZprag2i0BaEp2lCTc0WXv6r+WfeEQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126865; c=relaxed/simple;
	bh=sYF1YoI7FvLDGePfeZYsbqzSb7LSoADtIopg9Qb/5wI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbNbP/Ohr4AIzxSBszDAQHFOfvs0IP6AitSWJpk8IUNnYy1mq24bsHWSSv9TCAwdoF7z1Eg3dgjVeLRbMUmWKqK0f9tngWc9waXbnMMbNum8fAvT4aZk0zo3IMAOciFPHEV5QrMw+QxNCKzv5ftGT8DuZwND5FzGBVnV/Egtq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BTwhcdSj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BTwhcdSj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE13B1477;
	Wed, 15 Jul 2026 07:47:38 -0700 (PDT)
Received: from [10.164.148.50] (unknown [10.164.148.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFBB73F7B4;
	Wed, 15 Jul 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784126862; bh=sYF1YoI7FvLDGePfeZYsbqzSb7LSoADtIopg9Qb/5wI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BTwhcdSjB65pW5SHOUKXDIn6CwPmGiqw566ssT4vahKzI8xJwbNb6xig6HiSW1+dQ
	 o5wK8+bqg42aSRuk55pkj58qGiOn/7Vhi3VkPFYL3xSnNr5Pb2wetOnDmqAhE3ap6b
	 STeNfDfGo2zO7GEMTbb/9t1u07xqpfowK4XoW35k=
Message-ID: <6c474ce7-8f1d-4e85-8587-8a60983cec03@arm.com>
Date: Wed, 15 Jul 2026 20:17:31 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: skip swap tests when swap is
 unavailable
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260715133418.170386-1-jaeyeon.lee.dev@gmail.com>
 <4b6904b5-81f9-4e27-8ac5-5bd7e7174c5d@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4b6904b5-81f9-4e27-8ac5-5bd7e7174c5d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/07/26 7:39 pm, David Hildenbrand (Arm) wrote:
> On 7/15/26 15:34, Jaeyeon Lee wrote:
>> The collapse_swapin_single_pte and collapse_max_ptes_swap tests use
>> MADV_PAGEOUT to swap out pages before verifying khugepaged collapse
>> behavior. On systems without swap configured, MADV_PAGEOUT succeeds
>> but the pages are not actually swapped out, so check_swap() returns
>> false and the tests report a failure.
>>
>> These tests cannot run meaningfully without swap, so a missing swap
>> area is an environment limitation rather than a test failure. Detect
>> the absence of swap via /proc/swaps and skip the affected tests
>> instead of failing them.
>>
>> Signed-off-by: Jaeyeon Lee <jaeyeon.lee.dev@gmail.com>
>> ---
>>  tools/testing/selftests/mm/khugepaged.c | 25 +++++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>> index 10e8dedcb087..f9b4ebe733ce 100644
>> --- a/tools/testing/selftests/mm/khugepaged.c
>> +++ b/tools/testing/selftests/mm/khugepaged.c
>> @@ -100,6 +100,22 @@ static void skip(const char *msg)
>>  	exit_status = KSFT_SKIP;
>>  }
>>  
>> +static bool swap_available(void)
>> +{
>> +	char buf[256];
>> +	bool ret;
>> +	FILE *fp = fopen("/proc/swaps", "r");
>> +
>> +	if (!fp)
>> +		return false;
>> +
>> +	fgets(buf, sizeof(buf), fp);
>> +	ret = !!fgets(buf, sizeof(buf), fp);
>> +
>> +	fclose(fp);
>> +	return ret;
>> +}
>> +
> 
> That doesn't mean that swapout will succeed.
> 
> Take a look at cow.c where we use pagemap_is_swapped() after MADV_PAGEOUT.

That suffers from the reverse problem - in case of a real swap bug, cow.c
will skip the test and anyone running the test won't bother.

I think this patch idea is reasonable, we need a way to say "swap definitely
won't succeed because there is no swap device, so skip" vs "swap failed,
need to dig in!" .

> 

