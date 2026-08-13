Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF3E44BC94;
	Thu, 13 Aug 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618339; cv=none; b=goPM6tkK5Tf2IwuCSv9w1pTUBzRKeWcKdP4ufyDvHGl5Da9Y7JQknclmm/X68hU/JdsiqynA/zSZe2seFK1E45eMvIqOuDoRNdRZUTXCHOBZitzchg05rqqE0VUQQPDaRlcjk3rtpf0CftZPnqxAM+ZmkPTotx/lR+w7b/YBs7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618339; c=relaxed/simple;
	bh=UttZ6Wp6KMqrgbN7B6sX94VC3HGnq8cn0nShACQtaKU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AYtqCHuo3sqJA+Als0UCn9CuDX7KSQJ7vEyyldMJBP+NEmRobvbAqxSd92cd9gXHwZ4ePwHorU5AYCW5unmAM2h4bB4w6YprQjT2DEjzpouVTB84AV3EiWtTP97hovki+JWaBGsjy7xoUnTWoYsWTfutd1lKN/KeIw6AEb4pNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3Y2c3v1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3Y2c3v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DBF1F00A3F;
	Thu, 13 Aug 2026 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618325;
	bh=E7ayrAOBXrbuMrR0LlHDpdW7AmE97Wlqq22AcpmieIo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n3Y2c3v1OevdKDTTnew4iDDdS7n/HN9TwaGGwWQgWHmBfekiPTvMmJMkxHz2IyYUu
	 NC+FMT8T68EjdU9Xw1D6NxBB/y4voza7PewOMHhjNnYUS6Wl9UKPiMNwfuVYANdm77
	 e9f8KisoMm4pfy/oxQiXa4Mg4sG4+2147GfCFtIYdvBQn4FHJnZj92G97TP6VLkW04
	 6KCFWEE5ZO7/7peE2FxqGtpPIUqJyXqy2yz6bS0sS+4bCM4qngbmOFBoSaW487aN7g
	 Ks/v3zOTXWmmN2SRfOvrzcGyDFXqqcoVbYqMGXUMZJ6y9Q6Z1LfmZ/XRs7WCNSudXu
	 W/rSoaD3+wShw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B7B380CFD6;
	Thu, 13 Aug 2026 10:51:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 00/10] ipv6: report why a route was deleted in
 RTM_DELROUTE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178661827995.2370447.9301462762512450819.git-patchwork-notify@kernel.org>
Date: Thu, 13 Aug 2026 10:51:19 +0000
References: <20260808005642.26901-1-sigefriedhyy@gmail.com>
In-Reply-To: <20260808005642.26901-1-sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: davem@davemloft.net, carges@cloudflare.com, daniel.zahka@gmail.com,
 dsahern@kernel.org, dw@davidwei.uk, dimitri.daskalakis1@gmail.com,
 donald.hunter@gmail.com, edumazet@google.com, idosch@nvidia.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, horms@kernel.org,
 sdf@fomichev.me, willemb@google.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Sat,  8 Aug 2026 09:56:32 +0900 you wrote:
> When the kernel deletes an IPv6 route on its own, the RTM_DELROUTE
> notification does not say why. User space cannot tell a route that
> expired from one the router explicitly withdrew, yet the two call for
> different reactions: an expired RA route means the router failed to
> refresh it in time, which points at a misconfigured or unreliable
> router and may warrant action such as disabling IPv6 on that network,
> while a zero-lifetime withdrawal is normal, RFC-compliant operation.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,01/10] ipv6: add ip6_del_rt_reason()
    https://git.kernel.org/netdev/net-next/c/cc17e386f8a5
  - [net-next,v6,02/10] ipv6: propagate the route deletion reason to fib6_del_route()
    https://git.kernel.org/netdev/net-next/c/352c6732ffb2
  - [net-next,v6,03/10] ipv6: record the reason for kernel-initiated route deletions
    https://git.kernel.org/netdev/net-next/c/e8636445b771
  - [net-next,v6,04/10] ipv6: add a deletion reason argument to rt6_fill_node()
    https://git.kernel.org/netdev/net-next/c/b0215102356b
  - [net-next,v6,05/10] ipv6: expose the route deletion reason in RTM_DELROUTE
    https://git.kernel.org/netdev/net-next/c/1e6a83af5914
  - [net-next,v6,06/10] ipv6: add inet6_rt_del_notify()
    https://git.kernel.org/netdev/net-next/c/09f19ce3de67
  - [net-next,v6,07/10] netlink: specs: rt-route: add route notifications
    https://git.kernel.org/netdev/net-next/c/bf517422fb26
  - [net-next,v6,08/10] netlink: specs: rt-route: split out the request attribute list
    https://git.kernel.org/netdev/net-next/c/8621a7ed80f0
  - [net-next,v6,09/10] netlink: specs: rt-route: add the route deletion reason
    https://git.kernel.org/netdev/net-next/c/b13ba4e82bfd
  - [net-next,v6,10/10] selftests: net: verify RTA_DEL_REASON on route deletion
    https://git.kernel.org/netdev/net-next/c/046d88326506

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


