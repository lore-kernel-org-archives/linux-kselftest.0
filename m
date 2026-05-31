Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC820C461;
	Sun, 31 May 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780238194; cv=none; b=s7PQhgfgMb4/TqTER3tOyY9gSX/gL8GFSYkjOSPvGppXONUwZAJMGFcA8IpVJwIx20aOgiRH4nutXmBAstn+VOzuZp3HMIauumZkHJhmpK9V43ZFTFKMlq0UD6UnyEzmbfmy/SZEZk8i+UgojcN6zryZaRR/2wurcn2eEMwuRqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780238194; c=relaxed/simple;
	bh=Fr9MT4So2jd3YXglPUIx9JZmbxZRjcVnclivXSiG1B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwMT+yJb+m+4qCw5iOByMiHQRI3sEmvTDuC00lPDcNa8JZJ1+sn7T2dC8N0bPGuvmn4S2YU04NJNKB2pmI0oGY4O9zpuEVOcSq/V4OpjyfLT0ZpbdUCf4iEfTr6AmInNdD1lLpkhN48MDx70OANg0fhUr6kDJv49rjMdDxRNn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuc7Iyfi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuc7Iyfi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2BF1F00893;
	Sun, 31 May 2026 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780238193;
	bh=hPApO5PSuZbWVoDOqItwGMqueNSdbpN7A+B7zA27RpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fuc7IyfiSOek8PfZse6emleEPNfYRfDKOl6mqmyBG7s52mjxGzJCaL4Cp51ims6Os
	 fzxHGYqSXFviP0rozHD+x7NoYjraRc5m3aqfgoZ6L4oVeck/Id3F/uYQSbjHhxsyMK
	 ULGzD3DEdO7komuxKYNaOvzVNkFYN/iuKBynX9/OvL4SbzYssdRsHQT9kZXzrIDqvL
	 wzbcU4VgELLaq8rqTON0KU+e2SX+L7zB9dwvEE++yRoH/CVCiX0cAC+Na+1BZVZdKv
	 XxieYMD1F9QSIVcoMfOYcFKgzchdfty8MLM8t6yZwP+gxF94FnGBuZ+J3WCcIPVPnS
	 +nZpLF27aorVg==
Date: Sun, 31 May 2026 17:36:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] selftests/mm: use pkey_assert on clone_raw
 failure in pkey test
Message-ID: <ahxHaQFr3Uer2GBP@kernel.org>
References: <20260529071633.2807814-1-lihongfu@kylinos.cn>
 <20260529071633.2807814-4-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529071633.2807814-4-lihongfu@kylinos.cn>

Hi,

On Fri, May 29, 2026 at 03:16:32PM +0800, Hongfu Li wrote:
> Use pkey_assert(0) instead of perror("clone") when clone_raw() fails.
> The old path only printed an error and continued; the test now exits
> via pkey_assert() on failure so it does not hang or proceed with an
> invalid child.

Looks like clone() invocation changes in patch 2 belong here.
But is there actually a need to change ret = clone_raw() to
child_pid = clone_raw()?
 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> index 80b5b3dad86f..231dfb079075 100644
> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
> @@ -333,7 +333,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
>  
>  	if (child_pid < 0) {
>  		errno = -child_pid;
> -		perror("clone");
> +		pkey_assert(0);
>  	} else if (child_pid == 0) {
>  		thread_segv_maperr_ptr(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
> @@ -500,7 +500,7 @@ static void test_pkru_sigreturn(void)
>  
>  	if (child_pid < 0) {
>  		errno = -child_pid;
> -		perror("clone");
> +		pkey_assert(0);
>  	} else if (child_pid == 0) {
>  		thread_sigusr2_self(&sigstack);
>  		syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.
