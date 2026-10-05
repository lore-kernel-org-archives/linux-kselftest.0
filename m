Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87D417BD9;
	Mon,  5 Oct 2026 23:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241810; cv=none; b=r6kKUtxbR2wrFuYkjQW8x7bpBCpAQ7o8swmrcELx8bB5Vz9+/duJLRh/aZ7pLShXmSDVR1SFn98hbf+KIyhz30UPPGOQqfzcG4PvJdkBN+31PIEEXEvEtN+7qTz7ybF8uUfGSXQhPhyXV8CzwpmcG46i9eZTw6lAXnt8xApc7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241810; c=relaxed/simple;
	bh=pFVq7EyUWiAO2x9UCfbCOL+Tvyu7St4sCWxEG6aWj1U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=bSuOpRvNDEi3gbEL1MFNOP1aHVRdX3qtscj/phxuJ8xh/XXXkiP5m2JPwEvKeWA9Dihs4YoaS2CCbdJPgaotnYV3wAz6214HgUpLKply1BgdsBOlQXNhmXuL5vzcLxf1jE9WBPe9V11LOhQJq0tEWmqeNs7vu34aXZXH665qd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+uNdNmQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+uNdNmQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD241F000FF;
	Mon,  5 Oct 2026 23:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791241809;
	bh=mko6wnpcut6renAqsMWAKfh65elAm2cIdKuh57kIYtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=R+uNdNmQLltggaHHcnAoPak34Fa30ICjS42sYW2wdD9Rm6VGIwL+7yBuyMXuEHAE1
	 4LpxBlgc/cY7OUYAWyRvE+Lko8IeuKwEEwTm9HAhMr7zY1qWKMBm7rZBUVKAmSm4b7
	 XR4jPnZd64m67DMstxUDfcJJasAPNADftPYEGE683zwhBylRY0hUDTfDwpxI0U1eyC
	 O9SgqIsuccf0kx3R2RPWasnGz9Oj+vlsZdThhdLX8ko7RuI4FbJf+IkEcAzz70aO28
	 /vCplD7UBFfIbhLxkRcRgH9aVD9NzeBFQb7+QE0goz6EDorOt/pMNMJX345WSeCVDi
	 WJn4h11pvEVUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15F83926677;
	Mon,  5 Oct 2026 23:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] net: psp: require an established
 connection for association setup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179124180778.1932101.4292835619556166599.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 23:10:07 +0000
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
In-Reply-To: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 willemdebruijn.kernel@gmail.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, kuniyu@google.com,
 willemb@google.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 30 Sep 2026 16:46:45 -0700 you wrote:
> This series removes support for using PSP's assoc uapi on TCP sockets
> not in established state.
> 
> The PSP uapi and connection upgrade described in psp.rst is only fleshed
> out for established TCP connections. Installing PSP assoc state on a
> listen socket, or closed socket ahead of connect() is possible, but not
> something that results in useful outcomes.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] selftests: drv-net: psp: swap closed for connected sockets in assoc tests
    https://git.kernel.org/netdev/net-next/c/e404a2de7ed1
  - [net-next,v2,2/4] net: psp: require an established connection for association setup
    https://git.kernel.org/netdev/net-next/c/86a19284425f
  - [net-next,v2,3/4] net: psp: drop psp assoc clear in sk_clone()
    https://git.kernel.org/netdev/net-next/c/c135ee9f4975
  - [net-next,v2,4/4] selftests: drv-net: psp: test that rx-assoc fails on closed and listen socks
    https://git.kernel.org/netdev/net-next/c/ab1f1ed8e0bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


