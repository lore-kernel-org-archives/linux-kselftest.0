Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C531D219FC;
	Wed,  1 Jul 2026 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782869423; cv=none; b=XG4FCFG6xg5Zsq5DKJ6I/UldAO4HRUdb9eDN7ufgJWofOpDsW0gANGAB3c1TY0oMbv83LQfqn87mbAwXB0NlXPynLGSTw8YW0JQ5zhlkxmVqFWgbnzc8QlCHns9S4i23/+oeP3VlqsYo0X00FPQOh0ILUH8/iJuqlvHyC8Rc9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782869423; c=relaxed/simple;
	bh=/gtJdKvYgbzRj2+uqGEETzTMoRBRDQDKx2iYQsbAUEA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SwseYwMQyRg0DZK1K9jG/W9JJLGO5ygewLmS0ez2GvItL+XlkbMxA6JXjm124msPkDg/2Liv+5uU+Up+yl3eOk/M93fb1Rgx7ErS21Ssp7qpdx+oa9bUXz3WYmyVEyiHrUujg9EnewPdkCppvQYatHCeVlo4rPud5ncKU+vaOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+g3eJj6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+g3eJj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574061F000E9;
	Wed,  1 Jul 2026 01:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782869422;
	bh=ZwEtI25Be4x8jFHmzmuzNGcOJgHpbFrTly80xZQwmtU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=R+g3eJj6DolaGvkdDHNA8GOieVPVRCIChwxzzxv8VvvpsTyhInCNkbSOdhoM2HMQH
	 wWDy/wA7srtDBAisdU/7Y5iwFSHu1DDkLMvrG3zDpbR2HlTCHbyYDbAdPtI8lPkvOo
	 1kgT8T2iJOHa5sAFxG/gdatAoIWIj6wyJGX5rWwX9n0od1sHI5/HOq2vqr/vc1l2yX
	 ovvZGVKn2d0ghoVqVnLZP5EJdfhzkPsXlAvo8jYMz1jwv67ZtWUwiUVU38yL9oL/LR
	 Jpbr1EJnlT4uTox1CmxncDt76/FYrVNu4eWcxkQREV86wIx+7Qg8/U/E0Axt2se45M
	 VfsqEIB4PoJ0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56727393A964;
	Wed,  1 Jul 2026 01:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: drv-net: tso: don't touch dangerous
 feature
 bits
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178286940589.367336.12422566739924603469.git-patchwork-notify@kernel.org>
Date: Wed, 01 Jul 2026 01:30:05 +0000
References: <20260629233923.2151144-1-kuba@kernel.org>
In-Reply-To: <20260629233923.2151144-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 daniel.zahka@gmail.com, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Jun 2026 16:39:23 -0700 you wrote:
> query_nic_features() detects which offloads depend on tx-gso-partial
> by enabling everything, turning tx-gso-partial off, and seeing which
> active features drop out. Enabling all hw features is dangerous:
> we may end up enabling rx-fcs and loopback for example. For the
> ice driver we end up getting into problems with feature dependencies
> so the cleanup isn't successful either, and the test exits with
> rx-fcs and loopback enabled.
> 
> [...]

Here is the summary with links:
  - [net] selftests: drv-net: tso: don't touch dangerous feature bits
    https://git.kernel.org/netdev/net/c/2f7f2e311106

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


