Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494613;
	b=IagGTVellNYOjBEM0pfYMs9eArSABF2KN0lc7TCM86abZ4QoVcScgnc1TSJV1M8W566w
	 dGRF/UxD5DyJ3nLPqD1ADeYf+1zaZy/Od5WPXu9U+N5o+F+UT2zUjqIKQegNPsXj1Z33Y
	 Njaha6E63I1DPebDzRThezOmMi37q58Jq5w3qDzFuO7/8SVf4EMGM2RgE6tdwc77w4/bU
	 2OtShVpNnX/c2HmJQYq9I6e1l6omV7kx0NJ3wgjZfJJ8Z+OoRlky2HaMBu1QhzUIzEXvh
	 awiPpOogb6C/R5Z9dFvxx+aGjioNKwABh4Z+2YAUP72Xz4XgX9HDEOdo9I7hJfra3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494613;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=P4h9TC2io46Bq+01lwp1kjn/etlJt1LLfgkjec69ha0=;
	b=35T962vLIg4puJuwIWuCs/tAtu0I+kRs7TzbRoxF8QcbnuzM//HVDqNNI5OspqfuRgFd
	 Z/lBuFTbw4Li1rrbf80vxeWO/rBdWVc+S+7u37uVxI4QhT2wcrOKLmT/R5QnEjjmHo/n+
	 O93JSi8z/FugsuHpdy5RP8+x24xzptypeMZaTH7sA+zEb7A5A6mUZuutmRSA467jGo5nv
	 bvtKyl8oXDnwS3wqZ2l76tDkJ3SsSZaelmORzxVCs6DMD8GURi2RXZmu8pdEg1QWd26ph
	 FRTtETjXOBmshe6JTJ+KIAHQjH7ppVx/wuOMFm7Kve13q5yBo8V2pbhfoSpgsB7ohBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcd74N1W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3FB606A319;
	Tue, 20 Oct 2026 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcd74N1W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7571F000CA;
	Tue, 20 Oct 2026 11:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792494613;
	bh=P4h9TC2io46Bq+01lwp1kjn/etlJt1LLfgkjec69ha0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hcd74N1WF4k/GU9f1SogMznwoL0EZbMDtLgMU+E8thcOXxDUQQaUPT8if2SJJmc7r
	 PWL+CKdV50x9RRt+VOKQ9Ad2R9AxtFCIXvg6JWK90OnDHMmmanHl0TJ93Y6dE0Ck/i
	 TochueyH8NpL70WGAjelgoufkGCUtwS69gcS5Pn9oamK3mepRIhnDpdQWZeIzHo3H/
	 Sdm7h74oPOtRwmcCsd/NQSt9ql5QtBdEwtxNhNKApZhziKqEWBvoHugtoPDI/Sje9z
	 zXCDNVYLzWTcEtw3zc1th86vtBW8tL4KDPJZ++/81HRTFFTCNfZ7ELNMYHJbnzo6ba
	 iPSnw4yKh/FdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F18013808209;
	Tue, 20 Oct 2026 11:10:12 +0000 (UTC)
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
Subject: Re: [PATCH net-next] selftests: tc-testing: preload all qdisc modules
 enabled in config
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179249461152.3669402.6400194971670892353.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 11:10:11 +0000
References: <20261014122045.2375722-1-ivecera@redhat.com>
In-Reply-To: <20261014122045.2375722-1-ivecera@redhat.com>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, jhs@mojatatu.com, jiri@resnulli.us,
 shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 14 Oct 2026 14:20:45 +0200 you wrote:
> tdc.sh preloads only some of the qdisc modules that the tc-testing
> config enables. Add the missing ones: ingress, mqprio, multiq, netem,
> pie, plug, prio, qfq, red, sfb, sfq, skbprio, taprio and tbf.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>  tools/testing/selftests/tc-testing/tdc.sh | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Here is the summary with links:
  - [net-next] selftests: tc-testing: preload all qdisc modules enabled in config
    https://git.kernel.org/netdev/net-next/c/8e793b899b90

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


