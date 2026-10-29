Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296044;
	b=vD0e8+dYVye7AgO4cLvM21nsOGq4z3xKNOnr5ChgqDnaW1jH+PgwE4+8cVQWCCykI4TG
	 Oh6jtMdotA9UyqpcgXO3p6EQqAXzESnfZ6ZPMxdW3mMbUPE/XJOIVQXGOOr9Z1824gLy4
	 3DOELOAuppAzhYg0kTnMYN5TX/F/YpgaEvoKJFF7A/vh7Jbapg32XqMUvxhKbNr7UkE9m
	 9tg+ogeFC8ExwpymC/8zyKD90dCFsU0Y/NVNq+u7dAIO6gedC+xE2OZ8DNxys4oW+x+lg
	 +nZSnxlarRyXJIvMXEp+G1aoPTCaAWCtRvxAoPoC6J2DPSEhNM5pD/imi0A0begBAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296044;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B7HU/d/c7fJMBmO2BgIhxjOClaSBImBXm0iF8RgGUs8=;
	b=djJWQ5xj2UhmwHcTJN8evMFipSDr6SyaYucx3eb34Mj0+483D6EUIEUD3HD69WeF6GIb
	 ET9bfMv5bK/qtOtPe3EdVkvI3KDaCTeOZ/Rf+ny1M3fHXxXbNazwqUC/nKPvCS8RA52dM
	 7DIrQ+BZPXRJJq7dGIZgQa0BJI1cG2/7EferOhkGF+Eobi5NnYiesUWKCtnuR7SNN6Rxw
	 NXcKvLTr9SY8qbm+Gefr98iPOHF88Cbu8H8QyoPql3K2qScXmmbvk/gIIZkxhJ9clyRr0
	 Z8Nq3ngtDY4DSqNTKo2YBWQ8LEIYrwAcSYe8L8LM86yvTckwPGEBJUoNQN5vrUoi4KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=AJ0FuykM;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1D4606A31A;
	Thu, 29 Oct 2026 17:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1D4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=AJ0FuykM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793296041;
	bh=DkDQzSQz4jR5GRI2OMGyIcAhxKqTvQdQ/xWgFd5/TAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJ0FuykMgn+tjzw2bwEgWowo23Bc06cTUvHxoESDMm+hJU2H3oaTFCY1KP9efAll2
	 QctIOVrMIxeKNwPYFYUVr5Mlg2kqWZnDOntvUMDAzNVHG4h/XqkDc+ya1+mO/urF9m
	 30RD/vbbwkGLFQkW/w8DVY9YEPqq3zfyPOuIPP7A=
Date: Thu, 29 Oct 2026 18:47:20 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] selftests/nolibc: test fopen() errors and update
 modes
Message-ID: <e4336d00-2ce7-432f-bac1-0a847fd4957f@t-8ch.de>
References: <20261028200743.154151-1-danishkhateeb03@gmail.com>
 <20261028200743.154151-4-danishkhateeb03@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028200743.154151-4-danishkhateeb03@gmail.com>

On 2026-10-28 15:07:43-0500, Danish Khateeb wrote:
> Check that fopen() of a missing file fails with ENOENT, and that a
> stream opened in "rb+" or "wb+" mode can be both read and written.
> 
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 24 ++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index f3d0d27cdbe1..be501b5298d7 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1035,6 +1035,27 @@ int test_file_stream_wsr(void)
>  	return 0;
>  }
>  
> +/* checks that a stream opened with <mode> is readable and writable */
> +int test_fopen_rw(const char *mode)
> +{
> +	FILE *f;
> +	char c;
> +	int r;
> +
> +	f = fopen("/dev/null", mode);
> +	if (!f)
> +		return -1;
> +
> +	/* reading /dev/null hits end-of-file, so a write may follow */
> +	errno = 0;
> +	r = fread(&c, 1, 1, f) != 0 || errno || fwrite("x", 1, 1, f) != 1;

That's too funky.

I have a series for fcntl() prepared, with which the test could use
fcntl(F_GETFL). It would be much easier to also test other flag combinations:

test_fopen_flags("rb+", O_RDWR);
test_fopen_flags("r", O_RDONLY);
...

> +
> +	if (fclose(f) == EOF)
> +		return -1;
> +
> +	return r ? -1 : 0;
> +}
> +

(...)
