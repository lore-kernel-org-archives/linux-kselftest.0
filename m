Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355218;
	b=tmSZ8A2ctHj6bpv621PyazPP0vFzXpFAjPSdPu9n2wncO5ajqvdQUciArUleuY+OTboX
	 W1oRBIGW8IiC+a85SJuW4uFrNVpwkbZA9XIbswZxLn6MLurZOWYU8l9omcT4pNU46EEIY
	 6XbLH8Pe1Z/X1xnRgRC1Ykn2pshxdTdPhpMHLxt+moHWDGS0oJ1Zjc3RrPcEca1v06Rds
	 5R8oOTPVXcd+fTMuIjkp9xEnM0W+O7ceQxCRGMg8s/fgOQnJpYyonJlb+ZQSumsvt99hv
	 BE86tFX5cUK+KinVLE6XMoK7SF8tIjD6PK4B6U2t0xQ3osptKQm7YEEsc5B/G9J2XvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355218;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=XXJOmUh6ZA2cxo0uMHH/7j9X480fJihmgHUTZSH0Lv4=;
	b=iPT4zYaLE99GIj7vMmGwgWxVdyQX7Mk0nfDByMNWoIGWS2SEIJKhmiudq7Ab2RFElp/J
	 /wMjuzFmJedV0KVdmhFZs5w6T521F/BfmR0IbRCPm/t5MfPeNnaKmGXElwChdmKJUq0xY
	 IrzrRk+U7YrZNSdZU/vZ6SOIxVc33u3wgJd2Nf8Sr0PQYVg9wBRfE+wB3MElmKEmzKb6h
	 Ela2i/V10hyb08AMUSdvetjcsh6h6J4nxPnyUNyuvkUCLwj0UHf8/RDVPmzcXbk7hGmAM
	 UpVC3Lktt0z2ZkW0LugBU81UxrWEwBs3JauEyvsVcZFieAG0ABrGl2la2ceXL213eWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6iWrDtb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376B60A2604;
	Wed, 11 Nov 2026 00:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6iWrDtb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7F21F0089F;
	Wed, 11 Nov 2026 00:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794355218;
	bh=XXJOmUh6ZA2cxo0uMHH/7j9X480fJihmgHUTZSH0Lv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b6iWrDtblbR/FyqTPmhsV3XQ0zme5icdDs7lcjaw7oPLl2XXmLeM5l3FxjDxPCW27
	 aWoSDtcHo3OIfgCuEGIPDp6eltPs6/1Fd49XtFxy28fdcGgw1arKHD4uepr+j7mDqw
	 5k3TmjN4VMgAUBWrI5C/CxAqQNNN7bAUPMd77ftBm1+hcKnCRAuzfmETiQC3edQIUG
	 +dyOpHg/rUjDtWXr3b9C7SKW9JOD5EcT5bZZDL666fz0j7iB9fKwMXYsq9sh/1XFp0
	 q/7kFnZU4ocnzxKEOJzim0zTjR9xqxbWuqNT4je9pbF9x2DzSKVWtLJlBHtH7yb4nc
	 H8WgT+oncEeqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2112939E8A4C;
	Wed, 11 Nov 2026 00:00:18 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/3] selftests: drv-net: hds: fix state leaks and
 ioctl tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179435521666.125436.2802528717977617642.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 00:00:16 +0000
References: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  5 Nov 2026 19:12:05 -0800 you wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> Fix hds.py leaving tcp-data-split in a non-default state on drivers
> that report HDS state rather than config, and fix the ioctl XDP tests.
> 
> Dimitri Daskalakis (3):
>   selftests: drv-net: hds: always restore tcp-data-split to auto
>   selftests: drv-net: hds: perturb settings via ioctl in
>     ioctl_enabled_set_xdp
>   selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] selftests: drv-net: hds: always restore tcp-data-split to auto
    https://git.kernel.org/netdev/net-next/c/c1e042cb4de2
  - [net-next,2/3] selftests: drv-net: hds: perturb settings via ioctl in ioctl_enabled_set_xdp
    https://git.kernel.org/netdev/net-next/c/2839e04a9f76
  - [net-next,3/3] selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp
    https://git.kernel.org/netdev/net-next/c/f4085a199ebd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


