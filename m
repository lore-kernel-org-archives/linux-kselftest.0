Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01934334BA;
	Fri, 24 Jul 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900268; cv=none; b=gsGWR35cxJM73AcvE8A/OfyoSdvat0ZLsqn7FPg65ldEF7USagSjYkQZGQbt0SrRRP+NMvDbhCtDNdtrpc63n3T5KqvCX/fX+49ZxD1XrjkbN2NeA6CVcLXWTIPJp6oBPIkLjNCIldxQMrz95ID8r/HvKfEKj2qbDqfTE8HHSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900268; c=relaxed/simple;
	bh=fNS6kQIJ+SnfNlmts2ZYPI5bHtweKvzJHuxSrQ5wK/8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIJp+rE8FjXKHAPZ5m/tGe1onthCJ3olNJbKRgdKum6FQkqgxT0fCHHdhezMr/H/89A/W64olxl1VmeQR50p1BFFMjOzIt6MV89N/EbVtH6fT7B+8sTKY50DX5l4Z+SGFfSMXlydHkXD4n/8n4IdrdSPgvUChIRVSJjIcrE4ksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcQMrVxR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcQMrVxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17931F000E9;
	Fri, 24 Jul 2026 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784900266;
	bh=OMtPjCXxFvechCCjNIKjAi2Px43cGNs25a3TNZ/bnaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lcQMrVxRcv0ty3eH2k6SuuV6OuKGlYugzyQdIuNlPVIeibgoGXqfvhYYssyD3ynSt
	 fmDB9zwg0tdNU9yqeKbd43BK4gxZt6KMlSChqJTBD/cgRkkRc9e2tpbZSMBhmVIWoX
	 fZvai5oGxw2KHTlMZny+bCtJgr6ppKZap2OzcGUBe2Ro/6zyTBtglUDjAOmEDYshGr
	 mqDNIumI3ANoeEL0EbBdPhfp1jKNbArUHk1FgHQyhhYHWE+bs7y09RUycOwR12WviL
	 hPh2a/hFBQDhVEz1ZqiIY28QfrXozyeZjf/R7YooK5+60OdG/570+Z7w4jAZ85myF3
	 HxGZes2JooM9g==
Date: Fri, 24 Jul 2026 06:37:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next V3] selftests: drv-net: Test queue stall upon
 reconfig
Message-ID: <20260724063744.7d0478da@kernel.org>
In-Reply-To: <20260723234857.2880270-1-mohsin.bashr@gmail.com>
References: <20260723234857.2880270-1-mohsin.bashr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jul 2026 16:48:55 -0700 Mohsin Bashir wrote:
> Add a reconfig_tx_stall test that detects the possibility of a TX stall
> after ring reconfiguration. The key observation is that drivers using
> netif_tx_start_all_queues() are prone to experiencing a stall when
> reconfiguration completes compared to drivers using
> netif_tx_wake_all_queues(). start_all_queues only clears DRV_XOFF, while
> wake_all_queues also calls __netif_schedule() to kick the qdisc. Without
> the kick, qdisc backlog present at reconfig time can stay stuck until a
> new trigger is issued.

AI CI says:

The new `reconfig_tx_stall` test introduced by this patch is failing in
the NIPA CI on the netdevsim-based test environment (both regular and
debug kernels):

  not ok 3 ring_reconfig.reconfig_tx_stall

  Exception|   File ".../ring_reconfig.py", line 331, in reconfig_tx_stall
  Exception|     raise KsftFailEx("failed to build qdisc backlog")

The failure is a precondition failure =E2=80=94 the test sends three bursts=
 of
128 SO_TXTIME packets at +100ms, +200ms, and +500ms delays and after each
burst checks whether a qdisc backlog has formed on the target TX queue.
No backlog appears after any of the three attempts.

The test never reaches the actual ring-reconfig assertion; it fails
because the required qdisc backlog cannot be built on netdevsim under CI
conditions. This is likely because netdevsim drains its TX rings
(and/or releases SO_TXTIME packets) fast enough that no backlog
accumulates within the allotted windows, even with napi_defer_hard_irqs
set to 100 and the ring capped at 64 entries.

The other two sub-tests (ring_reconfig.channels and
ring_reconfig.ringparam) continue to pass.

Could you look into why the backlog-building phase does not work on
netdevsim? Possible approaches:
 - Add a check/xfail if the backlog cannot be built after N attempts,
   converting it from a hard failure to a xfail on virtual drivers
   (prefer xfail over skip)
 - Adjust the parameters (ring size, packet count, delay) so the
   condition is more reliably triggered
 - Mark the test as requiring a real NIC (nsim_test=3DFalse) if the
   technique fundamentally doesn't work on virtual devices
   and move it to the hw/ directory

https://netdev-ctrl.bots.linux.dev/logview.html?f=3D/logs/vmksft/net-drv/re=
sults/747522/8-ring-reconfig-py/stdout
