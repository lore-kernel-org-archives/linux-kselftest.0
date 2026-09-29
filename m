Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF833F12EF;
	Tue, 29 Sep 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661278; cv=none; b=Oi/RqXCLxC9GllbbtiIWMy3SiuhDZ+RobuqQBOI/ONckVTwaYJ9z/c51Go0Z2P+jCs+vZ7JLMxogPXHayA7aTo+AnfhxS0ShMZwWREgH0BzO0J8DiebpLDfKDHf4yZ8TTStWQU/aHtvEtrcYnJ/+/2CcgLJCJHueiwY6Ygg62t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661278; c=relaxed/simple;
	bh=8nkwXY0A5RFYOmpZpCVpTJMUESTE+g43aAvec0iYxIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeiMTGpdYJrCXULfFcXLqXOP4o5/l8sPRF3JzY+A3mWQxFgweZk+TS5ruSz80mcnvKyCzZkrkhmYCtSj9LcF6RN7G7eNjlgqVZobE2d0h1weu6y2v21RaYn/Zw8NCDWTL7ZkTHfUYU/kZ+WUsX8UUqKkco5npVj8p29jyFxcmm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=r+09+Qtn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="r+09+Qtn"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BC8E1684;
	Mon, 28 Sep 2026 22:54:31 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B643C3F85F;
	Mon, 28 Sep 2026 22:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790661274; bh=8nkwXY0A5RFYOmpZpCVpTJMUESTE+g43aAvec0iYxIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r+09+QtnSFt+dnSfRuQGaaldiXc4mhTOPri6hVSHqcL9koINFR2ZnAgeqwsSkGa6C
	 2jPyj+B6rBWhOoUuyCIeZnxqz3AJlFX3dC5DeZAGcgotS5umquFypWyjnXgnuLFlCP
	 vxY8dFVP25lHN7cuNL79b6G/tNeBObrPUpdUQAeI=
Message-ID: <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
Date: Tue, 29 Sep 2026 11:24:28 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
To: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Kalesh Singh <kaleshsingh@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun
 <ts930@dgu.ac.kr>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/24/26 10:30 AM, Sarthak Sharma wrote:
> This series fixes several correctness issues in mremap_test and
> simplifies and strengthens its data validation.
> 
> Patch 1 converts the mremap_test to use kselftest helpers, removes
> manual tracking of failed tests and corrects some spelling errors.
> 
> Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
> handling, multi-VMA data validation and failure reporting when data
> corruption is detected.
> 
> Patch 6 removes the randomization and uses a simple pattern based approach.
> 
> Patch 7 removes perf tests and timing infrastructure.
> 
> Patch 8 removes validation threshold and always validates complete mappings.
> 
> Patch 9 strengthens the multi VMA validation by also checking the
> mapping state of holes after remapping.

Hello everyone! Just wanted to check if someone has had a chance to look
at the series.

Also, Sashiko has a concern [1], and I had the same while posting the
series. I hope I can get some opinion from the community.

Currently, for PUD remap tests, we allocate a source mapping of 2GB. We
only fault in the first threshold_mb amount of memory, remap the whole
region, and validate the already faulted threshold_mb amount of memory,
which is, by default, equal to 4MB and can be changed by the user by
supplying a command line option.

Since we plan to remove all command line options from teh selftests, I
removed threshold_mb altogether, following some discussion on the list
[2]. This would now cause a 2GB source mapping, and its contents copied
from another 2GB buffer. This causes the process to have a 4GB RSS.
Sashiko says that this can cause OOM killing in small CI machines.

Would it be okay to keep a 4GB RSS in this case, or should we find some
other way of validating a part of the whole range instead?

[1]
https://sashiko.dev/#/patchset/20260924050009.19974-1-sarthak.sharma%40arm.com

[2]
https://lore.kernel.org/all/2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.org/
