Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062023D6661;
	Thu, 22 Jan 2026 03:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052613; cv=none; b=jgjNLihLQfctvq0FtZLeEEKacBrfTuktdaI+XPCkqgTxWTstcZeLgzrUKeK5KjTTf7UgxtkYZtb0uomlre86EYf6nV2YjI/oDPlz0cUfjUw3MS/ToUCzlzmt/BDENLVtS9Ka6ZB2bJjuGDR9Wj6SXTUfFfPNhovx5AcuBPeZb+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052613; c=relaxed/simple;
	bh=Rdep9s5k5V/uQGJPz9oEpnElIDdpwIOX6HjB3ghYs5M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cZT6JqwJUw52AWw+0kv9XrhbGs4GalSQPc3oTHaK5sduoPPsPe0jj36Il+2EGeGOTq3Mn2fjLziQjIZ2MLsIFquCklxrSUjuG6wHsp1AmUqFpwvGA4eP+pKmVINxZR8GuZGmLmI4ifVEgWc0mqAYQlHtY8fdnYjZwofuGfemWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rK/HQ68t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rK/HQ68t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C7BC19422;
	Thu, 22 Jan 2026 03:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769052611;
	bh=Rdep9s5k5V/uQGJPz9oEpnElIDdpwIOX6HjB3ghYs5M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rK/HQ68tE/3BcahXNwaMhUjmFdL2iijWJ++m8mdlmLwB/hxKIi4fV1Dtv0FD5GLU3
	 jRw1TUC3flxKquHyuVp1KhPPIpSCBGvpR/it0qnZfh2xk9+SdXJSv+FseJ6WsTqjPo
	 AKWnIwvG9bdRPpOdOgCwKfuhK/NHJbuROy/kjYAMYrQMnE6uYnB9oTSckXc90HCkCM
	 D6Jb+9wOS0bfen0xGLHwI5ZkkJ03JHAIThFvOIL0mYkl6euT4wFKJprTF5VUZ4Fo2P
	 YiuwX7uZ/EeyaddY4rsztPN8KnT78cLHTYfpXRXxuicPdQ9XwzpsLfnHeXKrlMkczd
	 X/tA076vi0g5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BD163808200;
	Thu, 22 Jan 2026 03:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] selftests: net: amt: wait longer for connection
 before
 sending packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176905260835.1542867.4557783049246974526.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 03:30:08 +0000
References: <20260120133930.863845-1-ap420073@gmail.com>
In-Reply-To: <20260120133930.863845-1-ap420073@gmail.com>
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 20 Jan 2026 13:39:30 +0000 you wrote:
> Both send_mcast4() and send_mcast6() use sleep 2 to wait for the tunnel
> connection between the gateway and the relay, and for the listener
> socket to be created in the LISTENER namespace.
> 
> However, tests sometimes fail because packets are sent before the
> connection is fully established.
> 
> [...]

Here is the summary with links:
  - [net,v2] selftests: net: amt: wait longer for connection before sending packets
    https://git.kernel.org/netdev/net/c/04708606fd7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


