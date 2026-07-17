Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BA13E9287;
	Fri, 17 Jul 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287237; cv=none; b=lqphoKZOvx7FZv/6bA6hFdOWm7LFGj0iWeo5Sp+/0ILARr3kWTmquVuBvVDEwp30Uk/HWlVvwYmWFitS5gobeHeoNrzSuXl/DS3U+4uM5jDZ/oZ5FgJV1TNCDaByVVloMEmAs/6P6k1WMFykwD1fMD+VLd0CCai1sK4z1k9rYoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287237; c=relaxed/simple;
	bh=dYX1Bfyk+gHyr/KTh2673NrOpuGbzAxe63C5Y1YFfgE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=owzWrAk8iHfE441ZmrLl/kZfB2jXSKe3DOvB00lXKgozdxFmhl4VxUiR7aTzMS8JG6PFhiQahNrW8jQG8MO8L1Ugdg6q2kvoughHPWqyZ4NZAqWjsgooXgW2ox7IHsOUCMHfE3pKaKQZMmgB2tn6E1JPdwNlWblu9eGpk/BtCwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCoZ8dM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCoZ8dM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF2C1F000E9;
	Fri, 17 Jul 2026 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784287236;
	bh=Lwblyc6e8IcRziwZjm0LcWvApZnkJLAU2d+UtIpgZYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=UCoZ8dM88NjwLttG7W0g35DdYCcn0z16aJG0I9QvJ3Hsx1Sy5YA+H6EUk1nLhXIEY
	 x0mG9+Bbni1V2+IlOj8+B4/Uf/zNRQaFC3aB5c1SYyePAgvcWIARViNt6y42GFdEM/
	 5xmcwOYbMf65Q+yyY6hHe840ziRgNj9PRKLJeIJbd+OC/dyH5BqYyIgnCgYXnl61E9
	 uYh45t1eArx1jbWjpGr7FEzvFr9bcjtFhSjvlFB+jinJnGQhvgQ9eWxDOWRkvPBu0X
	 pKuRF5ROT6Ig9roVM1QVOG+x/qq/f7Rs0ewux92T++/DttJrUgtMTY0NAXn4BVSXYm
	 aibrZKu3/hgmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A91380CED4;
	Fri, 17 Jul 2026 11:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] selftests: netconsole: only restore MAC when it
 changed on resume
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178428720839.1673922.13110048586333988018.git-patchwork-notify@kernel.org>
Date: Fri, 17 Jul 2026 11:20:08 +0000
References: <20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com>
In-Reply-To: <20260710-netcons-mac-reload-v1-1-3fb1bcc70b4a@gmail.com>
To: Andre Carvalho <asantostc@gmail.com>
Cc: leitao@debian.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, matttbe@kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 10 Jul 2026 23:19:17 +0100 you wrote:
> The "mac" bind mode reactivation downs the interface, restores the saved
> MAC and renames it to trigger a target resume. This assumes the recreated
> interface comes back with a different MAC, which is true under
> MACAddressPolicy=none (as on the Netdev CI) but not when MACs are
> persistent. In the persistent case netconsole resumes the target on its
> own, and the down/restore/rename flow instead drops it and fails the test.
> 
> [...]

Here is the summary with links:
  - [net] selftests: netconsole: only restore MAC when it changed on resume
    https://git.kernel.org/netdev/net/c/04aeddf2dadd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


