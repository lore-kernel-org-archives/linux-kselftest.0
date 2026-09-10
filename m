Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A38639E9CB;
	Thu, 10 Sep 2026 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038891; cv=none; b=e1ACVvOnpxpgJg762Mf1vJVtJXt0X79CiFnVYn96mKujPw+TB+KO6sYdCXXM5Wna1M27p2g6bYVBW5Ao1VW/TwVPjBLL6b4DwgdZYf1GgT4FamPZFMrKqcin53HQT7jqG2YX+xxFaX+m2NubEF3rDNglAx/CDR0FLOt+QCwdTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038891; c=relaxed/simple;
	bh=MPUZTc7DOdi22DYnbebh2fbAV3wdb3xv7q94Ksgo/BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7ndWEarIYp32fREv4ibNWzNVEH90m8dCScBcXNBftUY+3CAFcHmTz+O07LgjLW95umskHy2WD2WZTh05johOulnxhQm1NhXtDIOEWnn7PKWZpjvSxHJhmCAgEevW7i0ml+RSfoqvRRUmmoLm8dLPwWgmha8ee6/pgBpN2jhLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HgBOhe7Z; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HgBOhe7Z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789038885; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=eL738YFl/z7Tr4I2W3yCdK3smYYU50aios13U3epmI0=;
	b=HgBOhe7Z1qK7xysR6gpCYvoviErqtIMETBbRQi3/oYWPzy59r+0X4iykUCnezjm/TTCro12VpOsoPt2gI2Uf3+rtARd11JT7uIh1zr50c7PckUpxdZjsgX7hAdRyQoSoH8eBeUjHC5xXu0bXVPs+wfCmXoi48IcC6ZvmaHrYw4U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XAhWCyU_1789038883;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAhWCyU_1789038883 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 19:14:43 +0800
Message-ID: <65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com>
Date: Thu, 10 Sep 2026 19:14:42 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] selftests/mm: add folio-order check for address
 ranges
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
 <20260908125105.1510704-9-kirill@shutemov.name>
 <feb76c81-db9d-4a36-9a31-0b2b31e3c3fb@linux.alibaba.com>
 <aqKFXlpSELmCtt-z@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqKFXlpSELmCtt-z@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 6:45 PM, Kiryl Shutsemau wrote:
> On Wed, Sep 09, 2026 at 06:01:13PM +0800, Baolin Wang wrote:
>>
>>
>> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> An mTHP collapse test needs to know that a range is backed by folios of the
>>> target order, and that they sit where a collapse would put them.  Nothing
>>> answers that today: is_backed_by_folio() classifies the folio behind a
>>> single page, and check_huge_anon() reads smaps AnonHugePages, which only
>>> accounts PMD mappings.
>>
>> Have you checked check_large_folios() in vm_util.c? It seems to meet your
>> requirements, or am I missing something?
> 
> The changelog is out of date, sorry: since 6dedaf0d46a9 check_huge_anon()
> counts mTHP folios through check_large_folios() rather than reading
> smaps, and it is what check_huge() already uses for mthp_khugepaged.
> 
> It could do this job too, called once per window.
> 
> What is_range_backed_by_order() adds is alignment check: the folio has
> to sit at the window start. And check_large_folios() reopens two fds per
> per call which kinda wasteful.

OK. But can we extend the check_huge_xxx() functions to meet your 
requirements, for example by adding a check_aligned_huge_xxx() that 
wraps the underlying implementation of check_large_folios()?

I still find it confusing that khugepaged.c has two separate sets of 
functions for checking large folios.

Also, Yeoreum has also extended check_large_folios() further[1].

[1] 
https://lore.kernel.org/all/20260907-fix_split-v5-2-822b810458bc@arm.com/

