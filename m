Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F3E38D40B;
	Thu, 20 Aug 2026 21:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787260991; cv=none; b=aSGdEypUsHkV5aT2JYQhK9yGOYWAekgQ7rpEC5QalaHMw3NG2etF3moxwC/Wt/hiBhvrAL8giiRIX+wXEN/zHoJO3h4OWILybg1si/3KIvmTI7cXP8lCnlvrL0SsGXOcwfzAZqIi6kIKXgnFCWhlsFTjh4Zx3GwsYb1HswyGE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787260991; c=relaxed/simple;
	bh=suIRGLK9zEzPugE1h3fPIzwIn2in+SuuPimSmklEYQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSmDwbCI8GGBqTJ70kW877yngKcwCOHZ5xXDACvut53gGAZ3acJYtyFqhd9ECCIs2Bhu2gUPHaQbfEWhOSoki6yxKK31KRt5FT6K1IwXm0AnHE1SNVOWML37GIkRFee3vPGgxYqMWyVGV5O+NBaZlhBQ38XpIIqV+wA3A+7ZWHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qHGd71/0; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qHGd71/0"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E89A202C;
	Thu, 20 Aug 2026 14:23:04 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39DBD3F763;
	Thu, 20 Aug 2026 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787260987; bh=suIRGLK9zEzPugE1h3fPIzwIn2in+SuuPimSmklEYQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHGd71/05DlnAVZrrc4T/ToiIylUz2k/N1KUa+bkDPw318XP8l2uVp/ZosZEa4LJb
	 WM9LnJsFO1ytcBlWxTitjK99zW23zSMw/U9LftApwtiyCDt6jeXba+0EVX+44cE4Le
	 vJ6yXr+9e28Txsix69iUN0wszHjjM/46m+5WkfDI=
Date: Thu, 20 Aug 2026 22:23:02 +0100
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
Message-ID: <aodwNr_zgOn55z3W@e129823.arm.com>
References: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
 <20260820-fix_split-v1-1-ab430c58c7cf@arm.com>
 <DKU173CETFYO.1RJA1CSOC5S99@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKU173CETFYO.1RJA1CSOC5S99@nvidia.com>

On Thu, Aug 20, 2026 at 03:51:34PM -0400, Zi Yan wrote:
> On Thu Aug 20, 2026 at 3:40 PM EDT, Yeoreum Yun wrote:
> > There're some random failure for split_huge_page_test when khugepaged
> > collapses pages into pmd again which had split by the test.
> >
> > Prevent the khugepaged's collapses for split page by setting the
> > mapped pmd-huge-page with MADV_NOHUGEPAGE before split.
> 
> Why not disable khugepaged using APIs from hugepage_setting.h?

Well, this also works with hugepage_save_settings() and write the
khugepaged/scan_sleep_millisecs with the maximum integer.

I don't have a strong opinion but since it seems more hackish way to
change scan_sllep_millisecs, I use madvise() with MADV_NOHUGEPATE.

Would it be better to change using APIs in hugepage_setting,h?

-- 
Sincerely,
Yeoreum Yun
