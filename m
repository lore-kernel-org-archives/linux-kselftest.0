Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0523A1A3B;
	Thu,  6 Aug 2026 01:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785978513; cv=none; b=TmluGR1ys1yt2XN+kZtgfAfjLWMK3fKZBh75ImNgKuEe4brG0ujfEn+nPJYRKwJi6q7edYAK0LtdwK3A5+agv+pxtN0sscci/Ia3TzI4jQTxAi4OeWQi54Sedhgr+r7K4RIJTXKmxZGHt4azzr8gTELizMAIYQgDmkMO0qzx6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785978513; c=relaxed/simple;
	bh=m5xn3YdQpBnMQIrBGuDYirj4Ent2zPcppZ/yCGy/dlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWPowAF4aU735vyiFn0PftHRg24Bo2urZEO6E5W95p+03BYqB1bZrnCEi/elG9D4J0V3lZ34CHPPIj39V79r8a4WwAscHAUh08By00z8COAAMZKVUfIWBKmjOTEEN5B8psCsrv3gk/Dlm7283ChVCWlewApNKpjxeXNHOPPLOus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=TEX7mXTq; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="TEX7mXTq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785978506; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=af4kgtR65RjNTdAtxRPnSe6H2YT74ta8v6zpWeeJOXM=;
	b=TEX7mXTq8k/L4KPfB21ufvvpxwCiPSHAgZuWbjjF9H3UQ1giYeUUXK5ulTveSsg+dYmV55K/OhoPN8VkHo+9MDvweh+3wQ2Ps333moGwGjll5SN0KOnnZjQ0jK7rX2FnWnhc6l4LEeCWRlTfyzjiI9/V+hAAATai+HjEqE6beHg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0X8SKbUo_1785978504;
Received: from 30.74.144.136(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X8SKbUo_1785978504 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 09:08:25 +0800
Message-ID: <6c778b79-5945-4832-bbf6-1a586c1c5647@linux.alibaba.com>
Date: Thu, 6 Aug 2026 09:08:23 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] selftests: mm: implement the mTHP-sized hugepage
 check helpers
To: Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org
Cc: liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
 ryan.roberts@arm.com, baohua@kernel.org, lance.yang@linux.dev,
 usama.arif@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1785564857.git.baolin.wang@linux.alibaba.com>
 <eb75f6d510fb48f14e25fde85e5a5e2b67cef394.1785564857.git.baolin.wang@linux.alibaba.com>
 <DKH4VJXGIUNU.2ZENW7583Q6K5@nvidia.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <DKH4VJXGIUNU.2ZENW7583Q6K5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/5/26 11:59 PM, Zi Yan wrote:
> On Sat Aug 1, 2026 at 2:26 AM EDT, Baolin Wang wrote:
>> Implement mTHP-sized hugepage checking helpers using gather_folio_orders().
>> Also rename the existing PMD-sized huge page check function to
>> __check_pmd_huge() for clarity.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   tools/testing/selftests/mm/vm_util.c | 60 ++++++++++++++++++++++++++--
>>   1 file changed, 56 insertions(+), 4 deletions(-)
>>
>> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
>> index 09e5d5cabe21..1240d783669c 100644
>> --- a/tools/testing/selftests/mm/vm_util.c
>> +++ b/tools/testing/selftests/mm/vm_util.c
>> @@ -15,6 +15,10 @@
>>   #define SMAP_FILE_PATH "/proc/self/smaps"
>>   #define STATUS_FILE_PATH "/proc/self/status"
>>   #define MAX_LINE_LENGTH 500
>> +#define PAGEMAP_PATH "/proc/self/pagemap"
>> +#define KPAGEFLAGS_PATH "/proc/kpageflags"
>> +#define GET_ORDER(nr_pages)    (31 - __builtin_clz(nr_pages))
> 
> This is a fast way of getting log2, but there is no check of the type of
> nr_pages. What prevents one using it on a long variable?
> 
> At least you can convert nr_pages to unsigned int and add a comment.

Good point. Ack.

>> +#define NR_ORDERS 20
> 
> Why 20? mTHP orders can only be in [1, pmd_order - 1] and different arch
> has different pmd_orders. check_large_folios() probably should just cap
> NR_ORDERS at pmd_order.

