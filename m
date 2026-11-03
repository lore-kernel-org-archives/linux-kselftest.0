Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729888;
	b=OoTqObtgAVEut4w2TDYP+98fKkj7YO7P1lS/NJhn2/GB/6HDCaiQ2otvtTcJgL4Tj8Ta
	 DKvszghPD3RF4syY9ddqEUlJ1M0IJV3QbxFIhFX6kwW0wdEKh6uwLzEU/D2rrUq+VhJB1
	 F0i0BA+sj0sfVuJjQbcD84lAGqBT5NUpM45/LK/v1Q1O8A7gz4815iiOjN96/rAEVQdJ5
	 OrZFmQUCmPsrqWV044KQUIHBR6Zl8D5RT03frxmK97UJ6WFiD3h1MYMznM84G7LteP3Xm
	 Xgq1CyH1fqMt5q+IMNgy1u2NZQfrk5pk9Nnw9zAJmPIR+CF9+E/8T7awUXptgZDbX1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729888;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DSR0F9dYIX2PVgUgo+faFrW6sPidANVelznumvDC+iU=;
	b=n8y3Fx8yfgH87QKOlRTwlhWxk9S5YRuHcpnRQjN1VlVlwerqqFgWnZ9gYP9pHoThwtrJ
	 UkBscw4B2a8F4YXk6S4Ou+KN0zxVXZad9Qm1p/uDdaEVF4LQwAkEKG/rN7wu8823akmQ2
	 8MWSHsc0fxUP0C2HSJQDrlpX/IQucaNC6UKhNn/m+HJDE2PUv+85VkWQXHMrh6zUjeNLD
	 3Md0pFZ/Zayd97y1/54m9NH5VEZBT/Qw7H/9AJJd5Te/Lp7i85RDwXVK5WlZ0u/D0MinL
	 kg5DdJ4n4+kNYjIEU7TabyTpSX1Y31HfydWVz3CfEG4r7KedFflc5ZhM6in7X1LH7Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l07Usqya;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51799606A326;
	Tue,  3 Nov 2026 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l07Usqya
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9791F00919;
	Tue,  3 Nov 2026 18:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729887;
	bh=DSR0F9dYIX2PVgUgo+faFrW6sPidANVelznumvDC+iU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l07UsqyaJzFG7ahJtea0kkm7vIGcocBIXoapK09NCgQVLOetoXvpcBgb3I2gf4aAJ
	 Zz+/mrV8BT7jEJuET0svSSpZUAHTOXx8GCKqSx9MfTfhkQVuVOWsX/XvLE0J3csxpg
	 sjX17buevItZO6odX3QytPXCFhPfBsVdygyApnYJ/ORsrQn6RVOI7GoFi9N0/7RTj/
	 GMBa0Gqt/MiiA7O+EQNc65lhvT3i7fv7o8YIt9JSwRSNhaLsinK0HLiQbSUYCdw3zj
	 B5gBnNjLf4+2h0Hhn7cbzg3/k4o678sGKD6KmOhYYCnExsL2jd5JAyKvx46Edht78H
	 P9a/IFOnTLxag==
Date: Tue, 3 Nov 2026 20:17:59 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: uffd-wp-mremap: keep the THP sizes in
 unsigned long
Message-ID: <auolVwDqg2rXAGmv@kernel.org>
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

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

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
Sincerely yours,
Mike.
