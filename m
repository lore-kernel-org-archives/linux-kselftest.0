Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB853E1222;
	Thu, 20 Aug 2026 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215297; cv=none; b=L5xkbS4W6vmux2OT41T8Gj9IwLGtZiF+bg7AOynaIzbN+jVbI8QHPbq3iMOjLygMce9GFJgcf+Jqzrc6wDnwjCocJqrI8fXRLVa21PaRyWBPrV4kPx9GbQ3ZglG5ZJFfcUoUHDCkECuO80k4M5+DeaBNCM4WfpEZhT774sy9bKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215297; c=relaxed/simple;
	bh=EV7Eib75e/VHXP2hYlzTbnv8eoTUAkbjm+oN2f1i9rg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LUb48+524N1aWlwWOOAww4KHLiojrhIVJwCC8vagDgd5L0ZXMdJ/sDsg4NJ5cs7cXjTPou2YpiqgwzonCpRkJt4L8qn1AloXtDa/+43qc9MLe9iCHDbdzWNX5UKSf/S4gBi2ibwIjKKNVBmOUtYf0z5v2/vUtVdD8DUFQQZ781o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e62gpA2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e62gpA2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA31D1F000E9;
	Thu, 20 Aug 2026 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215296;
	bh=RpHGyhSdEUHfDs3jDgskTY0Wx14p0J7I6zejU2vbJrA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=e62gpA2O8kMvQeXoqVdvxaZdOyffNIsPv1uZALLeLcWAuQe+7l6m4yw8BtAeRGik5
	 ULhE9N1POvhw2RxVdbHPN4kocGJMK6cq56Dkigo6dHweOolLjsBoXMRGGn4i5CjCY1
	 1xTwEjrawcwZZoXC+TibyhTd4Al24clADx20m0vZ1/r1R+th7WFvOVBAon6Dnbp03Y
	 J6A2fQbmjpDAeETEhTXLsqfLyZ351FTknrUC954MNdTbgVpwkgX4mf70x7esljb0qC
	 TJ8LQQvgZ3i9kJKj3HUwt0uLgYy/PYE33d/ln1SC+gw4cqysavvSqXdQL799F+zzQz
	 J1VLp4m8l4yYg==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 13/19] selftests/mm: cover a shared-source collapse
 write race
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
In-Reply-To: <20260815015901.1236937-14-kirill@shutemov.name>
References: <20260815015901.1236937-1-kirill@shutemov.name>
 <20260815015901.1236937-14-kirill@shutemov.name>
Date: Thu, 20 Aug 2026 11:40:35 +0300
Message-Id: <178721523517.2799959.13840101059380911989.b4-review@b4>
X-Mailer: b4 0.17-dev

> collapse_fork() checks that a fork-shared range collapses in the process
> that asks for it while the co-sharer keeps its own page, but the co-sharer
> sits still while that happens.

co-sharer sounds awkward, can we use parent and child?

> Add a case where the co-sharer writes to the shared range throughout the
> collapse.  CoW has to keep the two sides apart under those writes: the
> collapsing child must see the content from before the fork, and the
> writing parent must see only its own writes.
> 
> The co-sharer unshares one page every 10ms, and only once the collapsing
> side says it is about to start.  Writing the range in a burst breaks CoW
> on all of it before the collapse begins, leaving the child to collapse
> pages that are already exclusive to it.
> 
> Nothing here is new behaviour: the case passes on mainline, and locks in
> isolation that collapse already provides.

And that's imporant because?

> Assisted-by: Claude-Code:claude-opus-5
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 392fd65fcc97..1d357143258a 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -1218,6 +1218,97 @@ static void collapse_max_ptes_shared(struct collapse_context *c, struct mem_ops
>  	ksft_test_result_report(exit_status, "%s\n", __func__);
>  }
>  
> +/*
> + * Content stays isolated while a co-sharer writes concurrently. A shared
> + * source is copied live (not frozen), relying on it being CoW - immutable
> + * for the duration of the copy; a co-sharer's write goes to a CoW copy. The
> + * collapsing child must see the pre-fork content, the writing parent only
> + * its own writes.
> + */
> +static void collapse_fork_cow_race(struct collapse_context *c, struct mem_ops *ops)
> +{
> +	const unsigned long shared = 64 * page_size;
> +	const int stride = page_size / sizeof(int);
> +	int wstatus, child_status, i, n = shared / page_size;
> +	/* volatile: the loop below must really store, on every iteration */
> +	volatile int *ip;
> +	pid_t child;
> +	int sync[2];
> +	char go = 1;
> +	void *p;
> +
> +	p = ops->setup_area(1);
> +	ip = p;
> +	ops->fault(p, 0, shared);		/* shared prefix, pre-fork pattern */
> +	if (pipe(sync))
> +		ksft_exit_fail_perror("pipe()");
> +
> +	ksft_print_msg("Fork, collapse in the child while the parent rewrites...");
> +	child = fork();
> +	if (!child) {
> +		int collapse_status;
> +
> +		close(sync[0]);
> +		ops->fault(p, shared, hpage_pmd_size);	/* private remainder */
> +		/* Start the parent unsharing, and give it a head start. */
> +		if (write(sync[1], &go, 1) != 1)
> +			_exit(KSFT_FAIL);
> +		usleep(5000);
> +		c->collapse("Collapse a range shared with a writing co-sharer",
> +			    p, 1, ops, true);
> +		collapse_status = exit_status;
> +		for (i = 0; i < n; i++)
> +			if (ip[i * stride] != i + 0xdead0000)
> +				break;
> +		if (i == n)
> +			success("OK");
> +		else
> +			fail("Fail: child content");
> +		/* The content check must not bury a failed collapse. */
> +		if (exit_status != KSFT_FAIL)
> +			exit_status = collapse_status;
> +		ops->cleanup_area(p, hpage_pmd_size);
> +		_exit(exit_status);
> +	}
> +
> +	close(sync[1]);
> +	if (read(sync[0], &go, 1) != 1)
> +		ksft_exit_fail_msg("child never reached the collapse\n");
> +
> +	/*
> +	 * Unshare one page at a time.  A burst would break CoW on all of them
> +	 * in microseconds -- wait_for_scan() does not even poll for TICK --
> +	 * and the child would collapse pages already exclusive to it.
> +	 */
> +	i = 0;
> +	do {
> +		if (i < n)
> +			ip[i * stride] = i + 0xbeef0000;
> +		i++;
> +		usleep(10 * 1000);
> +	} while (waitpid(child, &wstatus, WNOHANG) == 0);

Can we please not put waitpid() inside while condition?

-- 
Sincerely yours,
Mike.

