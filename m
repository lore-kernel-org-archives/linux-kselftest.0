Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446414;
	b=MQagOJxh6yusbXIqkoq0fgrQ4Q7/U4r+6U323cQb1jjs1MHOdb+N6F6Kf7uVYPc0SLjX
	 X2HROaCf6OshleIhxHytpz/82cB5ZIgqfMD9gUqkVfUXrasKrNT7hXPkNaek6e0QHwedh
	 BqeCGYd6e+4L/b2SL7f71xTVde3V2K9RW9EkwfASV8BFtKO4Z0Epn004SQgVatQ54xr2a
	 hZnZ4J5CYOoZeCKi9I/iq5akTw5B5uNPeI2MOM1llwiImKMy7Oucj8FCahq5JR+ht6Lyf
	 qOt61Y9k79Hdt/OGZP2NSO4Ruw/QIi/xaUuR/JRrn7mlGpGwWW/zCmt9Nvk6LmFBo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446414;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Iobh3xWHPn+as53P6K1Y/EZ7b+XMxxSrpWe0pusEJDU=;
	b=YgwamqgCscdR3vC9qfUFUCcTyTuJshOz/kvAPJjBJ8WBJnZK0bHMO4XnGm+kZbdtn3Ef
	 MfC3h3TZ41Od7b6Movj4Pb3rsdx/ANHPzO3k9EPCDA1iE3k9R6zlKnRyd/sdcSKZm8EOP
	 Of3yRDKiEweA6uNe79FEPTflzuWm92Sx42uHTcuZ4nKYu42qX+d7uMBuwMqh4CdSQqIRk
	 tNLqejMSC0M/MGUGfj5TY+dPlzuwnKEDJbMFQ1M1O4pqZl3RfjlvlQYomz+M1AFx5GQCm
	 9Efg0aeYYKMeFJWXxl4w/6tCGwtreCpZT3pT3wgYZgiAThaszF5ocVZDt4sq96FscLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NNLGUzeW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83353606A31C;
	Thu, 12 Nov 2026 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NNLGUzeW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFDE1F00A06;
	Thu, 12 Nov 2026 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794446414;
	bh=Iobh3xWHPn+as53P6K1Y/EZ7b+XMxxSrpWe0pusEJDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NNLGUzeWQG7S5wYJEF4yjIDrlL2qYEpFANz2LF8pYu38ZVK0xbheM5pO6srXF7gIG
	 qb9Iu4+kDcd4LXeUULPOboziYtsj0CWvIzrIpYtE/sxXQOf3o4+wNPtRqTK3W6wnMZ
	 eBediLONzTVKaUV/yFl8mYHqPghPfarcV3uCrGlnB5HpAx+hHjwPn5TV/L1fSba2MK
	 wHsFdGmfBXGw2IBystoZFnhBhUCScC4LsSCMA18HPJ5/r1mHMGhgQvkhAVdF/evCSv
	 Oa6OmmNCtpksu1aqe3yyhYcTIHlr5vBmFQ4HPzwrILxo0vbeFQsBTvSOQlJc0p+Fpc
	 MvPOhmqzGy+rw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2110F391AFCF;
	Thu, 12 Nov 2026 01:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: netconsole: enable the targets created by
 the torture test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179444641263.1749627.4049461422707916016.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 01:20:12 +0000
References: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
In-Reply-To: <20261110-netcons_selftest_fix-v1-1-86643b837216@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: gustavold@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 04:32:25 -0800 you wrote:
> create_and_delete_random_target() is meant to create, enable and remove
> targets while messages are sent, but it only creates and removes them.
> The helper it calls, _create_dynamic_target(), stopped enabling the
> target when the bonding test moved that step into
> create_dynamic_target().
> 
> Enable the targets again, so they come up while messages flow and are
> disabled before being removed. Like toggle_netcons_target(), ignore a
> failed enable, which would otherwise end the function and leave the
> targets behind. With a console per target, this also registers and
> unregisters their consoles under load.
> 
> [...]

Here is the summary with links:
  - [net] selftests: netconsole: enable the targets created by the torture test
    https://git.kernel.org/netdev/net-next/c/d6548dd20bfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


