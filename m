Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529632;
	b=P3YOdZJanj9uyd2ytTiQWpCPdC58xVIIss8MXjaIM30aT4AgmPpYe7Ow8FK9CRXRrFFa
	 1bm5LkOJjC0O2MXLagXn3+tKvcgwdEyn7XARLrWH7oXnC5H8o1GEBvZuqNXwAM6Vei+YU
	 92/w/8f5VzxCz26MmliILWDZLB+i8Lbop/dwRTT+XzExVxuqox2FKWd3lMjvpD0bjzSAH
	 j3QB+wplbCMWD0oMy19zjrEV6akHcrPQgyFOY3CWkphrWuQJ6LGJaqNujDy2DIisTvxFq
	 ZgbXdHXs/TwfAqbAuqWP9wXFsMNvng+A2dGZzNEu1EqGs7GW3X/U78Q8nNQEB4PlGwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529632;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=RjY3RPs1T45ei4uQmlm6jIypKs8I/ViOOkAu35+Wui8=;
	b=VZWAUKWss+BYQD3gRMHZH88OhYw6vNCQ97THlx4Vuo4tMSsbkaNdlmcWH4SrADtHweRH
	 I8jIclSfTgya4nsI96z/fKy6QHC66NwsvPsC+54S1T4Xf6KYTLjiKXN/rsZgs0EBkEVXr
	 Ey1hu+lTIYL9CQDf9u03UH8SICxjruXRuhJlMZGwod4eN+ypKSRV1PXugbvD7AcYL5fd6
	 pKMCpSORWDfeiFIzaxyTwU1ojt+yWxWVfJrLYi0JxXGXh/dFeJ2qYGNp9FR5dgn7SvVmU
	 /m9PO1H0mbooN+zjKhLce2k5xNGNsFxvKKqNFD9yixBiWZSdfI+4Jsb6zM1VcRcnjnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ipJHz1y6;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66FB606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D66FB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ipJHz1y6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RjY3RPs1T45ei4uQmlm6jIypKs8I/ViOOkAu35+Wui8=; b=ipJHz1y6J2sT6cXKuCBtRxBC1D
	p0QB4U1sClw6CblPuSePEDLLs5JUW3yz0Gb9zi5aTl03FSXLHCkehY/m7vLXfMOC5S6sXVp75sPwj
	2Vj+sR3ReiBRCmlO2EnC/lSSGcR8IOlQbeouNcWiTtGk59mqOVZVxzWlkdd99pm1ryPeNUTxk26O/
	or6wpAl+LCGbXKFDzHQY9vBKaGsCEEpkkN8MBFV1cZ9Vtk3smU89o46zmrJH0WTUVen7W+VgHVCbW
	NLrSp7aTsE0i1pxzrLQnPItn5Eh+E14/5F4iOSA0GN0ThM/6ODGm/VMz7XUd1UjxWw+NFJosx4lNa
	+rV9DZsw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrHE-00000006iv4-1DAG;
	Tue, 24 Nov 2026 14:13:46 +0000
Date: Tue, 24 Nov 2026 09:13:40 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: kaleshsingh@google.com
Cc: akpm@linux-foundation.org, kernel-team@android.com, 
	android-mm@google.com, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests/mm: uffd-wp-mremap: skip unsupported shmem
 and hugetlb cases
Message-ID: <2h2aukjt7udstg5ywc2sqlyaamwkh4ip3erac34bcdly4qiacx@gnga6rnvsd56>
References: <20261122082020.1255434-1-kaleshsingh@google.com>
 <20261122082020.1255434-2-kaleshsingh@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122082020.1255434-2-kaleshsingh@google.com>

On 26/11/22 08:20AM, kaleshsingh@google.com wrote:
> From: Kalesh Singh <kaleshsingh@google.com>
> 
> uffd-wp-mremap checks only for UFFD_FEATURE_PAGEFAULT_FLAG_WP before it
> runs. With CONFIG_PTE_MARKER_UFFD_WP=n the kernel keeps that feature
> but supports write protection on anonymous memory only, so the shmem
> and hugetlb cases fail with EINVAL from UFFDIO_REGISTER instead of
> skipping. Skip them when UFFD_FEATURE_WP_HUGETLBFS_SHMEM is missing.
> 
> Fixes: b2466bb3b495 ("selftests/mm: introduce uffd-wp-mremap regression test")
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
> index c48eaab8e75c..f7b272baa6f5 100644
> --- a/tools/testing/selftests/mm/uffd-wp-mremap.c
> +++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
> @@ -18,15 +18,14 @@ static int nr_thpsizes;
>  static size_t thpsizes[20];
>  static int nr_hugetlbsizes;
>  static unsigned long hugetlbsizes[10];
> +static uint64_t uffd_features;
>  
>  static void check_uffd_wp_feature_supported(void)
>  {
> -	uint64_t features = 0;
> -
> -	if (uffd_get_features(&features))
> +	if (uffd_get_features(&uffd_features))
>  		ksft_exit_skip("failed to get available features (%d)\n", errno);
>  
> -	if (!(features & UFFD_FEATURE_PAGEFAULT_FLAG_WP))
> +	if (!(uffd_features & UFFD_FEATURE_PAGEFAULT_FLAG_WP))
>  		ksft_exit_skip("uffd-wp feature not supported\n");
>  }
>  
> @@ -180,6 +179,12 @@ static void test_one_folio(uffd_global_test_opts_t *gopts, size_t size, bool pri
>  				swapout ? "true" : "false",
>  				hugetlb ? "true" : "false");
>  
> +	if ((!private || hugetlb) &&
> +	    !(uffd_features & UFFD_FEATURE_WP_HUGETLBFS_SHMEM)) {
> +		ksft_test_result_skip("uffd-wp on shmem and hugetlbfs is not supported\n");
> +		return;
> +	}
> +
>  	/* Allocate a folio of required size and type. */
>  	mem = alloc_one_folio(size, private, hugetlb);
>  	if (!mem) {
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 
