Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A83D25AF;
	Thu, 24 Sep 2026 02:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216489; cv=none; b=nSHYPPpG23EU/Ym3JI6WAb2Dlw8Il34CIlgPsoVHdPd7gHaRdCXVpeLqka1G3AJ8xH1L/27kSL4DxKmYqHyfPU5rRIG/m2NId3tBoNpPSSo+Z3B1eEIGE45lvyZlszGaPZubkAd4KN/i33psyNTAh96zvEhPqjWvL/YXYsZ6LPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216489; c=relaxed/simple;
	bh=vw/2iPX7Zy4fbf6IbKZpu0ljYGqsH8EwxqrYa+vf/LU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gE3Hiw6qQdHt3pAtyIn+1XbaFh6TPNQQs9X9ptTfhWbwBlBkN6tqyk1HMvJMaFgkBr8Evf4POa/N/wKcg8eX8z50vt/K2MOmZLDNk3JJTRA1ggAuU7REJC41mKyyttBCuHeDeVn8kll3li/yPkKpNytiztQbujAAAZRv+YTDAO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPs0q0xr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPs0q0xr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2321F000FF;
	Thu, 24 Sep 2026 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790216486;
	bh=kUjE5Acg7wzxmBc/DIJHaE/LtfcHf5+FBdistx3Av/A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IPs0q0xr08q9cbGmkSNyTDK1P5FfVI5AT/BiXwX1p5N10LhH0FbyriAhl8VyoW5dN
	 JFq3y2DuQD4PExrBz+MWRGUN3Fvagl4DESziKOhqJoSCg3lMehK1n6tSmaBO3ha3Fs
	 dyqwbYNYlCJO7ow5S7w+WZArJndhnh7htETLhmVK0vfGVuw9rD8ZSzmje1qspuBR6o
	 qx0ovQddiPlqBZFF+AVSMqDuCh8Y2k161eWOH+xpICA4ByLZJNU1Gk49OZrGg85dK+
	 3aaQnm873WODzMvej/O8cP229PbxeXhELz6Gv2xspmI4gSh8lYA1WDDOdFDavv840b
	 H4GxNlTpetX7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199DA39E9611;
	Thu, 24 Sep 2026 02:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: add BIG TCP coverage to TSO
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179021641564.1281065.13555755802626651132.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 02:20:15 +0000
References: <20260921201145.49875-1-narcisav.kernel@gmail.com>
In-Reply-To: <20260921201145.49875-1-narcisav.kernel@gmail.com>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, shuah@kernel.org, pvorel@suse.cz,
 pavan.chebbi@broadcom.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 21 Sep 2026 13:11:45 -0700 you wrote:
> Add IPv4 and IPv6 test cases that exercise GSO packets under BIG TCP
> size limits.
> 
> 1..2
> ok 1 tso.big_tcp_ipv4
> ok 2 tso.big_tcp_ipv6
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: add BIG TCP coverage to TSO test
    https://git.kernel.org/netdev/net-next/c/63182028f38b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


