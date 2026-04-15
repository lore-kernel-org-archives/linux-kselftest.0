Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489091F2380;
	Wed, 15 Apr 2026 00:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776214729; cv=none; b=gR7dTlAMp9kaAyvWyHwLmyJO/xkjqKTAmpAn/We9WBQQh//pLkMcX4a4BGedetv8aAVOxmRf9uVe+/js71dIwYwLhFxibIRVJ0J6eMCKxx9R9Czrw3hcKIsJnw6pSLjYE6bmclCLzlesCMIX4xIS8t/MjhAtHw/gWWcXnvrQLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776214729; c=relaxed/simple;
	bh=3OolNHxPxnCrtVtXcKrRqNcAdU3WLbBDaM+0sMuMpjY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=m2yBP3+PTdwKihGzayjNLeXCoD0Uvsvr7TU/92L5pBhjzysVvjrrxP51jqudQkS5BrBWb/DoT2q/k/240WWaMbpbgx47XPbOf7G4Wb+wvWRrgpv+oMhOlQ5l9tj1/0Kt7rz7N6DEl3GG7YdMh8Fs8f9XPkc/TmIzFHyRciq6TRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxPMYH9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxPMYH9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D1DC19425;
	Wed, 15 Apr 2026 00:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214729;
	bh=3OolNHxPxnCrtVtXcKrRqNcAdU3WLbBDaM+0sMuMpjY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NxPMYH9Ur4kmD/aJfgKI94Z1RzfBQaaLRyfKu6aNlhAvP4QIodhkXFoEZ6N4JXzsA
	 rfoqPP3eDGJErMPh2KbcHcYhTRsNex35yrK+yKgcidqZjxBB1oAZaaZMd/XHpZ0Q6F
	 9zSkzj/ohNlAlje+XjUqCWWB4wd22oR/wUlQssNXVNEYu+Q/brSIclJBHjq6plIL5O
	 u9C84vKn2TM2bNATk9Q/i9T7h/YhdhSDejdDxq16/HHouLRKf40D9KDzsFg7Aw5r8p
	 uG2I0bHa9WPUkhtnDaq7MRvnplvH6xYbAU5p49vPcpmcnHD5a4XGRxq4DPFLdxf/zO
	 AFcrPeC0IYxGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF083809A29;
	Wed, 15 Apr 2026 00:58:20 +0000 (UTC)
Subject: Re: [GIT PULL] kunit next update for Linux 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <2fdf9e53-8608-43bc-9501-0b262fa348de@linuxfoundation.org>
References: <2fdf9e53-8608-43bc-9501-0b262fa348de@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <2fdf9e53-8608-43bc-9501-0b262fa348de@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.1-rc1
X-PR-Tracked-Commit-Id: 8f260b02eeeffbf2263c2b82b6e3e32fd73cde2b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6198c86a975f7bec992459fe4506846caae4e41a
Message-Id: <177621469909.1543667.9682779228175520599.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 00:58:19 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 13 Apr 2026 11:01:43 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6198c86a975f7bec992459fe4506846caae4e41a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
