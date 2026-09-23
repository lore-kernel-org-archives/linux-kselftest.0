Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CB43F410D;
	Wed, 23 Sep 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158200; cv=none; b=I7H5Ew+ROrVEAX4tA+Saa/VvBL61Q1RXjihxKhF3Z++a6GcgRttzZ05XtzR+bYhJG073ezzRQH5BrzFGq23PAA15ZKqn61ydLY65/TlQWa9siNoK6OXYvOxHHN7+0TW9P4GXJAEpD7Bq3DFTAK/bdXrMTaSMBMCiYL8TWSK5+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158200; c=relaxed/simple;
	bh=6CM5Lf5mkBbcs/MadegsiNfHVbtm2PeDdj51BA4X+Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bu38fgJhoSzgJsav3QgmoywwmcTX3qUPyJ8rwq2Tu4NZ+AUCvKvRtG3x0llkMrRyW1v4MnIxj4hVidxmZJNlXrP+Yscy4OFNjsdLdwNlFCERkvtq3nbIXs9eOv2SyYunKhiR2z5NcTu0XXetW57/oFya6/4N532HwDAVz9sF7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=a8KCWCSv; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a8KCWCSv"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23CB7152B;
	Wed, 23 Sep 2026 03:09:45 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ED8B3F86C;
	Wed, 23 Sep 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790158188; bh=6CM5Lf5mkBbcs/MadegsiNfHVbtm2PeDdj51BA4X+Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8KCWCSvFRJi9TRcshjk3iEeSP2/E0mevQQFIRMfa0W7h1QFka2XcYN07tzzvT8Bn
	 zB5x0O7Nk9iZPCfSNHApC2DfryTywInOFLn9y/cIsNXT4gXoWGlAUGaqPAjAzG9RRu
	 EOzUplyHXbiVa6klhqSEGogS0zS6fXeJjyTay75M=
Date: Wed, 23 Sep 2026 11:09:42 +0100
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
Message-ID: <arOlZs2izchTdMtL@e129823.arm.com>
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

On Wed, Sep 23, 2026 at 11:28:33AM +0800, Baolin Wang wrote:
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

Yeap. That would be much clear.

> 
> With that, LGTM.
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks!

-- 
Sincerely,
Yeoreum Yun
