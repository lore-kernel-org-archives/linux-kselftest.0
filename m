Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AC3DC4CC;
	Thu, 10 Sep 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038419; cv=none; b=StvChwrSV2yR+QrNhTDkiw6/NueWNMOdOXePIunUCDa4s1wuGyVdoPnZG/QE0ZeOrt3qBooXzKJWARcQ9qfTddzxDd2c8LqcxXdGSIP0EOMtzoogqzoYaTdgztb3VQbhukB/uiGpc33jN0S5tBpvD/6dbhRUkKEISHayh+ifROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038419; c=relaxed/simple;
	bh=+XjRVKhQvX210fqS/8gQuurVMWMufhoPHiPSRHxpXF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=is2Heg8Cw+xp/mTTycO7P8ju3eCXll4+FdMl5Y4YUAqHeXHyU52DR3oLLL40JrXnH8qNKjYm91P7p3aoZv6TZR9ovly+2+xfNQr4SbiclLedxmGvVstLtl1WhP4lg4rriOqygcRnpEMLFYmsnXeix00QUAwJ6FBqXctwEooBX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=XGLdUSDF; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="XGLdUSDF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789038413; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NnCzMKK6Rrt9YRz206NHU/MZ6Oa3TFT+q8PJel2ZDiU=;
	b=XGLdUSDFdIl9o3rb6kOQi5gFJzhi/kqh982A9jROA+p4VFaYatRIdcDvPai4PISAQM8MDlA85iXGS2YoqvTRjsa7XhyRhJl1ynWcfK4WvqzslommKpc3UnsCuPZyM31bsyDSNAOzBAINxXAfi9MnLGuN4acxjqsjieWOBQ3oRHc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0XAhNhUn_1789038410;
Received: from 30.74.144.116(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAhNhUn_1789038410 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 19:06:51 +0800
Message-ID: <c0527b13-a60e-4278-91ad-939aae7ea456@linux.alibaba.com>
Date: Thu, 10 Sep 2026 19:06:49 +0800
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
 <ba2d7885-f017-4d4c-bb59-e45f8b9f1b63@linux.alibaba.com>
 <aqKNcw8-2H035xyc@thinkstation>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <aqKNcw8-2H035xyc@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/10/26 6:59 PM, Kiryl Shutsemau wrote:
> On Thu, Sep 10, 2026 at 02:27:28PM +0800, Baolin Wang wrote:
>>
>>
>> On 9/9/26 6:41 PM, Kiryl Shutsemau wrote:
>>> On Wed, Sep 09, 2026 at 05:55:01PM +0800, Baolin Wang wrote:
>>>>
>>>>
>>>> On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
>>>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>>>
>>>>> __madvise_collapse() turns THP off before each MADV_COLLAPSE, both to keep
>>>>> khugepaged out of the range and to prove MADV_COLLAPSE ignores the setting.
>>>>> It clears the global controls only, which is no longer enough.  A per-order
>>>>> control overrides them, and -s, which makes the cases fault in folios of
>>>>> one order, leaves that order's control at "always".  khugepaged then
>>>>> collapses the very range the case is working on, and the case fails on a
>>>>> collapse that was interfered with rather than refused.
>>>>
>>>> Right. So I think the correct fix tag is b7f16963efe7 ("mm/khugepaged: run
>>>> khugepaged for all orders"), because before this commit, khugepaged would
>>>> not try to collapse this range since it only checked whether the PMD order
>>>> was suitable for collapse.
>>>
>>> Agreed.  The series is in mm-new already; if a respin is needed I will use
>>> that tag.
>>>
>>>>> @@ -547,9 +547,16 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>>>>>     	/*
>>>>>     	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
>>>>>     	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
>>>>> +	 *
>>>>> +	 * "inherit" rather than "never" so that MADV_COLLAPSE on shmem still
>>>>> +	 * finds an order to build.
>>>>>     	 */
>>>>>     	settings.thp_enabled = THP_NEVER;
>>>>>     	settings.shmem_enabled = SHMEM_NEVER;
>>>>> +	for (i = 0; i < NR_ORDERS; i++) {
>>>>> +		settings.hugepages[i].enabled = THP_INHERIT;
>>>>> +		settings.shmem_hugepages[i].enabled = SHMEM_INHERIT;
>>>>> +	}
>>>>
>>>> This looks like a workaround to me. Shouldn't we fix this in shmem instead?
>>>
>>> Good point.
>>>
>>> It can be a follow-up patch.  Do you want to make a proper shmem.c fix
>>> and update the selftest along with it?
>>
>> Either way works for me.
> 
> Please, do it as a standlone shmem fix, plus selftest update to reflect
> the change.

Ah, sorry, I misunderstood your points. I'll send out a fix patch tomorrow.
