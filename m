Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951D484228;
	Thu, 13 Aug 2026 15:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633449; cv=none; b=D0HqwXmh51d1XdYRkb06Ab80ck3+KUAf0tADMRR04Ezr6H+6chjdfGzZ4RAW43YNY7kMWzxx+z8eKMr1R8uc31UGr2aLhtXjzvZdPa2RXQE9Xs97jLaav3Sz6wOMnvcNb6tfbWFcseDUWyrMxg0vnBc34AVjvXCEb8MGp3Lu9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633449; c=relaxed/simple;
	bh=RwUxDIyeii6SBgqlgyYjP/gGcr42Ref+W8ogo7TUVhc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fmEg3XoT1qMxHtHP6OeD99mzBcn3gWYLwPPcDGhZrrw3H0NLgTvQSiR2dlA6DHMRS39+4+6rEkwoDQlYdsunHyRlriHHbFME67chb6LOeIBFiKSlfAWw8j6melIaP1SEKf5Xj01TERVV332x9nB7ofJ7wClJ57NWMkdOIYwPhnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+aUHZOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+aUHZOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB621F000E9;
	Thu, 13 Aug 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633447;
	bh=P+IcpL4FUK+slbgv+e2vr2PmdccWWDUBCgZJ5jExmbo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=i+aUHZOz005VYfYTHNALqNr/DML/dBtDhHeQjUmy3WC1EMYA6Ksjn7p24+hutdig3
	 j3gmjbNZqncq6TxIt0b+sDlWVsCwFHjQBmGB7EKQ7tzYLz/VhAgejZDFoWP5tk3rbc
	 PcgcfetZwWpKpPosRnPQBhREE31MTZa5Dzoa57w7/GXYs+oPEkeQv43h9RiByUW5Zc
	 w688xdLD6hRTl7uSABowBp1rteG6FnvAXS+RzozSOPI8jq+EPp+UdRW7DE8640OBlC
	 2/9WF2HGQ3ZGlR3V9fTfWMb+RTshdLVM94b52RqEgGwKBydTbfMU2r21GZwHtrdEAm
	 stqnjYghWpHuw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 05/18] selftests/mm: keep khugepaged out of the
 swapout the swap cases set up
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 nico.pache@linux.dev, baolin.wang@linux.alibaba.com, baohua@kernel.org, 
 dev.jain@arm.com, hughd@google.com, lance.yang@linux.dev, 
 liam@infradead.org, mhocko@suse.com, rppt@kernel.org, ryan.roberts@arm.com, 
 shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
 vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, 
 agordeev@linux.ibm.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kas@kernel.org
In-Reply-To: <20260812132304.199287-6-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-6-kirill@shutemov.name>
Date: Thu, 13 Aug 2026 18:03:34 +0300
Message-Id: <178663341429.2230969.913958776768961527.b4-review@b4>
X-Mailer: b4 0.17-dev

> selftests/mm: keep khugepaged out of the swapout the swap cases set up                                                                                           

Huh?

> collapse_swapin_single_pte() and collapse_max_ptes_swap() page a range out

Maybe "page out a range"? or even swap out?

> and then require smaps to report exactly the count they asked for.  Two
> things keep it from arriving.  MADV_PAGEOUT is best effort, so the count
> often turns up a moment late.  And wait_for_scan() leaves MADV_HUGEPAGE
> behind, so khugepaged is still working on the range: collapsing one with up
> to max_ptes_swap pages swapped out means reading them back in, and the
> daemon empties the swap as fast as the case fills it.  On arm64 with 64K
> pages, where max_ptes_swap is 1024 pages, that is 64M a step and the case
> loses:

Splitting to paragraphs would help I think. And maybe rewriting by hand
rather then instructing claude.

>   # Swapout 1024 of 8192 pages... Fail
>   not ok 10 collapse_max_ptes_swap
> 
> Ask again for up to two seconds, with the range held out of the daemon's
> reach while asking.  The collapse each case runs next puts MADV_HUGEPAGE
> back, so only the setup is affected.
> 
> If the pages still will not go, skip.  is_swap_enabled() covers a machine
> with no swap; what is left -- swap too small, full, capped by a memcg, busy
> with writeback -- is not the kernel under test refusing.  An error from
> madvise() itself still ends the run.

This commit message broke me, I'm going to skip the remaining patches
for now.

-- 
Sincerely yours,
Mike.

