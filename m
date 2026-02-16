Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318EF30C613;
	Mon, 16 Feb 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771243905; cv=none; b=f4X+HDeCWHJGULlrQpEyiPE6V4n5UKLFdpoE9KAuMCTcJ0SvAV2UY1XnVoJ79BAbz+9TxT5TMPak4c9gFp4lEC9MDlou6RMwWVtJFhgj8oTgbfuopBoZoworBbqyncQX96gE/huLpgxVWNBKX0A03ilrjTa80nBQaFmxTNQduzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771243905; c=relaxed/simple;
	bh=VrzPRqY2WAT6Xt7UjSu8aww5moulArYPq1BlYuYkS9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLnslJlBL7EHXyU8Ei9BphqYntL2bYf6U9WqWn/GO8+4hiDv/LTTGbmglF6jW9yNavUExNbeYCcvPEbLIZoGuNPQLdP/XRWNjy4nCku9JXgDxJ/KJsiOb25I0M5NQuCsiz7wGwnXiS144lrTNWDsLJL+UjALb4mbyRuj9rM+ihY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOFLYMeq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOFLYMeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2AAC19423;
	Mon, 16 Feb 2026 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771243904;
	bh=VrzPRqY2WAT6Xt7UjSu8aww5moulArYPq1BlYuYkS9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOFLYMeqWPd4M5tToXP5cuD0dGmL+Rlcvcl/DjcdlTeUQJ4RGOzXNur28NDZSe9TK
	 iDrPinK0s0tEoJ0hAJe3be+PUchsT5De8xjEzgRXa2EUREtNSKTYvFdx6UZCVEKix4
	 YXaL2wZEyjE2Sb+jneFANXDWbkG8wNpJwqS9PXVhm7/Qv9PIcRYhXiguX9bT9wGw9P
	 Gbs7b2fmfolVQHrRRvt2Ndg8X2EqwtRmVDZJka5zJp9GKLI4D4sX/G5uZp3JwbRAoP
	 IxdNxDMcZIUZinDYhS0yYgSteSa2MNj0qP7GX5pMPu5/TB7s3OQ2g6LdXVMJxt4YvL
	 +4NknfF+DL6Xg==
Date: Mon, 16 Feb 2026 12:11:40 +0000
From: Simon Horman <horms@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, shuah@kernel.org,
	marcelo.leitner@gmail.com, jhs@mojatatu.com, dcaratti@redhat.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: tc_actions: don't dump 2MB of \0 to stdout
Message-ID: <aZMJfBldbj20FrUx@horms.kernel.org>
References: <20260214035159.2119699-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214035159.2119699-1-kuba@kernel.org>

On Fri, Feb 13, 2026 at 07:51:59PM -0800, Jakub Kicinski wrote:
> Since we started running selftests in NIPA we have been seeing
> tc_actions.sh generate a soft lockup warning on ~20% of the runs.
> On the pre-netdev foundation setup it was actually a missed irq
> splat from the console. Now it's either that or a lockup.
> 
> I initially suspected a socket locking issue since the test
> is exercising local loopback with act_mirred.
> After hours of staring at this I noticed in strace that ncat

Ouch!

> when -o $file is specified _both_ saves the output to the file
> and still prints it to stdout. Because the file being sent
> is constructed with:
> 
>   dd conv=sparse status=none if=/dev/zero bs=1M count=2 of=$mirred
>                                 ^^^^^^^^^
> 
> the data printed is all \0. Most terminals don't display nul
> characters (and neither does vng output capture save them).
> But QEMU's serial console still has to poke them thru which
> is very slow and causes the lockup (if the file is >600kB).
> 
> Replace the '-o $file' with '> $file'. This speeds the test up
> from 2m20s to 18s on debug kernels, and prevents the warnings.
> 
> Fixes: ca22da2fbd69 ("act_mirred: use the backlog for nested calls to mirred ingress")
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

I exercise this by running ncat locally on Fedora 43.

$ ncat --version
Ncat: Version 7.92 ( https://nmap.org/ncat )

And confirmed the behaviour you describe.

Reviewed-by: Simon Horman <horms@kernel.org>
