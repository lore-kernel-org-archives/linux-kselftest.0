Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204017;
	b=02xR0/DhnWy8GB+g/8YIJ3xr4zhUDyNJW0HkP0oazo3VncpjGAZVuXciy4w1I8nAxl2+
	 PyAWP8hVi8GJ8zsvrlgFG5y5d8OSbnemld7IGjlLU6fXtZnF2SEyFNM0nVcMTzUZmSl0/
	 yCq+tPn62NTwNqKCipUoyk0ucNQGz3Be12BjCFcUb185EIDdbJKl8iSSm6wPAfqFcWoiR
	 hK44dqMCTqTxI6alvHLfMGH3P0s5P9c5n0OMfk3f4GHJYqre1z4j3mY6l305WEmAyeKik
	 2AuXPqeBGgCTHtA8erxH0uKaszaavw/89OpV5ZvKQCkcoJj0bLX4BRCTMA+uSt+9ewA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204017;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GrxJfi88WkqhPVzF/M0DQUHCgV9lItraqCHzofs7pXs=;
	b=5jRD8ChKaYko5oqO0S9+1Ts7OpwrV6vMkQ6ioxqtdABFGJ3ujEKwueRr09VzaTWqxhSs
	 MeOOZWskZcW3WOByy9ZDCyasIei08Xs0rDUQYJowQkuGq+SOUiVKyQ7tI/D0zKBNhBoch
	 xSpLceWObXFEaxZizyk/FDPfgwnmyHeGSw6VR3XmDf9y+ks/PmRl1TTrbgjfjnnUNFB0f
	 AmtztWxsmLhxb6eweiumxITVcr8LN2+GWPUiRgcBe6obgIyf+tCazNUDidUCIAB/Aq27z
	 J+K/R3jtrkUGLt6R70+qACZEBfmySGrfpHInvEu0+iGnhdpypvvIpBszYukhYrblh9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBJL4Ska;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2289606A32A;
	Mon,  9 Nov 2026 06:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GBJL4Ska
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997211F0089F;
	Mon,  9 Nov 2026 06:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204016;
	bh=GrxJfi88WkqhPVzF/M0DQUHCgV9lItraqCHzofs7pXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GBJL4Skaf9FMfW7kd2F2li4/fVbDjQviGF9354FIySX4IiXx/JDCMKO7aZfIt+ii0
	 7RLlt+I7UMt0n/TVKL+UwNno+DMzjjvAgoxtfUBfbtkUMuqzaYJXQz7E6F56qyf3On
	 ZhvW3LhVn4QlXXj7J8i98sT+1sCu3UoRqL6WOd59W4mDWZbyaaL5tyWPJzSbIC9ZLp
	 /frkGKS4CeTAMkJ0PRelFwR0Zeqygu+GRfHQmcf5l0AIzTblMdpcH2O/QzzggL9nvA
	 cQQdpjIKzLb+cIFiJIW/6OQ7R6KMfXhU4Dd7ShP3NI0ZrDLhBdCzlTzMhZCl811Wm/
	 akMa2VmolCMCw==
Subject: Re: [PATCH net-next v2 3/6] net: guard memory provider RX queue open
 and close on unregister
From: netdev-bot+sashiko@kernel.org
To: almasrymina@google.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 daniel@iogearbox.net, razor@blackwall.org, dw@davidwei.uk,
 sdf.kernel@gmail.com, bobbyeshleman@meta.com, dtatulea@nvidia.com
Date: Mon, 09 Nov 2026 06:00:15 +0000
Message-ID: <179420401516.994134.15789672166817166565@kernel.org>
In-Reply-To: <20261108055809.2122934-4-almasrymina@google.com>
References: <20261108055809.2122934-4-almasrymina@google.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit fixes two bugs that came in with the leased-queue
  proxy in commit 5602ad61ebee ("net: Proxy netif_mp_{open,close}_rxq…

--

net: guard memory provider RX queue open and close on unregister

This commit adds a reg_state check to __netif_mp_open_rxq() in
net/core/netdev_rx_queue.c. The check stops a memory provider from being
installed on a physical netdev that is being unregistered when the device
is reached through a leased rxq. It also changes __netif_mp_close_rxq() to
clear rxq->mp_params and return early whenever the device is past
NETREG_REGISTERED, not only when mp_ops is already NULL.

> When a memory provider RX queue is leased to a virtual netdev,
> netif_mp_open_rxq() and netif_mp_close_rxq() redirect through
> rxq->lease and lock the physical backing netdev directly rather than via
> netdev_get_by_index_lock(). This raises two issues during netdev
> unregistration:

[ ... ]

>    phys_rxq->mp_params remains populated until the virtual leasee's
>    netif_rxq_cleanup_unlease() or socket teardown runs. At that point
>    the physical netdev has already gone through dev_shutdown() and must
>    not call netdev_rx_queue_reconfig(). When dev->reg_state >
>    NETREG_REGISTERED, clear rxq->mp_params and return 0.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

[Severity: Low]
Should this have a Fixes: tag?

The rxq->lease redirect in netif_mp_open_rxq() was added by the commit
below. So was netif_rxq_cleanup_unlease(), which calls
__netif_mp_close_rxq() on the physical device:

Fixes: 5602ad61ebee ("net: Proxy netif_mp_{open,close}_rxq for leased queues")

Before that commit, every caller reached __netif_mp_open_rxq() and
__netif_mp_close_rxq() through netdev_get_by_index_lock(). That helper
already rejects devices that are being unregistered.

Could the commit message also say what goes wrong without the fix?

On the open side, unregister_netdevice_many_notify() sets the physical
device to NETREG_UNREGISTERING. It then runs dev_shutdown() and
dev_memory_provider_uninstall() on it before NETDEV_UNREGISTER cascades
into the virtual device's teardown. In that window, a bind-rx on the
virtual device, which is still registered, could install a memory
provider on the physical rxq after the uninstall has already run.

On the close side, devmem's uninstall leaves phys_rxq->mp_params
populated. The old early return only fired when mp_ops was NULL, so it
did not trigger here. As a result,
netif_rxq_cleanup_unlease()->__netif_mp_close_rxq() went on to call
netdev_rx_queue_reconfig() on the shut-down device.

Please state the visible result, for example a queue restart on a
dismantled device, a WARN, or a provider left installed after shutdown.
That would let stable maintainers judge which trees need this and how
urgent it is.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261108055809.2122934-1-almasrymina%40google.com
