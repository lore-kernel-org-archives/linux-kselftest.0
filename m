Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247991D5160;
	Tue, 10 Feb 2026 00:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770684607; cv=none; b=U8NvarXqLm3BxJ3/0Q30dSzuh7bYHvuZvoAovaKzvbZ2lRgC4bMlEfi2PWSRFpVReziL9shV8QKj6DLMVFG29QSUWyBqStqNxiHtzWuZ/dqsTT8dXgNOFC4eCWNEXyaK6eh01M8PSfTxAMFFSvSmhQ1AwplJ5UwB8x0jJVUgrnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770684607; c=relaxed/simple;
	bh=s2e81F7iyu1gBMKf3T2kewsAInT9msLlqWNghOCTa1k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=g/vcUu1Kh1FchK/hlbOil2pG+HgX3rpI07vD3b7qR1gTuI1CM/30JVpYLrscp8T44zLEe1xT4dPUD+Ep0QZiOrPzX6/J8SuBmQUBNk2BpiqUBZw7aLOQ3qK8VmKNHoLxWiTFlbGDxxAnBa4QwfF6bFsk0WPj8mvQNIFONTCCrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDLIwCfv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDLIwCfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06088C19425;
	Tue, 10 Feb 2026 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770684607;
	bh=s2e81F7iyu1gBMKf3T2kewsAInT9msLlqWNghOCTa1k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=dDLIwCfv4tY4AhZNKhQjfKSjBpRUilZUiv/OfuUQTM/lXMVOMxtsa8XW1aVi0fqDc
	 +yfNGm/yiXHYWzCDYdHwgjiSrST2TP0Tpap40i/tt0GBxY+uOLhguqX8+AygmwsC1c
	 elcCPcHSaOYOXDRTcZFj/qmBmInUvagwkJQ0vfGxLgZ/igTxv/rLOX/o+UiLCIBvHC
	 P/DG6EhEeyzf65ZoFebpxhU/5sv6eqnjwLF4c/soxefqC0u3u8XuCSHeaPjQfOeezL
	 cTRbI9ClJn7ywLezfuWYNdcNV8FkRyrnK8BbkEVk2J2+YbyJVJXb2Qv5eDls8nKxj7
	 eM6wAmoP2DXKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFD70380AA4B;
	Tue, 10 Feb 2026 00:50:03 +0000 (UTC)
Subject: Re: [GIT PULL] kunit next update for Linux 6.20-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <bfb8f2e7-3572-4b1a-ae27-995f940d2938@linuxfoundation.org>
References: <bfb8f2e7-3572-4b1a-ae27-995f940d2938@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <bfb8f2e7-3572-4b1a-ae27-995f940d2938@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-6.20-rc1
X-PR-Tracked-Commit-Id: db0c35ca36526f3072affcb573631ccf8c85f827
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d726a34d68597899a43001dd2bc1aeac7801008
Message-Id: <177068460293.3270491.1613870862513078701.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 00:50:02 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 Jan 2026 03:07:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-6.20-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d726a34d68597899a43001dd2bc1aeac7801008

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
