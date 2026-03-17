Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665BF3A783D;
	Tue, 17 Mar 2026 11:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745303; cv=none; b=EgV1EaSIt7WPCuDZV3DQb/pU4YKBax27ZV9UuXBQD3Yn9zmly23W/KWtHcluaWJFYj95SKqeVT5fJkgQ2duhKc1SUG4HUWei3rytYsHzYG93D8W17ezWjQogZKbNRA10wPHifuCOVnLzb2RgAjLBNS8IsbMxiDhLoFO4jh+rcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745303; c=relaxed/simple;
	bh=u61teL6ZypykTqHoO//wd/OeQVhD4cwvPtG9zgyMYbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlzIvfHqfKluQ40tRejasJug+VU+6E3Q49ZglMcM1EQVQnqakqo73uxwThPmg2dYp3ysFM5VSxlM3qlZ2NMakq19VRIcJrgxOjba9xOHlCe0mW1HqNRqpwobUlaNxcJcoXuX434B1VTQClvVqUC2ovP7uGI0w/C5G9uJLcCv2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aADMx9bv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aADMx9bv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4192C2BC9E;
	Tue, 17 Mar 2026 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773745302;
	bh=u61teL6ZypykTqHoO//wd/OeQVhD4cwvPtG9zgyMYbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aADMx9bvjPw8NXr7sHNNk2LtGP7NU2/vA74oilhWuvDE0baQG0UcjJafh0mmxZMOf
	 y1oLs8lzl2nI5xvviCrQnwcT9nbu5ppOnN9Mxm1aRSecLRRBxZTURQwBI0xk6+Nw79
	 IZWYo/12CUVc713o0BWdRYxtKdStuLdr5sEi2tuygiyfFuYZvv6JLEaN7vprsxdlCu
	 usOPKnQ4uN/VWI82FS07s7JbX62jRif/i3Pa/2p3KM8rnSeUeUu4dGB50ZMzzhgE0U
	 UkJ5a0ErZvwA162ml1JqNf97PIg3YCkdcG7u2nJBGpFFcRtCu3JyowvN3UJgyLnUpj
	 Llc5LBmT2uOEg==
Date: Tue, 17 Mar 2026 13:01:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/6] selftests/liveupdate: add helper functions for memfd
 tests
Message-ID: <abk0ke1wAiHMYnGs@kernel.org>
References: <20260309115441.266805-1-pratyush@kernel.org>
 <20260309115441.266805-3-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309115441.266805-3-pratyush@kernel.org>

On Mon, Mar 09, 2026 at 11:54:35AM +0000, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> Add some helper functions that will be used by memfd tests. This moves
> some of the complexity out of the test itself, which results in better
> test readability and less code duplication.
> 
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  .../selftests/liveupdate/luo_test_utils.c     | 175 +++++++++++++++++-
>  .../selftests/liveupdate/luo_test_utils.h     |   9 +
>  2 files changed, 183 insertions(+), 1 deletion(-)

Some review comments from an LLM that make sense to me as well :)
 
> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c

[ ... ]

> +/* Read exactly specified size from fd. Any less results in error. */
> +int read_size(int fd, char *buffer, size_t size)
> +{
> +	size_t remain = size;
> +	ssize_t bytes_read;
> +
> +	while (remain) {
> +		bytes_read = read(fd, buffer, remain);
> +		if (bytes_read == 0)
> +			return -ENODATA;
> +		if (bytes_read < 0)
> +			return -errno;
> +
> +		remain -= bytes_read;
> +	}

Should the buffer pointer be advanced after each read()?  As written,
if read() returns a partial result, the next iteration reads into the
same position, overwriting the data just read.  Something like
buffer += bytes_read after remain -= bytes_read seems to be missing.

This is exercised by generate_random_data() which reads from
/dev/urandom, where partial reads are possible for large requests.

> +/* Write exactly specified size from fd. Any less results in error. */
> +int write_size(int fd, const char *buffer, size_t size)
> +{
> +	size_t remain = size;
> +	ssize_t written;
> +
> +	while (remain) {
> +		written = write(fd, buffer, remain);
> +		if (written == 0)
> +			return -EIO;
> +		if (written < 0)
> +			return -errno;
> +
> +		remain -= written;
> +	}

Same issue here: buffer is not advanced after each write(), so on a
partial write the same initial bytes would be re-sent instead of
continuing from where the previous write left off.

-- 
Sincerely yours,
Mike.
