Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30762D8DD0;
	Tue, 16 Jun 2026 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608918; cv=none; b=uC/FiYIuQH8wxaWIuvOogPCd8/Zt55ZkHOSN+/unpuOqGnKuSeDku2ZCPJiSexjMkBqID82xv3LTBN7gDCI0jyzHaX/aMkUXRygdG2or3RLZaSIWL3JDqU33qRcgIHJdxRYvt4prcI44+tRzvRIE/dzedZDdeMmvxUhNeJ8W314=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608918; c=relaxed/simple;
	bh=bMh0RXcvy2pOSNPLoKLhKtok4PvgHmGug0IqVDqI8As=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Xrat9sAW5Un3tgLy2VIzv6VPXFEQxq3RWXcpuBHqBcPVfeT4XDAxC5q8Kwzgdk3AGaCxbk7yNaqrySXevVU5x30K7VdNW3qwX1spWeg7DSDCcJAxfIrlKKhfU5tj/ZIC+DEjWIm8KFeqTItairoahNgHweYUrh9M10nYaINAiDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1fS5B9a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1fS5B9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679EC1F000E9;
	Tue, 16 Jun 2026 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781608917;
	bh=hsgU4WChb/Z7VD2n/RnBACcDX9+nXFK0R36cP/SevDA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=o1fS5B9aULTCKvHxktUNU5+NfAS79JFkItBVIY6zl7AgvtFVlKRVMPeoqjx6mnR8u
	 YcqnW9D15xyitmsjCgIJaiJmasfudoknW7f9NAmBKa2AsOSqJfqYbuT+HZE9Zu7aAG
	 3kkONBMQ9OCDuH+96rXLICe7X0vyupHbi7S71XDYVX3GSHYbBQ/fTPCBFO4XaSerJm
	 Hr8cmyBrijsY9eP+m/aSS3WpJtTVxyLyKB1n6tB9kE9N8lLHxvAL5bZY+kkgZI0Qlb
	 NXfyCfhICqQQu0rNdLtOAIgFBvYNz55gsHz1ecqFxNKBC70Tqd/fx/jLl/QM3tHhVb
	 HkFBPrG351YfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AEA3930997;
	Tue, 16 Jun 2026 11:21:53 +0000 (UTC)
Subject: Re: [GIT PULL] kunit update for Linux 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <1dc9d2f5-881e-4857-9255-94dea033c9a0@linuxfoundation.org>
References: <1dc9d2f5-881e-4857-9255-94dea033c9a0@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <1dc9d2f5-881e-4857-9255-94dea033c9a0@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.2-rc1
X-PR-Tracked-Commit-Id: 29afed142d64e181749214072315c976f8510bd7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42eb3a5ef6bc56192bf450c79a3f274e081f8131
Message-Id: <178160891185.602301.8948005041580585724.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jun 2026 11:21:51 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jun 2026 10:36:10 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42eb3a5ef6bc56192bf450c79a3f274e081f8131

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
