Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FE374E71;
	Wed, 10 Jun 2026 20:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123229; cv=none; b=qlm1zu5zuW1OveCz9hHlfBhAx5/n0FjGH3VJX8Hp6ph8SSWsM7KFfZo/PZIDKPiwPDYKe08OX0kU4fUvry/m9KjyaOxII0CaIo2lI7dHAli0DJ1WzFAmxUpZqXfqO6aSLn2vUSJCNtzrTHH+ObioOyx6SkBr7fks4VeiZNOteKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123229; c=relaxed/simple;
	bh=vbav4R/50l+zHmQf/p7AFU+i6A9OQmIAlm262yLgXV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTZZWe27PdyRIi+9TdC2gFJZMV3voc2DxrbLukcPE60MqN+5rYnGEXogVrcSQwwEgCMwhauGm2BHu0bkAmaUwUFxUQcd3xdZAFc9+l87kk5sv5MYplDoUDXrCQFkDQp4aFzItidt9OnDDVkCbshmM1rA1Pby9ELEocrNz7qM5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xd5ynXYg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xd5ynXYg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5FA1F00893;
	Wed, 10 Jun 2026 20:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781123228;
	bh=j5CigE6eQkuRTDDtVjoiSwDf3/G5U85SBIBqSGAtZVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd5ynXYg0MMQWj3Wet36BM7HOpXnd+7Ejgrc+kpnE+FIHW5BPQDM7E3jx0/Rr2akZ
	 afbvurD+xDRhWul6qjEoYEdGY0a7XXMJQW+0H0mfkw4o/4/A2fP3C7odLfN/rOJVv1
	 DJrL7Y5M7hHIYonB1PomMd4DwO17Nsw0xjuDgUDV6z0Z78FAcRyOiUaoehUxcCjSW8
	 UJiGqIEnI7z2p+1LkdO5fna4HClX7Ls+Ty0R2W2c75uF+pTnaUQ5vJTHOyeruyOi/T
	 zgbwUOXkiCnrNFmluvKUWoadRCS+VSso+ITOgvtO3gLJLMehkyCbWADbBm4OHj4xrP
	 XXNDfWJUpz/1g==
Date: Wed, 10 Jun 2026 13:27:07 -0700
From: Kees Cook <kees@kernel.org>
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v4 1/2] kunit: tool: Parse and print the reason tests are
 skipped
Message-ID: <202606101326.DD12C7CC@keescook>
References: <20260606013827.240790-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606013827.240790-1-david@davidgow.net>

On Sat, Jun 06, 2026 at 09:38:17AM +0800, David Gow wrote:
> When a KUnit test (or other KTAP test) is skipped, a "skip reason" can be
> provided. kunit.py has never done anything with this, ignoring anything
> included in the KTAP output after the 'SKIP' directive.
> 
> Since we have it, and it's used, print it in a nice friendly yellow in
> parentheses after a skipped test's name.
> 
> (And, by parsing it, it can be included in the JUnit results as well.)
> 
> Signed-off-by: David Gow <david@davidgow.net>

Thank you; this makes my life easier so I don't have to use --raw_output
in my fortify testing. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
