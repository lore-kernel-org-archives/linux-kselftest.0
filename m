Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC57E31F996;
	Tue, 28 Apr 2026 05:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777354344; cv=none; b=RYqtlj3GWMl5MZhyjuKEMYQ1cHVajORtFrNU5PA+0UTDd8ZLC4kNGzu+4iC4LtAWwbTisqW0daSogF889btV8ogL193KSPLnFBjQzueFEX3la/a4G7viCd6dPAtH8rHZfdDUs6ynmPbjz96T9Tev3LjX6DQdGlcF/GpRoCHh7H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777354344; c=relaxed/simple;
	bh=HXD3NULaiKxP74Y+lFSieag6CvNY1MZpZgOjWe+R1wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGLxk9FxiyeBPtdgw2IQapcdW5YnxTRt9/+qe5Xre37xYxZ6aupd9HTedA+Qo5AhQxU6i3H1ovA4oK9/cN+e/iYyS3V+DIe5bqUiCbLkpy/5navnwMzAwRdqYB5bnKkE2FgnPvWpaKtotyw6EoOUb3zjO1QEbTxB7vdwIOGhRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y32+BYhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y32+BYhp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726BCC2BCAF;
	Tue, 28 Apr 2026 05:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777354344;
	bh=HXD3NULaiKxP74Y+lFSieag6CvNY1MZpZgOjWe+R1wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y32+BYhpLkxAHA/bcgUTxiieuu1PslsbFU/zMUGy8nYTLlt9Q+6I/aWw3gMqC7B5F
	 ycCTxavHvZSv6DdBlLhahS5KZLrp3/OE6UwdxJEzIecc7w1CqsWZJL91T7yycgCkV8
	 VcSyCH0G52eeV8a/EZrTsGYU7lJJPnf/7vKsDDnaiDTEZ4qaul+xQuW8LZ69qVZpeC
	 4S/lS1HdjtPO5yOeE034coqTBFlpmBicZlq1OKjj4BaiEYNo1jMpqyd28oWSEImC/O
	 vuA6RnMCpEaomMVvK1fzP3uNSvEt6nGmKl0MZUzmydiNZcW52zm8iTJLMsORgF+MFc
	 QlfCYsUDeRWOQ==
Date: Tue, 28 Apr 2026 07:32:13 +0200
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
Subject: Re: [PATCH v2 31/53] selftests/mm: gup_longterm: add setup of
 HugeTLB pages
Message-ID: <afBGXcA-BeH_KUWN@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-32-rppt@kernel.org>
 <0d52f348-5f4c-4480-b854-6b73ca5ae294@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d52f348-5f4c-4480-b854-6b73ca5ae294@redhat.com>

On Mon, Apr 27, 2026 at 04:10:23PM -0400, Luiz Capitulino wrote:
> On 2026-04-18 06:55, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > gup_longterm tests skips HugeTLB tests if there are no free huge pages
> > prepared by a wrapper script.
> > 
> > Add setup of HugeTLB pages to the test and make sure that the original
> > settings are restored on the test exit.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >   tools/testing/selftests/mm/gup_longterm.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/mm/gup_longterm.c b/tools/testing/selftests/mm/gup_longterm.c
> > index ab4eaf4feb7c..6e1de12bf28c 100644
> > --- a/tools/testing/selftests/mm/gup_longterm.c
> > +++ b/tools/testing/selftests/mm/gup_longterm.c
> > @@ -510,7 +510,7 @@ int main(int argc, char **argv)
> >   	int i;
> >   	pagesize = getpagesize();
> > -	nr_hugetlbsizes = detect_hugetlb_page_sizes(hugetlbsizes,
> > +	nr_hugetlbsizes = hugetlb_setup(2, hugetlbsizes,
> >   						    ARRAY_SIZE(hugetlbsizes));
> 
> Are we missing a call to hugetlb_save_settings()?i

Yes, we are :)

> If yes, should we do it in hugetlb_setup()?

Yep, will add it there.
 
> >   	ksft_print_header();
> 

-- 
Sincerely yours,
Mike.
