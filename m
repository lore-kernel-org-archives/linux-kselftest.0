Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6901F5834;
	Tue,  3 Feb 2026 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081020; cv=none; b=PndtIdDJ6tngT5prpFlrIQMi12IlxEPUAFHfXOqaE6j0Jjz1Wo+pBTemMAaJJDA/ib2NTUgBcVNH9hsv/9JS4ithdQ0yZBX6TVgvPglKsQiDCXfuFgWmo6pmAmzP2p7KPOfI50DBVw0eHaVjkCShdNp9wcqiQIylJVzYUcr7vDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081020; c=relaxed/simple;
	bh=EKgj3Aa47/PCZioEJ22o+4oGTZco8139iWKl3oThvKY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DTqSCyjDq1TWm6lX4qDrvJWe9SrxzUVTxcEH5btv2Hm+ZZbllmZT+iy4f/vpD46v8bAvd02JpojiJt6rAJjkW83P3nKXu4PYva/T7B9gpw85s/Xke7Zop2x3tanonRixsLkBwR/vK9t36m7w8XttaL4FBy/3Ng883D/X1WyAE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRwcraTe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRwcraTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89259C116C6;
	Tue,  3 Feb 2026 01:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770081020;
	bh=EKgj3Aa47/PCZioEJ22o+4oGTZco8139iWKl3oThvKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rRwcraTewFEOqh+wEgFxsq97JP23rqGyizrRgYICCoc8GlqPQ8zF+mukuI5/RJkpL
	 zXd7UAl2uItZt+aTnyUdQ5byPHRgEkQ3RvVJ4/bmhPayosoSgINXYEgT/F+yxasg/+
	 0VFyE96sDGCeMcbXOI/qW9hEmyB1kNTIYiFXy83LRZpw+TccCy2H6SjCoT9s1PPgeo
	 lrHPifTjK2RoVpFUGAdKsDRGc8QA3Oqg0MIvyWOQQhv+xuwMnaszBqn/4TKb3E6+Wb
	 qfrJk2G8dKcmfJDYA6OVK4g3ujdJjNSakTfhPOVHDHlGBJP8O1ICqfoi1GSyGRX4Cw
	 pVwL3E2zeT05g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 90D9C3808200;
	Tue,  3 Feb 2026 01:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: rss: validate min RSS
 table size
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177008101712.1258089.1843088845527602329.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 01:10:17 +0000
References: <20260131225454.1225151-1-kuba@kernel.org>
In-Reply-To: <20260131225454.1225151-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 willemb@google.com, shuah@kernel.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 31 Jan 2026 14:54:53 -0800 you wrote:
> Add a test which checks that the RSS table is at least 4x the max
> queue count supported by the device. The original RSS spec from
> Microsoft stated that the RSS indirection table should be 2 to 8
> times the CPU count, presumably assuming queue per CPU. If the
> CPU count is not a power of two, however, a power-of-2 table
> 2x larger than queue count results in a 33% traffic imbalance.
> Validate that the indirection table is at least 4x the queue
> count. This lowers the imbalance to 16% which empirically
> appears to be more acceptable to memcache-like workloads.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] selftests: drv-net: rss: validate min RSS table size
    https://git.kernel.org/netdev/net-next/c/9e3d4dae9832
  - [net-next,v2,2/2] docs: networking: mention that RSS table should be 4x the queue count
    https://git.kernel.org/netdev/net-next/c/ba9c5611f088

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


