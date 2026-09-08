Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E05D3AC0C0;
	Tue,  8 Sep 2026 08:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854892; cv=none; b=FEQYKDDiK5mt72YFwUTKe9VZ/rSij+PiuiHIhGCBolXHrOU1MWCkUM781jMXSNsoZbLJVUq2JKLyuj+m4zVhSSdy+P0YiGEmTQrUeN2KLnhASjLlAGvSpXK8tU0EKVA5fAv+eW50acr6a1fLYswwTOU300qKGPcj+fnYxa8SEQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854892; c=relaxed/simple;
	bh=/wjfVcw4jnBj6lfFGMgNp2q3imqvSAbzXLkXYHLjS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9N4VGEeNU9tv/+oU2kZ8g+QTfUJ2YcAVSSzB7p+aP0ke424qaRuiPUSMUZrSOQVulJwnSur6l3FUIOyRLjrBbxtxa54SuJuUqOq8goeMVQTLPXL4UehjNEYy/bcKo0EiJuOhg8Fkq3ZWxyyzZu7ZU6GhYJmjNIYw355CcWKxhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3hdzvFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3hdzvFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A601F00A3A;
	Tue,  8 Sep 2026 08:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788854891;
	bh=Ex5rOv7vKl28wj0SeyBEi/wKjcPUGR+up3g3DebNUfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g3hdzvFtn7mdxCrxrK3f5AngKmNRypNNY++sY86OVJO/qKmiyKU9WrgnNlJYMLjzS
	 rUezNUNpyOGzENlX2jUpX6GmHAZDPN5ZdSoA1qij8ljUxe8/2pulEIkfIy4V6g2KPq
	 sqEPAWjYgcQubNLBMwbKfeXvC/EvKPgACWv8kJC1EL011bCB4hhB1pshakHEcfbiQ+
	 g9qneAn5/Ou+5ppRRsN7fh4XVxkqVrjbqDw8crgiyEVP/y065tOOaVb2vlXQo9H3nW
	 vhdQO1X8MwvcFkcINL09UubOrvH/5hcbmV/tP8BGL8/5DrkpvdFMY/AZ5oiL9mz/lx
	 4n/aQo3AHB1VA==
Date: Tue, 8 Sep 2026 11:08:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org,
	James.Bottomley@hansenpartnership.com, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: fix ptrace PEEKDATA check in memfd_secret
 test
Message-ID: <ap_CY1sTymJd8zOy@kernel.org>
References: <20260908025111.34562-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908025111.34562-1-hongfu.li@linux.dev>

On Tue, Sep 08, 2026 at 10:51:11AM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> try_ptrace() treats PTRACE_PEEKDATA return value as a boolean
> check. A successful read returns non-zero data (memory filled with
> 0x55), causing the test to incorrectly report PASS when secret memory
> protection is broken.
> 
> Check the return value against -1 instead. The test should only pass
> when PTRACE_PEEKDATA fails, which means secret memory protection works.
> 
> Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/memfd_secret.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/memfd_secret.c b/tools/testing/selftests/mm/memfd_secret.c
> index c55d84c5e613..dd08a3a1ef14 100644
> --- a/tools/testing/selftests/mm/memfd_secret.c
> +++ b/tools/testing/selftests/mm/memfd_secret.c
> @@ -145,7 +145,7 @@ static void try_ptrace(int fd, int pipefd[2])
>  		exit(KSFT_FAIL);
>  	}
>  
> -	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0))
> +	if (ptrace(PTRACE_PEEKDATA, ppid, mem, 0) == -1)
>  		exit(KSFT_PASS);
>  
>  	exit(KSFT_FAIL);
> -- 
> 2.54.0
> 
> 

-- 
Sincerely yours,
Mike.
