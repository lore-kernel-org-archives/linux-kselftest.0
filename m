Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9806E26E706;
	Wed,  1 Apr 2026 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045337; cv=none; b=J4cdeNCp+iAcX7/MJUSyLK/0MNZLlLSixUdlLNQ15j2B+iPnSi7SHFNhIfLTU/L2dVwijv4wgtYhsPLrIiXwTCMMIObFwEk6fYdunwnab0VCtKXhkVLhoyxX5M7GBp1hGBMk2+fB8Z7VzB9KThslMz6EbbDu9RlUMzVM4JtCpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045337; c=relaxed/simple;
	bh=Zsz1KWW88aqJcvMBUIOh0Ys1zgAR7pErU1ze+icLZtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ij3DjlbIpmMjgkKlvKluH6EqqLHUfh9h4Y+l/zwPR1aVxnlJt6LM0XMdBVRe7e2PnOE/hKy4lI6HNkP3EWGy/kTq5rqhBYu3aB2gzZtpl09dpzvq3NEw5af+gnc079mK5iwddsnbnTF4ZHAx5c8TSXW/7Sw0oUxwH1fcmwjYcK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=qVhrNEMw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="qVhrNEMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775045333;
	bh=Zsz1KWW88aqJcvMBUIOh0Ys1zgAR7pErU1ze+icLZtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVhrNEMwQvEty5OInor3o7jjNTKDrf5eYOiqax+m5k49pdAI5GZ6b1wJkU7mc33Fa
	 fO2ZARKw/2fimxKOoitqgAPMASC6pyrF9j8Ta1FEZxMHbhTIXY83YPeG1dLmxVissW
	 rmmPtGiPAv26FsohpFsoWNZ5ZcCQFWPBPJ3rvl54=
Date: Wed, 1 Apr 2026 14:08:53 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mark Brown <broonie@kernel.org>
Cc: Chunyu Hu <chuhu@redhat.com>, akpm@linux-foundation.org, 
	david@kernel.org, shuah@kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, 
	Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH v7 4/7] selftests: ksft_exit_fail_perror: support printf
 style arguments
Message-ID: <c6976e34-54b7-42a8-968e-9ae967c52968@t-8ch.de>
References: <20260330151503.670415-1-chuhu@redhat.com>
 <20260330151503.670415-5-chuhu@redhat.com>
 <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efbad6c5-8d5e-4774-8d0a-d455e6e2c182@sirena.org.uk>

On 2026-04-01 12:03:09+0100, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 11:15:00PM +0800, Chunyu Hu wrote:
> 
> > The ksft_exit_fail_perror function previously only accepted a single string
> > argument, which limited its flexibility for providing specific context to
> > failure messages.
> 
> > This change updates ksft_exit_fail_perror to support variable arguments,
> > similar to ksft_exit_fail_msg.  Adding the __printf(1, 2) attribute enables
> > compile-time checking for format string correctness.
> 
> This is causing build regressions on the arm64 selftests:
> 
> /arm64/fp/za-fork-asm.o -o /build/stage/build-work/kselftest/arm64/fp/za-fork
> In file included from za-fork.c:12:
> ../../kselftest.h: In function ‘ksft_exit_fail_perror’:
> ../../kselftest.h:427:13: error: implicit declaration of function ‘vasprintf’; d
> id you mean ‘vsprintf’? [-Wimplicit-function-declaration]
>   427 |         if (vasprintf(&buf, msg, args) == -1) {
>       |             ^~~~~~~~~
>       |             vsprintf
> 
> This is because za-fork uses nolibc which does not implement
> vasprintf().

We can add vasprintf() to nolibc, I'll send a patch later today.
But it will be fairly inefficient, as our malloc() implementation
is *very* simple. Not that it would matter here.

That said, I am not a fan of the new ksft_exit_fail_perror().
What about this:

#define ksft_exit_fail_perror(msg, ...)	\
	ksft_exit_fail_msg(msg ": %s (%d)\n" __VA_OPT__(,) __VA_ARGS__, strerror(errno), errno);

A similar treatment might be done to ksft_exit_fail_msg().

> I need to look at why this managed to pass the build testing I do in
> -next...


Thomas
