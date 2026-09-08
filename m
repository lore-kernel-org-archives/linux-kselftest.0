Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4968E4DBD8E;
	Tue,  8 Sep 2026 09:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858202; cv=none; b=PgLVI47tGaSEBdTJ32sGA1a8VT3UMxe7O4QY3h4wISvrkQZbYvATnjkJUaUO8iWo7xfTOI87ujo4Sa2Oe5tMnBUAa57Ib+JSFd9LDWYy4s2E+nroGS8pDdpoJxcQANsn02a51Nr8st3VX3+LnkeDRWjEj7YN0lWMxyka1KZp/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858202; c=relaxed/simple;
	bh=p6FjV3Io2Zo3zUDNffHVJlmedmcW6NGmF+cysG4PBYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/9fZGtu2yDvgptFcl6sYkmIBGM3iFh9iVsfW5c+Qvsb9gAxGo2kmR3EadqTl+VUmbajQYAkxTrjXGFEoxGfJc+A1gSYHGyOOgDb+SG+81469TqUQWdJOTi/wDRUpqt1ynpqvLagKbFyggzgCC5+gVOAiiLnz+k6kFRMVddUaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gi9p3Mx7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gi9p3Mx7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147BB1F00A3A;
	Tue,  8 Sep 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788858197;
	bh=DmxlW1grPilGD6+Vzd6fkF43wreNPzlOCjKffmitkn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gi9p3Mx7Zgma/wnFtpWumOaA8IwC79EQxACIhrQ8OpAUFRrlU9LGCpyDm74Bo4esE
	 O3vyhJL4JXdx1KqyhL3peGmfWi8TySy5aN77GSPvIcTzKitG0htcy0YbPwjoCMOsDQ
	 Quab5yQVUQXRt3cOxhv+9j9oVlMFhE25GibnLE7yr+RUzy8jTvoVTeSlxyhjQy08IY
	 TqvRaoKOHfrFCGp+ax1ycrKkS+uZcYua5wHMCBanqNjC6nQ+qr0Sc8VsLa2asvMRg0
	 qWiw2RTqwJNRYQPn50eD5Hrpi7EH61Q638KNkr8nKmmTm2M0ewMmEyU7Jx25xwPTih
	 IJB347uJBSzNw==
Date: Tue, 8 Sep 2026 10:03:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	shuah@kernel.org, James.Bottomley@hansenpartnership.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: fix ptrace PEEKDATA check in memfd_secret
 test
Message-ID: <ap_N7u5DbIk4FEeZ@gremlin>
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

Not sure if a fixes is warranted? But I also definitely don't think a backport
is in any case in case :P

> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

The change LGTM afaict. Though I think a comment should be added. With that
addressed:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

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

From https://man7.org/linux/man-pages/man2/ptrace.2.html#RETURN_VALUE :

       On success, the PTRACE_PEEK* operations return the requested data
       (but see NOTES)...

       On error, all operations return -1, ...

       ...

       PTRACE_PEEKTEXT
       PTRACE_PEEKDATA
              Read a word at the address addr in the tracee's memory,
              returning the word as the result of the ptrace() call.
              Linux does not have separate text and data address spaces,
              so these two operations are currently equivalent.  (data is
              ignored; but see NOTES.)

OK so we expect this to fail as otherwise that'd be a violation of secretmem.

Feels like maybe we should add a comment to that effect? :)


>
>  	exit(KSFT_FAIL);
> --
> 2.54.0
>

--
Cheers, Lorenzo
