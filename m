Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFD336C0AF;
	Fri,  6 Mar 2026 21:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834220; cv=none; b=ml5XfSzlv/aKNkUFDSgWlTXMtc+ADsMVwJ9PfP7T3S54sz4UaBR1+q0YVqrMjoax0Cas17ftu+3H/KQVZthTJZOUPFb2uKam86MkeA/mtbm2rnQkpjN6bD3XE4w5gi7hy+QgBNrT99MzINc6YNbYvStnvLUJTaKk3L1mye6no/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834220; c=relaxed/simple;
	bh=bNHjrm4wi3HZoe8DlLRh7Peqa1HCdMUlFlylpfG4S9c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qsTqbDTvqovoflXnwngirTE84EgJx9c469N231q41n5NX6OBPlqLf+J5HDDhw12Gi2++ASR547PUgSlQhjDIskfIg/uNOVG/WI0pFHnY2vt4/zWw3qcKlNmHeCSUR6CNwF3nVPlwT7L1NwtsPYJ0gbMnjfqtJUfkqdWEZYhPFN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuR0l3NH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuR0l3NH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFBBC4CEF7;
	Fri,  6 Mar 2026 21:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772834219;
	bh=bNHjrm4wi3HZoe8DlLRh7Peqa1HCdMUlFlylpfG4S9c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LuR0l3NHj17bSbLFmj0gEqnsgJduHalmFOqvTUn9OuSaQGB+QkCndD41zeoDqfCPP
	 1p3AbiMv/4S9aGp8jdO9lTe/1bkMKWWSSfSKRufEcliIaHjj+xdZcPXVVdkBZo8VmO
	 PADwO6TJk8YxWpYx4nayTig4e73l1IcGdnZqsq+v0D8w8Oh5uMfQoDtKvaKZZJPwYc
	 aipqgNvkLYmO1xwkLHfstQIV0TZp5EmRu3vh/WLcxwF9ZZ+WPofdKq6jS+o1LerEp7
	 GznZmcQdq4E7ZSCdEDl5qcMgwY5zaUX3sHmoGiCs9boaL2KUbPXZPXZlpF8X71UePY
	 z4Hzu5rfzuVnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEDA3808200;
	Fri,  6 Mar 2026 21:57:00 +0000 (UTC)
Subject: Re: [GIT PULL] kunit fixes update for Linux 7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
References: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ed050fc0-bc06-4e8e-afc0-86c770848f93@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.0-rc3
X-PR-Tracked-Commit-Id: b11b9b6751b2cd74960dccd91667c5117fce743c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3593e678f5e8b21b8f54b4267027bd55b19cb7b8
Message-Id: <177283421894.65918.16860287741780662678.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 21:56:58 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>, david@davidgow.net, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 6 Mar 2026 13:30:47 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-fixes-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3593e678f5e8b21b8f54b4267027bd55b19cb7b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
