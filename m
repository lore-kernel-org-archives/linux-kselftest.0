Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4D739769A;
	Thu, 13 Aug 2026 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633437; cv=none; b=R9qHOfkYB6C6Zc+20CT5O9q9TNxM+W6boD7SwlDb5oW/ERwG6YuhALrfMasImS9qAGHxaToaceGLvAPeAdzBSzNe7cYhD3nTfw+RIRuKqozHCZWx1GkHuhgnyVUf5SQrcfyDtM3PI7OGr7QqYirV0vTy+Wa6uCD9GmC2eE3lDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633437; c=relaxed/simple;
	bh=okrFbb0eDGhjaOE1hlp64zsIceJXh8+jL6I5qQg0ZNk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=P1sEjNNaoa0XArGtnjLw8GfvWjzWZs5wW9WdaBM0MoVAAg1znwGIZYCNvZDwMCKwf9JdbdlgOGRD1BWKsEYHT5Z2QaRlSSu0+1XwEz/a3HqSHCfUzoPethM5m9AzmYsHzYam1+8PYxTz7/25bQozJoVy1ixOpnqQP1BmDs6dd3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwjSEXg/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwjSEXg/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CE91F00A3A;
	Thu, 13 Aug 2026 15:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786633435;
	bh=lG3zV3twxP6cvWSTtTMCxPV2icRp16EvfrWsqb8CIS0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=kwjSEXg/X7sDQC7OSUH1Ll19xo/z0ISD7nwzmG3Zmb57M2KzTPKmNd+XmIRZYTKuj
	 anvGPML9EN5xmdQVniMrvI4+xQIrNDv0uIGPEkcTE1iRTbOc9OBMgRwytgGQ3X7lMk
	 wv3sb+mLUrsYv3SBuvRbLiOqhF2MlUaiglgdfyOkpJg+J89YxhyPp6Be/hqYLjNE+w
	 C5ux39OVWqcdatrmunlw9D60/hvzb0jJdx/60jzrZPsrGOn6CTHUVmd+AlXR2JQHbu
	 dqRQOuyqyJegjG8ZLf2cb4QzuXgeGB4VTsrwJRQyoc8CPYiuG9n4015cKPGnl+PgLx
	 A6CCG93oxtNJA==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 03/18] selftests/mm: scale khugepaged's collapse
 wait with the PMD size
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
In-Reply-To: <20260812132304.199287-4-kirill@shutemov.name>
References: <20260812132304.199287-1-kirill@shutemov.name>
 <20260812132304.199287-4-kirill@shutemov.name>
Date: Thu, 13 Aug 2026 18:03:34 +0300
Message-Id: <178663341429.2230969.16814293811889477740.b4-review@b4>
X-Mailer: b4 0.17-dev

> wait_for_scan() gives every case the same three seconds, whatever the huge
> page costs to build.  collapse_full asks for four of them: 8M at a 2M PMD,

collapse_full() please

> but 2G at a 512M PMD -- arm64 with 64K base pages.
> 
> Three seconds is thin at that size rather than generous.  Across 80 runs of
> collapse_full on arm64 with 64K pages the wait was half a second in 73 of
> them, with a tail to two seconds, and the case has timed out in a full
> matrix run, reporting a failure for a collapse that was still going.
> 
> Keep three seconds as the floor and add a second per 128M to collapse.  A
> 2M PMD is unchanged.  A 512M PMD gets 19 seconds, which is headroom over
> the observed tail rather than a measured requirement.  The budget bounds
> how long a real failure takes to report, not how long a passing case
> waits: wait_for_scan() returns as soon as the collapse turns up.
> 
> arm64/64K: khugepaged all:anon 21 pass/1 fail -> 22 pass/0 fail.  x86-64 is
> unchanged.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 48eb74c255f6..a5ada78d90ee 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -583,8 +583,10 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>  		int nr_hpages, int collap_order, struct mem_ops *ops)
>  {
>  	unsigned long hpage_size = page_size << collap_order;
> +	/* Three seconds as a floor, plus a second per 128M to collapse */
> +	const unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
> +	int timeout = 6 + 2 * (bytes / (128UL << 20));
>  	int full_scans;
> -	int timeout = 6; /* 3 seconds */

It's a pity we lost the comment explainging that timeout is seconds x2

>  
>  	/* Sanity check */
>  	if (!ops->check_huge(p, len, 0, hpage_size))

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

