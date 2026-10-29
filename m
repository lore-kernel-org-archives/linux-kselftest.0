Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291416;
	b=gNaPwuRUCxEYtnujxkw49TMRxIvs14RE4ic2gFifyarcxcneVmqRzyUbQlhKK0E6QQfT
	 CPoHuPUphY5jyGg5vFIcQJ5owizVDQkGeq9mK6Mi3TI26ik+BcIL8yMCZ3I2KHGfhGCUy
	 K4Gcxc6JuxUeBfX5XKJHI6W7ojqtVGox/LklMxNsHZ7XFZaRc/2Ye7FVNJV1gMDitGOeV
	 HQhdwlyfXrgHjPWRpHubNDL4vEMef0vj6V30S4VowFht+Vq4xpOm9IkDxUIVx7RVyV5AQ
	 eDqRxsi173BRVoJuZCm03mL2yro+z1i3iPMYzk4NUV7fl8jJxFha7HGYiuY9YyjYSFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291416;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=07wAKIgBbqyUiCgKm5ItFjbWQ4Eap7GJ2/EZS88oDWU=;
	b=uKcMzYuV8THYjR7Hf9eOIg6A138uqAjsfG4/NY/l0ftb1x+a1+BrPkttzUlBdLwPUfsg
	 kF7oP6UDM+f4BHDq70WneDkcoGoUdx5nkUmyP8pUjnxQRbHiWovQYK8XM3bhUDJSjChwq
	 NfRWCeufBNdoKpPOGV7XkKD6OvH0jvzrHy2kYUW3zoJ+yxEX27EFryh2x1i6xPu1rXH7m
	 hofCDp++yqkqKRQwLD/hOuLFAvORBWVQki3PE2MSpkeVhlHkChN/gQsZQwUcBKccXFRkm
	 penaSCTzvtRvBUMomq+nsnIrK+4M7Qg3zYTJdwvB3nOmzcWM67z7T7rdN/zAZ/f4XTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHwI7sSV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850C60A3812;
	Thu, 29 Oct 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XHwI7sSV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C366E1F01825;
	Thu, 29 Oct 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793291415;
	bh=07wAKIgBbqyUiCgKm5ItFjbWQ4Eap7GJ2/EZS88oDWU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XHwI7sSVAP2ein0jgJ6wWuxpDlRMVOnurQNpmBSYr4nvdIetjLecztPtBkFCJ3Lpz
	 w6dx+MQ8F1uu9q3kj4+SKkrZzMiT+YQuSEeC1raOkrPGKV4i/P9zxrmceGcoHEiSfm
	 XD1+kicFGNAmJPcdchA1BBPEI4wVQsKyXrVS7KxHPn2N9joboIVyGV5v3hrc4xqvO9
	 amvpnj4bVZ0VBHsJKk6nH4mj1nedClFhGonUuiWmXaKzhotjTtSONUgHuHgakeuePL
	 EuN8OIwVNhunJSvkxiNfijzPqobDZH7GzZaed7H17vk2lbTPjeaxvvTwVBwT+raIl+
	 V8cWprrMJaS0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2263808223;
	Thu, 29 Oct 2026 16:30:15 +0000 (UTC)
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
Subject: Re: [PATCH net v2 0/2] netlink: fix a dump livelock with a
 notification queued
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179329141429.559085.11181386542517865793.git-patchwork-notify@kernel.org>
Date: Thu, 29 Oct 2026 16:30:14 +0000
References: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
In-Reply-To: <20261027-netlink-dump-livelock-v2-0-c4bb05352a33@gmail.com>
To: Jhonata Poma-Hansen <jhonata.poma@gmail.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kuniyu@google.com, m.szyprowski@samsung.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Oct 2026 15:04:00 +0100 you wrote:
> A netlink dump that starts while a notification is still charged to a
> socket with a small receive buffer fails with ENOBUFS, and every retry
> from recvmsg() fails the same way. A reader that peeks before reading,
> as libnl does, never consumes the message at the head of the queue and
> spins forever. I hit this with "iw dev wlan0 scan" on an arm64 board.
> 
> Patch 1 goes back to checking sk_rcvbuf before charging the dump skb,
> as before commit ae8f160e7eb2. Patch 2 adds a selftest; it fails
> without patch 1 and is skipped without the privileges to create a
> netns.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] netlink: check sk_rcvbuf before charging the dump skb
    https://git.kernel.org/netdev/net/c/b45d37740cfb
  - [net,v2,2/2] selftests: net: netlink-dumps: start a dump with a notification queued
    https://git.kernel.org/netdev/net/c/e615d0a8b201

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


