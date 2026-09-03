Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F87F4BB800
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 14:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446788; cv=none; b=FwWLndK/Ri9N4IudzEKZfagnBiFpAgZyikuNCZk2FqVkBfaA8FtoFpWwkOy3aCKXw1VkyWZDZtGqtHLCKiZH1JFdJVJIDGnpjmKR2zWM1H8304N2qIbQqy2LMa80CxWYYHKVjqPxC7egyT0OILjAohnMOf8SGSnUp2Oy/kf3jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446788; c=relaxed/simple;
	bh=V1MYFobTbnEL6kAKgq5oSPS511/yGOzsW7VYGNkNJwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVLTkSpIIBmYDBcPhoPd+9x2gBtKm4hhCubvaTj6s7MXq09xNdR6X1kvagn7fF7WhvEZnx44eWT40Cn4iSuwi20DypWazOL0sKAQ1BXXy7wIEXmakTr3Lsm9t0hx2yWwTNCQQFtf3Wx3EEA2gc2URaSQtZQgviap9YrNUcun/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hjTRzTQh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hjTRzTQh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F9C11596;
	Thu,  3 Sep 2026 07:46:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B85303F673;
	Thu,  3 Sep 2026 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788446785; bh=V1MYFobTbnEL6kAKgq5oSPS511/yGOzsW7VYGNkNJwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjTRzTQhrGrGXreHhtxzCPKMstH81ZqdFJXMiKKPaDbIb3cfqd/mUIbc8mHYsyvG+
	 l/csTpx224sNXmdPeUtQnRv+gAKk4KvRfV22L94ohNMBv5aFPnJ64j9rkmfIiyawDk
	 m3Y553UojSQDz8Maps8tBTZWJnbrs7byvOigk6EQ=
Date: Thu, 3 Sep 2026 15:46:20 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
	david@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, usama.arif@linux.dev,
	kas@kernel.org
Subject: Re: [PATCH] kselftest: mm: remove HPAGE_SIZE and HPAGE_SHIFT macro
Message-ID: <apmIPJKj7JGwF7nz@e129823.arm.com>
References: <20260902175611.1241118-1-yeoreum.yun@arm.com>
 <apk1WVEDYtQhRxWR@gremlin>
 <aplcf7sDnfKQTYo0@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aplcf7sDnfKQTYo0@e129823.arm.com>

> > On Wed, Sep 02, 2026 at 06:56:11PM +0100, Yeoreum Yun wrote:
> > > HPAGE_SIZE and HPAGE_SHIFT macro is written based on the 4KB PAGE_SIZE.
> > > When this macro is used in some test, test result would be strange in
> > > the system where PAGE_SIZE is more than 4KB.
> > >
> > > Here is example with transhuge-stress test with 16KB PAGE_SIZE:
> > >
> > >   transhuge-stress: allocate 61073 transhuge pages, using 122146 MiB virtual memory and 1908 MiB of ram
> > >     3.292 s/loop, 0.054 ms/page,  37106.002 MiB/s	2566 succeed, 58507 failed, 2566 different pages
> > >     0.591 s/loop, 0.010 ms/page, 206850.792 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     0.527 s/loop, 0.009 ms/page, 231895.107 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     0.527 s/loop, 0.009 ms/page, 231839.704 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     0.528 s/loop, 0.009 ms/page, 231544.782 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     0.528 s/loop, 0.009 ms/page, 231462.074 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     0.527 s/loop, 0.009 ms/page, 231770.300 MiB/s	   0 succeed, 61073 failed,    0 different pages
> > >     ...
> > >   ok 1 Completed
> > >
> > > Remove the HPAGE_SIZE and HPAGE_SHIFT macro. and introduce hpshift()
> > > helper to get the HPAGE_SHIFT properly. For HPAGE_SIZE, use pre-exist
> > > helper, read_pmd_pagesize().
> > >
> > > Also, do KSM_MERGE_TIME_HUGE_PAGES test with size of 512 MiB which
> > > is the LCD pmd_size among 4KB, 16KB and 64KB page_size.
> > 
> > Probably worth spelling out Least Common Denominator for those who might
> > mistaken this for a kind of display panel :P
> 
> Bad typo :( LCM (least common multiple) :(
> 
> > 
> > I also wonder if it's worth pulling that out as a separate patch in a series for
> > better bisectability?
> 
> Okay. I'll separate it.

Hmm, I think it would be better to keep the change as is, including the
updated ksm_tests parameter. Although allocate_transhuge() correctly
allocates mappings aligned to the PMD page size, `ksm_tests -H -s 100`
would otherwise fail because 100 MiB is not a multiple of the PMD page
size.

[...]

-- 
Sincerely,
Yeoreum Yun
