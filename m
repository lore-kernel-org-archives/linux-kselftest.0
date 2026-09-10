Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF8C463B84;
	Thu, 10 Sep 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037148; cv=none; b=qMSj8UU6rfKBeW+WxlfFuZSqPgmWlaoXypiGb6BUGyt8Pu1Uw3RkDsn5wgjKkmBdBdkulK/ixB0ygd2Q/vxr9CqqTFCPsQhTQKfU1nZvoSBvSpNrSzzS5V5H4GQOZq3z6JSK0uT5DUo5RmCrbYr1XlgL0yR02U9H9wkydxlFHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037148; c=relaxed/simple;
	bh=t7gqTHOqP69f6IHwOe9XEl4WcnRfNkhL5VA7Hm0qgDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEZqY7vUCUfxOzSwey8HYrGcP/vd3YPkZFfxWVndSQAr2XzdjrFsP8MQLwbbLYT5yd2oaJHo/EOKbRPVcHodFgMc87PofYpECWGas1giNI+Ez20JLEC4h/60QHGtJPGfSqjAAJy/ClM0ge6HZIxmQamvNI7kzMkaBJr02JQKdcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfiMsYRH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfiMsYRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8197C1F00893;
	Thu, 10 Sep 2026 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037147;
	bh=9Cok/UTYpji3+FrwaXOHiwTHqSUNYdgdbBT+xk3If5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GfiMsYRHHGKZsvxYkr5y+N9FShOF3YPYQeID93USEHyToVLr5Q4DDvLP8osPAOlgE
	 19IcjdZANh/NM/3t7hxkBAGh65vdud/loNQDh66f/cAuBH6MK7evu2uRCQ/uzwLoXf
	 FdQ5sYivvWSYPoBbdPOWoO7BGc/dWw6AMr0ZLpO4AK6vflfxhQMYYkMZercslO4Gm/
	 r8sebyEBZwbq5nRAiv+w/8LcVRlvl8ZQAhCzqkDVs4GNT81d5RtEadG7MZP4HzgqJR
	 8JB1uhbUbixXYfCCDlArBHv8KBXq4M9FRjR2kCMBKOUvzkL8SXipIl6c95+HQVGCFR
	 rfp1YIGRJEbEA==
Message-ID: <21e0a933-63b6-42b4-8cd7-df05b0c9acfc@kernel.org>
Date: Thu, 10 Sep 2026 12:45:39 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] kselftest: mm: fix some failure of
 split_huge_page_test
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-fix_split-v5-0-822b810458bc@arm.com>
 <b923f63c-db7c-4ecb-949d-368bc6311626@kernel.org>
 <aqKHHWKvOonYZPy0@e129823.arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aqKHHWKvOonYZPy0@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/10/26 12:31, Yeoreum Yun wrote:
>> On 9/7/26 10:19, Yeoreum Yun wrote:
>>> split_huge_page_test can fail for the following reasons:
>>>
>>>   1. During the test, khugepaged may collapse previously split pages again,
>>>      causing intermittent failures.
>>>
>>>   2. Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
>>>      glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
>>>      made by memalign(). The underlying VMA may start at a different address
>>>      from the aligned address returned by memalign(). Moreover, a subsequent
>>>      madvise(MADV_HUGEPAGE) call does not split the VMA because it already
>>>      has the same advice.
>>>
>>>      This causes the test to fail because the check_huge_xxx() helpers
>>>      incorrectly require the address returned by memalign() to match the
>>>      VMA start address reported in /proc/self/smaps.
>>>
>>> Address these issues by applying MADV_NOHUGEPAGE after faulting in the
>>> huge page, preventing khugepaged from collapsing it again, and instead of
>>> relying on /proc/self/smaps, use /proc/self/pagemap and
>>> /proc/kpageflags to detect huge-page mappings and large folios:
>>>
>>>   1. If hpage_size == pmd_pagesize, check PAGE_IS_HUGE instead of
>>>      using check_large_folios(), since only the mapping type matters.
>>>      This identifies PMD-mapped huge pages.
>>>   2. Otherwise, use check_large_folios() to detect large folios. This
>>>      covers mTHP cases.
>>>   3. Check the folio flags according to the type of huge page.
>>>
>>> Also, current usage of memalign() would result memory area may
>>> unexpectedly merge with an adjacent VMA, causing tests
>>> that inspect it through /proc/self/smaps to fail.
>> I'm not particularly happy about this.
>>
>> Relying on VMA merging details rather hints that we shouldn't be using smaps to
>> query some stats/properties.
>>
>> Which exact things are test querying through /proc/self/smaps? Could we convert
>> the code to just query that stuff through different interfaces?
> 
> Well, users currently for using /proc/self/smaps are for check vm-flags:
>   - guard-regions where using check_vmflags_guard()
>   - pfnmap test where uses check_vmflag_pfnmap()

Most vm-flags should not be an issue when it comes to merging. The only
exception are vmflags that do not prevent VMA merging.

So it's VM_SOFTDIRTY and VM_MAYBE_GUARD. And I agree that for guard-regions.c we
likely have to care such that we don't merge by accident with other VMAs (guard
regions).

But that's independent of memalign.

ptr = mmap_(self, variant, NULL, 10 * page_size, PROT_READ | PROT_WRITE, 0, 0);
ASSERT_FALSE(check_vmflag_guard(ptr));

could be problematic on its own (unlikely but possible).

For other flags, you really only have to find the smaps area that covers the
given address and look at the vm-flags.

Or am I missing something important?

(merging vnas with VM_PFNMAP is impossible right now IIRC)

-- 
Cheers,

David
