Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA784229B0;
	Mon, 19 Oct 2026 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406137; cv=none; b=OQrG2RUCnMuyg2TbCwJF5oPFh7+y0hsB422RjIh1fIosHPLW3z4eaLTqLADNk29VsW4ds5NImoATSORWNX4AXYPP5Hx2qDIAsnKA4L5wSa2DUSUGmVXiUe1yozz60pRPfxX1jnc6plSN2U2fdtMVQXnjQg9L+JHj1xGxbhljDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406137; c=relaxed/simple;
	bh=/qPA3C4H5PUQHsTJAGP/5s8JPIpsvgJCg8DwidnZRuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6FO368XHZo8FH/ikg1n/2rp7DQM54CfG6TjyHT+ObLYBTBcLmGThodDyhYG6eNnHTi89ubfv6Fas0Djd4qDU37bT/os9ZdXhGmJuibJ9zRuS0wGDh6vpIZIE8Y79W4TdpbUQuxxYGrNeKHIt4OAUJguWkB+EYauXbZDRLpgn8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cPYHmpMf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4CA/APUp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cPYHmpMf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4CA/APUp"
Date: Mon, 19 Oct 2026 12:35:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792406134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zfTi3yjEfNeN/+5NinRk7/mJpdjzJqaaCcknZu1jXLg=;
	b=cPYHmpMfVZWO4UA1lTua0HDXPiCkHyb0NG30WauRpdgOJgOVGTLlMm9EOoDiFlR9OgZJrB
	2mTtyyU/zV5lb8tCfvCXGB81NsBizg8iYzrewJQ25KsKce/FOh/FMBDpdXtXdwmAhlg+nJ
	IsTMCOs3q8FaPC9HXcABUkIGCTq0Owrz4zGqiaW+24u7EDexNY6kqAdEGPnJm1tqfQmK43
	hPS0xmYKBrw0iKmHojU4foxIGi6621GC+KXATWdC5xtyxxHFfZIuvAwwvzQXTfaPumg4FP
	zaIXYKnzB7TvwaosSxVi0VwiUu7BwrgJA9nKHboTz4BSwSrMbjyah+TmekYqCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792406134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zfTi3yjEfNeN/+5NinRk7/mJpdjzJqaaCcknZu1jXLg=;
	b=4CA/APUp1fHmdx9bDhaeb+DvLBh0vaFlmYBS1D4DBE7PjzuE21R42Hs3ehJEUpIvJFyEwA
	DjBrLFWOE3hrhuAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 0/2] Start removing X86_X32_ABI
Message-ID: <20261019103532.E7ra8pya@linutronix.de>
References: <20261015-x32_removal-v5-0-2bfef9151fad@linutronix.de>
 <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fcf2983-0972-427b-ad05-b403e325ce40@linuxfoundation.org>

On 2026-10-15 13:47:37 [-0600], Shuah Khan wrote:
> For selftests:
> 
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>

Thank you.

> Do you plan to cleanup x32 checks from selftests/x86 Makefiles?

Could you please give me an example? I've been looking through
	tools/testing/selftests/x86

and didn't find anything Makefile + x32 related. Just
syscall_numbering.c which has x32 bits.

> thanks,
> -- Shuah

Sebastian
