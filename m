Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6C83FA5D2;
	Mon, 17 Aug 2026 11:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966196; cv=none; b=PMXRECL1Y56XVjHXH08KmcFoJBjXs5ac+geb7oMsIZqAYr5BgO7N9q86m0cYa1iTkGOdaY684YPh2eBNyHZ4vu6o5KPKQ2NTW5G4E8o/0IpHDg8vCHw8AzExbw3Ek7DEzHZNUqm9OaSzGeMC8xgb6DuMSQtkkDE2JzMxttO6Yl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966196; c=relaxed/simple;
	bh=CQNmmt4kJHKpHx3wJWTyE9eCKtcypZ+IUpKxl9s6LWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLLiEReIT5PKz3nMK5nJ1Lu4oHR/pVCRCogGSZH3W4EfR+DNeuyH2QSj8XXguW0o3c+avKLTRUrnz+/SYfrAIzcs8GZ/lOwpg5C1lm3N9XeDrQUbxFehdcXujOUTy6YGFUCz/zkfEz8R/arGjtejT8EAY1zXSnMwFrbhXUbl0FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORlYguyd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORlYguyd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FAE1F00A3A;
	Mon, 17 Aug 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966195;
	bh=Wk6/msOLkPqq9kd6J2GOV67X9aJwFjjT0QFc8AOwr5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ORlYguydCtGjM0ZGc6Q37mpzAF8U6ZpfF5KNK6tAUxrSoOhX10STX+1skMKZKDm5i
	 AGfIQVHAYoUq8epEvTMX+9yWs+FxIvy06zE61Q2ZlgEsH7qhw7uiMY5uXGyETfEijJ
	 q+yzVFoClbd+qo5oaaJmCQaFtpebVobItsUPgwf+3N2uqcvgQnklIRZaCYIZJykJri
	 cH/4BKJUQELV/aMGQv/o8En9kGTirvTnV/5PLtmZJ5y3WHsrfeyckejvXaIIt92Bo7
	 VtagPINO1BWPjZiN3XatD6BIh6SGwpnph88kJi+/xCohJC+5uSzVfItOfAm6hrI+Qo
	 9GSDpHINrfJXA==
Date: Mon, 17 Aug 2026 12:29:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>, 
	Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: Re: [PATCH] selftests/mm: Drop redundant open() in mprotect_tests()
Message-ID: <aoLvynyoJ9RKRIMk@lucifer>
References: <20260817080616.52946-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817080616.52946-1-hongfu.li@linux.dev>

+cc Muhammad

On Mon, Aug 17, 2026 at 04:06:16PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
>
> Remove duplicate open() for local pagemap_fd in mprotect_tests() that
> shadows the global pagemap_fd already opened in main(). The local fd
> is never used in the function.
>
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Hmm yeah it's not even closed either...

I'm assuming this was an error in the origianl tests, Muhammad - I'm
guessing some artifact of a previous approach or similar?

Anyway, LGTM, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index cfd1987339c1..eadc7159ca5b 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1332,12 +1332,6 @@ int mprotect_tests(void)
>  	int ret;
>  	char *mem, *mem2;
>  	struct page_region vec;
> -	int pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
> -
> -	if (pagemap_fd < 0) {
> -		fprintf(stderr, "open() failed\n");
> -		exit(1);
> -	}
>
>  	/* 1. Map two pages */
>  	mem = mmap(0, 2 * page_size, PROT_READ|PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
> --
> 2.54.0
>

--
Cheers, Lorenzo
