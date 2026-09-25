Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A943836215D;
	Fri, 25 Sep 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346199; cv=none; b=qlBaKwlkCDb6RQlJUZ7wIHY0F9E3i143nUDNllnaxgpUjw4hXGhreNMw3x8cwM22mPj4jOpoVV/TIe4v5+N++hhitZS0NjrJC1i5y7mhLLJA7mhV110548HL70fvMhqeAqLs7O7Gk3igt7O5/T6SUnxsCgvpsIEPYu/Oo38sJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346199; c=relaxed/simple;
	bh=p5M52w+o5HEtF8yjYDd7ocLU11nT7BYOmwbTMgf/3oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYL8RaxhMUgAxErJENY8nzMj/jXFWqAxwBIiVWXPoz/Ula6A7gBmBl4XPnXGiuhL5Ht/vRFUMlAtifcDr0I05d24tMy+SGypTbdGXUhrRSpk6bZ2yo/OFbu8L1qSDrvSrRNd9rCN8IjkO9jk0IUxBnx9WyDRS01oufKXMzdWSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Zh3hLqsx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Zh3hLqsx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 562FB169C;
	Fri, 25 Sep 2026 07:23:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B7B3F85F;
	Fri, 25 Sep 2026 07:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790346195; bh=p5M52w+o5HEtF8yjYDd7ocLU11nT7BYOmwbTMgf/3oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh3hLqsxZi1yCHoYIty8FRF1DXZFW3bWWJPP+naPNiaJdyGaN6QgpCy8jYRtcIZi5
	 DbSpuKNNjKL2MEbq8/YFqvm/qJklH2xHIxWOm5Eu2JoDbR9u6A+nkSPqAlflAa3QZZ
	 qAlbHMEqQm1dDCO1yzWfh+M7sghx5++tXcnxX6U4=
Date: Fri, 25 Sep 2026 15:23:09 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/4] kselftest: mm: replace usage of /proc/self/smaps
 for __check_pmd_huge()
Message-ID: <araDzcqZMmne_w4Z@e129823.arm.com>
References: <20260924-fix_split-v8-0-cba7359d882a@arm.com>
 <20260924-fix_split-v8-2-cba7359d882a@arm.com>
 <bde32459-31ce-4b15-a129-4641ef1c6337@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bde32459-31ce-4b15-a129-4641ef1c6337@arm.com>

On Fri, Sep 25, 2026 at 06:08:44PM +0530, Sarthak Sharma wrote:
> 
> 
> On 9/25/26 12:41 AM, Yeoreum Yun wrote:
> > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > made by memalign().
> > 
> > The underlying VMA may start at a different address from the aligned
> > address returned by memalign(). Furthermore, a subsequent
> > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > already set.
> > 
> > This causes split_huge_page_test to fail because the check_pmd_huge()
> > helpers incorrectly require the address returned by memalign() to
> > match the VMA start address reported in /proc/self/smaps.
> > 
> > Instead of relying on /proc/self/smaps, use /proc/self/pagemap and
> > /proc/kpageflags to detect huge-page mappings checking PAGE_IS_HUGE
> > and PAGE_IS_FILE accroding to type of huge page.
> 
> s/accroding/according

Okay.

> 
> > 
> > Since shmem pages are also file-backed, simply check whether the page
> > is file-backed.
> > 
> > Fixes: 642bc52aed9 ("selftests: vm: bring common functions to a new file")
> 
> Checkpatch gives a warning saying it requires atleast 12 characters of
> commit SHA.

Oops. I'll update.

> 
> > Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> 
> [...]
> 
> > +static bool __check_pmd_huge(void *addr, size_t len, int nr_hpages,
> > +		  uint64_t hpage_size, enum check_huge_type type)
> > +{
> > +	int pagemap_fd;
> > +	int nr_pmd_mappings = 0;
> > +	uint64_t categories;
> > +	char *start = addr;
> > +	char *end = start + len;
> > +
> > +	pagemap_fd = open(PAGEMAP_PATH, O_RDONLY);
> > +	if (pagemap_fd < 0)
> > +		ksft_exit_fail_msg("open pagemap fail\n");
> 
> Can we use ksft_exit_fail_perror("open pagemap") here? Will help in
> diagnosing failures as well.

I see thanks!


> 
> Apart from these nits, rest looks good.
> 
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>

-- 
Sincerely,
Yeoreum Yun
