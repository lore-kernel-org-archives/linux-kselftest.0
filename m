Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9F3A7F74;
	Tue, 17 Mar 2026 23:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791973; cv=none; b=S8/lcDhNgY9d6yOS9GafTLWpCyUpb67EE/W7Rx+SZSlIXLA2mmfMYcHY8l8meCskyITju7FlmWme9JwnS1R6sE0X6ssSzxWPtOOJiYsYQLJLNcO+859pjRnUlb7I+gkeoKzN0n1PIcdsi/mKvwGL+IGSJ5xRwOaoCizKVU1KP4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791973; c=relaxed/simple;
	bh=evMhGjZZFCrkatb7cywTUrU8JMj6gSWMm0iBBr3Jn9I=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uPzs2DbjTpDPdH+uVEyO1WbG5b0n5u5uIayw2CibNGfdih1zZXkCoCcCOyw6jpdNfC831/tGFKrtEEWyUhNwwFvKbPturkRtRylTpJVUQoRMx7OqVfKqWY/sFZVFdKflHy42pdxbOtJ6BNNFaYi1FUXfhvcg7Jn9NRoEZiIOIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZzEweWM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZzEweWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70791C19425;
	Tue, 17 Mar 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773791972;
	bh=evMhGjZZFCrkatb7cywTUrU8JMj6gSWMm0iBBr3Jn9I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mZzEweWMoMQhjZEsrlwE39ujUdjpc4C8AEyzYQ5vr49tjvwfqSuMbqhItGoBkWe8s
	 RrO4kFQoerScYaDkKxurFS6fapg7ofF5G0KnISx/NALWAUvc3thylmCQn91WbOI0WJ
	 vkKrkAwHNCMeaN2ovVcy3KWlc4T+NnrdwCs0yJmVf/Zu5Ldb7vYt9RCGBAClOmFl9C
	 CP4m1RoU3gal7Ixt0+6gHNh379D+8ZiB5QSWZLQMaekVmU6jaTaZvL8bEMwrGLA9m9
	 S/RZ6ILZRr0bvXbQ9bA5+mkoVG5BHIUUbZ2Imq8tuqKAcIwOHvY6ztUvWob2PF/60x
	 WQcnJ1wiX7DLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FE03808200;
	Tue, 17 Mar 2026 23:59:25 +0000 (UTC)
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <359e8d15-726e-4021-8a75-9c2eba0a770e@linuxfoundation.org>
References: <359e8d15-726e-4021-8a75-9c2eba0a770e@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <359e8d15-726e-4021-8a75-9c2eba0a770e@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.0-rc5
X-PR-Tracked-Commit-Id: 8b8f1d5e350acdf972b6b02e225d9e14c600f7ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e22d8e18f37059678c2f34ab3b447b8c964c6bf
Message-Id: <177379196427.62687.1263604968553742207.pr-tracker-bot@kernel.org>
Date: Tue, 17 Mar 2026 23:59:24 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, david@davidgow.net, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Mar 2026 17:17:55 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e22d8e18f37059678c2f34ab3b447b8c964c6bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
