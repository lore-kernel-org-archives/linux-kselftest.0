Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB88E377EDC;
	Wed,  2 Sep 2026 15:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363197; cv=none; b=DXkmeq4PrPC1k+YzIW3gP8oUnss2K6A3+R75oqKK5Jjhy++2FrdhpTs+n1y7lKF+dhImQ4GkhmDDmMP5f/6c/O22D6s3g7ZtfnvwwxtIFJesx4L2/PksE7AQKw+r5flG8/1GSEgKX92mzx86Ca8Ifl+9ascuwOUwoEzHKF0ZC2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363197; c=relaxed/simple;
	bh=q6zM+dYnk3uLre3h3ADt28YxAVcvVSD58NOOSL5QC9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOGNaeKSEjgqKSg6N21fJ7xhnAXgJipWCZYFKzKk3CyF+yckebErWwrPqvez4j6K2bdfq7uffnIJiu6/iDMFLOMxZm/WEFZ6gRFwi0RB2fPfATlF2+0A4SxIjabXvUVfy5Cd+5+jORMb68+U4YcXL/4aNCxIEbp/nkzExvJR4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WS8Athyv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WS8Athyv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54457165C;
	Wed,  2 Sep 2026 08:33:05 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617873F673;
	Wed,  2 Sep 2026 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788363189; bh=q6zM+dYnk3uLre3h3ADt28YxAVcvVSD58NOOSL5QC9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WS8AthyvSC51Gh9K86037JTsHB1psTeejY/5kultKBFvtj7oe0q+D7TIKNenFT8nc
	 eoFvY/dbmoQu0N0cwiE4XiGbyOAkj/cxXEpIKIIqfUbk4nke4IwKXcWG980TMbr2YN
	 wQ45cdapU18X9zzjx5MKX1qsQ4eFw1qfjjmpCBQI=
Date: Wed, 2 Sep 2026 16:33:04 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
Subject: Re: [PATCH v4 1/3] kselftest: mm: prevent random failure of huge
 page split for khugepaged
Message-ID: <aphBsGKJkpSphK8h@e129823.arm.com>
References: <20260902-fix_split-v4-0-85f03905f7b1@arm.com>
 <20260902-fix_split-v4-1-85f03905f7b1@arm.com>
 <apg7FNLtFO3Ea5qC@gremlin>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apg7FNLtFO3Ea5qC@gremlin>

On Wed, Sep 02, 2026 at 04:15:17PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 02, 2026 at 01:09:35PM +0100, Yeoreum Yun wrote:
> > There're some random failure for split_huge_page_test when khugepaged
> > collapses pages into pmd again which had split by the test.
> >
> > Prevent the khugepaged's collapses for split page by setting the
> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> 
> Maybe worth saying that MADV_NOHUGEPAGE doesn't immediately split anything, just
> prevents future khugepaged collapses?
> 
> >
> > Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> LGTM, thanks, with a few nits above/below (sorry! :P)
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> > ---
> >  tools/testing/selftests/mm/split_huge_page_test.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> > index 86a603692826..4bbad892bc57 100644
> > --- a/tools/testing/selftests/mm/split_huge_page_test.c
> > +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> > @@ -168,6 +168,14 @@ static char *allocate_zero_filled_hugepage(size_t len)
> >  	return result;
> >  }
> >
> > +static void madv_nohuge(void *addr, size_t len)
> 
> Maybe call it disable_khugepaged() to make it explicit that's what this is doing
> rather than eliminating any THP pages in the range?
> 
> > +{
> 
> Maybe a comment here like:
> 
> 	/*
> 	 * Disables khugepaged from collapsing THPs in range, existing THP
> 	 * pages remain.
> 	 */

Okay :) I'll modify in the next-round. Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun
