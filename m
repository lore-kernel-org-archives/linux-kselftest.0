Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBABB3BBA17;
	Mon, 13 Apr 2026 10:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075360; cv=none; b=cxw4TV64TFcwLHazvFhW/tx8cOFnPOnaub5O/7IefRw03pK3vJvmseVNP47thtTe5KtWG7ZtHZJ2NM/WyXF1/1dyY5iltUtoLxsmYalhdZuDxaGho9iFFetS0xRtNcMl6hXO9I7x0lcf/VZkyVu1BAWywlXtJAh4W1Ic3xab04c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075360; c=relaxed/simple;
	bh=WuSoh5LS4xEsI7eAfjQ1JQLSBktdnQPu5LABtmynld8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6PxwaIOD3574CP70gNhxh1pEWNou0J3kbyO+l5gPZeXthcsKkW5WhUYhrvYXS5gJXF81TGDkxBbkjVfbHmgim3LB1z3fdpxwBu2agWnweH64D5R9nVPttjv4gfwaPOx0bBhZABtE1PR6X/fqF+G+itxzlUwLIBARU+Lod6bLTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sG2pVL/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sG2pVL/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2B5C116C6;
	Mon, 13 Apr 2026 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776075360;
	bh=WuSoh5LS4xEsI7eAfjQ1JQLSBktdnQPu5LABtmynld8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sG2pVL/Uz5VVlNmWIjXT0VVHqNFEJ0amY1aaP6qDrMaoR4TyJSLJ7glczjeoJnOow
	 W89+4RsdWz3Ue/Lq3azXF/53srogqmzVxm9FJ9ZD3+d0JE2EjPVY1argx9UxXzT+uG
	 2SN8794oRdeBLLVozj2w6t9sQGr3B9EyHrrvpZyFManGVrxaFFqRy82vOHb+VssNOo
	 aEqHsRClM6mVrlYsoQUbdEgcfiWcA5IYb2J9j2cBeKQvEYHXCHKEoeO+Lmixe5PAch
	 a0vLaWLkLvYzCVvZBio2CDGohQaFp98NkJD09RlFcvua1D1OdF0m0+w3Keaw2oASEi
	 jDxG0Kcqc/0FQ==
Date: Mon, 13 Apr 2026 13:15:49 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 06/53] selftests/mm: rename hugepage-* tests to hugetlb-*
Message-ID: <adzCVS3M7eJJU-T5@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-7-rppt@kernel.org>
 <13213d74-da49-45e0-bfb2-c2257a20991a@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13213d74-da49-45e0-bfb2-c2257a20991a@linux.ibm.com>

Hi,

On Thu, Apr 09, 2026 at 03:03:51PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> 
>     From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
>     hugepage could mean both THP and HugeTLB these days.
> 
>     Rename hugepage-* tests for HugeTLB to hugetlb-* to avoid confusion.
> 
>     Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>     ---
>      tools/testing/selftests/mm/.gitignore                     | 4 ++++
>      tools/testing/selftests/mm/Makefile                       | 8 ++++----
>      tools/testing/selftests/mm/hugetlb-madvise.c              | 2 +-
>      .../selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c}      | 2 +-
>      .../selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c}  | 2 +-
>      .../selftests/mm/{hugepage-shm.c => hugetlb-shm.c}        | 2 +-
>      .../mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c}          | 0
>      tools/testing/selftests/mm/run_vmtests.sh                 | 8 ++++----
>      8 files changed, 16 insertions(+), 12 deletions(-)
>      rename tools/testing/selftests/mm/{hugepage-mmap.c => hugetlb-mmap.c} (99%)
>      rename tools/testing/selftests/mm/{hugepage-mremap.c => hugetlb-mremap.c} (99%)
>      rename tools/testing/selftests/mm/{hugepage-shm.c => hugetlb-shm.c} (99%)
>      rename tools/testing/selftests/mm/{hugepage-vmemmap.c => hugetlb-vmemmap.c} (100%)
> 
>     diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
>     index b0c30c5ee9e3..9ccd9e1447e6 100644
>     --- a/tools/testing/selftests/mm/.gitignore
>     +++ b/tools/testing/selftests/mm/.gitignore
>     @@ -4,6 +4,10 @@ hugepage-mmap
>      hugepage-mremap
>      hugepage-shm
>      hugepage-vmemmap
> 
> Should we consider removing this from .gitignore? Otherwise, this looks good to
> me.

A while ago Linus objected to removing selftest binaries from .gitignore,
can't find lore link right now.
 
> Reviewed by: Donet Tom <donettom@linux.ibm.com>

Thanks!
 
> -Donet

-- 
Sincerely yours,
Mike.
