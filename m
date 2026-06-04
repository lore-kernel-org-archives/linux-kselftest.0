Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95491391E55;
	Thu,  4 Jun 2026 16:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588826; cv=none; b=G6FnxM9AjUuVRA0O1GKUJoUUOmlvQh4thGBP8q8ZLV/eNIrmZzOcGevH8AKROkLRPX1fiZdWcIC7hCkj5YQc5MkEQv90czIUtUzKvWPfiRURGAlSXuv0IcdM0Kw46ViQUVHQNvwONnpPXWWnD6D+k4sIdUZ5JrdcQ3Mpw2mK+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588826; c=relaxed/simple;
	bh=5Mvt7hsQjRW93hgJ2c6P2ez+LL0PROIEiH8o8Uf0Jy8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BcP7j9HrLWzWRcE8DpWNzvdsizsjNGRunqJvwlLhNZmhOEdDqil0CtIZQpflCEBFX9GLWNz180Q+AWcWclSr5G+vxqNvndDavo8tQfCpWtbXRx7rrolTCThZdg1sXh0AJsGpyG26oGfsIBVKjNjHQrGvsaSODBAdk6Qk0eQrijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0E0ofpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0E0ofpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D6B1F00893;
	Thu,  4 Jun 2026 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780588825;
	bh=qcXclboO2qIaa57rWCQiVOhNuR14QDL4omKf50SB4Fk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=L0E0ofpZatU10ebiQTM1jeIsnlshMqcAfu5c2f8N06WHwFvzBVE+Yv5HS5bDlHv60
	 bCYxBumVs6yCxloOQrkkyKl/xtP/hYsPvnG9tyuMoRI+ib2WlVXmJwOIgORXKOAdfq
	 cYqHJFJBJArkkIq4B24V47yIZ9LtX4rSuClEx1ElM9TM9KCITEAa5mpiATgk1vtCAC
	 A/dIE2e7dR0wkVV/iwrHBOD9GGJub91Bm7huoGWJDT4ouMbN8GsczKxsRJ1trzm2Mq
	 mBnt0tenrWoSlqEkoB+yPdYpCr2pZ40ntYrgQDOnyXEjq9U/JkyjX682bGI0aHJsi9
	 xmN4gJy1buHmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569CB39309B7;
	Thu,  4 Jun 2026 16:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/3] vxlan: vnifilter: fix VNI add/update
 notifications
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178058882614.2493857.5621998893656016843.git-patchwork-notify@kernel.org>
Date: Thu, 04 Jun 2026 16:00:26 +0000
References: <20260602185138.253265-1-aroulin@nvidia.com>
In-Reply-To: <20260602185138.253265-1-aroulin@nvidia.com>
To: Andy Roulin <aroulin@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 roopa@nvidia.com, petrm@nvidia.com, idosch@nvidia.com, chirag@nvidia.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  2 Jun 2026 11:51:35 -0700 you wrote:
> When a vxlan device has vnifilter enabled, userspace observers
> (e.g., bridge monitor vni) miss VNI add events and see spurious
> notifications on no-op VNI re-adds.
> 
> Patch 1 fixes the missing notification on VNI add: vxlan_vni_add()
> guarded the notification on a 'changed' flag that vxlan_vni_update_group()
> only sets when a multicast group or remote is supplied, so VNIs added
> without a group (e.g., L3 VXLAN) were silently created.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/3] vxlan: vnifilter: send notification on VNI add
    https://git.kernel.org/netdev/net/c/aa6ca1c5c338
  - [net,v2,2/3] vxlan: vnifilter: fix spurious notification on VNI update
    https://git.kernel.org/netdev/net/c/84683b5b60c7
  - [net,v2,3/3] selftests: net: add vxlan vnifilter notification test
    https://git.kernel.org/netdev/net/c/8df1c84e7272

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


