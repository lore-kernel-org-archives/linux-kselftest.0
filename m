Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DBE41CB31;
	Fri, 25 Sep 2026 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339934; cv=none; b=ntMGryV6ye9DyGZpfP6nhvUeUT7nidfVnFDVf/XFuDvhwBsHEpd7gaaOPcLa/NOjmyiWbt3EHTOEYP1GQDeMbMvef0LF+IwXxUgaf8jZTo3dDlQUy0ipVhtz7a0LHw/TbhBziYkVb6mDxGi/eF1b8zqdRBVoI2KV0jlmEsi3rCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339934; c=relaxed/simple;
	bh=3/sJDh2CYvX6ndhu9fW7GGXj1GgDR/glEJ6XbWJ6Eoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzPki9RvQOAIvduFeiitgYEsfYGVORmTkktCgW/9Zth8OxrbOKwHhUGC3SJMVSqGO3n8Lou25z7OGikPfWyWaEmC+QyED5ot44sWpu46nmSwtmjrKJy3txyar2fllLJSvEWHTUcKbWUXuFLb9c2++ntHUaMc0PrDmTrEmO5svBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qD5/3Mtz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qD5/3Mtz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D167169C;
	Fri, 25 Sep 2026 05:38:49 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C6A63F86C;
	Fri, 25 Sep 2026 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790339932; bh=3/sJDh2CYvX6ndhu9fW7GGXj1GgDR/glEJ6XbWJ6Eoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qD5/3MtzVreV8Bh2VupUQ9nnBRZ5lh5KiqEmCUzeVaGdjdtAk42kWUtSv2TLHK3yx
	 Gh8O6SM+8wgPCCeJEYjSksYixaZjd1X8spXfAjIn8kpc20AZ705kPC2zhifkAqAhx/
	 nXUt2bt5rOx/fCLPrpb1Y+xpq1Vieba3A9Z8bc0Y=
Message-ID: <bde32459-31ce-4b15-a129-4641ef1c6337@arm.com>
Date: Fri, 25 Sep 2026 18:08:44 +0530
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
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-2-cba7359d882a@arm.com>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <20260924-fix_split-v8-2-cba7359d882a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/25/26 12:41 AM, Yeoreum Yun wrote:
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

s/accroding/according

> 
> Since shmem pages are also file-backed, simply check whether the page
> is file-backed.
> 
> Fixes: 642bc52aed9 ("selftests: vm: bring common functions to a new file")

Checkpatch gives a warning saying it requires atleast 12 characters of
commit SHA.

> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

[...]

> +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> +		  uint64_t hpage_size, enum check_huge_type type)
> +{
> +	int pagemap_fd;
> +	int nr_pmd_mappings = 0;
> +	uint64_t categories;
> +	char *start = addr;
> +	char *end = start + len;
> +
> +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> +	if (pagemap_fd < 0)
> +		ksft_exit_fail_msg("open pagemap fail\n");

Can we use ksft_exit_fail_perror("open pagemap") here? Will help in
diagnosing failures as well.

Apart from these nits, rest looks good.

Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
