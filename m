Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8B85908B3;
	Wed,  9 Sep 2026 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987677; cv=none; b=NueKSXgPPeFQIGbEL3VOg0kvFc4xH8YbL0UbDGgKQYNtXjwYjvKYN4UB1xG27Yad4Bzz0ptw/0XCsnyskt1TjgCnMmEQbF1QF57cBk8Iw1s43Y03r3upVddPAAQf/4Y6ArXptIvio2AY/4D4T9diBDSm6I2FYrKoOaBuA21mppc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987677; c=relaxed/simple;
	bh=D5HcsU1AsaA4wCmXb2wIEqH2gYO/+zTlIychWhNzhMc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nD6KE2NYiubi58FKDp/4LyjGGBFLdjWC6IbaVGm0sbzPFcaI641WOOJygHfleueXp1gUeKrcI+TReK+zeilTK++rdSKsTYfCoSb76WLQJoqXPm9/72Ng5s6oP2FIpzSBbQCg9YT57eG/dKQ1L72L/ui6sPZF87QgYJDS918M0as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw+paRf5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw+paRf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EF71F000FF;
	Wed,  9 Sep 2026 21:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788987676;
	bh=5H9GZ0YPFX8Bt1kpBCOZ8gqruPOVEyViaoqnDI+sEHI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aw+paRf5VhldFuAhfdzi9Ur49Gs96TyHpkUMhtsfe57JvYQDaVIpMKeQgEHbDYuhp
	 TlPJqCWe+YMKrzMkieylo9Nje49NmveBaaj8rQyr8hTETvc2gHqATGqEGpjZ9rtbSc
	 4OqJgcEhDNoLKp7AkfAiirkGpdrz4zIwrIoZ78ukVc+OWpYEghe20SwuIRoqDSMy0k
	 M60L4WdXiCZNtn3etQOnih+DU4h7AWCUwgJpC6+/EJxePkScLJKgeQqqX9TyzAhj1w
	 3cdQ31QOEL7Drlh9GufK5IDPGnNsxn6vOEPbD7cXLjR5Z66n9RC00cMln0h5VDqILv
	 735lMC18Ih8Iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BFB380AAFF;
	Wed,  9 Sep 2026 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: Skip so_incoming_cpu on
 single-CPU
 systems
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178898761388.1057294.11276388701739327650.git-patchwork-notify@kernel.org>
Date: Wed, 09 Sep 2026 21:00:13 +0000
References: <20260904140334.562593-1-kuba.pawlak@canonical.com>
In-Reply-To: <20260904140334.562593-1-kuba.pawlak@canonical.com>
To: Kuba Pawlak <kuba.pawlak@canonical.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 kuniyu@amazon.com, 223556219+Copilot@users.noreply.github.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  4 Sep 2026 16:03:34 +0200 you wrote:
> The test requires at least two CPUs to exercise the distribution of
> connections between per-CPU listeners.  It currently enforces this
> prerequisite with an assertion, causing all test cases to fail on
> single-vCPU systems even though no kernel functionality was tested.
> 
> Report the unsupported environment as a skip instead.  Check the
> prerequisite before setting up the network namespace so skipped tests do
> not make unnecessary system changes.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: Skip so_incoming_cpu on single-CPU systems
    https://git.kernel.org/netdev/net-next/c/5bb36cd12006

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


