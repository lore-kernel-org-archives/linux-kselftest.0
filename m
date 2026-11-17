Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899215;
	b=whYa5aCNo4FTabet0tMRtNIJwZFepO/XfAeF2SJdTlTleP+F0WXlQY/8twxmspH854Te
	 1Q74hlAHnsVdFamqmxKtKtbADuwWq1AcWEEUJo1YW7sxQ0gQrND358KL3TGMf0BdJXQKD
	 a+nhCkfpfvcbfcZ35RYTBTe90rwJ9348NG1wJ1gBdVDdFE02NCMNQNZozfX5awig0UDGX
	 s6wOFgIEkF5u5vj2QsOn58qX+dnywApwt0nH2Zkv7EUdd6wmYzchTOV0SSY+48dFz6DhF
	 J2tBQ6u0u/PUN2j78cmcuC6YPN9QG1HlYZEx9crQa6XAKAMOqX4b+b1bbBmtwNNRvzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899215;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5lu26Bt2eDNFvp6cstc3Xl7/hEM7htfAhlohX2GmX/g=;
	b=HWbUgRjOZWNXzL0ItC2B2cHlchHZNxGAM6B1PQHBFTxruiMHDWngIsXy1t/nnF3y2NX1
	 Rh6uQW6sBeVAt1/Mw4v0Cez+WHosInmWfi4fOTvCputfFKfgO/0Aww0e9E5uCgIPvN2Xf
	 q48RnnauthO33ave2+AuXxCmkKfqUoejMhB6QPs0PyMV8EsixJSLzuRvWHdQ3J5bWlzxY
	 0ntuZn9YHuFn6ihIaSwZ0mhezMJaFjpL1JRZPHa16hUQrCfMXSz/kfOmcesVthHmXcr5n
	 gZ+nJ8CjdAjVyiVLM0D5acovcxKDWfAO2bl5YOUMDMaQ3OnaEBTRkzZ39aSiqAkfaDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="CPhiYY/V";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98A8606A89C;
	Tue, 17 Nov 2026 07:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98A8606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CPhiYY/V
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43C781682;
	Mon, 16 Nov 2026 23:06:51 -0800 (PST)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6F7E3F763;
	Mon, 16 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794899214; bh=37zKrLpxA2dCRmPleyeQ7VCQicsitLgl6s35S11J8D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPhiYY/VeBxfA5FgTuKfVU3lDlJHHcJNrwLU0csIRCJUyg027aZZ0ieaS7USQoPS/
	 lQxkrCAi2Swy4jFEKg5BYpXH+U+hr7ZG7+7LG7yLhSfEnZ5COpEFM/pWVO8F7ycEaJ
	 BSjicGNIQOpuxcgKSXPhmZ8Q/DiYOsbGFTXsurUY=
Message-ID: <0fc496fa-8b5d-4067-a21e-c8dae707b95e@arm.com>
Date: Tue, 17 Nov 2026 12:36:46 +0530
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] selftests/mm: replace transhuge-stress with a THP
 compaction selftest
To: Dev Jain <dev.jain@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112090250.334344-1-sarthak.sharma@arm.com>
 <acbbc219-0b6a-4ec5-8047-af4b4b695212@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <acbbc219-0b6a-4ec5-8047-af4b4b695212@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dev!

On 11/14/26 6:13 PM, Dev Jain wrote:
> 
> 
> On 12/11/26 2:32 pm, Sarthak Sharma wrote:
>> transhuge-stress is a stressor tool that repeatedly
>> allocates and splits THPs till a specified duration. If the
>> duration elapses, the test passes and fails only if a setup or
>> system call fails.
>>
>> This is not how a test residing in selftests/mm is supposed to
>> behave. So remove it and add a new functional test called
>> thp-compaction.c, that allocates THPs as much as it can,
>> splits those THPs keeping one page retained and discarding
>> others, and then retries allocating THPs, which will test
>> if THP compaction is working fine. If we are able to recover
>> more than half of the initial THPs, the test passes. Otherwise
>> it fails.
>>
>> This was suggested by David earlier [1].
>>
> 
> Isn't compaction_test.c already sort-of doing what you are trying to
> do here?

Yup, but compaction_test.c is for hugetlb pages. Maybe we can rename 
compaction_test.c to something like hugetlb_compaction or something for 
clarity.

> 
> 
>> Patch 1 removes the current transhuge-stress. Patch 2 adds a check to see
>> if PFNs are being masked due to no CAP_SYS_ADMIN in the initial user namespace.
>> Patch 3 factors out THP split helpers from split_huge_page_test.c to vm_util.c.
>> Patch 4 adds the
>> new test.
>>
>> [1] https://lore.kernel.org/all/94ace42d-8d60-4475-953e-74fb3dc23774@kernel.org/
>>
>> Sarthak Sharma (4):
>>    selftests/mm: remove transhuge-stress
>>    selftests/mm: detect masked PFNs in allocate_transhuge()
>>    selftests/mm: factor out THP split helpers
>>    selftests/mm: add a THP compaction selftest
>>
>>   MAINTAINERS                                   |   2 +-
>>   tools/testing/selftests/mm/Makefile           |   2 +-
>>   tools/testing/selftests/mm/ksm_tests.c        |  26 ++-
>>   tools/testing/selftests/mm/run_vmtests.sh     |   2 +-
>>   .../selftests/mm/split_huge_page_test.c       |  45 +---
>>   tools/testing/selftests/mm/thp-compaction.c   | 215 ++++++++++++++++++
>>   tools/testing/selftests/mm/transhuge-stress.c | 146 ------------
>>   tools/testing/selftests/mm/vm_util.c          |  65 ++++++
>>   tools/testing/selftests/mm/vm_util.h          |   6 +
>>   9 files changed, 313 insertions(+), 196 deletions(-)
>>   create mode 100644 tools/testing/selftests/mm/thp-compaction.c
>>   delete mode 100644 tools/testing/selftests/mm/transhuge-stress.c
>>
> 

