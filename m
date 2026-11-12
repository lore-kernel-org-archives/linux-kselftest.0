Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504015;
	b=xgw8MlzZs9Q7FVAQIQ+mV0vVGytKGjSMUmchB6BrYCBLD0SiPlgV3n8kqe9OoY0iXUSf
	 IhMvhJBntNIVaaRwlssU00Mib9Y0misQETD04VQNALdyqPF7qH6s6JzWpfjMX1pOVfAuY
	 mL0Twvt3R5xme/G4Y6H6DyGWq950hyzVhGpO+NIRlTnnXyU9paBEldQR6M2AEtmwTvdia
	 jyGLhm/auUDx0oVoSsg6PWzaRoqJhMvu9DH7iyahLcjXJAf8WNlA4J7v8DU6Oi7p7BTPa
	 +W5aM2tG3X16mdMO5rZN/SRZKYGUZEHxxDCCNS7VihEc8yZXnFmAuCAmtvfvlpS+HzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504015;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vTbdWSIukequbF0VOAEctJY8oMpCkME4UJsCgP1DuTo=;
	b=tN9AygWUFIAKZpARipX3AB0e0XnpTBb9hTiAdceSy5DSRJUgrOsO6LJKPPO8qBM8UJ1L
	 3Bn3Lv5JrphEvts38qaRydqfPKXn9G66MpL0/wVCqO0KAKV2/WkRP05iymTyg8zvvGiBi
	 oZ92zRSRsSOQC6w1lfYT9u+eG7FBXIpLq5W7QASr92c4rVdYO4FBowBVqL8weGR6DicW1
	 LaSE8yMi/K2OltJoGrP16VyjLCgbNm7TB1YdUz52RF89V6YwWiynuvQm+8PEwcnaVwXA1
	 ls+Db3yuY0ZjLwV9fVetFngmzACprlD2pELT7ERictfsznsMCvIAJ0WLARkAm1g72+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cp2QAtuM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80B260A2602;
	Thu, 12 Nov 2026 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cp2QAtuM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBEF1F000CB;
	Thu, 12 Nov 2026 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794504014;
	bh=vTbdWSIukequbF0VOAEctJY8oMpCkME4UJsCgP1DuTo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Cp2QAtuM0x7Wi90hArhg5OjnZMuWdy9ZYpPNx89NesDpyqOOMA0V2AqTp3BcuNE1L
	 UqLTOcu4ets+vDvPBZLdWL+cq4e+bPAaklOx1dY9sVP5BKpTgPPVoR9XMKaevlcMsc
	 N5/T9VqT/5hOWIOVkPpBhQAuNZ+ogXPN6urMBLMZh0HiOEnUG6uLA1DbMpfYf43u1n
	 AOb7g2e22GWOamg9jAbMt0UEKiADRfBqUHUGDQbP9lXQG+3GUkwSC2/lKjO1+V0ctk
	 JLuqQtZtgtYJ/E/XnGao2wl2XufYrX6q3lO5nuoqIyEbZwG1V2nqxXe29oHw/uCxLA
	 4xB4vLSk3oJWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4483380AA78;
	Thu, 12 Nov 2026 17:20:14 +0000 (UTC)
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
Subject: Re: [PATCH net] selftests: net: cmsg_sender: retain the resolved
 address
 family
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179450401327.546493.14902450577256522503.git-patchwork-notify@kernel.org>
Date: Thu, 12 Nov 2026 17:20:13 +0000
References: <20261110033918.49238-1-xujingjing@cmss.chinamobile.com>
In-Reply-To: <20261110033918.49238-1-xujingjing@cmss.chinamobile.com>
To: Jingjing Xu <xujingjing@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, willemb@google.com, kuba@kernel.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 10 Nov 2026 03:39:18 +0000 you wrote:
> When neither -4 nor -6 is supplied, getaddrinfo() selects the socket
> family but opt.sock.family remains AF_UNSPEC. The cmsg and socket option
> helpers then take the IPv6 branch even for an IPv4 socket.
> 
> For example, an IPv4 loopback packet sent with -l 11 arrived with the
> default TTL of 64 on the test host. Using -L 11 instead failed with
> ENOPROTOOPT because the tool tried IPV6_UNICAST_HOPS on an IPv4 socket.
> Explicit -4 works in both cases.
> 
> [...]

Here is the summary with links:
  - [net] selftests: net: cmsg_sender: retain the resolved address family
    https://git.kernel.org/netdev/net-next/c/3e9089d1499a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


