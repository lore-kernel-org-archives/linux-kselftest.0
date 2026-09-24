Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A298941A547;
	Thu, 24 Sep 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239327; cv=none; b=m0LQKYQTTYgY5b0a5dLSfXlXcgx0lykW27SI+GZvZhT2h8z0LCYruwvAxemCClrUQp2rLGh5u1BtgnaweZplQXyAhBVczhTENT4aq1u23vPjyNtZYQp8D1S0vFvSkQB1nBvm3g4Hll5r7qzPfBCOyzsHP9g+tdOsh3rI0XahU2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239327; c=relaxed/simple;
	bh=I5dfBTlOw1SAlp4G0K+tSnWcUymaRIOUKWkS7vb8KcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlFpbIXNS1Hm8BQocG0Rn1v8g5Qqg9ECxQeB4EGJwf+VP84sRJJAhTFoa10Jl0AApt456B5x/r1GLggRn2IDcWuKAG08ksEr3s6JPa3ijF9+Urx8DzDTKDWi7suG5ECQrO+rsgn1h3PKPdI2a6uF6KdBZVBy8hkzWnf/+a96lVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=en9WWI07; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="en9WWI07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1790239322;
	bh=I5dfBTlOw1SAlp4G0K+tSnWcUymaRIOUKWkS7vb8KcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=en9WWI07jzML3e8jWctWf0TKL6ot0A7jvN1FIYrvQmjbFI1LKE8T9GzAds11xr2d6
	 pSQIQWYnun6Q3ral6Jq8KbwGkXU2suqaSh/SrtgKK+SNrXj2q8ODD9Dorno6O5M0Uu
	 L1e4mpCVBrl/UwcUE5CL9JpHrOlN3w8aGi8XJZr8=
Date: Thu, 24 Sep 2026 10:41:53 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: fix WIFSIGNALED() for status 0
Message-ID: <8fd097e6-ff23-41f6-ad3e-273e5e9b26f3@t-8ch.de>
References: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923205622.1123270-1-danishkhateeb03@gmail.com>

On 2026-09-23 15:56:20-0500, Danish Khateeb wrote:
> nolibc's WIFSIGNALED() is true for status 0, so a child that exits with
> 0 looks as if it was killed by signal 0. I ran into it in a nolibc init
> for a QEMU test, which reported every clean exit of a child that way.
> 
> Patch 1 fixes the macro. Patch 2 adds nolibc-test cases for the wait
> status macros, which would have caught it.
> 
> Tested on top of nolibc/for-next f2212892b6a0:
> - x86_64: without patch 1, the new wifsignaled_exit0 test fails, and
>   the rest of nolibc-test gives the same results with and without it.
> - x86_64, i386, and arm and sparc64 under qemu-user: all new tests pass.
> - libc-test against glibc: all new tests pass, so the expected values
>   match glibc.
> 
> Danish Khateeb (2):
>   tools/nolibc: fix WIFSIGNALED() for status 0
>   selftests/nolibc: add tests for the wait status macros

Applied without the Cc stable, as we don't do that in the nolibc
subsystem.

Thanks!

>  tools/include/nolibc/types.h                 | 2 +-
>  tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> 
> base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
> -- 
> 2.55.0
> 
