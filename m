Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804975;
	b=MV9YHsHmcZ5IGeUlHxNCwILx3EXd2ioSOv2VgzrVcETo6ZTxcbfJB4qVVpFbdRbiI5Zx
	 BFbA9Q9S6/hoHDBb9kAklF+08j4gnKZEI/l3jTSeEbJVNm3A6ZVOBm3GDjO/tbY2S+TlW
	 xumLf+sh4uiZGezZzpalJwH9ITO71QwOupd+tuAdcrK2ebwc+nlHWf29EMXS1ljOyy9Ee
	 7tRnLjpRoZa9shJZhU28RNa9/SiKv7HdbVKG4ceDs1tAx4LzCryw7+5jvWfX0x5gapVOI
	 7H1xNIf3Hda16LWk87tm7Kj/B35yfMD+XWJlFHP+YcW126qVuqmColffWjux+2HJsYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7omIvyqBdJHk9teCPUFXfWrEzQ9+VYkHiJCDQQJQ93E=;
	b=kqoWQrJXKOe9dgYN9NIVoNDQsf0jhIwZe9CyW68mUGU2411j93oudRZXIBqWRJjFoci9
	 gB9FTD3lv1C+FsnRjUdgdNpTsCfuAAKWOGKOq+snvC4ek2xBIHJmUK3USKt/V2ZZzGbrs
	 lP/Uv55gPbYz0qStAXOTGo53WaIYUlUkohniW61c1t0/xBiUB917sIm5VSU2D+WU2DYq4
	 Tmnz7vvhQhUEKQYA/LR589f9OmlU05m++H1TVOE1Lqto2UJUu9LsAkO7y4cnvBk+JW2EF
	 dMEKi8L0pnPk0Xyea+JL5HCQj4b3Ojf49ywV/NMSpmiXu/OG9EIhRBx6a1mgS99C35Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKltYJ9c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F5606A31C;
	Fri, 27 Nov 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKltYJ9c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A351F0280B;
	Fri, 27 Nov 2026 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804974;
	bh=7omIvyqBdJHk9teCPUFXfWrEzQ9+VYkHiJCDQQJQ93E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OKltYJ9cUaVOyvxtAzqwRPybYHoVF1i9ar2+j8nlWyjpRvwBk0HEgDkmUg26j3SBx
	 Sujd3iSaszavzxUAX+VWzocOlHxJzmOnc+Tvk7Ds4JuNJRUbBRX6V3VqSQtPcJ82tK
	 6osWERdqqRSsHGZZCZqoIAnY5sYAKXmCcYbWhKMJXyGxwFcWzp6dZ77aZI8eiNydl9
	 tWbZOdpm1citPBz/CtozN6hPb1fbDjAX26zd+E0XIRZ5SkY6eGB+lHmQ9ioaTSJ6wU
	 j6jSK5HaUehLoYJ90C/UzazsKTsTUD9ICsYT0yd8KpW4e9QgMWoQXKfH6GZbNiIQ8T
	 UxYliNOKzliNQ==
Date: Fri, 27 Nov 2026 18:42:49 +0000
From: Will Deacon <will@kernel.org>
To: Abdalla Eldoumani <aamsdoumani@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Subject: Re: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT
 survives a second exec
Message-ID: <awnPKRtczyTiEcN0@willie-the-truck>
References: <20261017182455.1884-1-aamsdoumani@gmail.com>
 <20261017182455.1884-3-aamsdoumani@gmail.com>
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
In-Reply-To: <20261017182455.1884-3-aamsdoumani@gmail.com>

On Sat, Oct 17, 2026 at 12:24:54PM -0600, Abdalla Eldoumani wrote:
> From: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
> 
> The prctl_set_for_child test sets a vector length with
> PR_SVE_VL_INHERIT and checks that a forked and exec()ed child sees it.
> That only covers the first exec(). The kernel keeps the inherit flag
> and the on-exec VL across exec() so that later descendants keep the VL
> too, and nothing checks that part, which the fp TODO list notes as
> testing PR_SVE_VL_INHERIT after a double fork.
> 
> Extend the test to also read the VL in a grandchild. The child
> re-executes vec-syscfg in a mode that forks and execs the rdvl helper,
> so the VL is read after two fork() and exec() generations. Both SVE and
> SME are covered since the test runs for each vector type.
> 
> With a kernel modified to clear the inherit flag on exec() the existing
> check still passes and the new check fails for both vector types, with
> the grandchild getting the default VL. Drop the item from the TODO list.
> 
> Assisted-by: LLM
> Signed-off-by: Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
> ---
>  tools/testing/selftests/arm64/fp/TODO         |  1 -
>  tools/testing/selftests/arm64/fp/vec-syscfg.c | 62 ++++++++++++++++++-
>  2 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/arm64/fp/TODO b/tools/testing/selftests/arm64/fp/TODO
> index 44004e5..90ee128 100644
> --- a/tools/testing/selftests/arm64/fp/TODO
> +++ b/tools/testing/selftests/arm64/fp/TODO
> @@ -4,4 +4,3 @@
>   - Ensure ptraced processes actually see the register state visible through
>     the ptrace interface.
>   - Big endian.
> -- Test PR_SVE_VL_INHERIT after a double fork.

Since this TODO list was authored by Mark (Brown), it would be good for
him to assess whether or not your patch implements what he had in mind.

I can't see where the initial parent touches the prctl() and the way
you've added the fork() before we even print the selftest header looks
a bit weird to me.

Will
