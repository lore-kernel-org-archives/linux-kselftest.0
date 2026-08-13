Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A805047D46B;
	Thu, 13 Aug 2026 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626748; cv=none; b=OFBe81dy35akoK0I2vNJDDXJrRVYC2Ga8VZi4uQdpmgrukfAS5OYntzMLQtb/hOVz0OjGoR5QTdMkcc53ATNCUxai04f1tDAqUmIx9aut+zishxPkTvluQuxTpJjbDrRBuT8nURBo1gEmg+RJnlRTNaS1E4HzCMGW1wjkoofunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626748; c=relaxed/simple;
	bh=n67e92akAaeYMhCPJCCKn+4fuFBLbUJkN/6jajwe2m8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gRSIETw9IrJ9vz6b42sNwij+JasvgSAItNbPyXvvhXpa5xMaC/wbezfPdA5oQIDQKO4nubHrILQ5uFcF/6WZxNGaTakxbJR+gm3snB1Ybfrvd13NuvI9sk7E57qqZ+PWpbuIrwmEIftAXxnNFBx1BNQtBuYV21VUgHbnu4xrjMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HlwRILKR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HlwRILKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F821F000E9;
	Thu, 13 Aug 2026 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786626747;
	bh=wUTerx84b7KLBWJwyknigTnBFqCAjupeE2IoPPpdlas=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HlwRILKRsK5V270vFNgGGSQJJjfXF8erHmd5vQzrrHW8uFbPIxWlI1mftK2VZQE4o
	 1C+R17iZIcSBKwI+UTXE2IWYOYWaBDSsyHwxanwL9CW7/C1mDET2+NPBjdeq9ZPOgf
	 GWmTU+Qkp9Bj4dOcevVp9egsmUIN92IpaUfyArwobjsQOhcWwz6UV/LnRKm2WTJH55
	 W2ajMns/06LwfmxpdQG/IW4k/oe5dwBfy8k658brtcD057sJ9blTY3l/SmWORrZxeX
	 axphqYDp3z9eMAYnHzojbPF7UFm1W++Y3Cs62XVk8LAlJ7Y5EYQCXbQzaIM92LbVIn
	 raGQ8JIN20tMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5690C380CFE8;
	Thu, 13 Aug 2026 13:11:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] netconsole: replace target_list_lock by
 RCU on userdata hot path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178662670188.2423866.14579955056749406829.git-patchwork-notify@kernel.org>
Date: Thu, 13 Aug 2026 13:11:41 +0000
References: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org>
In-Reply-To: <20260810-netcons-userdata-rcu-v3-0-f65557f769ce@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gustavold@gmail.com, asantostc@gmail.com, kernel-team@meta.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 10 Aug 2026 02:36:10 -0700 you wrote:
> I would like to move netconsole to use RCU on the hot path for
> a while instead of target_list_lock. My goal is to have no lock on the
> tx side at all and eventually drop CON_NBCON_ATOMIC_UNSAFE, if that is
> possible [1].
> 
> Start removing target_list_lock on certain parts of the code. This patch
> transforms the userdata array into a RCU-protected pointer, and uses the
> dynamic mutex as the write lock.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] netconsole: publish the userdata payload with RCU
    https://git.kernel.org/netdev/net-next/c/a9560343d4e9
  - [net-next,v3,2/2] selftests: netconsole: add a userdata torture test
    https://git.kernel.org/netdev/net-next/c/3d2452c2fb2f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


