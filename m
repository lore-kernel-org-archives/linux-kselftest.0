Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4502FE056;
	Sat, 25 Jul 2026 09:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971537; cv=none; b=O5TrMsPAY5IU4iP1MQBa3mhed2/BLL0Y8F5c8rJTTkhC3cB3cgrZLZ+KnQkKho68YOkq7PQaWstSen6xJTN4y8mjPoDX4hPHLAvdmzRmqnKnvYGEschDTVegez42Pjm8ZlkWbkc8WQ+Jl6bXHYhdDsRJT1bOYqWpIX3UYFgK95M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971537; c=relaxed/simple;
	bh=JI2q/jrov0bUlRrc1A9ykQM6Jx3rFwik0ZalTA/bQbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OTsEM1ugiiSbjGHHoUlGdM9lEFVhSB3Y3ZXoc+JKDKhLf42UfkjMEuhQnj78RREzX78ICX6MHWbt9e1w/0WBo/0o9WtacU+SbJJTpyyWtDpAugXQ4KjVjDRgPiqmzSk2eyLok20GxnAYtqiFg7M58Pa078XoU2uVmGsYMfgcwyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=S5W6HYsY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="S5W6HYsY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72EBB1476;
	Sat, 25 Jul 2026 02:25:28 -0700 (PDT)
