Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1FB450904;
	Fri,  5 Jun 2026 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643477; cv=none; b=Btge9UO3Jaiyz25A7FW3LxLSWhn8RnYDgJi+pr6Qsd9fcQPlHxQOjM2CMdeo6+0y0uSOgQGUJ2nijOLiHtLN4FAwn9Db/nfXrw8RKAZeICxTFxbZstIPcxiJDd4pYPY8AAHLWpEbvQHTHyZ7QOJGyAT7N5nEcJRSudS9AApV/Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643477; c=relaxed/simple;
	bh=mHngWsBFzBMZMVNKDFUaiBN0kxyCUQuHKO9gs1/alOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfNZ49bB8ITNHHw4dXWSxNeV70h3nlaEZBtLv8ATDtvFnL7aMi4G8ZZQCTsvQIKOEuxwUuIgBq5QWTFueaWeiw3/Op4DGcWi6XXMSxmrcWcnSSpCLEi2QIDttEqmM+ZbLUqCSknE7NcUyEd9Lvn0zp8Uf/roQJ21V1Mpgcf5CW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m4ArTsfr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WG2j1aXo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m4ArTsfr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WG2j1aXo"
Date: Fri, 5 Jun 2026 09:11:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780643474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9z0RaSJ4cAUBQBSwfsiNNeA/mgZtXXbIGUneV9rxHg=;
	b=m4ArTsfrJMOdRpjzU1cIx062kma2iVr/S+bodBtYg6e/djRO+GOVrtAqxhV3pPtyokFkXH
	DxlzdGHUJhUA9Ef9HelP5sLxQ95cihbnXtLRf72JCZwSOsCWXw6FtRhwHjDEjJGXBYPTt3
	rtIkzNi2RSg2AshdwVh5Zm7RHaUuv5Gf9zxW8YY1LTS6SCmdITHoicBhjAmhF3urz/IP1b
	NvjXfAhM0Y6+00Q0Qnyx2oP3OQvEpOMTxdyf1DAxTim5hokyAPJ5TkE4+qdidc/f60S3mD
	d7vNrtOjnUEXvzIh1HTPY+DvNjAu3Wn/smVisvFn/m+082XvqhvJE6Ub4D6F1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780643474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9z0RaSJ4cAUBQBSwfsiNNeA/mgZtXXbIGUneV9rxHg=;
	b=WG2j1aXo5dA6wwRUIisH2xxaNgWUUfku2DPlTnvtyj+ScXnDoDccaM/REZ3+t3Uafzt+mN
	8I+4P4JmJMX8vpDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 2/2] kunit: tool: Add (primitive) support for
 outputting JUnit XML
Message-ID: <20260605085852-83bb51b3-0f8a-412c-84e2-ff0488998e4d@linutronix.de>
References: <20260604123207.2615485-1-david@davidgow.net>
 <20260604123207.2615485-2-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260604123207.2615485-2-david@davidgow.net>

On Thu, Jun 04, 2026 at 08:32:05PM +0800, David Gow wrote:
> This is used by things like Jenkins and other CI systems, which can
> pretty-print the test output and potentially provide test-level comparisons
> between runs.
> 
> The implementation here is pretty basic: it only provides the raw results,
> split into tests and test suites, and doesn't provide any overall metadata.
> However, CI systems like Jenkins can ingest it and it is already useful.
> 
> Signed-off-by: David Gow <david@davidgow.net>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
> Here's version 3 of the JUnit support patch. This one uses python's ElementTree
> API to generate the XML, rather than writing strings directly. The only real
> difference in the output is that this escapes any log lines, rather than using
> CDATA sections. (There are both advantages and disadvantages to this, but
> they're all pretty minor. Equally, the option of using the
> xml.sax.saxutils.XMLGenerator API instead is a possibility. ElementTree ended
> up being slightly more aligned with the way the JSON version worked.)

I still somewhat prefer an event-based formatting.
(There is also xml.etree.ElementTree.TreeBuilder)
But if the JSON formatter works the same, its fine for me.

(...)
