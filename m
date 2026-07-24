Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A80401A13;
	Fri, 24 Jul 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893624; cv=none; b=Ax8HDr2jJRpjMmhaMQ7IS3qwRDQVBt8KKxmJyAm3bYJrOFhKX7rXECqHjHko2EBwERzoqAKoTc1eBdkVi8cuPX7ZMt+RL3qoxaOUPjtvfv69NAWQxQuBoVccaPwoyD+wuo1zuXYhXCChzB39Jq4schdNRzHBAz1eWR3vTf0WM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893624; c=relaxed/simple;
	bh=pevkwXY6/+oZfqQlj9LQ9x6fIBIFzqxqXzMJxYGU0B8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O0lo91kUXHfQq+6CeQHmuNRASfoNueRtTcrH/z4E1yGeKHQqZGugnA6v7142WdF92m5wL7GIw3dPkjEzwBv4fHL0Rui1R5n3ifK0mnyPQX7sV1uNZvvqssjg/waPZ/Ds1s6mjR34Psc0+zxIzI3AqjELjmAXsrrr11STS7DZhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pvXRp5bk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pvXRp5bk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C1551477;
	Fri, 24 Jul 2026 04:46:50 -0700 (PDT)
Received: from [10.164.19.44] (unknown [10.164.19.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862AC3F59E;
	Fri, 24 Jul 2026 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784893614; bh=pevkwXY6/+oZfqQlj9LQ9x6fIBIFzqxqXzMJxYGU0B8=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pvXRp5bkiBA24zMTHT+OrGNmHWP/oqFZdHIxUWVQ6fY+pYnh22FioXInDtKWDAbyY
	 reOMYS7ciZR5IRc9/9bauW85kJ6+1pAGOkikkethsTyAhzaZ6ktpLQwo9E1o7C5T00
	 qJux4yfg6wZSrsqkhqtuLEtyv9tFLmLISaRZ8FI4=
Message-ID: <15111e85-4143-476a-830e-9f7d47cc236e@arm.com>
Date: Fri, 24 Jul 2026 17:16:45 +0530
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260724102431.1199519-6-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/07/26 3:54 pm, Muhammad Usama Anjum wrote:
> move_pages() is best effort and can temporarily fail when concurrent
> faults race with page unmapping. A busy shared-anon workload can exhaust
> the current 100 retries long before the intended 20-second runtime and
> produce a false failure.
> 
> Use the full runtime as the retry window. Since the initial page location
> is unknown, require it to reach both alternating NUMA targets to confirm
> that cross-node migration made progress despite transient contention.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> ---

Makes sense, but see below.


> Changes since v1:
> - Retry per-page failures for the full runtime
> - Verify that both alternating NUMA targets are reached
> ---
>  tools/testing/selftests/mm/migration.c | 39 ++++++++++++++------------
>  1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/migration.c b/tools/testing/selftests/mm/migration.c
> index 29f7492453d43..4d55a424058a9 100644
> --- a/tools/testing/selftests/mm/migration.c
> +++ b/tools/testing/selftests/mm/migration.c
> @@ -7,7 +7,7 @@
>  #include "kselftest_harness.h"
>  #include "hugepage_settings.h"
>  
> -#include <strings.h>
> +#include <string.h>
>  #include <pthread.h>
>  #include <numa.h>
>  #include <numaif.h>
> @@ -20,7 +20,6 @@
>  
>  #define TWOMEG		(2<<20)
>  #define RUNTIME		(20)
> -#define MAX_RETRIES	100
>  #define ALIGN(x, a)	(((x) + (a - 1)) & (~((a) - 1)))
>  
>  HUGETLB_SETUP_DEFAULT_PAGES(1)
> @@ -110,7 +109,7 @@ int migrate(uint64_t *ptr, int n1, int n2)
>  	int ret, tmp;
>  	int status = 0;
>  	struct timespec ts1, ts2;
> -	int failures = 0;
> +	int success = 0;
>  
>  	if (clock_gettime(CLOCK_MONOTONIC, &ts1))
>  		return -1;
> @@ -119,29 +118,33 @@ int migrate(uint64_t *ptr, int n1, int n2)
>  		if (clock_gettime(CLOCK_MONOTONIC, &ts2))
>  			return -1;
>  
> -		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME)
> -			return 0;
> +		if (ts2.tv_sec - ts1.tv_sec >= RUNTIME) {
> +			/* Reaching both targets verifies a cross-node move. */
> +			if (success >= 2)
> +				return 0;
> +			else
> +				return -2;
> +		}
>  
>  		ret = move_pages(0, 1, (void **) &ptr, &n2, &status,
>  				MPOL_MF_MOVE_ALL);
> -		if (ret) {
> -			if (ret > 0) {
> -				/* Migration is best effort; try again */
> -				if (++failures < MAX_RETRIES)
> -					continue;
> -				printf("Didn't migrate %d pages\n", ret);
> -			}
> -			else
> -				perror("Couldn't migrate pages");
> -			return -2;
> +		if (ret < 0) {
> +			perror("Couldn't migrate pages");
> +			return ret;
>  		}
> -		failures = 0;
> +		/* Migration is best effort. Try again */
> +		if (ret > 0 || status < 0)

old code wasn't using status, so why now?

> +			continue;
> +		if (status != n2) {
> +			printf("Page is on node %d instead of target node %d\n",
> +			       status, n2);
> +			return status;
> +		}
> +		success++;
>  		tmp = n2;
>  		n2 = n1;
>  		n1 = tmp;
>  	}
> -
> -	return 0;
>  }
>  
>  void *access_mem(void *ptr)

