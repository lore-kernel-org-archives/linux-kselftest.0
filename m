Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5F33B19C6;
	Thu,  1 Oct 2026 23:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790896864; cv=none; b=LCDiSeyM5Jgjp0pCIdxaXGnowVTTo8qXbhHwNzPai8Z0PvYXQwcprHQRNi9ymLf60pRs+/zDaKXFeZoPGxg4qZqkqbkoYlEJZblu7HL9Zaax00eYzy49oi5wm7SCCzL359hG1kwPeojuH0NySK3l5qQOGgN/sgaL8pBK06igR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790896864; c=relaxed/simple;
	bh=HMYMb36MBbws8fMSlUXnSE27hI0YDJnhbCUHkLiLjrk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dVWq/nWyf7CEfD5MpyHpfDeodSPsxdvsBjvOXqCPoLPWj0FmJVf3LSPKL65nV3g998xtuZSRxMIx0DwqN3u7lMSqj6RlVe6XoGKT7cVfeE47ISFZsaba5fuBCC5gkp4HD4GDpNSPRHJP3AZKRK3QLoxHpVThh89omrd02pGm2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxteQRFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxteQRFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5141F000FF;
	Thu,  1 Oct 2026 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790896863;
	bh=HMYMb36MBbws8fMSlUXnSE27hI0YDJnhbCUHkLiLjrk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YxteQRFMF9yE148tuS7P6r4eRNQjmyrQp7USPQl3R0twhQLA/wIexXyklOVDOWsdd
	 HzAohASHncXCG7bhuZ0uM/XUDp+vG6BjlYADG5Dyv96U3l2XNJxm1jZO4J6MHUVIhZ
	 b3rJdRgWtpPdaR+nlyK/w/BjLkWLD88rfmdQEXnB98i6OGsxScw3vY7a03MAkp3mxz
	 FnGqij6khfLqF79fRc43TuBbnK6WB+3z2R/cJ5Y0+cFF9+ioisrIvD/pbyO+wgo3Ok
	 GAy4R2KPUOVFAyCaZTO6HFSH1KCxD/V9IkkmTjNuLrNgoSw1L6j7NPk0K47ZUKCVPv
	 kcLRnNoDZzO7g==
Date: Thu, 1 Oct 2026 16:21:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Haseeb Malik via B4 Relay <devnull+haseebulhaq55.gmail.com@kernel.org>
Cc: haseebulhaq55@gmail.com, Sabrina Dubroca <sd@queasysnail.net>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Hannes Frederic
 Sowa <hannes@stressinduktion.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] macsec: check the resolved SCI for duplicates
Message-ID: <20261001162102.276985c7@kernel.org>
In-Reply-To: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>
References: <20260927-fix-macsec-duplicate-sci-v1-1-085bd742c8e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Sep 2026 01:03:24 -0400 Haseeb Malik via B4 Relay wrote:
> Add regression tests for duplicate rejection using default, explicit and
> all-ones SCI requests, and for valid fallback and reuse after deletion.
> The same tests reproduce two failures before the fix and pass afterward.

Thanks, please split it up to a separate patch, make it a 2 patch
series. No need for a cover letter.
