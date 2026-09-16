Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843A03C09EE;
	Wed, 16 Sep 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542421; cv=none; b=SLWmXRgr81C7I2AUYJPSzkGn/TRdFh1UBHt0WzzJ1GQAn3ikUL6zI0zOshNCNGQsLykbfa+347JM8PnRKDteF78HeN3V9PtnBf8Gpp8K91t7Rrk0DOb/431/fm2eTwCZ+hf6cYkukQMCB+AWB+ezlEnxcZhsTlUQVJr9SrGLf40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542421; c=relaxed/simple;
	bh=7j41/pbsi2hh7BzOK/zlBjo5ceENRET+9FnTWgUaeYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+gLqQ4I+8cN9ZKrj4qqcwk0ApmY6lmcZStYVx6ZSW7Nm9pFOAIBS78Qc58JJIM0cHNptQDbfSWlYPLa3ErrY80zcf+rRvQsE/DnG/q7fvakFIM0o3is8XVkHjcHiYFIdyYzq5tGk5H9z/eqwe2gDKI3ZBZJdYeL2oSTCCfEeJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bU8VbXfk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bU8VbXfk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E0A0152B;
	Wed, 16 Sep 2026 00:06:54 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 995AF3F86F;
	Wed, 16 Sep 2026 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789542417; bh=7j41/pbsi2hh7BzOK/zlBjo5ceENRET+9FnTWgUaeYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU8VbXfkKaKwuh6T7BWjvzIFRNk1/Mkj14bNCbgP3EMRPQntwVb6eQyRKr/RtoJHR
	 nZXlP4iJoqERz7vC2vDX7Bun0jQtSF23uJZpSIC4RlnrRLdm33e9UUX8fC63WvUnhI
	 2Wt5RYyChyWHtUQWRzRHrQCFtqWRQD1Q+BwMeRUM=
Date: Wed, 16 Sep 2026 08:06:52 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Message-ID: <aqpADFi-qa4990ZD@e129823.arm.com>
References: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
 <db48325a-6eea-4924-916e-5da06bd31e47@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db48325a-6eea-4924-916e-5da06bd31e47@kernel.org>

On Wed, Sep 16, 2026 at 08:41:00AM +0200, David Hildenbrand (Arm) wrote:
> On 9/15/26 11:21, Yeoreum Yun wrote:
> > There are intermittent failures in collapse_max_ptes_swap() and
> > collapse_max_ptes_shared() when using the khugepaged_context:
> > 
> >   # Run test: collapse_max_ptes_shared (khugepaged:anon)
> >   # Allocate huge page... OK
> >   # Share huge page over fork()... OK
> >   # Trigger CoW on page 1023 of 2048... OK
> >   # Maybe collapse with max_ptes_shared exceeded.... OK
> >   # Trigger CoW on page 1024 of 2048... Fail
> >   Bail out! Unexpected huge page
> >   # Planned tests != run tests (26 != 23)
> >   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> >   # Run test: collapse_max_ptes_swap (khugepaged:anon)
> >   # Swapout 257 of 2048 pages... OK
> >   # Maybe collapse with max_ptes_swap exceeded.... OK
> >   # Swapout 256 of 2048 pages... OK
> >   Bail out! Unexpected huge page
> >   # Planned tests != run tests (26 != 17)
> >   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > This happens because khugepaged may collapse the pages before wait_for_scan()
> > is called, causing a sanity check that expects uncollapsed pages to fail.
> > 
> > For example, in collapse_max_ptes_swap(), after faulting the pages back in
> > and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> > before c->collapse() is called.
> > 
> > To prevent this, change the khugepaged setting from ALWAYS to MADVICE for
> > the affected tests, and mark the VMA with MADV_NOHUGEPAGE after it has been
> > collapsed by wait_for_scan(). This prevents khugepaged from collapsing it
> > again before c->collapse() is called.
> 
> ALWAYS also respects MADV_NOHUGEPAGE, so why is the ALWAYS -> MADVICE (MADVISE)
> change required?

You're right. this is redundant and it's enough only set the
VM_NOHUGEPAGE for anon. I'll remove them.

Thanks!

-- 
Sincerely,
Yeoreum Yun
