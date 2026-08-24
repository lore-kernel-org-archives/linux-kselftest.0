Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3207386441;
	Mon, 24 Aug 2026 18:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597468; cv=none; b=J4G4vcZorA2NpvRbuC0Mw5M1nqX0i4wcbmUTYvGJAu5Kc3RErvplinSLN4MGwXe7lSoupvsx4l//ieDjruz6/3/myxZiPPJdxOxQlkF7JQH7GvWSzVOARAV2HEVFZ5iEukEP7nPZdy9eoWis0fPIuTaI1lIEmNN0RfVH3p4O7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597468; c=relaxed/simple;
	bh=1hROkT1V5Ucj9ohaY38t1hNwXpIlB1dDXOvJqJPOjl4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mEBoXoeccq40E+5e5kjgn7oo2r58AScOtsQZSOeW9VJFi056eL54o3wcFoXSDiVhSe/OrzbuGJNSKjiMur5CDXDAZdBJxzFy7CCG0OK9G1zjC4hCN2n2cCDp/w46FM6NrorQ/LU81hlweRCrmjhlJ03iOhpOYy9OULJKBfBHvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvWw+Hme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvWw+Hme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5911F000E9;
	Mon, 24 Aug 2026 18:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597467;
	bh=2w6CAD7GZ8KPiIxNBl6OHo1bN7ezeKuQnqKPr1EznCI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=LvWw+HmeHwmRsGpoKRL+iRqFYciM6U25tPhcBaL99ktbnYgpz4J9lALiyfPYBW4Zy
	 HFwVAMq0a104elUM74StRuaWcMNTAOd+a8sJ14qos8Zw6ZxszMqjMoSoM98yX0HTWJ
	 qg5HfFeoLjz5db+YAdTNMrSmqrjXGBSaNfNRfO/FsmHUzCMMLJcwQ+p2qOyUmwOMSi
	 nGM6x1Ixx2mDHlb6/AB4+dCLmWmOr9P9byevx+Jznz0t7mzgQqwULWy9GsRnlIqCGv
	 FYIMKCv7xIAASOeyMk7hd9b+GZ3fnHmJcDi2j5b4cqTC3+h5f1ohH4UZSJFPahcTHa
	 0zA520xSLsSzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AA73924A4C;
	Mon, 24 Aug 2026 18:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2 0/2] selftests/net: fixes for fin_ack_lat
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178759741439.3062482.14384407063404923782.git-patchwork-notify@kernel.org>
Date: Mon, 24 Aug 2026 18:50:14 +0000
References: <20260821030922.1123754-1-fffsqian@163.com>
In-Reply-To: <20260821030922.1123754-1-fffsqian@163.com>
To: Qingshuang Fu <fffsqian@163.com>
Cc: apw@canonical.com, joe@perches.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 shuah@kernel.org, sjpark@amazon.de, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 fuqingshuang@kylinos.cn

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 21 Aug 2026 11:09:20 +0800 you wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> This series fixes two bugs in the fin_ack_lat self-test.
> 
> Patch 1 fixes the swapped kill() arguments in sig_handler(), so the
> server actually forwards SIGTERM to the client.  It also makes the
> wrapper script's cleanup tolerant of ESRCH, since the client may now
> exit before the kill command reaches its PID.
> 
> [...]

Here is the summary with links:
  - [net,v2,1/2] selftests/net: fix kill() argument order and wrapper cleanup in fin_ack_lat
    https://git.kernel.org/netdev/net/c/2d83aa65dc98
  - [net,v2,2/2] selftests/net: check fork() return value in fin_ack_lat
    https://git.kernel.org/netdev/net/c/11e41444a3f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


