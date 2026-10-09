Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943223BB12C;
	Fri,  9 Oct 2026 17:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565375; cv=none; b=OjednVEtZqsPPRTG1OmidPGmD5SvxIQa5gotj9G7VXJHgkqB6V2XkPRxkfZbXUzodSM4monxW17uYKYOONpGKWFrfwQfQNFyBPMF5WnHNT9cOllXey62alEsZRuOQXcBHtioHqSmVpkb1KOkVa6V8by91ScZx9yX+pqY3CTBQg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565375; c=relaxed/simple;
	bh=uyHsi96tpPzqM21e64F/D77H0VckKgQCdvx4z3wrEoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3vE/6qYUVSSi6OOOz3cu1I9gvPUBTvU/YHhHJOF3v8A2GXt2h/vcfbGwvBmDTC9ZdaWx4Q7zpHHaPzyR6TeIAhbD2KfjqQKU/VHdDyWffzENizj6HmdVX9bzc65BGI2EE0ryvGqABzZs+0G1pqc4MtqTTUUzFHDQGlVMH4axsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Myx2bn74; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Myx2bn74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB371F000FF;
	Fri,  9 Oct 2026 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565368;
	bh=iltjMudktSKE0S1aNS7P4FmpXghrJyhu3qRFPuHuB7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Myx2bn74+CsGe4sqlIoDeAr2FIBxitw6YYY5cf1fOeSsoLVf0DMU868xrHnLdckDk
	 SEwaCRhAhlp91jqlvRxC0o8GY2X6i7SoQ7V2a85+BfDoNSHsiYNFc/mAc8ZkbQ8m0q
	 RcT/VJ85hP450jqxyz8+DJJPbsyilif4e1uIapHpH15EIxIM92Y/clfpnnvBJQe7ZH
	 BkC0Ao7TWzPrXciX/52QH6HsmsKnsaoF3R+sFr4U1R7VxY9A/2JU6Y/P9fOAgQFREL
	 7OSyoMEbjKV+/WC42yi+AT1fv/wXaQePKHtNzOuIvbhpNOFwVtPTfuZXo3hEcqw7H1
	 4WZITcxY8fzkw==
Date: Fri, 9 Oct 2026 19:02:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v5 1/3] kselftest: mm: rename read_pmd_pagesize() to
 pmd_psize()
Message-ID: <askeLm-15RSm6zE2@kernel.org>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
 <20261009-fix_hpage_macro-v5-1-54378ae45add@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fix_hpage_macro-v5-1-54378ae45add@arm.com>

On Fri, Oct 09, 2026 at 02:27:32AM +0100, Yeoreum Yun wrote:
> For consistency with psize(), rename read_pmd_pagesize() to
> pmd_psize(). There is no functional change.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/cow.c                   |  2 +-
>  tools/testing/selftests/mm/folio_split_race_test.c |  2 +-
>  tools/testing/selftests/mm/hmm-tests.c             | 22 +++++++++++-----------
>  tools/testing/selftests/mm/khugepaged.c            |  2 +-
>  tools/testing/selftests/mm/khugepaged_race.c       |  2 +-
>  tools/testing/selftests/mm/khugepaged_sync_check.c |  2 +-
>  tools/testing/selftests/mm/migration.c             |  4 ++--
>  tools/testing/selftests/mm/mkdirty.c               |  2 +-
>  tools/testing/selftests/mm/pagemap_ioctl.c         |  2 +-
>  tools/testing/selftests/mm/prctl_thp_disable.c     |  4 ++--
>  tools/testing/selftests/mm/process_madv.c          |  2 +-
>  tools/testing/selftests/mm/soft-dirty.c            |  2 +-
>  tools/testing/selftests/mm/split_huge_page_test.c  |  2 +-
>  tools/testing/selftests/mm/uffd-common.c           |  6 +++---
>  tools/testing/selftests/mm/uffd-unit-tests.c       |  8 ++++----
>  tools/testing/selftests/mm/uffd-wp-mremap.c        |  2 +-
>  tools/testing/selftests/mm/vm_util.c               |  4 ++--
>  tools/testing/selftests/mm/vm_util.h               |  2 +-
>  18 files changed, 36 insertions(+), 36 deletions(-)

-- 
Sincerely yours,
Mike.