I followed the NR_ORDERS definition in selftests/mm/hugepage_settings.h, 
and I think this function is not only for mTHP. Other test cases may 
also call it to get the count of large folios beyond PMD order in the 
future.

>>   unsigned int __page_size;
>>   unsigned int __page_shift;
>> @@ -348,7 +352,7 @@ char *__get_smap_entry(void *addr, const char *pattern, char *buf, size_t len)
>>   	return entry;
>>   }
>>   
>> -bool __check_huge(void *addr, char *pattern, int nr_hpages,
>> +static bool __check_pmd_huge(void *addr, char *pattern, int nr_hpages,
>>   		  uint64_t hpage_size)
>>   {
>>   	char buffer[MAX_LINE_LENGTH];
>> @@ -366,19 +370,67 @@ bool __check_huge(void *addr, char *pattern, int nr_hpages,
>>   	return thp == (nr_hpages * (hpage_size >> 10));
>>   }
>>   
>> +static bool check_large_folios(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>> +{
>> +	int order = 0, pagesize = getpagesize();
>> +	int nr_pages = hpage_size / pagesize;
>> +	int pagemap_fd, kpageflags_fd;
>> +	int orders[NR_ORDERS], status;
> 
> NR_ORDERS is a constant, so you can put orders on stack. I think you can
> rename it to MAX_NR_ORDERS, use 20, 

Sure.

and check pmd_order is not bigger
> than MAX_NR_ORDERS.

I don't think we need this. As I mentioned above, I hope this function 
can also be used in the future to get the number of large folios beyond 
PMD order.

>> +	bool ret = false;
>> +
>> +	if (nr_pages > 0)
>> +		order = GET_ORDER(nr_pages);
> 
> This funciton can fail early if nr_pages is 0.

Ack.

>> +
>> +	if (!order || order >= NR_ORDERS)
>> +		ksft_exit_fail_msg("invalid order\n");
> 
> It should check against pmd_order.

Ditto.

> 
>> +
>> +	memset(orders, 0, sizeof(int) * NR_ORDERS);
>> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
>> +	if (pagemap_fd == -1)
>> +		ksft_exit_fail_msg("read pagemap fail\n");
>> +
>> +	kpageflags_fd = open(KPAGEFLAGS_PATH, O_RDONLY);
>> +	if (kpageflags_fd == -1) {
>> +		close(pagemap_fd);
>> +		ksft_exit_fail_msg("read kpageflags fail\n");
>> +	}
>> +
>> +	status = gather_folio_orders(addr, size, pagemap_fd,
>> +			kpageflags_fd, orders, NR_ORDERS);
>> +	if (status)
>> +		goto out;
>> +
>> +	if (orders[order] == nr_hpages)
>> +		ret = true;
>> +
>> +out:
>> +	close(pagemap_fd);
>> +	close(kpageflags_fd);
>> +	return ret;
>> +}
>> +
>>   bool check_huge_anon(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>>   {
>> -	return __check_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>> +	if (hpage_size == read_pmd_pagesize())
> 
> read_pmd_pagesize() can fail and return 0. Either you need a check here
> or add a ksft_exit_fail_msg() in read_pmd_pagesize() to remove the
> burden from all callers.

Ack.

> 
>> +		return __check_pmd_huge(addr, "AnonHugePages: ", nr_hpages, hpage_size);
>> +
>> +	return check_large_folios(addr, size, nr_hpages, hpage_size);
>>   }
>>   
>>   bool check_huge_file(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>>   {
>> -	return __check_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
>> +	if (hpage_size == read_pmd_pagesize())
>> +		return __check_pmd_huge(addr, "FilePmdMapped:", nr_hpages, hpage_size);
>> +
>> +	return check_large_folios(addr, size, nr_hpages, hpage_size);
>>   }
>>   
>>   bool check_huge_shmem(void *addr, unsigned long size, int nr_hpages, uint64_t hpage_size)
>>   {
>> -	return __check_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
>> +	if (hpage_size == read_pmd_pagesize())
>> +		return __check_pmd_huge(addr, "ShmemPmdMapped:", nr_hpages, hpage_size);
>> +
>> +	return check_large_folios(addr, size, nr_hpages, hpage_size);
>>   }
>>   
>>   int64_t allocate_transhuge(void *ptr, int pagemap_fd)
> 
> All read_pmd_pagesize()s above need to be handled.

Sure. Thanks for taking a look.
