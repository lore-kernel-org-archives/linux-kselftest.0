Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FB2D9EFB;
	Fri,  2 Oct 2026 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904009; cv=none; b=WTVvDBfiD8nB1aPCsX0dDDRA2BZE0Wfdw9VcHjhT+ZD3n9s7PgVwnNSjOoKfBHlahSG9//jvcAX3LMytQ5eG1dqzIDigATBuzgbYEDFgFTft0usP5+lGe7NK4U4ckDXJteM/cskhKirVlA2T/529xQHFoRV55BX9RcsFZQWwHSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904009; c=relaxed/simple;
	bh=pA6Lj/PnlNf1kqnfb10VlKbsQncX4piLaeFr8vXL78Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EpKutmsGB26v+8WV9q/W/hxyv3ZKHhq/jkOu91k6wJXumWKkz22YThSvSnWn43iOPFWO59Ci2sAr1z+U/cdbjwShPYYAhcgu3BecaRuR6X9bdPG7AtGuIcGOfis9Am4sYaFrE/fIhHh1ycDw8id79eFjsHiWju/T08/6/03FBfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I44WG0pN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I44WG0pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE27A1F00893;
	Fri,  2 Oct 2026 01:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790904007;
	bh=UPqKbSIAC9atYzCZEnw24JepnGDdsd7RY2VNRLHZUj0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=I44WG0pNCMKq2EqpZrhq41A7QTGcTAegA54qCD1/063z3Oi+6qVbXpBMeL6eXLSHD
	 ZNTf1lF9BMcUwQ3FIsN62PkWMRS5MRPz+PR2LJlrCZy5YHEk4Zzj5KdFe17brlXFSu
	 Tk6OQTdrQg1QoPsvvrc+vXESwx7tK/T2dsFLymZwgfAryeHAaUyEcAbWl5Ou1SLPiB
	 Ev6r13u7LUxPH7alF7adJ7Stw5644GSq3tnedBehy+imJLDiDiR+TXYiUWxrG7fd+r
	 BWCL++1z3o7d1ZibhbAM/h8MUPEL4kZFM1yI0taXZYhhzOG/EEX3YtjzZLYfYHC3u+
	 yGHu9+vvShhrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B45C2381197C;
	Fri,  2 Oct 2026 01:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/2] amt: send the relay's General Query directly
 from
 the receive path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179090400653.3168550.15976743708132455802.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 01:20:06 +0000
References: <20260928202312.74574-1-omar@blockcast.net>
In-Reply-To: <20260928202312.74574-1-omar@blockcast.net>
To: Omar Ramadan <omar@blockcast.net>
Cc: ap420073@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, AutonomousCodeSecurity@microsoft.com,
 xmei5@asu.edu, tgopinath@linux.microsoft.com, kys@microsoft.com,
 cenzhang@linux.microsoft.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 28 Sep 2026 23:23:10 +0300 you wrote:
> The relay queues its General Query on the amt device with a raw tunnel
> pointer in skb->cb, and a query that waits in a qdisc can outlive its
> tunnel: a use-after-free in amt_dev_xmit(), reported by Microsoft with
> a KASAN reproducer. Patch 1 sends the query directly from
> amt_request_handler(), inside the RCU section that found or created
> the tunnel, so it never waits in a qdisc and nothing is stored in
> skb->cb.
> 
> [...]

Here is the summary with links:
  - [net,v4,1/2] amt: send the relay's General Query directly from the receive path
    https://git.kernel.org/netdev/net/c/afae89de73dd
  - [net,v4,2/2] selftests: net: amt: check that the relay's queries bypass the amt device
    https://git.kernel.org/netdev/net/c/c41817fcaf39

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


