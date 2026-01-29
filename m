Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B9364051;
	Thu, 29 Jan 2026 03:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769658630; cv=none; b=OPXdVbqVAoa42Z7B3f8T2kNA2A00+T57g9DagG72lWl/WkR24a0trbVsx/jnZHSJ88dfQIjXA9/754xX8Olha7ldmzsA95JRnw+Bf6w/vF6vyWfVzFHDkq3HS5EuEDt4t0q3AT8OOOhNvxcM3jIi1f4Y5VzBInJG4kXL1OhsYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769658630; c=relaxed/simple;
	bh=IJ5E1noVH2gjNhFcvoRo5R0tEe6wpax5Bx3BBh5VqGc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Zd9M7Dl0p/GhuhX3jUr4geeC4saheLubcmtOH/vYSIGIqeLPccLyA048EfcBDNmV2FnOjgbkh6p3OOl55khnltipYlTds7eUfw+7HZM9MT+ZnW8QeseMcDYHf9MOmu2NGkyIg4TMIY3CpACNC9FDlVWZJAP2H54PRzTjvbWT1KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6L+HZKm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6L+HZKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9D9C116D0;
	Thu, 29 Jan 2026 03:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769658629;
	bh=IJ5E1noVH2gjNhFcvoRo5R0tEe6wpax5Bx3BBh5VqGc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H6L+HZKmz0TIC7H+P3BF04oGbskMaOf+Kq22JVPAAlNAfhjE0gnH4VGIxTjyrevgJ
	 Y7LGg1sMUe7q+ufk2HVcqLNOIJO/WFNkpfAK90YVsWM1bWCjsCXjKGq6MvBA+B3I0Q
	 F5ukx7U27M9R7ocEzWvRFnUda1EnmssgptAZvXtW574//50wKx72dMqy+6RZBxA+Ke
	 iFVEVlftmEiDZ0vhFekuBT7TKDTgzHs67flGB69K5fM4BakPzb0qxf7U1SMHDTIVxy
	 23lmeIWir4sZ45/fEJ6BteyZOM7PCQpFl+xyjuEf2KFrJ4kFzsipXoYMG1Ar0OCPrU
	 pLS/GWMNROgnw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11B94380AA61;
	Thu, 29 Jan 2026 03:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] selftests: drv-net: psp: fix test flakes from
 racy connection close
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176965862284.2339773.16368482662348009431.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 03:50:22 +0000
References: <20260127-psp-flaky-test-v1-1-13403e390af3@gmail.com>
In-Reply-To: <20260127-psp-flaky-test-v1-1-13403e390af3@gmail.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org, willemb@google.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 27 Jan 2026 08:30:55 -0800 you wrote:
> There is a bug in assoc_sk_only_mismatch() and
> assoc_sk_only_mismatch_tx() that creates a race condition which
> triggers test flakes in later test cases e.g. data_send_bad_key().
> 
> The problem is that the client uses the "conn clr" rpc to setup a data
> connection with psp_responder, but never uses a matching "data close"
> rpc. This creates a race condition where if the client can queue
> another data sock request, like in data_send_bad_key(), before the
> server can accept the old connection from the backlog we end up in a
> situation where we have two connections in the backlog: one for the
> closed connection we have received a FIN for, and one for the new PSP
> connection which is expecting to do key exchange.
> 
> [...]

Here is the summary with links:
  - [net-next] selftests: drv-net: psp: fix test flakes from racy connection close
    https://git.kernel.org/netdev/net-next/c/70de46740b62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


