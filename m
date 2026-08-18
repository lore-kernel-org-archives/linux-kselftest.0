Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AD43FD26;
	Tue, 18 Aug 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044971; cv=none; b=Pq9Ago3RgG/Ye8DonCPI6PF6P/mGMdTVA7JwlFCnsuCmYk39RkS1VhX8rWHQghHCRL50lbU6k1udGhw445Qyh79kReWH3NMSX8X++k6JPDYO1PG9scXE3cZ6BpfPVvOF8ICTKazwo3d5QQThLTYEhyJTNVPe+ML9uDSL9u9PxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044971; c=relaxed/simple;
	bh=smMohCHZWvXTVR9KpcTJyr7VfWjP+gmaR4hsLcqQS5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4LgF2uxpHwwhNRUAL0PUbTZ0S8lN3Pi8h5e+0Oea7iHE0z+wxLXd3OH4ku5MPRq0AEgcrFOQAsgyIiALaLLnmr+XdanHHpmO2XJp5cAATJ2fXk+/j+S8kbzS38vyfIpJlIEJUJl3rEzrZma4iVENWN2y0cwizPqjUw4DF/AqfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJgKSacZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJgKSacZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A749D1F000E9;
	Tue, 18 Aug 2026 09:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044969;
	bh=sQvGa6ZjyoTwZCrb1Ok01OaL8kRa0yVIIGAgWCHVewI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJgKSacZmyMJRg84QdWZgRC62LCAxaO/rnF9eHQGMSJ88n1IM1WLMFf4J51IGr9lQ
	 E2LUJXliQM6Iheuwc0/rioY6Om+VAy2pFUAcc+uYifbrKm591z3AUq/U6nDMQiUViv
	 /FjHFwJ0j34cUXXlClk/0QuIxsLrc3hNLTC5BcOJmPXDVrbs0Yfp40tcdPdZ1UAstK
	 epkHfHu8iO3BT/pqPP9kHF1ZFGiioTeE6EcRVDXnRYk4K2LkqN7sGUUCAYq9l74Oad
	 Pft/WEV9dT9LvmsF8qioDeV4MpHuYRHbRqzCNseUiHxoGjYZiV1vv9ktpFJi152BMV
	 hfolP9T7D7YiQ==
Date: Tue, 18 Aug 2026 10:22:28 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 02/19] selftests/mm: skip collapse_compound_extreme()
 where the PMD is too large
Message-ID: <aoQi1sHTO_mIQVFx@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-3-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-3-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:44AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
> compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
> 64K base pages -- makes each of those an order-13 allocation, which the
> allocator cannot reliably hand out even once, let alone 8192 times.
>
> The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> whole binary stops and every case after it is lost.
>
> Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> still cover PMD-order collapse on those configurations, and 4K and 16K
> PMDs are unaffected.
>
> Assisted-by: Claude-Code:claude-opus-5
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Ah yeah again we are hit with the consequences of assumptions around PMD
size which do not apply for 64 KiB page size :)

Seems sensible to me so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 6cfec2b940ac..dd924edd8557 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -940,6 +940,16 @@ static void collapse_compound_extreme(struct collapse_context *c, struct mem_ops
>  	void *p;
>  	int i;
>
> +	/*
> +	 * The test needs hpage_pmd_nr PMD-order allocations, which is likely to
> +	 * fail for large PMD sizes.  Skip if the PMD size is over 32M.
> +	 */
> +	if (hpage_pmd_size > (32UL << 20)) {
> +		ksft_test_result_skip("%s: PMD too large for fault-time THP construction\n",
> +				      __func__);
> +		return;
> +	}
> +
>  	p = ops->setup_area(1);
>  	ksft_print_msg("Construct PTE page table full of different PTE-mapped compound pages\n");
>  	for (i = 0; i < hpage_pmd_nr; i++) {
> --
> 2.54.0
>

--
Cheers, Lorenzo
