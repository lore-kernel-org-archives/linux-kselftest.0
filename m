Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19E235358;
	Thu, 10 Sep 2026 06:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021658; cv=none; b=a7l34eD9rIPgiMibFHFwGGMXfcyAosIP0N+WnKQ3h33J6Xtz4LGbh4r+8kgKqOqJPIwrFJPq5i9EnJY3OLeCm3bm9JemetuCtNO/TFJfK8/274FShTOe8D3rmKP7SFD5WdQt4snTySngkp/3nEfd13ze6dk7JkmZpPnzWZkKCvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021658; c=relaxed/simple;
	bh=bpnn6QmMKPzjtUN3vd1TQRtsR3KxTH9ItpE2p9ONljs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/Yj9Y6FXWAG7pUjPWRR9vED8TG/VXj3UwYoMyK5sD4Em0zcCoiIcGZgsZ55FKp3s/WwpzY13aDq/IEid2SqEnVlvypcK3+NBk10J2tWEeJKXeX5eLXbrlMRABSZigqLPXxH/UF4seRaBjVT4goDSSvtM8UyJw4mBCOoZd2vy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=vFF4klIX; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="vFF4klIX"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789021652; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2959D7GXiIunB5jpQGCJoRIyTLlLNAvoQ+NgVxUVNXI=;
	b=vFF4klIXXawMiNbdGy6nT5Se33byz2LVVnU60+eHcZInofPHiaKL1Fmfo/NzmupUK+LOu71H/lwXSNZlC/JpcHPapvODZncvlDZbaPsYVhMtNZhLUk/xcjt+PVSN3Jc5Ru4+z59/sY2zETKxs2g6tu9B4wZXgjErSGKqqZSBRME=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R491e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XAgmcIa_1789021649;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAgmcIa_1789021649 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 14:27:30 +0800
Message-ID: <ba2d7885-f017-4d4c-bb59-e45f8b9f1b63@linux.alibaba.com>
Date: Thu, 10 Sep 2026 14:27:28 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/19] selftests/mm: stop khugepaged during the
 MADV_COLLAPSE cases
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
 <20260908125105.1510704-7-kirill@shutemov.name>
 <4e064b9d-aea9-485a-8547-3830999cff01@linux.alibaba.com>
 <aqE3Vq8Go01c1icS@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqE3Vq8Go01c1icS@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/9/26 6:41 PM, Kiryl Shutsemau wrote:
> On Wed, Sep 09, 2026 at 05:55:01PM +0800, Baolin Wang wrote:
>>
>>
>> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
>>> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
>>> It clears the global controls only, which is no longer enough.  A per-order
>>> control overrides them, and -s, which makes the cases fault in folios of
>>> one order, leaves that order's control at "always".  khugepaged then
>>> collapses the very range the case is working on, and the case fails on a
>>> collapse that was interfered with rather than refused.
>>
>> Right. So I think the correct fix tag is b7f16963efe7 ("mm/khugepaged: run
>> khugepaged for all orders"), because before this commit, khugepaged would
>> not try to collapse this range since it only checked whether the PMD order
>> was suitable for collapse.
> 
> Agreed.  The series is in mm-new already; if a respin is needed I will use
> that tag.
> 
>>> @@ -547,9 +547,16 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>>>    	/*
>>>    	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
>>>    	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
>>> +	 *
>>> +	 * "inherit" rather than "never" so that MADV_COLLAPSE on shmem still
>>> +	 * finds an order to build.
>>>    	 */
>>>    	settings.thp_enabled = THP_NEVER;
>>>    	settings.shmem_enabled = SHMEM_NEVER;
>>> +	for (i = 0; i < NR_ORDERS; i++) {
>>> +		settings.hugepages[i].enabled = THP_INHERIT;
>>> +		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
>>> +	}
>>
>> This looks like a workaround to me. Shouldn't we fix this in shmem instead?
> 
> Good point.
> 
> It can be a follow-up patch.  Do you want to make a proper shmem.c fix
> and update the selftest along with it?

Either way works for me.
