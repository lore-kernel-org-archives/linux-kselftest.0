Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23DE35DA6F;
	Mon, 13 Apr 2026 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075717; cv=none; b=i8RURf+lKXKNoacagDjGBIVUJ0Jis9h/zPZF0Ne/RI1OpKtS5PNAxIzYv1xjE7vVSOz0hpr51vGHISjF3GyFA6lgkUdv8HO9om3DybPu0MudAdiQg0Gw3YSZ2bmpgmf9ATKwbJ8ny53fWTCjINb0RjU1Pip1SWklmcJ4g6Kr0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075717; c=relaxed/simple;
	bh=t+dMFyBnXAkPlXEggFipn30qdiXeTcuiAqliSpvpdMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP/gqjO6GKlAQOcgoHve9HuiNX6SOUD2Ob/I1sagWgVHVtdY0O7swtWYNmBymREKLYLr93Tw5Q4i5RyZRFIIk3+eqPILcOVNJJGic9CpXpGakIsZRz4Q2MjFMXXV4grbz8l4w++HqDWBhWgLBbXSa1jkx2pPbJGC89rEdvkHOk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stEoYb+n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stEoYb+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E54CC116C6;
	Mon, 13 Apr 2026 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776075716;
	bh=t+dMFyBnXAkPlXEggFipn30qdiXeTcuiAqliSpvpdMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=stEoYb+ns0AufBnsVRibEZHRF1EpC6N/W7KCj9Z7vEZGK6qTm1KeoNA9LroQFrLwL
	 eZXvB8UGLYyyKvwZRqWEWZO7I39CuclOa+F2Z3ZZb62XMpRjdQKiOGdgr2I+aQ+8Tz
	 PtzdVrZC3ACBktoVFrbwfurITtplb/YaoiRbLujic6xsOTI6RRzpEVg3BW6xoU+qEw
	 JaA5CvnTU5i5MB/q8ytuYxeDa9JDwrazcefDQZY7u7vrssw8+4B9IFBuWw3Y71bGc9
	 8fGwKB+2BosXWU5bieq0x2PyRd8HsyGxGBw0iVkt17aSMzJatUWQOjY0ySFHr1Eazr
	 cEny9gWhmS2AQ==
Date: Mon, 13 Apr 2026 13:21:45 +0300
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
Subject: Re: [PATCH 05/53] selftests/mm: merge map_hugetlb into hugepage-mmap
Message-ID: <adzDuePx9lNthity@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-6-rppt@kernel.org>
 <4e364241-aec6-4d28-a878-4fe25f5fcf44@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e364241-aec6-4d28-a878-4fe25f5fcf44@linux.ibm.com>

Hi,

On Thu, Apr 09, 2026 at 09:35:39PM +0530, Donet Tom wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> 
>     From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
>     Both tests create a hugettlb mapping, fill it with data and verify the
>     data, the only difference is that one uses file-backed memory and another
>     one uses anonymous memory.
> 
>     Merge both tests into a single file.
> 
>     Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>     ---
>      tools/testing/selftests/mm/Makefile        |   1 -
>      tools/testing/selftests/mm/hugepage-mmap.c | 113 ++++++++++++++++-----
>      tools/testing/selftests/mm/map_hugetlb.c   |  88 ----------------
>      tools/testing/selftests/mm/run_vmtests.sh  |   1 -
>      4 files changed, 86 insertions(+), 117 deletions(-)
>      delete mode 100644 tools/testing/selftests/mm/map_hugetlb.c

...

> It looks like mmap_flags and fd are not used in this function.
> 
>     +                     const char *test_name)
>      {
>     +       int flags = MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB;
> 
> 
> The same flags are being used for both file  and anonymous tests . It seems
> that test_file_mmap may be broken.
 
Thanks for catching this. Will fix in the next version.  
 
>             void *addr;
>     -       int fd, ret;
> 

-- 
Sincerely yours,
Mike.
