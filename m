Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883213;
	b=G9Fv5JlYLifh9gIdc5zh0ByGIafe9gQO6qgOTh4fzFcTB3MgTOIok8BxEBoV+/CBUTiV
	 3Sutw3dItlu3+wcTiBMxjZipgOMWmo9ED33VqfsSvj9l6j2UcgHtrhaFoz075VL18gr8N
	 YSiKqonIcKNdaffrMLMwgMlK0Cs8KmjE9udm3s4ETR0OY68oHs/Ds08G2T9j17FGZS7f8
	 cv5FgrNHRAn/QoKS/4/2ZSjRKjFC2QPiESaJJ7FFh1a5tZo71R31K0hITin3c5EijmgIa
	 EdMbWggsariHSHQkqnurlB3lw0SYxGK78BgX+mb1mDZWWVzpQhjbnHf583czPcPPsdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883213;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=uMDC7/OC8ydI3mOlf+Y3SfIGQK6a/1j8/gzYXplxhgs=;
	b=QNFnugchZR6ovhZiNaoha+n5CrZtyb9CyzRp+6xji9m42Md6cLTSYlnOs2ikAdSnhnJX
	 rlhUzD8tnvnno1UPw03KdtOAU4EBfHiund1ZCHTpXeqMspIocGpVwvPLZITdDhlOMw3B2
	 jF/QgGTqzTpZiI8LA8aUeL14LXgRf0+YwKWEmOfzJTad/VYTow23GhpyCdJvLqB5ydYm6
	 zZcxUGnJK73TmBDwVzI91YdyWO+XKJjhvAI0IvF0GMNkcteguvuE1+/e7JOKNdWMFFWn/
	 KFBemovxHIF4kVbNnGvp0wjjHwBT+nD9QErnvZEwsUHp/dHXhuZoBecWNtz63pk/Ktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgIzE0HE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E1606A88C;
	Tue, 17 Nov 2026 02:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgIzE0HE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB091F000CB;
	Tue, 17 Nov 2026 02:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794883212;
	bh=uMDC7/OC8ydI3mOlf+Y3SfIGQK6a/1j8/gzYXplxhgs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bgIzE0HEyX1CA7eCk//tLbtIdCWFIH55YSGAc60TGbIXDOzssdncyn48wcxqxpPA7
	 hI3cRznfdv2LRPnnuOUwWnd/OMWQt3/eMn0gY9w6ixT67fMm8BwvP0sdWu9IQ7DLHu
	 Qfhn55fRioI6FZ037Y/qUB8jaSe6T/kYPrncUQQ5Spy3NIWu+WRBywR5KPLCeWbXIv
	 U9KdFxA9Imsii4Aw9y0ut6duzD/u8fRUAi23XvMtphkeqjUwxSbujJzBCr7OGBjrWo
	 KhGAXSoWSLdYH19k96dOaqFxpXOqaUWY2e7Xnudm+aLAKtUe4RQN6r8mCTwhqVzPdc
	 yGcMj3M/cLwgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44F0391B088;
	Tue, 17 Nov 2026 02:40:12 +0000 (UTC)
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
Subject: Re: [PATCH net v3] selftests: drv-net: pause: Avoid cleanup failures
 for
 unsupported link settings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179488321128.300516.7631313582958846881.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 02:40:11 +0000
References: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
In-Reply-To: <20261113022717.1914724-1-mohsin.bashr@gmail.com>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 maxime.chevallier@bootlin.com, linux-kselftest@vger.kernel.org,
 hmohsin@meta.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Nov 2026 18:27:17 -0800 you wrote:
> From: Mohsin Bashir <hmohsin@meta.com>
> 
> pause_setup() saves the initial link settings before tests run. Devices
> that report link settings but do not support changing them can reject even
> a no-op restore with EOPNOTSUPP. That turns pause tests that use
> pause_setup() into cleanup failures.
> 
> [...]

Here is the summary with links:
  - [net,v3] selftests: drv-net: pause: Avoid cleanup failures for unsupported link settings
    https://git.kernel.org/netdev/net-next/c/4492b608bb75

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


