Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DA33815C7;
	Mon, 11 May 2026 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487921; cv=none; b=ixi4LD9fscoWBv1GMEEPV9mkeYMo6E4uPeplXvzMCxi1e1jB+msTJNUF5dFrlbRaLlqh7r1tIxGOeKUQ1nr3Qu8VnGP61B1zyxfS5/gmEqPVAjZbDvvY5FIvzNWtLD2lbf7gjjzHMzMR+Ird6KxSkNgIWfKQKwFMQWvBzWKYPPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487921; c=relaxed/simple;
	bh=kZjuknJM9Bh3GaMJvk4tQSd2Zw2bmhiR+3ExpTU4yQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIeeC6pQGMHz+SrOCsIgvqzQ3tpU0Wy4rBo1oaG8igwQ+G4Ge4yzYL1Odnvls86vq4T8kI4zcYPPYOkOBWXYIA6Jm64RE1Qm+ugVnlmu36BN70CMaMpdA5YtLoKG42TdGeno2ry1Zm4Zzu1ONdMb1/VMF4c7Sfh7b1pg7LhZou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RITApxZ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RITApxZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B477C2BCB0;
	Mon, 11 May 2026 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778487918;
	bh=kZjuknJM9Bh3GaMJvk4tQSd2Zw2bmhiR+3ExpTU4yQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RITApxZ2l/xhtczLejOGUSd1hbI7T05edXZfB7OGviYnHxtN/LwlBnlPlLAowmI4H
	 PsZz2+SaBqauLi6jGIAMk5FuEdN8xsdoef2zPNgCwZ64mPyLeEX/mCxKU8ONxL67qG
	 /0+fOq0VrHERuATufi9HUOIvd/VbLC9YfGsfEUM99Qdi+kjIGL009pvbnKH05midKX
	 zHnhxhiIBYy/Zty5elTF5ryaBXUXlWdGjIg41DxP3NOM47Y9TlUZU/8jTGioE1iRRG
	 y6/rJB+3vrFxf4LBC8o/JE4/oIcOAobjKNWpCajgbLjbDTHuCSM+b2ccxVXxuyPlYY
	 8DyFzM4kVQmcw==
Date: Mon, 11 May 2026 11:25:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Barry Song <baohua@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Donet Tom <donettom@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lance Yang <lance.yang@linux.dev>,
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>,
	Mark Brown <broonie@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Nico Pache <npache@redhat.com>, Peter Xu <peterx@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 35/54] selftests/mm: hugepage_dio: add setup of
 HugeTLB pages
Message-ID: <agGSYxlShNEbcTbW@kernel.org>
References: <20260428204240.1924129-1-rppt@kernel.org>
 <20260428204240.1924129-36-rppt@kernel.org>
 <ae5882a8-7cf9-46cb-a1ac-d04f501e2e62@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae5882a8-7cf9-46cb-a1ac-d04f501e2e62@arm.com>

Hi Sarthak,

On Mon, May 04, 2026 at 05:50:06PM +0530, Sarthak Sharma wrote:
> On 4/29/26 2:12 AM, Mike Rapoport wrote:
> > @@ -141,8 +135,8 @@ int main(void)
> >  
> >  	ksft_print_header();
> >  
> > -	/* Check if huge pages are free */
> > -	if (!hugetlb_free_default_pages())
> > +	/* request a huge page */
> > +	if (!hugetlb_setup_default(1))
> >  		ksft_exit_skip("No free hugepage, exiting\n");
> 
> Before applying the patch, I get the following output:
> 
> TAP version 13
> 1..4
> # No. Free pages before allocation : 112
> # No. Free pages after munmap : 112
> ok 1 free huge pages from 0-12288
> # No. Free pages before allocation : 112
> # No. Free pages after munmap : 112
> ok 2 free huge pages from 0-10240
> # No. Free pages before allocation : 112
> # No. Free pages after munmap : 112
> ok 3 free huge pages from 2048-12288
> # No. Free pages before allocation : 112
> # No. Free pages after munmap : 112
> ok 4 free huge pages from 2048-14336
> # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> After applying the patch, I get this:
> 
> TAP version 13
> # [INFO] detected hugetlb page size: 2048 KiB
> # [INFO] detected hugetlb page size: 32768 KiB
> # [INFO] detected hugetlb page size: 64 KiB
> # [INFO] detected hugetlb page size: 1048576 KiB
> 1..0 # SKIP No free hugepage, exiting
> 
> even when I have 112 free and 128 total hugepages of size 2MB (default
> for my system).
> 
> Could it be because hugetlb_setup_default(1) here is trying to set the
> default hugetlb pool size to exactly 1, and then checking whether there
> is exactly 1 free hugepage, instead of simply checking whether at least
> 1 free hugepage is available?

I'm going to update hugetlb_setup_default() to check if there are enough
free huge pages and add more if necessary and I will add
hugetlb_setup_default_exact() for tests that require exact number of huge
pages.
 
> >  
> >  	fd = open("/tmp", O_TMPFILE | O_RDWR | O_DIRECT, 0664);
> 

-- 
Sincerely yours,
Mike.
