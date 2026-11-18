Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966017;
	b=zP2atC6OJLo7+giGXtnpt6cMxJUkbC3L6N2jnIU+1rUAEbF3FnQ3EOEjkc3RmPpmy0eZ
	 TJT6XOA3GEAXN6gCOcgDqAyIyTsnl5KDzBglRwV8Zxkgpiu616EvqrYb36whu+NYmUPbp
	 42BIcEfJI1vyBmElhzagFd9mJXRpe6wE4a/mjGwDJMaUZ6sumexBut5zYPUTq7KBjuNdm
	 Ly/kZvuL1xBnBSx/4pEKSBj5/MG7pqpVYloWwg0ISHFdHjrl2gxAlE/y+FVxicU9sYAT4
	 Rpx39sK066KMeEOlgQbnYK4bnES6waHHEiUv4t3Mtgj/msIRJRK9oUnFMhSuN77dxug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966017;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=MqNjvZkc90fUJdbV54A3QLQQlxoRMCgbGM/R+fXUbQk=;
	b=MJr7k+oZyhytOFbkndcrju6P45U17MJM16ABQnSedHAZ49bv8s3wyBnHMwCDChlxO5fu
	 EOoZr9Cq3+gZL59kTjxczcNiQqBlNXbDIlVXJTxfgY6mFJV9kjL0glM0oqLB+/0cPG8U3
	 LzpDc2r4rSyaCTb1wOhw4W6+hk7XA93t8vyIm4XkGicRQ1m6wP4EwmczMFSVF4QgLymNx
	 bg2TTuMqrDrV8I0etFde19ogGMiK+FqhN5vweZY4xd71PxmbXQ8Qqxx1XhyZSiksRl5fr
	 R8mAH1KORXqzXoZ9rJ0JMhHqYlvsD0drZbDcPpZFD64PK2H3s8xjFcZYDXeAeDW+WdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oqphPv/j";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210CE606A338;
	Wed, 18 Nov 2026 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqphPv/j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09731F000C4;
	Wed, 18 Nov 2026 01:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794966016;
	bh=MqNjvZkc90fUJdbV54A3QLQQlxoRMCgbGM/R+fXUbQk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oqphPv/jR/MBPIxXeCcg9XAjxgrs+Sn8rfljejVnscD8Wk3qZvVDkwUnyiCrA3DaC
	 SecveP6O38IT086m8R1onOY0Qcl1wuch78PiNFah6us1fq8yLxGXwKq0kd7j32jmLa
	 b/lG1Xht3M5jIigTJOxw0F8aX9rwujlwG3MJ0tCT+TrwMfwtgGpT/p9Y/yJ19GNe5t
	 e+EpoDPzrekAJP/cVtMengysUNV1OknhRupu40Ep0VGaTWRiyvkV28RkOgIwJLEREG
	 uk0i9/mg0q032akxUR3Qtg6I/uQ1grASeCnJBoPmzhSimI5A/S9IfAb6HoRwllly7m
	 kaosZVK53DO+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44CD392B1FE;
	Wed, 18 Nov 2026 01:40:16 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests: drv-net: psp: skip unsupported versions in
 netkit data test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179496601527.1396957.14502645778705533962.git-patchwork-notify@kernel.org>
Date: Wed, 18 Nov 2026 01:40:15 +0000
References: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
In-Reply-To: <20261115-main-v1-1-7011cd84e54a@xsightlabs.com>
To: Alexey Skidanov <alexeys@xsightlabs.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, weiwan@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, guyt@xsightlabs.com, liory@xsightlabs.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 15:03:29 +0200 you wrote:
> From: Alexey Skidanov <alexeys@xsightlabs.com>
> 
> data_basic_send_netkit_psp_assoc() runs for PSP versions 0-3. The
> non-netkit data path already skips versions the device does not
> advertise in psp-versions-cap. The netkit path does not, so those
> cases fail instead of skipping.
> 
> [...]

Here is the summary with links:
  - [net] selftests: drv-net: psp: skip unsupported versions in netkit data test
    https://git.kernel.org/netdev/net-next/c/d3826f58a1ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


