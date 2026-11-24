Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529660;
	b=HBeiQ/kPF8uJUtl5o/klsg3RE2nP7vZ7sw9FUhuG9bKCPhIu5gYRjCfAPzNe3c4lxyCo
	 S7/Fid4iqxBZrOcs6woCv1O4wI0srmU+ywi3+mv/pW5JNtUwazGgzdi+S98Ogcvogcjsh
	 o2lt3CWu8Ypwa1renG7SZ1IxjzNluB+MVrO9+wzF7rKpe4lrUcnf3S+CnpgTSIAfvWf3U
	 wBj6xEsUyg1BLTyLBlel4b8TVphbJdKOIj6OZBsN32vicHFHYERiVBhP7jIbYzZu2XayB
	 Up0hrSPXTdcP/NyDNU45GTSnxuKaoIxWTFrDIw2xR6hut9TZQd6EEOvA/Rj9evk2xPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529660;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=3tGwmEPNnZKcIeVBveDBfvH+PJuYnDW44W3GOjoj51g=;
	b=Ar1OSMrwQrut3zDnqEn1QyK+maQGGJbWNQim3YfvJWSPRUOeKm9YupnXXx1n41hLwhr9
	 sFLAhY8gC+bX72RtTI12jOQwZ7PdHc+zK5FsI1W6CqmrEgHrThsju82g7Hhqn0OYDr4L+
	 kDLVfIjRWj7f6hvbymGVYOFvAqyT6XVNl5dkI9ApNef/JITkZ+1KEqWw6Owvn7H+JWCj+
	 JW/Hw1LETksB+OGYdyJkMwe4Fy/F+Gv1fzG0jnmhvrEwXieAZXVN0rXvx9SdKUtqr2rKD
	 5yiug5AnlDCFtV0rrZCaYR84dUI2UUA0STJ7Z6DX9gMfB8GJwDsXmhdhLmiwp04uXGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j9YW9C3L;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE731606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 14:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE731606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j9YW9C3L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3tGwmEPNnZKcIeVBveDBfvH+PJuYnDW44W3GOjoj51g=; b=j9YW9C3L10YmUzDHGReZ4Lm/jq
	l+zDfsrMdSjW3IX+v8yQ/XIfUiSFpS40DN9RKKEToUv0i4XgIMCB2k01JckxokiGfrf1yOAcOZKPd
	xWA6VPbVatx79oSFjXiDrxfvp1rO8yS7SFzt2g3PWhoBPvM7WDvmsDvuAYKO+zwqmApP2JNj8x9Vp
	aRSER4Ar552YvHDItXA0cpHb24zsr1QpoUrlDkQbBbMOSQwOVexUncwTrDBQ/s7dz11dYxQr8lYEN
	sUMp2nV/6oBCaN0PyiNSmDgfBXr1MWtw3vd7K4CsmraXLhsKVVXRxZNGtDbOtmHmhkByojTwqV6Ic
	k9vBzGoA==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrHj-00000006izt-2WBF;
	Tue, 24 Nov 2026 14:14:15 +0000
Date: Tue, 24 Nov 2026 09:14:13 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: kaleshsingh@google.com
Cc: akpm@linux-foundation.org, kernel-team@android.com, 
	android-mm@google.com, Lokesh Gidra <lokeshgidra@google.com>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/mm: uffd-unit-tests: filter required
 features per memory type
Message-ID: <7kat6qajo4td4zelsmc4s2wdmkhvmlshbe3odar2bjmaucxydf@4tdhsa2gntp7>
References: <20261122082020.1255434-1-kaleshsingh@google.com>
 <20261122082020.1255434-3-kaleshsingh@google.com>
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
In-Reply-To: <20261122082020.1255434-3-kaleshsingh@google.com>

