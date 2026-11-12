Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494406;
	b=I0j3QOmkecxs46lxoQxlGOGrphBE7ICGAtOfFXQEe4ja85KGUK5oEmXCijnoyKHfWRwL
	 88pjAJpU+clkHpJKqNFCcbfDPxuyWx7qDB/0+jHhMHBMtlYJS4WggHUAgrHqyF7ot4kSp
	 +HTwmRJztjvRCxXUHdHA4IhRHG6JNc9lauxAjslAik6rs1oqUsVFgw5O3R+231sy3/h4v
	 8DbVkXPwmjOR6AHHVN5YFQ1HwF7jKgP+XcZJUKINkyxdP9mN6eQcsefuo8zYDARcnpuE/
	 Zs0xmpoW9CZBSNsJKLQKxGHr/cJD6Y3YFCxAZ6CMFv7RdSYTsDydR8Od8qQgicl1Djw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494406;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=/YgjS0S7SEWiPuFC4J1IiVsVQwqG8NJBnGxBnySv3mw=;
	b=h3gzlr3kr1jJ3V8+/ANdmZZ7ALWb9E+FhEa5IAtkmdI+JE/3fh7gg30l6hMu106gtLbG
	 M3JtISNxCRO6pVV9sEcngRZ3jJ5AjV78rPHOR4GzllLq49sScN1DxS8vDbliilTjZlQCI
	 UdKd9s6N8rpRW2B5TLcNW1jnPWnuSm+bfvx3LpVZpAf29Br6jItxk9tFPM9aTI+NqusdV
	 FYBfjMg17jtwK3eHQGrn+tivabuwcZLZfgVph8P+LSUD26OuE3w/hr1Z2KbPRdrnVzo8u
	 IpBtsToV+XRxZsxZUBidcTmZWEPyfIkiUtSdaSobfOLH47kcHbNoKBgyMlf0Obe9Sog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6XzK4fz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EED606A321;
	Thu, 12 Nov 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k6XzK4fz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3081F00A05;
	Thu, 12 Nov 2026 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794494406;
	bh=/YgjS0S7SEWiPuFC4J1IiVsVQwqG8NJBnGxBnySv3mw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=k6XzK4fzei5qPr9skD02+W+3eqLqS3/FDo7SKXyIkO3qT58gLoSGL3K9yQAsfEY26
	 5MCtewlmmOxg+huOdrdc9gMFqwja3swa0qjwCH7K3cdJGzEcig4xBFYlTkXXZgx2Jf
	 wHfVm71hAmz46SsrdRc/sJ5eIn4KeA4felEH+OTAoM+EoG8Q8Rzt21DKma9vKvOKI8
	 vDQfkanK4tIx4ErefaAGHkCboaflBKrnsk27/AWpU8CCDNzS333FCdHf4hiMvmFfA3
	 6Ot6Zf6RMRFS30c8Jzvpy6CHtljj8cVf8jYO6HnyBt2GQRb7Mb9TqeghD7CieLCRCq
	 uyQl7ZA38Bytw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 40C023AAA6D9;
	Thu, 12 Nov 2026 14:40:06 +0000 (UTC)
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
Subject: Re: [PATCH net-next] selftests: forwarding: vxlan_reserved: drop
 redundant in_defer_scope
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179449440512.2146648.7889847093364560776.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 14:40:05 +0000
References: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
In-Reply-To: <20261110-vxlan-reserved-tests-v1-1-a252d69c841e@proxmox.com>
To: Hannes Laimer <h.laimer@proxmox.com>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, petrm@nvidia.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 10 Nov 2026 15:03:55 +0100 you wrote:
> With commit a6e263f125cd ("selftests: net: lib: Introduce deferred
> commands") tests_run() already runs every test in its own defer scope.
> So the per-test in_defer_scope here does not do anything. Drop the
> in_defer_scope calls and the wrappers that only exist for that.
> 
> Suggested-by: Petr Machata <petrm@nvidia.com>
> Link: https://lore.kernel.org/all/875wyo6b7d.fsf@pmachata.org/
> Signed-off-by: Hannes Laimer <h.laimer@proxmox.com>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: forwarding: vxlan_reserved: drop redundant in_defer_scope
    https://git.kernel.org/netdev/net-next/c/449f6097e144

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


