Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4F8521895;
	Mon, 21 Sep 2026 22:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790030220; cv=none; b=qCZvz99HfgZYxBQLtPM6yprJlQeyvB+G3etmogE3/NX7dnNwxPEHe1/08mCDzN0ZtgtyLczzXBhHlwPNOtTg05qT2lN9eZCeHYcq74iiWEya5ChsqUnksRtnouBsjdF896luC06cwMPPDGJmK14ZYJTlvSI5GHWT0tqePQOO1pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790030220; c=relaxed/simple;
	bh=Hdz7OByAd6yZyQJKDJBPsW6XxpBVYa/yXmrF9pFz7Io=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=p8TmeZ7upPD6TIzaXofIgTi9wXWC6B1cRf3o1OOfgS2R9F0MMnxoKTdDOznwLOu0ptM7N6xrNKjTZwczpLInGQDdZiiJrRUSGXV8XcIqHd0Mcd7lJPVtztUWjrB2Y2UCoBz8ux+PPugysvIySWu7Pr+W9L/5GejOA4emKjUIJyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZUyPM+4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZUyPM+4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39C01F008A3;
	Mon, 21 Sep 2026 22:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790030217;
	bh=BBqt0mh6pcap7thNEZ0vvpX8jJ6tpmFAZKqxiel3dQQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LZUyPM+4AUnm1jMP9gskBVuXFWVxpsC68r/4p97UNpFVYIeJBS8PiccQtMfM9l/FE
	 kBnRuYLfjzDUeIX1qPl0bBeS+t16BD+rXBmw3/bQSvtgpnonkswSDHJA+a8QErLu5+
	 13b6fqyxV4TDduKl3AZUPXnd6rXmOPdCbjFR9nGCLRFy1jLLrijyDCy0AL6slnCUsE
	 zAPxUtYlXsrxQab7dlp7Q66MJ9tsF9OSIFZcSzKzy/JlSr6jyB7Sf+aDiZruktV2F/
	 VtBXKqx19NASAMT7X4dv7NmAVzUpimF1tPQAjGYHxmayg1virnmIRjlzh8jnI8a22o
	 Sh6uPkzrx3ZMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ACB3930205;
	Mon, 21 Sep 2026 21:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit
 tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179002561414.3241479.7487658463570218195.git-patchwork-notify@kernel.org>
Date: Mon, 21 Sep 2026 21:20:14 +0000
References: <20260917064736.77354-1-kmehltretter@gmail.com>
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 geert@linux-m68k.org, brendan.higgins@linux.dev, david@davidgow.net,
 raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 17 Sep 2026 08:47:36 +0200 you wrote:
> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> [...]

Here is the summary with links:
  - [net] net: microchip: vcap: Stop selecting DEBUG_FS for KUnit tests
    https://git.kernel.org/netdev/net-next/c/2fba93180872

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


