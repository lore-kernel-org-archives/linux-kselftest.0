Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8DB2EF67A
	for <linux-kselftest@vger.kernel.org>; Sat,  9 May 2026 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778320075; cv=none; b=rU5yaCIiGetEfjekQ0fsGwaV8X1tWjJklb4RbfCdJ6ABTku4HIhTLIaZxlBZFlSZiUUV7VHCYuP2zDEk4wN/cYbITx9Lm6AwHtm/IpyWZGGl8pTn3bIs96AyE9LoQl+YGrJ59zRheneqI3ILntwfnFw4hK3f0e9qQRpzcXIabFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778320075; c=relaxed/simple;
	bh=Dw/zO6gTpfSfiKIhfRGQmXoXpyyuQlLwb6uGxJBRyz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W5mCuczzpr5KvdZW4VFHjl9Fah88ks1VaQ+/r7tJaUKrKfZf5dDfV3iePHe2scpSpM2WajZhXulRH7EL5UjUmvW2oKY3NrIw2Mqn0PNO4m775LsnhBxDS9KEycJTh0EzmA+eFl5gnAbJ0/dIWku6xkrYI+iS5oYxG5ecMU0USAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Bv+/YluI; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Bv+/YluI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778320061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+2pbbVhcPs+O/UiB7Rv0YgrC1Aa3k1+qfWtc56gjcQ=;
	b=Bv+/YluIxCYzSWDM6r6xXnJk3cZ60VwXTBhEg+4vuryOYu/VZDOfcWSHl1NSKzTOcVVZU8
	N9ONn4g9u+bODF/pZpn25LdsBJtLjb3Ou92xRIuM1uxUmaFFksXUmB6YQrRN19fXWWwItv
	lIQKSwkasHds8/Mds4ZEe9zq3Hvn3fM=
From: Lance Yang <lance.yang@linux.dev>
To: chenwandun1@gmail.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	shuah@kernel.org,
	zokeefe@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH 0/2] mm/khugepaged: fix sub-PMD MADV_COLLAPSE range handling
Date: Sat,  9 May 2026 17:47:32 +0800
Message-Id: <20260509094732.83643-1-lance.yang@linux.dev>
In-Reply-To: <20260507070558.3064142-1-chenwandun@lixiang.com>
References: <20260507070558.3064142-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

scripts/get_maintainer.pl is your friend :)
Please use it to Cc the relevant maintainers and reviewers next time.

Cheers, Lance

On Thu, May 07, 2026 at 03:05:56PM +0800, Chen Wandun wrote:
>madvise_collapse() computes a THP-aligned window from the caller's range:
>
>  hstart = (start + ~HPAGE_PMD_MASK) & HPAGE_PMD_MASK  /* round up  */
>  hend   =  end   &  HPAGE_PMD_MASK                    /* round down */
>
>When the caller's range is smaller than one PMD (2 MiB) and/or not
>PMD-aligned, hstart can end up greater than hend.  In that case the
>collapsing loop is correctly skipped, but the return value was computed
>as ((hend - hstart) >> HPAGE_PMD_SHIFT): with hstart > hend the
>subtraction wraps unsigned, producing a huge value, the comparison
>"thps != 0" fires, and -EINVAL is returned instead of 0.
>
>A concrete example:
>
>  /* both cover less than one THP; both should return 0 */
>  madvise(aligned, PAGE_SIZE, MADV_COLLAPSE);             /* OK, returns 0 */
>  madvise(aligned + PAGE_SIZE, PAGE_SIZE, MADV_COLLAPSE); /* returns -EINVAL */
>
>The fix moves the hstart/hend calculation before kmalloc_obj() and
>returns 0 early when hstart >= hend.  This also avoids the kmalloc,
>mmgrab(), and lru_add_drain_all() calls for ranges that trivially
>contain no PMD window.  The same effect could be achieved by only
>guarding the final return expression, but early-return keeps the
>no-op path free of the allocator and drain overhead.
>
>Patch 1 fixes the kernel bug.
>Patch 2 adds a selftest with two cases covering the hstart == hend
>(aligned, was already correct) and hstart > hend (unaligned, was
>broken) scenarios.
>
>Chen Wandun (2):
>  mm/khugepaged: fix spurious -EINVAL from sub-PMD MADV_COLLAPSE range
>  selftests/mm: add MADV_COLLAPSE sub-PMD range tests
>
> mm/khugepaged.c                               |   9 +-
> tools/testing/selftests/mm/.gitignore         |   1 +
> tools/testing/selftests/mm/Makefile           |   2 +
> .../selftests/mm/ksft_madv_collapse.sh        |   4 +
> .../selftests/mm/madv_collapse_range.c        | 141 ++++++++++++++++++
> tools/testing/selftests/mm/run_vmtests.sh     |   5 +
> 6 files changed, 159 insertions(+), 3 deletions(-)
> create mode 100755 tools/testing/selftests/mm/ksft_madv_collapse.sh
> create mode 100644 tools/testing/selftests/mm/madv_collapse_range.c
>
>-- 
>2.43.0
>
>
