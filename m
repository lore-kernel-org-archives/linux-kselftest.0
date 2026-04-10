Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE27175A75;
	Fri, 10 Apr 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790636; cv=none; b=gHM4PEp4BNt0mjKlMSJQ1Q2nd9vB5WpIBmt2RZgFZreBfvJB1OdXj6MSnDFAT4LcYJfeNt2t/XGqh6Nfi5M+0l5zdyT+wPp+XtzsJLqSqrU3NOG84w2NaIfCvEaWfhAjHXsuN6KVDawBmS8VztZ5crQuBX43/n7jZtHYtX4oFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790636; c=relaxed/simple;
	bh=4j2eh4mER1CzK18+0czj/YEhVEMELQyD7wyOSgyhEOE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UUEDQyoBkEdKvwge83F8yIeYMKf2g4dN4gUlx2Jq1DpcAHsB5T9mtTZNvMQpTbuDcLWnrJ5M4qpDlM91YcEAqTrG9oTsoRXaImNOv0zNxnzQms+BvFYm+wGGG9bf7qapThWfR4AzJvI/5I5IWo7MKNe+9wZDLom8IbSTlRJO5ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKvmwDqv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKvmwDqv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D0C4CEF7;
	Fri, 10 Apr 2026 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775790636;
	bh=4j2eh4mER1CzK18+0czj/YEhVEMELQyD7wyOSgyhEOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kKvmwDqvDHnuKb5vFuZQDbZlGDueKqx69jc/Tu9krEn3Vd0uIUfeYRCnko7LdB0B7
	 ngh3CHtxa2/t8LhOvgahnX9mxahp2/YN+99wZU0yBHblS2YVzGif5zVOMWcC4cfP+C
	 2hgqrYUGnFIFyLQAaXUKOKbqmfAE7SVLTofpBsao7ApNwfrLU2dd7+aKiquB5WLPxD
	 2BwAb81H74sC0zcPviPAz5yRTU7Iz6Ir2/2HPYG2+Dii5jvNN5aZU/qrJnQ2k2sN1e
	 OpE74XfvtIgHos2cDVmX0fN7aIUxCV93dfFcq+rfBuQ5IZb4latSRfxMtBvn55DDcr
	 uV4mNTvNh1j7Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE593809A22;
	Fri, 10 Apr 2026 03:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v8 0/4] macsec: Add support for VLAN filtering in
 offload
 mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177579061105.1844106.11250785795431819587.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 03:10:11 +0000
References: <20260408115240.1636047-1-cratiu@nvidia.com>
In-Reply-To: <20260408115240.1636047-1-cratiu@nvidia.com>
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: netdev@vger.kernel.org, sd@queasysnail.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, sdf@fomichev.me, dw@davidwei.uk, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, dtatulea@nvidia.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 8 Apr 2026 14:52:36 +0300 you wrote:
> This short series adds support for VLANs in MACsec devices when offload
> mode is enabled. This allows VLAN netdevs on top of MACsec netdevs to
> function, which accidentally used to be the case in the past, but was
> broken. This series adds back proper support.
> 
> As part of this, the existing nsim-only MACsec offload tests were
> translated to Python so they can run against real HW and new
> traffic-based tests were added for VLAN filter propagation, since
> there's currently no uAPI to check VLAN filters.
> 
> [...]

Here is the summary with links:
  - [net,v8,1/4] selftests: Migrate nsim-only MACsec tests to Python
    https://git.kernel.org/netdev/net/c/e1ab601bb230
  - [net,v8,2/4] nsim: Add support for VLAN filters
    https://git.kernel.org/netdev/net/c/c89f194b6b8e
  - [net,v8,3/4] selftests: Add MACsec VLAN propagation traffic test
    https://git.kernel.org/netdev/net/c/26555673bc78
  - [net,v8,4/4] macsec: Support VLAN-filtering lower devices
    https://git.kernel.org/netdev/net/c/a363b1c8be87

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


