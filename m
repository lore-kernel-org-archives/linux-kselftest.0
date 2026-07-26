Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0A3546F7;
	Sun, 26 Jul 2026 20:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096522; cv=none; b=qgw4MwWtlZ4dlvsgKbFiY5d7JHQvPDwRUSO8JOeL2AxJ3TWGXPyG2RLBl3A8f8p/tp6hz6DXZqW0R/rKIwtOrlNiyIJOHvJdABv/FVHsZJZ7xeBFbZHouDqkILzPrHOqiWIlJbUUgm+elPrexa87ZvNWjaBl+TIphnUrM759Mvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096522; c=relaxed/simple;
	bh=t7j7/tRDAIRa4cj42qBS61purOLMzbCKdd5Frs/7wB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL9Mn6nwSfLIjEYR+PLz9W5r2WD4vqqEBW0btaz0TJhrx6xoXd7V1lw/pbrGsfIZfpFrcsN+o+cbQtdbovrujr4paop+eQeXUKhLLBEymqP0QHDXeD5QN9Uel4TjukdwwPAU0uV7G0/yIt7biNgZ36SvQuew+VqxULrZsM1dVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IO1X0U70; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IO1X0U70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785096034;
	bh=t7j7/tRDAIRa4cj42qBS61purOLMzbCKdd5Frs/7wB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IO1X0U70sZu9ETC45taHhX4BoI0o1Yj7UIjhfYvz90xyN5uiHzy0zxiqcfuzxhJU3
	 aLKZpLDJnLHTA3oTRMD00VtrwVsk2uHiplhq17FkN2qE4IOS6AJS7L8MHtyhJDNmlj
	 MI+q5MdCD+bJAI/6Suabb38Tw+7FveBtUVA/gRMk=
Date: Sun, 26 Jul 2026 22:00:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
Message-ID: <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726101306.3772237-4-ammarfaizi2@openresty.com>

On 2026-07-26 17:13:04+0700, Ammar Faizi wrote:
(...)

> Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 47 ++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 996e8d13508e..4dc2ffea63bd 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1728,6 +1728,52 @@ int test_alloca(void)
>  	return *x - 0x1234;
>  }
>  
> +/* abs(), labs() and llabs() over the whole range of their argument type */
> +int test_abs_range(void)
> +{
> +	int i, ri;
> +	long l, rl;
> +	long long ll, rll;

Reverse xmas?

> +
> +	/*
> +	 * Both the inputs and the results have to stay opaque: the compiler
> +	 * knows abs() and friends never return a negative value and would
> +	 * otherwise fold the comparisons below at build time, which would also
> +	 * hide the undefined behavior that is being tested for.
> +	 */
> +	i = INT_MIN; l = LONG_MIN; ll = LLONG_MIN;
> +	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));

We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.
Maybe it can be made variadic.

> +	ri = abs(i); rl = labs(l); rll = llabs(ll);
> +	__asm__ ("" : "+r" (ri), "+r" (rl), "+r" (rll));
> +	/* the absolute value is not representable, the input is returned */
> +	if (ri != INT_MIN || rl != LONG_MIN || rll != LLONG_MIN)
> +		return 1;

(...)
