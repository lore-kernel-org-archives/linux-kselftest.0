Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A255523798;
	Thu, 17 Sep 2026 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651896; cv=none; b=GuUcGDfI4so/f3gyAa6htFe1DBBMPbvgj02oWIHgmts0Lru0OvAVkUbCM0T+StPTjXITmrBH+flu5nGo/FZ9yv7TgOC5KMUcIThiECcaLgjFdjJGSKbTvGPiUuNoULToMvdGkbiy8zOksoikUgeqpwZxv5XT2YbkoHKjf0iKZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651896; c=relaxed/simple;
	bh=lJhhl7rqp0R+kTEn3u7cXqS0lMDRNpKykndKN5Xbdss=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cByTFhMz9Nb0+XzMIicUnl5i8ZRbNcRncYaTaOD7mNcrk3f5/z5xpPbvL4dvotSMWwvvlEpdbQvyLg/rlUdVPUcXtVvl0deu2YjU92i0UjFIrs1TWAkMzAt1om6L5cJNgAo7/fXyUYUDB0HMbxvvxeOVT7/AmztIBMJOjlqyNjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X3VQzBW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X3VQzBW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D221F000FF;
	Thu, 17 Sep 2026 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789651886;
	bh=d+xMAagAIt0peOBIqSsZ+vAYsCvSqqqp7DxtScD872M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X3VQzBW2/pH1w01pGHJUniIITmoUTlatUz6fhgtsefZalRbxXXWo6oUX9STUNXRtk
	 nX5wd3ZetQ8fxA7DKoJSnU4P+P5UUZu27d7RSaUzNwsMmcDkWBeeFUCywetw0W1fIK
	 KmdaQqVJuvXDpKig2x2BIlQqOZ4QNL9mSPMKj7UFu9HPSa9Dxw+/WP7OjcOGjeROa/
	 BN2YlI7ak33F2bRS7cuOkz2/N2QZ7yYnmQ/lKjVCpgW4oZ1MEkPBjvUbqOLWg+8hCJ
	 gP9Q4/pjGS/8I4SPKtaKoUEinRKj8VIEfJyz71pVrpE/DscTYBTzuWzeuWRCOW6UlY
	 4E9RAoz4GTN0Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A663811957;
	Thu, 17 Sep 2026 13:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] tcp: exclude old ACKs from fast path
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178965181963.3645898.3635212098501972895.git-patchwork-notify@kernel.org>
Date: Thu, 17 Sep 2026 13:30:19 +0000
References: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il>
In-Reply-To: <20260914090408.1435080-1-inbal.lipshtat@mail.huji.ac.il>
To: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com,
 kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 amit.klein@mail.huji.ac.il

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 14 Sep 2026 12:04:06 +0300 you wrote:
> Exclude ACKs outside [SND.UNA, SND.NXT] from TCP header prediction so
> that they fall through to the slow path, where ACK
> validation is applied.
> 
> Add a packetdrill test for a data segment carrying an
> excessively old ACK. The test fails on the unpatched kernel and passes
> with the fix.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] tcp: exclude old ACKs from tcp fast path
    https://git.kernel.org/netdev/net/c/f81e6c3fb063
  - [net,v3,2/2] selftests: net: packetdrill: test exclusion of old ACK from TCP fast path
    https://git.kernel.org/netdev/net/c/d841cd7513f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


