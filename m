Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269BA386575;
	Thu,  6 Aug 2026 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785979261; cv=none; b=ptrvaOxV/a2tNlUBXOcAM34Eva27WuyFZ/u+miRF6r6tFWiy5l+bnDukohP28QM4k1FT/ej/sDa7ucv4CUXo/Sz4iiZKB+CZrGBnKwQKPP5GAFhXS7BbneerBW/3djM99Gv0EaFz96F3LgYZoqk7kLrbEw5UIWSTRt5BdTlclrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785979261; c=relaxed/simple;
	bh=zFuNcPHAAqnZVIFAUlXugk5HxB9Ed12TWf6iWutGK+s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QwPxKfg0iaAkHO+/hpqfpI5zDftTXbpXI6dVMcf0g+QMDDPtLGR6FwhgV8OaN2ySz+WBllZewPPVq91xc42y1fHXt2G9Xi4vAHwveWDpNEa7GyTB1kI1be0SaScmqNhlYjdXTDZBCchXBwJ9M9RVdwKbKLuXX+OF148RSjVF2xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1WnB/1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1WnB/1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703071F000E9;
	Thu,  6 Aug 2026 01:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785979259;
	bh=gs6o80yMo+wvVaPrtsizRFwgtO5kTqNyHZAFZ9Km8PE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=H1WnB/1rYaRR/wzDPfCb93v1Ock4N4EHtYi8pWHYpFToG7pRrQfsXlwtMw9KicFbT
	 d/VKRBUBnSAtHyBrR+V1Q6TTHtBlOc7rQgPhftJqcZrOWs5yvquWVWHpEn8kPyKF83
	 dbdOevjiocUe8/wHxBiDmhU7oBFOyFzBeZ0wo/x/WTY2R0Y5HEkkmy9sUq4+iukAIS
	 JnTbX/urfur5+4ZhZE2cJNTsix8d9Dmqpbf4W27fbpyUslBgxQcQzU6x3rjHmu9Xcl
	 idWZhe1HtobTWO1P+ZZdPd6zi3UGksmzzIF3T+NdjR1IFKzvC+gBRewdinvSQB7iq/
	 5YJzjcVbp9bGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569AA392FFF2;
	Thu,  6 Aug 2026 01:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: print device info at the
 start
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178597921914.593652.3156874799133708597.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 01:20:19 +0000
References: <20260803211944.2166211-1-kuba@kernel.org>
In-Reply-To: <20260803211944.2166211-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 sdf@fomichev.me, dw@davidwei.uk, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  3 Aug 2026 14:19:44 -0700 you wrote:
> When a reviewer asks a developer to run an upstream test during code
> review, it's often ambiguous whether the test was actually run against
> a real device, or just against netdevsim. Print the driver name and
> ifname at the start of the test, e.g.:
> 
>   # Interface: enp0s13f0u1u4, driver: r8152
>   TAP version 13
>   1..1
>   ok 1 ...
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: print device info at the start
    https://git.kernel.org/netdev/net-next/c/9cb1d062b094

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


