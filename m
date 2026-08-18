Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D4B23EA8B;
	Tue, 18 Aug 2026 10:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047698; cv=none; b=Z4R6cu1n1Xsr1ZqaR8c2mzkB2CDSQ4V3E9dmswBpT8tzDUYcVqFejlKwY0vLSiV6jgdK3NZf5tQf6nWJ0UmD0pcq9916GAYAJj2raQWzjp7ktkpwwBLbyvThU7HzskCNy5m/HA9S1t1XAa1UeucUCJox7VErk6ZKqPK73wvkSGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047698; c=relaxed/simple;
	bh=66ZjDsXNn+Tm/mYIOx/FhALGw4IbpwnR4Sc8c6oNvkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peSe4L+2SzQLAlsBgs5pJOqonOUY4Wfppn6qmk0fky8K+eDNaqcNr60V0h74wl0J9Y9tM0qLDJLYTnqTqOvnHjjtaP9/bULD4eUnsKx/PTqDqvTmg2YURryNc4EdjtDDGh0h90AAKX92ouyBZCBZGLngXhSKwwudVxxtvnjshyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uc/qV7oY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uc/qV7oY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391831F000E9;
	Tue, 18 Aug 2026 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787047697;
	bh=/4t/bDE7rcjEi5t4t3vOwOyHYRygnB/uX4wHouL9xHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uc/qV7oYLiyVF0C4wibZEvrPWZNgwBtainG7IQM9ba54WyDn1pQSYg4tcphUhWnFd
	 os91d/pOtaZmrBDEn66FgCi0atcx5YGqbCshdHCUQjdqXmdt+StxpMlZ7IjfYpEpUr
	 ZDCGoV5+bGmNJOcSc3PkVu1TH+PW/68hmU0VoHXXteZroF9BwTfjb0r3l6AnWY5KYG
	 0T+QJzZfl48P8AlNvebUeNbG0BQDGZ2gaXFRLPcwVAphS4Ii6IGtIPwYV4WtGLUNvQ
	 vq2fLX/stzLjz205Cl8FFyavTfLRo9TlrMDnkU8WvehpONFahKHIORFb7Bv4ieIF70
	 1bE3lry/MLxSg==
Date: Tue, 18 Aug 2026 11:07:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, nico.pache@linux.dev, 
	baolin.wang@linux.alibaba.com, baohua@kernel.org, dev.jain@arm.com, hughd@google.com, 
	lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com, rppt@kernel.org, 
	ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com, usama.arif@linux.dev, 
	vbabka@kernel.org, ziy@nvidia.com, usama.anjum@arm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kas@kernel.org
Subject: Re: [PATCH v4 04/19] selftests/mm: skip khugepaged page cache cases
 without a PMD folio
Message-ID: <aoQuhSq-2Bd3Kz67@lucifer>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-5-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815015901.1236937-5-kirill@shutemov.name>

On Sat, Aug 15, 2026 at 02:58:46AM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> The page cache caps folio order at MAX_PAGECACHE_ORDER, which is smaller
> than the PMD order on arm64 with 64K pages, where a PMD is 512M.  A
> PMD-sized page cache folio is impossible there, so MADV_COLLAPSE answers
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
> ---
>  tools/testing/selftests/mm/khugepaged.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index c499804a0ec4..ec5c36a19d92 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1357,6 +1357,30 @@ int main(int argc, char **argv)
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

This is a very schloppy comment. Can you trim it please?

> +	if (!(thp_shmem_supported_orders() & (1UL << hpage_pmd_order))) {

Is this inferring file-backed khugepaged behaviour from shmem? That seems iffy.

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
> --
> 2.54.0
>

--
Cheers, Lorenzo
