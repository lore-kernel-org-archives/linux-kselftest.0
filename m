Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76B7FC0A;
	Thu, 11 Jun 2026 00:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781138840; cv=none; b=FrkzY/5iAK4bu+aUpIAA791x3gn3ioT5caXx7m9nB7sNkZ3sRPOQRx3Mb11f17u7mfF2DgidUbsDZ2SPex5x2XqtRREFzXWUXqQTwYOgWjQ6nF0O2WdjLfh6PmvJmXyo3WJfsCAhjth4PkmU76Yvs4iRKp/GAd/upZ2ogD8Ze8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781138840; c=relaxed/simple;
	bh=gASKwESFONijbWRfagCvph0IP06u33krEvw4hB1LzRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbQSDUaubZkQuWj1OLl9ECCH/oQYbxw8g/1CT9wj924dDEWDhXbj/asoCPnyt2HkopGwWO9rQUNHihNwbjx1po/fC/5OHvtL3UTdkwMi0a9QfK3nlAbd6pNyH1p3gLo54a/K/ZpRN71b1ie3HmhnLx4VvDJ5dJOt14jRIa+dJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZQW2gplC; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZQW2gplC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781138837; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TWG6oMmx5zN0/AB1q4LhDBi8DHE0zakSdImy7TPdrFM=;
	b=ZQW2gplCgY3ow4VDctc+6HA38G7ksqDyYuo28ZADi4+OdGtDRtU79fGlyryFqN682x6ELLw+ASBp2rf2+k7+m3bE3qGgyauw0cyYAzLLenZ5obDpvl1nbcYpIyjozoANTxHfrXM6Iitw7usqC9hCXRVZZXNWziph9hdZF2/4qaI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4boTcb_1781138834;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4boTcb_1781138834 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 08:47:15 +0800
Message-ID: <00bdc0e2-8ce7-4bda-aca3-c22df55b4979@linux.alibaba.com>
Date: Thu, 11 Jun 2026 08:47:14 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 06/11] mm: khugepaged: allow khugepaged to check
 all shmem mTHP-sized orders
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <b4d0c1a5a49284b1f0afb0810e056f6d88b17d30.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260610113352.25352-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260610113352.25352-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/26 7:33 PM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:14PM +0800, Baolin Wang wrote:
>> We are now ready to enable shmem mTHP collapse, allowing
>> thp_vma_allowable_orders() to check all permissible shmem large orders.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>> mm/khugepaged.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 75b18ec4a6c3..a87918b7e18c 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -578,9 +578,14 @@ static unsigned long collapse_possible_orders(struct vm_area_struct *vma,
>> {
>> 	unsigned long orders;
>>
>> -	/* If khugepaged is scanning an anonymous vma, allow mTHP collapse */
>> +	/*
>> +	 * If khugepaged is scanning an anonymous or shmem vma,
>> +	 * allow mTHP collapse.
>> +	 */
>> 	if ((tva_flags == TVA_KHUGEPAGED) && vma_is_anonymous(vma))
>> 		orders = THP_ORDERS_ALL_ANON;
>> +	else if ((tva_flags == TVA_KHUGEPAGED) && vma_is_shmem(vma))
>> +		orders = THP_ORDERS_ALL_FILE_DEFAULT;
> 
> Hmm... for shmem, is the lower bound in mthp_collapse() expected?
> 
> #define KHUGEPAGED_MIN_MTHP_ORDER	2
> 
> #define THP_ORDERS_ALL_FILE_DEFAULT	\
> 	((BIT(MAX_PAGECACHE_ORDER + 1) - 1) & ~BIT(0))
> 
> KHUGEPAGED_MIN_MTHP_ORDER is 2, which was introduced for anon collapse.
> For shmem, though, we're feeding mthp_collapse() orders from
> THP_ORDERS_ALL_FILE_DEFAULT, and that only filter out order-0 ...
> 
> 		if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
> 			(enabled_orders & GENMASK(order - 1, 0))) {
> 			order--;
> 			continue;
> 		}
> 
> So order-1 never gets a chance. The walker stops at order-2 and never
> tries it, right?

Good suggestion. Originally, Nico used chunks (one chunk representing 
the KHUGEPAGED_MIN_MTHP_ORDER range) to record the bitmap, which was 
inconvenient for shmem to extend to order 1 collapse. Now that the 
bitmap has been extended to MAX_PTRS_PER_PTE, that earlier limitation no 
longer exists. I'll fix this.

Thanks for taking a look.
