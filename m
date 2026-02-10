Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4031B1A256B;
	Tue, 10 Feb 2026 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770684608; cv=none; b=acCZjbZ6SAVxv5SXsMPJifEimH+aqYoRQedq2AdB0FRk1NY6ppimx4/qKWs7wzWrUyg3gzrq3q1HquQOh8LN8Bv3xOP21itXJWN9bhggP6fLBJGP8tZy3RmbBlJSJpNnzi7qQGQUen7F9OYUL4JutH+/0pFvsqkCddP5FMozJrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770684608; c=relaxed/simple;
	bh=Ki0lBlPbpyM8aEIUjogbWlK+8zefIzfd2eqnbspEPx4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JxJX0L+d14nXCS8NuUM8hZZ3Ctj0XzoV6pa34JfkQIXX0VUfqLotsGEeOjqRFiu4HTCHt2I52GLTZpFCNdcidzJ82B1pvk4ZeCbXFQ+K5cnSZFZJn5eV1yIOIb0t7EseBYbhp2z2h04jJdseto7szXBLrU/1GPMYFEXX4ZtDbvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMYyxleY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMYyxleY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272E3C2BC9E;
	Tue, 10 Feb 2026 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770684608;
	bh=Ki0lBlPbpyM8aEIUjogbWlK+8zefIzfd2eqnbspEPx4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uMYyxleYVm6fofddshBaOpjqzBYI/EbqUPBlzMWIK4IwpUda1Gzru/iEz9U+Rx5Md
	 J7bYOddjCl2/7O8WybrwcQ7xmklD9KXiG2kCBRdhNgX89yInHGkzZs5enl7GyqQKm5
	 ouuiom/GZCquC4LcZlVCDPo4QUyw3J2PY/ZKBBDhGFRTdKN//gYslHjYtLPT21rkxE
	 EmD8HNLf2Hnk38c5OUnzg8bsx4WKgiaZOpzmsasaEZtbx9zOE9MVDC6qZgEx9ph7PV
	 qynZNAkmm8uwjvsn6UkYg5m2Y3ZSj134WBOz31D3HPi3MsRK27ZNkyoRnhB4kqSvb1
	 Q2DKXARaKpcKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1A8F7380AA4A;
	Tue, 10 Feb 2026 00:50:05 +0000 (UTC)
Subject: Re: [GIT PULL] kselftest next update for Linux 6.20-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <8991cb8d-4532-43b3-ab2e-352c46020934@linuxfoundation.org>
References: <8991cb8d-4532-43b3-ab2e-352c46020934@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <8991cb8d-4532-43b3-ab2e-352c46020934@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-6.20-rc1
X-PR-Tracked-Commit-Id: 6d6ad32e22f028c525d5df471c5522616e645a6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c40222af1689d89966c4b60e79852d6bc13416a
Message-Id: <177068460403.3270491.5792267408645407027.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 00:50:04 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 1 Feb 2026 05:30:18 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-next-6.20-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c40222af1689d89966c4b60e79852d6bc13416a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
