Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FF136DA03;
	Mon, 27 Jul 2026 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151710; cv=none; b=g3AELnxxN2XyakKhcGDnL2/EVf93evfCjpzAxpkEWy3EPLpEtlgqo4BKV8RhdGzl8zO6Zv8IT/rOvwOwSJ2Y5wMAcrOV/QPGTPz68PDXNX1kOtllk/O727y1ejcVZJdQAdnQ97guLyZCv2yJ+ge0zek8UNj3iLKE6f/pHhcVPFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151710; c=relaxed/simple;
	bh=YKD061RWszkTQX0pPdyulPev2bzbGFVHMhSQfAMQiMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rd3kvYMrMsjf3wzzgflsyHv2ba2vEzTlMXu6jFphzHSmESdT9TGWDFEnbI+NmBzvJwWiWbhGA0YHauEUArzDS6efclhFIP60BCcO+58tS4yrHPGStZbiD8p+g3LO4etU4BBf63Oy3Lzev6YiziYlwTzwOfyKGuJ2kMsXGwVlivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4E5MG81; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4E5MG81"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B2B1F000E9;
	Mon, 27 Jul 2026 11:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785151708;
	bh=tQKUulHdFVPaZqHcOwgv97p2jZESVdlEB2HxY/RWfcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k4E5MG81jTiYdIr5hVdYzZSi7vt6odUx/asIO2/XnBZTNE1m80+kXzFqQbnw5f9nF
	 V4H/s2YAz7xVtZIIaXdRkiFnnH6ZAPFw1/47NJcoLGzeaE+7UNxiRR3p0J7RQwIO+e
	 whXRK+guVMTThh8U5UQwtp19DbSrGlv04K/1yGAPjptlNHJvsH20E7eqNbjLfRXq05
	 7BBdzVyXQs17jUDpJ8iPOQpCf+gyO5hyhDReOZ5BTigB9B80V2xosm8YDZO1qlp84b
	 MGoHWXEnpElVIjAVGzV+aPDcSRfPVKK443HvhVxTR++JMhy1R0NWLg7ZcRBXZ47+FA
	 yofqHueV7PQBg==
Date: Mon, 27 Jul 2026 12:28:23 +0100
From: Simon Horman <horms@kernel.org>
To: Deep Shah <deepshah146@gmail.com>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH v2 net 2/2] selftests: ptp: add a regression test for the
 frequency adjustment overflow
Message-ID: <20260727112823.GN418547@horms.kernel.org>
References: <20260721014256.1876-1-deepshah146@gmail.com>
 <20260721014256.1876-3-deepshah146@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721014256.1876-3-deepshah146@gmail.com>

On Tue, Jul 21, 2026 at 01:42:56AM +0000, Deep Shah wrote:
> testptp's -f option stores the requested adjustment as an int ppb and
> converts it to scaled ppm, so it cannot express the 64-bit scaled-ppm
> values needed to overflow scaled_ppm_to_ppb() and bypass the max_adj
> check enforced by ptp_clock_adjtime().
> 
> Add a small test that crafts struct timex.freq directly and verifies that
> an overflowing frequency adjustment is rejected with -ERANGE.  The test
> skips when no frequency-adjustable PTP device is available.
> 
> Signed-off-by: Deep Shah <deepshah146@gmail.com>

...

> diff --git a/tools/testing/selftests/ptp/ptp_freq_overflow.c b/tools/testing/selftests/ptp/ptp_freq_overflow.c

...

> +	/*
> +	 * (1 + 147573952589676412) * 125 == 2^64 + 9, which overflows s64 in
> +	 * scaled_ppm_to_ppb() and wraps the result to a ppb of 0.  A kernel
> +	 * that does not detect the overflow lets this absurd frequency past
> +	 * the max_adj check; a fixed kernel rejects it with -ERANGE.
> +	 */
> +	tx.modes = ADJ_FREQUENCY;
> +#if __SIZEOF_LONG__ >= 8
> +	tx.freq = 147573952589676412L;
> +#endif

Thanks for the update here.
But unfortunately sashiko.dev still flags a problem.

  "Will this preprocessor condition cause a false test failure on 32-bit
   architectures configured with 64-bit time types (such as x32 or y2038
   compliant systems)?

  "On those architectures, the runtime check earlier in main() passes because
   sizeof(tx.freq) is 8. However, __SIZEOF_LONG__ evaluates to 4, which causes
   the preprocessor to skip the assignment of tx.freq.

  "This leaves tx.freq as 0, allowing clock_adjtime() to successfully apply
   a zero adjustment instead of rejecting the call with -ERANGE, which triggers
   a test failure.

I wonder if dropping the #if/#endif would address that concern.


