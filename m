Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF382940D;
	Sat, 11 Jan 2025 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736562025; cv=none; b=iNpT5hmhAxIegNn7QtJ3d9TMpXdrPTmADUKik4HnUFjvLbi6DebI693cLqVJez6/z3zBVgYx7WZETGz7YYBPClbEIsME4q6Jt99i6BwVY6Jbw4D7U5g4r1U/j860qH9Y97+EPLZARRW7btuzqey6dux15XCnYk2ynbUxDTqDgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736562025; c=relaxed/simple;
	bh=WsnWIWx9P4KaEkNMQoqN1oVnPQbPZYxuFdFN47CcONU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gtm62VHD+CBBDKCz3P8ZLeiuNCK96CypfokaMU1VTpri4EDcKgFHDwLG0+9N9ANMLDxF2yZozVcgQ9f7sedR//RjwgTdATwD2wEBPaEmR0dcndIIukE/HcYjjgsP6+EOnp4ssPsIq8cadjME+tlH1GgFeN3/x+o//eMqJxl7UeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEn3Qm6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEn3Qm6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA85DC4CED6;
	Sat, 11 Jan 2025 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736562024;
	bh=WsnWIWx9P4KaEkNMQoqN1oVnPQbPZYxuFdFN47CcONU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oEn3Qm6T6fg6aA/6O8bhGjrx6BjCAvP7pwqgRhLGL0NMBiirM0lYG21e8UpwsDFfN
	 ZJaHSYZYOF9FcGW05npwaY6hnPMzMXeJ5rua0T0K/3RTZdy9qQLU/a5qyzj0NRgGLq
	 A9TDjqe22bB/2XXbl8ahL9JM3kvFmRllosESdXq6uFBGTnlgVSqncSrhfz43pyzocn
	 nLampIFBeYEeXilW6nHQjrHWDw0YyjKTMn/+KdahF4YPI13ujgj17F8GQAI2nv7k9+
	 YVaNfcAgpmRsopCIunUP4MmbIBt3swQzrZsEQaaUZQHB+AgSBy0Cpz7ePhxhTwV7FG
	 96i/2qMb7qWsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4E0380AA57;
	Sat, 11 Jan 2025 02:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/2] ipvlan: Support bonding events
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173656204646.2269660.13108760448307723800.git-patchwork-notify@kernel.org>
Date: Sat, 11 Jan 2025 02:20:46 +0000
References: <20250109032819.326528-1-champetier.etienne@gmail.com>
In-Reply-To: <20250109032819.326528-1-champetier.etienne@gmail.com>
To: Etienne Champetier <champetier.etienne@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed,  8 Jan 2025 22:28:17 -0500 you wrote:
> No changes for first commit.
> Second commit rework bond_macvlan.sh test to add minimal
> ipvlan over bond testing (asked by Jakub during v1 review).
> 
> Etienne Champetier (2):
>   ipvlan: Support bonding events
>   selftests: bonding: add ipvlan over bond testing
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/2] ipvlan: Support bonding events
    https://git.kernel.org/netdev/net-next/c/e79a98e68b96
  - [net-next,v2,2/2] selftests: bonding: add ipvlan over bond testing
    https://git.kernel.org/netdev/net-next/c/08ac69b24507

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


