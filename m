Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB3A277C96;
	Mon,  4 May 2026 07:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777880155; cv=none; b=aaQJEY3y8iwlFq+u8NelZQf9uVXGVm6CULKd97My/hEzITtU5Ujm5GQKD47P5YgRug/H0EwInbEFEmVQwObuvRirzAgNIfjWbmxpc1fCthSZh0QsFvyCB4QtDn66r/r1jwi5VHIH1Tc2WZmVCCLtmtds0l2MyuoFqTu9SLIM0+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777880155; c=relaxed/simple;
	bh=nP0S2q1CAzOGhGSdSCjymgPf8nuBERecQ5nTjVW12qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIt05MYng82nUGXofKIZfo6BwK5O8seS62zh7r1A7JIaeCdoqO0w1C8ksGsHhnRA8Ggj+qucFYZJBS/dWaaZJNT6H6J2bR60L+JnoCgB/QSvlXuJMP+A/pyqKfZdkgG8qU7OTK5PUZVtSOBPlE6MppqsXTipZJ1GSRua1A5mb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dwZxMQof; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwZxMQof"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A297C2BCB8;
	Mon,  4 May 2026 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777880154;
	bh=nP0S2q1CAzOGhGSdSCjymgPf8nuBERecQ5nTjVW12qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwZxMQofx6uIXs7HGoHMgLNnUGRsmZWDDIiSADIemxTxLuZR8dhs4m4Bm9V0M2ioC
	 z9kh24iWzmu55tMpnz7mCGxGsauMwJA1S+Ng/0/wRxsyZGVh6PJKThcrdJGRAkj9SV
	 rL3AEJobAm+7b1ZdQRrXC+dhzIyqhYS+3dnPcmt5zlcfylov7Ke5LhFg40bbEK5qO/
	 zWF7IzrUBYNzg/seZaKvUhvg79C1U7uucNC8j+BrdpDntWlcohZNncxAeK49w4kV1u
	 P+nW4+1+ARQpeoKBJTlnt8b0tIZVM41k2c94GuXsqiT4GB4xrNQIoURJbez270BpXA
	 eU5lJh9mEJuMw==
Date: Mon, 4 May 2026 09:35:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>
Cc: shuah@kernel.org, akpm@linux-foundation.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, david@kernel.org, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com
Subject: Re: [PATCH v3] selftests/mm: ksm-functional-tests: fix partial write
 handling
Message-ID: <afhMU8qbUbS-uVa7@kernel.org>
References: <20260503101229.654763-1-agarwal.vineet2006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503101229.654763-1-agarwal.vineet2006@gmail.com>

Hi,

On Sun, May 03, 2026 at 03:38:40PM +0530, Vineet Agarwal wrote:
> Update write() checks to properly detect and handle partial writes.
> 
> Previously, partial writes (ret > 0 && ret != len) could be treated
> as success because write() does not set errno in this case and the
> code returned -errno. This could result in returning 0 and
> incorrectly signaling success.
> 
> Fix this by verifying that write() returns the full expected length
> and treating any mismatch as failure.
> 
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
> 
> Changes in v3:
> - Simplify error handling as suggested by reviewer
> - Return -1 when write() does not complete fully
> - Rebase patch against base tree
> ---
>  .../selftests/mm/ksm_functional_tests.c       | 27 +++++++++++++------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/ksm_functional_tests.c b/tools/testing/selftests/mm/ksm_functional_tests.c
> index 8d874c4754f3..4abd98be3f59 100644
> --- a/tools/testing/selftests/mm/ksm_functional_tests.c
> +++ b/tools/testing/selftests/mm/ksm_functional_tests.c
> @@ -498,6 +498,8 @@ static void test_prctl_fork(void)
>  static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
>  {
>  	int ksm_fd;
> +	ssize_t ret;
> +	size_t len, sleep_len;

ret and len should be of the same type and one len variable is enough.
  
>  	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
>  	if (ksm_fd < 0)
> @@ -506,11 +508,17 @@ static int start_ksmd_and_set_frequency(char *pages_to_scan, char *sleep_ms)
>  	if (write(ksm_fd, "1", 1) != 1)
>  		return -errno;
>  
> -	if (write(pages_to_scan_fd, pages_to_scan, strlen(pages_to_scan)) <= 0)
> -		return -errno;
> +	len = strlen(pages_to_scan);
>  
> -	if (write(sleep_millisecs_fd, sleep_ms, strlen(sleep_ms)) <= 0)
> -		return -errno;
> +	ret = write(pages_to_scan_fd, pages_to_scan, len);

	if (write(pages_to_scan_fd, pages_to_scan, len) != len)
		return -1;

would be enough here and below.

> +	if (ret != len)
> +		return -1;
> +

-- 
Sincerely yours,
Mike.
