Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963848;
	b=s86y2UCRftKYA4SGHofG87WF8CyjCgx97eRnTZ/UqHtBjuHAQxSJbv+CbgETYFa7NtVg
	 dZ5KGezjuNb240py2VgG0Jp1RNPflQzNpqzPB05+IoNX+QowYNBBg6hepAV+WbZWRUMm8
	 +8FmA8I56R6D24AR2RkAhFRWgnjPHLRcTwqS7yXTR9PGJOS4rN7YL+O0d1a6k0gEZMvv+
	 7mKY1JRXXwwRfSEXj+iybDl7qkksgs6/bQBxgog1CUbzw6HkoNe7wQlmwX9YqrEf1uQRt
	 oNQsfPtNOEvtrGIrqkePrdLB4KHwVrMUioTPU91diIpRDOZMR4pHz9zXxpDuGoeq16Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963848;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=spiSNwMqw6AbX/hDUTqMS47gG4n4w4960gOaJUlGy04=;
	b=3+uC4cpuBt4tJv/VT1etJXAH4ljxS6I0QWYgmgmRDSUzbwgRo28k4g3RssMJ5jTQWojH
	 aO30tS99s+1hwnktbPBOFv9s87Mo4NVAg4sTQIA7V3KE+y+BNMppJHfL27kE2u4MtXs7k
	 Zgx8vAdJYZmFcP5JNdhvorhiSZyv+LOvP1nwinnSVy9E8OMZXrQ5SQQpP6+93RBZelP1i
	 kdN29avTSBrzGHhv3/IgX4MDctufYOV9id8NaqnH0MPbNm+zLHBSDUfSSkfZ8QZhgNsXy
	 v5cYbXFRd2XHLM95ZQFoAOTE3dgSphe4T+2QjnThmGlj0FnY5OAuXVDfJml9I3Ewnvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EK2hFLjh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D6606A31D;
	Sun, 25 Oct 2026 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EK2hFLjh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4D81F01825;
	Sun, 25 Oct 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792963847;
	bh=spiSNwMqw6AbX/hDUTqMS47gG4n4w4960gOaJUlGy04=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EK2hFLjh3ynJCHm06kzGv6juEYxjhJlJTKWzlFtgLAhjO7doOQqKX88PeRRGJ3Rhu
	 zGrK2C1PtPEo3n1Bj7G4v1e6DDxtdboQQaWSK/IcVjMcl5WygtkGOvT4Ifbw8WaQ2W
	 /wsGxpWpA+amKPZ4t/sKX8afPpPohxBehhpWPfpWb8mQJkkA/9+FcIA4UG/mw4p1+u
	 t/9m7pdPsuTFvh046wAiEX9vIgBV9V04GhLe1DpWQuK+QmmmpWFnlnsf2c+LrDTEFe
	 hSiZ3zyMeXOWDNSov8A1PGXEy3HHIS25htzcZ1H6MFFcCt9BmmnLn+5McYI2ONIwF7
	 2bHEt0UUBTXbg==
Subject: Re: [PATCH net 2/2] selftests: drv-net: psp: test ipv6 tcp socket
 with extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, kuba@kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 rrameshbabu@nvidia.com, raeds@nvidia.com, cratiu@nvidia.com,
 linux-kselftest@vger.kernel.org
Date: Sun, 25 Oct 2026 21:30:46 +0000
Message-ID: <179296384624.3134.14693952058368574303@kernel.org>
In-Reply-To: <20261021210200.788191-3-toddfreed@meta.com>
References: <20261021210200.788191-3-toddfreed@meta.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On hardware PSP devices such as mlx5, data_send_ipv6_exthdr()
  in tools/testing/selftests/drivers/net/psp.py passes whether or not…
- [Low] The docstring of _remote_udp_from() in
  tools/testing/selftests/drivers/net/psp.py describes the filter as…
- [Low] data_send_ipv6_exthdr() in
  tools/testing/selftests/drivers/net/psp.py opens the PSP connection at…

--

selftests: drv-net: psp: test ipv6 tcp socket with extension headers

This adds data_send_ipv6_exthdr() to the psp.py selftest. It sends on an
IPv6 PSP TCP socket without options, then with IPV6_DSTOPTS or
IPV6_HOPOPTS set, then with the option removed. After each phase it
checks tx-packets and what the peer received. It also adds the
_get_quiesced_stat() and _remote_udp_from() helpers and enables
CONFIG_NET_ACT_GACT in the config fragment.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index a5b1e14f120f0..2a109ef61468a 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> @@ -120,6 +120,57 @@ def _check_data_outq(s, exp_len, force_wait=False):

[ ... ]

