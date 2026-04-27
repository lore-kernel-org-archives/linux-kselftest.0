Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117732BF24
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302868; cv=none; b=P+3XMsUXQqoYOX/DLijdhSyJ66YYDfFYg8xZSAn6KzVw2lT4InqAWcHaa7Hh3xQ0LZBSmveZGmhAogSmfGLFtJn6Quer4Vo9M33USr2DDkJsK8kQ0ZD80F0e/JiFue1A92pkg97XY39spBcF6d3sQlAcNjdtYLlgILrVbbRBBPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302868; c=relaxed/simple;
	bh=NVDk0P+CGmZ2vwxtn0eqjXzzPrGTerfSTxm0fU1Ip0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtkaw4fLGuvbnHMMdSM9Q8snVcxPf6WVUydzvix+eZYqZPo+jrzFn6sjF0cTGwQyFXYDLVKFPUVJMApbDCyPUxYfZENrDAA9n7Z/RDC7naZSp++5wBHhiR968I9Y17JuGbBffn+T8JDKPO26Tqw9VQpU3Ute8iLfk/jjPgLVfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lOr3L0Tr; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lOr3L0Tr"
Message-ID: <b2c0fedc-0641-4c51-9426-879c6878a2e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777302864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UgDbcmIJGZlRjzn8XIrNR1a7hkzoZAPPy0uySZ/X8o=;
	b=lOr3L0TrmrYswkMnhmVGOjNxRAxxODxJ+wIm/s2Pa5435yehAW/WXL7l7sreR9iNnPs28P
	xtQ8QSqfCzL3to5dmce73+RBVowv255ePLqtsPGWDWy9Ome+rt/c7JeckpVBkXQ6ZNcjW9
	vxZ4jiONxJWFr2Up/G+bVKbnvQlvAVI=
Date: Mon, 27 Apr 2026 23:14:11 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Content-Language: en-US
To: Breno Leitao <leitao@debian.org>
Cc: linmiaohe@huawei.com, nao.horiguchi@gmail.com, akpm@linux-foundation.org,
 corbet@lwn.net, skhan@linuxfoundation.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
References: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
 <20260427123330.92847-1-lance.yang@linux.dev> <ae92WpsjxQ71BE9Q@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <ae92WpsjxQ71BE9Q@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2026/4/27 22:45, Breno Leitao wrote:
> On Mon, Apr 27, 2026 at 08:33:30PM +0800, Lance Yang wrote:
>>
>> On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
>>> When get_hwpoison_page() returns a negative value, distinguish
>>> reserved pages from other failure cases by reporting MF_MSG_KERNEL
>>> instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
>>> and should be classified accordingly for proper handling.
>>>
>>> Acked-by: Miaohe Lin <linmiaohe@huawei.com>
>>> Signed-off-by: Breno Leitao <leitao@debian.org>
>>> ---
>>> mm/memory-failure.c | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
>>> index ee42d43613097..7b67e43dafbd1 100644
>>> --- a/mm/memory-failure.c
>>> +++ b/mm/memory-failure.c
>>> @@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
>>> 		}
>>> 		goto unlock_mutex;
>>> 	} else if (res < 0) {
>>> -		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
>>> +		/*
>>> +		 * PageReserved is stable here: reserved pages have
>>> +		 * PG_reserved set at boot or by drivers and are never
>>> +		 * freed through the page allocator.
>>> +		 */
>>
>> Not necessarily. PG_reserved is not a permanent lifetime property for
>> every page that has carried it.
>>
>> page-flags.h says early reserved pages may later have PG_reserved
>> cleared and then be given to the page allocator :)
>>
>> At least some drivers also clear PG_reserved when releasing pages they
>> marked reserved.
>>
>> Would it be clearer to say that pages with PG_reserved set are not
>> currently managed by the page allocator, rather than saying reserved
>> pages are never freed through the page allocator?
> 
> Would a comment like the following look better?
> 
>    /*
>     * Pages with PG_reserved set are not currently managed by the
>     * page allocator (memblock-reserved memory, driver reservations,
>     * etc.), so classify them as kernel-owned for reporting.
>     */
>    if (PageReserved(p))
>        res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);

Works for me, thanks.
