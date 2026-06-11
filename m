Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A792D4C77A9;
	Thu, 11 Jun 2026 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218237; cv=none; b=GDMMkTXT2YgVjRtTzeS1HYzMi1ZC3OGHTTYqm3i2NFRb2JEwv+i1FnchCS2pfOOhHVFmCSZGO90q4OT3s6fI/2lRSnXro7Dce2LCPNH5b1Jw9PzHhe0JdFNdo/7oIp21i+IE+rCVCdCgAQOZIMlTuTBQ+FHX8VmiWXRU0+1TRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218237; c=relaxed/simple;
	bh=bobSTNL/feNbcfBK8iQXiNhaecHF18/a0GoVzUhWMKM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Iy5x/JOa5gVndypj2TXD95UebNR8dPwZrnNUAKf1g4ZfCgkRuaLNVdW9Zbxt03FyD8hNPdv6OpQ4Vuf3gobH8wtWoJNQtY3a7jQpBGhOb3Ize0R4NdEYwAn6UvLkAL7BDXsJQ8xodjXLXW13ruytrp5txcIVAbo1N1FnXJuiENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+8Zpfru; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+8Zpfru"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6181F00A3D;
	Thu, 11 Jun 2026 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781218235;
	bh=nXdfG7nH/Ru5QlkAW0W9jpNdIe9I0cWwOaA3rKNymnk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=U+8ZpfrueBZqRDziUbIJ072++PAOtdByLPykKuKm4TW0X3HFJ6ssSFYVbmxFs7ebL
	 RRj/uD/7tOhoza7ksWQcSoliNMcYdUQik4gN+PbfivmdeWyrWOa1f2gJWmT35rw2cd
	 wBbHpqH+xLr/0h9MVuqNKtvEpfKNRai3WHZNfWQJM0qtU6ioNkzdXHHSzY8asrHRua
	 KM9o4kOSKg3ivgliIH44GTHCr2ZIcm2tUHAiB5wTksA8kuWAlJyHk6vrahLl/wAACO
	 Y33wmUxK5HqG+lizlSL3g8rWevt85/j9bDldEwogl4r0ckoCwW7/TOHlSRhDQyPdxJ
	 rAvozCPIV14aQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B143930FB3;
	Thu, 11 Jun 2026 22:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests/net/openvswitch: add flow modify
 test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178121823239.394849.414676223815974792.git-patchwork-notify@kernel.org>
Date: Thu, 11 Jun 2026 22:50:32 +0000
References: <20260609165725.107484-1-houminxi@gmail.com>
In-Reply-To: <20260609165725.107484-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org, amorenoz@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 10 Jun 2026 00:57:25 +0800 you wrote:
> Add mod_flow() and the mod-flow CLI command to ovs-dpctl.py, exercising
> OVS_FLOW_CMD_SET. Add test_flow_set which first modifies an existing
> flow with new actions and verifies the change via traffic, then modifies
> the same flow without actions and verifies the kernel handles the
> no-actions case gracefully.
> 
> The no-actions path is unreachable from userspace OVS tools (dpctl
> mod-flow requires actions) but reachable via raw netlink. This is the
> code path where Adrian Moreno found a possible kfree_skb of ERR_PTR
> when reply allocation fails after locking.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests/net/openvswitch: add flow modify test
    https://git.kernel.org/netdev/net-next/c/3e9201e4fe8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


