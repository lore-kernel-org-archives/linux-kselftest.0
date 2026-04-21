Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD60317A303;
	Tue, 21 Apr 2026 00:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776731526; cv=none; b=jL4aQeAurQ2waqHlq65ZjFXJE5ZueYaE7S0ZgCREWjwd4Mw299pcxefrlobbGXLF1nWhFZSccUtN0bGHZJEIGyT706b17RLM92f+5/JkPuw5ss5+Am0FLpAEhXLrwMM/0H+N/5gjLk8Mg4j9iAucp/sIudug9x46krO9zKotniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776731526; c=relaxed/simple;
	bh=4jLpni0jiDmnPNT0UNs5p3BaN+Y17Q95PFvwkB0WXwc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dNw2miVGk3W7IuaE+uvW3cEMDkqKEi9kGGMN3gm/hDCYsx61uC4tejpDiH7m8FjdXufEbyACgO6k4Hyi0kG3NH9TPcgu5fxU9mUwHYA/1pI51l8/lG0S1EDOoRtguUogiHOUqdFBqc15Wlvp6Iw7JCaBFm8QCLwabOlsUiJdm7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tURejSqf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tURejSqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90310C19425;
	Tue, 21 Apr 2026 00:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776731526;
	bh=4jLpni0jiDmnPNT0UNs5p3BaN+Y17Q95PFvwkB0WXwc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tURejSqf5U0xspw/Qg0JhetjEZ5PGEqgvBGzDz2tOsBu/XK8PaQjl2xOIRRBGutGy
	 b10UgIuHnFzdiAsbgZb1vGCiXRKLIviJtlX3ZHWI2THSy+K3Um96Rosvn96QS5prbb
	 cfDCQTEpONmgO4FODbDm37TVgxssSxsHRHJEi+vJTiU/gc88XPBwtNk370oXmuyIFU
	 WUCHlnRCey3N2/Y9UUFv1QKg7dxyGj0zy2jAQWwbTUAr4TypXff+TSHGL/TqHksL3A
	 6JI489RN6mWJLnsesa4brRtBcGNW9KWqy5Wwjhao9Z1xuptu4ltEMYzujhSupFYRoB
	 //SsMGB5Q2LBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E5F3930023;
	Tue, 21 Apr 2026 00:31:32 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest next update regression fixes for Linux 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <599c06d8-d33d-47ac-aeed-9e6caa35bb9c@linuxfoundation.org>
References: <599c06d8-d33d-47ac-aeed-9e6caa35bb9c@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <599c06d8-d33d-47ac-aeed-9e6caa35bb9c@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.1-next-fixes
X-PR-Tracked-Commit-Id: 83ef26f911432d9c98b6d8b6ed0709a8b79cd834
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f154634e42f724a3444694273e396f0a62fef3f1
Message-Id: <177673149062.2145745.16246227593775255472.pr-tracker-bot@kernel.org>
Date: Tue, 21 Apr 2026 00:31:30 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Apr 2026 09:17:00 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.1-next-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f154634e42f724a3444694273e396f0a62fef3f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
