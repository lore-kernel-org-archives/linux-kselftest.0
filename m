Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844C3845D5;
	Mon,  3 Aug 2026 07:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740555; cv=none; b=nlhpv6PgTpGbnMD3hVIuGsm72MQNIyOUdmhwstEAkMsC8+oMlsgOA5vnL9tylSuRE1buRYzj/LGk9bODdqSGjAAvc/8rYxQxNEOMuDGlXO8wXtBCnJhpPk7e2okHPuuro5PtCU5kcAxzDghQPzAp86OjIT3EuozKkLguWIAQpUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740555; c=relaxed/simple;
	bh=1sGqIeUdLNB6Z0TxyJDlAQW+ghtffIRB2kSmRpmeeag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvJIFFZwJJfSv6P6ASbMgyBARUUiVLmc//3NIujWF4Y807RPSLyMTI5+wVc5qJcvfDuomG2FqhkGwVY8TpvOLcI3J9LSq4Y+LzWGdDdv9tT1XWZwUx5N9DgqJCnimNIFGatAouXVFHe4LcmVptn1PPm6V1Uz27VsP5YxhqhGSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xf7ughVj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Uo9OZSJj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xf7ughVj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Uo9OZSJj"
Date: Mon, 3 Aug 2026 09:02:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785740551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ERQCbuoXqcwzy8iz0hTOM0sCx4O1nBpdgE4jvn+rKs=;
	b=Xf7ughVjrcE5Gwj5zdyxXbLOe14JFBhd5xqMZUUBgtCwyhke4urYfo+JwJensRqDw7S+kH
	bC4KkgbJWypcGeehQ9Ls9wvc6wL0OB1nzre0X6LQMnHxGbjJs1A+37KLomVg9MdxSkQbhR
	eRbqXfZzGWglor4/Up16g4VsCklqikRx9QgNBfpqPLrHpkvH0Zwrp5Y/yMjXNzVBMVFGr3
	FeneridBHdSFQBnAv+5hDf40CMkZnXG6/Zo1e82ej3ap7e+O095QAnL5MZlNyfGhY4JeGH
	mTN8BB3psu5iOWo4SagcFzu58LZM8oc/C7xOkcgyqlFxuDqQ5i4HrtDnLShB9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785740551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ERQCbuoXqcwzy8iz0hTOM0sCx4O1nBpdgE4jvn+rKs=;
	b=Uo9OZSJj52Y4uHQly/waPKeSpovDY+EfG3yJOlfF3QVy9Y9JcOpoeImKueD2ipjYVz2vpt
	vdDvkQQ5dpH3SdBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh_=28Schneider_Electric=29?= <thomas.weissschuh@linutronix.de>
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 09/16] selftests: timers: nanosleep: Explicitly list the
 tested clocks
Message-ID: <20260803085954-74a99bd6-1241-4479-bd93-b8c1c82f2378@linutronix.de>
References: <20260730-auxclock-nanosleep-prep-v1-0-cd8b61229a7c@linutronix.de>
 <20260730-auxclock-nanosleep-prep-v1-9-cd8b61229a7c@linutronix.de>
 <CANDhNCp=aOtw2e3i-XeMbHy8oGfnZ9Waw_n=0Q1Kc_9CbQAF0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCp=aOtw2e3i-XeMbHy8oGfnZ9Waw_n=0Q1Kc_9CbQAF0Q@mail.gmail.com>

On Thu, Jul 30, 2026 at 12:20:31PM -0700, John Stultz wrote:
> On Wed, Jul 29, 2026 at 11:47 PM Thomas Weißschuh (Schneider Electric)
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > The test relies on the numeric values of the clockids.
> > As not all clocks are meant to be tested, this requires skipping some
> > clocks unconditionally, cluttering the result.
> 
> My only nit here is that there are some clocks the previous code
> explicitly skips (_CPUTIME_IDs), and others that are skipped as they
> just don't support nanosleep (the _RAW and _COARSE ids) and return the
> proper error.
> 
> It might be helpful to clarify in the commit message this distinction
> so its clear this commit isn't just forgetting the _RAW and _COARSE
> ids.

I'll update the commit message to mention this.

> > Use an equivalent, explicit list instead.
> >
> > Signed-off-by: Thomas Weißschuh (Schneider Electric) <thomas.weissschuh@linutronix.de>
> 
> Otherwise,
> Acked-by: John Stultz <jstultz@google.com>

Thanks!
