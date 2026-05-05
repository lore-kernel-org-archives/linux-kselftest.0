Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A101F47CC70;
	Tue,  5 May 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987859; cv=none; b=MDoJE68PNGEQMHUuVWAKSrxbAtrF+gcWLbbsvwn4+GQ2eD5f9QEBb7qudtOKRzQiliPqsd+qiYSZs9OmPkfwv25lxUGADU+DMCdtwCiRsrHb20R22+zajp9OyxolqmBGOcxf5zqw0JUuaRqqyfXnHmnILhxRmz+e2K8dOoz5qlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987859; c=relaxed/simple;
	bh=RAydYRsEHZiy1yx0tUy/q+12EcV+wsVQKZxmIUbla3Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ksv8t2Uhewj5EnUQSiIM3XGe6S2nm6DH0TxZjC4ASyfUi44mgcWVTvJKa2X6Hh7LczlSaR7BupPyuTPG2RGvgHdft8wJ+VU6GweQNNiTMGq5NLcv4Cd74hVgMJGFQKpzsIXYRV/TO7rC66m+E6Y6LJAt7JVDdVjacHAAaCijTKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVZZ23lJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVZZ23lJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8FEC2BCB4;
	Tue,  5 May 2026 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987859;
	bh=RAydYRsEHZiy1yx0tUy/q+12EcV+wsVQKZxmIUbla3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IVZZ23lJSqzmXvQMwbcgKSs5Z0Ja5mmNB/jxbNFgYv8oTG3BBNGbPZoUVQMhBXvUj
	 dAJCFrKKUCnMv93dXpGN8eSezXtSp1QxWXQUd9i0CQbv0vLKZBuUGXsi0jZapmwDnG
	 Zd9hPu8aSOPoF62qOv9f7AEisnAPxqs7PPas56YzKLSoi8RFp3CBm9BXvqqxqBWCjm
	 H5dZKkbH6M8DNayWTW/VFpKE8M2YQ8QL4aCPi/vuqc+gUa8tv+T7RJCRt0cG+0+hy6
	 67eF82ASyhIkPeSfVXfHD4xZu3VaWftqcEVsp9czmGwkmEgfxE1F6966xHko7MbjQW
	 FKKqYTGRFDmFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02BEB3930234;
	Tue,  5 May 2026 13:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] openvswitch: fix self-deadlock on release of
 tunnel vports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177798780980.2056981.7235049038599637901.git-patchwork-notify@kernel.org>
Date: Tue, 05 May 2026 13:30:09 +0000
References: <20260430233848.440994-1-i.maximets@ovn.org>
In-Reply-To: <20260430233848.440994-1-i.maximets@ovn.org>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, tanyuan98@outlook.com, n05ec@lzu.edu.cn,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  1 May 2026 01:38:36 +0200 you wrote:
> Two patches - the fix for the actual bug and the selftest that reproduces it.
> 
> I missed the self-deadlock in the original patch that introduced the issue,
> because testing required code modification in the ovs-vswitchd to force it to
> use legacy tunnel ports.  I thought I made the change correctly, but apparently
> something went wrong and the tests were run with the standard LWT infra instead.
> The selftest added in this patch set will at least prevent this kind of mistakes
> in the future.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] openvswitch: vport: fix self-deadlock on release of tunnel ports
    https://git.kernel.org/netdev/net/c/aa69918bd418
  - [net,v2,2/2] selftests: openvswitch: add tests for tunnel vport refcounting
    https://git.kernel.org/netdev/net/c/05416ada37aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


