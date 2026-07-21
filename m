Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098583CDBDD;
	Tue, 21 Jul 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625644; cv=none; b=OomrObydaEFhQZnZNI19FD07LFoggjvZEERqrqD8K5wIU3Qd16GTlTFiPTu7vRnhmZ0+pq0WMewmK/3lMoPkLwAaZirJJYDk4bhLM9N/y9Cq8iA9P7X2Aer8KkniTdcbuMJZUxZqjCtmZy4+0vmLfj3QaGfRCVvAVBDbneHXGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625644; c=relaxed/simple;
	bh=p3zKmaZFPywJoIWwYfLagtwe/rExwCK1TmtNvg7iyRk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ATygKN8tzXt/Vt1Ig7q8z4wT9aJW9bY2MRZSdvZE+L5jxtffKRftuBHZ6dxJPHbWoLM1PFeGdNrTXc3LJX1rbhi6CfzKN2N9LUwFwslYNY+wCnGrrV8RvrgqkYbEjtWjTL2nLGGQr1bAOXRUz+QK11vrXLCo1R5MqtqR9wBsUxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCQHbLk+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCQHbLk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6D71F00A3D;
	Tue, 21 Jul 2026 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625642;
	bh=ZAW1qs5D9yO0/G/RYt97dc6BMFl9XdJHCu78sCCSM4U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PCQHbLk+ujsPN5h+C/T0vqzllW73ar5YvK7HrFXlQo9nW1i99NRnd2Rl1Fvm0V6vN
	 65CAnVXC+vUaGlm9dEZVy5fdYltUYF+zAAe7/AjomMnqfVZ7If9lpwG1LOmnSlaTeo
	 Cdnrn/d+bUaI0jSMf7sSAewdnrko5/ibFRLbElYnZsPtUZRETa6vzqNlNwv+PccOTW
	 fYcJhOKzikiWrj3i3LMAP+wmsrClcaT9A12PyIw64mAnAMvdHk5MEnMqIhFF4H22Px
	 PvPptKtQ4MG1awWgjfLMLgbsEr/Xj8LSrc1GaUAClcSsqt0FDY8yVFR+2zJsHHG2Z9
	 AXqmi2LVNZzQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A263924A46;
	Tue, 21 Jul 2026 09:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v6 0/2] udp: fix FOU/GUE over multicast
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178462561238.179594.6393458735106930656.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 09:20:12 +0000
References: <cover.1783372173.git.littlesmilingcloud@gmail.com>
In-Reply-To: <cover.1783372173.git.littlesmilingcloud@gmail.com>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, willemb@google.com, davem@davemloft.net,
 dsahern@kernel.org, edumazet@google.com, kuniyu@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed,  8 Jul 2026 03:35:02 +0300 you wrote:
> UDP encapsulation (FOU, GUE) has never worked correctly with multicast
> destination addresses. When a FOU-encapsulated packet arrives at a
> multicast address, it enters __udp4_lib_mcast_deliver() /
> __udp6_lib_mcast_deliver() which call consume_skb() on packets that
> need resubmission to the inner protocol handler, silently dropping
> them instead.
> 
> [...]

Here is the summary with links:
  - [net-next,v6,1/2] udp: fix encapsulation packet resubmit in multicast deliver
    https://git.kernel.org/netdev/net-next/c/3cb8d4b9bfeb
  - [net-next,v6,2/2] selftests: net: add FOU multicast encapsulation resubmit test
    https://git.kernel.org/netdev/net-next/c/e5382133c51c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