Received: from [10.164.11.99] (unknown [10.164.11.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D0703F86F;
	Sat, 25 Jul 2026 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784971532; bh=JI2q/jrov0bUlRrc1A9ykQM6Jx3rFwik0ZalTA/bQbY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=S5W6HYsYef4wFmguN05enQML7D1YvuffSKrYSEGK/A7OM/kkOZopZyrsXPGhaV+7j
	 FBUIcOARCXfM6tvDX8VKtqn2kLOdS6gjYqHFskrAweR96JQG6+7NypyOssCqy4vPGa
	 OX494Kw7oemwgONK3QcFhubF+sK7FMsLG8PVojMk=
Message-ID: <58b824e7-dafa-4a8b-a8ca-d38151c97df6@arm.com>
Date: Sat, 25 Jul 2026 14:55:23 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] selftests/mm: retry migration failures for the
 full runtime
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 sarthak.sharma@arm.com
References: <20260724102431.1199519-1-usama.anjum@arm.com>
 <20260724102431.1199519-6-usama.anjum@arm.com>
 <15111e85-4143-476a-830e-9f7d47cc236e@arm.com>
 <a3ed6793-8285-4043-a0bb-10bd3890be19@arm.com>
 <6e2236ab-2cfd-4e61-98cc-4e4de9f76bd9@arm.com>
 <1c5b5101-1bf5-436e-a0dd-10b6cf81ff59@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <1c5b5101-1bf5-436e-a0dd-10b6cf81ff59@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/07/26 9:27 pm, Muhammad Usama Anjum wrote:
> On 24/07/2026 4:23 pm, Dev Jain wrote:
>>
>>
>> On 24/07/26 5:23 pm, Muhammad Usama Anjum wrote:
>>> On 24/07/2026 12:46 pm, Dev Jain wrote:
>>>>
>>>>
>>>> On 24/07/26 3:54 pm, Muhammad Usama Anjum wrote:
>>>>> move_pages() is best effort and can temporarily fail when concurrent
>>>>> faults race with page unmapping. A busy shared-anon workload can exhaust
>>>>> the current 100 retries long before the intended 20-second runtime and
>>>>> produce a false failure.
>>>>>
>>>>> Use the full runtime as the retry window. Since the initial page location
>>>>> is unknown, require it to reach both alternating NUMA targets to confirm
>>>>> that cross-node migration made progress despite transient contention.
>>>>>
>>>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>>>> ---
>>>>
>>>> Makes sense, but see below.
>>>>
>>>>
>>>>> Changes since v1:
>>>>> - Retry per-page failures for the full runtime
>>>>> - Verify that both alternating NUMA targets are reached
>>>>> ---
>>>>>  tools/testing/selftests/mm/migration.c | 39 ++++++++++++++------------
>>>>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>>>>
>>>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>>>> index 29f7492453d43..4d55a424058a9 100644
>>>>> --- a/tools/testing/selftests/mm/migration.c
>>>>> +++ b/tools/testing/selftests/mm/migration.c
>>>>> @@ -7,7 +7,7 @@
>>>>>  #include "kselftest_harness.h"
>>>>>  #include "hugepage_settings.h"
>>>>>  
>>>>> -#include <strings.h>
>>>>> +#include <string.h>
>>>>>  #include <pthread.h>
>>>>>  #include <numa.h>
>>>>>  #include <numaif.h>
>>>>> @@ -20,7 +20,6 @@
>>>>>  
>>>>>  #define TWOMEG		(2<<20)
>>>>>  #define RUNTIME		(20)
>>>>> -#define MAX_RETRIES	100
>>>>>  #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>>>>>  
>>>>>  HUGETLB_SETUP_DEFAULT_PAGES(1)
>>>>> @@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>>  	int ret, tmp;
>>>>>  	int status = 0;
>>>>>  	struct timespec ts1, ts2;
>>>>> -	int failures = 0;
>>>>> +	int success = 0;
>>>>>  
>>>>>  	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
>>>>>  		return -1;
>>>>> @@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>>>  		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
>>>>>  			return -1;
>>>>>  
>>>>> -		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
>>>>> -			return 0;
>>>>> +		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
>>>>> +			/* Reaching both targets verifies a cross-node move. */
>>>>> +			if (success >= 2)
>>>>> +				return 0;
>>>>> +			else
>>>>> +				return -2;
>>>>> +		}
>>>>>  
>>>>>  		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
>>>>>  				MPOL_MF_MOVE_ALL);
>>>>> -		if (ret) {
>>>>> -			if (ret > 0) {
>>>>> -				/* Migration is best effort; try again */
>>>>> -				if (++failures < MAX_RETRIES)
>>>>> -					continue;
>>>>> -				printf("Didn't migrate %d pages\n", ret);
>>>>> -			}
>>>>> -			else
>>>>> -				perror("Couldn't migrate pages");
>>>>> -			return -2;
>>>>> +		if (ret < 0) {
>>>>> +			perror("Couldn't migrate pages");
>>>>> +			return ret;
>>>>>  		}
>>>>> -		failures = 0;
>>>>> +		/* Migration is best effort. Try again */
>>>>> +		if (ret > 0 || status < 0)
>>
>> Also what if you migrated accidentally to node 0? In which case you
>> will return a false success below.
> What do you mean by "migrated accidentally to node 0"? Can you give an
> example?

I meant it can happen that ret is 0, status is 0. Then you will pass
"status != n2" and the function will return 0.

So probably just return -2 instead of status?

> 
>>
>>
>>>>
>>>> old code wasn't using status, so why now?
>>> The old code not using it does not mean we cannot use it now. ret gives the
>>
>> I never implied that :) The observation was because I didn't see it mentioned
>> in the commit message, this change is orthogonal to the description.
>>
>>
>>> aggregate result, while status gives the per-page result: the destination
>>> node on success or a negative errno explaining the failure. In particular,
>>> move_pages() can return 0 with a negative status, so checking it prevents a
>>> failed move from being counted as successful.
>>
>> Crazy stuff. So move_pages() can return zero but that return value is not
>> really the return value and you have to check status.
>>
>> The man page reads:
>>
>> "status is an array of integers that return the status of each page.
>> The array contains valid values only if move_pages() did not return
>> an error."
>>
>> But then says
>>
>> "On success move_pages() returns zero.  On error, it returns -1, and sets
>> errno to indicate the  error. If positive value is returned, it is the
>> number of nonmigrated pages."
>>
>> I don't know which one to fix, the manpage or the ABI, I suspect the latter,
>> storing error codes in a variable and then returning zero sounds wrong.
>>
>>>
>>>>
>>>>> +			continue;
>>>>> +		if (status != n2) {
>>>>> +			printf("Page is on node %d instead of target node %d\n",
>>>>> +			       status, n2);
>>>>> +			return status;
>>>>> +		}
>>>>> +		success++;
>>>>>  		tmp = n2;
>>>>>  		n2 = n1;
>>>>>  		n1 = tmp;
>>>>>  	}
>>>>> -
>>>>> -	return 0;
>>
>> There is no return statement after the while loop. I suspect on some compiler
>> config it is gonna complain about this, or someone inevitably will run the
>> selftests with an old compiler and complain about this :)
> The loop cannot fall through, and the minimum supported GCC and Clang versions
> recognize that. No trailing return is needed.

Okay.


> 
>>
>>>>>  }
>>>>>  
>>>>>  void *access_mem(void *ptr)
>>>>
>>>
>>
> 

