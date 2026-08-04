Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5803002DC;
	Tue,  4 Aug 2026 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785806446; cv=none; b=CAGi6u3ke9c0uHPjYsSyXJRpeGHgfOe/YaqS1swU9/U6ZRtdIj8jhm2+BNw0Sot0SRXizPgNA+BShYHjG0dj5qK7B7dfAaDt+/+L7YS7srl5R9hF9hP2A5UiZgDGLz3di7WxeWojdc/6/s6xaI/+Xs/6mzuHNnGh+lgWkZUKxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785806446; c=relaxed/simple;
	bh=cD8W112lK4gZobD2yssSMCLBkCCSNinvvpPF3nQEFko=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cjBvo+ivOvRgjSdBrQXkD11u0614dK4cBsbX4+rQyYm9r3yxmkwV6uAb5ramBfW1Z1XIcrF9JqvUIWpS930AXzdcZ/29Ie6YCQ0+3VLyAeVtZrs7+lVTQddfcotcoECRVKfGNtIvli8ub9eHVXCJbIjgUnY164a++92a21Y0p8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO4qCySY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO4qCySY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AA31F000E9;
	Tue,  4 Aug 2026 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785806445;
	bh=As7hGarZfmrtltgjuV4/RzvjKkH8cvGXLFrIas+YI7Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dO4qCySYVfh/AnZy3Yupc0VwRYHib9dpzQk2wzN7OLQfIKu1tUeYm1m9LT06b/zAs
	 EVeu8ntzIr4QxTZJXPe8L46ym60fpyB+Zqsw/PjRkgtCVyxPZ7sNs2rJ0Y3+qRon27
	 OfLNNPex0GN7XeNLcgpStlEoGjVLguewJnr9oo5HvXkZVmvQVgbJ9YPKUwbom4ptGf
	 7cRPzrGssRYmURNznR/vH5dCzmmen4S8ASqndGR5AvpDNXE1AdRZsZpAgW8iseBwdZ
	 dDk6glutpHkhiMmtdHmRfKyremjyc3iWdTdzDc1Y+3dgXE+v3Lt2tGuz2kKhDWn8YR
	 cq+TS4ILQSkXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A913924467;
	Tue,  4 Aug 2026 01:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5] selftests: drv-net: Test queue stall upon
 reconfig
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178580640565.2906169.10462225297051990904.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 01:20:05 +0000
References: <20260731021543.1058526-1-mohsin.bashr@gmail.com>
In-Reply-To: <20260731021543.1058526-1-mohsin.bashr@gmail.com>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, dw@davidwei.uk

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Jul 2026 19:15:42 -0700 you wrote:
> From: Mohsin Bashir <hmohsin@meta.com>
> 
> Add a reconfig_tx_stall test that detects the possibility of a TX stall
> after ring reconfiguration. The key observation is that drivers using
> netif_tx_start_all_queues() are prone to experiencing a stall when
> reconfiguration completes compared to drivers using
> netif_tx_wake_all_queues(). start_all_queues only clears DRV_XOFF, while
> wake_all_queues also calls __netif_schedule() to kick the qdisc. Without
> the kick, qdisc backlog present at reconfig time can stay stuck until a
> new trigger is issued.
> 
> [...]

Here is the summary with links:
  - [net-next,v5] selftests: drv-net: Test queue stall upon reconfig
    https://git.kernel.org/netdev/net-next/c/c98610c2eb70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


