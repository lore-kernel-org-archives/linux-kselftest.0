Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A529E10F;
	Mon, 12 Oct 2026 04:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791780656; cv=none; b=uYtY3NqBHwuGB0xRZM28pCnPzlWdd1XgIR3Co8Yrfc7JqqKzmU675WiHrHkMNuMXkq+L9GhHxcgjyyuJweMRfk4XP7Y6fWYPlXUCtc+T/o1toWAeWTCR030ZG9V5N+izQ9zjSOv579lTBzDR4zrD2tRtBonBUsu5kq+LPnAydlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791780656; c=relaxed/simple;
	bh=FEORMkWV+LnpnKU8/SJTAtz/HqigUBNwPx9HlqlR0bI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s25tnuE2i04uxvYsnBb7Kh1kGbjlCHqu1ektr1HIH7vZOHFvnB8jaI7HwoBDBho1kXTMrROcPhBG/pjgMQiScXbrLgV8e8P8L9BQaZ8yEuX/0tAczVqr1rbpjt2GLODtwGkIVIg1NryF6YTg2H/JDOLDnvXf9WtzdS7vnKSpnzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AYXMvyrK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AYXMvyrK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA7EB1655;
	Sun, 11 Oct 2026 21:50:48 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DA163F66F;
	Sun, 11 Oct 2026 21:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791780652; bh=FEORMkWV+LnpnKU8/SJTAtz/HqigUBNwPx9HlqlR0bI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AYXMvyrKhr5Zj0P28YCOLqmo8ytyuBDkbpk3gtbZAtI6nU4R10S+rUjM508pvVH6N
	 seUQ6f5BOKSHaKAoiv5viWr0ulK+vKgbebp09HDBYPg8Gagv6FBLoZ8oA1p8c+sqXy
	 9Qp55iOsUA9A8u1ubIds4WOMmRIjmVNEmRzi0l1c=
Message-ID: <3a0673a6-744b-45a1-80fd-737a366fafc4@arm.com>
Date: Mon, 12 Oct 2026 10:20:45 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] selftests/mm: improve mremap_test
To: akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@suse.com, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org, jhubbard@nvidia.com,
 kaleshsingh@google.com, anshuman.khandual@arm.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261006092511.145776-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20261006092511.145776-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/6/26 2:54 PM, Sarthak Sharma wrote:
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

[...]

> ---
> Sarthak Sharma (12):
>   selftests/mm: mremap_test: remove command line options
>   selftests/mm: mremap_test: drop munmap() checks from cleanup paths
>   selftests/mm: mremap_test: simplify errno handling
>   selftests/mm: mremap_test: use kselftest helpers
>   selftests/mm: mremap_test: skip test when userfaultfd is unavailable
>   selftests/mm: mremap_test: fail unexpected mremap successes
>   selftests/mm: mremap_test: fail on data corruption
>   selftests/mm: mremap_test: handle cleanup after mmap failures
>   selftests/mm: mremap_test: remove perf tests and timing
>   selftests/mm: mremap_test: replace validation threshold with sampled
>     checks
>   selftests/mm: mremap_test: replace random data with deterministic
>     pattern
>   selftests/mm: mremap_test: strengthen multi VMA validation
> 
>  tools/testing/selftests/mm/mremap_test.c | 701 ++++++++++-------------
>  1 file changed, 291 insertions(+), 410 deletions(-)
> 

I wanted to address the concern Sashiko has over this patch series [1].
It says that mremap(..., MAP_FIXED) over a range containing multiple
VMAs should unmap the whole range first and then map the VMAs.

But this is not the case, as was discussed on the list earlier as well.
We iterate over the VMAs in the range and only unmap and then map the
region that the VMAs occupy. IOW, as quoted by Lorenzo [2], "the
sematics are such that gaps are not propagated (i.e. it is as if you
mremap()'d each individually)". So if we remap over an existing mapping,
the mapping region on which a hole is remapped should not be affected at
all. So this is a false positive.

While here, requesting for some feedback on this series, if anyone has
had a chance to look at it :).

[1]
https://sashiko.dev/#/patchset/20261006092511.145776-1-sarthak.sharma%40arm.com

[2] https://lore.kernel.org/linux-mm/agH1ZSdX_7QF8P_I@lucifer/

