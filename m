Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B962BD587;
	Wed, 15 Apr 2026 00:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776214731; cv=none; b=uSMAlBSTztOjt1ylGnLBUZP04s++mBU6ALLFL6gtG1X1AauwFRhv0FqVBeOwj4rLDHaOhj3/stttocJbm9TdddBcwiXCgJeLMjlbaihJCisLAMyrFcC7SiA2XrZmOS43Q2ylH7/7W09d/vVdljoF/NeniWrTxt3mzd1c1Kc7aLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776214731; c=relaxed/simple;
	bh=tBeimkel2oqUw1fWhpVesevl+bRR9p62lc/L6o3My6A=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=XlWITE85nhoei5fMcxBFHtija+Nz55Ju9bmunbZvbbiMMYd7SRAfUfVVkZQHH3Bgi+Kisn5RVxi/9en9zuPM+5MtQwI/r+nA4R+sM5KooAvdQHmHB8zqTNv3/7RGal0zB/tizoszlx0RnuZlpVCVoDYCWXRPkoKTEB8RUwu2x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrBfxv3G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrBfxv3G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8409C19425;
	Wed, 15 Apr 2026 00:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214730;
	bh=tBeimkel2oqUw1fWhpVesevl+bRR9p62lc/L6o3My6A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UrBfxv3GGUGxGHv71t//Ql8gQwnyfTSyiX2YendNX+Ht3Y097KEpmyWUyj/2WMImL
	 Y34DFNg9s1kCbcnUoRXCq9aFc05bDiusJ4LYZs7KUYe7oOOnIfZFgQK37nKdzTB1e8
	 /MEmhtDo3kug8SpyCMF0x+OMQyQSjfpHHZQo4Vf/ZhRQ0ptw1Nf+yTSkVyc2Vfy/tB
	 4YwlPPnT2KcPH6Y/LsLaz7ZZPbGClud1LQ5VCbyaqy6Vc4CnVkpu5Ft+o7kaCRxkAg
	 vCcukv18U2h64CimAcjbbrrcWE/Gp9kuyjRMjg7+lz7U2FCmRR5MYIxG7GV1vcTIRJ
	 Hx4ARFI7rGbXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCB53809A29;
	Wed, 15 Apr 2026 00:58:22 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest next update for Linux 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <e0756bd3-4997-4c1c-be38-2c8551795e50@linuxfoundation.org>
References: <e0756bd3-4997-4c1c-be38-2c8551795e50@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <e0756bd3-4997-4c1c-be38-2c8551795e50@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.1-rc1
X-PR-Tracked-Commit-Id: f8e0a5a174d7d3bc3547c15bc1647c35427f5c34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e997ac58ad0b47141c62c79cde8356fe5633287a
Message-Id: <177621470078.1543667.18408822197567867431.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 00:58:20 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 13 Apr 2026 16:41:17 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e997ac58ad0b47141c62c79cde8356fe5633287a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
