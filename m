Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376A32C1595;
	Fri, 24 Jul 2026 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906610; cv=none; b=GWqT/kxdBkwVlR7ntMbzIE00WzgjGKfSyCpSOkZaUdWfHd3iIF2HGVauZp6m//waS01NRVhcLqRjizlluNZb4mLXpuXsN7u6/xSvI6CHOTycXx6WmOeKhg8kX/gABiqtk2gmSZUqIkdzh9VgRq5LRW3kqFDLzB0LIbG78WaSR4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906610; c=relaxed/simple;
	bh=ACYBtNCYaJjl7XR898KkCW2Cma75xOG2iqJwYgbhlfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dSo90x6VEMIYrMucEOvgX+84v2bOVkhSBY42RTv6+RKdg0yKJAbDLtuoeCN4C5i/jhHr6X6E4fxw9SjCqRRoNA8cxHTE6MkK/oq4uzF38vGB2yEj2k6ROOjngB3hiymdBFLlZAd7fRJiaWsrafgI76OS50UVhILYV9Xm7cVJWFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GmurpQz1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GmurpQz1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB051477;
	Fri, 24 Jul 2026 08:23:22 -0700 (PDT)
Received: from [10.163.130.214] (unknown [10.163.130.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46FB73F59E;
	Fri, 24 Jul 2026 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784906606; bh=ACYBtNCYaJjl7XR898KkCW2Cma75xOG2iqJwYgbhlfo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GmurpQz1s9JEDmefvS2dugNTbsf094EOYBEWQZMeKfOi1xhtAwiiXzndmjmIiEI+F
	 /LxDHmlmUL5Of1sL3wq500DyNx7LlytUYoEiiEZrvsorY/GD02osmqMNpGse46kD/x
	 8g13THH5O5UbHBXdsdGlnrzLAYFoOQfrhcrJpYEI=
Message-ID: <6e2236ab-2cfd-4e61-98cc-4e4de9f76bd9@arm.com>
Date: Fri, 24 Jul 2026 20:53:17 +0530
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <a3ed6793-8285-4043-a0bb-10bd3890be19@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/07/26 5:23 pm, Muhammad Usama Anjum wrote:
> On 24/07/2026 12:46 pm, Dev Jain wrote:
>>
>>
>> On 24/07/26 3:54 pm, Muhammad Usama Anjum wrote:
>>> move_pages() is best effort and can temporarily fail when concurrent
>>> faults race with page unmapping. A busy shared-anon workload can exhaust
>>> the current 100 retries long before the intended 20-second runtime and
>>> produce a false failure.
>>>
>>> Use the full runtime as the retry window. Since the initial page location
>>> is unknown, require it to reach both alternating NUMA targets to confirm
>>> that cross-node migration made progress despite transient contention.
>>>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>> ---
>>
>> Makes sense, but see below.
>>
>>
>>> Changes since v1:
>>> - Retry per-page failures for the full runtime
>>> - Verify that both alternating NUMA targets are reached
>>> ---
>>>  tools/testing/selftests/mm/migration.c | 39 ++++++++++++++------------
>>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
>>> index 29f7492453d43..4d55a424058a9 100644
>>> --- a/tools/testing/selftests/mm/migration.c
>>> +++ b/tools/testing/selftests/mm/migration.c
>>> @@ -7,7 +7,7 @@
>>>  #include "kselftest_harness.h"
>>>  #include "hugepage_settings.h"
>>>  
>>> -#include <strings.h>
>>> +#include <string.h>
>>>  #include <pthread.h>
>>>  #include <numa.h>
>>>  #include <numaif.h>
>>> @@ -20,7 +20,6 @@
>>>  
>>>  #define TWOMEG		(2<<20)
>>>  #define RUNTIME		(20)
>>> -#define MAX_RETRIES	100
>>>  #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>>>  
>>>  HUGETLB_SETUP_DEFAULT_PAGES(1)
>>> @@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>  	int ret, tmp;
>>>  	int status = 0;
>>>  	struct timespec ts1, ts2;
>>> -	int failures = 0;
>>> +	int success = 0;
>>>  
>>>  	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
>>>  		return -1;
>>> @@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
>>>  		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
>>>  			return -1;
>>>  
>>> -		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
>>> -			return 0;
>>> +		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
>>> +			/* Reaching both targets verifies a cross-node move. */
>>> +			if (success >= 2)
>>> +				return 0;
>>> +			else
>>> +				return -2;
>>> +		}
>>>  
>>>  		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
>>>  				MPOL_MF_MOVE_ALL);
>>> -		if (ret) {
>>> -			if (ret > 0) {
>>> -				/* Migration is best effort; try again */
>>> -				if (++failures < MAX_RETRIES)
>>> -					continue;
>>> -				printf("Didn't migrate %d pages\n", ret);
>>> -			}
>>> -			else
>>> -				perror("Couldn't migrate pages");
>>> -			return -2;
>>> +		if (ret < 0) {
>>> +			perror("Couldn't migrate pages");
>>> +			return ret;
>>>  		}
>>> -		failures = 0;
>>> +		/* Migration is best effort. Try again */
>>> +		if (ret > 0 || status < 0)

Also what if you migrated accidentally to node 0? In which case you
will return a false success below.


>>
>> old code wasn't using status, so why now?
> The old code not using it does not mean we cannot use it now. ret gives the

I never implied that :) The observation was because I didn't see it mentioned
in the commit message, this change is orthogonal to the description.


> aggregate result, while status gives the per-page result: the destination
> node on success or a negative errno explaining the failure. In particular,
> move_pages() can return 0 with a negative status, so checking it prevents a
> failed move from being counted as successful.

Crazy stuff. So move_pages() can return zero but that return value is not
really the return value and you have to check status.

The man page reads:

"status is an array of integers that return the status of each page.
The array contains valid values only if move_pages() did not return
an error."

But then says

"On success move_pages() returns zero.  On error, it returns -1, and sets
errno to indicate the  error. If positive value is returned, it is the
number of nonmigrated pages."

I don't know which one to fix, the manpage or the ABI, I suspect the latter,
storing error codes in a variable and then returning zero sounds wrong.

> 
>>
>>> +			continue;
>>> +		if (status != n2) {
>>> +			printf("Page is on node %d instead of target node %d\n",
>>> +			       status, n2);
>>> +			return status;
>>> +		}
>>> +		success++;
>>>  		tmp = n2;
>>>  		n2 = n1;
>>>  		n1 = tmp;
>>>  	}
>>> -
>>> -	return 0;

There is no return statement after the while loop. I suspect on some compiler
config it is gonna complain about this, or someone inevitably will run the
selftests with an old compiler and complain about this :)

>>>  }
>>>  
>>>  void *access_mem(void *ptr)
>>
> 

