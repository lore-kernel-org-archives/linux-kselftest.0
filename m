Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D0488210;
	Tue, 29 Sep 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671438; cv=none; b=hnyWLk4EKXwazDkucpgtOaZ/jJrURg0yrrpOtFt8SdZv1OqUoUCYHev6QCeetxTBb2obj6AJGZ++dd8zNGo2545Id9IASPhBmsqPEdozKe5VPMwJAFHS5oNXdXR8LOKdycIgv0VXiYsLL0IFrOxGdFJQ+yTjj9NwbUmK1GfGQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671438; c=relaxed/simple;
	bh=rmWiNNAvl95s+63pM7tKNFqbFLirLrbJwJgMGT6EloY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LknVwx1600tCzhTVyJnVfTo3QNg9FmAPn+KCb9YdPczmQaih3oR0T3yU7ko8ORYNGaS17wiYmAXjk3q0HQBtnotAzpb2RSbGwzjWaC22QzJc62dF4yRcORzRBCpgHs4MHfzkVagQojDoSHDOg8xZ4WLmxkdZy/4V+SV9a5H93fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LZqQhz7C; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LZqQhz7C"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790671423; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=guDeg6QqGfbRrydExIA2ThsV8UFr57TVsH4IDbNkF3k=;
	b=LZqQhz7CvV7AaTjUN52FCDql2CMMLSKG5BSYKwIqRRdl7jtkNS662ikP0QYehOWNtgR1xyhWNuMcWPNiki62uIkDakXMO/2MBQC4nPOv4IGiIt6LtgvcNLJXPa4K7yK3qUJJ0g7UvdgE4XISdCrET0wlbGfImd4VuXdhbJphPGk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBscwvt_1790671420;
Received: from 30.74.144.142(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBscwvt_1790671420 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 16:43:41 +0800
Message-ID: <84d3a9f5-4bfb-4f5e-86ad-ac8fb896d885@linux.alibaba.com>
Date: Tue, 29 Sep 2026 16:43:39 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-2-b387e92fe1a9@arm.com>
 <447e0be9-836d-4324-9a36-77f8a0cbecf9@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <447e0be9-836d-4324-9a36-77f8a0cbecf9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 4:38 PM, David Hildenbrand (Arm) wrote:
> On 9/23/26 17:29, Yeoreum Yun wrote:
>> There are intermittent failures in collapse_max_ptes_swap() and
>> collapse_max_ptes_shared() when using the khugepaged_context:
>>
>>    // while running ./khugepaged -s 2
>>
>>    # Run test: collapse_max_ptes_shared (khugepaged:anon)
>>    # Allocate huge page... OK
>>    # Share huge page over fork()... OK
>>    # Trigger CoW on page 1023 of 2048... OK
>>    # Maybe collapse with max_ptes_shared exceeded.... OK
>>    # Trigger CoW on page 1024 of 2048... Fail
>>    Bail out! Unexpected huge page
>>    # Planned tests != run tests (26 != 23)
>>    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>>    # Run test: collapse_max_ptes_swap (khugepaged:anon)
>>    # Swapout 257 of 2048 pages... OK
>>    # Maybe collapse with max_ptes_swap exceeded.... OK
>>    # Swapout 256 of 2048 pages... OK
>>    Bail out! Unexpected huge page
>>    # Planned tests != run tests (26 != 17)
>>    # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
>>
>> This happens because khugepaged may collapse the pages before wait_for_scan()
>> is called, causing a sanity check that expects uncollapsed pages to fail.
>>
>> For example, in collapse_max_ptes_swap(), after faulting the pages back in
>> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
>> before c->collapse() is called.
>>
>> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
>> collapsed by wait_for_scan() for anon. This prevents khugepaged from
>> collapsing it again before c->collapse() is called.
>>
>> This failure was observed on NVIDIA Spark with 16KB page.
>>
>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>> ---
>>   tools/testing/selftests/mm/khugepaged.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
>> index 2aa7c9197158..b0cb02bf1a73 100644
>> --- a/tools/testing/selftests/mm/khugepaged.c
>> +++ b/tools/testing/selftests/mm/khugepaged.c
>> @@ -618,6 +618,9 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>>   		usleep(TICK);
>>   	}
>>   
>> +	if (is_anon(ops))
>> +		madvise(p, len, MADV_NOHUGEPAGE);
>> +
> 
> Any reason we just do that unconditionally?

Although it's a bit messy, as I mentioned before [1], unconditionally 
setting MADV_NOHUGEPAGE will break shmem testing. Maybe add some comments.

[1] 
https://lore.kernel.org/all/24690e82-3aab-4f2d-95a7-3bba332ca5bc@linux.alibaba.com/
