Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141813;
	b=GauDn7vC2Lpkyc8zSK6rqcGvUxchdXyg2LbZTwa4w/pnSXjbuMdG5yTI5w18sKYJTEnV
	 I/Cftj3HJ9iYl8SrhVnWcwXXBHIl55Tun7UcNts4R2l8xa7CWk0kDvt5ASMT9t5UOFgAb
	 irI5rDECl8p8SvSHkD3zCGGsYQ7geruR77XbdizMgcnahJyWegyc22E2LP5oglpSpPayl
	 t83jrbKhjHt8MdbBsfv5GgPQh60haV5S4oV2/HUaFWMUfWxFs5NKHwQuP8BtUdmWhblmW
	 aQ/sC5avVJXs86iWZ5eD62yT/lpx4iPOL8sSrLd1UiAS2PKp8adendT9NO1tvR8TvRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141813;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=N3KOOkNLjVYOlOvrbb1hRyfPdTQMh0NGXyqRX6BOT0U=;
	b=e0GFQRdu5GnfknOQn5WCEnGEj3xFLYnDnjK7+fCyhn6FnSsatN9t6X/7Xc6C8yoctXs7
	 ls9bX7lESBJRJ91aaHeE7zGWRcP91muv7KKQuY0ob1aaK0VlKQdtFbzW4i+Gn+QNoFDJ3
	 RnapVGDupTxGUPTF0CfLiLNA+wO0q2dAAMjB/CjHKjLFXTsEY95Zheo4GafbfQNOQB+xa
	 39PXIVJbj0kDQsCEZ27bOAJmqRREqHq2NxaqK6o+HdyAfISj0QYEKSR+3DWKmcWVP9cjH
	 /u0T2FU/9x2+HWwJBqv7LsDHpRFG+7jA3t4ZdDHNzGwCDXtoq34Zw/csXdDO1bCwMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgDyLi29;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D1E606A33C;
	Fri, 20 Nov 2026 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DgDyLi29
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AF41F000D2;
	Fri, 20 Nov 2026 02:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795141813;
	bh=N3KOOkNLjVYOlOvrbb1hRyfPdTQMh0NGXyqRX6BOT0U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DgDyLi29rTOArflUCEHDngsUuw+Z7F3aHUwKDMYh7svpzCaNEkYtb+GCLY8D2uPND
	 0tzDaM1BbQJoeeH639LeBTZjVhHgfOmWnLLGaLfT6NKGktFZYXorBnq6cy4wUo3xkq
	 /ZvmqNAR9ymYmCrcJfz9OfRsp/Z7DxiL9vxSQx6QJLxDuZYt8nns1qIjVguNhZTaxz
	 ZjIK9WkpSp56CgJ4NV12vFYXPxdWO8CSE3OA4Ym9wLvRPY7uBxuHAoJsMKvcr28Iua
	 9cIkOyKDByt9GcROrOSrIAvNniRiqKOUuPXS9HBv3/ivctf+ezBe3JIYQXFs2vfbFJ
	 OMTKF8DqGROMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16AE3808209;
	Fri, 20 Nov 2026 02:30:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next v5 0/4] ipv4: restrict on-link fallback to lookup
 misses
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179514181152.3985754.6093417150310548869.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 02:30:11 +0000
References: <20261116202741.13106-1-liamsmith827@grapheneos.org>
In-Reply-To: <20261116202741.13106-1-liamsmith827@grapheneos.org>
To: liamsmith827 <liamsmith827@grapheneos.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Nov 2026 20:27:37 +0000 you wrote:
> From: Liam Smith <liamsmith827@proton.me>
> 
> When an output interface is specified (e.g., using SO_BINDTODEVICE,
> IP_UNICAST_IF or IP_PKTINFO) and the FIB lookup fails, the IPv4 output
> path ignores the error and constructs an on-link route via the
> specified interface. According to the comment above the code, the
> intent was to allow sending packets via an interface that does not have
> any routes.
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/4] ipv4: add FIB_LOOKUP_REPORT_MISS
    https://git.kernel.org/netdev/net-next/c/ebcfb8e24044
  - [net-next,v5,2/4] ipv4: restrict on-link fallback to lookup misses
    https://git.kernel.org/netdev/net-next/c/67de0b38f68a
  - [net-next,v5,3/4] selftests: net: test restricted on-link fallback
    https://git.kernel.org/netdev/net-next/c/854ec14f9360
  - [net-next,v5,4/4] ipv4: replace obsolete routing comment
    https://git.kernel.org/netdev/net-next/c/8acc01b5b851

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


