Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9AF155C97;
	Sat,  2 May 2026 04:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777696612; cv=none; b=pY0gzbclQly8l5HYsC3yepn7n5g+SgZ3czlx6XFnzovyy+t616Yz4pdjTobxGjXfFAya3jgaEY9UlFjjWlHwVCSPwIDtWNdLSeEQUNo3lBpz5IPj5gv9mMPqjRe1tsFOF2rOs8XzSz82hfUQdo45cDr6+Ep71TilpfkF+7sBAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777696612; c=relaxed/simple;
	bh=zolhHJ2pt/HuMbYoWDKt/Qpf9wHLyNZaEq9WM6A8T/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3+h7AIjTHtu1thpvcGdnC7r14TZW0CS5JmlZ3GNP2Ox++mlgDnYRhV62M5jQJedzKjY/We60ycAi8Wy/G9p4Z03yl+viCYIjDWUzyO+BkxCdlQSEKvCd2hP3V2TScs2zRbwMHOSJnyiSLdml6nQR7TlAsnygmUAKCEjHdkL1HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khUhouRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khUhouRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEFFC19425;
	Sat,  2 May 2026 04:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777696612;
	bh=zolhHJ2pt/HuMbYoWDKt/Qpf9wHLyNZaEq9WM6A8T/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khUhouRHFXetPZownjlJj4oZgiqqxHq+Ezb6aMBWxNmAbbyg2CSseLu7M8Of9wTIi
	 8ZPeDIjrC6Cjg9VPAAoQ5Xaa5hTvSsVi6BAkLQAh/umFl8x3zj/K6yEx1v6m/p6yZb
	 92JpBKWi3CxecuI1V+J6sseusteO1FdkC6PDdfVepJkiXNfT2uTyd3QGQ0Hu+zbAQv
	 r7/rL9EzUinG9AlODzSgPoPz4YVVk2IoKuDDzABQgRAod8pHNDt7X65Ftbx6Z2RPzI
	 Nxunz0hzvDIvYkrDauANYBwzAwEztwr+qTC3OoVaJga4y75klCQ/vJd+Dk2P868q6y
	 kr8q/ZkoNIj3A==
Date: Sat, 2 May 2026 06:36:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 27/54] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
Message-ID: <afV_WAK56lQKn_z1@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-28-rppt@kernel.org>
 <2f443474-4448-462e-bc1e-55bc657d70ba@redhat.com>
 <afTF9RCy8eBoWYaj@kernel.org>
 <22b1cadc-4b0d-4e2a-987c-e7a7bc2265eb@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22b1cadc-4b0d-4e2a-987c-e7a7bc2265eb@redhat.com>

On Fri, May 01, 2026 at 03:30:18PM -0400, Luiz Capitulino wrote:
> On 2026-05-01 11:25, Mike Rapoport wrote:
> > > >    	return mode == 1 || mode == 3;
> > > >    }
> > > > +#define HUGETLB_MAX_NR_PAGESIZES 10
> > > > +struct hugetlb_settings {
> > > > +	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
> > > 
> > > It looks like we don't actually use this in the API or maybe I'm missing
> > > something?
> > 
> > Yes, it's used only in later patches.
> 
> I don't see it, the patch below builds fine (again, sorry in advance if
> I'm missing something obvious):

You are right, I misunderstood you comment and I thought you referred to
entire API being unused in this patch.

free_hugepages is not used and it should not be a part of the saved state.
 
> diff --git a/tools/testing/selftests/mm/hugepage_settings.c b/tools/testing/selftests/mm/hugepage_settings.c
> index 097ba085f423..a023cfeb69c5 100644
> --- a/tools/testing/selftests/mm/hugepage_settings.c
> +++ b/tools/testing/selftests/mm/hugepage_settings.c
> @@ -341,7 +341,6 @@ bool thp_is_enabled(void)
>  #define HUGETLB_MAX_NR_PAGESIZES 10
>  struct hugetlb_settings {
> -	unsigned long free_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>  	unsigned long nr_hugepages[HUGETLB_MAX_NR_PAGESIZES];
>  	unsigned long sizes[HUGETLB_MAX_NR_PAGESIZES];
>  	unsigned long default_size;
> @@ -509,7 +508,6 @@ static void __hugetlb_save_settings(void)
>  		if (!sz)
>  			continue;
> -		settings->free_hugepages[i] = hugetlb_free_pages(sz);
>  		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
>  	}
> 
> > I felt it would be too churny to add users in this patch.
> > > Otherwise, the API looks great to me. But if you allow me to bikeshed :)
> > > 
> > > I think I'd do:
> > > 
> > > struct hugetlb_state {
> > > 	unsigned long nr_hugepages;
> > > 	unsigned long size;
> > > };
> > > 
> > > struct hugetlb_settings {
> > > 	struct hugetlb_state hstate[HUGETLB_MAX_PAGESIZES];
> > > 	unsigned long default_size;
> > > 	int nr_sizes;
> > > };
> > 
> > It might be slightly nicer abstraction but ...
> > > > +static void __hugetlb_save_settings(void)
> > > > +{
> > > > +	struct hugetlb_settings *settings = &hugetlb_saved_settings;
> > > > +	int nr_sizes;
> > > > +
> > > > +	settings->default_size = default_huge_page_size();
> > > > +	if (!settings->default_size)
> > > > +		return;
> > > > +
> > > > +	nr_sizes = detect_hugetlb_page_sizes(settings->sizes,
> > > > +					     HUGETLB_MAX_NR_PAGESIZES);
> > 
> > ... this immediately becomes more complex.
> > 
> > > > +	if (!nr_sizes) {
> > > > +		settings->default_size = 0;
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	for (int i = 0; i < nr_sizes; i++) {
> > > > +		unsigned long sz = settings->sizes[i];
> > > > +
> > > > +		if (!sz)
> > > > +			continue;
> > > > +
> > > > +		settings->free_hugepages[i] = hugetlb_free_pages(sz);
> > > > +		settings->nr_hugepages[i] = hugetlb_nr_pages(sz);
> > 
> > And this as well.
> 
> We'd need a little more code to handle those cases, may or may not be
> worth it. But enough bikesheding from my side :) the series is great as
> is.
> 
> 

-- 
Sincerely yours,
Mike.
