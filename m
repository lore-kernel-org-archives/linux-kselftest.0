Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E8D3921E7;
	Tue,  7 Apr 2026 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775559362; cv=none; b=Lz9VIM4i2WDoaSUdHIxMhaRQ7ZhCbhWmhn8yqDf7rGiR28SwYwoKW7z/2GphToaujKeL82Of+if/dFbRF4xCvS4ItOaHxxy3yRQ8WaxfrppKAumdporkapLWnSU5hOz3Wg950JIyICDbfBHHbUgfvkjRlGBwsbyHSg708gXohCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775559362; c=relaxed/simple;
	bh=7eP72GPIaGqb2qB7drr1QkaZ5cY1w6u3s7kVHeENo8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAkBdGPN573cp8EvCrpoC1mDLTNY8ZxWEqGTJ7Q5OtN3eMSuZ2ldxqtL7VMWGjbUnwgQfZk9BOMyiGg/6y+GbTOho2ipqcXRCKwDWPlFWi2A12wKDXRMLIuWMrfmhtqzkCyfWXOO3cqTl2MosnduGxtpIclKzPRd7oy71g/pIoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYYWJjGi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYYWJjGi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A9EC19421;
	Tue,  7 Apr 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775559362;
	bh=7eP72GPIaGqb2qB7drr1QkaZ5cY1w6u3s7kVHeENo8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYYWJjGiP1IhaBTL9bzl4SUN0sICrsu2ysruF90aeyyhhHe091gB5ZizvbYp3LnLL
	 UjV4PdcbPG/Yr4eLiZktqgjNm24coo+DahqxifQ4t+Rb1l9hKzKNrur/thllz/1sX/
	 EOmZrClBvNoKSNFXdklaXlH6RIEe7cSV0vMTAp9EG+wF9HEQCrOJC4tsOOS/uYbrmX
	 3NlIrnlJPcRM0kRhEX0ouAl0e/Oqo7IwwhrOqWjP5D9h6j7CGNprtoeRlRRJ+igLI4
	 UdS1Sg4V19ERBRCmUui27c8SbCKk/aQtkmAqDMXfP+OgL7zEbNbl+uzu10PNLlvLBd
	 7KKk2s4p4MxhA==
Date: Tue, 7 Apr 2026 11:55:55 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chunyu Hu <chuhu@redhat.com>
Cc: akpm@linux-foundation.org, david@kernel.org, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev
Subject: Re: [PATCH v8 4/6] selftests/mm/vm_util: robust write_file()
Message-ID: <adTiRbjdoTjfWKeM@lucifer>
References: <20260402014543.1671131-1-chuhu@redhat.com>
 <20260402014543.1671131-5-chuhu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402014543.1671131-5-chuhu@redhat.com>

On Thu, Apr 02, 2026 at 09:45:41AM +0800, Chunyu Hu wrote:
> Add three more checks for buflen and numwritten. The buflen should be at
> least two, that means at least one char and the null-end. The error case
> check is added by checking numwriten < 0 instead of numwritten < 1. And the
> truncate case is checked. The test will exit if any of these conditions
> aren't met.
>
> Additionally, add more print information when a write failure occurs or
> a truncated write happens, providing clearer diagnostics.
>
> Signed-off-by: Chunyu Hu <chuhu@redhat.com>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>

> ---
> Changes in v8:
>   - go back to ksft_exit_fail_msg in the two error exit path as no clean
>     ksft_exit_fail_perror that supports va_list
> Changes in v7:
>   - add an empty line before the 'buflen < 1' line.  And change to
>    'buflen < 2 to limit the buflen at least to be 2, so at least one char
>     is allowed.
>   - handle the numwriten < 0 case, which is the error path.
>   - use ksft_exit_fail_perror in error exit path.
>   - use %.*s to print the buf when error happened
> Changes in v6:
>   - save/restore errno before and after the close(), so the log could show
>     the correct error info on failure. Suggested by AI.
> Chagnes in v5:
>   - new patch for making improve on write_file. Add more safety checks and
>     diagnostics info in log
> ---
>  tools/testing/selftests/mm/vm_util.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index ad96d19d1b85..db94564f4431 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -767,15 +767,24 @@ int unpoison_memory(unsigned long pfn)
>
>  void write_file(const char *path, const char *buf, size_t buflen)
>  {
> -	int fd;
> +	int fd, saved_errno;
>  	ssize_t numwritten;
>
> +	if (buflen < 2)
> +		ksft_exit_fail_msg("Incorrect buffer len: %zu\n", buflen);
> +
>  	fd = open(path, O_WRONLY);
>  	if (fd == -1)
>  		ksft_exit_fail_msg("%s open failed: %s\n", path, strerror(errno));
>
>  	numwritten = write(fd, buf, buflen - 1);
> +	saved_errno = errno;
>  	close(fd);
> -	if (numwritten < 1)
> -		ksft_exit_fail_msg("Write failed\n");
> +	errno = saved_errno;
> +	if (numwritten < 0)
> +		ksft_exit_fail_msg("%s write(%.*s) failed: %s\n", path, (int)(buflen - 1),
> +				buf, strerror(errno));
> +	if (numwritten != buflen - 1)
> +		ksft_exit_fail_msg("%s write(%.*s) is truncated, expected %zu bytes, got %zd bytes\n",
> +				path, (int)(buflen - 1), buf, buflen - 1, numwritten);
>  }
> --
> 2.53.0
>
