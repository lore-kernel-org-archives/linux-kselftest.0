Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392034;
	b=RS7GvQ2ZQrcryLUJ+LFz7hAmD/agSlSC0ZCFl6kMGghHtLZJ++pjvasdXWekmGH6lzZK
	 xCCpGkjtjMcMjAanu1PRiMeGVwzlb3r8NGDF8D1+wL8e/fNIKmMqXEZkWSaZMQhijlVLU
	 q9Eza7sZZ74tfY6zwMQRq6A9kZI2vLBSQWASckeIQXzMG0CL65lZKmEzzBMJGBLUwYamr
	 1kiRX2VmToRB35NUWbaZHAJtLXrZigVIocz3Dk04LvU7JrcaRwYCmF2GrijI8FZymcwBY
	 pLdzQWquu1f7bQ8uTRKfm1pkKZ1vWuaSnasKqDsCB5cyGve8h3XPyoqx59bWVMGMrXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392034;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QFsUrJ0dxOWP7r3frqNT5Bu7ce7smoD0qQQqG1/Rh6Q=;
	b=C5qCqQXDNoBDLD8EbrvzWi6jyqizaTOAcZ4nhWwQPUEgo7qAnWzPE6yUe24boPQXxCG5
	 xDHPclQkGY2Hvf8253S3T93gQzrfkmlcEESjdKJaIibqd+nhp/mVEfEE8rZG0bHYSqd1/
	 Tqpz0cTcXIZZ3YfknEWE3X1R524tQiPAVmEDgsiKTbBc4hPaWLp7+g/FUAyKPd/MpCPSq
	 T96pLTALMQWafNDPFptWzhqlZf6KyoLkPM1lk/6l6DGDwp6zC7zDG61jXYliMtGdMzKof
	 3L84TD3xEybmyWKiRu778nRtArf/rM8XmZLq5iXdidUkvfBloC+3eUbHP8/TUPIuzOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=t1XoflFL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D9A606A321;
	Wed, 11 Nov 2026 10:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D9A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=t1XoflFL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19D6F1576;
	Wed, 11 Nov 2026 02:13:50 -0800 (PST)
Received: from [192.168.29.156] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9843F632;
	Wed, 11 Nov 2026 02:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794392033; bh=1UEncBFzc6ar7AzXQMp/oadOU3GZsGaET5zqzd1pFeE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t1XoflFL8fdXTGRA8TKAuiSWlNqE8dajStSZclPxJPQhhPfQ4rp6WJdfL3xNKT35o
	 5skjqINIMXPS133CRRqRgZMCqxpLzq/FXQw6Wwde839uQ4Yh5hRfQfyIvBwJeC2N5s
	 mQs95NZEbgNSiP6CcMm6Fqqa1W3LWZEDLdaXhaNk=
Message-ID: <f2df3351-ccc8-44c6-bcfc-d380264fb8fd@arm.com>
Date: Wed, 11 Nov 2026 15:43:44 +0530
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
Subject: Re: [PATCH RESEND v2 00/12] improve mremap_test
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261102100211.141831-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261102100211.141831-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/2/26 3:31 PM, Sarthak Sharma wrote:
> This series fixes correctness issues in mremap_test, simplifies its
> test infrastructure and strengthens validation of remapped mappings.
> 
> Patches 1-3 remove unused command line handling, unnecessary cleanup
> checks and redundant errno handling. Patch 4 converts the test to use
> kselftest helpers and removes manual failure tracking.
> 
> Patches 5-8 fix handling of unavailable userfaultfd support, unexpected
> mremap() successes, data-corruption failures and cleanup after mmap()
> failures. Patch 9 removes perf tests and timing infrastructure.
> 
> Patches 10 and 11 replace threshold-based random-data validation with
> sampled validation and a deterministic data pattern. Patch 12
> strengthens multi VMA validation by also checking the mapping state
> of holes after remapping.
> 
> This is a resend of v2 without any changes.

Hi,

It has been some time since I've posted this series (v1 posted around 2 
months back :)) but it hasn't been reviewed enough. Requesting for some 
review on this series, if someone has some time to look at it.

> 
> Changes in v2:
> - Add a first patch to remove command-line options (David)
> - Add a second patch to remove munmap() checks from cleanup paths (David)
> - Add a third patch to simplify errno handling
> - Drop the "correct multiple VMA range size" patch
> - Add an eighth patch to fix cleanup after target mmap() failures
> - Replace fully populating and validating large mappings with
>    populating and validating 10 pages each from the start, middle
>    and end (David)
> - Extend multi VMA strengthening to userfaultfd multi VMA test
> - Fix minor formatting issues
> 
> Previous versions:
> v2: https://lore.kernel.org/all/20261006092511.145776-1-sarthak.sharma@arm.com/
> v1: https://lore.kernel.org/all/20260924050009.19974-1-sarthak.sharma@arm.com/
> 
> ---
> Sarthak Sharma (12):
>    selftests/mm: mremap_test: remove command line options
>    selftests/mm: mremap_test: drop munmap() checks from cleanup paths
>    selftests/mm: mremap_test: simplify errno handling
>    selftests/mm: mremap_test: use kselftest helpers
>    selftests/mm: mremap_test: skip test when userfaultfd is unavailable
>    selftests/mm: mremap_test: fail unexpected mremap successes
>    selftests/mm: mremap_test: fail on data corruption
>    selftests/mm: mremap_test: handle cleanup after mmap failures
>    selftests/mm: mremap_test: remove perf tests and timing
>    selftests/mm: mremap_test: replace validation threshold with sampled
>      checks
>    selftests/mm: mremap_test: replace random data with deterministic
>      pattern
>    selftests/mm: mremap_test: strengthen multi VMA validation
> 
>   tools/testing/selftests/mm/mremap_test.c | 701 ++++++++++-------------
>   1 file changed, 291 insertions(+), 410 deletions(-)
> 

