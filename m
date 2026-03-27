Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD236C0A1;
	Fri, 27 Mar 2026 07:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597571; cv=none; b=fWTvQCCJz3pm81jjr3li0+yWD6DrK9sfxy+HHzWj518HIoiGlF7NSJarXqVimw9rA8J5Yykctto9Tj5SIEjzkSqur7xH3mYWT8BR0+SVx/vUE1ImuG6DgYHts/b7sv5eD/lg8kZVtcthYdBSs7I8BbuCjBlLfHBQ8e8Lz3Wnojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597571; c=relaxed/simple;
	bh=eAEV6jkSinDBHX+g/clp3faniKXzvRJy9kbUgZA9FYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBqKihY/CseQ0U+vB9yXPItOdW8xQyzH4w4wA3i3o/v4PGrJEHjF+DijGHdWTYbHZfavWsNEj8NOz+qOwXsNb1LqUMVoJ9tAlv0dduBQMAu7u6DteqUYFQ+GruM4zHMBDF94xDD6+JNYnTBqBN4CRScOS06TlcR65MAEW8KLY/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoYYMi8y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoYYMi8y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21247C19423;
	Fri, 27 Mar 2026 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774597570;
	bh=eAEV6jkSinDBHX+g/clp3faniKXzvRJy9kbUgZA9FYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoYYMi8yUVIC6LABKdz3pZSOFlH7vKHjWuAzDmYtIAEtwsmXnmnFpjCd8kfwiJytN
	 Yg9AQsASr8iS2v7eKjKFJ/PmbgrP0wCGmjMTh2rDHikOKg9XlKrV80aMT8KV9qIVos
	 b/AGqUX/6Gj3nvyE3iuxv44oLw802LOad1epym3BeDL0xS4+m8BXH2z0XI2JrdGQ6U
	 OClGvfduAlQBAsGY89etD+SjLcb9vZ3StCJc2yvfNStA99kxD+SgHViiR0HOkuozmF
	 Yf12ZNT7RGzAVubbu6NPP9brH1WBMjvsE2zGceo+foOIOfft8CtA2OH4TrKb9X5wLO
	 XMjT6RvTI3B2Q==
Date: Fri, 27 Mar 2026 07:46:03 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev
Subject: Re: [PATCH v6 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <c87111e3-5cbe-487c-90b9-78d22a3f7a24@lucifer.local>
References: <20260324013316.2590422-1-chuhu@redhat.com>
 <20260324013316.2590422-5-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324013316.2590422-5-chuhu@redhat.com>

On Tue, Mar 24, 2026 at 09:33:14AM +0800, Chunyu Hu wrote:
> Add two more checks for buflen and numwritten. The buflen should be at
> least one, otherwise the 'buflen - 1' could underflow and cause trouble.
> The numwritten should be equal to 'buflen - 1'. The test will exit if
> any of these conditions aren't met.
>
> Additionally, add more print information when a write failure occurs or
> a truncated write happens, providing clearer diagnostics.
>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>
> ---
> Changes in v6:
>   - save/restore errno before and after the close(), so the log could show
>     the correct error info on failure. Suggested by AI.
> Chagnes in v5:
>   - new patch for making improve on write_file. Add more safety checks and
>     diagnostics info in log
> ---
>  tools/testing/selftests/mm/vm_util.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index ad96d19d1b85..572ccb99de8e 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -767,15 +767,23 @@ int unpoison_memory(unsigned long pfn)
>
>  void write_file(const char *path, const char *buf, size_t buflen)
>  {
> -	int fd;
> +	int fd, saved_errno;
>  	ssize_t numwritten;
> +	if (buflen < 1)

As per Sashiko (presumably didn't look :P), let's make this < 2 since we
write buflen - 1 bytes below which we don't ever want to be 0.

> +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
>
>  	fd = open(path, O_WRONLY);
>  	if (fd == -1)
>  		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
>
>  	numwritten = write(fd, buf, buflen - 1);
> +	saved_errno = errno;
>  	close(fd);
> +	errno = saved_errno;
>  	if (numwritten < 1)
> -		ksft_exit_fail_msg("Write failed\n");
> +		ksft_exit_fail_msg("%s write(%s) failed: %s\n", path, buf,
> +				strerror(errno));
> +	if (numwritten != buflen - 1)
> +		ksft_exit_fail_msg("%s write(%s) is truncated, expected %zu bytes, got %zd bytes\n",
> +				path, buf, buflen - 1, numwritten);
>  }
> --
> 2.53.0
>
