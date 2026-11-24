Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529408;
	b=ZFmcrLXABACUSknnxpRZ5oNqJIJRyO9ysxEvJF6ZUI0no1SUv3oLSdW3Vsi+xjSW+iGd
	 h2zH3IhrWGuEJudxKa+ELTU8nk6tDgjyPOF5agREXf6jHBdNMpSPZx4KlkWT3fQYnAzro
	 uYnHsO/Ux6c9xGBUNrKnlWxU5izyvWFU/omns1Umj2ZN6X0ZWlCkqLnvBFNtZwf3Mt0dL
	 wuk7yfAWCjH2wiY1ML34h1KJ5h/aH5xDLBENZ8AoxD9TXujuj5BojD+aU5GjYF+H27I/s
	 uZE70viFo/SGzJTsOMuD/wT5pCkGYUn/bGppLC3EUOvaEHRP5Ref2BojdKphbMojcpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529408;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=Ve8Ggjtj4IIkkgpcDu3hIijSdy/61tsMUdWGSNOOpfM=;
	b=s3HVk130R0qCaDuEOX8jIfS6voGAjkyESChXTuEKFlr6T436aRdQxH9BloSEUBA2fg/j
	 jvbLnu/qykpmNiEvJ3KAj/5BSFQyxXfgrwOouXHTSOmt+VQgCZg64DN2pnGRCf/HB7oB9
	 h9Iz6JJYgqU6q8z9E7jX0p1ye5fTt3oILYRjBUStVi3qz+T+1BDutn+PQndbXa+c7fmV/
	 kUEd+egdhTHaCycKnQGFOhgcqo1M82X0lambBsA8KtzvxgGe/Tj00tTlhhZcWt4qMorI+
	 zKPsZWCcUS0OEyud5789oYDGr62w/13J8G4Vibs4lAex7lpmChCW4o2d3ciMPZwJ50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvElAS+c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17EE606A31E;
	Tue, 24 Nov 2026 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvElAS+c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CEB1F000C6;
	Tue, 24 Nov 2026 14:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795529408;
	bh=Ve8Ggjtj4IIkkgpcDu3hIijSdy/61tsMUdWGSNOOpfM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kvElAS+cMZbQ7aW71mbR0xbIArVWKcHD17LIwM68N/LycamRAECcLnA2uDvpL2EVm
	 8mcG4oDmYGNuElH2h7BZkDLeOfIt2WXQ9NipxMHTmgKKl11BoBxfU1Oq1B30tDqbU9
	 e2yjGsggauDytB+ih3NyCn9/EsDYdSaRC9sZan2cyIeFyms83HwMeSIVZki1ahf4z2
	 CJU4k+teCpTdgkW9aHDk7QzpdCaUUpxHq1/KZ9OFc2FQ3CGqIx5xN0PBcV5UQe4r7X
	 LBc144Ejv+HjE6x6/AvXUfJpVPgpcx9wo2oE1OruYJcNjVS1oiZyDQeASH1cXHdHtM
	 sXJEB311KUMHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F15993931120;
	Tue, 24 Nov 2026 14:10:07 +0000 (UTC)
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
Subject: Re: [PATCH net-next 0/6] bonding: 3ad: Support independent control
 with
 LAG offload
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179552940677.3557137.6548670396877640257.git-patchwork-notify@kernel.org>
Date: Tue, 24 Nov 2026 14:10:06 +0000
References: <20261118083442.1061289-1-idosch@nvidia.com>
In-Reply-To: <20261118083442.1061289-1-idosch@nvidia.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@kernel.org, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, petrm@nvidia.com, sridhar.samudrala@intel.com,
 jiri@resnulli.us, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, razor@blackwall.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 10:34:36 +0200 you wrote:
> When coupled control is disabled (i.e., independent control is enabled),
> an 802.3ad port can be in COLLECTING state where it is enabled for
> collection, but not for distribution. This is useful in deployments that
> want to avoid packet loss caused by a port starting to distribute before
> its partner starts collecting.
> 
> Drivers that offload LAG are not aware of this Rx-only state since the
> LAG lower state information only indicates whether the port is enabled
> for transmission and the bond does not notify about Rx state changes.
> Instead, these drivers enable or disable both collection and
> distribution on the port according to its Tx state. As a result, packets
> received by a port in COLLECTING state are dropped by the hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: Add Rx enabled state to LAG lower state information
    https://git.kernel.org/netdev/net-next/c/a51d7e35fc3b
  - [net-next,2/6] bonding: 3ad: Notify Rx state changes
    https://git.kernel.org/netdev/net-next/c/fa772f3d7faf
  - [net-next,3/6] mlxsw: Enable LAG collector independently of distributor
    https://git.kernel.org/netdev/net-next/c/237db6bca727
  - [net-next,4/6] selftests: bonding: Test notifications in COLLECTING state
    https://git.kernel.org/netdev/net-next/c/0316973a000b
  - [net-next,5/6] bonding: 3ad: Advertise Collecting only after collection is enabled
    https://git.kernel.org/netdev/net-next/c/9362d41b985b
  - [net-next,6/6] selftests: bonding: Test that Collecting is advertised after notification
    https://git.kernel.org/netdev/net-next/c/8f337d40d22d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


