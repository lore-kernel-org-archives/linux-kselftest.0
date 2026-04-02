Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4A51C84BB;
	Thu,  2 Apr 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115217; cv=none; b=t0hST9pc5uYRQKWW3JDW/k/BaRTWjYfj1kC1W005lPGXHG7bvDHFRUV7lCL/lQSwt37/STj+2D3QSM2+11LtNKfw+/liC2Q0W5JwGQWs4L199tAdQLTQ8LEERfTpllJsuLoGHdliy0ZsE6cEdUyEljkNrYdpZnTTrBWFDe/yxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115217; c=relaxed/simple;
	bh=R/cIO2BwJHu7sNONJs+MahbX4J5TngFBvxR6D1WjqBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nV0cfOKe4TuNdLZHAR4c5Rss+ANteszECUErS2JUwFrjrtH9HISta7kJjMknRy347jBVgxW3C/39Ifor5EEvcy5cSPBwwJ4HSYz72PIAz46AvivTcaROO/WL4A0o+rg8dvPO4DYGTjMEzqE05upRPGkPZjxkQh0RjNW1fY9uuDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7TCNLzn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7TCNLzn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA868C19423;
	Thu,  2 Apr 2026 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775115217;
	bh=R/cIO2BwJHu7sNONJs+MahbX4J5TngFBvxR6D1WjqBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t7TCNLznhEu1vja0NnYDXrVOKmFFxna/Vom0HAPoTOZGSuqAcVT4jGXBER+jNmJ9h
	 /CNAqy/dORnTLDf8FEuc1hKDb1l6pMS/Mpp1U52NEnLHBmCGHJaC6UdirktXq6Sd9G
	 JHLm9x2dJ0yO5+WJQHMJgNxZ+0L/ljldDz2GddLcJ8mPpafOKZJc2oaPqO9f5uP0+G
	 PwWF33kLu4PLXV2ercsZAqG29cW3NQiND/oNiMtf6o43X+aR/dUXj38AheX+qr84GA
	 J+w3xJ5yhTUAvfQfWSjEbI4oGSpvSIy8XFFSe24FMfDdYQbhs1Fzis4oGSau+g5+cB
	 rHpt+a+4zsiCw==
Message-ID: <86889304-c450-491c-8c06-48ca9c973531@kernel.org>
Date: Thu, 2 Apr 2026 09:33:29 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] selftests/mm: ensure destination is
 hugetlb-backed in hugepage-mremap
To: Sayali Patil <sayalip@linux.ibm.com>,
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Ritesh Harjani <ritesh.list@gmail.com>,
 Zi Yan <ziy@nvidia.com>, Michal Hocko <mhocko@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>,
 Liam.Howlett@oracle.com, linuxppc-dev@lists.ozlabs.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <cover.1774591179.git.sayalip@linux.ibm.com>
 <3b6ffba238a4b59de891acf896fa25d7d3193228.1774591179.git.sayalip@linux.ibm.com>
 <ee15d52f-45df-415b-b0d9-3d267d147e5c@kernel.org>
 <b590a17c-13ed-45f4-9f51-ac662d00e7bf@lucifer.local>
 <066a146b-7dbb-408e-bbc0-542bdcdd6681@linux.ibm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <066a146b-7dbb-408e-bbc0-542bdcdd6681@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/1/26 22:39, Sayali Patil wrote:
> 
> 
> On 01/04/26 20:10, Lorenzo Stoakes (Oracle) wrote:
>> On Wed, Apr 01, 2026 at 04:21:55PM +0200, David Hildenbrand (Arm) wrote:
>>
>> OK so digging in:
>>
>> mremap -> ... -> vrm_set_new_addr() -> get_unmapped_area() -> ... (in
>> ppc arch
>> code) -> slice_get_unmapped_area():
>>
>> unsigned long slice_get_unmapped_area(unsigned long addr, unsigned
>> long len,
>>                       unsigned long flags, unsigned int psize,
>>                       int topdown)
>> {
>>     ...
>>     /* bunch of checks */
>>
>>     /* If we have MAP_FIXED and failed the above steps, then error out */
>>     if (fixed)
>>         return -EBUSY;
>>
>>     ...
>> }
>>
>> Is presumably where we hit the issue.
>>
>>>
>>> That is weird. An mremap(MREMAP_FIXED) is really just an munmap() +
>>> move.
>>
>> Yeah the weird bit I guess is that we _still_ invoke
>> get_unmapped_area() but
>> with MAP_FIXED set to indicate that we want the specific address, so it's
>> subject to the above checks.
>>
>>>
>>> Are we sure this is not some actual problem in the hugetlb
>>> implementation?
>>
>> It seems the 'slices' check sees if the _target address_ has an
>> equivalent page
>> size, presumably hugetlb-mandated, and fails if they're not
>> equivalent, so this
>> change is just accounting for that.
>>
> Yes, this change accounts for that by ensuring the destination is
> created with MAP_HUGETLB so it has the same page size as the source.

Okay, weird, so it's the right thing to do to cover all odd arch behavior.

>>
>>>
>>>
>>> But then the test suddenly requires more hugetlb pages, no? I don't see
>>> a good reason for the MAP_POPULATE, really. It will be discarded
>>> either way.
>>
>> Yeah I'm not sure about the MAP_POPULATE being all that important here.
>>
> As far as I understand, without MAP_POPULATE, memory accesses would
> trigger userfaults, and since the test is single-threaded and has no
> background handler for the uffd, it would deadlock. MAP_POPULATE ensures
> the test runs correctly by prefaulting all pages, but please let me know
> if I’m mistaken.

So you are saying the test would deadlock if you are not adding
MAP_POPULATE? If so, please double check if that is actually the case.

And if it's actually the case, please carefully document that in the
patch description, and probably as a comment above the MAP_POPULATE usage.

-- 
Cheers,

David
