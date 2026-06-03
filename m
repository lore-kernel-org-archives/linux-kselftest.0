Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC13DCD95;
	Wed,  3 Jun 2026 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780453819; cv=none; b=JWg5gpRSDVn/BDe9Ik0D4R0sSBRIqLJ5sw6RVkHkOUZzCmkCGiW7rIaj99jdqjBxOMhllYBdlxgaqkz51X8wGBk9n1J+bIQhnlWnvO42fiMOSvaOJ/UOBbgkpFxPe52WCgUWkboMzToVHHL7K1IZaJQN8XTefbRy/lvaT7djQZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780453819; c=relaxed/simple;
	bh=IERr/H6vayOJdYc6Q7l6xYaPak0022lagJNE4DzJ+vY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lcy3E5UqEbhsCASZ7veg3EqVnu0/SMU+GRJ/WlFkECsc9QGbh3SHBUwEOI5HnK9RedMRSHTiPFm+6+JTdxcWSwVtwgxDJlVu0YBUBYvMD1UsUmKvoqN8Wuufbpfr0jP05040uxtjw+s76UNOqPpuP71U/enquuBuRHy1oPUl+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYdKFYh8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYdKFYh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B2F1F00898;
	Wed,  3 Jun 2026 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780453817;
	bh=XfP4SCRfg+uxtVWmxBcZJEnFLmUrsv6wj7GlKICgaK4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TYdKFYh8pRTBgHEjXEIRo6k33fyOBfcQqMojRmXh+ZLhxtMRw2+N8XPBMu0tXh2eS
	 33Mzbc9/W/ZjITTsQ34CBowegNyuYY5EdzzGYHLifdm58vOP621oQjslE7d3Va8Eam
	 yMfL3t9BoewRy4O+dnur/HdEgtykklVAIDDrty8FLLjs/RDC70iDo/t+vXiD0lcLUI
	 hrlPz24v4INpzaLbxhztG3QhV/CNNF+PqWgrv+/2LYW0sijx5zf07PF6LHLgdBFd93
	 jXRSndBC854FkU6cW/UROGKj73Ds6uTFVg0gK3+3VSjfzsuq7YdlGV0LFbUhrgd/sO
	 aC/E8pJ1ey4VA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A24393003B;
	Wed,  3 Jun 2026 02:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] selftests/net: bind_bhash: fix memory leak in bind_socket
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178045381914.1178989.17932849399843632529.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 02:30:19 +0000
References: <20260601013927.1835-1-yanlonglong@kylinos.cn>
In-Reply-To: <20260601013927.1835-1-yanlonglong@kylinos.cn>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, kuniyu@google.com, joannelkoong@gmail.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  1 Jun 2026 09:39:27 +0800 you wrote:
> The getaddrinfo() call in bind_socket() dynamically allocates memory
> for the result linked list that must be freed with freeaddrinfo().
> However, none of the code paths after a successful getaddrinfo() call
> free this memory, causing a leak in every invocation of bind_socket().
> 
> Fixes: c35ecb95c448 ("selftests/net: Add test for timing a bind request to a port with a populated bhash entry")
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> 
> [...]

Here is the summary with links:
  - selftests/net: bind_bhash: fix memory leak in bind_socket
    https://git.kernel.org/netdev/net-next/c/dfcc2ff12925

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


