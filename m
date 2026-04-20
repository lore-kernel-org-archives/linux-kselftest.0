Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69133305968;
	Mon, 20 Apr 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675852; cv=none; b=ocmsn92gnt93IPVIN/mDq7Xtl/DUgHBH0t3vRUXSMYHAWavumOWCORqOAMahh/fzJfCunOT7ObOmqX/+6+h039H0yieCjEAGK/mvRZNH21w3+KrJICDG1SFSg/KsNnjU3M1BmBIjhRmyfY5pQfTx6oZikHTkoe7Ka7yEPPDYXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675852; c=relaxed/simple;
	bh=LvA6yjoRn3XU9vfmaoFuNvn1wjFt/ZCsrwm3PZylO34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPH9I1GMlExf8KW+/un8BfxZ2S24lJzgCXgsVYWAEQMt9UX4fnPxz422gst1mxmIlaf0wotrXCs2rleNMw5XOHbDlkcUgwtkUiAOQkoWoKbfvknTMYwxCWdRm21kwrEQgphuk2Z3tvhwWwHXSyWJNBOkTOzoaSI+axXIhZ/AZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m52YxECK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m52YxECK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684C0C2BCB3;
	Mon, 20 Apr 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776675852;
	bh=LvA6yjoRn3XU9vfmaoFuNvn1wjFt/ZCsrwm3PZylO34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m52YxECKeoX6n/aJd/MQyyLYEDAcDiU6qfah2TRvUf22q5ZtBkCn+PWXjPte4+u8/
	 27IGmc0DuXy7i3061Bvdi6EkS6Y4FPfH/X2H/XBNDTQXJVXeg0X4sf6rsSoFibCuzK
	 vvgmUMiSmWbX4baV3ZUq+wYFxs3MljkZwdbH/jlLXVw/Wt7xcBCz+/ryG/Yvbg0Rwa
	 jtuZWXTs8nKz/PwLrVHFhG9SQeGTJ4bTaL1SQRiUadcIEvKvkmha1/+AmX4vIOWA4M
	 5yF4VjXgionb8tj46hMFgoXdK3ODMbHzMOU28pvxomln5Gj4jkq5N4EFXeGij0heJn
	 jiPG5tPvsk5Ow==
Date: Mon, 20 Apr 2026 12:04:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
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
Subject: Re: [PATCH 02/53] selftests/mm: khugepaged: enable
 collapse_single_pte_entry_compound for shmem
Message-ID: <aeXsAW3kTujGGu2m@kernel.org>
References: <20260406141735.2179309-1-rppt@kernel.org>
 <20260406141735.2179309-3-rppt@kernel.org>
 <a44aa2d7-5eb9-468a-a0ee-ee10b2b73502@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a44aa2d7-5eb9-468a-a0ee-ee10b2b73502@arm.com>

On Mon, Apr 20, 2026 at 12:20:43PM +0530, Sarthak Sharma wrote:
> Hi Mike
> 
> On 4/6/26 7:46 PM, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > A comment in collapse_single_pte_entry_compound() says it can't run on
> > shmem because "MADV_DONTNEED can't evict tmpfs pages".
> > But MADV_REMOVE can!
> > 
> > Use MADV_REMOVE for tmpfs to evict pages and enable
> > collapse_single_pte_entry_compound() test for shmem.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > --->  tools/testing/selftests/mm/khugepaged.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> > index 3fe7ef04ac62..e6fb01ca44ed 100644
> > --- a/tools/testing/selftests/mm/khugepaged.c
> > +++ b/tools/testing/selftests/mm/khugepaged.c
> > @@ -783,20 +783,17 @@ static void collapse_max_ptes_swap(struct collapse_context *c, struct mem_ops *o
> >  
> >  static void collapse_single_pte_entry_compound(struct collapse_context *c, struct mem_ops *ops)
> >  {
> > +	int advise = MADV_DONTNEED;
> >  	void *p;
> >  
> >  	p = alloc_hpage(ops);
> >  
> > -	if (is_tmpfs(ops)) {
> > -		/* MADV_DONTNEED won't evict tmpfs pages */
> > -		printf("tmpfs...");
> > -		skip("Skip");
> > -		goto skip;
> > -	}
> > +	if (is_tmpfs(ops))
> > +		advise = MADV_REMOVE;
> 
> is_tmpfs(ops) will always return false for shmem_ops, since the function
> definition does not handle the shmem_ops case. Therefore, this advise
> will always remain as MADV_DONTNEED.

is_tmpfs() will be true for file ops when file is on tmpfs.
 
> Also, I am able to run the shmem tests using MADV_DONTNEED and the tests
> succeed. So, perhaps we don't need to use MADV_REMOVE in this case?

I read the comment and changed the advice to the one that will actually
evict the pages from the page cache.
Looking closely it this and collapse_max_ptes_none() test, I don't think
presence of the pages in the page cache would somehow affect splitting and
collapsing, so apparently the skips for is_tmpfs() cases can be just
dropped.
 
> >  
> >  	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
> >  	printf("Split huge page leaving single PTE mapping compound page...");
> > -	madvise(p + page_size, hpage_pmd_size - page_size, MADV_DONTNEED);
> > +	madvise(p + page_size, hpage_pmd_size - page_size, advise);
> >  	if (ops->check_huge(p, 0))
> >  		success("OK");
> >  	else
> > @@ -805,7 +802,6 @@ static void collapse_single_pte_entry_compound(struct collapse_context *c, struc
> >  	c->collapse("Collapse PTE table with single PTE mapping compound page",
> >  		    p, 1, ops, true);
> >  	validate_memory(p, 0, page_size);
> > -skip:
> >  	ops->cleanup_area(p, hpage_pmd_size);
> >  }
> >  
> > @@ -1251,8 +1247,10 @@ int main(int argc, char **argv)
> >  
> >  	TEST(collapse_single_pte_entry_compound, khugepaged_context, anon_ops);
> >  	TEST(collapse_single_pte_entry_compound, khugepaged_context, file_ops);
> > +	TEST(collapse_single_pte_entry_compound, khugepaged_context, shmem_ops);
> >  	TEST(collapse_single_pte_entry_compound, madvise_context, anon_ops);
> >  	TEST(collapse_single_pte_entry_compound, madvise_context, file_ops);
> > +	TEST(collapse_single_pte_entry_compound, madvise_context, shmem_ops);
> >  
> >  	TEST(collapse_full_of_compound, khugepaged_context, anon_ops);
> >  	TEST(collapse_full_of_compound, khugepaged_context, file_ops);
> 

-- 
Sincerely yours,
Mike.
