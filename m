Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8645395DAC;
	Thu,  2 Jul 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977889; cv=none; b=ewU6OA1eh82/LrGXaL91fc1khFL0gIJtUF0IDijUEHL8M8IGTBU56ujv4A10rtv1Wq3ZZ5Efgtla3KztlvJZT9V1X6uNBex4nSt1UazzmGvmw3isljBWwdcNfqSZG4n4dHdNkmCbK3ty9kgeh/eipM8Ft7SWbjIx04kmXXZGQTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977889; c=relaxed/simple;
	bh=rXqvzGsraLo4bz39bD6Do823xLmY++4Ub/U3pIKM6wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdRffIWgWQuC/zpFJPRBtxe5LdeGh7W+xGtZSztdPE1Lot6obZPj9zuNSOLLeSjoTkxTJlGNljpNTTPd8r+t6gnOyIt47GG5HqQErEmC237pI0sqfQAsJA9QnUNnGvj6hhS9KVkkll90bXnnDwrNhPeQaL6875i3VIB6l+vyi8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqcKK/eC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqcKK/eC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005031F000E9;
	Thu,  2 Jul 2026 07:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977887;
	bh=ScRPNo05HGy2VFZrVotKD3VBqJhePVIgkDdkR51CGQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NqcKK/eCkuSNNF3ayHR9kAXPOn7vAYyWzqLZkA0my370nMZ+DA/J++D/5CBBJKNfJ
	 A+KItAHhnM60kMxcvW0ITYp190a5QUnqDsyNf+F8+0AkggbtH6yfXdduBHRII+0OAZ
	 kH2xm0YgM2t0R4fIstssYP91tS4D0bcFayC1CJTZI0Bm2OQIB7Sp1rpvUAriyir58N
	 JGh5dEKiVuMZRYDNOurmoM2O0iLsod/KgdU0hJfRhCFBkpf19A3NRjPfOQ1j5XgU+U
	 NtS8Dybf/pMtN8CItgPGqG8fLYSytPeVjrRQjVz582jpVw0jExPbebsLs82gpiGCcN
	 VFVvEQCYjvA3Q==
Date: Thu, 2 Jul 2026 10:37:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	13667453960@163.com
Subject: Re: [PATCH] selftests/mm: cow: fix leaks in
 child_vmsplice_memcmp_fn()
Message-ID: <akYVVzhEpG3-D3LF@kernel.org>
References: <20260702072436.739677-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702072436.739677-1-yijiangshan@kylinos.cn>

On Thu, Jul 02, 2026 at 03:24:36PM +0800, Jiangshan Yi wrote:
> child_vmsplice_memcmp_fn() allocated two heap buffers (old, new) and
> opened a pipe, but every return path - including the normal one -
> returned directly without freeing the buffers or closing the pipe file
> descriptors. It also used the malloc() results without checking them,
> so memcpy(old, mem, size) would crash on allocation failure (size can
> be as large as a huge page).
> 
> The sibling helper do_test_vmsplice_in_parent() in the same file already
> uses the goto-based cleanup pattern; follow it here.

The difference is that child_vmsplice_memcmp_fn() runs in a forked process
that dies if any error happens, so the allocated resources are anyway
immediately freed.

> Check the allocations up front

This is the only check that is actually required, others are nice to have
at best.

I'd keep the code simple and only add the allocation check that returns
-ENOMEM on failure.

> and introduce unified error handling with goto labels so that old/new are
> always freed and both pipe fds are always closed before returning, on
> every path.
> 
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  tools/testing/selftests/mm/cow.c | 44 ++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/cow.c b/tools/testing/selftests/mm/cow.c
> index 0c627ea89ff7..f6a1bedfd6e2 100644
> --- a/tools/testing/selftests/mm/cow.c
> +++ b/tools/testing/selftests/mm/cow.c
> @@ -145,26 +145,39 @@ static int child_vmsplice_memcmp_fn(char *mem, size_t size,
>  	char *old, *new;
>  	int fds[2];
>  	char buf;
> +	int ret;
>  
>  	old = malloc(size);
>  	new = malloc(size);
> +	if (!old || !new) {
> +		ret = -ENOMEM;
> +		goto free;
> +	}
>  
>  	/* Backup the original content. */
>  	memcpy(old, mem, size);
>  
> -	if (pipe(fds) < 0)
> -		return -errno;
> +	if (pipe(fds) < 0) {
> +		ret = -errno;
> +		goto free;
> +	}
>  
>  	/* Trigger a read-only pin. */
>  	transferred = vmsplice(fds[1], &iov, 1, 0);
> -	if (transferred < 0)
> -		return -errno;
> -	if (transferred == 0)
> -		return -EINVAL;
> +	if (transferred < 0) {
> +		ret = -errno;
> +		goto close_pipe;
> +	}
> +	if (transferred == 0) {
> +		ret = -EINVAL;
> +		goto close_pipe;
> +	}
>  
>  	/* Unmap it from our page tables. */
> -	if (munmap(mem, size) < 0)
> -		return -errno;
> +	if (munmap(mem, size) < 0) {
> +		ret = -errno;
> +		goto close_pipe;
> +	}
>  
>  	/* Wait until the parent modified it. */
>  	write(comm_pipes->child_ready[1], "0", 1);
> @@ -174,11 +187,20 @@ static int child_vmsplice_memcmp_fn(char *mem, size_t size,
>  	/* See if we still read the old values via the pipe. */
>  	for (total = 0; total < transferred; total += cur) {
>  		cur = read(fds[0], new + total, transferred - total);
> -		if (cur < 0)
> -			return -errno;
> +		if (cur < 0) {
> +			ret = -errno;
> +			goto close_pipe;
> +		}
>  	}
>  
> -	return memcmp(old, new, transferred);
> +	ret = memcmp(old, new, transferred);
> +close_pipe:
> +	close(fds[0]);
> +	close(fds[1]);
> +free:
> +	free(old);
> +	free(new);
> +	return ret;
>  }
>  
>  typedef int (*child_fn)(char *mem, size_t size, struct comm_pipes *comm_pipes);
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.
