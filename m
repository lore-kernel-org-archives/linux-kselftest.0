Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148347A88D;
	Wed,  5 Aug 2026 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947200; cv=none; b=Y7jYKmjOsaFsSXRSe8tNyvaSnizoxegxN6XQ0NnVGSId01lB2KTLb3FJHmiU4qzQQltwKnxVrv8HGiI0GR+QyTnbw6kxXmRUl4Q++uSPnU9FlFundvmw4BSoPh9osLo6uDYFEYA1Z+OGxANjbZfF9wrEyb3k0IYKECl7bjb+YUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947200; c=relaxed/simple;
	bh=GPZmOjICvwf8Kw2So8vnAJ/EpobCLKD10rM7NBmCOnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=abPiGV0FYLjalhemDv/b4cOU0ACpEHxOycI7jckqBK+wT7F6dT1HuTN/BJU0bkagYNy1XDZ7OCFuAmE5mnlxrDb9iv7ZIKfM/mesylUMRU8F+IB3N+fYmvfHX3GtUz/BbwR071owOUdG0Asmmx1es5QTeoiXltQcafqxBAbhABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktZ7AOQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktZ7AOQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4161F000E9;
	Wed,  5 Aug 2026 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947198;
	bh=Ggz8RIDpOEQlbNpVfUUP1RtI/r86cWtx0EOXeHkTQ5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ktZ7AOQFcXobMh+WoYcSsfY6g8AE4gmRPnLjZSxsfjRw/XIJ/Ct8++MG99VENwOxq
	 2jED/rDd+vM4ZOyJvFCO9A8/2BSrSqvSNMEt1lXXLwgxxAKIG8lNasfr6owBIzIvjt
	 j0H5+Oz4AdXQfjNDJZ4n53wvA2Nfd95BfFtVoHKanFOElZodg5wXtMwTVi/C6vzNb6
	 sNCotH+rEXgPVyexO6jURPVxrpxPTqHwThwV/G5dPgdAegbtbFtmMd2skM1ZYfHSlK
	 II1EtZkdLgHegwvM2dyP3oI0x6yZqV4lsDcKwX5xoqO8Ret4iKnqB3sh/EnzB2xZLR
	 fPRlQgjC4+kPg==
Date: Wed, 5 Aug 2026 17:26:34 +0100
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shuah@kernel.org,
	sdf@fomichev.me, dw@davidwei.uk, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: drv-net: print device info at the
 start
Message-ID: <20260805162634.GX51943@horms.kernel.org>
References: <20260803211944.2166211-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803211944.2166211-1-kuba@kernel.org>

On Mon, Aug 03, 2026 at 02:19:44PM -0700, Jakub Kicinski wrote:
> When a reviewer asks a developer to run an upstream test during code
> review, it's often ambiguous whether the test was actually run against
> a real device, or just against netdevsim. Print the driver name and
> ifname at the start of the test, e.g.:
> 
>   # Interface: enp0s13f0u1u4, driver: r8152
>   TAP version 13
>   1..1
>   ok 1 ...
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>

