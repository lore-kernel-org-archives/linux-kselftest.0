Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D6419539F;
	Sat,  6 Jun 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709416; cv=none; b=SZbB92DDOoHJcOjzlMp5wMJ29BkptTc90V5PzZKYaepEaG5VQLiZFez6VJwE3zmVEfPimrQnvWfwu8zLOV6g/Wi8wyzB9D4nF6A1HRao3Nb2DsbOh7ERtoWAj2JcOjyJZL9h+51x+14AlI1RQfj1fqUP8genyMnb/Ay6K6XXV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709416; c=relaxed/simple;
	bh=pWnjxDwKWDQKvXjT95dOKH/pyj/RyfMzumZtXsuNIr0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dXNBl1GmD3Q54474e5DAtKCN5zSsKBt4ush8dpLEAiJprgPXeYzmxfhaLFGYGNQkFoQJRuQkaVUERwj16lakTmtI7yPlpqL1dcfulQtNjKDoHmpr+lEa33AHYcrJMdyzdmOEBWy8iICnBuXUvXy9jgc7PfSX8XUqjF0bdSzzrGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWOWmfWM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWOWmfWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF35F1F00893;
	Sat,  6 Jun 2026 01:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780709415;
	bh=XudeQH2UZC1D/tqB/AIz6YfH6sW5aR/FrI7UO/3CU8s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WWOWmfWMQ8op4AIUe+WhfgzRxPpxGHh0gq8imOHr+NZCfvpBwSgs+El0GHQu4CXID
	 wlADCjiTuGjyQqxidgoWH1wa/KTpaYbRJyGFR6UxDeBimZxmBisiRV1sJHW80JEIlr
	 aH1JM/ODV+AQpk9OnEnX3krhMR+rfHjtIKpHSzFnezsGQzAiMn0VK+NvbVZy3R7Vbv
	 YAv7TOPgQjRkxawZPbPw+uSr5MikB08iZsxTyBGSrNdoh5by7McX/uLEtgTsy/J3aS
	 buNrRashh9w4x0Hdqr6udzDqhenl3kmHVNB13H82oWS9HKoQX+n1ZoZNLe9PkoA7OJ
	 1B9i+PDATJqPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568833930A9C;
	Sat,  6 Jun 2026 01:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] net: devmem: allow bind-rx from non-init
 user namespaces
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178070941488.3983833.14749974405723853859.git-patchwork-notify@kernel.org>
Date: Sat, 06 Jun 2026 01:30:14 +0000
References: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
In-Reply-To: <20260602-nl-prov-v2-0-ad721142c641@meta.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sdf@fomichev.me, almasrymina@google.com, daniel@iogearbox.net,
 matttbe@kernel.org, petrm@nvidia.com, dw@davidwei.uk, bobbyeshleman@meta.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 02 Jun 2026 18:37:30 -0700 you wrote:
> NETDEV_CMD_BIND_RX is GENL_ADMIN_PERM, which checks CAP_NET_ADMIN
> against init_user_ns. With netkit and netns support for devmem, it is
> now useful to let workloads holding CAP_NET_ADMIN only in their own
> user_ns issue bind-rx for a netns owned by that user_ns.
> 
> The first patch switches the flag to GENL_UNS_ADMIN_PERM so the check
> uses the target netns's owning user_ns. Init remains permitted.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] net: devmem: allow bind-rx from non-init user namespaces
    https://git.kernel.org/netdev/net-next/c/e302aa3d00fb
  - [net-next,v2,2/2] selftests: drv-net: add userns devmem RX test
    https://git.kernel.org/netdev/net-next/c/78c1930198fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


