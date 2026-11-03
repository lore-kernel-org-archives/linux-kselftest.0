Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732753;
	b=JiihUpa5P3V9zWFLrgKdtftc7EspZhRKL4OXZpMjExKEzv3pMmpWUkkU9kBTS7iCIgTT
	 imjbwoMLZbgJ+Ox+5iuWidmPNLta7n5TO3ZPtOLA5ImnUc9lgE4oh3jeoLGBNo+HweZXG
	 k+eN47V6YW0kk4QnK/kqRBrD1ODCE1JK1gNsrKYtexvhj+jn5G/OxJeN1sc2DcYDjsQ9p
	 VAuKmvtK5T8PVqjxLaqKBtqYqzGfLYtdQyPd042/v9KHMtAMWFaBvOGU99azTVbUUAhNf
	 J1x9NERDsuVTI0c+gKYjdAe850pfEUQJS7M4gQiQD3uP5ZcIskGRJTtxsdnhBOYSmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732753;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HeJNsa6cJ6QNpsjilhgs8PG10NtpxUmbMSyIykHPOow=;
	b=nyfeQpaML0jB67pgDKfc7zfWmsonOr+YMRaX35AZefd+/j3oJe4nDZKlh6b+Sgd1uEJ1
	 D82O0o8VMaat0Ktmh7n/8c9TXWoWqJ0dMwZ/mZcTx8bLofWdCsV02H5NcF7c0G5Ttbomz
	 vNYjx4DP7scjZgeeD5wowkeqRbzvvcEf7LBIX+f21sUv6md9wKtEGHAdNNv4SFJOpZAgK
	 p4Zt2RxudNs7Ug6gtZmpC10OkYcOWyY3nYT2bJhsNlpZ4uXKOPAJLxlwTeaXatyeCr5ag
	 2RvBWRTmWvt25lr6dtsFsMvYcSl9p8Dc+3AzbdjUeG8wRVrlzq/TecinTBmxB8EEdgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tm2Ms7AR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24FA606A31B;
	Tue,  3 Nov 2026 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tm2Ms7AR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4671F000C1;
	Tue,  3 Nov 2026 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793732753;
	bh=HeJNsa6cJ6QNpsjilhgs8PG10NtpxUmbMSyIykHPOow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tm2Ms7ARRWfmr8ayv6N+1djm7L5xFdCVSz8tSi2mTXHAowcCDGbvK/lDyvmEqybsd
	 YfDAVqXOvWa4BDymDjqjfclHOqtSr8ymzmt/0+WPxd2iF7sJ7/p3FXEjFN8WVgKilX
	 i5Iiv2pQfvys9YvlFvxuZ1GCEyDMpBJqr8P3hSl17H4Frg1xvFViFFe0dCySAvB50L
	 oUnoQyhIS1hdArWYWvLM8NYL+liPREMfvy6as1ttb2ndB2mzCduEvcwdrzYk21GksW
	 gjlNL7ArZ32XovBSVOh8Ce4gWgYE1fqxdDx77occRhf9rMxbebHhcEQV9rZYSugPPx
	 4RNHVFB4PRPsA==
Date: Tue, 3 Nov 2026 21:05:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Umang Pokhriyal <umangpokhriyall@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: test a uffd write-protect range with
 an unregistered page
Message-ID: <auowiuwkogQ0-g7V@kernel.org>
References: <20261102103621.156928-1-umangpokhriyall@gmail.com>
 <20261102103621.156928-3-umangpokhriyall@gmail.com>
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
In-Reply-To: <20261102103621.156928-3-umangpokhriyall@gmail.com>

Hi Umang,

On Mon, Nov 02, 2026 at 04:06:21PM +0530, Umang Pokhriyal wrote:
> Register only the first of two pages and check that UFFDIO_WRITEPROTECT
> over both pages fails with ENOENT without changing the first page, when
> protecting and when unprotecting.

I don't think it's worth keeping the test for a regression we already
fixed.
 
> Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 56 ++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 298609544..57e442fd2 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -375,6 +375,56 @@ static void uffd_wp_unpopulated_test(uffd_global_test_opts_t *gopts, uffd_test_a
>  	uffd_test_pass();
>  }
>  
> +/*
> + * UFFDIO_WRITEPROTECT over a range whose second page is not registered must
> + * fail without changing the first page, in both directions.
> + */
> +static void uffd_wp_partial_range_test(uffd_global_test_opts_t *gopts,
> +				       uffd_test_args_t *args)
> +{
> +	struct uffdio_writeprotect prms = {
> +		.range.start = (uint64_t)gopts->area_dst,
> +		.range.len = 2 * gopts->page_size,
> +	};
> +	uint64_t value;
> +	int pagemap_fd;
> +
> +	/* Only the first page is registered; the second is a separate VMA */
> +	if (uffd_register(gopts->uffd, gopts->area_dst, gopts->page_size,
> +			  false, true, false))
> +		err("register failed");
> +
> +	pagemap_fd = pagemap_open();
> +	*gopts->area_dst = 1;
> +
> +	prms.mode = UFFDIO_WRITEPROTECT_MODE_WP;
> +	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
> +		uffd_test_fail("protect over an unregistered page did not fail with ENOENT");
> +		goto out;
> +	}
> +	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
> +	if (value & PM_UFFD_WP) {
> +		uffd_test_fail("failed protect changed the first page");
> +		goto out;
> +	}
> +
> +	wp_range(gopts->uffd, (uint64_t)gopts->area_dst, gopts->page_size, true);
> +	prms.mode = 0;
> +	if (!ioctl(gopts->uffd, UFFDIO_WRITEPROTECT, &prms) || errno != ENOENT) {
> +		uffd_test_fail("unprotect over an unregistered page did not fail with ENOENT");
> +		goto out;
> +	}
> +	value = pagemap_get_entry(pagemap_fd, gopts->area_dst);
> +	if (!(value & PM_UFFD_WP)) {
> +		uffd_test_fail("failed unprotect changed the first page");
> +		goto out;
> +	}
> +
> +	uffd_test_pass();
> +out:
> +	close(pagemap_fd);
> +}
> +
>  static void uffd_wp_fork_test_common(uffd_global_test_opts_t *gopts, uffd_test_args_t *args,
>  				     bool with_event)
>  {
> @@ -2403,6 +2453,12 @@ uffd_test_case_t uffd_tests[] = {
>  		.uffd_feature_required =
>  		UFFD_FEATURE_PAGEFAULT_FLAG_WP | UFFD_FEATURE_WP_UNPOPULATED,
>  	},
> +	{
> +		.name = "wp-partial-range",
> +		.uffd_fn = uffd_wp_partial_range_test,
> +		.mem_targets = MEM_ANON,
> +		.uffd_feature_required = UFFD_FEATURE_PAGEFAULT_FLAG_WP,
> +	},
>  	{
>  		.name = "minor",
>  		.uffd_fn = uffd_minor_test,
> -- 
> 2.53.0
> 

-- 
Sincerely yours,
Mike.
