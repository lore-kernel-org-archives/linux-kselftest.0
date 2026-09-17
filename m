Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4D386573;
	Thu, 17 Sep 2026 02:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611687; cv=none; b=u/0ItUHAPqLzuyorJKgIgo8o4Fm9OmJMX2PnyhCwbIv60ViCEEFRi1sPNQF0YtlK8DCok2P7KEpftGlkAdMui8ocuHo+CC3swjGklSzIkv1k9TPthSvwgTYx71eP6a4xxSWs+TEVC/fumPYWjtcqRQ9XhuC4u6pJDdAG987s/9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611687; c=relaxed/simple;
	bh=IaGgtaMPfx592U6r7xxfY4sOPuz33jG/EGc4WgoHyAk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kjdgxVdXF1tdPPHJwXhPY05kb6vCpudouv4rd7oQbuxTZ3jYKB3oF7uk4yIV2NBoxXH948vFqtBiJNT4qHcuJ9r4+x915hnJ3PBiNlXX/VLkrbtebKlHN11vUsPOUttmfjbUUdpuQEziAP6OIJCNDWm/BVSuvy++7N5flUSJH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIe0k9+b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIe0k9+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC8E1F000FF;
	Thu, 17 Sep 2026 02:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789611685;
	bh=A9NwGyxeZ+DHFulwQgYDFnMQYUc+eMcjYeHUIUT9sMc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kIe0k9+bxAbMDF+x2RdpT2ffL9snM23NRdeE6wAIJPPvGdo7uM+Oond6RekPHT2Bn
	 76cKtkSupvQhsS9QzULKe3Na7TlBpTmRFV6xoSckU+5gVVCgb0rFM90+mWAih563pn
	 Fjq5oAnChsvEInSOuvvLN/3EmvRlQmBPuf4DmqxYA0XCjJjh0nS09icyrjdCmXJ2dH
	 ggMsdKSj4o23yB6Z22b3frn1a5kYxm/M4T17qAw5+3EDPN0Bc/kKeZOIfyeneaPvTa
	 oAzo1CXATZSir2VAkhJEaCcJ2frhyBsoYa5me4JoldCzlN49vFUhqncnwv6iocwwCc
	 UtP68z95KN8hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569C439E9609;
	Thu, 17 Sep 2026 02:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] selftests: drv-net: add BIG TCP test cases
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178961161888.3379718.13689947396648272606.git-patchwork-notify@kernel.org>
Date: Thu, 17 Sep 2026 02:20:18 +0000
References: <20260913052419.77910-1-narcisav.kernel@gmail.com>
In-Reply-To: <20260913052419.77910-1-narcisav.kernel@gmail.com>
To: Narcisa Vasile <narcisav.kernel@gmail.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, daniel.zahka@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, shuah@kernel.org, horms@kernel.org, willemb@google.com,
 petrm@nvidia.com, anubhavsinggh@google.com, richardbgobert@gmail.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Sep 2026 22:24:19 -0700 you wrote:
> Add four new test cases that validate coalescing
> under increased size limits (BIG TCP):
> 
> big_tcp_data_same
>   - validates that equal-sized segments coalesce past
>    the legacy IP_MAXPACKET limit.
> big_tcp_data_lrg_sml
>   - validates that a smaller final segment coalesces into the
>     previous chain of large-sized segments while crossing the
>     IP_MAXPACKET limit.
> big_tcp_tcp_seq
>   - validates that a packet with a wrong sequence number doesn't
>     coalesce. The test uses a sequence number for which the low 16 bits
>     correspond to the correct sequence number to validate against
>     truncation bugs, since total aggregate length crosses over the
>     legacy size limit for BIG TCP.
> big_tcp_large_max
>   - validates that coalescing stops at the configured BIG TCP limit.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] selftests: drv-net: add BIG TCP test cases
    https://git.kernel.org/netdev/net-next/c/9a483b60a0ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


