Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00943D0937;
	Tue, 26 May 2026 23:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779838907; cv=none; b=nqdp1VCVpkqANYjhnfMn/g8Ha5gHcSzfHiALSqie6WTYJZX7klidPGVCheukh2gAG8AK13OAlkqOHI8ZtNu80EwdsynHaPSIl8k/+vnZs1kO6SO8UcpGqJtfpX/xXw23Cn0lttpyGtpFkBoIR4Q9CTYngi5fkiYIno3LXHDuhaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779838907; c=relaxed/simple;
	bh=/h6YXd08iMAuH20QdZoujwKV0aZUzoStaqoD+TDT7iQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=LAwOC7sW2GhQwYDcyULL7fdkTR90yqXwQu19DFq4oWIBHtWVk2jArgG7g0OQfuGda42ezIvkMbomcs7rKVw6pYZty06waKzKv5t8BnwcE3zNnuEqtSLh8/xkyd52QVjwpw36GgIrJFJmxOVkJMZ4QTzNRoAziUPg1VZjM70utJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmq1tP32; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmq1tP32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598511F00A3E;
	Tue, 26 May 2026 23:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779838906;
	bh=YeGy/f956Dbk+mRxwsKuaoGjhKHwfK0jcnjya+/7mdw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=gmq1tP32EHLO3g/PN4aw8+3JQPOZmrgFUKE+i2OaoBOwInSNjOvw9e4n8ZMVmHrr2
	 oZQR0JtAoI7i8niJkp7Sm1iruDjO9l8gwt4+CCBIFUF6J5oyoybPg9fXGE1eXt6i/h
	 VptQ/bKpaMG0x+93pIRZO9VDYOhh7kFo89mQYK0+1tKIiuFwWYo+5YLozbLZ1c7zI3
	 dCFX/5WvikWxNbapnJ0/NEdAiKHcbPDDJ0H9uEaVmsUrKl06eiXeq9F+x0bQ2KcmNk
	 69xqnuozfk/tpds9S4WDip20jWOrBOtk6JjnH+XQwKdddafBbaluKePv3RMoC3AdfG
	 sFU1eCdWb7vlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B4F380CEEC;
	Tue, 26 May 2026 23:41:53 +0000 (UTC)
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.1.-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <7f5acf69-9224-4d2d-b7f6-99114a232446@linuxfoundation.org>
References: <7f5acf69-9224-4d2d-b7f6-99114a232446@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7f5acf69-9224-4d2d-b7f6-99114a232446@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc6
X-PR-Tracked-Commit-Id: fb6988b83b4cafe8db63999c1ddff1b7c66d2ff5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e909cedf6800ef493063f18a089f3632817a8c2d
Message-Id: <177983891179.4014102.12138435007844696654.pr-tracker-bot@kernel.org>
Date: Tue, 26 May 2026 23:41:51 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Tue, 26 May 2026 13:43:32 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.1-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e909cedf6800ef493063f18a089f3632817a8c2d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
