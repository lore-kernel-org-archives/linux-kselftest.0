Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5D23C8C7;
	Thu, 11 Jun 2026 12:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179881; cv=none; b=setHW9blc2uTYfonWV/l/zjHyT8BhPDF2mO1lpakSzxhkRA0JyPZiKUIKQrVTOtHqv7a4w61dHVUvgDWowF1rxtNVhPMCbZjLhI+H76BXbvtqOS1ZUuU84d78izTBkOVYMXSMgfP1GKlWHadhyxzafw5cD3oMVtTCCr5LGUD2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179881; c=relaxed/simple;
	bh=0IngIz8OzkiyvyhyV1yjPJzS/gHOpsG3BVGc5FS3Y/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwKDNMA+3TKkG1TLNfgQp6Yy4Et0K76n+4/D93Yp2xoWetfd7JvcC//zDV/KXjhvE/sC8soz7XrNvHt3NbiOcnGWRYNHD7ykLGh/cN6/3Cc1qLLm3o/R/wbxvOKiF0uQKpR5NzXKnkwd6uQMX7UvU3r7wMqolN0RTG9rU811dBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=kXDbOG7k; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="kXDbOG7k"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781179871; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+gAUjXbMGZfUSgaQOzcFV/0TYnRK9QhUgm1Vyadp9F0=;
	b=kXDbOG7kfp1OHS5IEnU9JGyRWxO0Vtrd8QsQVnEdPDr2MU/IQT4ng+q5DX+ycnAHZy5CAXZDHyLhTFNdKuJUhkOZZ5wppdD0tkUnEzbkqzMWhF6J2llbSzpvWJMZdlm0W3HpJ3pFRk/uHqx0Hu7IsIy2nIIArK1aNfeOTd/lbVE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4dcBhE_1781179868;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4dcBhE_1781179868 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 20:11:09 +0800
Message-ID: <b8536502-b227-4f7a-b82e-82204f2c0e4c@linux.alibaba.com>
Date: Thu, 11 Jun 2026 20:11:08 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse
 support
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260611060619.94738-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260611060619.94738-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/11/26 2:06 PM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
> [...]
>> @@ -2768,15 +2827,23 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>> 	else
>> 		cc->progress += HPAGE_PMD_NR;
>>
>> -	if (result == SCAN_SUCCEED) {
>> -		if (present < HPAGE_PMD_NR - max_ptes_none) {
>> -			result = SCAN_EXCEED_NONE_PTE;
>> -			count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>> -		} else {
>> -			result = collapse_file(mm, addr, file, start, cc, HPAGE_PMD_ORDER);
>> -		}
>> +	if (result != SCAN_SUCCEED)
>> +		goto out;
>> +
>> +	if (present < HPAGE_PMD_NR - max_ptes_none) {
>> +		result = SCAN_EXCEED_NONE_PTE;
>> +		count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
>> +		count_mthp_stat(HPAGE_PMD_ORDER,
>> +				MTHP_STAT_COLLAPSE_EXCEED_NONE);
>> +		goto out;
>> 	}
>>
>> +	result = mthp_collapse(mm, file, start, addr, 0, 0, cc, enabled_orders);
> 
> Feels like the second 0 wants to be "swap", no?

It seems so. This reminds me of the issue you’re trying to fix in [1].

[1] https://lore.kernel.org/all/20260609120443.71864-1-lance.yang@linux.dev/
