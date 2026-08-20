Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377121D432D;
	Thu, 20 Aug 2026 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787270114; cv=none; b=LehGRt1Fe6/40LTigEYAMNBbHzYyugpKQW0F5wPc3QIp3w3k1iujQQSdoegrMVdJNe3BJQmkcwvaq529MYQlj9zFH9TwCzYQYtdLHtuI6zeWra+ZNqf/O9CBFO31w3V+ZnuQWdHMI678SXfuXU3breutf3IWG2ch7AHUM2m+G+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787270114; c=relaxed/simple;
	bh=4+BZj3wyhMud3H0fEhJlwSpOhdep4WFqybBIHjkAz4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb5kO4b5KkF9EyyBkgIxu/aLDFPrb4DVZpnsaTsa4mq0SA1FgcDAx1Xgn3QE4VDKxvLbTtp3pUjVeGD18V62QJwMnaFangWFyUlH3mACVTyI7YNHdvLfoBdVuuG1SDT2cZ1Wf/NC339t519KtU6CW7+J8PnybgctKbBzM2mKpr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qirpwY7J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qirpwY7J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE2B2202C;
	Thu, 20 Aug 2026 16:55:08 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBA593F763;
	Thu, 20 Aug 2026 16:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787270112; bh=4+BZj3wyhMud3H0fEhJlwSpOhdep4WFqybBIHjkAz4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qirpwY7JuwpTBV73B0QJEAtK5Uvt7oAYQFk3fDBx67xN6AknH55ygv3UEGwdt2AwA
	 FpvSUe8EU3y4YAE3Sg+lB68UqsAAj6I7bZJRjBW2vDbso8yKBFfa1Bq6urfEW3rplb
	 053HKkoKGOziRcTdQRgcNZqiwGHoakjZCt8GVMSE=
Date: Fri, 21 Aug 2026 00:55:07 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
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
Subject: Re: [PATCH 1/2] kselftest: mm: prevent random failure of huge page
 split for khugepaged
Message-ID: <aoeT20fPw57DtpGe@e129823.arm.com>
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-1-ab430c58c7cf@arm.com>
 <DKU173CETFYO.1RJA1CSOC5S99@nvidia.com>
 <aodwNr_zgOn55z3W@e129823.arm.com>
 <DKU60290OED0.12P9UF0Z97DND@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKU60290OED0.12P9UF0Z97DND@nvidia.com>

On Thu, Aug 20, 2026 at 07:37:29PM -0400, Zi Yan wrote:
> On Thu Aug 20, 2026 at 5:23 PM EDT, Yeoreum Yun wrote:
> > On Thu, Aug 20, 2026 at 03:51:34PM -0400, Zi Yan wrote:
> >> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
> >> > There're some random failure for split_huge_page_test when khugepaged
> >> > collapses pages into pmd again which had split by the test.
> >> >
> >> > Prevent the khugepaged's collapses for split page by setting the
> >> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> >> 
> >> Why not disable khugepaged using APIs from hugepage_setting.h?
> >
> > Well, this also works with hugepage_save_settings() and write the
> > khugepaged/scan_sleep_millisecs with the maximum integer.
> >
> > I don't have a strong opinion but since it seems more hackish way to
> > change scan_sllep_millisecs, I use madvise() with MADV_NOHUGEPATE.
> >
> > Would it be better to change using APIs in hugepage_setting,h?
> 
> No. I did not realize there is no way of stopping khugepaged completely.
> 
> BTW, I am curious about your khugepaged config causing this issue.
> IIRC, khugepaged scan interval is about minutes and
> the time between madvise(MADV_HUGEPAGE) and the second
> is_backed_by_folio() should not be that long.

Yes. it's relly timing sensitive and I've failed to reproduce in the
real hardware. but in the emulation environment it often failed with 
the scan_sllep_millisecs as 10 seconds while the test running.

> 
> For your patch, maybe you want to check the return value of madvise() to
> make sure it succeeds.

Yeap. but it seems enough just worning message for the madvise() with
MADV_NOHUGEPAGE.

> 
> Otherwise,
> 
> feel free to add
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

-- 
Sincerely,
Yeoreum Yun
