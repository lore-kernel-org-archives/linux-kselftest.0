Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAC82744F;
	Tue,  5 May 2026 00:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777939891; cv=none; b=fcFEbmBjSlRrys0VR/Qc6lgM2QPSks1EzVosFhnAT+3FzRVNEUpWe0izBOxceWSXM8GC6FleZu2mWlILgUrP9obGrV2xbon0B9fSnTPUW6O27Pt296HBfdPfO3J1pU59q9oBfjYB/jj0JESGD1br+GzIgRlKKvvLOG5OOIljUwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777939891; c=relaxed/simple;
	bh=Wmyl7wTS2tjArt19q/s4GexD+a6b8MB44Rdc1yfbv1w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R0TrWJRDoBbsfLnmhkwoYJffV2WV+yCweNgMTfqgHst8wqFmAOFytqbxmeaUpItNeY17roe1+dTl+3mubitsJKYO3DfWwILqCMwQaKQEF6R6BHIgwvDlgU/pP70CiKvzvoOJhpZJKkc0DKAKTXkhSvJVGKaQfOEM1D8Sl6ffNes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lr7SB1+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lr7SB1+U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53BCC2BCB8;
	Tue,  5 May 2026 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777939890;
	bh=Wmyl7wTS2tjArt19q/s4GexD+a6b8MB44Rdc1yfbv1w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Lr7SB1+U+yGV9UeYzMrYaUonN+eBbKXV86ySoN5sggVKrJu8usynye3kGXn4h9ocD
	 PRO8Znk/IlRzXWwQZ+wFB9KcVtWiTC+Rb11NiSbybpMKC8tvl9cW3B4fo58HHF+41N
	 pV0jglcqEOXD6A159SoNT9YmxfDHJ/Hqw6Z4cLUb857y9JoWuIWFusC65Hm9M7Km75
	 NAV2YgmNUi1TRnpwPoOkKHiatmSbF875QWI01BoyOYVPB//GAgCH4GtfEljomydgTE
	 WoEbOXon/BviiVO7R8WQUkrD/LmWAy/tli8OD/vsnwLGJ6O4xl2xv7mp7JeV5zSPPo
	 YohGB3vpDAuzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DF23930193;
	Tue,  5 May 2026 00:10:43 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest fixes update for Linux 7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <654e6402-f4c4-4152-af74-6da4bc755ddc@linuxfoundation.org>
References: <654e6402-f4c4-4152-af74-6da4bc755ddc@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <654e6402-f4c4-4152-af74-6da4bc755ddc@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.1-rc3
X-PR-Tracked-Commit-Id: 465b05bae5ac553c13315681c1490dc565337771
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a293ec25d59dd96309058c70df5a4dd0f889a1e4
Message-Id: <177793984170.1356778.4175027144236664192.pr-tracker-bot@kernel.org>
Date: Tue, 05 May 2026 00:10:41 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 4 May 2026 14:37:47 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a293ec25d59dd96309058c70df5a4dd0f889a1e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
