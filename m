Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792530607;
	b=N7oyd4zS7oVXsOILvuZY0XnXuJgexHaFn7XTsJJo9Ts6063W+ZUQz68tEQWdofy3d+U6
	 vq9BsKIWR7nwH/ENSipMcgQ1eKRKd5TcrpPNONEDd6yB9izMURM2ApUM8L4gvYpoBZ18h
	 /T1pA2tkTDmzQ+KU9r0+k6pFj9bm8go3Xr8QEZMeTmruJLH5MOEcr2o0sK0Vp9ctcfSvb
	 HOSU2Y0Wuxl86mkwhS18ePQfvac6X0toChzr7QLO/PD+HHr57F+H4Lh1GyHt2vPakkRsX
	 gsdLT+i0vMXOD8J2gt3PfhNjIs3RYZuFdzZ2Qfkdr9aWFyp7GwDUjGcQ9g3kYW95D9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792530607;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=xyhU+RcBN6abvGsTR9hOovYChU7dEGpa3e++mODmPKU=;
	b=QN0qXxeHZH97lSnbsawD2KSHcmApKUu9mdkY5W9QXVaIwJ/l5BZNivWkl4aJWuHYl5uJ
	 VOJyYXks4/gIl/v8zFtOUdqXJje5aL7NZGNBuT8/CKq+kOGuZ5L8m4mME6K8roqXKcnch
	 Wyv6w5LdZ0ZutgPrkUrWiJuwZv0xNNrqNyMhUa4D8081AHxpe3LiirKrHDvHAIYSDHwdQ
	 gEMVn2MagVFOuzyDs/eqrr2k/7+biJ7oxezxkDElya4+Lu63RHPjhXrSlgRrQ1YAY0e1l
	 sB3eUCS7prMDUElx8tR3zoK0vBdkgoSkBxy9bCEFBTDF0mj/ZvCtf2a1nAvYb78WOXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ejd3/Prd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2A9606A319;
	Tue, 20 Oct 2026 21:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejd3/Prd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803F51F000C9;
	Tue, 20 Oct 2026 21:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792530606;
	bh=xyhU+RcBN6abvGsTR9hOovYChU7dEGpa3e++mODmPKU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ejd3/PrdsDgTHp21UOwXC9V5yFEnFKmzKxtHrIowsjGel4Ad5g+lh5rJPum3/UacN
	 qespTzSvLva5JHPrTMHOUp2/mZ5I82yIDrVJk/dJ5BY8jRDtSxZuR7ZaGykGwpX4/N
	 qoWmOBscoxHefwIT8tWkP7xTjB3OH6Z6xTDA9AptsUBLdyPR9q+KUNF63kHD40p/+i
	 S5/2dZBVY4+xS217+RuX7ezXWavx8vhEq68SXWkaaxxxulAn+ymnJqk5jXcwVDH7oZ
	 sARGaqsLKZh0tv62LdvFCV+qSRVVvRYRRXxPJbvbCy9U/LX9XP17NsqB50CJ8WbScR
	 q/sLbieMmiphQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7738B3809A09;
	Tue, 20 Oct 2026 21:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next v2] selftests: net: exit with test failure status
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179253060528.212662.11291349112488212407.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 21:10:05 +0000
References: <20261019-self_ret-v2-1-43d1d11bc9a3@kylinos.cn>
In-Reply-To: <20261019-self_ret-v2-1-43d1d11bc9a3@kylinos.cn>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 19 Oct 2026 08:41:03 +0800 you wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> The changed four tests can print [FAIL] subtests while still exiting with
> status 0. Their log_test(), aka log_test_expected() in lib.sh, helpers
> record a failure in ret, but the scripts never propagate ret to the exit
> code, so a kselftest runner treats the run as a pass.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: exit with test failure status
    https://git.kernel.org/netdev/net-next/c/17271848c9a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


