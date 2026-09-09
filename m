Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B412F549F;
	Wed,  9 Sep 2026 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940792; cv=none; b=t0cF+LzoBws/F6k9zP1Il0BvhHVxDRf7QiNYhT2X9ZlJuUNwB46TyhlvAWxkJuT6UNBenxAsBhh1AGk5JHMfqaqjB4mG0/XFWc2I8ouzF/jDbsdFYacAq8VJXepjmgq+EUIehcfP/Z4TUhCrENw3PeEOtQmkRUaJqMSTyzUmiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940792; c=relaxed/simple;
	bh=nuGhbYkxLTwlOvS/OrFZtqZPXUAT7AEhQOOL53Txie0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jqpE98MjClhDvEDn2cNedJUCaZ4qdhV1xAaZREKx8IQ8MbybgjHcSYPAe3gkef59Se43by3+krS55uemqzZDHm/SPe0KndVlLChv38/SLNYuxrWvVIhKFHRWGFva28LXuLgzLAm56dQkSBYUSq7m2a65xsi+A/lV7r7R1pWDCJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=MxXiNHnL; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="MxXiNHnL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788940780; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6iMogKsJpJLzu7jIG3AYM1I4VcnaUwvvNkpOH+pgRCQ=;
	b=MxXiNHnLW1w9oMpT+yHcl+4tmkqANJXAD2biJo/Of/POsvkAc7WdL9rMp9ngukhX6a6qaOVSeSwgpvG7XwxmdN8PrMoukQtcMjreicXsmvuU1dYAuS/xYIUIW2quhzT/+ABFyFOOxvIXyIYsdUhm0ct5YQWcmTUDeBkt36M/wJI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeEKQO_1788940777;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeEKQO_1788940777 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 15:59:38 +0800
Message-ID: <6ac7ea7d-38ae-45eb-8d98-f626951a43cd@linux.alibaba.com>
Date: Wed, 9 Sep 2026 15:59:37 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/19] selftests/mm: scale khugepaged's collapse wait
 with the PMD size
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-4-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-4-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> wait_for_scan() gives every case the same three seconds, whatever the huge
> page costs to build.  collapse_full() asks for four of them: 8M at a 2M
> PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.  Three seconds is
> thin at that size, and the case has reported a failure for a collapse that
> was still going.
> 
> The timeout is a ceiling on a poll loop, not a sleep: the loop stops as
> soon as ops->check_huge() sees the collapse, or as soon as full_scans has
> advanced by two.  Raising it costs a passing case nothing.  Across 80 runs
> of collapse_full() on arm64 with 64K pages the wait was half a second in
> 73 of them, with a tail to two seconds.
> 
> Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
> PMD is unchanged, so x86-64 is too; a 512M PMD gets 19 seconds.
> 
> On arm64 with 64K pages a passing ./khugepaged all:anon takes 49 seconds
> under TCG before and after this change.
> 
> Assisted-by: LLM
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   tools/testing/selftests/mm/khugepaged.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 1ca7c6978571..48e0040d53b4 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -556,8 +556,11 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>   		int nr_hpages, int collap_order, struct mem_ops *ops)
>   {
>   	unsigned long hpage_size = page_size << collap_order;
> -	int full_scans;
> -	int timeout = 6; /* 3 seconds */
> +	unsigned long bytes = (unsigned long)nr_hpages * hpage_size;

We already pass in the 'len' parameter, and its size is also 'nr_hpages 
* hpage_size", so you can drop the 'bytes' variable. With that,

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> +	int timeout, full_scans;
> +
> +	/* Half-second ticks: three seconds floor, plus a second per 128M */
> +	timeout = 6 + 2 * (bytes / (128UL << 20));
>   
>   	/* Sanity check */
>   	if (!ops->check_huge(p, len, 0, hpage_size))

