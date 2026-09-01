Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749CA46C855;
	Tue,  1 Sep 2026 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249990; cv=none; b=maSixx0pPOQNNsIvKieQpKjyakaVX/wXaTmah+sdF+v3nMsm8jZRhRtFgItmEKZp3OEYrcl5pVIB4KZGDxp+kkrIHyt4arUcUHWTwJzuRohc3ss5RXN1/z0KZDTaCkntdpqdfhSrkagNU6Q+aXKSc8TMv6+5/1yFOmo60tCcdL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249990; c=relaxed/simple;
	bh=6jocrZ8BWtYGm87yBooi0QYPtq263J2v+Y3UsEtP2Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3ztBmnYMkhwqt1GaUs6Duu70PjJphttsgq9s/p6ZQ03DJWb1Fql6PPu1IMbifSdAmXK10ZVAbvVoNORkOLZZIiNO8ngSSub9iGm62bO/ckqin7R7Cw9RLWtFhyjw8MhMkCAQS6aJhQhWBAhUjKR3VvU5GJpR7U3pKb3xPor+rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qSrnwwCg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qSrnwwCg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2ACE51756;
	Tue,  1 Sep 2026 01:06:21 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4139A3F882;
	Tue,  1 Sep 2026 01:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788249984; bh=6jocrZ8BWtYGm87yBooi0QYPtq263J2v+Y3UsEtP2Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qSrnwwCgSNAk6gZGaTF4+LjyRGLWI1VKPsqwSCxRzooIoQdXp+IjgAYWi5CKwILl6
	 kfrGSp++BQwo7Mx3G93jNN9Yrzw6Ef6jqaRfP4PHZrzdlujsywMIInxMng3joLKYfh
	 hAEDxEGDMeToqCAIlCYW1lZqTG0vOk0iZCL7hINY=
Date: Tue, 1 Sep 2026 09:06:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
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
Subject: Re: [PATCH v3 2/2] kselftest: mm: replace usage of /proc/self/smaps
 for check_huge_xxx() helper
Message-ID: <apaHexgq0pYduNq8@e129823.arm.com>
References: <20260828-fix_split-v3-0-374022586a4b@arm.com>
 <20260828-fix_split-v3-2-374022586a4b@arm.com>
 <f9ae614f-beef-4e83-b307-d4e743d7062c@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9ae614f-beef-4e83-b307-d4e743d7062c@linux.alibaba.com>

On Mon, Aug 31, 2026 at 03:58:18PM +0800, Baolin Wang wrote:
> 
> 
> On 8/28/26 4:11 PM, Yeoreum Yun wrote:
> > Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
> > glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
> > made by memalign().
> > 
> > The underlying VMA may start at a different address from the aligned
> > address returned by memalign(). Furthermore, a subsequent
> > madvise(MADV_HUGEPAGE) call does not split the VMA because the flag is
> > already set.
> > 
> > This causes split_huge_page_test to fail because the check_huge_xxx()
> > helpers incorrectly require the address returned by memalign() to
> > match the VMA start address reported in /proc/self/smaps.
> > 
> > Fix this by using /proc/self/pagemap and /proc/kpageflags instead of
> > /proc/self/smaps to detect huge pages.
> > 
> > Reported-by: David Hildenbrand (Arm) <david@kernel.org>
> > Suggested-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> 
> LGTM, with comments from Lorenzo and Zi addressed.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks!

-- 
Sincerely,
Yeoreum Yun
