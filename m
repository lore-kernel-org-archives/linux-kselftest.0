Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BA3A257C;
	Thu,  8 Oct 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425411; cv=none; b=XdwLVHFj04c8LtEDpoSzUk0KWceVWxLGJiINk48jtn3pw0uWk2C9TR4XSMiF2fth/CgfSnxxQi2yx/1opU5M2s6QOUrvt7WFnzQC9KP5mfCApjCH28U0hJ16gM2ZuseXkGoXAbrGMc1cZ7eR5jIxPxH52RJ51XhLTbXUMAzjgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425411; c=relaxed/simple;
	bh=2TxOpoPq/dRNfFmeCSgrW35fWc2WmXDgSglGR4dQXzI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Bj5KaL/WkABL3p6lDpXC+sx4Cg8DZNqpEJM1c5Xg70fN2eFKjvixHEwdddyAdoJLAAJ6wIt77GxFoaYwOSoqZgkWl+zeRqY0G4s+FdICYfnYak18dJvOEdTyOjEvwF63THc8H4fQemAuU6jzaQ9ZcNKC1Q1DDwDVLlwXbT6EjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFpgn2NX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFpgn2NX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF19A1F000FF;
	Thu,  8 Oct 2026 02:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791425410;
	bh=q5B113EfHvbtY5J8cReeXBkcayx+9OSqiCMco+CVcrU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mFpgn2NXEo+Ir9qUz+pQZnDii0vMWERceISkfPNb5bjEErXTKGDMNE+9GhSlCMjhz
	 dyk1SZTvFJ8TuF+I7/gEKFdjaLb4ICgdPZfFj+l6abT+n0D7lUQBwpz+vwstdk0gk/
	 lgmLRmFXhN+Oijy7DYId4K/Iy54HWcER9HisUcHGF8rW/HJvhfeKembyhKu40mp5eG
	 lS/greoS4BiaXumrJd/+YRJZMnFq/stUiFuTyAxfkFXbkeJKjXUf9qwPdBMn+ILq6I
	 +udb5FF9AT4t24B1ZAYC7G9R0+ptLwu3jHp8bf+zeErENwIvevauD+pD4Ueaygrmdv
	 5uJG4aVi/LL4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43CD3809A09;
	Thu,  8 Oct 2026 02:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] amt: mark relay data as a UDP tunnel
 packet,
 with a selftest
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179142540927.3771647.9405925708782465037.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 02:10:09 +0000
References: <20261004161200.27196-1-omar@blockcast.net>
In-Reply-To: <20261004161200.27196-1-omar@blockcast.net>
To: Omar Ramadan <omar@blockcast.net>
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun,  4 Oct 2026 19:11:58 +0300 you wrote:
> amt_send_multicast_data() never calls udp_tunnel_handle_offloads(),
> unlike other UDP tunnels. With tx checksum offload on the amt device (off
> by default), a UDP_SEGMENT burst through the relay is dropped before
> patch 1 and delivered after it. Patch 2 adds the selftest.
> 
> This follows Eric Dumazet's suggestion on my withdrawn [PATCH net] "amt:
> do not offer software GSO on the amt device":
> https://lore.kernel.org/all/20260928181554.85766-1-omar@blockcast.net/
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] amt: mark relay data as a UDP tunnel packet before sending it
    https://git.kernel.org/netdev/net-next/c/47bb8dfbe1d2
  - [net-next,v3,2/2] selftests: net: add an amt test for UDP_SEGMENT through the relay
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


