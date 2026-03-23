Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A1D2C187
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774252915; cv=none; b=aF0TPnTfPs8pucg893KNIaUWwI33XNe6/7FDivZTT4pHHS1dmNG6Zd2OO+n37UtpGIx/NO72VZOzIfMlEwfEyTlk9L0qMjAP0wlEMfSNMDk7ouG9QN93vCVs8yz6oCDLTSBXog0bqf+qvJ2u+UaizVjx+J+dbgVE4L7ZUaGAv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774252915; c=relaxed/simple;
	bh=kAtaH+mqS1nASzQ56xfnzIyJ9ONmFmkFr7Aq2kvL10Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLmw/VfyWsTWLkhTWe5apeHcoBrtg0sHVN9pftsXUN0V+AIiBtsXn9dF3hLCyhhtsKOZVrSRbqnmmFD+S6mYxU8MhCz5IiQ2zonNVJxhffybbQpO2l9a2sp1/STM/dGZmOVQMFYJBT4PVEAhghbavvZNFoY+X57vMOnW4n2Ue1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RIW+EtBq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=izw/pqxL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RIW+EtBq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="izw/pqxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774252913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ro+dI1rVslz2A4EMJRdKgBDV6ykDd3GWRMG35AhNJtw=;
	b=RIW+EtBqhku9DQZkq7sxmaUWq6wOqlucTEJ4m+aE03CWIx0moH/D2aC0sal54Omdg5Yaqk
	GHM0wFTkePEBXDd7JqyO6WRC91eGSrhQkQ6R1FCqj3wSXSxCbbl+vjAwrTi3OFqUcXzyq8
	COzLzPgO7ZV5H7sCGaib5htCegOpaqA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-hoZIMQ5qPqiztw3kmWBYkg-1; Mon, 23 Mar 2026 04:01:51 -0400
X-MC-Unique: hoZIMQ5qPqiztw3kmWBYkg-1
X-Mimecast-MFC-AGG-ID: hoZIMQ5qPqiztw3kmWBYkg_1774252910
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c629a3276e9so20209178a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774252910; x=1774857710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ro+dI1rVslz2A4EMJRdKgBDV6ykDd3GWRMG35AhNJtw=;
        b=izw/pqxLV/e1+/7NXdPWtAFdB7NU4MkctC60dyu8YyKSfNUwqQXQn/nfy2JQVQTqYU
         LS/Ztp9Q6zd3LbmA4FLDYBhCaEfuwgUQjFhBJ9nEFdjFCUBbKLTK4/YhKhmBj07A7QeN
         fClITUD7uOFA8jNZJTW3RBf1ZLK/93dJUbR/xz7d+lt+H8YEjuUqqXYcDC6rhadt5Bj2
         WM9qKeRPdr/qg9lJZHjv/gyYxMB7pofm5H+UtfIVsV6yzmT11MQjJ4MjNkrbUNNlPxdw
         ZIHC6V4bD44355c7EcLcYZcijZf/eL2dJjXE3/9Naq6yKc9JThBP2kCYMDg5OqqHLDV9
         A1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774252910; x=1774857710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro+dI1rVslz2A4EMJRdKgBDV6ykDd3GWRMG35AhNJtw=;
        b=WaYLEVaCHdlA4sguLzlR7RDFtFiIp/7AOpXFR2aHxA8xDgU5m0HDgi/u58Nu0+1USr
         Om7sgy3OMGTNFk+TumzmkOHMqgiHA0RjqkLzGOHQq43WG8TLQ8sfNEKJ43xn3++RTjp+
         uI6JbYqMSYFFwNQvOixk6IsxSGEgCqpd2GUdBXj025VI53xN1ndhkPLKZBBmf8W8MltX
         4qgdjfCjKcEt8e5w6ROD1EhyIUQvMVeZ/C9vclXYSVYTiQ+pQU1Pc5IR6h9UQOQA/Dn7
         MZk84RDgjcZbgwMHmQHF7H1VLLypFiXYbh3dVeRYR5K9Zocx37FJ0lJRG7oc7KDnbUxn
         EsOA==
