Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5E280335;
	Sun, 12 Apr 2026 16:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776010845; cv=none; b=G5VUkad9lhu0brB1rMfC0Cw2O2sgXReSwFabtoGRlBQfHfPIxLl6AU0B1SNOj5vIqeJZowCjTjzFGEffQwpoTNMe+eYTNerwSsO2KVyhFJm3c8YLi4k4+gDgC+5vygz61QAUKjiNwn/YTD+CIexk63tITKGExtUUfHg24WnFtxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776010845; c=relaxed/simple;
	bh=dmj2QFeNzW6frqay/EXItyE/Wuq/M33Uab4cXMf8Qa8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i+uzm/NYBJJDTI6UkWRSBmiNtqBeYXAsCjIcHCEV3d/EiN3TkNg89LWmAPqONebtzIOyJIGeEV3xDsYHdaN+z6HOhZTHBzJevHGCfqKHRdfLKYzPGyEDY/BJ3uahemgZp3R/eztt7Get5MeBKWuFBUCSyfXEINdMlGWo6rWo3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gol7K9LO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gol7K9LO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EA3C19424;
	Sun, 12 Apr 2026 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776010845;
	bh=dmj2QFeNzW6frqay/EXItyE/Wuq/M33Uab4cXMf8Qa8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gol7K9LOBpleWhLwD35xzpOGO5/k1/ROW+6ROyJlpX4bZgugN7knMs2KT3GP4DaZW
	 bqjEexscJY+AWCO8ydWp1o0zsyaChaFY4S38Ri9Cdi6ozap2JKy39O3oKR9j11LPbs
	 ad7Jq6SF0ZFfYQ5/Xl4QwnFFYPfKGj14qv+lYiyu9hg7NjFdQu2r1wsZk4L8owbwdN
	 KZ2xTa5J5aoNDqFCvReoOBDvq/5cvD6u6tO/heJdmIQQFubErvXRYxNgvgJV1qyEY1
	 WBALKwPFQD6zIDkc0oSUrD/hbkMO3UjWReUGCPca94WEdL7CW7VPkGc+uroz/0z0Vx
	 WM9kc175GEuJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DE63809A8B;
	Sun, 12 Apr 2026 16:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] selftests: net: py: add test case filtering
 and
 listing
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177601081755.3330556.16796690983862607138.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 16:20:17 +0000
References: <20260410013921.1710295-1-kuba@kernel.org>
In-Reply-To: <20260410013921.1710295-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 willemb@google.com, gal@nvidia.com, leitao@debian.org, shuah@kernel.org,
 petrm@nvidia.com, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  9 Apr 2026 18:39:21 -0700 you wrote:
> When developing new test cases and reproducing failures in
> existing ones we currently have to run the entire test which
> can take minutes to finish.
> 
> Add command line options for test selection, modeled after
> kselftest_harness.h:
> 
> [...]

Here is the summary with links:
  - [net-next,v2] selftests: net: py: add test case filtering and listing
    https://git.kernel.org/netdev/net-next/c/e46ff213f7a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


