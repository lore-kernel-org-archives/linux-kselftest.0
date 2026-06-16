Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4408A3B6C03;
	Tue, 16 Jun 2026 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608920; cv=none; b=cpnGLER7OFAursfBVxjZAqF0eMWDnDXUtvp5zQr68RkK1P5IQa7G5FsvqODFJV0SMjOLvBRivixzYEMO6lByjBU8wZfb4+ZQHILwAzi3kKgzuS7n85qSYzjAc0r9yINvpNOQyPJKQRwvgFwRMHHixMEOw/9YNzPjCF2eZ6I/oqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608920; c=relaxed/simple;
	bh=qpH5JN3YTce6VROveKgC2UircTeRVcgb//BKzT/Zfu4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qPbV2RUqH0Fq381kUuCf1+gb1uFWJe8heeKUFHV7p8HgZmync6QkTyqcqXgfoJrmcH+ZfOSVX4p4dlbkOb6+p7jp8jHzjTEfcMPdytyBG6YbTXJEPjG/w2HN3zaE0Slu266aWgxQpF20yft6CmUXiZynQtmPe7yyKSiLDQF8iao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTfb/xdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTfb/xdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0A41F000E9;
	Tue, 16 Jun 2026 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781608919;
	bh=AibD8VqPIgSvZYNyt+MZC7R0Ik4Jz9qrtEfeUZFeNW8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nTfb/xdWa1A7gJF4KNTdBfYoq8SqsTR6LsyDvLEgY9hmuNsv3xWmAdvHZQVUlDTFz
	 kOLbw30lDgCk8WaLi6Oqxp29Hib18dll8MFRF11tO71ckaSAKvK7gE0XuxWufZFDx9
	 V1wBzyA9SvrRxsWHz9r83WRLFK6nq281CYKpQvxJNe8kJb3UglHg0DFFS2h7qWKq8q
	 ndldtYOEDCCZUTDtGDY3SLildUHn0BTnTmz5WrtD5rSdtV7ynjt01xPVvCPHA9O323
	 b28MVeUBJTt+C1guJKK1ibBUcbLWP7oD9Nlwxq8kEEdkbMWcQjEF3iMB2ULENlAR0z
	 t55PATsPlJTLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 197C53930997;
	Tue, 16 Jun 2026 11:21:55 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest update for Linux 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <6cc7e08d-ae50-486e-97e1-6190f0790c6b@linuxfoundation.org>
References: <6cc7e08d-ae50-486e-97e1-6190f0790c6b@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <6cc7e08d-ae50-486e-97e1-6190f0790c6b@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.2-rc1
X-PR-Tracked-Commit-Id: 5f4974231fb3656c15a82faece9f2303b8c18a14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8b308f96484e37d92d2fc6b72b091f60496c000e
Message-Id: <178160891363.602301.15389113108430367426.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 11:21:53 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 12:35:15 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8b308f96484e37d92d2fc6b72b091f60496c000e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