X-Forwarded-Encrypted: i=1; AJvYcCWQsHyVv+ZgYy3GXy76EgaPx+1ZAEiblJMBEXYkhjwT4bm3UCDi6GB6GLyxrNauGlzXO9Ig3oD1nzve+m4HxPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDWXNss/jv1QYsRmxqTNaiwmpS66yd4u9sMRvZmSBtlZCAlKxw
	/klRpZSn9b5NYPqsHKsugHDqlFQBw/pOWdXUCqxoWNb7yslViOICdPXcK7gIkX6tDAG9L+Oekn4
	doRHfJrzzzetMSYy2FdhdYnexrhG6Y8uudTXhNjnxqnPEFiJEJgCw0Re09VePzn9E8/9yhQ==
X-Gm-Gg: ATEYQzzY4rG6vNzvq2Ubhr5m6gv8tJc9KdJ36bazT7J5sCZs3z4fkwn8eftCPGqcHSU
	Y+R+jPFtwxfzIuvjwBKq0U/cjBQDW0+sT1+KT4kpk3WvsLkcUTz7cFTULbHMbW0DZeZLQXgFq6l
	N8wS1au03mEntWoBUYE1iRO6H+4QEJphqt7BtIwWE62B30fC3OZgbVJp7uukLeuQ9vAUySk3qzc
	ssKItrs4DIz8NcOi/Qo0Zx2xA0SumK6DOOnFnuboI42mPGmBBCRdnGhr0SOiRUYZoFg6U2jfWyt
	1v+RVvo2uJBMQcebVwE0q/tbrkfpFyCBwpr3jINdWCtKa6ig0LNbrE6XavZ8FRsuIDf72DRbHPY
	7DOoX2/NIgUbG3Ewgqw==
X-Received: by 2002:a05:6a00:228e:b0:827:26b0:58d6 with SMTP id d2e1a72fcca58-82a8c334b58mr9632684b3a.47.1774252910136;
        Mon, 23 Mar 2026 01:01:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:827:26b0:58d6 with SMTP id d2e1a72fcca58-82a8c334b58mr9632636b3a.47.1774252909675;
        Mon, 23 Mar 2026 01:01:49 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409bf65sm8649474b3a.34.2026.03.23.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:01:49 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:01:46 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 4/7] selftests: memcg: Increase error tolerance in
 accordance with page size
Message-ID: <acDzaouBPCIpB7Ij@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-5-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-5-longman@redhat.com>

