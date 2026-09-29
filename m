Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28693E5A2A;
	Tue, 29 Sep 2026 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676521; cv=none; b=amk+aLab7gzbMYW7XCmmdFWk6a6gJIhTXPXyzBTWsSZ4KydPwmqaQbFpFEo5zUT3vt3bpL1RLGexT7NFDfApz2SYlaC3UGE+En6oOfIS3LU9or5LEWAEwCSs8g80EOwEdkSdg5+RLGbvQg5lVkfi6GVTeoDaDMLTwva9CUgU3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676521; c=relaxed/simple;
	bh=1CYkzAv1UTOgfjhP/3+i1axtbxG6zEvJxlpMfUNZI7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYDlOS/KL/yv17IYeinG/Ip45b0hepO57tqKEUxmyRjS/6Bk5flwdATxXYVReod2i8nntpfZWJuVkFLMhe4Zd0GPak0APdOXf8pFqUby+sfS/aUUu/wVLpulX8RHjBHzmHnNTIb+Po0P47+CNgWu1rypudUKf9OsuzZAKhLdBrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qAIyhHaP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qAIyhHaP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8501516;
	Tue, 29 Sep 2026 03:08:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 758093FA1F;
	Tue, 29 Sep 2026 03:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790676513; bh=1CYkzAv1UTOgfjhP/3+i1axtbxG6zEvJxlpMfUNZI7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAIyhHaPe22UOjd0zvagXkjWWMEzDE+8CWsaIgPMqqvkJLe9g/mFhHaS6vmtvCgB/
	 a4X+hXCZQKGxZlUxyYJqbOgDaFC5UaE9hpi5gd2HWgesheChZ/neID7JzTFSuRI5iN
	 uAEBhOuuwow5j8+ay83HPaHCNneDHjFcbTHl9ins=
Date: Tue, 29 Sep 2026 11:08:29 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
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
Subject: Re: [PATCH v3 2/2] kselftest: mm: fix intermittent failure
 khugepaged test
Message-ID: <aruOHat9wlu1H8la@e129823.arm.com>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
 <20260923-fix_khugepagd_fail-v3-2-b387e92fe1a9@arm.com>
 <447e0be9-836d-4324-9a36-77f8a0cbecf9@kernel.org>
 <84d3a9f5-4bfb-4f5e-86ad-ac8fb896d885@linux.alibaba.com>
 <dcf6fb14-7048-481b-83c6-9e8da6d874f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcf6fb14-7048-481b-83c6-9e8da6d874f5@kernel.org>

On Tue, Sep 29, 2026 at 10:46:50AM +0200, David Hildenbrand (Arm) wrote:
> On 9/29/26 10:43, Baolin Wang wrote:
> > 
> > 
> > On 9/29/26 4:38 PM, David Hildenbrand (Arm) wrote:
> >> On 9/23/26 17:29, Yeoreum Yun wrote:
> >>> There are intermittent failures in collapse_max_ptes_swap() and
> >>> collapse_max_ptes_shared() when using the khugepaged_context:
> >>>
> >>>    // while running ./khugepaged -s 2
> >>>
> >>>    # Run test: collapse_max_ptes_shared (khugepaged:anon)
> >>>    # Allocate huge page... OK
> >>>    # Share huge page over fork()... OK
> >>>    # Trigger CoW on page 1023 of 2048... OK
> >>>    # Maybe collapse with max_ptes_shared exceeded.... OK
> >>>    # Trigger CoW on page 1024 of 2048... Fail
> >>>    Bail out! Unexpected huge page
> >>>    # Planned tests != run tests (26 != 23)
> >>>    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> >>>
> >>>    # Run test: collapse_max_ptes_swap (khugepaged:anon)
> >>>    # Swapout 257 of 2048 pages... OK
> >>>    # Maybe collapse with max_ptes_swap exceeded.... OK
> >>>    # Swapout 256 of 2048 pages... OK
> >>>    Bail out! Unexpected huge page
> >>>    # Planned tests != run tests (26 != 17)
> >>>    # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
> >>>
> >>> This happens because khugepaged may collapse the pages before wait_for_scan()
> >>> is called, causing a sanity check that expects uncollapsed pages to fail.
> >>>
> >>> For example, in collapse_max_ptes_swap(), after faulting the pages back in
> >>> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> >>> before c->collapse() is called.
> >>>
> >>> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
> >>> collapsed by wait_for_scan() for anon. This prevents khugepaged from
> >>> collapsing it again before c->collapse() is called.
> >>>
> >>> This failure was observed on NVIDIA Spark with 16KB page.
> >>>
> >>> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> >>> ---
> >>>   tools/testing/selftests/mm/khugepaged.c | 3 +++
> >>>   1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/
> >>> selftests/mm/khugepaged.c
> >>> index 2aa7c9197158..b0cb02bf1a73 100644
> >>> --- a/tools/testing/selftests/mm/khugepaged.c
> >>> +++ b/tools/testing/selftests/mm/khugepaged.c
> >>> @@ -618,6 +618,9 @@ static bool wait_for_scan(const char *msg, char *p,
> >>> size_t len,
> >>>           usleep(TICK);
> >>>       }
> >>>   +    if (is_anon(ops))
> >>> +        madvise(p, len, MADV_NOHUGEPAGE);
> >>> +
> >>
> >> Any reason we just do that unconditionally?
> > 
> > Although it's a bit messy, as I mentioned before [1], unconditionally setting
> > MADV_NOHUGEPAGE will break shmem testing. Maybe add some comments.
> 
> Ah, thanks for clarifying. The problem really is that we cannot undo a
> MADV_HUGEPAGE (give me hugepages) cleanly. We can only go to the other extreme
> (no huge pages).
> 
> Yes, let's please add a comment describing why we limit it to anon.

Okay.

-- 
Sincerely,
Yeoreum Yun
