Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793725821;
	b=gfT9+gSUZo/nbPfQyQ+d97gAj4mxd9sf1HzLeB0htTc8LWHuVmZXZEZfFzDWpgTi7Uso
	 8e6vhiUnad7r0JV6vZb+KXpbHvLEm7Q8z8cAirY3GG/mFqEB6XQbokaYRkqQpMQnB7/6U
	 uPvYTtT2GNFayFHqJGZUwU/Y/WPWK4RdkGnroFgRJEzgc7WKRqyFiollsFO6nWMImgxlN
	 N2jHMAnwOOItqFTQRqrxru4y7empUWIIB3gh7ia+Jh5cq37aucpPkuFVSqXY5FD8Q9Cx+
	 GdN+pdqkF9R6y+XAH92KFmPS2VEe5k1JcQ1KCJKFi0RggTiQOtNXJlCPvmi867leScw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725821;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+TD4KfNsj3/UrFRijVzp0aBQ2ycYA4MK0lvSZb8XyWU=;
	b=2tlgVMF0Yyc5m5e95BdboofvWtlJBhKfq3aayrZKF7i8Bj4onukV2rZivI/nUIEHL3F5
	 XemKx3KRhBn9XnDgGOMXOqLaVD8nEvNavXxZht/y1jamuZg5zdTFf68UQwpbCjUgpfBg9
	 RfonnhSN/oS9ObgLjiKCgOnNtFRprAE1wfEJ+yIuvHmkzUuphZY9lxiy3PVu8AeqCvxH4
	 oaxY2a6oU3yOrZ/e8L9rd5sGfyNq72cR4Fs3DbIPozjdopYK2S1GUNluktR4YjQH9tlnX
	 L/VHeLTzUQ3qQ7u3sICpOOIg9w5XodcsyjxbzZFY7Q+xAjZ84fWxesDCE70fwhM5b3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxaGgJX+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44680606A32F;
	Tue,  3 Nov 2026 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxaGgJX+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57F51F000C1;
	Tue,  3 Nov 2026 17:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793725820;
	bh=+TD4KfNsj3/UrFRijVzp0aBQ2ycYA4MK0lvSZb8XyWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VxaGgJX+NhI3el1gfofJnmiTMXPVVPFAD/Zbbn2GN8+WYkhKJNmd4FtAzHHVV4bjX
	 Se4xnfAVE52NXtS/7ybU/dgIMm29RQXtpnLk7xb4Wfh4YNy15K3ele0RnTXudceNv+
	 rJxnEsfQRfoVJ7V42VfVH0oJrZAFvLM+x69erRZcn5skFeJFkPu3MzdUWslSQ0bT5w
	 xy3K/kqUZBQqWMRpwPNxVZcF/ZNnQccLeVjG4Q5PTomGqFACK0aMAQBeEAEqiWcSkk
	 pKexwSv6lzbL9OMdMnBETRwZKg5jI87wm6H67UUUxyUonhawZmkJxxnlFhpu6Dv66B
	 v+hUzBuGNVc6A==
Date: Tue, 3 Nov 2026 17:10:15 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: uffd-wp-mremap: keep the THP sizes in
 unsigned long
Message-ID: <auoVbT8O10HFC2ju@gremlin>
References: <20261103150232.291827-1-sashal@kernel.org>
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
In-Reply-To: <20261103150232.291827-1-sashal@kernel.org>

On Tue, Nov 03, 2026 at 10:02:32AM -0500, Sasha Levin wrote:
> Commit 0020a1f5ca36 ("selftests/mm: hugepage_settings: use unsigned long
> in detect_hugetlb_page_size") changed the sizes of the test cases to
> unsigned long, but left thpsizes and detect_thp_sizes() with size_t. On
> 32-bit architectures size_t is unsigned int, and gcc 14 rejects the test
> cases that point at thpsizes:
>
>   uffd-wp-mremap.c:299:26: error: initialization of 'long unsigned int *' from incompatible pointer type 'size_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]
>
> Use unsigned long for the THP sizes as well.
>
> Fixes: 0020a1f5ca36 ("selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> KernelCI's 32-bit arm kselftest builds hit this. Built the mm selftests
> with gcc 14 and gcc 16 -m32 (four errors in this file before, none
> after) and natively with gcc and clang (no change). An i386 build with
> clang runs and detects the THP sizes as before, up to the point where
> the test needs root.
>
>  tools/testing/selftests/mm/uffd-wp-mremap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
> index c48eaab8e75cf..fb5582ec5b201 100644
> --- a/tools/testing/selftests/mm/uffd-wp-mremap.c
> +++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
> @@ -15,7 +15,7 @@ static int pagemap_fd;
>  static int nr_pagesizes = 1;
>  static unsigned long pagesize;
>  static int nr_thpsizes;
> -static size_t thpsizes[20];
> +static unsigned long thpsizes[20];
>  static int nr_hugetlbsizes;
>  static unsigned long hugetlbsizes[10];
>
> @@ -30,7 +30,7 @@ static void check_uffd_wp_feature_supported(void)
>  		ksft_exit_skip("uffd-wp feature not supported\n");
>  }
>
> -static int detect_thp_sizes(size_t sizes[], int max)
> +static int detect_thp_sizes(unsigned long sizes[], int max)
>  {
>  	int count = 0;
>  	unsigned long orders;
> --
> 2.53.0
>

--
Cheers, Lorenzo
