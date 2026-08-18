Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B963DB321;
	Tue, 18 Aug 2026 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787025496; cv=none; b=hopoi4G9olTynYSnojX7yqOvfE8Le2sOFLZzmsyqnqFIdknsKirQm1efDRAdsHfBVFKX42kSLIpokDoxCMzOCIKY9ZcxHQwNlhQRVcg8w5JdFsjYIsVlMFoSGKr2CmXFGvx1/CovnhZ+pRYXFKNZQmCWmfA7FDe8/thBgYTqUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787025496; c=relaxed/simple;
	bh=v9OOvJM4dhqkc+fztf3xYgdu+bwRhA8UWxb9Fgej/U0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iUNb7zCCoKBNPI/rybyoPjzcSrtmfSuMIGwUjFMNMMHxYtRlbTUEgq33Lwlg3NV2QAetiwRSM+b9rrWVjbqX+VA8LItRG6bEUqBi5ksah5ByxlJAGc7+QQkD+aYIYile92va0jNSDAAlqZKEqfZK/1BYACmjNlGtuq9Rz4hQzbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mw+8Z38H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mw+8Z38H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD85D1F000E9;
	Tue, 18 Aug 2026 03:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787025493;
	bh=p8t0bmQkfMj61i+fmv3uEeoidzEOvzKcA4ud/yqIGGU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Mw+8Z38H2g3bxCnnGokuUmNH8VmM/F6k38Q/QNVQKi6Cm93ZQ+CCja/D4c2bzN3QB
	 yxd9avAQhmavvY12b67VLrhIuTRO1Pept/UU8WBqD2STUpqVVBnvxEVfj4xN5wy0aR
	 LpqS0iTwbEWxaW1mLD3DbpPbX7lbAyLWz45oeg5ZMhu7d++4Ing55iQvXzr9Oz//Tl
	 xGBbwRjxXuCo4Kz8R2k5jMP+uZVC4RSbjGlGB8a7GmGbXVmnvqWWx6F0IH5cOOrq96
	 Ec9LEbbZkBNC8G8z+vwPo1bgvDDjpDLO0HfAcHYWI9xFGLaLB9+UAgm+ZmTYuO4cqo
	 3OAw1zAyeOYgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A7F3926381;
	Tue, 18 Aug 2026 03:57:26 +0000 (UTC)
Subject: Re: [GIT PULL] kunit update for Linux 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <9fcbd10d-8bfa-4d90-91cb-f8c43f12f87e@linuxfoundation.org>
References: <9fcbd10d-8bfa-4d90-91cb-f8c43f12f87e@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <9fcbd10d-8bfa-4d90-91cb-f8c43f12f87e@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.3-rc1
X-PR-Tracked-Commit-Id: dea754ded9518b51740c417d2c1e02ff540784c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd89b0be5503dbbbdbd53c8158ea6ba0e57357fc
Message-Id: <178702544535.1862718.14337707566466108472.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 03:57:25 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Aug 2026 14:30:18 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd89b0be5503dbbbdbd53c8158ea6ba0e57357fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
