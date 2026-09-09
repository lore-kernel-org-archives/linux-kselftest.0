Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C548F029;
	Wed,  9 Sep 2026 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949048; cv=none; b=FL5GbaL17ZubhdYWr2O+NktTF49Y6O9LGFdFb9LliOmjQ9JaJWN9+cIe4hHcczpSlc4nulvIEXuJD4Osxa4x+qL8vuNCJdqWxF54AsKjJDDC9f2kNRa8KFxF35aKGT6JXtncEJioVfJso0lOLXUPARHYznM9jMxGQvtk4B7YPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949048; c=relaxed/simple;
	bh=ZXEHs3bcvxA2rJCNVFnXY898g3CXc7EexLdlDB4De+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEGrh6mRbToXIDaG9dORKM9BqaaELnx/Q0RWKJokGxnoC9SCNAemU8Z7tONJrYgREvFJcn/m+4Un7E+l3Hf7XFIQh96ZDvLUM6qEZYbwnChU4sH20Zdb+TqCIBHXuN7pX5Fyugk/3RMDHfjudpBxETSIZEYxWdYtATv1a00g47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Sg63QYlt; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Sg63QYlt"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788949035; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=K9TQ0wBr48lwedZK/j5nLOqNZEnam2jeudD0oRNqYxI=;
	b=Sg63QYltxzIOtFHi6ENXwoYV/zNWz8pnxcIHdLneb7DKI6CP1LEEhQ9LDh5lMmUIKnyxNIv3V6tkcOKfa87rnk+jlBCioOymR0ovjpAvEwLNI5chT6/F14J05AYC1hCW/tKY3Kq9he3eAYpxUj2hUe2N37iLu9KE2yzwfrNj6LE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R241e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XAefvwB_1788949032;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAefvwB_1788949032 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 18:17:13 +0800
Message-ID: <7a2b0427-674b-4a7c-9727-8b078bce0afc@linux.alibaba.com>
Date: Wed, 9 Sep 2026 18:17:12 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/19] selftests/mm: scale khugepaged's collapse wait
 with the PMD size
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 rppt@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-4-kirill@shutemov.name>
 <6ac7ea7d-38ae-45eb-8d98-f626951a43cd@linux.alibaba.com>
 <aqEvyYMGaPiyW_Tt@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqEvyYMGaPiyW_Tt@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/9/26 6:09 PM, Kiryl Shutsemau wrote:
> On Wed, Sep 09, 2026 at 03:59:37PM +0800, Baolin Wang wrote:
>>
>>
>> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> wait_for_scan() gives every case the same three seconds, whatever the huge
>>> page costs to build.  collapse_full() asks for four of them: 8M at a 2M
>>> PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.  Three seconds is
>>> thin at that size, and the case has reported a failure for a collapse that
>>> was still going.
>>>
>>> The timeout is a ceiling on a poll loop, not a sleep: the loop stops as
>>> soon as ops->check_huge() sees the collapse, or as soon as full_scans has
>>> advanced by two.  Raising it costs a passing case nothing.  Across 80 runs
>>> of collapse_full() on arm64 with 64K pages the wait was half a second in
>>> 73 of them, with a tail to two seconds.
>>>
>>> Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
>>> PMD is unchanged, so x86-64 is too; a 512M PMD gets 19 seconds.
>>>
>>> On arm64 with 64K pages a passing ./khugepaged all:anon takes 49 seconds
>>> under TCG before and after this change.
>>>
>>> Assisted-by: LLM
>>> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>>> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>>> ---
>>>    tools/testing/selftests/mm/khugepaged.c | 7 +++++--
>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>>> index 1ca7c6978571..48e0040d53b4 100644
>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>> @@ -556,8 +556,11 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>>>    		int nr_hpages, int collap_order, struct mem_ops *ops)
>>>    {
>>>    	unsigned long hpage_size = page_size << collap_order;
>>> -	int full_scans;
>>> -	int timeout = 6; /* 3 seconds */
>>> +	unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
>>
>> We already pass in the 'len' parameter, and its size is also 'nr_hpages *
>> hpage_size", so you can drop the 'bytes' variable. With that,
> 
> They are the same for the PMD contexts, but not for mthp_khugepaged:
> mthp_khugepaged_collapse() passes len = hpage_pmd_size, the range scanned,
> while nr_hpages is the number of folios asked for.  collapse_single_mthp()
> asks for one order-N folio in a whole PMD.
> 
> That matters on arm64 with 64K pages, where the PMD is 512M: with len the
> single-mTHP case would wait up to 7 seconds for one folio, with
> nr_hpages * hpage_size it gets the 3 second floor.  The budget should
> follow what gets built, not what gets scanned, so I would keep it.

OK. Got it. Thanks.

> Does the Reviewed-by stand with that?

Yes. Please keep my reviewed tag.
