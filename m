Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002261;
	b=yoByLnhe3sDi/q4O70om8MnC6oBJlicmP7jDTTJTnfYMZ1HnyyqQDsLh0/o3HgdophWn
	 vZvv/ekQiHuY8OzpxPy4D+GB/dJXfRr8eHDglRtjvh7+j/FGyY6MhF8T+MLjOD2V15aJM
	 +U0LIfEYRKZoWxV7vnwAOUWfayDNN6mPqn+VuxKwIPhgejvgHyoRT9L8NYn6C0Ijabw6u
	 k9iJN20p88ADUH6m00c/KbJlEaCSUB+HLHH07IslFIKfaKl00/HKWCpIQS+9/kw/0Brsk
	 FXkCwhUOn82aItP60qPc1r+WCbvPeyxDCjYiK3xFw9G4RSNfD+BMfvmxARtzlqBKFAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002261;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UjgBmaYbtk3hDeZHleWHp4qTH9qs/UcQC70Eqqw69Hg=;
	b=S5i8QdnpwsXDq6Tc6GV61ufKSxIKfwbL3/v9YK0zPIVa7Zb89kq0QnI+lJs53m1UjUQ8
	 qwhRvNSBdNIOQn2zdPUkmHqjqHHhQNb7U7mZxw7dFNovci64d8futLh2FZqjOo0DfE6gn
	 KwBcVzvWKIkhZnlJJKPwQnFPCEYv06VDRScLddbeU88FCdbSV9cLOfbw2HgMG1Dsiue1f
	 XUVS8ESFdeaEYGmoNhzavnlDu50xVVbSXszb0Z1xC6AxNH7UbXyDYRDTxXBT2IFdXp5/z
	 glN/UuW052SA5MbAIFzUIKpGfREVzCKgnMXQmUdmCwPVLHBnuiKBKVZwkGdeVBAld0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=j6BKfUG3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0134C606D81B;
	Fri,  6 Nov 2026 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=j6BKfUG3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2B41F008BD;
	Fri,  6 Nov 2026 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794002260;
	bh=UjgBmaYbtk3hDeZHleWHp4qTH9qs/UcQC70Eqqw69Hg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j6BKfUG3GaS0Vs9N8H6+JvGjgpMhMCu0xfZTiqVksMX1t+mOYMs03CAKwArlJQ5td
	 PMItW+thtQGDZMLzoBYFZYTcbjuf+WF/jMDk77D4Xa6G2G3Za/lx9B8DEj63WQhy1k
	 Jdd6h2l84mJg0uSz3s0MdkU+dYAnLgwfL4sLuYw8=
Date: Fri, 6 Nov 2026 13:57:39 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Carlos =?ISO-8859-1?Q?L=F3pez?= <clopez@suse.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dave.hansen@linux.intel.com, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah
 Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kselftest@vger.kernel.org, Muhammad Usama Anjum
 <usama.anjum@arm.com>, Joey Gouly <joey.gouly@arm.com>, Kevin Brodsky
 <kevin.brodsky@arm.com>, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: pkeys: wait for the child in
 become_child()
Message-Id: <20261106135739.113e4b432ecb6e92f62e37d4@linux-foundation.org>
In-Reply-To: <20261106164639.2959195-1-clopez@suse.de>
References: <20261106164639.2959195-1-clopez@suse.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri,  6 Nov 2026 17:46:39 +0100 Carlos L=F3pez <clopez@suse.de> wrote:

> become_child() forks during test_pkey_alloc_exhaust() and has the parent
> exit, so that the remaining tests run in the child. However, the test
> runner only waits for the original process, so it sees the test finish
> early with a success status while the remaining tests keep running in
> the background. Failures after the first fork are thus not reported in
> the exit status, and the remaining tests overlap with the next selftest.
>=20
> Fix this by waiting for the child in the parent and exiting with its
> status. A previous fix avoided waiting, arguing that the parents would
> keep holding their resources [1]. Particularly, the parent keeps the
> hugetlb reservation of its test memory, so the child runs out of hugetlb
> pages after a few iterations. Avoid this by freeing the test memory
> before waiting.

Thanks.

>  tools/testing/selftests/mm/protection_keys.c | 16 +++++++++++++---

get_maintainer coverage of selftests is poor, alas.  So it's a good
idea to poke around in the git-blame output to figure out who best to
cc.  I added four new lucky duckies to this thread.

> --- a/tools/testing/selftests/mm/protection_keys.c
> +++ b/tools/testing/selftests/mm/protection_keys.c
> @@ -1009,9 +1009,10 @@ static void test_pkey_syscalls_bad_args(int *ptr, =
u16 pkey)
>  	pkey_assert(err);
>  }
> =20
> -static void become_child(void)
> +static void become_child(int *ptr)
>  {
>  	pid_t forkret;
> +	int status;
> =20
>  	forkret =3D fork();
>  	pkey_assert(forkret >=3D 0);
> @@ -1021,7 +1022,16 @@ static void become_child(void)
>  		/* in the child */
>  		return;
>  	}
> -	_exit(0);
> +
> +	/*
> +	 * Wait for the child to finish the tests and pass on its result.
> +	 * Free the test memory first, as it may reserve pages from the
> +	 * small hugetlb pool that the child needs.
> +	 */
> +	free_pkey_malloc(ptr);
> +	if (waitpid(forkret, &status, 0) !=3D forkret || !WIFEXITED(status))
> +		_exit(KSFT_FAIL);
> +	_exit(WEXITSTATUS(status));
>  }
> =20
>  /* Assumes that all pkeys other than 'pkey' are unallocated */
> @@ -1060,7 +1070,7 @@ static void test_pkey_alloc_exhaust(int *ptr, u16 p=
key)
>  		 * preserved across fork().
>  		 */
>  		if (i =3D=3D NR_PKEYS*2)
> -			become_child();
> +			become_child(ptr);
>  	}
> =20
>  	dprintf3("%s()::%d\n", __func__, __LINE__);
>=20

Looks good, checks out, I'll queue it up.