On Fri, Mar 20, 2026 at 04:42:38PM -0400, Waiman Long wrote:
> It was found that some of the tests in test_memcontrol can fail more
> readily if system page size is larger than 4k. It is because the
> actual memory.current value deviates more from the expected value with
> larger page size. This is likely due to the fact there may be up to
> MEMCG_CHARGE_BATCH pages of charge hidden in each one of the percpu
> memcg_stock.
> 
> To avoid this failure, the error tolerance is now increased in accordance
> to the current system page size value. The page size scale factor is
> set to 2 for 64k page and 1 for 16k page.
> 
> Changes are made in alloc_pagecache_max_30M(), test_memcg_protection()
> and alloc_anon_50M_check_swap() to increase the error tolerance for
> memory.current for larger page size. The current set of values are
> chosen to ensure that the relevant test_memcontrol tests no longer
> have any test failure in a 100 repeated run of test_memcontrol with a
> 4k/16k/64k page size kernels on an arm64 system.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  .../cgroup/lib/include/cgroup_util.h          |  3 ++-
>  .../selftests/cgroup/test_memcontrol.c        | 23 ++++++++++++++-----
>  2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> index 77f386dab5e8..2293e770e9b4 100644
> --- a/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> +++ b/tools/testing/selftests/cgroup/lib/include/cgroup_util.h
> @@ -6,7 +6,8 @@
>  #define PAGE_SIZE 4096
>  #endif
>  
> -#define MB(x) (x << 20)
> +#define KB(x) ((x) << 10)
> +#define MB(x) ((x) << 20)
>  
>  #define USEC_PER_SEC	1000000L
>  #define NSEC_PER_SEC	1000000000L
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index babbfad10aaf..c078fc458def 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -26,6 +26,7 @@
>  static bool has_localevents;
>  static bool has_recursiveprot;
>  static int page_size;
> +static int pscale_factor;	/* Page size scale factor */
>  
>  int get_temp_fd(void)
>  {
> @@ -571,16 +572,17 @@ static int test_memcg_protection(const char *root, bool min)
>  	if (cg_run(parent[2], alloc_anon, (void *)MB(148)))
>  		goto cleanup;
>  
> -	if (!values_close(cg_read_long(parent[1], "memory.current"), MB(50), 3))
> +	if (!values_close(cg_read_long(parent[1], "memory.current"), MB(50),
> +				       3 + (min ? 0 : 4) * pscale_factor))
>  		goto cleanup;
>  
>  	for (i = 0; i < ARRAY_SIZE(children); i++)
>  		c[i] = cg_read_long(children[i], "memory.current");
>  
> -	if (!values_close(c[0], MB(29), 15))
> +	if (!values_close(c[0], MB(29), 15 + 3 * pscale_factor))
>  		goto cleanup;
>  
> -	if (!values_close(c[1], MB(21), 20))
> +	if (!values_close(c[1], MB(21), 20 + pscale_factor))
>  		goto cleanup;
>  
>  	if (c[3] != 0)
> @@ -596,7 +598,8 @@ static int test_memcg_protection(const char *root, bool min)
>  	}
>  
>  	current = min ? MB(50) : MB(30);
> -	if (!values_close(cg_read_long(parent[1], "memory.current"), current, 3))
> +	if (!values_close(cg_read_long(parent[1], "memory.current"), current,
> +				       9 + (min ? 0 : 6) * pscale_factor))
>  		goto cleanup;
>  
>  	if (!reclaim_until(children[0], MB(10)))
> @@ -684,7 +687,7 @@ static int alloc_pagecache_max_30M(const char *cgroup, void *arg)
>  		goto cleanup;
>  
>  	current = cg_read_long(cgroup, "memory.current");
> -	if (!values_close(current, MB(30), 5))
> +	if (!values_close(current, MB(30), 5 + (pscale_factor ? 2 : 0)))
>  		goto cleanup;
>  
>  	ret = 0;
> @@ -1004,7 +1007,7 @@ static int alloc_anon_50M_check_swap(const char *cgroup, void *arg)
>  		*ptr = 0;
>  
>  	mem_current = cg_read_long(cgroup, "memory.current");
> -	if (!mem_current || !values_close(mem_current, mem_max, 3))
> +	if (!mem_current || !values_close(mem_current, mem_max, 6 + pscale_factor))
>  		goto cleanup;
>  
>  	swap_current = cg_read_long(cgroup, "memory.swap.current");
> @@ -1684,6 +1687,14 @@ int main(int argc, char **argv)
>  	if (page_size <= 0)
>  		page_size = PAGE_SIZE;
>  
> +	/*
> +	 * It is found that the actual memory.current value can deviate more
> +	 * from the expected value with larger page size. So error tolerance
> +	 * will have to be increased a bit more for larger page size.
> +	 */
> +	if (page_size > KB(4))
> +		pscale_factor = (page_size >= KB(64)) ? 2 : 1;

This is a good improment but I still think the pscale_factor adjustments
are a bit fragile, each call site needs its own hand-tuned formula, and only
three page sizes (4K/16K/64K) are handled. If a new page size shows up,
every call site needs revisiting.

How about centralizing the page size adjustment inside values_close()
itself? Something like:

    static inline int values_close(long a, long b, int err)
    {
          ssize_t page_adjusted_err = ffs(page_size >> 13) + err;
    
          return 100 * labs(a - b) <= (a + b) * page_adjusted_err;
    }

This adds one extra percent of tolerance per doubling above 4K, scales
continuously for any power-of-two page size, and also fixes an integer
truncation issue in the original: (a + b) / 100 * err loses precision
when (a + b) < 100.

With this, the callers wouldn't need any changes at all.

This method is inspired from LTP:
  https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/controllers/memcg/memcontrol_common.h#L27

-- 
Regards,
Li Wang

