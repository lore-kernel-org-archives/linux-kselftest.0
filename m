Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047016;
	b=Zh9DIbt/zveNQadQRbOhfK5rLrliI4pFCehSvIgctyvGBDhrLvHRP4Dnb2fjSGogFZH8
	 93mPrT+iJhdAbcJQ7vLtYdjpELLkSaKZAnbFaTWy0jb1nUD/Na0Cv3Zc3y+Tairs0FRT5
	 CL7dxebmOfGPMY/QnmUc8OPuRt7R1JGr/JXJKVyXMvVlQx92SeRlpeHkWHBdX5w88DTZC
	 qykvzZQEIjIj6nQRMk927HiMb+dzGp3H6s0X+2tQm+1FV6TXQ674e/Bji/SXsUlkdZcs0
	 RigK40LZnKZw3JLv2LCjBJo9Bl0gUfNIkhnGUyqPgWw9v75WETmp5tNVvKaNAOPFsmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047016;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vojM6SpzsD2iqo2mF6eR/HylVbADCFIjiFlWWetvcwU=;
	b=plsA/uv/+phNvQrBqkucQcVrTmcM9D6DoRkqFLWKSNmdj3qwJsOs/vuZ30e94Ke+9bss
	 9Wwa5LSr3hdo130d8BoPzwr4ivnNuglUG3eNEnlROoJK9JK21SiORP3WXr/nkhS5O0OGy
	 B18++DeAHcULQ9LumA16MEmNsJI15VXlLcthqchjKO5p2dzQQJSjKiAN+1KBLtrjiGIHt
	 dhjQySJaM+mGRP8jA1ZWH5oU7s5mrbVyKdl9NoVkskpeMpTubJa1b2OHxTXfmDgtinBK6
	 F3oAvtUIm4kJKqpuYRgbk04KmFPhoI7cPS7Jo2ZgptHChAP/1jpufWmFMhZ+LsCeS5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt8Sbpub;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3BE60A2633;
	Thu, 19 Nov 2026 00:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt8Sbpub
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C6D1F000C4;
	Thu, 19 Nov 2026 00:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795047016;
	bh=vojM6SpzsD2iqo2mF6eR/HylVbADCFIjiFlWWetvcwU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Xt8SbpubkqYv5FrJhsdAP5ui4BNe4Yc9rOQC3a5aod4l43DYHIbyCOh7AvH8Myza+
	 e7650jKOdeaiIXV05s4/BzYIB/hd3zsfXcz/byfkwbW5+DO7QDk5MyXDsKWCvjvEgS
	 HibqbNH+S3Yc3gYeRW+qZfbh2EG3mKLoC7hwtecnQUj6o53ef9I2qoMagRuaVy/OPB
	 Etm3ZXrH2DyesA7Dm+/oyDWzLYdX6iQQgtxiBfPsW+os0ryBGdF0+aDtXoRdJLlM9p
	 njvOGxPLo+bQTrc5yi1jOxE44xrGnk6XqSg/lz1fOZJWY5zva8XvAac7eaY+peLhkL
	 +lcffVjcIC1EQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15D03808210;
	Thu, 19 Nov 2026 00:10:15 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests: net: arp_ndisc_evict_nocarrier: propagate
 the
 last test failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179504701452.2637749.16212661545923401751.git-patchwork-notify@kernel.org>
Date: Thu, 19 Nov 2026 00:10:14 +0000
References: <20261115222351.52930-1-emmaonana18@gmail.com>
In-Reply-To: <20261115222351.52930-1-emmaonana18@gmail.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: netdev@vger.kernel.org, po-hsu.lin@canonical.com,
 linux-kselftest@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sun, 15 Nov 2026 23:23:51 +0100 you wrote:
> run_arp_evict_nocarrier_disabled_all() reports mismatches with a
> "failed" line but never sets ret, so the script exits 0 even when the
> all.arp_evict_nocarrier=0 test fails. The 2023 bulk fix wired the
> other five test functions and missed this one; the v6 twin
> (run_ndisc_evict_nocarrier_disabled_all) already sets ret=1. Set
> ret=1 on mismatch.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: arp_ndisc_evict_nocarrier: propagate the last test failure
    https://git.kernel.org/netdev/net-next/c/3873583557dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


