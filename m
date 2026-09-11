Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89539FCAE;
	Fri, 11 Sep 2026 02:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095011; cv=none; b=oxQXBbStXMqsx4xy2vkgFzS9Ji47abOaQ/C1w1PBk4z9yQVF33QpkOPHQ6y3C5nALf1eF5rEss5z9dMfVF2BPqoBMalqvki8onBMPIEnubH753XTxyP/zEv5gJw8LjC0umM/0AJMT5B73TQkYuPd1AqF4B2L5idYACyOs8ZPECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095011; c=relaxed/simple;
	bh=wCaPxS/hIt13v/BlRL85KzydtkVELLxvezhjNy6rMuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHvDgjhCL4iHgj4UtkVBsjRcPgzsMpjiaxMsnSChjohZNsfVrGNbP3B4Dy64yIj5OPHYNyD5cT6icEIO1IGf+Piq5/ohzz2/paDFm+bZHcwNk2+TERuWhyg9tGRI94VfD3PdDWaSYlaft+lEJQUUdpfmx7LyfSp8y+AIxE5ldnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=OYaoPJtf; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="OYaoPJtf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789095004; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/qoPgN105gt2P4UL8cGJgEPkDgefVho21FsHOdfrr3Q=;
	b=OYaoPJtf5rOfFDkfjgDt/nanPwQiaZdKxU1FTNt6Q8dHESj4SjsySxTdy0bHaA+w6Cqw8pwOFNBr84yEqoanx2xgFaYUAjvgnA+ta58zm7sKl90Uzmh22+lJBddPfHA6DCIF3NhbsbZyG7S0BhMhwq9qLfwnk1NpRIVZSKuxUy8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XAj1dJ._1789095001;
Received: from 30.74.144.118(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAj1dJ._1789095001 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 11 Sep 2026 10:50:02 +0800
Message-ID: <708fbbe2-4eba-4641-8267-ed930ade0068@linux.alibaba.com>
Date: Fri, 11 Sep 2026 10:50:00 +0800
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
 <65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com>
 <aqKqr62-718Vw35k@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqKqr62-718Vw35k@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 9:04 PM, Kiryl Shutsemau wrote:
> On Thu, Sep 10, 2026 at 07:14:42PM +0800, Baolin Wang wrote:
>>
>>
>> On 9/10/26 6:45 PM, Kiryl Shutsemau wrote:
>>> On Wed, Sep 09, 2026 at 06:01:13PM +0800, Baolin Wang wrote:
>>>>
>>>>
>>>> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
>>>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>>>
>>>>> An mTHP collapse test needs to know that a range is backed by folios of the
>>>>> target order, and that they sit where a collapse would put them.  Nothing
>>>>> answers that today: is_backed_by_folio() classifies the folio behind a
>>>>> single page, and check_huge_anon() reads smaps AnonHugePages, which only
>>>>> accounts PMD mappings.
>>>>
>>>> Have you checked check_large_folios() in vm_util.c? It seems to meet your
>>>> requirements, or am I missing something?
>>>
>>> The changelog is out of date, sorry: since 6dedaf0d46a9 check_huge_anon()
>>> counts mTHP folios through check_large_folios() rather than reading
>>> smaps, and it is what check_huge() already uses for mthp_khugepaged.
>>>
>>> It could do this job too, called once per window.
>>>
>>> What is_range_backed_by_order() adds is alignment check: the folio has
>>> to sit at the window start. And check_large_folios() reopens two fds per
>>> per call which kinda wasteful.
>>
>> OK. But can we extend the check_huge_xxx() functions to meet your
>> requirements, for example by adding a check_aligned_huge_xxx() that wraps
>> the underlying implementation of check_large_folios()?
>>
>> I still find it confusing that khugepaged.c has two separate sets of
>> functions for checking large folios.
> 
> Agreed that two sets is one too many.  Yeoreum's series rewrites
> check_huge_xxx() on top of pagemap and kpageflags, which is what
> is_backed_by_folio() already walks, so once that lands the two can meet:
> the mTHP branch of check_huge() checks each window for a folio of the
> order at its start, and is_range_backed_by_order() goes away or becomes
> its internal.  That also makes the generic mTHP cases stricter for free.

Look forward to seeing this happen:)

> I would rather do that as a follow-up than fold it into either series
> now, since both touch the same functions.

Sure.
