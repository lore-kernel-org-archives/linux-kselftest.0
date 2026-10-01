Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ED13C0A04;
	Thu,  1 Oct 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860587; cv=none; b=eQkoSIaEzzc3D3NGtdMgk6hy8qAJF+3+CNuFOX4/xt8E8MIWVorabLbZGf2nAYi5dQFOzYivEkuzy5bBEEcvTiVNKbO0P29HfSp0tsWizXy7Yg+IpjOunXqqkhUHyMFh77sef+V7kKwSkpH9uK87EXN4w+0koO8Yyx3s+2i5Fto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860587; c=relaxed/simple;
	bh=LVs5YT6LT4gg7RTPzyx3qM7GfiwK0MeknB481u6FJ9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxLY/uhNFJakPeV6B8p0BoQJaQZ3YGDhruCnTRzt2M9cHEO1QgjlnZYKaC3MlpIsyvVlf8R+0RRumLyPSgUHS5dmSaOl1EBHJHNjAUgZLQGuznyYUErYjzx/3pTjYGWUY5bOgpJUlmmVFRsVWUAdomXbrUzh5HdrkbHGcBbulf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=O7o6r/UH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="O7o6r/UH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BC11497;
	Thu,  1 Oct 2026 06:16:21 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D280E3F86F;
	Thu,  1 Oct 2026 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790860584; bh=LVs5YT6LT4gg7RTPzyx3qM7GfiwK0MeknB481u6FJ9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7o6r/UHppDvRwr0D1xETP/vef/fSpqy/5tmXsF8MkHAT300YbeO1lhrpj6lgzzOa
	 LUlhZizf7Ie53COu1hQAA7QLTVqrQB78/0dyuutZ9rIpyVMgFqu53NyrK4CSwiJYMa
	 qtnpVB7nzRK0133zlRd2Td27itIeaQgZc3h+6UXE=
Message-ID: <54f1d9b8-948a-482d-8fa5-694fd937c9e8@arm.com>
Date: Thu, 1 Oct 2026 18:46:18 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 6/9] selftests/mm: mremap_test: replace random data
 with deterministic pattern
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
 <20260924050009.19974-7-sarthak.sharma@arm.com>
 <b45813af-df08-4270-93ac-d99ee42830ec@kernel.org>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <b45813af-df08-4270-93ac-d99ee42830ec@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/1/26 5:30 PM, David Hildenbrand (Arm) wrote:
> On 9/24/26 07:00, Sarthak Sharma wrote:
>> mremap_test uses a random data stream to detect corruption after remap
>> operations. This requires seed handling and byte by byte validation,
>> which is inefficient.
>>
>> Replace it with a deterministic pattern where every word in a page
>> contains its one-based page index. Use memcpy() and memcmp() to
>> initialize and validate the mappings. Remove the pattern seed and
>> its command line option. Also update the comment diagrams to
>> reflect the new deterministic pattern.
>>
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
> 
> How will this patch change with the change in threshold handling? Does it make
> sense to reshuffle the patches?

From an intermediate patch POV, both ways of doing should be identical:

a) Remove threshold first, then remove randomization:
	i) Adjust random buffer size according to what the test requires
	   and implement the start, mid end pages checking
	ii) Replace rand approach with fixed pattern

b) Remove randomization first, then remove threshold:
	i) Adjust fixed pattern size according to threshold
	ii) Implement the new logic of start, mid and end pages checking
	    and adjust pattern size

But if we plan to remove perf and timing infrastructure before (which I
plan to do in v2), yes removing threshold first would be neater, since
it will keep both the removal patches together. Please let me know if I
am missing something.

