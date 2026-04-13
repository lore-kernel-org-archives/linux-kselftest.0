Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F31B4244;
	Mon, 13 Apr 2026 13:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776087051; cv=none; b=h64yMb+zKO/E7Z2N3zEfcXtJjacDMVJwYEBFNEXkhULoZSayiSJVja+uoPk1oKSf1YJkTY4o0SC+XDb55tg0/99e7JUJHw1IS5O3q2E7OWgaL8745cfZZNP+kar1vPeShEtNnCpqxOW4iLCE6iznGFHpT2IYv4GYHBY7t13Fa8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776087051; c=relaxed/simple;
	bh=l5ogWvXWPxJH2bhB2BsgbojtaXt3GgZ8zowlym7IJTc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a1sgayjzrXBpBOf26J8JCz7KIEWqSQDoews2fpnjlsOMllkkQzUL3cY541sZgIVPlOCNCMLqa2mMGZdKdr8zUMVjic6h2MgG2hxzAO833pFz8/PbkfTtjIC/OIfrKVaXU8CjcPz2IQAyImsHFkWfVPqQ8BccdQ1Bl/u7fJL2REQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoKc+Jkw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoKc+Jkw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE74C2BCAF;
	Mon, 13 Apr 2026 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776087051;
	bh=l5ogWvXWPxJH2bhB2BsgbojtaXt3GgZ8zowlym7IJTc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DoKc+JkwTbtZS93xQycvo5MXBq3VMSqMUX9MufuL3ujSB4VF00V9r0GuAeXezqaKo
	 +bciAUpF/sGOEgY+7e+nTnAvNAZ/B+cx6/kygZiIg4kwiLNCCuyxBkdhG5UaotDjKk
	 ifReT+vyWdtswaVG1SCNgJ+qhhgcu8bzZ0Fe46Db0jLJCMPs8neGrxBwyRO1KBwKXl
	 ljETai1JVrMjz2FFaZwX5CknLHV3cvhyJr47GSycsrGYlA3QazhQSKnN4Y1tq1pNBd
	 2X6S19renc0vtj1VLhChiv4pM2vxCWWJGl3m1nv4+Qs0G1hYyTfvse+19BxrmRlt6g
	 QX0IXtxBKPdTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE533809A8D;
	Mon, 13 Apr 2026 13:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 00/10] Decouple receive and transmit
 enablement in
 team driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177608702305.4127901.4852211619722110151.git-patchwork-notify@kernel.org>
Date: Mon, 13 Apr 2026 13:30:23 +0000
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
To: Marc Harvey <marcharvey@google.com>
Cc: jiri@resnulli.us, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kuniyu@google.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 09 Apr 2026 02:59:22 +0000 you wrote:
> Allow independent control over receive and transmit enablement states
> for aggregated ports in the team driver.
> 
> The motivation is that IEE 802.3ad LACP "independent control" can't
> be implemented for the team driver currently. This was added to the
> bonding driver in commit 240fd405528b ("bonding: Add independent
> control state machine").
> 
> [...]

Here is the summary with links:
  - [net-next,v7,01/10] net: team: Annotate reads and writes for mixed lock accessed values
    https://git.kernel.org/netdev/net-next/c/3faf0ce6e499
  - [net-next,v7,02/10] net: team: Remove unused team_mode_op, port_enabled
    https://git.kernel.org/netdev/net-next/c/014f249121d7
  - [net-next,v7,03/10] net: team: Rename port_disabled team mode op to port_tx_disabled
    https://git.kernel.org/netdev/net-next/c/cfa477df2cc6
  - [net-next,v7,04/10] selftests: net: Add tests for failover of team-aggregated ports
    https://git.kernel.org/netdev/net-next/c/05e352444b24
  - [net-next,v7,05/10] selftests: net: Add test for enablement of ports with teamd
    https://git.kernel.org/netdev/net-next/c/10407eebe886
  - [net-next,v7,06/10] net: team: Rename enablement functions and struct members to tx
    https://git.kernel.org/netdev/net-next/c/fa6ed31dd913
  - [net-next,v7,07/10] net: team: Track rx enablement separately from tx enablement
    https://git.kernel.org/netdev/net-next/c/68f0833f279a
  - [net-next,v7,08/10] net: team: Add new rx_enabled team port option
    https://git.kernel.org/netdev/net-next/c/0e47569a574d
  - [net-next,v7,09/10] net: team: Add new tx_enabled team port option
    https://git.kernel.org/netdev/net-next/c/bb9215a98179
  - [net-next,v7,10/10] selftests: net: Add tests for team driver decoupled tx and rx control
    https://git.kernel.org/netdev/net-next/c/d3870724eb16

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


