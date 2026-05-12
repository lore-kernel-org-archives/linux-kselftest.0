Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9963A48C8;
	Tue, 12 May 2026 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594802; cv=none; b=iwY2RXXu2P+4niyHdDRnjYUS8rTEJRzBco/2dS2EQVn+ewWGojGabBNzQajMXFhJzLS7eMt+nbQEcu0LRitK6sntJGHl7Y7NOs0zzNbVg8+chE1fKRWA8EIivY1xU+p310SK7ye1lp9JPtux8YixT//adQwx8n2upRfS+QB1iks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594802; c=relaxed/simple;
	bh=l8rlIftvUwZSA3nVW/yOkWdGvGYk/uXyMrRJvJWFUmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEr1Vtb1yZvVTvg3hCaD/W9/XsQGNzpQdypVPgeMp57DzO1ybo3/N+uwfUnBAES6asgILmR0Dr/1KKpN2RG6iF+b86OHBAKC1RuFgunP0dFlX1kLd3YnpljvB5jObcGvrWk3C5vuDiw7v8OtOf/A8qnwSex73eCfxGhX31Z/05A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMwv/PYL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMwv/PYL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64388C2BCF5;
	Tue, 12 May 2026 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594802;
	bh=l8rlIftvUwZSA3nVW/yOkWdGvGYk/uXyMrRJvJWFUmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMwv/PYLaQ69DlNxjWQ2j43T1AFY79ij4iokB7EeOKbyrAWlwfRbBkMabIl17U6uL
	 XSXRDqVBrTa9CHG5VeHjNo5Y9U4cC7eSw5/z8TYlfjSwpakekcUlQnKEKUsL3/XBuL
	 XsK2Lr5UzPMQ5ZQNxwhPq51f/NxNcp6XcDP6iz6JS1qTCZD25Jx257dT1OWmnRcJBL
	 JcZTbWbhR1erUZ1cmbILgtIYEXbHjARiWXdprmsXJflT8pn4XdZJzmmYGFkviv+WAK
	 HB/ATVzZl/YdXZ3LRXUiIMs2Vm7GVsl81DI5nAohxGZd2n5kxJa6h4RUjLcEM+Yhif
	 y89q5NsyUreYA==
Date: Tue, 12 May 2026 15:06:37 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix mmap() return value check in
 run_migration_benchmark
Message-ID: <agMz2PftVnfzIQpC@lucifer>
References: <20260512101305.139509-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512101305.139509-1-lihongfu@kylinos.cn>

On Tue, May 12, 2026 at 06:13:05PM +0800, Hongfu Li wrote:
> mmap() returns MAP_FAILED on error, not NULL.  The current check uses
> !buffer->ptr, which evaluates to false when mmap() fails (since
> MAP_FAILED is (void *)-1, not 0), so the error path is never taken.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/hmm-tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
> index 788689497e92..d72adba5c74e 100644
> --- a/tools/testing/selftests/mm/hmm-tests.c
> +++ b/tools/testing/selftests/mm/hmm-tests.c
> @@ -2688,7 +2688,7 @@ static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_siz
>  	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
>  			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
> -	if (!buffer->ptr)
> +	if (buffer->ptr == MAP_FAILED)
>  		return -1;
>
>  	/* Apply THP hint if requested */
> --
> 2.25.1
>