On 26/11/22 08:20AM, kaleshsingh@google.com wrote:
> From: Kalesh Singh <kaleshsingh@google.com>
> 
> CONFIG_PTE_MARKER_UFFD_WP defaults to y but can be turned off, and
> userfaultfd write protection then works only on anonymous memory. The
> kernel still reports UFFD_FEATURE_PAGEFAULT_FLAG_WP but no longer
> UFFD_FEATURE_WP_HUGETLBFS_SHMEM.
> 
> uffd-unit-tests checks a test's whole feature mask for every memory
> type, so the tests that run on all memory types and require
> UFFD_FEATURE_WP_HUGETLBFS_SHMEM (register-ioctls, the wp-fork tests,
> rwp-wp-exclusive, sigbus-wp and events-wp) skip their anonymous runs
> too. Check and request only the features that apply to the memory type
> under test, and make minor-wp require UFFD_FEATURE_WP_HUGETLBFS_SHMEM,
> as it write-protects shmem and hugetlbfs.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  tools/testing/selftests/mm/uffd-unit-tests.c | 42 +++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> index 2a97ba1d6feb..d0dda2ec48fb 100644
> --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> @@ -176,15 +176,44 @@ static void test_uffd_api(bool use_dev)
>  }
>  
>  
> -static bool uffd_feature_supported(uffd_test_case_t *test)
> +/*
> + * Filter test->uffd_feature_required down to the features needed for @mem_type.
> + * For example, UFFD_FEATURE_WP_HUGETLBFS_SHMEM (gated on
> + * CONFIG_PTE_MARKER_UFFD_WP) only applies to shmem and hugetlbfs, so anonymous
> + * subtests should still run when it is absent.
> + */
> +static uint64_t uffd_test_features(const uffd_test_case_t *test,
> +				   const mem_type_t *mem_type)
> +{
> +	const uint64_t shmem = UFFD_FEATURE_MISSING_SHMEM |
> +			       UFFD_FEATURE_MINOR_SHMEM;
> +	const uint64_t hugetlb = UFFD_FEATURE_MISSING_HUGETLBFS |
> +				 UFFD_FEATURE_MINOR_HUGETLBFS;
> +	uint64_t features = test->uffd_feature_required;
> +
> +	switch (mem_type->mem_flag) {
> +	case MEM_ANON:
> +		return features & ~(shmem | hugetlb |
> +				    UFFD_FEATURE_WP_HUGETLBFS_SHMEM);
> +	case MEM_SHMEM:
> +	case MEM_SHMEM_PRIVATE:
> +		return features & ~hugetlb;
> +	case MEM_HUGETLB:
> +	case MEM_HUGETLB_PRIVATE:
> +		return features & ~shmem;
> +	default:
> +		return features;
> +	}
> +}
> +
> +static bool uffd_feature_supported(uint64_t required)
>  {
>  	uint64_t features;
>  
>  	if (uffd_get_features(&features))
>  		return false;
>  
> -	return (features & test->uffd_feature_required) ==
> -	    test->uffd_feature_required;
> +	return (features & required) == required;
>  }
>  
>  static int pagemap_open(void)
> @@ -2417,6 +2446,7 @@ uffd_test_case_t uffd_tests[] = {
>  		.uffd_feature_required =
>  		UFFD_FEATURE_MINOR_HUGETLBFS | UFFD_FEATURE_MINOR_SHMEM |
>  		UFFD_FEATURE_PAGEFAULT_FLAG_WP |
> +		UFFD_FEATURE_WP_HUGETLBFS_SHMEM |
>  		/*
>  		 * HACK: here we leveraged WP_UNPOPULATED to detect whether
>  		 * minor mode supports wr-protect.  There's no feature flag
> @@ -2636,6 +2666,7 @@ int main(int argc, char *argv[])
>  	mem_type_t *mem_type;
>  	uffd_test_args_t args;
>  	const char *errmsg;
> +	uint64_t features;
>  	int i, j, opt;
>  
>  	while ((opt = getopt(argc, argv, "f:hl")) != -1) {
> @@ -2711,11 +2742,12 @@ int main(int argc, char *argv[])
>  			/* Initialize test arguments */
>  			args.mem_type = mem_type;
>  
> -			if (!uffd_feature_supported(test)) {
> +			features = uffd_test_features(test, mem_type);
> +			if (!uffd_feature_supported(features)) {
>  				uffd_test_skip("feature missing");
>  				continue;
>  			}
> -			if (uffd_test_ctx_init(&gopts, test->uffd_feature_required, &errmsg)) {
> +			if (uffd_test_ctx_init(&gopts, features, &errmsg)) {
>  				uffd_test_skip(errmsg);
>  				continue;
>  			}
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 
