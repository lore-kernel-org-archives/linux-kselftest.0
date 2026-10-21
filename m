Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543206;
	b=L2C6foHPQlqG0tXgwr3kZN8YjZ3IgfNqozu0jnGJTLiQb+XXcZyQDPlSePo46bv0hC2p
	 GBMuB5RTuj77wUU7C7wVSyXC/pnVur/E0Rb5QNqBuI+6PAxYfqvZKFAFMMfjiEoMWXzOX
	 GnvzUakE7IZe0lkEj83aGP5KH5Umk4zm0cTEW6oXD3zH/zQRTXvBlEdmAz7GjwKeXfpQm
	 aBwi+Krhr4/59nXlbriXvFfEgeSDLS18bI5aaCUDi6b0krZ8mLnpqmMAAU6LDFjEDLI1y
	 221Ule36Rr3nvsjqYLsRfG5RbuBHYe+czOL4tG8BlZ+8ZzAl7ydqUmPO1ntE2JI3uZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543206;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=nvKCRyOzdlVKCoVh3p6f6tYQASAtMtD4511w8L8ezSE=;
	b=bP7rTP0fJsrqc4Hh6wz9/F3/CJC6HKkM7kSh5tOetdmrk5uYrNN0bq81UdPBXNgaU/sc
	 /xZxehjMz3xwK78rO1XOoQ+wK6uES0a9Z0WyEeZmz2F3QDsZ+4sYgFUq5XlblN/z6qdql
	 YPJ8fKa3gXMY5fKgg8I9amHAq/aM8Eogv247QFsMG6KV6LKQezLqTB2Ii9vZYGd4/dYoq
	 /wh72HMUDOldc8Gt5DDHPBZ5/jGFk5iI2PgbXeVKkQMVL6XeXDZg96gORr7a78szyZQzR
	 FZ5quEdopREnONhN/1Ahl+jcDWyTvO++kxRxPh+NP6+OtnlTsCb80TTv9JdozU0IWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4oUTn2e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28807606A322;
	Wed, 21 Oct 2026 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j4oUTn2e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF68D1F000CD;
	Wed, 21 Oct 2026 00:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543205;
	bh=nvKCRyOzdlVKCoVh3p6f6tYQASAtMtD4511w8L8ezSE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=j4oUTn2eBsFwSo2s0pYWosqCXM/jFTfQfy8+90t3kwvjUoVo9K+yNIUeW8FeIci/e
	 gbMfSbEVOVilJ7E+tPZQLs6mP4fVCSpCGpUm2xQeYYr4Uskrojdwj0NXRzll15LdeM
	 yvHshLu0KxFAaA1+DQk1Id4Mtx2eURmDKG29nGzwNBzMIVgUkXyMU5oNP9zRhpnFGe
	 N7oOje4OuuFdbEcwZZNYyuKK1v0Fzf5lHQjS0KI2yWCbpngnQCJyVlVf0CGutAzYTK
	 8JuBzGjUJW8rcHbJfFHpmLHI6j41++XyOACXOYaDOc3yTl4EKCVIFsAchQYGm6uWoh
	 oKIEz3N1+zUOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B46143809A0C;
	Wed, 21 Oct 2026 00:40:05 +0000 (UTC)
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
Subject: Re: [PATCH net-next v4 0/7] vxlan: vnifilter: bound a single request
 and
 account per-VNI memory
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179254320453.289286.4906572805895102502.git-patchwork-notify@kernel.org>
Date: Wed, 21 Oct 2026 00:40:04 +0000
References: <20261014123814.388557-1-alishmery18@gmail.com>
In-Reply-To: <20261014123814.388557-1-alishmery18@gmail.com>
To: Ali Firas <alishmery18@gmail.com>
Cc: netdev@vger.kernel.org, idosch@nvidia.com, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
 andrew+netdev@lunn.ch, horms@kernel.org, razor@blackwall.org,
 roopa@nvidia.com, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 14 Oct 2026 15:38:07 +0300 you wrote:
> The VNI filter interface accepts a START/END range with no bound on
> either endpoint and no bound on how many VNIs one message may ask for,
> and the memory it allocates per VNI is not charged to the caller's
> cgroup.
> 
> Patch 1 links the VXLAN_VNIFILTER_ENTRY nest to its policy with
> NLA_POLICY_NESTED(), as Jakub asked in v2:
> 
> [...]

Here is the summary with links:
  - [net-next,v4,1/7] vxlan: vnifilter: validate the VXLAN_VNIFILTER_ENTRY nest
    https://git.kernel.org/netdev/net-next/c/599d0e97610f
  - [net-next,v4,2/7] vxlan: vnifilter: reject VNIs outside the 24-bit space
    (no matching commit)
  - [net-next,v4,3/7] vxlan: vnifilter: clamp the dumped VNI range to the request limit
    (no matching commit)
  - [net-next,v4,4/7] vxlan: vnifilter: bound the number of VNIs one request may touch
    (no matching commit)
  - [net-next,v4,5/7] vxlan: vnifilter: account per-VNI memory to memcg
    (no matching commit)
  - [net-next,v4,6/7] vxlan: vnifilter: account the default FDB entry to memcg
    (no matching commit)
  - [net-next,v4,7/7] selftests: net: test the vxlan vnifilter request limit and dump replay
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


