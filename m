Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794928207;
	b=jf6ozNohAS4GcIR0ERL7i4aPeK57cq69c9NiViSZ+AfpQPo7uEZy6NuwqUCmjrlBHXU/
	 TknByX8ER0ZpaZlFePAyagc1x6SWnw5i16jbJauF6y0iWFiXTIpGisJUFpNoe9rj62Klz
	 govXlXz0l8un4OBXLWRlTjTCt51YrMCqxiFPf/ec3WS2Sb1dgxvs6t9rMEb9q79U00UNw
	 rMs7mqNksG8DOTei9udw8KxLEiM/HaRT6ldJNJabZFlYaezGDwzcCWwHxqCD+6zUl2ygg
	 1oWpEwjuobFaDxY/VsaE5mKUPh8Jnp4FtKWhN6ZxWWkfyfTiM1ZBY+vNG/deCpG0JZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794928207;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=lEbpltDNjkJszBEnTUmCRNYXNuTkbTXqfjEIb3lwv5w=;
	b=CGzZlQnXQWsJYZuSh2TThObXarjfXLM1pdJNmmtSI/emHQQDPmIIDBWEyhWGxdoqa31b
	 Y/SFBD695lHITR82A1QJdEPaFScpLa4r0LKZODIKpn96FJ66r7y+WsTqp/bmtSnt6/2KP
	 prOdYjaMarqEI2b7cIxrkm7lGFEXpasa2TnSk74DTveuSnRepcPSaHSkQixGIyfxa2TLP
	 3q8XSBGrUiqk8m/Mk9F3TwxcVGfecajZRye3/P4anJhff+dEahEuwosUgTOHtvxxyWtjo
	 8gIfubPl/TF6QfozNtG5rFWjvq3zi2a5zD7brcKeLokdR+C8xPXUVARkqDtA7EAGCrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsRQf0mL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F5606A31C;
	Tue, 17 Nov 2026 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hsRQf0mL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C7D1F000C7;
	Tue, 17 Nov 2026 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794928207;
	bh=lEbpltDNjkJszBEnTUmCRNYXNuTkbTXqfjEIb3lwv5w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hsRQf0mLTIxiiq7hK/eySWKy8ndGqH5/fMIrhIRDwea/Gw9OAISYBklPf9kmJD36/
	 yjTUsyb+/p1JrWk+rmlONVaCLZus4zvMufcH8EJJb5+UjJctW0lZ236AWiEPWH2b8D
	 TzF5hVoEatJt+vbmVQscGH9wPF9J+gxQvHPsJl1mBVwSOx+T0O80saDmyrkDcX1Hhw
	 WBI7oMXlCnv/AT8uY7iFfC3igVtG/me0ry8051lLUTFdvvsYDhsqwLwCaz2T/PWrIG
	 ey6XY0zENEn1sTXXza3stfd2CupL9TSNzBe9Lyozc/C44tMM5jZ1bc8XHwUnFSGwQq
	 9qZozkB/E1mFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1612392705B;
	Tue, 17 Nov 2026 15:10:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179492820578.647296.24088219612999201.git-patchwork-notify@kernel.org>
Date: Tue, 17 Nov 2026 15:10:05 +0000
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
In-Reply-To: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
To: Gabriel Goller <g.goller@proxmox.com>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org,
 idosch@nvidia.com, nicolas.dichtel@6wind.com, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 12 Nov 2026 14:41:00 +0100 you wrote:
> Currently, writing to all.force_forwarding updates the interfaces
> only if the value stored in all.force_forwarding changes. Setting an
> interface to a different value and then writing the same value to all
> leaves that interface unchanged:
> 
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.dummy1.force_forwarding=0
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
> 
> [...]

Here is the summary with links:
  - [net-next] ipv6: always apply all.force_forwarding to every interface
    https://git.kernel.org/netdev/net-next/c/6bc9aed3994c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


