Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8918EB0;
	Sun, 29 Mar 2026 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774823492; cv=none; b=QrHUPBS7InmgQ1Pa6oHUQFZIiSsSH8bW5qmFROgt4cIYehPr1AxypYMP9qQy0k4BinQxDhZTSdGklVcNQ2MnEedCEnKDhDvb9i9SMwwtLaPMlZ9xc9llKtMR4Fo35k5lH7QNZvKumU1c7O32qcuXE7IosUjDb+ClJsmaSmV2sms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774823492; c=relaxed/simple;
	bh=RA8DnV0hQRDREKNhohv2PyO0L+kW8dFp3Hbn8fzGax0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OWRWNy+gAY16WAQqpIkJMdF8K71/E7zLJKp4+jCiReHUZQ2X+rX3mms0+jRUCJMRwCJDg45OBhFMzf7jjrgaUeFb5+S7q7T3c4PdVPPeq0UHpzRYTKc0Bisf+WrNL/xFabCq5vy/sAKpPp8MMQ9TLQn7H6eGpUA3bagsa1e1g+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hxx+dkiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hxx+dkiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CE8C2BCB1;
	Sun, 29 Mar 2026 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774823491;
	bh=RA8DnV0hQRDREKNhohv2PyO0L+kW8dFp3Hbn8fzGax0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hxx+dkiVB2+js0zIvoY+Gfn11VoQaxLdccHW30w6UDwcyUeBpOTXcDPc2hueOuEwS
	 gca9jjos5F2f5n+JtacCvPCEddNNZOCT+yQB2cMHkwz5He32Q/cJPkybGDceWbYS1f
	 jwThVsNE3LPFxstMH9Gfh2/7ZQg4Q5aHKL0Ibe8qZ/y0xlB4YvuAXJ8+HlYLJpk67D
	 EDnil4PQu7ntN9gvxJr+0iCUMG7mf/LpmjvEmxJ2xb7b3GWwB9ZVjuBMuPgsEG25q3
	 zw3QRSib9bHhwJJnpfopGfl7+ZP6/t61iXpj6nQCZtd2kmy4fx8SBxLB4UOb0+zUAc
	 /jhzaHm2Lc5wA==
Date: Sun, 29 Mar 2026 15:31:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org, leon@kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [net-next v6 12/12] selftests: drv-net: Add USO test
Message-ID: <20260329153130.61b29766@kernel.org>
In-Reply-To: <20260326235238.2940471-13-joe@dama.to>
References: <20260326235238.2940471-1-joe@dama.to>
	<20260326235238.2940471-13-joe@dama.to>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 16:52:31 -0700 Joe Damato wrote:
> Add a simple test for USO. Can be used with netdevsim or real hardware.
> Tests both ipv4 and ipv6 with several full segments and a partial
> segment.


> +def _test_uso(cfg, ipver, mss, total_payload):
> +    cfg.require_ipver(ipver)
> +
> +    try:
> +        ethtool(f"-K {cfg.ifname} tx-udp-segmentation on")
> +    except Exception as exc:
> +        raise KsftSkipEx(
> +            "Device does not support tx-udp-segmentation") from exc
> +    defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")

If may have been on already when we started, no?

> +    expected_segs = (total_payload + mss - 1) // mss
> +
> +    rx_before = _get_rx_packets(cfg)

Let's run a little program on the remote that receives the packets
and validates they were correct? Maybe socat can do?

> +    port = rand_port(stype=socket.SOCK_DGRAM)
> +    _send_uso(cfg, ipver, mss, total_payload, port)
> +
> +    time.sleep(0.5)

What's this? Did you mean to wait for stats to settle?
cfg.wait_hw_stats_settle()

> +    rx_after = _get_rx_packets(cfg)
> +    rx_delta = rx_after - rx_before

Instead of checking Rx (which is probably fine) we may want to check Tx
has the right number of frames. Sender may have mis-counted the whole
USO as one packet if it's buggy?

> +    ksft_ge(rx_delta, expected_segs,
> +            comment=f"Expected >= {expected_segs} rx packets, got {rx_delta}")
> +
> +
> +def test_uso_v4(cfg):
> +    """USO IPv4: 11 segments (10 full + 1 partial)."""
> +    _test_uso(cfg, "4", 1400, 1400 * 10 + 500)
> +
> +
> +def test_uso_v6(cfg):
> +    """USO IPv6: 11 segments (10 full + 1 partial)."""
> +    _test_uso(cfg, "6", 1400, 1400 * 10 + 500)
> +
> +
> +def test_uso_v4_exact(cfg):
> +    """USO IPv4: exact multiple of MSS (5 full segments)."""
> +    _test_uso(cfg, "4", 1400, 1400 * 5)

Variants are probably a good fit here.

