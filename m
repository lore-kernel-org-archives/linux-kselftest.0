Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271378;
	b=bB2gQVwQU4MmhRERyAjsm5XjGIQxGfazMXItVDraNzDCPAbzLEbFG4hzW3m71o6rrXFo
	 HKh7gpgQsl0h3B2qzVuMhLz9Ax8A4VTNaPKVuZb1MCjq328Ktuf9uLHOvGQXTmWdR70ul
	 NapafGKkyQZLQeTqvTq74Srw4fwO1pudCihlYmzwaQcAbTEBesX56JyYztSRMKi57Ree8
	 i5HqAvs5NwBRGdObklzt81/KbyRp1yP5sz3XJ5A03Cp0sxSXFllNuZiAabi1fFBgJk0dz
	 8Q4O/TKozm8AvP0GRUa7A7XkoPkCJ/kvUrmkaK59FJ1mOJlgsfevCWJ8O2SCwKjpb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271378;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=CqdI/d5wgJOUaCu123F2dzY2ajSgkaE79+RY2xgj2nc=;
	b=K/NI1J7xG3bfeoFB8j9ZyKBBXmBKnL9fJ8B5Eu3p5kQjVW9jCekvcmn81UAAD20kNozz
	 HpS5tO0sUuW8AKkM3pFuh7RiiR4ir4D6Hoa+HKDrs+CbUQldjMffmYPt+1cmX0UsmqZ4Z
	 s+yr41dWeD2ouGWEyRHEN1eLBNXyOw3DsHhzdwym43w0KkkmXwEH0R4z0GAvZGe9o/2Xz
	 mEgBA5vir4F7awJl1JOOPpTotzvXpdUJsifmI4ei+HfUwOggERMrj6U+PBZzmlur/TVHT
	 1M4HVJ1C82CBCgEcI6jNMCPTnzoQSfw/Na9chSpFeUX/Mq1scSzTl88LjeIiXv54xLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nC7pdmQ0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086D606A325;
	Tue, 10 Nov 2026 00:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nC7pdmQ0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6EF1F0089F;
	Tue, 10 Nov 2026 00:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794271378;
	bh=CqdI/d5wgJOUaCu123F2dzY2ajSgkaE79+RY2xgj2nc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=nC7pdmQ0OnxxXP1rEFBLBk9m5bXrd5KpKNU/NOhh6d9FkCEXihIca1/1eRk8nMXQZ
	 jCS9apTMaqlHWUWzSuro+ciUTOyLYEPnzWeXPZx+na98poFy0irKuw5sB5Q3pFWPu8
	 JsP5u0KmFhsGZjkuWcOg8Tev4TOAgrZC9BaYP09L50sW+HviHeuKHwbidY0qfTKkV9
	 hQXwoip7tCk/XIatFhPgWM/AX5512z5TaiNX/tKir/vinLsutjggG9/TiqQ9PGoO+o
	 kQqGlAal6FohH+3ePLz1O2gQn6zSIIgJHQizuudnhlMuCOcs8ArpBI37vvbpKYwwOo
	 p4t0XTTqKRnUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2129B391AFB2;
	Tue, 10 Nov 2026 00:42:58 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest fixes update for Linux 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <65ee4aa7-b581-4b60-bdda-e91855499ee2@linuxfoundation.org>
References: <65ee4aa7-b581-4b60-bdda-e91855499ee2@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <65ee4aa7-b581-4b60-bdda-e91855499ee2@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.4-rc3
X-PR-Tracked-Commit-Id: 36990c8fda77d918b1e52d5d6df3a144b552d86e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3dfbde62cf1981c4638939c159dfd087b7a72e9
Message-Id: <179427137663.3573198.16939057349089589896.pr-tracker-bot@kernel.org>
Date: Tue, 10 Nov 2026 00:42:56 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Mon, 9 Nov 2026 13:49:17 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3dfbde62cf1981c4638939c159dfd087b7a72e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
