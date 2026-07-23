Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF324399E7;
	Thu, 23 Jul 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812851; cv=none; b=mobsGhhf1g1c8Sb3lLsrAYRxgia3KM7o+9MTjX3rCdVrHzLoyAlAWR8MLJmbp3eggTDWpZsDAF8mBk7MJm5HbxASIl4pnXquX/t+PPe2Bnwsx1+rGn0mlt5a2vc6cANkbHJUV6j265yuEY6Ddf09hwYwQU+ysvnb6Hp0vXK9iIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812851; c=relaxed/simple;
	bh=OG+vKz7Faio7yiNuX5mxPfhSuKzS3YumAyYZQW57Hhw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VZws3q94LB06bAhvLN/XfuVHYsYrdXRVVNSi3C7en6NOTYE+7oIynMHzUDiEjaKsBF53wB7DVpDHBlD7rmidzY8hvPbWhyNjiiz+4IXz6jH2Yj4evlpeFcWgPHlrk38fOsyLAq1dlffdGb/kEo8tAimColBCgxCpBpMkxN7cNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F551F000E9;
	Thu, 23 Jul 2026 13:20:49 +0000 (UTC)
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BFE3810902;
	Thu, 23 Jul 2026 13:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] selftests/net: Skip srv6_end_dt46_l3vpn_test
 if
 iproute2 too old
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178481280740.2242888.6073807579937273134.git-patchwork-notify@kernel.org>
Date: Thu, 23 Jul 2026 13:20:07 +0000
References: <20260715122859.36177-1-alessio.faina@canonical.com>
In-Reply-To: <20260715122859.36177-1-alessio.faina@canonical.com>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 andrea.mayer@uniroma2.it, po-hsu.lin@canonical.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 15 Jul 2026 14:28:59 +0200 you wrote:
> In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> the End.DT46 support is not available and the host_vpn_tests test contained
> in the srv6_end_dt46_l3vpn_test.sh file is failing in some kernel backports.
> This is the result of those tests:
> 
> ################################################################################
> TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> ################################################################################
> 
> [...]

Here is the summary with links:
  - [net-next,v3] selftests/net: Skip srv6_end_dt46_l3vpn_test if iproute2 too old
    https://git.kernel.org/netdev/net-next/c/6217246bc5bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


