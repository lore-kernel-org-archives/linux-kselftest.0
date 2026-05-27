Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB182236EE;
	Wed, 27 May 2026 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779843607; cv=none; b=LNN52i+QiD0iQueOD4Rab/2PS8xnd94ZDmq6FLGWtK7xNSeOK3Tf0yD0r7FR6sXyiMgi9M6S9AUpV9cmoibHDDKmgtx9R8L9KC8YQtFNe0hpMw5GQ3ip+6HkH+bLno3+UeVwSWvveKgdMK9mtZjd2JkMzJHjZ4fA/IrcENVxFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779843607; c=relaxed/simple;
	bh=IajCAsdWcUTnBYLAXYluK77tsdVlBnpWioIaHyv97Eg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=OOU/gGHQMWhSuf1P80WZTZWgoEPGEg0wsWF+fS8ULNLIMNa+572YFIYD9Zinb220O6P5BXAwzN/QW/WDMEfd/AavqAYZJWhyYiS8JWWsur36qB2ouk3uSncKdiuPeACJkpqa9/3zecFESc2IpwRnf729+pBZUJ/T8wq+C9piWXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BynPil59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BynPil59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6351F000E9;
	Wed, 27 May 2026 01:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779843605;
	bh=h8vYUU9HFAKEwBE4J/VFBVxNhPKej+gx8waEeLNwq/Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=BynPil59Q0WcSgGF9+uEotIynfgLB4/MJsRtF2iiunG6iZnLFs40UA5NV5AOWLvEN
	 3Joy5bsWRQZF+cUqI9HjmfR7A4UYgDjV7DakneTvjG8Oh1lKSkuMIIKZ9KyHkjPqVb
	 ZqlEslIhPVwi1FUXghbzlENAOR0AQo8LXMkmTK3+9ZJ+WprA1aCHlRB0GFCnTw4R/P
	 N8ZQJ0pLA5Qf8Nt+h412lUNgbJ/5oTgo1XOXVHbZZ8UdQorHHNDz0J81zdTXjv28xE
	 eTnW45NALhONHsUBuvivTc67JrmP+e6hsKfhuXzSJs38iBczSO3dMxdZIGx7QRnkeX
	 qUyjJpYQIv89g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C74380CEED;
	Wed, 27 May 2026 01:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2 net-next v5] ipv6: addrconf: fix temp address
 generation
 after prefix deprecation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177984361139.4034294.5875665579147124672.git-patchwork-notify@kernel.org>
Date: Wed, 27 May 2026 01:00:11 +0000
References: <20260523103811.3790-1-fmancera@suse.de>
In-Reply-To: <20260523103811.3790-1-fmancera@suse.de>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, horms@kernel.org,
 pabeni@redhat.com, edumazet@google.com, davem@davemloft.net,
 idosch@nvidia.com, dsahern@kernel.org, steelman@post.pl

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 23 May 2026 12:38:10 +0200 you wrote:
> When a router temporarily deprecates an IPv6 prefix (either by sending a
> Router Advertisement with Preferred Lifetime = 0 or by letting the
> lifetime expire) and later restores it, the kernel permanently loses its
> ability to generate temporary privacy addresses (RFC 8981) for that
> prefix.
> 
> This happens because the address worker attempts to generate a
> replacement temporary address when the current one nears expiration. As
> the base prefix is deprecated already, the generation fails after
> marking the temporary address as already having spawned a replacement
> (ifp->regen_count++).
> 
> [...]

Here is the summary with links:
  - [1/2,net-next,v5] ipv6: addrconf: fix temp address generation after prefix deprecation
    https://git.kernel.org/netdev/net-next/c/e20d8922aa8f
  - [2/2,net-next,v5] selftests: fib_tests: add temporary IPv6 address renewal test
    https://git.kernel.org/netdev/net-next/c/2b9cceb061d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


