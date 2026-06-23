Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A893043C9;
	Tue, 23 Jun 2026 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229235; cv=none; b=bPxn2JfIhzVasfLKCssa+mDqJt9Z280+RyS8/Ar3LFZCphbh7ZWm4U1kADz/GQGr8gaf1M5L44fMPVVfPaL3zYh0om2xsnuuib7nZ8zOaBfYkIPSUm0UDxqownMIYuH1R2ypBgUtQmL8FrRp6JGLZU+1IKH4Xaa5qsZyRVKf494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229235; c=relaxed/simple;
	bh=HlkxQYK3BfhbOPpoPAa/rG/cWQlspiWahf8iFIxDKAY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=k5QxGoBqW2x9Fr46M9LKK9uLA5R5qHKYAakxcck4A4nk0x37qri4/ZEpWka/dQPUi6jv9SP2EkOx3x9HrFFwvFiF442tVCqoeC4PO/T4dcXEgBppLODpduAGu1ARpef4HSwS8dY+Vvgf3hRfuCHWW7YPmySTA9f8w2XW1MRVM+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJeaFzWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJeaFzWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7182B1F000E9;
	Tue, 23 Jun 2026 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782229234;
	bh=/PB9Us/zNKWfarWvkBWKFbAPxT7O8eEO+MshDy4VWLg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OJeaFzWxHJKPBXw5PrEJP5nXlDXTiaRwgK7aQe3KoS6RT9lxkLDMSFRfO9kEW23hc
	 wSdb3P2E+TV93N9nD5V4cTmtaf0sVGGENz2NZufUs6EK5moejiL7M85NlZTpmuMocS
	 DoC3dQNsTz8rwBKeVUasQa6qgtSgWzHLny/Hqz1piNYIlC6BpOM8Gdu7oYBRX2mPgg
	 8oG0hqgVMX8yL8nBzt0ss/JAMhjzNHr+FFXuAf9HaO45PK3/QMoTFv9wjigL2n60jb
	 AZnJQp5c49PKwIsJtw89aOpxLWEYNuCvOK2IHT3ZUy+C9Be4mT7SjOSnzEsi6cwSFH
	 CZJKwM4g7Iw/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AF03930E57;
	Tue, 23 Jun 2026 15:40:25 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest second update for Linux 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <e8e631e2-cbf3-418f-b07c-c13259d6c010@linuxfoundation.org>
References: <e8e631e2-cbf3-418f-b07c-c13259d6c010@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <e8e631e2-cbf3-418f-b07c-c13259d6c010@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.2-rc1-second
X-PR-Tracked-Commit-Id: fbb7ad31ab376c5101b2ac7205fad0344fd2de60
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3eb20a97b315a9fd5fea33c207c51823f22c2b4d
Message-Id: <178222922384.2292721.1638557079265839648.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jun 2026 15:40:23 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 22 Jun 2026 09:30:32 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.2-rc1-second

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3eb20a97b315a9fd5fea33c207c51823f22c2b4d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
