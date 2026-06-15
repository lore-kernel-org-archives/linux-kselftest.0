Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B573AE706;
	Mon, 15 Jun 2026 21:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781558445; cv=none; b=ax/yt2FscerHuP+J82hNjVuvEA+TkWHnWKTJ8zu4T/tC/ze03zev90nSSIFwJvK+/edUAKaMeKl/gxAg9u0xlVJ9fLcWtiv6IgP0o68U7eBJ1+YpPg0ssb1FmK3DnaBv7pLKmo/VDinE7P5d9BJbGau3gWaSWfV2QRHue+y1sqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781558445; c=relaxed/simple;
	bh=lwMiZA0PVhBjGIxlXjCZxvblaO57+GTOMoT0+3bOXYk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ba8pMkBTuyjixGossZ9/C0F7lacMHUr0FuokgyFeSFHj87TEb5EfXd9v/m63TV+fgMYJwCaXbl02mPin2sez/yZGCdsxLdn/FK8POKwRiKMzQqt/6AttC71f2hCwTkvrZH2oY2epLBRPw9S/FnUVJ7GIyjbn+2FqzxYEWDjuwvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oynQtO5x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oynQtO5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DA91F000E9;
	Mon, 15 Jun 2026 21:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781558444;
	bh=s4Qbe+W/lEvK6Mb1Mos7N4Qvk6t3oGI2t9y8rUkD/XA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=oynQtO5xh6fJq+YqFbWHP0xv0JbM2DWEBGyZ9ApAfObzRgmDsH2xBIeKQ2/+l/JEZ
	 QDzaGu2OthSeJoxg6bqaXS+Ps5t0kclI5sp9yk2GjAC/BFH5hJNzVjpMXA/l/gQe6/
	 E2oT9leJIVJeXOdmQE4JAE9eY4cvAcK/ro5VAwMUWQO0tt87M8jN9iUPCulKWy2K0M
	 jbbKtqfZ/hp1U7lfGchpL2iv0LbiVPwLxVhkm4NduG2l8vGbXWmaj+VONRgJxd1QJd
	 2ZARBdCloyA6HkHESJxDYHnN/og96hthXHSrlDYAd1y6xFVtGfBEfP2sNRWygSweZ4
	 KnqTo8+44MPRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B33839A06;
	Mon, 15 Jun 2026 21:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests/net/openvswitch: add SET action test
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178155843888.301119.8263394079175828047.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 21:20:38 +0000
References: <20260612130503.311240-1-houminxi@gmail.com>
In-Reply-To: <20260612130503.311240-1-houminxi@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, aconole@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 12 Jun 2026 21:05:03 +0800 you wrote:
> Add test_action_set exercising OVS_ACTION_ATTR_SET with an ipv4 dst
> rewrite. The test verifies the SET action in three steps: first
> confirm normal forwarding, then apply set(ipv4(dst=10.0.0.99)) to
> rewrite the destination to an address nobody owns and verify ping
> fails, then restore normal forwarding and verify connectivity
> recovers.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests/net/openvswitch: add SET action test
    https://git.kernel.org/netdev/net-next/c/3b165c2a29cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


