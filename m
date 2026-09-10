Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E22C0303;
	Thu, 10 Sep 2026 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789001467; cv=none; b=idD4pvJcQ5Y/L43fdMiYVJ5/7lYu/B8qtYwo3Uu/sqgMDBbb6dN2lUwyLqG9M8WI0B5kCA4Zf6HJYTpZj6D0UGvCAYJhyxV5sASv5cpYoKbIaFsSkZxZvPTzd+GjwRdnb+qrZ+EYG8NisXcPBTfyDqcRRN9dUPLxSWP46BELM3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789001467; c=relaxed/simple;
	bh=QnwH9Nyr+Yt+9BAGd9IMI9xOAY2xTx8opyUxSozaFoA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tVg/qwFKFRw0Y+yvh7uf4HwD2C81WonT5gJElduoti79NCxDoTC+jNVFRQRh0pm3gSsAQ1rzrTzi/9MivpyFhKMAEBVMer5e5G8s9Ma0ABMGlxyc2w3E3g1DzBQJbTB67vYbihbkJs7YOYKP/J/0dZpeDKMV8grr3vGjf/qU4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crh1sLL2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crh1sLL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7B71F000FF;
	Thu, 10 Sep 2026 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789001466;
	bh=Hr8TFZ1o7N9pxOcDwN9sn0UzSZSlt0ny5WGc8oTVJjc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=crh1sLL2s0cWYkyvte9fugJRMSS9iKWD4gjQxLHE7EV4gYuIPymwPuJR5kvzSvU7D
	 92OVpBBTYtYfzHkTj0xRDeiKF+vP4mTKYU96lpTc7brY0MN5DEROuCpjbz+a3FwMkq
	 oRGuoADfAz9nC9KXNJpjot3xXDIfUCA662w9BcVw3qU1Bn0cAIdApOqFod7dBK8uAr
	 xBdX+F2OJcUuHbc1MYbmKUEpb9QEt1R1jUJFPvJqkcI35aHlk573clINOz01csb0Cu
	 M/WW4s4b+RbfnGLALPuGmPHSu80VPdSIhLaZAVpfraZKGvl/gza6n5waxBnj2bTAHT
	 S7SscPJikAj8g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 938EC380CEC5;
	Thu, 10 Sep 2026 00:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] selftests/net: skip
 srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178900140438.1126219.5724050827796190289.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 00:50:04 +0000
References: <20260907100631.1923148-1-alessio.faina@canonical.com>
In-Reply-To: <20260907100631.1923148-1-alessio.faina@canonical.com>
To: Alessio Faina <alessio.faina@canonical.com>
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, horms@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Sep 2026 12:06:31 +0200 you wrote:
> In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
> the vrftable support is not available and the tests
> contained in the following 2 test files
>  - srv6_end_dt4_l3vpn_test.sh
>  - srv6_end_dt6_l3vpn_test.sh
> are failing in some kernel backports.
> This is the result of one of those tests in an unsupported environment:
> 
> [...]

Here is the summary with links:
  - [net-next,v3] selftests/net: skip srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
    https://git.kernel.org/netdev/net-next/c/6a64e9d76a79

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


