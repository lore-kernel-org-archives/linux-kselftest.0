Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B692EAD15;
	Sat,  7 Mar 2026 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772847021; cv=none; b=N/J0iYWaS17LiQGPYEOFcjiiH6hOPqY4gFKZ+yWvck2L8Vm6QS8EMD7/nrIIc+SQcE8UQGRBcRRkuXBY3ea+ReM4kD9sYt/v8mhl296tXCzP6cnBKkAHm9IICAEMmF+nK8xxSkdX5f+Qt4fvR1cv1F3uEpwopQug6UgwsuD+qKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772847021; c=relaxed/simple;
	bh=9LETwzfNDm96UQU/DvFmevNCNzdwc/PCLDqOV2dHJoA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E7RJmlyP+COZ3c7R6y888djB6gdBdnZmXKlw7GQqv08CsVH+id4VB5qrgdtJ+NAKdaE6WNzuXSSNXXuEwZbKicYBo50OFsX32/JfOXKyVOo/j4nb+iEcC2l9lmQuuGV2NZfz2plYgnIlxjQSn1mLprYUacJ8XfriNWiOWy5+Xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR+yq9xW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR+yq9xW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D6BC4CEF7;
	Sat,  7 Mar 2026 01:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772847020;
	bh=9LETwzfNDm96UQU/DvFmevNCNzdwc/PCLDqOV2dHJoA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cR+yq9xWPQSd8LlqTuBCQ75pH3MmlNYWd8ykNePN0Vz93diWlg4qfzaDcqHJ8D4BH
	 OM7uacYxpwMasxkBPlvTLd5/d1lZGbhgdU6p3ONJtfQjuVmwsATNICAFHGwEEO3uPN
	 4Coj4H4SAkZe0GrP1x7U0LUKIpX63SCrSIqEA5w2NXeS59+pDJhRaRH5+wiY7PXqpb
	 MZBYCI3M5uwtHoCm5yU+J7hoWC58PEe7UwjyaJtz/X97BAYor0jWMFu4QnOsVJ+XQT
	 kbADtxvFK7buMaY54INdjHfwB/oUVuVWLLL+qNgX9KNMxc/lDKq6npnJKESfKFsc5D
	 kdjHLPguuc0uA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02F8A3808200;
	Sat,  7 Mar 2026 01:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] selftests: net: forwarding: fix IPv6 address leak in
 cleanup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177284701954.117391.973842857088681580.git-patchwork-notify@kernel.org>
Date: Sat, 07 Mar 2026 01:30:19 +0000
References: <20260305211000.515301-1-aleksey.oladko@virtuozzo.com>
In-Reply-To: <20260305211000.515301-1-aleksey.oladko@virtuozzo.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, petrm@nvidia.com,
 idosch@nvidia.com, nird@mellanox.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  5 Mar 2026 21:10:00 +0000 you wrote:
> Several forwarding tests (e.g., gre_multipath.sh) initialize both IPv4
> and IPv6 addresses using simple_if_init, but only clean up IPv4
> in simple_if_fini. This leaves stale IPv6 addresses on the interfaces,
> which causes subsequent tests to fail when they encounter unexpected
> address configuration.
> 
> The issue can be reproduced by running tests in sequence:
>   # run_kselftest.sh -t net/forwarding:ipip_hier_gre.sh
>   # run_kselftest.sh -t net/forwarding:min_max_mtu.sh
>   TAP version 13
>   1..1
>   # timeout set to 0
>   # selftests: net/forwarding: min_max_mtu.sh
>   # TEST: ping                                                          [ OK ]
>   # TEST: ping6                                                         [ OK ]
>   # TEST: Test maximum MTU configuration                                [ OK ]
>   # TEST: Test traffic, packet size is maximum MTU                      [FAIL]
>   #       Ping6, packet size: 65487 succeeded, but should have failed
>   # TEST: Test minimum MTU configuration                                [ OK ]
>   # TEST: Test traffic, packet size is minimum MTU                      [ OK ]
>   not ok 1 selftests: net/forwarding: min_max_mtu.sh # exit=1
> 
> [...]

Here is the summary with links:
  - [v2] selftests: net: forwarding: fix IPv6 address leak in cleanup
    https://git.kernel.org/netdev/net-next/c/21c0dc7cdd07

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


