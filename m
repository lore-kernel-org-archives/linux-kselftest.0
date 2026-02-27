Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B502C8632A;
	Fri, 27 Feb 2026 02:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772159113; cv=none; b=gs6Jy0Xx5CUBxS8soAMSIuZGReYJNyyz9fyllDfZMG5hD/7obNSCakOA4RMVhibgYxR4sWahNxyP9R4rcyrOUt6Z9U/3+rCmf38z+hBwdkgVDILTj1X3ZdEjXC/PGm7hdedb37BvyzQWng15C0o2c+xC9Xc6vO4Doc7X4WAivEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772159113; c=relaxed/simple;
	bh=eyrSIDsZ5QHi3TkgJVZHxpafO2KihE5BniAA72nJLW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t00XLfx/8iMb54MTpEMR5BAsWY8J7GwMLnmWNBM2lMbo47o3UogPCqdvCE4sdd2yos+iAYJ/KAGoyuFGv4xUzFq03ADkgzGVv8Ju8GVdIHN/nbaMm6TVOaa9cBTt7L0r5hfZZF/tQguaGzSbDoZRTOR79vOTwcXvjqH1B8fRHDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcD1fvDt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcD1fvDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC40C116C6;
	Fri, 27 Feb 2026 02:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772159113;
	bh=eyrSIDsZ5QHi3TkgJVZHxpafO2KihE5BniAA72nJLW4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mcD1fvDtIiYm+Z4aMDxWZtzT7vHvWjJsrTe+nujoAcqJBnuNLHKMIZ43e49feWG9l
	 Vl7KPpUGTLd82JLeTiHvKyNPq2+K5gf06eCImcJGtZy2Zw0oQd0bT/2cR97b4AzUv+
	 AXOzmWUAwh499TB/ISuurUJiUtcjRYx4gFBHpZJ2Jj8awlM4WNAuwPyKBySM2luR8m
	 4PGmB1jRVSvKxin1jFusXN5Akm+E3ExucNIvZUSr22KwCu7jTB0m9HU+3S6evMfrbg
	 o0nly42A6dpVSerY2a74elAGfn+sgWKUI4aIFM9aJ7UaDKTPtUcAloh4cl/XVkdhgq
	 dDCYnA7wDUcSA==
Date: Thu, 26 Feb 2026 18:25:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] selftests: drivers: hw: add tests for the
 ethtool standard counters
Message-ID: <20260226182511.0d33f9d1@kernel.org>
In-Reply-To: <vcphjyyj3jezenqfgieqac7ayxhslupgeu6kh2ywfukaat3rtf@tsqaz33v4o7c>
References: <20260225150648.1542206-1-ioana.ciornei@nxp.com>
	<20260225150648.1542206-6-ioana.ciornei@nxp.com>
	<77f3e4e8-430e-4ae1-aa1f-8f70b4d8d3da@lunn.ch>
	<osswnpbiyy35ycs7ha2ufugj7dzmvpeq3x7vjq4j53qtwamkuw@ihwl5qjuydnv>
	<ph7vs3fsxti3nlypmmvm6wqvsnnsn76wct3qpi5omphggcjqrt@3any2dqzlgsr>
	<031c7375-0407-476a-92eb-0f894ec820f1@lunn.ch>
	<vcphjyyj3jezenqfgieqac7ayxhslupgeu6kh2ywfukaat3rtf@tsqaz33v4o7c>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Feb 2026 16:18:21 +0200 Ioana Ciornei wrote:
> > How about, fail the test if any are greater than 1% of the number of
> > packets transmitted/received? My _guess_ is, if you have 1% packet
> > loss, networking is not going to be happy anyway. It probably means
> > you have one end doing Half duplex and the other Full. That is a
> > typical configuration error you see causing collisions. Not that i've
> > actually seen this for maybe a decade!
> > 
> > Failing the test, with a comment about checking duplex configuration,
> > seems sensible.  
> 
> Seems reasonable. Thanks for the help!

FWIW the expectation is that the test should be able to run even on
systems / boards with a single interface. So the control traffic
(communicating with the traffic generator) will run over the same
interface as the test. 1% error is unachievable. I'd only check the
lower bound, and use some sanity value for the upper bound (2^30 ?)
if at all
