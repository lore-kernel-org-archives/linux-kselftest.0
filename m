Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A136C59E;
	Tue, 12 May 2026 12:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588496; cv=none; b=aG6VEU3YxoUVKBF67bC/QsdSprGGPKxjNfCx7mOKaEdf3Mt0pi5dgXiSWSPOE8ROxlbjiAmjWS9dnl/8xKeMRFI5rQo7//5RbeWwNtK0eY2L4F0f13cNrpWcfetQbS3qwgSzX+YfnWq5wUXDn2FPbnjbKSac8n4e1JzDxK6BWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588496; c=relaxed/simple;
	bh=wqAIUXGNRFLlciEzYLfd74vbbJTuTmippmPLs7dX3ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bb65gB3EWgb62Hw9WaLTyDvgbI6t2zQneZtM7MUH2KfZgbnPq+yk494QQnaROszq93qDX4XMn4zqqDyjDk08BGZbk8pew80v+I2F+0I6CL1YPBiY4S0VMx/x8d2zq4eVK0D1qBy74if0b1dQwfa3O8lLMSSkJLOIZjiRQihzzGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j83PBPm9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j83PBPm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65147C2BCB0;
	Tue, 12 May 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778588496;
	bh=wqAIUXGNRFLlciEzYLfd74vbbJTuTmippmPLs7dX3ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j83PBPm90V70Z5DzvXF/3ALqo6TXArDPPwEh49VBE2prM9PIC8+QiZm8wPP1vX0ES
	 fEqsbz26nHNAhiXOyR/MEJHOLhUDrAYgycH4Ep0mcOx3E9YfLFeMqUYxC2FNw7ed7T
	 /TLDLKuSf9FZPO7ncyuDSSmzbXMdJlN3DtvRM7ZbFxkvWOkMS4NEiczktj0VWg9WZf
	 LG+kjWyYJhnmfZ2EXeJ8ynXUMi+f/tPRQ3poYQ0ez2jSAZj24dxEtXnGE5yP6ChUZd
	 yUxcB/Z91qGqxb3a46U6SDuzlEU5e7yTVJmX5lozqtxmRqXmpvtTx3ERcZH5Ap4a6d
	 HfZkFvN4Hg3EQ==
Date: Tue, 12 May 2026 15:21:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: jgg@ziepe.ca, leon@kernel.org, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix mmap() return value check in
 run_migration_benchmark
Message-ID: <agMbSBgaBRoh2-xn@kernel.org>
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

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

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

-- 
Sincerely yours,
Mike.
