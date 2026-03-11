Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BEA36D512;
	Wed, 11 Mar 2026 02:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196829; cv=none; b=kzTRswd+SDNw17rC9UfsOJU3eASX7nXsByfiJRnxiBMlWHRo43oan6PGwzC+TcFrBjIoZLnnOXJ5H3VepfsdRx7Rteisci/BiWXwQ8tMZlAls+9zIbH11eGZ6IQ8WK9s0+yJmPrveMH0nb+kabxPmWLhO/0FtSbz0KkcOmdChoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196829; c=relaxed/simple;
	bh=pfSrSo0DsLNTG03+tBUhx7H36IVMP9zoocdqJ4kONIA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XD9W7/LPGW32yiZ0HCDZ3NYgS/up3OcmlhO80m9i0g4HTPli5MIkXGr4dLw4a2Mf8QnSXtenVuDqb7Gsi1iK4+NXUMjvBj8B3G7yIRc0Mqx4CdjsPY3xR2bCyM0sx8wtK5DH0HADyuHpuGWaJ0ouYITkhB8E+R1GVqUGPqfMN7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GM+QNiKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GM+QNiKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B12DC2BC9E;
	Wed, 11 Mar 2026 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773196829;
	bh=pfSrSo0DsLNTG03+tBUhx7H36IVMP9zoocdqJ4kONIA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GM+QNiKuF9+WY9KFlYGuRfaG/soOQxtREUlSIv+1yTcwQSBFZV1Napi7WzC+E+dsD
	 rDJQI5yYG2Vz7JuM7a9xBd/hBjz3IdloQi5DZnkOQ2SAfKR+eCF7EX8NQvJ66oVH2R
	 AtaqDXTgER0/0Zg48XtmAan+Oon0eM1W5YCotRP6sTupjrCJrnCNtvEpJEazAw6iGy
	 n/WkN9RMlK0/3cSfux0yC1GndC8ariwSizzNNEbqD3rURLnGsFTUov5N5PV23GLr/p
	 mP2pIdadbTvhqbdw1hNQbNqkMAUMWHTaxY+rtodR87doPW0wQBJqxWjJ5/4azD4wDU
	 uqFbgjiWtuUeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D7B3808200;
	Wed, 11 Mar 2026 02:40:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: rss: Add retries to
 test_rss_key_indir to reduce flakes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177319682554.3014711.9553555271793224929.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 02:40:25 +0000
References: <20260309204215.2110486-1-dimitri.daskalakis1@gmail.com>
In-Reply-To: <20260309204215.2110486-1-dimitri.daskalakis1@gmail.com>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 noren@nvidia.com, gal@nvidia.com, pavan.chebbi@broadcom.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Mar 2026 13:42:15 -0700 you wrote:
> The test generates 16 flows, and verifies that traffic is distributed
> across two queues via the NICs RSS indirection table. The likelihood of the
> flows skewing to a single queue is high, so we retry sending traffic up to
> 3 times.
> 
> Alternatively, we could increase the number of generated flows. But
> debug kernels may struggle to ramp this many flows.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: rss: Add retries to test_rss_key_indir to reduce flakes
    https://git.kernel.org/netdev/net-next/c/690043b95c18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


