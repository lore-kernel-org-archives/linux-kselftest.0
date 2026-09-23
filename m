Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEA71A6838;
	Wed, 23 Sep 2026 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160904; cv=none; b=Jq5Pn/eb7kWHbdoveaNUy6eue0q679aV8etnGeVSy7qPz7/TawOdDZFzKn81xAnhpNzpJ+c8qITvfvjNGH2CiiDLsfN+ctB+dFGL/6fd9luj1Tq1owrsMxMIw7U+k5onZ1EPt9mmgq7cAUZSO6eT63I5rkqZrPk5P5yna1ll98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160904; c=relaxed/simple;
	bh=BpeVTxo8pLgcSW2YiS7/ckITm/ybEWASP4RjJ0ASVmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIACi8GGDuM6iOmQF3agA1qC9iHOjm9ZT1YChyfndqG2FMFObuqWmSEVMNxuoDaGMbnjsulz0TvNH3emS6E8z/UxdcN7AbQXlllcAPqfdvm2wj83w9d6ViR0rYO7gsk3mXljbHOGfbqgpF0cuq+68hmdixwnEU201kDvOW4hiIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rs5p7XvF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rs5p7XvF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F41D143D;
	Wed, 23 Sep 2026 03:54:53 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81FC73F86C;
	Wed, 23 Sep 2026 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790160897; bh=BpeVTxo8pLgcSW2YiS7/ckITm/ybEWASP4RjJ0ASVmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rs5p7XvF0Ft9Yi/Fzm0XXqA8PO/mRcv3yu9ouhDSO04aqTZP1c24oOzVwgTG084jT
	 W1TCTnDKzI8Sfnm8WWWg2tqspjmLG+ZY/T26c8B7xF/1xISdWOmkvC8nX46uLjhB8C
	 vZIKo6RWhnv/8GyzOFnVvMpThvouKE48FnMRJpLo=
Date: Wed, 23 Sep 2026 11:54:52 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v2 2/2] kselftest: mm: fix intermittent failure
 khugepaged test
Message-ID: <arOv_EFOPg0HwBk5@e129823.arm.com>
References: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
 <20260921-fix_khugepagd_fail-v2-2-3c2877beef61@arm.com>
 <6cc12fe6-4f2f-47b6-b821-8a507eb80b46@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cc12fe6-4f2f-47b6-b821-8a507eb80b46@linux.alibaba.com>

> 
> 
> On 9/21/26 6:35 PM, Yeoreum Yun wrote:
> > There are intermittent failures in collapse_max_ptes_swap() and
> > collapse_max_ptes_shared() when using the khugepaged_context:
> > 
> >    // while running ./khugepaged -s 2
> > 
> >    # Run test: collapse_max_ptes_shared (khugepaged:anon)
> >    # Allocate huge page... OK
> >    # Share huge page over fork()... OK
> >    # Trigger CoW on page 1023 of 2048... OK
> >    # Maybe collapse with max_ptes_shared exceeded.... OK
> >    # Trigger CoW on page 1024 of 2048... Fail
> >    Bail out! Unexpected huge page
> >    # Planned tests != run tests (26 != 23)
> >    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> >    # Run test: collapse_max_ptes_swap (khugepaged:anon)
> >    # Swapout 257 of 2048 pages... OK
> >    # Maybe collapse with max_ptes_swap exceeded.... OK
> >    # Swapout 256 of 2048 pages... OK
> >    Bail out! Unexpected huge page
> >    # Planned tests != run tests (26 != 17)
> >    # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > This happens because khugepaged may collapse the pages before wait_for_scan()
> > is called, causing a sanity check that expects uncollapsed pages to fail.
> > 
> > For example, in collapse_max_ptes_swap(), after faulting the pages back in
> > and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> > before c->collapse() is called.
> > 
> > To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
> > collapsed by wait_for_scan() for anon. This prevents khugepaged from
> > collapsing it again before c->collapse() is called.
> > 
> > This failure was observed on NVIDIA Spark with 16KB page.
> > 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >   tools/testing/selftests/mm/khugepaged.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> > index c32244b565658..1aad4bb427ece 100644
> > --- a/tools/testing/selftests/mm/khugepaged.c
> > +++ b/tools/testing/selftests/mm/khugepaged.c
> > @@ -578,6 +578,9 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
> >   		usleep(TICK);
> >   	}
> > +	if (!strncmp(ops->name, "anon", 4))
> 
> We usually use the 'if (ops == &__anon_ops)' check in this file to identify
> anonymous test cases.
> 
> With that, LGTM.
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>

I think this is merged at mm/mm-unstable already So, I'll send
another patch to change it with is_anon().

Thanks!

-- 
Sincerely,
Yeoreum Yun