> +def _remote_udp_from(cfg, src, dst):
> +    """
> +    Count what reaches the remote from @src to @dst as UDP, with a software
> +    filter on its ingress (offloaded filter counters are refreshed
> +    periodically). Returns a function reading the count, or None if the
> +    filter can't be installed.
> +    """
> +    flt = (f"dev {cfg.remote_ifname} ingress protocol ipv6 pref 1 "
> +           f"handle 0x5053 flower")
> +    try:
> +        qdiscs = tc(f"qdisc show dev {cfg.remote_ifname}", json=True,
> +                    host=cfg.remote)
> +        if not any(q['kind'] == 'clsact' for q in qdiscs):
> +            tc(f"qdisc add dev {cfg.remote_ifname} clsact", host=cfg.remote)
> +            defer(tc, f"qdisc del dev {cfg.remote_ifname} clsact",
> +                  host=cfg.remote)
> +        tc(f"filter add {flt} skip_hw src_ip {src} dst_ip {dst} "
> +           f"ip_proto udp action drop", host=cfg.remote)

[Severity: Low]
This isn't a bug, but the docstring says the filter counts UDP from @src
to @dst. The filter is installed with "action drop", though, so matching
packets are also dropped while it is in place.

Could the docstring mention the drop? Alternatively, "action pass" would
keep the filter a pure counter.

> +    except CmdExitFailure as e:
> +        ksft_pr(f"Can't count UDP on the remote: {e}")
> +        return None

[ ... ]

> @@ -624,6 +675,71 @@ def removal_device_bi(cfg):
>          _close_conn(cfg, s)
>  
>  
> +def data_send_ipv6_exthdr(cfg):
> +    """ Test that IPv6 packets with extension headers are dropped """
> +    cfg.require_ipver("6")
> +    _init_psp_dev(cfg)
> +
> +    s = _make_psp_conn(cfg, 0, "6")

[ ... ]

> +    for name, opt in (("IPV6_DSTOPTS", socket.IPV6_DSTOPTS),
> +                      ("IPV6_HOPOPTS", socket.IPV6_HOPOPTS)):
> +        # 2. With the option: dropped, not counted, and nothing reaches
> +        # the peer. The data stays queued.
> +        s.setsockopt(socket.IPPROTO_IPV6, opt,
> +                     bytes([0, 0, 1, 4, 0, 0, 0, 0]))
> +        tx_pkts = _get_quiesced_stat(cfg, 'tx-packets')
> +        udp = remote_udp() if remote_udp else 0
> +        queued = _send_careful(cfg, s, 20)
> +        _check_data_outq(s, queued, force_wait=True)
> +        ksft_eq(_get_quiesced_stat(cfg, 'tx-packets'), tx_pkts, comment=name)
> +        if remote_udp:
> +            ksft_eq(remote_udp(), udp, comment=f"{name}: UDP at the remote")

[Severity: Medium]
On mlx5, is this the only check that can tell a fixed kernel from an
unfixed one?

The commit message says that without the fix, mlx5 sends the phase 2
packets unencrypted and doesn't count them in tx-packets. The driver
takes tx_packets from a hardware counter:

drivers/net/ethernet/mellanox/mlx5/core/en_accel/psp.c:mlx5e_psp_get_stats() {
    ...
	stats->tx_packets = nstats.psp_tx_pkts;
	stats->tx_bytes = nstats.psp_tx_bytes;
	stats->tx_error = atomic_read(&priv->psp->tx_drop);
    ...
}

So the ksft_eq() on tx-packets holds with or without the fix.

The leaked packets reach the peer as UDP, not TCP, so _check_data_rx()
also passes. Phase 3 retransmits without the option, so it passes too.

_remote_udp_from() returns None from its except block on any
CmdExitFailure. Examples: no tc, flower or gact on the remote, no
permission, or an existing filter at pref 1 / handle 0x5053. In that
case udp is set to 0, this check is skipped, and the test reports PASS.

The commit message does say "if the peer can't take the filter, that
check is skipped". Even so, could the test raise KsftXfailEx or
KsftSkipEx when remote_udp is None on a device other than netdevsim? That
way CI could see that the case wasn't covered.

Another option is a check that doesn't depend on the remote, such as
tx-error. mlx5 reports it from priv->psp->tx_drop, which increments when
psp_dev_encapsulate() fails. netdevsim doesn't report tx-error, so this
check would have to be per device.

> +        _check_data_rx(cfg, total)
> +        total += queued

[ ... ]

> +        _check_data_rx(cfg, total)
> +    _close_psp_conn(cfg, s)

[Severity: Low]
Should the code from _make_psp_conn() up to here be wrapped in
try/finally? _data_mss_adjust(), data_stale_key(), removal_device_rx()
and removal_device_bi() all close the connection from a finally block.

ksft_eq() and ksft_gt() don't raise, but several calls in between can:

- _send_careful() raises RuntimeError after 10 EAGAIN retries. This is
  more likely in phase 2, where nothing gets acked.
- The count() closure raises KsftFailEx. Its "tc -s filter get" call can
  also raise CmdExitFailure, since it is outside the try/except in
  _remote_udp_from().
- s.setsockopt() can raise OSError.
- The rx_assoc and tx_assoc calls can raise NlError.

If any of these raises, "data close" is never sent. The responder keeps
its data socket until the next accept, where it prints "WARN: new data
sock but old one still here".

The local socket is only closed once it's garbage collected. If the
exception happens in phase 2, the socket still has the extension header
option and queued data. It then keeps retransmitting packets that
psp_dev_encapsulate() drops, until it times out.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261021210200.788191-1-toddfreed%40meta.com
