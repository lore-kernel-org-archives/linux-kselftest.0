Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F494DB54D;
	Thu,  8 Oct 2026 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483015; cv=none; b=fJTBjxHkKe0UEzU3P/TwMblpz75MS3nWyZYiuHO3A3Z0Xzk8pVqol1CFpb6FYh+gnwD3rSEgl9yoSdOecJ2AnjQXxS4WvfnHH+sjTTf8uJSMNsXnUVXNshiYE6tzT40DI5OhsgbSHoHyjCioudVmIOwzV5eiPc3xNTwUh67Tg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483015; c=relaxed/simple;
	bh=2eEaRLflR4kTUCZ8NWrt+PwSMh6FCKwxkbm8NMVhagU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pMvI2tCAMgl5Vds/jSpVqbTOwcGhFkh4JV/A3qZE/SgwmorWqBeBCSfoAMz0G8UmNhFgc2Ak8Va8HmK5kCEPVkpS/IXe20IywOPb0VOtO9AUuYNtE9hqkh+N+QU3jeO5V4Yc88dcwBomlfUAJdcoA9kvx4kL3p23wkYQJc4S1Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5uvDOkb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5uvDOkb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A721F000FF;
	Thu,  8 Oct 2026 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791483011;
	bh=dtY6jlAqN/mp81DKno/GI0hU8OxTsfLLT4dhr5tttNw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=n5uvDOkbWXmyjOnLxdGtMJqjlHLN3GvRJu2LUS0/gwbmxHi9P0FpwMU487xgHo0YW
	 koZgSNpCquAjIYmOQiJpW2bMHwXnxcDh3L0LEMAFvkW6mO+bHG8ogdEq/2fFP/pwWX
	 HmskM9FM6RKWSk37WtXsmJZouZlo6P/xNzc//fKDZxnZJPIx6KB+ngCeKmQBAdfp/4
	 M26IkfCSevGDM1WiH4esHN5S51o9GQUUc0hLSYplXkY3d0Fa2ENvINznfuVXhIkz37
	 XvkXG8zeJWCW2Iga705mYKxSuMKHPIh1az/Xf78Bh+Hvv4aOKeDeopMsCG0/nVlFmD
	 Nuju2j2mwlFFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F13F1380CEC8;
	Thu,  8 Oct 2026 18:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: net: big_tcp_tunnels: Fix the IPv6 route
 change
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179148300952.376744.11669203356310247111.git-patchwork-notify@kernel.org>
Date: Thu, 08 Oct 2026 18:10:09 +0000
References: <20261007014731.1277055-1-yanhaishuang@cmss.chinamobile.com>
In-Reply-To: <20261007014731.1277055-1-yanhaishuang@cmss.chinamobile.com>
To: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, alice.kernel@fastmail.im, matttbe@kernel.org,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  7 Oct 2026 09:47:31 +0800 you wrote:
> On slow machines, do_test() raises initcwnd on the route into the tunnel
> with "ip route change". For IPv6 traffic this fails with:
> 
>   RTNETLINK answers: No such file or directory
> 
> The IPv6 prefix route of the tunnel address has metric 256, while
> "ip -6 route change" without a metric looks for a route with the default
> metric 1024, so nothing is changed. The test still passes, but without
> the larger initcwnd it is meant to use.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: big_tcp_tunnels: Fix the IPv6 route change
    https://git.kernel.org/netdev/net-next/c/4077df74d716

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


