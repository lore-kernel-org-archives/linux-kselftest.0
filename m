Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BC356771;
	Mon, 11 May 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539423; cv=none; b=mNdw84Z6R9SRimpFs+O3K4JyQnOsOKJM3DY4MSLaIAMZREInWuBQvdKPa7aZO7KQZpE41yFBPXhfuo8yJ/0CUGYswz8y6W+yFWrA70VjT1OYBAyE2Mrz26CS/rO8iMcTrTOnjUZ0HC2lxQlgDVJxOYSN27q91zBlGNeedze6/tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539423; c=relaxed/simple;
	bh=iE6fCYjh6nZBmn/sFKSShgObnvw3FHyD3lza4Tnnwlk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cScNRFDSpkEAC9EERypl0JTcoaD/PqLpcd4TOlKJweq4t7oavTFn/CK8zFRiDFexiKek1Z/k3K3YOezDXN7cgTGxFfq1/+L0WDs8xKqeNxAyDDYkDPrEnkTSNCLyE0pMH6N1hHqWFXA7Xgz/0CtzkLIua4M3NCmJlYfWgRsRo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux4eTbUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux4eTbUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55B9C2BCB0;
	Mon, 11 May 2026 22:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539422;
	bh=iE6fCYjh6nZBmn/sFKSShgObnvw3FHyD3lza4Tnnwlk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ux4eTbUCFWTzNzu+necApj5ykb/xPZrgWnqnE2UF6P9ThK8firLEFiIQX/8BFRJst
	 LdUUIdAzJwn7JMu/LQ1nuSTnRPQqnKRfgLlSi7j42JxwkR17WVmOjb6Uk5XBLHhCn1
	 V8ZFXR9Mq4WG/JsV9dQSH0MzNwSEVfpn3URl52U7+q/lQw6rnQ+3Xlgchd20XITE5U
	 0pkTMiAvsRoTssiBvuZu3/Yvh5AjJDkt0mnRQnXaaQouXPBPUAqBBomPGJ2ap2DGjG
	 yMjA2i7DNwGjCYW4QCMC994f6UJSpfWBuldZsIGXKuoBZbZ/LG7g9IHUmcQwgMmiqQ
	 AJsfEoeJfyE0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D05B39308B3;
	Mon, 11 May 2026 22:42:50 +0000 (UTC)
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ff508236-2150-489c-a815-66961074fc60@linuxfoundation.org>
References: <ff508236-2150-489c-a815-66961074fc60@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ff508236-2150-489c-a815-66961074fc60@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc4
X-PR-Tracked-Commit-Id: 8f80b5b227ef9ea422080487715c841856339aed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50897c955902c93ae71c38698abb910525ebdc89
Message-Id: <177853936904.2491237.4989055086711022455.pr-tracker-bot@kernel.org>
Date: Mon, 11 May 2026 22:42:49 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 11 May 2026 16:16:47 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50897c955902c93ae71c38698abb910525ebdc89

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
