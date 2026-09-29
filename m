Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4F517BA0;
	Tue, 29 Sep 2026 11:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682247; cv=none; b=asGIRt6wo2UozkwyBaW/CwKdHzvIm9iT9xFzZcR8U2ZGk3VTEn4pU5+01ZppBMR90Azzey0T8sLrJ/JefCqa8C4lM3bNnBstNhJ9bXz8ClvM23d1QQukyLpNOcsyogzLCslnKgEt17czzeJKrAEWOER3gVbpMkTzGh2iNGmd27c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682247; c=relaxed/simple;
	bh=W+KCnZ/8/YZgnJzNW3EAgvngp53lMdxenDXSaBIk6HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4cMF1VUbPZ+npqnFo+GBcUsflvXUO9oVPsHyEyWn4HUVJkbeP2yPnGQlnwPh6jTeAfy6m+c1IMaH6LbLfOu7q8qqV2kTQdt7mYG1bobYhy2blRo1bA0zagqPwHzyVLkctKC8cb1B8XAORlv3Kg4XoZ8xyVKU2+fcwFZThFj5RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fj4X+yZ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fj4X+yZ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400A61F00899;
	Tue, 29 Sep 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790682246;
	bh=JupBWX5Dgm/XapolKaVNX89w3aaQEMjgcwgvyhJcaKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fj4X+yZ5nn4k+cLEiL2kKRq/ZLId3xzZ1TtrXnvnz6oyTRR9SiGtndisyhUv7Gahn
	 oSt2r4vbBBpQ1RgLMsnp8Z2Zgu8L0XHxhZv/rJXenox8fk2ey39U+H37ranOlf2oZo
	 aJmzPDhKOG5FYTh6+v+hhrFJTl7Y8MTT1FlNrCNFjh6KsMu9GgjKxrDSpuZwTG2MCJ
	 94QxjRJ7A5JMXzBAzZ8U9sjI/nyYST6jM9t7OWW6vF4tlITQnWQSxEZTKpuCyG9yV5
	 ItVM8X3RCemKdMqwHRGmDhoAs3fj/+OTrqUN+pyJdgT1RZL0TdAXXkbHUxoQfQ0O9l
	 /kPEIRUoMZxOA==
Date: Tue, 29 Sep 2026 12:43:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: Re: [PATCH v4 2/2] kselftest: mm: fix intermittent failure
 khugepaged test
Message-ID: <arukdavnogCNfrzm@gremlin>
References: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
 <20260929-fix_khugepagd_fail-v4-2-2169c18f2576@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-fix_khugepagd_fail-v4-2-2169c18f2576@arm.com>

On Tue, Sep 29, 2026 at 11:33:19AM +0100, Yeoreum Yun wrote:
> There are intermittent failures in collapse_max_ptes_swap() and
> collapse_max_ptes_shared() when using the khugepaged_context:
>
>   // while running ./khugepaged -s 2
>
>   # Run test: collapse_max_ptes_shared (khugepaged:anon)
>   # Allocate huge page... OK
>   # Share huge page over fork()... OK
>   # Trigger CoW on page 1023 of 2048... OK
>   # Maybe collapse with max_ptes_shared exceeded.... OK
>   # Trigger CoW on page 1024 of 2048... Fail
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 23)
>   # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
>
>   # Run test: collapse_max_ptes_swap (khugepaged:anon)
>   # Swapout 257 of 2048 pages... OK
>   # Maybe collapse with max_ptes_swap exceeded.... OK
>   # Swapout 256 of 2048 pages... OK
>   Bail out! Unexpected huge page
>   # Planned tests != run tests (26 != 17)
>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0
>
> This happens because khugepaged may collapse the pages before wait_for_scan()
> is called, causing a sanity check that expects uncollapsed pages to fail.
>
> For example, in collapse_max_ptes_swap(), after faulting the pages back in
> and paging out up to max_ptes_swap pages, khugepaged may collapse them again
> before c->collapse() is called.
>
> To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
> collapsed by wait_for_scan() for anon. This prevents khugepaged from
> collapsing it again before c->collapse() is called.
>
> This failure was observed on NVIDIA Spark with 16KB page.
>
> Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Looks sensible to me so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 2aa7c9197158..4e888b7bf310 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -618,6 +618,16 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
>  		usleep(TICK);
>  	}
>
> +	/*
> +	 * The file and shmem tests rely on refaults to install PMD mappings
> +	 * after collapse. MADV_NOHUGEPAGE would prevent those mappings.
> +	 *
> +	 * Apply MADV_NOHUGEPAGE only to anonymous VMAs to prevent khugepaged
> +	 * from unexpectedly collapsing pages during the test.
> +	 */
> +	if (is_anon(ops))
> +		madvise(p, len, MADV_NOHUGEPAGE);
> +
>  	return timeout == -1;
>  }
>
>
> --
> 2.43.0
>

--
Cheers, Lorenzo
