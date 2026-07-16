Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00D389115;
	Thu, 16 Jul 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181606; cv=none; b=EoDDSaqh4mNd+yc+JnSgiXr3LNBDyAmH5tPMqnp7WXWPfgYs29+vc7ki1Txok9RipmIPuuJpdQuXKi+Q8uRTcNX2q0rW/o+BSk3VJo7uwdv4KLqA0mpGnYgrHWfRTLQ9Z9RilflrTCv/RyAxcSI+wKnzdfNSq5k1Es0DgadJTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181606; c=relaxed/simple;
	bh=esErWtM4dKXPkGhrLjFJ6tjcrBhlc9485K4/VPe3IXU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jEoPgSJejAvAX1EWUQU9GobE7nEuQ8CGG/yC2YMpiISTGAGkO671S7g16eEtirtE2beeoZiuzJBej1DzwLRnuVIVRFy7vI5P/siAc4UjaZdhzN4J2bgsGpN6lSTYzPMneRe7o/vEs8VhQDefnjEdxLYCzgxqUQj2ADLS65rH0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehrFmkxs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehrFmkxs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3241F000E9;
	Thu, 16 Jul 2026 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784181604;
	bh=YlgnprHYcK9ah8/XZmy5Wfle3Be4/KnlHg17ArO3h2M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ehrFmkxsoBsT6gxA7XqnseSOW2ycuBL6xdv3P3CXZTlbIfqTT8AFZFIb+tL5zXYFe
	 RKv0KZXUewQWi9Mw6Yi6mFcqB2+JUzjX/nMd8qFo50zFww0uRKcSZO+MKz9edX9o9R
	 5fXFqjdC5F407ai1d61Pbux8253lShs+3Ik3Ug+W0TTnextTmNl1eSVmkAXvplLnfs
	 HtTkdIfsHtRsr50LPr33vtMhvx/1p/QMqOh7XHdSlESUqwKxrifAm93xnEwF/vHzZa
	 WjN3ZsdCGbZYHvTShjQHGoYwtL1hMbEw/3YWEXzjNf9OIFJu/7RWTzHt2O3P04rsDc
	 fUwgD07TAG9Kw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BC0392444D;
	Thu, 16 Jul 2026 05:59:39 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest fixes update for Linux 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <372e3107-1133-4d84-b2fe-552a52e3abc5@linuxfoundation.org>
References: <372e3107-1133-4d84-b2fe-552a52e3abc5@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <372e3107-1133-4d84-b2fe-552a52e3abc5@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.2-rc4
X-PR-Tracked-Commit-Id: c5c413534d40eb4c982f1794e62813f926aba747
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e144887d3ae659dd3510bc177977e9864f964197
Message-Id: <178418157795.618907.8387604592430963592.pr-tracker-bot@kernel.org>
Date: Thu, 16 Jul 2026 05:59:37 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 15 Jul 2026 16:08:53 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-fixes-7.2-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e144887d3ae659dd3510bc177977e9864f964197

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
