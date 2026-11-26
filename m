Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679385;
	b=JGpAeg4NGtJiqvF/RIKeaYMocc52BsJcQnl8/VVn0qeq6ArtQ+sU/ByDOsbMtDgJimiC
	 3FZ6/GuwtHH3EYeblQ25L7lnmEDy4WsrDEWRJoqbxQNJN6z9gQheW6NtmiJCuREPv8SY+
	 Oajno2nT7EdIcy6l6UsImXt4js1m9x7FPbRXJqGL2P0Cn+QNMCpYiLeG/tF2NjfKO5Gm6
	 AZm5V47JueMHles3V9rxTbmSs+PUph+vXshXe9NBspCouv7ij39fo6EycdkgsRl1bafpM
	 +XfhjZ7xMsKPGHvPZYx3c9pa36QetbBi5QGQLPkHn3CSvZ9+0nxetmkHeasJjfDD1Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679385;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=igwBwpxEPpOo7JhISAe3xDcfUw7dJh4domzsW8aHYuQ=;
	b=efw9I7/IZVSqB10hbk6Aw5LlfY+DH9+470lEKojz9wS3TwuQS6LukjTN6mlKi7967eSB
	 EcHkbz/4+NQjLlrXdiwnOWr7j9RsUg0wulO6U00LARcfZfz7HqEmGAcVYaGMbBHI1WyJJ
	 smeZYiI21MRwgixLbPXEKk4gbfDTnMyGYgQi8J1crCNyrObxAJBNlHYHGkMVbq7h0l/ks
	 tFXNN8mgmJNpSWGSXEFtpeoT+2Qr6DgWFBpbW8ZfT/k5fAR8vy7MLkPrHowXL1xjanEAh
	 D2Y+Bsq7Gu9Ydbb6xSySIngtaq1qsASuEiD4A9LBb2393tVCsODbgpaW9kJL0mn8hCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WpWhTqsr;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E830606A31C;
	Thu, 26 Nov 2026 07:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E830606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WpWhTqsr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1795679382;
	bh=q/odsP5fELbdmTHt5GCHwLUhJQlCm6xMBYihsTNca3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WpWhTqsrHGL2yfJ/R/oTw0ol/ZOQxj5yJk5iRzIe/e12d8/GODjbSxtnzKiUs2ebs
	 j2UDKA0SLlYaBVIs5JE6J79IYIY07136qDldEA2F+PNDoIs7+adGWZjRTsqdLyORbC
	 rrz/yb4T9ty2sxNUK0Fq1KMvU/ZqsYMEEciUGy84=
Date: Thu, 26 Nov 2026 08:49:40 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Arav Verma <svav2021@gmail.com>
Cc: w@1wt.eu, shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] tools/nolibc: fix standard conformance of a few
 string functions
Message-ID: <ad43e400-f5b7-4291-bc01-cd8deee73c1b@t-8ch.de>
References: <20261125181453.814976-1-svav2021@gmail.com>
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
In-Reply-To: <20261125181453.814976-1-svav2021@gmail.com>

On 2026-11-25 12:14:50-0600, Arav Verma wrote:
> A few nolibc functions deviate from the C standard in corner cases:
> strchr()/strrchr() do not find the terminating NUL, strstr() returns
> NULL for an empty needle, and atoi()/atol() do not skip leading
> whitespace or accept a '+' sign.
> 
> Fix them and add test cases. The new tests fail without the fixes. The
> results were also compared against glibc.
> 
> Arav Verma (3):
>   tools/nolibc: fix strchr() and strrchr() for the NUL terminator
>   tools/nolibc: fix strstr() with an empty needle
>   tools/nolibc: make atoi() and atol() skip whitespace and accept '+'

Thanks! Applied.

I also verified the new tests against musl.

>  tools/include/nolibc/stdlib.h                |  5 +++++
>  tools/include/nolibc/string.h                | 12 +++++-------
>  tools/testing/selftests/nolibc/nolibc-test.c |  9 +++++++++
>  3 files changed, 19 insertions(+), 7 deletions(-)
