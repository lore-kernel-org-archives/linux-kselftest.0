Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECF393DF3;
	Thu, 17 Sep 2026 02:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612294; cv=none; b=k09HbQ1sQt+owFxRgUZ+YU0wCoww+dFMbYXT4oItlNZz3YwG7Gj0sWLf3lHWKhdWkhKGvFTyTtBIHQFBBZNP7DMkEU9fg1IST7kCnVqt3W3deykTlCzKloPlr4rP33OPncatv96xHOObj3zgMxUjHPWPctlxoZikW1kmCjlZTFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612294; c=relaxed/simple;
	bh=J8cqoGcOsyptVN0Opp2KpEo0JtP2WC5ccAc+V36dgSc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GA2IFjAY71Nu5iyK9P1NpcYIsd2JbZiEJ0CKUSB/rNA+NGOpiCIfRvVOql43LAEJGkwc8Pu7r/AYu+5k1Ai4nKeBA3hK9gDFBfTWDSuTFyizYmkE8p8Wd6mqm6IWSfbI4Psc6xUT72XWUeCBzXfVfvlSmrqtxvwlP2ElMIEa4xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZoxOUKr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZoxOUKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C388B1F000FF;
	Thu, 17 Sep 2026 02:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789612278;
	bh=6f7z0MmMVQc6i7Kb2t/3+orNirPwd4Z0/B7z599bz88=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mZoxOUKrGPAlCQuCsDYAwb5X1AqyUtmjwbvErPBrKmA7Npyg2ZAlmVYUSkoGS5oqz
	 esRXNHl9rRJtb/lsHkVQdV8x3ZK33lUWjsi0h9l3zyXvobymTtTX+/OjsQgMEq7MJi
	 kW1Bo+uaiwbed5zURWtcJDl5Ip5DHidd6ELuOqITxnzcPT3oYEB0YAKpKFExu2xGsy
	 7qeCXn3Jw1FOapGlAL+7n/jqxxHBiqjgoy1hnjvtEHGHbsiXmdKERHLpqc/8OTqIq4
	 4YaUkE9wF5QYyEuOgrfSNXhhmTAxCKzwDEWgkS7EUE5dMUIxrI2xVwznQjy8ycv1Gb
	 oI5rTLEaiTm4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A0939E960A;
	Thu, 17 Sep 2026 02:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178961221263.3383832.6287862160202388316.git-patchwork-notify@kernel.org>
Date: Thu, 17 Sep 2026 02:30:12 +0000
References: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
In-Reply-To: <20260915-psp-ktls-fix-v2-0-0eedc3b148ec@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, andrew+netdev@lunn.ch, shuah@kernel.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Sep 2026 16:11:36 -0700 you wrote:
> Sashiko's review of commit da630d1da2b1 ("netdevsim: psp: drop tx key
> ops") [1] showed that there is a hazard between PSP and offloaded TLS,
> where both can clobber what the other set in the sk_validate_xmit_skb
> callback.
> 
> It was discussed further on the mailing list [2], and it was pointed out
> that there are conflicts with PSP and TLS ULP both using the
> skb->decrypted bit.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb()
    https://git.kernel.org/netdev/net/c/a41f24c612c3
  - [net,v2,2/2] selftests: drv-net: psp: test PSP and TCP ULP mutual exclusion
    https://git.kernel.org/netdev/net/c/b4288c59bda8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


