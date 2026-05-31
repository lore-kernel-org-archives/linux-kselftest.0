Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5045324EAB1;
	Sun, 31 May 2026 14:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780237912; cv=none; b=NxLjDELgXU7YmWBogMhH8brJjcHc4FrNah+WKx9VSxZpYqNMRaiobEq+BTI6jNRsxEs3F/bXW3lAFgGnoiMYa0p+0Z3iGxFx1vq8k6mRLfptB6rTnYoigZsn1TA0j/r2RvcNWhCb96yTOFZMTwGtxGnLMh3+AtKo7ZnyCuz6DEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780237912; c=relaxed/simple;
	bh=f4gStJ2aexkx3ldgOoRgKMegiTg3que+wUkLc7mWHWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZl3bp7gtY6Vs5ERt4RJEQoFW9e1mPq52Xt6nqSfzLyx5/SxILM32DIqA2w+DHI3KZW/xtJahtOxHfDRpROO4Uj6+XoG0m11Yz2pd1XVspmZKlt2harMaIRxw9s/hUM3WjDwFtqxBvIdh+X74vTJEGk4CpHrQDABlxy9WYppXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itLeleWj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itLeleWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D121F00893;
	Sun, 31 May 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780237911;
	bh=VH65tbFn/cmtsF072HRQao+gX1EFVbFjdBx5iGwdBNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=itLeleWjfiVH9EbXtx0ATIlQrtbycOnld+xJp/WELYVcoAHooVNGfTto8GAJaMjZZ
	 3UrhZkBgMWD82y+1XsAllxPLHNz2Mimt9K8EZywOoju3sWVJ56mGJZ/+qRR683BsEG
	 XDesXW6/ZW9359/Tdibb2CAu+uFpzjkmAcZdc7Z5+WHzocVB1J6GiDavTksfvjeXWK
	 2rLzur0pScv0nxJr2vIMG/Y8f34uMcDkQaGSG9TZhIBUEiJxDFJAFXalRxnN9DWvmV
	 H4EJ4asejInO5H9bijLUTmlaXddp+AAwfSH6lNZhuIihAX+gSZzav9JZidYYhV46rB
	 r7eS8oAtgg75g==
Date: Sun, 31 May 2026 17:31:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] selftests/mm: unify pkey sighandler selftest
 assertions and tracing
Message-ID: <ahxGT9Q4JjhHBK0z@kernel.org>
References: <20260529071633.2807814-1-lihongfu@kylinos.cn>
 <20260529071633.2807814-3-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529071633.2807814-3-lihongfu@kylinos.cn>

Hi,

On Fri, May 29, 2026 at 03:16:31PM +0800, Hongfu Li wrote:
> Add per-test tracing to the pkey signal-handler selftest and use
> pkey_assert() for error handling. Each test enables tracing at start
> and disables it at end; on failure, pkey_assert() calls abort_hooks()
> to turn tracing off so ftrace is not left enabled.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  .../selftests/mm/pkey_sighandler_tests.c      | 104 +++++++++---------
>  1 file changed, 50 insertions(+), 54 deletions(-)
>
> @@ -323,18 +323,18 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  	memset(&siginfo, 0, sizeof(siginfo));
>  
>  	/* Use clone to avoid newer glibcs using rseq on new threads */
> -	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> -			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
> -			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
> -			     CLONE_DETACHED,
> -			     stack + STACK_SIZE,
> -			     &parent_pid,
> -			     &child_pid);
> -
> -	if (ret < 0) {
> -		errno = -ret;
> +	child_pid = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> +			      CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
> +			      CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
> +			      CLONE_DETACHED,
> +			      stack + STACK_SIZE,
> +			      &parent_pid,
> +			      &child_pid);
> +
> +	if (child_pid < 0) {
> +		errno = -child_pid;

This change does not seem related at all to the patch.

>  		perror("clone");
> -	} else if (ret == 0) {
> +	} else if (child_pid == 0) {
>  		thread_segv_maperr_ptr(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
>  	}
>
> @@ -494,23 +490,22 @@ static void test_pkru_sigreturn(void)
>  	sigstack.ss_size = STACK_SIZE;
>  
>  	/* Use clone to avoid newer glibcs using rseq on new threads */
> -	long ret = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> -			     CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
> -			     CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
> -			     CLONE_DETACHED,
> -			     stack + STACK_SIZE,
> -			     &parent_pid,
> -			     &child_pid);
> -
> -	if (ret < 0) {
> -		errno = -ret;
> +	child_pid = clone_raw(CLONE_VM | CLONE_FS | CLONE_FILES |
> +			      CLONE_SIGHAND | CLONE_THREAD | CLONE_SYSVSEM |
> +			      CLONE_PARENT_SETTID | CLONE_CHILD_CLEARTID |
> +			      CLONE_DETACHED,
> +			      stack + STACK_SIZE,
> +			      &parent_pid,
> +			      &child_pid);
> +
> +	if (child_pid < 0) {
> +		errno = -child_pid;

Ditto.

>  		perror("clone");
> -	}  else if (ret == 0) {
> +	} else if (child_pid == 0) {
>  		thread_sigusr2_self(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
>  	}
>  
> -	child_pid =  ret;
>  	/* Check that thread exited */
>  	do {
>  		sched_yield();

-- 
Sincerely yours,
Mike.
