Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689007;
	b=tVPSv1tRhvZVLSqU3GlsOk94A6sDF7L8AGosH5SAxW17bFYiNV0dGKPM7zXv3iwU6M1J
	 VNZiL9+tAaTSGovZS2yOj07AzbyxNjhEgq2dIdm5InK3kGpwYA59FNsI5w4Nd1d5jfvC1
	 Orcj0Hv7HldP58IBLKCqso3w2g03lPyf9qbagT8H1xbEHzDBS4NWGKEyja5Rr+GT9U8Tx
	 i9qDgMWIRaQQazZryvStAI5ByV1whkascKrXFktQb5KT+ysPrutOBeoL8ky9u8hYp9+Fl
	 sk0QYo34PdwhalAiDxiD6l246dwIC92fXuc+WrK8pmrzu62MH/gZlSp/sGW+pnWzhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689007;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=tG1hE/HyfOB8WQTQbRwY2igncordZtbN4VvNsNNGklE=;
	b=JjZbb6lMSgqbvoJuwHCk66ockW1ErGPLc9Gqdtj8KGKtxFzJuz7vX1xUHJcJoxDovuAF
	 DLpu4sM0SE8QgBjLOZgVn1NB5Xxu3Z1d7g+KGEsYaQBmyXRsXb4cXs0POzXbTfMxlTy7f
	 sz0/dkzSMbfnUOkDywMFDmPimwGtIh9JY87Z4ChvmaEt2fyR1HVcbJje7ZCUeKvRsGoPa
	 /dOnemvgMOc8NbpXDjKoGBQnXLKl1rB+GbRplPhjeJ9HSyQsnas4aODTcWxXg9bWcR3T4
	 9l3fzXHFFa1QTcxBYt0lUl4bjmnE2luRV1Yi0h725yOw65zC6sTCiXAhbeFiZcO55YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKF0RUc+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE0606A326;
	Thu, 26 Nov 2026 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bKF0RUc+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD401F000C4;
	Thu, 26 Nov 2026 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689006;
	bh=tG1hE/HyfOB8WQTQbRwY2igncordZtbN4VvNsNNGklE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bKF0RUc+Q1o1FVoAUC0mKFJqzQZPLgfpF8ex9wjN19LAf+Wwx5PJNPJArzDixpbxY
	 vifSzDeu35QiWpWYbxK0lxX4vPI3++j+iPIgwMq0tqqpIDg9PTwAiBo5dhUFR7fldR
	 SnZ6T/EXGLgBZFWA2a43rQf5NJflFyeddotcLEUz98TN0+o7mQJpF6NpUPniR5z3Gc
	 /xc6hvnC2qy73zhZk3W95sQ69yda5kjGNAnGBQwOv+FGfcw6dKgnbTr1bWdjHqcvqU
	 p7XQDkLYjnN2E2MCCBvCarwFxQBu/tRK9IC9339yU11kktCTTXA2N70/+TPWWaIZ5e
	 Tujy15Tnf5PpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44A6380A95C;
	Thu, 26 Nov 2026 10:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] tls: don't hide a queued KeyUpdate from poll()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179568900552.1733695.4963034201090560383.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2026 10:30:05 +0000
References: 
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
In-Reply-To: 
 <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-0-8e25101e7be6@gmail.com>
To: Felipe Stival <v0idpwn@gmail.com>
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 18 Nov 2026 17:35:47 -0300 you wrote:
> A kTLS reader that waits for a read event before each recv() can stall
> after the peer sends a TLS 1.3 KeyUpdate. I ran into this while testing
> a kTLS patch for Erlang/OTP.
> 
> Erlang does one recv() per read event, with level-triggered epoll.
> When application data is followed by a KeyUpdate, one recv() can
> decrypt both records, return the data without an error, and leave the
> KeyUpdate queued. Because a rekey is now pending, poll() no longer
> reports the socket as readable. Without another read event, the reader
> never calls recv() again, never sees the -EIO for the KeyUpdate, and
> never provides the new key.
> 
> [...]

Here is the summary with links:
  - [net,1/2] tls: don't hide a queued KeyUpdate from poll()
    https://git.kernel.org/netdev/net/c/285ca329ad4b
  - [net,2/2] selftests: tls: add a poll test for a queued KeyUpdate
    https://git.kernel.org/netdev/net/c/d26b244cdec3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


