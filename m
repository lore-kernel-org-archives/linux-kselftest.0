Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694302;
	b=yRtnqJjWbgXHE3id2GRMDJOHo1IgQxc1Vi8bO+yfxIF5F9Zcb/jbLNr8PUwCgh99IFND
	 aK80b27w1K7JAs8zwmsWpbspLvbFmYXIKp0czuTVCLlrFUesjiMwbm7TXgiW9yKmlndlG
	 Nz1xtM45aYAyxfH0Ah06sq4ZnvxkaE8DkgE9vOXfn40m4oX/03UV5l2MMwMKwVVuvRe4X
	 UyM+D5eMOjA4SnxC/su3uI/c+ngVckMeBcWB4+BYFGiKy2NkR4hsjSNk6WkjndHWg4Zv2
	 AeM29zGvt3OhW4SKCR1DwSWZHXarycQSq9vbDfU9YRBDkgtQZMAlG9/4cDBfXJWu/dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694302;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=R+7MqJMzjWC5cK+H0lgtyfTHX6VyG2zlsS1tToRM3FM=;
	b=gtcb4JIew/MuO5r2UHewwKPwOILEsDuA/43fMeajDmgaLFIMVU/B/r0iVbPFEehIRnfN
	 3bfdTNpFXAR+68eHAtYD/DF+sePRbgtOV9QS+HNOsp0ccs7r5qjquU0kNol+iM0vyKgdW
	 tNqJ52P/yEEuVDmNe4XhhO9kerWe4J37zNH7JzUtiVU3V37eoA6NLefwvDHrokS3ey0Ex
	 u1cPWdrqWM2J1IdD09cn+QMRc8c+bMz59B76K0uW0rGWalH8Dpde9GB+WXn9U0W3hSVtB
	 +O/0cqbRN59+HfPjZpA7/4/6BCERD1dLZvMpDPLUeEZdLWH+TTVUXkBBNpyyBWqD5zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Zt/4g+IC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0ED8606A787;
	Thu, 22 Oct 2026 18:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zt/4g+IC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9251F01825;
	Thu, 22 Oct 2026 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792694301;
	bh=R+7MqJMzjWC5cK+H0lgtyfTHX6VyG2zlsS1tToRM3FM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Zt/4g+ICQpd5N5WHt7bjE83/SyKm8HYWraRs4cktmcn1uBuNBAUGot640MYZszNif
	 v2EtHlB+XeL7JU3VwtMozE8/tUPsUw3r09/Q2JKFVp8JGX3hR4VjtiWLUCLE/f4EaD
	 N0rjgWJcgieXj/ehSuZtSvDSL5gr/nwZauOU+k39g24Lr3oy50siNjLb3Y61ANylBs
	 7cDPUF7964BJ7g9YlTl5J62Kg6XBp6PLdVkDKvltq/YviNXp96EnP3Q9B56MlGMuSH
	 hy8fNhLsmtCKrcFRlh7l8SlBo6rj2p30rDP8DbnC8AnHTll5xTyXB9HoeX9L2sAvbJ
	 BFlNTNMGk+c8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE52B3808222;
	Thu, 22 Oct 2026 18:38:21 +0000 (UTC)
Subject: Re: [GIT PULL] kunit next update for Linux 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aacd551a-f512-499a-960e-585bce02dd12@linuxfoundation.org>
References: <aacd551a-f512-499a-960e-585bce02dd12@linuxfoundation.org>
X-PR-Tracked-List-Id: <linux-kselftest.vger.kernel.org>
X-PR-Tracked-Message-Id: <aacd551a-f512-499a-960e-585bce02dd12@linuxfoundation.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.4-rc1
X-PR-Tracked-Commit-Id: e38f53f0482468efd04397f66bda4648b70ac9fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a08195e4db5aba84600db6518089a1dbe2d04c7
Message-Id: <179269430040.110555.14271463148302839853.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:38:20 +0000
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, David Gow <david@davidgow.net>, Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Wed, 21 Oct 2026 14:12:53 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest tags/linux_kselftest-kunit-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a08195e4db5aba84600db6518089a1dbe2d04c7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
