Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA996440A32;
	Tue, 29 Sep 2026 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663826; cv=none; b=NOIUmHEI9rgZ8YKUGi01Oyn6luSahJ6EnYFkmSBSP/kU/tHmH4DGqi8OuzmRyy4JOI7NWLrUif4iA5Y11ShfSR9oqrPvl2HG/tFbrBrhwTZ76tdGaMm5yn8nlgIxk5HBjXq/7QBh/jatqisYJi+B/vbS4ByN9O+Iet5QVXlXm1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663826; c=relaxed/simple;
	bh=LEnYCQ+SXWphQQRmpbZYMlO5RCXzzgtRaLDkTmHbq6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MEcMooG1/UN+N94uKcXe2ta7lhZoOSeBKP+q6jDQs4Y9KRx1XrPEYn1xiqKa0R9DBXeLxCRKIRcCauoTkDzmzMvrsRK0qm2xvj5AGZ0fr0TIHqYeUtKly7f/UVwdzGlmJRKcbkpSrc1IlDue0sVwjwRIL9iFiuz5PeMQYM/+umI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=O3ZBsYZM; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="O3ZBsYZM"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790663819; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nHGoHv8Lq74Dy6sjVbuTyE2Azn0gGlPCXjF0DUVDx64=;
	b=O3ZBsYZM7u6Ng97Wh8UoFDOCFVWIVGCddAd1HCfYiQZwTVpA0oFwJWO+XADfaRoFaKaipG8BVoqtVu+OciYwPTQWAg1dHwLaswAbPEBR4a7tvegaFVE34oGjHqFObg/3zrIR3968eClBXEpBLEyQKM/ZfKISGfF+eETZfQfk2Sg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBsKUCx_1790663816;
Received: from 30.74.144.142(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBsKUCx_1790663816 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 14:36:57 +0800
Message-ID: <c324eab6-aaae-47c8-bc89-d2dbf4b0a1ad@linux.alibaba.com>
Date: Tue, 29 Sep 2026 14:36:55 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] kselftest: mm: replace usage of /proc/self/smaps
 for __check_pmd_huge()
To: Yeoreum Yun <yeoreum.yun@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-2-cba7359d882a@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260924-fix_split-v8-2-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/25/26 3:11 AM, Yeoreum Yun wrote:
> Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> made by memalign().
> 
> The underlying VMA may start at a different address from the aligned
> address returned by memalign(). Furthermore, a subsequent
> madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> already set.
> 
> This causes split_huge_page_test to fail because the check_pmd_huge()
> helpers incorrectly require the address returned by memalign() to
> match the VMA start address reported in /proc/self/smaps.
> 
> Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> /proc/kpageflags to detect huge-page mappings checking PAGE_IS_HUGE
> and PAGE_IS_FILE accroding to type of huge page.
> 
> Since shmem pages are also file-backed, simply check whether the page
> is file-backed.
> 
> Fixes: 642bc52aed9 ("selftests: vm: bring common functions to a new file")
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

With comments from Sarthak addressed,
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
