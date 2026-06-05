Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BA3402B96;
	Fri,  5 Jun 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780642731; cv=none; b=UUiQLeAP/gwLlfGHaXIuBiraz/vpiAAGYD49cjvYdjzYnIGOCyiq+u9EwgDS1QBjCUvEvKLtapjmrJxXg63JMYRIHzvM+46/JvgNxFOw6IZgMTBJ4UFY7mUGI+s9k9Tn+a+9aed2crbj4tf5w7cLBxvhf0PEEff2Mr3jUCBYKN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780642731; c=relaxed/simple;
	bh=WQaWwkDX9YbrW3OgalS/+vNXcVeQrsyG4JZN4PIbFnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXQwVfYxgyaFO9/HbSeLyGbtWL22y0oKTuHGyg0gCV/RpfSSg7A7dL+ms9ZJFv5DPHglsUbYA2aZhbCejKaUbMuURRcXLT8pbLQja8ECInqcvWZCS6rOfTHCZ+RIT26IpVkxICcXo5NKIKGDHfb9n87SWNL3AphxiF+nrJprw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wg3zHL/g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X2UE6cZp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wg3zHL/g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X2UE6cZp"
Date: Fri, 5 Jun 2026 08:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780642727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M3EmMILu+ye1yiJ+olGsUWVQFGrk57Nj8f/4vKU+M4w=;
	b=wg3zHL/g4yWowoJH1VUHWMtZJbLez/0b4n4JH7lMcptiJS49P3DiW7hSDBpdFE/dsyn1vd
	53jkAUcMcAQ1eqexAVgY7ymgWX1junkDdD7eKRnn8miYLEzdpevdKkRWhk6mUiVkepm/Ti
	HJJ1s48rsnuQcWU39NbQz36inKcZwowhBZV4xDDHeLrKZewCHh5BC2f3HR8SVxujJ2mHUD
	e8P8bkeCM784412F8N9KUIKtGvK/yyBcFiVkSQrw2wGYqRVGXUWiA8bHI8/Qc4j7UKtMcl
	ZuhATnPNd7jJQof7ao859y6GvidAX4vpd11CycaknsJCHGEQQieQ9pIL+VS6XQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780642727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M3EmMILu+ye1yiJ+olGsUWVQFGrk57Nj8f/4vKU+M4w=;
	b=X2UE6cZp5F8b8OrD1jFCi8eg8vHjG39PcrdgBxPrpbRXWRmDdj1dW7Rn42IH07cwVqHkiZ
	2WInfx1zZRIruZCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 1/2] kunit: tool: Parse and print the reason tests are
 skipped
Message-ID: <20260605085615-8c7c7024-3af8-4016-8d9f-7c7af30734e4@linutronix.de>
References: <20260604123207.2615485-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604123207.2615485-1-david@davidgow.net>

On Thu, Jun 04, 2026 at 08:32:04PM +0800, David Gow wrote:
> When a KUnit test (or other KTAP test) is skipped, a "skip reason" can be
> provided. kunit.py has never done anything with this, ignoring anything
> included in the KTAP output after the 'SKIP' directive.
> 
> Since we have it, and it's used, print it in a nice friendly yellow in
> parentheses after a skipped test's name.
> 
> (And, by parsing it, it can be included in the JUnit results as well.)

Some tests would be nice.

> Signed-off-by: David Gow <david@davidgow.net>
> ---
> 
> There are a few bits of KTAP that kunit.py has never actually parsed, and
> this is one of them. It's also nice to have a good way of quickly seeing
> why a test has been skipped, given most tests do provide good reason
> strings.
> 
> Happy to hear comments about the style: yellow in parentheses looks pretty
> good here, but could be a bit confusing if KUnit do

Something is missing here?

For [SKIPPED] the brackets are colored, too.

> This is the first version of this patch, as it's a new dependency of v3 of
> patch 2, the JUnit support, which also includes the skip reason.
> 
> --
>  tools/testing/kunit/kunit_parser.py | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

(...)
