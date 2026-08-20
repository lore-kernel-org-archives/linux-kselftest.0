Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DC22EBB8D;
	Thu, 20 Aug 2026 08:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215251; cv=none; b=Uxm/8iJ/Nyi+h/XwP/PMijJ5ggvdBvauvdBmlosy2X0g/BZ2ZdhpXVNnDXrEaXtG/B7Bgob4aX8bXLhx9QzNJJwFKQE19uiWooVyy6FaxShzwT/jvsyV7NgZzAVqee3HSpDk1o6o787wH2sjI5v744F9lr3t3ehB5X0Jt94c63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215251; c=relaxed/simple;
	bh=o93EbdLVEX2ecwXMwWi6Oh1Q/MxLeOdQlPMkB5nwLYw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=vD4lqrlc/VZ+nD3YOTqTGR7L4bwxmaLcCmPf5z5/nGzw5/NUkdbf8lumYJbNwZF1nrB3UY1PueHawNDTl/uBSkcb7CuM9BsZPNFehXa+0xjm4WdeAeMdbMTK22jiaNDWec9Zu5KJo1yFJ11KTu5wO0NDXlpiSufgPgO9XVc7GSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zxahij7h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zxahij7h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96121F00A3A;
	Thu, 20 Aug 2026 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215250;
	bh=HnwWZ/4ehQreeTuY9y550MCVlYTbzZnYeWaGxttv8V8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Zxahij7hcCaeST/KxDrHxadXlTEHdefBJX3VXVdNv+RR+o9RIhpozzK6q7YjE5dMk
	 NFDi88q8ugE9cDxe8u/ZXlK3WwNBKI24escXcAheJjehORUh3WQdHcHPAJOsP+o+EL
	 1NnYUW98hde4bi1OIfdAJD+5X3njg08kWPKIkhJWxEvq/hc9XOfO+hkZcwxoslx8jM
	 I4fcG0oUdfiQGmTLybKAGsqswoOrr3YwTUT1Usr9N6BNo9QNClAJe+A8ML6Nff5Y18
	 NKIgxB34fnaqoc0zRQV53H7Aap0Wy3YdG4p2dwXWO9gQ+m4Tw56QTArtdpSYLLaoYv
	 4sxLm09FfcmpQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 04/19] selftests/mm: skip khugepaged page cache
 cases without a PMD folio
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
In-Reply-To: <20260815015901.1236937-5-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-5-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523516.2799959.14298419435530679565.b4-review@b4>
X-Mailer: b4 0.17-dev

> The page cache caps folio order at MAX_PAGECACHE_ORDER, which is smaller
> than the PMD order on arm64 with 64K pages, where a PMD is 512M.  A
> PMD-sized page cache folio is impossible there, so MADV_COLLAPSE answers

Nit: the code comment phrases it better: "so kernel refuses these
collapses".

> -EINVAL and khugepaged passes over the range.  The shmem cases ask for a
> PMD-sized folio anyway, so four of them fail and the run bails out in the
> middle.
> 
> MAX_PAGECACHE_ORDER is not shmem-specific: it caps every file folio.  Skip
> both mem types where the cap is below the PMD order.
> 
> Anonymous collapse is unaffected: its orders are not capped this way.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index a5ada78d90ee..b436b401e2ea 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1391,6 +1391,30 @@ int main(int argc, char **argv)
>  
>  	setbuf(stdout, NULL);
>  
> +	/*
> +	 * The page cache caps folio order at MAX_PAGECACHE_ORDER, which is
> +	 * below the PMD order on arm64 with 64K pages.  A PMD-sized page cache
> +	 * folio is impossible there, so the kernel refuses these collapses by
> +	 * design and there is nothing to test.  The cap is not shmem-specific:
> +	 * it rules out regular files too, and the per-order shmem_enabled
> +	 * controls exist for exactly the orders it allows, which is what makes
> +	 * them readable here.
> +	 */
> +	if (!(thp_shmem_supported_orders() & (1UL << hpage_pmd_order))) {
> +		if (shmem_ops) {
> +			ksft_print_msg("no PMD-order page cache folio: skipping shmem\n");
> +			shmem_ops = NULL;
> +		}
> +		if (read_only_file_ops) {
> +			ksft_print_msg("no PMD-order page cache folio: skipping file\n");
> +			read_only_file_ops = NULL;
> +			read_write_file_read_ops = NULL;
> +			read_write_file_write_ops = NULL;
> +		}
> +		if (!anon_ops && !shmem_ops && !read_only_file_ops)
> +			ksft_exit_skip("Nothing left to collapse into\n");
> +	}
> +
>  	default_settings.khugepaged.max_ptes_none = hpage_pmd_nr - 1;
>  	default_settings.khugepaged.max_ptes_swap = hpage_pmd_nr / 8;
>  	default_settings.khugepaged.max_ptes_shared = hpage_pmd_nr / 2;

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

