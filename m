Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C242CCC5;
	Wed,  9 Sep 2026 00:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788913871; cv=none; b=g6pR+Wzxz/tS91ornp4f6Zf9tjh2BuVIYJekrm+L45SpGK21DxD69EjJQKdgv+xPHjn3GKy3O75bWs2AajoerMb1ecftskk7E/A7eQKLpIW8SiBoOdoYXuONLvRv7Lmsp1IAU1k7s9fCHz+gNiVydMLKB7N13Gnyl28KK+Qb3ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788913871; c=relaxed/simple;
	bh=p/eKjTyJTC8KAHuqsb1+IwIH2Ux6clIVamawaJKm77I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=X+ln0LZb47DRLw3Xk8EX463QrbHJoM3i199gfR4kawrcCVTv3o7+SbXkH7QHWwRKRqnqyDvMKEbh/sjHXGKSkxoWA+OZUWPIMOysRbPgotgNWoQ3MQhG/+4T6oSanjPGUGddVfixA51J5okC0B7GGaqw2YB9KGlXp4p3WPGYPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmoZSdWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmoZSdWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BED1F00A3A;
	Wed,  9 Sep 2026 00:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788913869;
	bh=0lpJ7Ts/WqeZ5mZKljNcLphz9CKQteOXg8TKoqD4gTs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=OmoZSdWa82KBDU14dxB/JZdzrSl/2wbwYFEc9kukucIy2wbpocNOYD5lVacTEeCr5
	 CYHgsCg9sE3mXLjwO4B2hrMtUENLWuswzmBd4tRsddt5b0uXGyZNEFQM+846bte+pu
	 QPuI5z8IXbJS1e/XkpnabABbSkdChfKCieCTvnixT1Q0W/fzzYNOAoJe65ifyEWP0C
	 kFX/1jqk9T+DNmf9r7MjCHLQJXlDbfWpe7D8BR+FsTn904EKJ0iEA98vSVBq34qCoz
	 n/mWcD4GDh4TmIpEY+QH0VicZChc6QFMx3WsIR2m4GdswivK1z4dGwqT6NMIRs3Rog
	 rlT9z7VbBHuGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BC3380820D;
	Wed,  9 Sep 2026 00:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] selftests: drv-net: Allow cross-compiling
 the
 hardware tests
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178891380788.78759.7423905077118012699.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 00:30:07 +0000
References: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260907161438.755125-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, donald.hunter@gmail.com,
 horms@kernel.org, shuah@kernel.org, matttbe@kernel.org, sdf@fomichev.me,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Sep 2026 18:14:34 +0200 you wrote:
> Hi,
> 
> This is the third version for the ynl and drivers/net/hw
> cross-compilation enablement series.
> 
> Changes come from Sashiko reviews, that detected some Makefile inclusion
> ordering issues, a stray 'Q = @' in the ynl makefiles to have proper
> verbosity support, and some commit log rewording.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] tools: ynl: Allow cross-compiling ynl and associated tools
    https://git.kernel.org/netdev/net-next/c/917f713b4ec4
  - [net-next,v3,2/2] selftests: drv-net: Use cross-compilation environment for the io_uring check
    https://git.kernel.org/netdev/net-next/c/0c5588740e22

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


