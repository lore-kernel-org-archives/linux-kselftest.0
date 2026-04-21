Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40815175A6D;
	Tue, 21 Apr 2026 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776756312; cv=none; b=VM1nYehBatrWJ/OeQ9kWS8011UgGz6cAUkV7rntV4zyt6zs8YmMxk6IZKENs2jE2kZgNRZ37Jr7X9LWYxRmld/iHmODeCClDHhyuzY86RY94iOAUoH+6pnYojfu1Y2SoW8U97U/76r18LKIFP2hjBvwSlsG5tBUxseL9wiFbzik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776756312; c=relaxed/simple;
	bh=plEh598qh3qqk54SU3Ya8nDC15W8+JoFU/NOjYwa1eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7Nb8RVYfefDyy9j1x6XXlmiFYU8NgbA2SqxV3EIQDPB7j6yxHGQ8V2zBF02KuZd3GVhSzoFHQId2GzECnBhWvCFSDREEI7oN4M/jnjrm73O63cW7mC/aEdmzZ+hjApasdMnm9WiUOvSRV9UAnNaSKnmuF2Q0LMwoLRx49JNm20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8nTJuu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8nTJuu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DB7C2BCB0;
	Tue, 21 Apr 2026 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776756311;
	bh=plEh598qh3qqk54SU3Ya8nDC15W8+JoFU/NOjYwa1eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8nTJuu2oMi4lJ75x9Q956MeJBePyfguSJ/RBSrTQ25Gt3s5ppxbBH80i7oy3dj3K
	 RbWTsqfs1gNdDvPBMn2uwP/dVlzTjk0Uwz3+m7kiHBEhlPkHkErE6EF5ibTyF4wLh5
	 h56UCXxavN2VNpLCYOobQw52PzrhOeaWDJEPBx2JNO+5eq3TxgJEiMr0yotCaIdqKw
	 MAsEDAYhcJjuLFE12rmP0VTrtusDg8YKcKYqQ2SKVPOjTXttTnC/bbNTEdlMvZgXuj
	 Re2OrpiS6J38RE2T/8UB1AKI+dBp2zTIz7O6t3JNAntGr80mm4P32UoSxH/MWZNvJP
	 8ZpRHsQ6eFJNA==
Date: Tue, 21 Apr 2026 10:25:02 +0300
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
	Ryan Roberts <ryan.roberts@arm.com>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 05/53] selftests/mm: merge map_hugetlb into
 hugepage-mmap
Message-ID: <aecmTjikgWAvoYTE@kernel.org>
References: <20260418105539.1261536-1-rppt@kernel.org>
 <20260418105539.1261536-6-rppt@kernel.org>
 <5e4fa215-224c-43cf-a0e6-0d91e09a4a3b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e4fa215-224c-43cf-a0e6-0d91e09a4a3b@linux.ibm.com>

Hi Donet,

On Mon, Apr 20, 2026 at 02:50:49PM +0530, Donet Tom wrote:
> On 4/18/26 4:24 PM, Mike Rapoport wrote:
> >
> > +static void test_file_mmap(size_t length, int shift)
> > +{
> > +	const char *test_name = "hugetlb file mmap";
> > +	int mmap_flags = MAP_SHARED;
> > +	bool passed;
> > +	int fd;
> > +
> > +	if (shift)
> > +		mmap_flags |= (shift & MAP_HUGE_MASK) << MAP_HUGE_SHIFT;
> 
> From what I understand, selecting an alternative huge page size using mmap
> flags is typically used along with MAP_HUGETLB. Since we are not using
> MAP_HUGETLB, would this code still be necessary? please let me know if I
> might be missing something.
> 
> 
> 
> > -	fd = memfd_create("hugepage-mmap", MFD_HUGETLB);
> > +	fd = memfd_create("hugetlb-mmap", MFD_HUGETLB);
> > 
> In my test, the default huge page size is 2MB. I passed a shift value of 30
> (for 1GB huge pages), but the mmap call failed — To support 1GB huge page
> sizes on a system with a 2MB default huge page size, I used MFD_HUGETLB |
> MFD_HUGE_1GB. With this change, file-backed mmap using 1GB huge pages
> started working. Do you think this change would be needed?

Yes, I'll update the test to use proper MFD_ flags. Then mmap_flags change
won't be needed.

Thanks for spotting this!
 
> -Donet
> 

-- 
Sincerely yours,
Mike.
