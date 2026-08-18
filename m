Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF92D77F7;
	Tue, 18 Aug 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047520; cv=none; b=LBYcw78mrsiWTe3w8J7K1H8i7KzJO/tu6n+lNFHpW7JOvjVgA0c3XVNj03YzlNrPlEI5OkQkp3vW9p+WbX6GKryiqiLJh+R4n3PZNgu4oz+uHv+U7NdqXkmkeKUELQxW9I6fw7evasp3ICS/aojkBRZsNiFkE4ZTuHH6Qa0PbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047520; c=relaxed/simple;
	bh=XD9i2e8dwGWYTbY3DIoFquJsqXOedQuZ5FSVzNv1of4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUWXikxEDylbuF+sSWUMckE4OCbsOgo7ncEBm/8LX1P8PTzTJd7y2VPMpuPlHbhuUcf6IKCatGyD+Cxq28635X4dl2a/7uZGE7aPmO1grVQfonk2MH7Lz8Y0bI4i16PzmAQdpa4gkt6x5zUBCsmASS2LPTIJWw/sD0qwU7WOkFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KenBZTlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KenBZTlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9834A1F000E9;
	Tue, 18 Aug 2026 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047518;
	bh=vvgTF7BxKslpbQYqfTabhCfEBSi+NhzQbW2JbybaO2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KenBZTlEl0NaWZ2lYk1B7sfibtn7LNF/rnV12ykluv8Edz01kFv0DPUYrtQmc2yBk
	 H6G8ZZMmd43xeaBNyoCUjDVUsUO9RN9xld0+SmvPkVrpqPw2/EjYx07B0lozoSttyg
	 f3/mp14ebSxuNPbWuUtUUC1FCR5JZ0fD4FD+8gS//d/tUILhvHbKhTb13ddiwXrHR6
	 ndCgOM2Mlkzs12ylOdBStzfCnzmm9VCqQIkWxFJFl8T58OKFFRNOUg1obE7+2hEh4v
	 M25QTqZu6xQW7TFWqslEzTV5rTYVCWQvNvfK/2W87msvoV+fp2kelMe0TWUSd/zA+p
	 2jvuXzMtZR4dw==
Date: Tue, 18 Aug 2026 11:04:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 03/19] selftests/mm: scale khugepaged's collapse wait
 with the PMD size
Message-ID: <aoQuCP87uX2kHl5q@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-4-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-4-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:45AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> wait_for_scan() gives every case the same three seconds, whatever the huge
> page costs to build.  collapse_full() asks for four of them: 8M at a 2M
> PMD, but 2G at a 512M PMD -- arm64 with 64K base pages.
>
> Three seconds is thin at that size rather than generous.  Across 80 runs of
> collapse_full() on arm64 with 64K pages the wait was half a second in 73 of
> them, with a tail to two seconds.  The case has also timed out in a full
> matrix run, reporting a failure for a collapse that was still going.
>
> Keep three seconds as the floor and add a second per 128M collapsed.  A 2M
> PMD is unchanged.  A 512M PMD gets 19 seconds.

Yikes that does make this run really slow for 64 KiB page size machines and a
key aim in the selftests is that they don't take too egregiously long to run.

Can this somehow be trimmed some other way?

>
> arm64/64K: khugepaged all:anon 21 pass/1 fail -> 22 pass/0 fail.  x86-64 is
> unchanged.
>
> Assisted-by: Claude-Code:claude-opus-5
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

In general though the patch seems reasonable so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index dd924edd8557..c499804a0ec4 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -561,8 +561,10 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>  		int nr_hpages, int collap_order, struct mem_ops *ops)
>  {
>  	unsigned long hpage_size = page_size << collap_order;
> +	/* Three seconds as a floor, plus a second per 128M to collapse */
> +	const unsigned long bytes = (unsigned long)nr_hpages * hpage_size;
> +	int timeout = 6 + 2 * (bytes / (128UL << 20));
>  	int full_scans;
> -	int timeout = 6; /* 3 seconds */
>
>  	/* Sanity check */
>  	if (!ops->check_huge(p, len, 0, hpage_size))
> --
> 2.54.0
>

--
Cheers, Lorenzo
