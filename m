Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647FF86341;
	Thu, 13 Aug 2026 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623077; cv=none; b=pot3Uf2zXCDJdA8TLocwhIwB3pUkd1oM4bIMJmDKfMwXHMSjGyGguXAMBV1PnkjAi68vO5VM4O+dSBEme+UoP8jvbyU0+4ls4klpgbsrwW6XX4zK/rkHvfQegkxAk4pZ9pNQBozWJDhKs882o6LnIfEMj53Nu5mYWuZy6wBRhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623077; c=relaxed/simple;
	bh=lXxpFSnZmASJRjwbjsEJTBnbghIwLwxVPaIdHIYb1xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD1k68EPA8f6yHr3EqL7BYVdApgk+pT5M/qNU7tojxjNwtD617w4kOctjrR9X+EunCXCxyBh/7LqUc71PYaXud+BUZ9Ya0JQsjWVvotICO+Iv7BCmjefmCcN/R6QadjqeZWsRTodclSjDFLuxK05k2YcYqwhy6o4lZ304QtLGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UPo4Rq0R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nfaXytQl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UPo4Rq0R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nfaXytQl"
Date: Thu, 13 Aug 2026 14:11:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786623072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ihCrHucstlLDg7/AzfLnbUBHWpfK/QHsps/L4LDwPeA=;
	b=UPo4Rq0RJyqbM0+df5CmElqlKDHdIOfXQiKAG2Hp5DVjJNMqigwVrABI/05kmyA0h9cb3T
	pvAf4l0oaJM2sCR7Q4oGp2RJulHLh5OFALZl+DYo65NsPukNmV8xpQ2nmXEHRNdf9LyXbX
	3ql/DZW23sA4BTOjWtgMZBdOznD6V+rGpJGfu+TKMq4SPxPYr//QVNGgUNY+pTtdF6X+kd
	O1PP1bkrty9HjTC3rlt5zdZX2VQpL9oR5xemzF2w6O/t06b9XXDeMbN0MsegeVQBdLBOKZ
	c8IKGy1MVX4cOCGWBSInoix1ZLU/FphW30puvpiHE1q5xLVUPsXFdpaot6AJxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786623072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ihCrHucstlLDg7/AzfLnbUBHWpfK/QHsps/L4LDwPeA=;
	b=nfaXytQlPrLrUm4p2qRVteMChpof7kfkUAd0Wa5ygTrJySHzj5WpHlqcIjnitJnRHGG/en
	5PDczCc2U/gLbfBQ==
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
Message-ID: <20260813121111.bVf9xHsk@linutronix.de>
References: <20260813-x32_removal-v3-0-e8f96cd15478@linutronix.de>
 <20260813-x32_removal-v3-2-e8f96cd15478@linutronix.de>
 <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53d827d6481818bf0ba1fbf0b29aa5e750243b7b.camel@physik.fu-berlin.de>

On 2026-08-13 13:07:53 [+0200], John Paul Adrian Glaubitz wrote:
> Hi Sebastian,
Hi Adrian,

> On Thu, 2026-08-13 at 13:04 +0200, Sebastian Andrzej Siewior wrote:
> > Since there is practically no real use for x32, start removing it by
> > removing the symbol first, not allowing to enable it. Should nothing
> > happening by the end of the year, it will removed after the last LTS
> > kernel this year.
> 
> Wouldn't that mean that x32 won't be usable in the upcoming LTS kernel
> then? Why not do it the same way it was done for ia64, wait for the next
> LTS release, then remove it.

The idea is to revert the (two) commit(s).

> Anyone still wishing to use it could just install that particular LTS
> kernel.
> 
> Adrian

Sebastian
