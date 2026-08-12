Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CA263F4A;
	Wed, 12 Aug 2026 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786498278; cv=none; b=hfwZnjHIYMYW7T5UMg71as/O4JD/I5bBypeleARxGd3KJ0cCwo+NM5mu0Z9UC0o4BcEcWC5GAnEax16qg6ocTRCeoI+wQo1E89BF/SnfwDuQdZkIGSjAKWxS6CW6GCXnRwNuRwlJiqG+RTjH+wp7iXCRDPbWy5OdkpVU7jYPkQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786498278; c=relaxed/simple;
	bh=QgcAzhDRN66EaPsaaFD9Mg1Vd6L1RYe3kqE760yk8Ok=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=P2QfbXyu5XBbAl1KrABzRaVQo3oAZOBJrc/9axqfNAEwHprppU/er/OCCsfYLHwfNVKnofNxoXDAgubtElRSsOT3/5BQ+w9Gi6rflvSbuS0xdob6MUfQDtHR3ftF/qov64hIm0ZBATz0fXvvY5VSVv3UETrd1DIn6y14dt5exg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQ/g6IlZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQ/g6IlZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592831F000E9;
	Wed, 12 Aug 2026 01:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786498276;
	bh=dEcgLMceXilbaBz7ViJuMiSXMrTaYjxwjV+XhYroX/E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kQ/g6IlZ66I3LLW3kn/xzGwUzdyLyFrSQpwzedDASAsjNMusXtpH/XQnZ/JyM8yKi
	 v/kqpeM0KwU1PUc6dhZrF2ylapZs0+BoR1DrjgpMbED42X5BgKsl8RiT4k2GZEX+nw
	 ZJnFHtxwM6rxL/5nREK5golAGJvkVVALjye2oME77UxI5ytpITFUHlc3eYKwmxHfID
	 BCDUwYByQsdnag16CaMynZiltfqC38HakpFTHWMjavYajOZQqA95ZZUnp7622I3vtX
	 F2OlGQGsUTqE7CU+EZUi/g8e7qB/OuPndz7tdix8CGNkigxOQXRglXyax7fxUaHQoE
	 UWl9tHBc2IFmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A0F3809A3C;
	Wed, 12 Aug 2026 01:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/5] net: selftests: adjustments to
 ipv6_flowlabel_mgr
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178649823188.1227528.4185778051969675653.git-patchwork-notify@kernel.org>
Date: Wed, 12 Aug 2026 01:30:31 +0000
References: <20260807220942.421382-1-marcelomspessoto@gmail.com>
In-Reply-To: <20260807220942.421382-1-marcelomspessoto@gmail.com>
To: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  7 Aug 2026 19:09:37 -0300 you wrote:
> The ipv6_flowlabel_mgr test file was lacking coverage for the
> IPV6_FL_A_RENEW action, and the IPV6_FL_F_REMOTE and IPV6_FL_F_REFLECT
> flags. The first two patches from this set aim to add a proper test
> case for RENEW and REMOTE.
> 
> The third patch was added to insert network namespace creation inside
> the test suite, instead of relying on external wrapper scripts. This
> change conforms to other net test implementations, such as
> tools/testing/selftests/net/icmp_rfc4884.c, and it is important for
> the fourth and fifth patches.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] selftests: net: test IPV6_FL_A_RENEW
    https://git.kernel.org/netdev/net-next/c/bfad9937de98
  - [net-next,v3,2/5] selftests: net: test IPV6_FL_F_REMOTE
    https://git.kernel.org/netdev/net-next/c/39dd045c1514
  - [net-next,v3,3/5] selftests: net: create own netns in ipv6_flowlabel_mgr
    https://git.kernel.org/netdev/net-next/c/03df0d155ba1
  - [net-next,v3,4/5] selftests: net: test IPV6_FL_F_REFLECT
    https://git.kernel.org/netdev/net-next/c/b2690523a71f
  - [net-next,v3,5/5] selftests: net: adopt harness for flow label mgr
    https://git.kernel.org/netdev/net-next/c/b5d24f604506

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


