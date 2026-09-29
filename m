Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A54B826C;
	Tue, 29 Sep 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671632; cv=none; b=N6zYxctI6ruYuNkszy8zidT9+E+7reEAo2Am6CYfeXaksxeI2qW/WBs1g2uGtHbioK5H3dGlsVxgJj8BnlOIAwIok16pj0zKBx32JEKADQ3WisqRN1WWxTE5uV5IclMzxMOH0CKx0kID3WbuJJDNA1rfb2d5Pdz0f32BPbpw8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671632; c=relaxed/simple;
	bh=fFbdmy/jFEbtbusP+aCUeNBjK5Uv5PrUKPEf0uCLzrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gBxJJ0v9tR3vc2RWKtOsXmVHE7VparLImtgNXfvvN89YIQ8YIos2H4pm0LVC7uKdgdLvIFOzRPqxJpVT1C6+4DxgOwsI2h/vBQ6cA2JMJutLax16FnglP3q4SoKTBqhgCAWWJctwoVEodqrOxjbJSTg8ebnR5CjzUIwgwrR/qFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4HrEAKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4HrEAKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AAE1F000FF;
	Tue, 29 Sep 2026 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671617;
	bh=Zw3PvTa683KVYIMGi5I0/G6E2FcL9VbXGIRm3XwUYgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=J4HrEAKV7fVngd4o2/Ww4OltHMAUpPp05AJ91lFOkP4iBmU3ynDWftgqrgzVnym7b
	 TMGwzEza5jTsZHNLGPI/JYJIeRf8VA5GaolSfbUsueVNI7H6D+tSC2pNsNI2Q/Hpb9
	 2rNj8wyYHaQL+cqCNeeqlaVOYdQq4LF/4B+iF/UnhNhLGQazn9FaeUSagyQ+efz6ca
	 9SDmVZzUw4TdW1J4oiMLpq6VW34PCxJw6EqVW54T928w75pUmoWPshHHp9w5y9Jlky
	 VRPDOA9L+erYvS5R/LDr4nKRxx9ge9PCpJnhjr7lfkzOz0ZdygFPfkyXUiFS4hNcg6
	 lPOCYRSrNsRPg==
Message-ID: <dcf6fb14-7048-481b-83c6-9e8da6d874f5@kernel.org>
Date: Tue, 29 Sep 2026 10:46:50 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
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
 <84d3a9f5-4bfb-4f5e-86ad-ac8fb896d885@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <84d3a9f5-4bfb-4f5e-86ad-ac8fb896d885@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/29/26 10:43, Baolin Wang wrote:
> 
> 
> On 9/29/26 4:38 PM, David Hildenbrand (Arm) wrote:
>> On 9/23/26 17:29, Yeoreum Yun wrote:
>>> There are intermittent failures in collapse_max_ptes_swap() and
>>> collapse_max_ptes_shared() when using the khugepaged_context:
>>>
>>>    // while running ./khugepaged -s 2
>>>
>>>    # Run test: collapse_max_ptes_shared (khugepaged:anon)
>>>    # Allocate huge page... OK
>>>    # Share huge page over fork()... OK
>>>    # Trigger CoW on page 1023 of 2048... OK
>>>    # Maybe collapse with max_ptes_shared exceeded.... OK
>>>    # Trigger CoW on page 1024 of 2048... Fail
>>>    Bail out! Unexpected huge page
>>>    # Planned tests != run tests (26 != 23)
>>>    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>
>>>    # Run test: collapse_max_ptes_swap (khugepaged:anon)
>>>    # Swapout 257 of 2048 pages... OK
>>>    # Maybe collapse with max_ptes_swap exceeded.... OK
>>>    # Swapout 256 of 2048 pages... OK
>>>    Bail out! Unexpected huge page
>>>    # Planned tests != run tests (26 != 17)
>>>    # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>
>>> This happens because khugepaged may collapse the pages before wait_for_scan()
>>> is called, causing a sanity check that expects uncollapsed pages to fail.
>>>
>>> For example, in collapse_max_ptes_swap(), after faulting the pages back in
>>> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
>>> before c->collapse() is called.
>>>
>>> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
>>> collapsed by wait_for_scan() for anon. This prevents khugepaged from
>>> collapsing it again before c->collapse() is called.
>>>
>>> This failure was observed on NVIDIA Spark with 16KB page.
>>>
>>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>   tools/testing/selftests/mm/khugepaged.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/
>>> selftests/mm/khugepaged.c
>>> index 2aa7c9197158..b0cb02bf1a73 100644
>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>> @@ -618,6 +618,9 @@ static bool wait_for_scan(const char *msg, char *p,
>>> size_t len,
>>>           usleep(TICK);
>>>       }
>>>   +    if (is_anon(ops))
>>> +        madvise(p, len, MADV_NOHUGEPAGE);
>>> +
>>
>> Any reason we just do that unconditionally?
> 
> Although it's a bit messy, as I mentioned before [1], unconditionally setting
> MADV_NOHUGEPAGE will break shmem testing. Maybe add some comments.

Ah, thanks for clarifying. The problem really is that we cannot undo a
MADV_HUGEPAGE (give me hugepages) cleanly. We can only go to the other extreme
(no huge pages).

Yes, let's please add a comment describing why we limit it to anon.

-- 
Cheers,

David
