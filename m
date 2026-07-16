Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD4C2EBB8D;
	Thu, 16 Jul 2026 06:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181607; cv=none; b=RxJnMN0ux0ASlp5MMjj7M37J1oNAUOsDoUDRFOvpl15nSC3fGfCegn9NXwa4oU2vvnPZBiqbNnmcQjnAQ8d1sLvEDY6BPcN4lcWfXxrP0ESO0sp9MqcaseoHEs0KliobPFOc02Mz+r4b6xs0oQ/g3M1YH7uD0W870TBQD2JJYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181607; c=relaxed/simple;
	bh=EDqTNaW5zCh3u5LCg9rd8SfeAgtf02iC22k+c8GRyd0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UBbZ3GKtyBkXlc0v0XDqvF3itu8EflWxHEcH8cL5w8bb/TYbSVhG4wKhbcKYqGd/OTP0nL30n7sh9eZDwyID8YZ+Gvj+5TKOdb1Pk6cg/d7sRlm3B66cqxhGlawiUva2393F4xiIPpp2XfSflp5GKMarduAyxtO9BQxu/UwzuxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMH46m67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMH46m67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B821F000E9;
	Thu, 16 Jul 2026 06:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784181606;
	bh=eghLXXpSFPG1mRyJcJRLrbVLmL9jlMHEUFR6pD0uZRg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VMH46m67CsNTxZxhX6Hs3cg3seKc0n27RM/NSVqxm1LCHOHpE5HCMDRglNtoYFRjS
	 ZHLOqv1WTy3wIcviivwLqg9GIiwLhFiA8nz5cFHd/XoBvVh3GgaxAPM/OZXGltlElX
	 RjqhwM+5BqtOtPL3blPLI8DU5NxN81gwwyignbmKvUvIcfyENZzVVvRnIr84kT7PmO
	 sF9KHrOgHIPNFMw5FrFxci3mH9WgRCHGcWi4ommZkR//hF08w8ro6/XMM2bxKFP07Q
	 7RtojyxJx3hZDRB+ZhAByn82qzTji2a16uslNV2ir9cCOPsJZ7oF0UWpTVkH0ZYv3F
	 HmXv0HleCbayA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198D2392444D;
	Thu, 16 Jul 2026 05:59:41 +0000 (UTC)
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <362433e5-8281-4fcc-9d85-09f75a7d97a8@linuxfoundation.org>
References: <362433e5-8281-4fcc-9d85-09f75a7d97a8@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <362433e5-8281-4fcc-9d85-09f75a7d97a8@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.2-rc4
X-PR-Tracked-Commit-Id: 5142c56651578abc346d6c17f3fb919b9ffbb317
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37e2f878a7a660a216cc7a60459995fefd150f25
Message-Id: <178418157950.618907.12976771784743402774.pr-tracker-bot@kernel.org>
Date: Thu, 16 Jul 2026 05:59:39 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 15 Jul 2026 16:56:04 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37e2f878a7a660a216cc7a60459995fefd150f25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
