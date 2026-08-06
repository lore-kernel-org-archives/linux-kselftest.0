Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4A392C3C;
	Thu,  6 Aug 2026 13:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022465; cv=none; b=tPwEUMQtGKK4aqYBWMSK/u8C2jV7IEZZzHTZwUTucni1wLdit2JItjLkHlgEyNfOebf2rEsU/H+zKjm5ckzyG861rCcLEjX//dumeb1CnrD0OA69+diaWCVXY9DzpjTYEUyEI85ZtJPrz/jZpozMg01SGhJo7TTbIaMYi64JFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022465; c=relaxed/simple;
	bh=QgPQ8k6wqDqajYwvd3638Dpiin9GggbZ1wLDFlYRpGE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UuOL/RA4TaZyKjOj18vvo9+YgDVRRuk/NLM7nitLKqeLKupNhy3u+ZMt+aLrKPSgPxsNzLesGnS/hNg+GO2dW1Rjty4y3iOER2DLE4S6cdO39tqvLg5sYvd1pBQAfw+WWimBuUelcaRFQZ7uPg36SnEBFSs4egGHKr1ZdXO0pCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvoZxzn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvoZxzn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAE61F000E9;
	Thu,  6 Aug 2026 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022459;
	bh=qnx3W78q2VUrmxaw9ozFxoG02LsHUCMvlaSK1RQU7nk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gvoZxzn24TOg+86qifW2zP9CkIIWY+yGfLKRItG4DyEwblKUeKWTRJ5VblprlHDXI
	 D8rx7A8qc7nTYyKjEF4tB4zKgOuqDHhpZE8wedrIO4ladqwprALBqJfaU1u3QC1F1T
	 qTqFnKfanwj0HiK3O0mD9c1pgHTjOS2A8h/Z6p9/CYOwy5J7ntjalVqqUlnhIACi1b
	 Z4dvHE2LXCgPgaJNZn6y6nFzaDGbdTzAwPJHYTDsto78ZqLiXh6da0TikVWqbjHh7K
	 yza+XCo6ARyHX3mFVL6YOUplRoqr5pefKWfxnTn/er36FRMhHhNEy/Pf0YUeysFzaP
	 weVDPZLoln91g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56963380820D;
	Thu,  6 Aug 2026 13:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] openvswitch: remove support for legacy
 tunnel
 ports
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178602241884.840277.8360130594768086781.git-patchwork-notify@kernel.org>
Date: Thu, 06 Aug 2026 13:20:18 +0000
References: <20260804182049.2289754-1-i.maximets@ovn.org>
In-Reply-To: <20260804182049.2289754-1-i.maximets@ovn.org>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 aconole@redhat.com, echaudro@redhat.com, dsahern@kernel.org,
 idosch@nvidia.com, shuah@kernel.org, kuniyu@google.com, razor@blackwall.org,
 fmancera@suse.de, atenart@kernel.org, linux-kernel@vger.kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  4 Aug 2026 20:20:34 +0200 you wrote:
> ovs-vswitchd doesn't use OVS_VPORT_TYPE_GRE/VXLAN/GENEVE with the
> Linux kernel module since adding support for standard tunnel devices
> with COLLECT_METADATA back in 2017.  The code to use them was only
> activated as a fallback for old kernels, so not used in practice.  And
> it is now fully removed in the upcoming OVS 4.0 release.
> 
> Modern way to use tunnels with OVS is to create standard tunnel ports
> with RTM_NEWLINK + COLLECT_METADATA and add them as OVS_VPORT_TYPE_NETDEV.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] openvswitch: remove support for legacy tunnel types
    https://git.kernel.org/netdev/net-next/c/d26dcf73a8f1
  - [net-next,2/6] openvswitch: vport: remove infrastructure for vport options
    https://git.kernel.org/netdev/net-next/c/38aecd1a1973
  - [net-next,3/6] openvswitch: vport: remove infrastructure for separate modules
    https://git.kernel.org/netdev/net-next/c/2425eba0f822
  - [net-next,4/6] net: geneve: remove unused geneve_dev_create_fb
    https://git.kernel.org/netdev/net-next/c/e5ba33295201
  - [net-next,5/6] net: gre: remove unused gretap_fb_dev_create
    https://git.kernel.org/netdev/net-next/c/9646825a51c4
  - [net-next,6/6] net: vxlan: remove unused vxlan_dev_create
    https://git.kernel.org/netdev/net-next/c/a5ae637f863d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


