Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495132B99E;
	Fri, 10 Apr 2026 03:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792452; cv=none; b=c0NnWU/BA8L3GVRhxPo07oy3aSjosj1GSxaB8wB2QS9wF3OK1ZGhvh/aS6n/KANF/XfhpAxUeav2DskW3zk3WKe+E2C+QDxp9RPkGv0jsByJVbI3CthePeKfPctNPV3gSaAA3hEbnIbsJJIjPwqnbNSOVJeRQocazGyB+yqUdSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792452; c=relaxed/simple;
	bh=my7kSuC/Perf7BC/m4JKHMgLdU6sYLcXFcsnbMGvBOI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=miQMu+kMB/neSBnHic+CYFcMqwCv8/Vli9tQo8np0sfmS1VF267brBYeKO0WIb5aKn1eRkMspsBEXSizK1atsnH9b7mW97FxznLuMx2zW1bRMru/xQymoyrLbdeWzOUsYXXkobgi7hVz1ZpmMTb6pMIBlN4+SzqjB5DttLLMifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1jGZZqQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1jGZZqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F7DC2BC9E;
	Fri, 10 Apr 2026 03:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775792452;
	bh=my7kSuC/Perf7BC/m4JKHMgLdU6sYLcXFcsnbMGvBOI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=F1jGZZqQNBuMhh7D/PrTZDFvlSrWGcsbQ+hrtZGnko6GW3gVwbD5HhthQwXj3GwRG
	 TVY+/UZWUxBa0quw4iZuQ3s9hcQkPf6ggVIWq5ZcOM020E3BSkoQMexU0aPQrH3Ec4
	 phDTJSH+mB5NkWyFhbZZ7njDKixjeDPlyZH2QqPlS7ZupEwpWvhHoS0r9TWCE1WycZ
	 x3DIiEgcLswaGs7i0Nj8VUHueQUjGpj7Xw+TMKybnTIHDZE+pOZC0pnP4a6+vHhSKF
	 LQXjHan5kWTI9xckH3pTU3yacMdngNnX1Nqdoj0A1rL/XZsubOB4uF2m9iROVRaNZE
	 VWpJd48KoWHBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CCB33809A22;
	Fri, 10 Apr 2026 03:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: net: py: explicitly forbid multiple
 ksft_run() calls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177579242707.1854480.11270474673185223414.git-patchwork-notify@kernel.org>
Date: Fri, 10 Apr 2026 03:40:27 +0000
References: <20260408221952.819822-1-kuba@kernel.org>
In-Reply-To: <20260408221952.819822-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, shuah@kernel.org,
 petrm@nvidia.com, willemb@google.com, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Apr 2026 15:19:52 -0700 you wrote:
> People (do people still write code or is it all AI?) seem to not
> get that ksft_run() can only be called once. If we call it
> multiple times KTAP parsers will likely cut off after the first
> batch has finished.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: net: py: explicitly forbid multiple ksft_run() calls
    https://git.kernel.org/netdev/net-next/c/3d2c3d2eea9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


