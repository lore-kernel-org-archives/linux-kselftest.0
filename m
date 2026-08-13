Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B247D922;
	Thu, 13 Aug 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628486; cv=none; b=eOYHBg5Kf5+YW7ZODWPHnFPfTJa5GIGIZQIWclgzY71dBBuOGfzd0yIilkUAghI+j+mzJHYJk4H/gNol45NfGfEWiuSQ2MVOA9mRny7ncdpTymPvi9tbV2eCG/VTfE0D7P7uwLPzCI8uKD0Q/GcRKbH1vg+xS5H2rI99lU6LLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628486; c=relaxed/simple;
	bh=yon+KGfNivKJFsOTncBwn6sFHMMNO+g0Af4R5xGN69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POFzceUg310XSGbg7Du5aXczsc3CscUg2WI2+OCDbUZ2kmG6WqACb/fykDGt8PJCjo8ZNoylvdxzLykZ42g4ic6XTQeiNjPZ4zizNFRrZ2WLIkau5qJDjsXqL8gzMBOtyqqEetYpDfUYSvXzwc5Pv1DdhJwCrmnjoA1hWszhlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nWxBJNaL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JrOvAZHM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nWxBJNaL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JrOvAZHM"
Date: Thu, 13 Aug 2026 15:41:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786628483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DOLPzUdWUsoVLZgXHM9UfRkVwPB6i0v4UY/lMW8KeQ=;
	b=nWxBJNaLft/Sd2e8kKjoO3FMReIbMYC0KgCo74FXSs3i5JupX3ZMdOjxlE65ubJOeWm22o
	Qnys3wOGgwv+UhxnWowINSCzDitLHB2FJ2sFlC91WpDNSwEoOcH1cjP+hS5qNdmASqSVA1
	3G66fsULdTZNvlnSm6RWtDbvO+bMHhUpnKyGUctdltnO77qmZzonD0ZDE+eCt+aqOjZCcW
	IqC4Ad76M+sN4BCl0OtolkJq9r/zjaSMLL+CdlfWna8Edu9G7Im7aXfg7jqiQe435dtiug
	w6eRtv+jsvIS6wDxvEqnwpBMGQzkLSJuE577tnjZe2BMIcs+RP+EDTzKZKSawQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786628483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DOLPzUdWUsoVLZgXHM9UfRkVwPB6i0v4UY/lMW8KeQ=;
	b=JrOvAZHMAEbGZdG5zm2g1OPreClRzYEe2WM/D8967A8jaL4oNPO8W+Oh8YwpvVt8erB0mo
	EYAihqNsSGkcDQAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Sam James <sam@gentoo.org>, Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tomas Glozar <tglozar@kernel.org>, Willy Tarreau <w@1wt.eu>,
	x86@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/2] x86: Start removing X86_X32_ABI
Message-ID: <20260813134121.2vaFywr3@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
 <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
 <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>
 <20260813121111.bVf9xHsk@linutronix.de>
 <f5f5e9a6eed1955f4ad8f01b810562979290bcc4.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f5f5e9a6eed1955f4ad8f01b810562979290bcc4.camel@physik.fu-berlin.de>

On 2026-08-13 14:24:39 [+0200], John Paul Adrian Glaubitz wrote:
> Hi Sebastian,
Hi Adrian,

> > The idea is to revert the (two) commit(s).
> 
> But that imply that anyone concerned would have to respond in a timely manner
> which is not really something I would expect.

What do you mean by respond in a timely manner?

> My suggestion would be to leave the complete x32 support fully intact until
> the next LTS release so that anyone using that LTS release will know that x32
> will be fully working.

Given the media covered it well, it might work.

> Adrian

Sebastian
