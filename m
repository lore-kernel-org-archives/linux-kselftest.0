Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098209;
	b=DxBrvZgDb3GoYJFqY1WMIG5Gm4gqPyn4fQbFwaQS0FPddc/VVp1hgsiFGlENLWq46Z7S
	 k8jPi+fBa1Awh+0OmKGrQpAiaYxEGeHYJJUL/IN9JZC/WOHtRWtrHvQdkx9Te9b6UJjvm
	 xMDqwMgCTzdXpGU7cI2PPMo0n5+lNPpWiQ4Mil1S00eXmrqPeRkj33q0QxCTGZsSIuxn7
	 X+bIDNsYp9pfTbGjdQhsnp1kXezvlBnFox7pUtL9vYwrsWU+CHk/UATPFKTjzJfyMHC36
	 q/jAxkFmZy7Tna6rIWNn5L7axq6QLRhmlGSncPoFsjusdWVEgA4rEI6hKzXtMrs82SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098209;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=HzCuJNCWnQ9dMh722JD/KfRwZB3FHJUExkLlOiQ1KaE=;
	b=lzbx6qalCtty3BVwsltkpQxnZ7yAZ5oqWYSQGAmU8njNeI97K0m2aVoSKaQrpgPPq7ZB
	 KuOnGRv0FD4g46az9WqgMNkCS/xQu0PP9A27CqhfJ/i/j94B02EiM1rcEuRAzOdsdkHRL
	 Amy6b/VmGRg7TgQdLGoteU3G+JVsgiR8Jvd6B66R+Em26ehvlbsE24zTMAaWpwSquJ8zR
	 3OBRZ90A0/OEzvMrtD9/0Zy0vmM14mfefau941kCFJTHwyO2c59C2CX+RoJM7W1wON6VM
	 86vNnh/lQmmgtN/oxbxPylpcS0E9xAl7qRvwweFCjhxw1ZA2Dwo6J+ggS1WGIdp1bLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bu7dbeu/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00187606A322;
	Tue, 27 Oct 2026 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bu7dbeu/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1431F01828;
	Tue, 27 Oct 2026 10:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098208;
	bh=HzCuJNCWnQ9dMh722JD/KfRwZB3FHJUExkLlOiQ1KaE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bu7dbeu/JC9qlixqO9Fjptsc4bPYlao2vCybIDDFCzUPSCrDUci4kGR9MusfU/qyS
	 6LASXGu3FWuzrbtlXgim2YQHkwMLUBPsL2G12qNsGa+UtGTyIwhr/+LErDAc5CPz87
	 OqY9CibCfkqpVnf6yGWjftKqHBoknurpTlfYuLFqC85jrb5/0dDGYrxsxFEDKPP94T
	 14LtImEjdB080WECdZ4HtPCgKedSbN8VdE4Ox3xSDOIwltah/1QdQvZJLWjL7wEW3f
	 UFLRJv4DKpwIPdvSlNqpzN9yxep83ibUFTctbjL/x8F+cysUgZ+GvmjyEOxZ5yiD3h
	 FPBR53dwY4CGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE6E03AA9380;
	Tue, 27 Oct 2026 10:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] vxlan: keep reserved_bits on changelink
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179309820756.3724916.12938875629554652467.git-patchwork-notify@kernel.org>
Date: Tue, 27 Oct 2026 10:50:07 +0000
References: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
In-Reply-To: <20261023-b4-vxlan-changelink-gbp-v1-0-f0d13951c09b@proxmox.com>
To: Hannes Laimer <h.laimer@proxmox.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, razor@blackwall.org, idosch@nvidia.com,
 petrm@nvidia.com, dsahern@kernel.org, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 23 Oct 2026 13:14:26 +0200 you wrote:
> Currently reserved_bits are reset on every changelink. This leads to
> packets using extensions that were enabled on creation being dropped
> after a changelink. The first commit describes the problem and
> solution in more detail and the second just adds a selftest for this.
> 
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> 
> [...]

Here is the summary with links:
  - [net,1/2] vxlan: keep reserved_bits across changelink
    https://git.kernel.org/netdev/net/c/e3a629477d52
  - [net,2/2] selftests: forwarding: vxlan_reserved: add gbp changelink test
    https://git.kernel.org/netdev/net/c/e7cb2f638f7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


