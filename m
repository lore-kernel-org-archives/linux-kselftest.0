Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1901F2380;
	Thu, 14 May 2026 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754409; cv=none; b=K7iDSu5aPBOcq3/gygouEjzywcPcOeqz2PeM9v5ALpVYpz64x8XXK+aaQOmA/TWI9ZV5DA2pPr+h5vc/lbZFIhJkFqx5Nf6Ue7Ty5+AhWqP1/taj3ETEEhOIatUm0oyXzS0Viu0cxFfmoG2ZeIjB/9KZElCLViGTlZD6bSA42/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754409; c=relaxed/simple;
	bh=yI0AVKoI2bMfRl+o+LGYeYWOpoh1qRXG1ugi4tFJvZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLLjbFQapHUbk5VYIVQV2NPC8nLG6ucqeXgEPzdgO32RThbv6ZVgJcJoWLPE183rUTJmBV8mkyZSPDG6lDGWTn6rHNE02SmXa5gbid3l7JaCd6rdywFjm1Zl7cf6TDH2VlaAXbiSKevMM5W8zA8q049d8nsfJlUiYOPhbVxW2Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k53Afmq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k53Afmq4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5E4C2BCB3;
	Thu, 14 May 2026 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754409;
	bh=yI0AVKoI2bMfRl+o+LGYeYWOpoh1qRXG1ugi4tFJvZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k53Afmq4bnnoAwz5A0yxAX8gAFwPUFDRHN3ai0uBVL/s4VQjrqi6+HT3LLXM5ejNP
	 KbZyRBz+CY1oauNPyq2cyCwAi6yz2pWR8SUWuxiYYYYuNqL2nTqXn3p2aOvdTKNPOY
	 VNxIjY1TM4PTmtuapTf+OI2b/rFq3E6SbkoFvW7MJcyKiV1rGIc9JnQHO7aXn43/gb
	 DKHjB1F4i+58E5BG9Gfzf1GTADwb767FNXstGOmEtyuaQEJ9MXui4lTfMvqB7SFDcg
	 iZwyKI/UN4GzpRPNT2uBJYeJImy/N4vgxCvKHEjwXV8azn8G2x/j3/twcJeJk010xy
	 9Wlz60HUysMTg==
Date: Thu, 14 May 2026 13:26:36 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>, Li Wang <li.wang@linux.dev>,
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
Subject: Re: [PATCH v4 28/55] selftests/mm: hugepage_settings: add APIs for
 HugeTLB setup and teardown
Message-ID: <agWjXHKrNruVGE3O@kernel.org>
References: <20260511162840.375890-1-rppt@kernel.org>
 <20260511162840.375890-29-rppt@kernel.org>
 <635a6440-9339-49fb-ad9b-ee2f4b285ef6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <635a6440-9339-49fb-ad9b-ee2f4b285ef6@redhat.com>

Hi Luiz,

On Wed, May 13, 2026 at 03:50:39PM -0400, Luiz Capitulino wrote:
> On 2026-05-11 12:28, Mike Rapoport wrote:
> > +static bool __hugetlb_setup(unsigned long size, unsigned long nr)
> > +{
> > +	unsigned long free = hugetlb_free_pages(size);
> > +	unsigned long total = hugetlb_nr_pages(size);
> > +
> > +	if (free >= nr)
> > +		return true;
> > +
> > +	hugetlb_set_nr_pages(size, total + (nr - free));
> 
> We're using 'total' to preserve the HugeTLB reservation that's already
> there, right? I guess this won't have the desirable effect because the
> tests calling hugetlb_setup_default_exact() will override this anyways.

Even the tests that call hugetlb_setup_default_exact() restore the
original settings, so if there were N huge pages and all of them are free,
after the test we still will have N huge pages.
And if there are already allocated huge pages, tests that require an exact
number of huge pages will skip.

And if all the tests run sequentially in a clean environment it wouldn't
matter. 
 
> Having said that, this is just a minor nit and not a bug, so:
> 
> Reviewed-by: Luiz Capitulino <luizcap@redhat.com>

Thanks!
 
-- 
Sincerely yours,
Mike.
