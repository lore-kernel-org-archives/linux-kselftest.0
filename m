Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB824A076;
	Wed, 11 Mar 2026 02:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196825; cv=none; b=Y1+2kG7LveGoKNntIw50t+Qbz5pGur3JFS6LEjOSVCtj5H8F/dfzX+Fz36uXo9l7H0E+G0+uqKUYUKMQt+DO/qEsA5Alz16Yjxx9tDhHMJ3QK2SItMBNdgtnVt7zcY8p5q0o5otefopXdqEgTCYEAbAaZK8cX4NrDJMZnDyyn/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196825; c=relaxed/simple;
	bh=egK2cl2ZnUqY3I2vs+Er5QqP9FOygAy5JUBJ+9WkLLE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Kh8RtKEWjqSSIHgBctiXanoxrBUqOg1+4sn7Xh0O//w16v2huZAzuisJWQyQ0vyeX2MjKTtlyN1XYI12sbZ9PYBzOLCoM4azqoiFoS3IC1s5yYS5G156ctHJ9PhSiEe3Fm7ukj/LxXJkMR4q40rsUu6rRicyx42lud2xxdENQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=btk+gJgb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="btk+gJgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13690C19423;
	Wed, 11 Mar 2026 02:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773196825;
	bh=egK2cl2ZnUqY3I2vs+Er5QqP9FOygAy5JUBJ+9WkLLE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=btk+gJgbssjC+uPxVzV65QaP3N5RLaudxWPexVAIVoHYIfgEVsZ3CF2tdgqfLWjfJ
	 x2Vfxlwu8rMyIl+oQph3Jb2CPG7839uKy2od8bG6TdrTrWtHq3YTAZpu7Cg+xNJcEE
	 4CXKN2TA8DBXLy3j7mA3sumjj2n5sJ4CXeyKqsh1vpphu+g3o8h/0B/A39SUqVgniS
	 q15cJOnPqUGdOB75DykpIu5KUwMU7sRBsMdTi0hhE5Rwf09IyJnqOaWrQR624uFgKr
	 3xT1zc1+kCvK7e5Pfv5FUQVjTmfw6FN0tPNqC9AWvlokMX8ovmW1vyikjF4/+uTUD+
	 VGraev8NOO94w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9ECE3808200;
	Wed, 11 Mar 2026 02:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/5] tools: ynl: policy query support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177319682153.3014711.5472638473199917370.git-patchwork-notify@kernel.org>
Date: Wed, 11 Mar 2026 02:40:21 +0000
References: <20260310005337.3594225-1-kuba@kernel.org>
In-Reply-To: <20260310005337.3594225-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, donald.hunter@gmail.com, netdev@vger.kernel.org,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 horms@kernel.org, shuah@kernel.org, sdf@fomichev.me,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Mar 2026 17:53:32 -0700 you wrote:
> Improve the Netlink policy support in YNL. This series grew out of
> improvements to policy checking, when writing selftests I realized
> that instead of doing all the policy parsing in the test we're
> better off making it part of YNL itself.
> 
> Patch 1 adds pad handling, apparently we never hit pad with commonly
> used families. nlctrl policy dumps use pad more frequently.
> Patch 2 is a trivial refactor.
> Patch 3 pays off some technical debt in terms of documentation.
> The YnlFamily class is growing in size and it's quite hard to
> find its members. So document it a little bit.
> Patch 4 is the main dish, the implementation of get_policy(op)
> in YnlFamily.
> Patch 5 plugs the new functionality into the CLI.
> 
> [...]

Here is the summary with links:
  - [net-next,1/5] tools: ynl: handle pad type during decode
    https://git.kernel.org/netdev/net-next/c/7b1309c33927
  - [net-next,2/5] tools: ynl: move policy decoding out of NlMsg
    https://git.kernel.org/netdev/net-next/c/c26fda6212b8
  - [net-next,3/5] tools: ynl: add short doc to class YnlFamily
    https://git.kernel.org/netdev/net-next/c/8bbcfce5db97
  - [net-next,4/5] tools: ynl: add Python API for easier access to policies
    https://git.kernel.org/netdev/net-next/c/77a6401a8722
  - [net-next,5/5] tools: ynl: cli: add --policy support
    https://git.kernel.org/netdev/net-next/c/d6df5e9b2a56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


