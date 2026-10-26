Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793056951;
	b=eZI4bDFUTO1YmCUM3V7DAzdFM78z6p1iOZbFBImAEkM+IbwGc4xEey0nh/EQcRhMHNVZ
	 CmkMofnLyQjClHaBtrZSk6m20BWNBZ7PXYMbIRN4Xem23jQHQdkwConYQekWQ29AKPNJd
	 u7j6UWA2/IRHruahfwFQUEipb9J0dIb4yMjZIYKsRmu5LTHqerxmqjdytPFg0MIGnKZBZ
	 e0FhyyR66ubwN17iIXCawPgAGBbp8XBataIbfrfljRy2WDfPO4FvsYn62xPvmEbVKFsX1
	 kz28w7qNQf5sP5pbMHxQLG4O199f6iu1CSBoL0fMpJ+dZZqD4PAHWHQJ2YVpGVPCaJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793056951;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=7lM2Mqsk/hocQkB6Na6d65iO/yR/VkAaqAirvZIJrpc=;
	b=mL9Nbl4DeawYQuVpwId4wlZsXozpF/LAQV4ju1GHI3sts07pGFYP48Oy+IoWEn6H/93H
	 DPpR4uURywaYo+qDvynyOW1FDw+FwiX73KDU9DY2/9MMQks1n+8LfMdGpyluGrq96e/6K
	 U0C2+nt4u3EYYunAOFGLjecx8eHCE6YhetI57EKASQFI4OcqIdPykzBa6w5kxT739HLi1
	 mJ6+R1zQY2EKhvYcwLlD4iTwS63ptbSe6sYbSz8/LphzBjz0VD8N/q1hztS0EoHp/XKCA
	 cB26uMBP7jVJSE+LJ5GSHPJTudjzqeOo66qa3UkgkZKrlorud7rO6b/5Reh+r9XeJ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IxMasNM6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB70606A329;
	Mon, 26 Oct 2026 23:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IxMasNM6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D921F01829;
	Mon, 26 Oct 2026 23:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793056951;
	bh=7lM2Mqsk/hocQkB6Na6d65iO/yR/VkAaqAirvZIJrpc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IxMasNM6a4cp+7yLBdwNN2wF8PpOOrK9xhaOzATxFJeJCsuJ3dwo8P9ywMnSs8Wdg
	 Ayttm+KnzuXugCWXQpxqFKFbplqrPFr0+k4xy83wuv3riX9gmQsmNnOYbDBoH6zlU+
	 beExa/vSf1MCQDX/WD+WfWvEDTYK3+HOqwB6yb8CB1ET9ARZ4U/0F6K+VlPMRgcZZe
	 kVEyh0F1wI12GZai6jMwbknQT6OTfuZ1QMG3VZkaB0TJ9PcTcQdM1bwd+oDAiXFDNW
	 adho0BM9U+rjJKWJGdPgWlhI+S941JD5c8e3bdDVLkY/K4n8yQ/ohjkEoRvR1NnuRp
	 ttf23nL/lQaDw==
Subject: Re: [PATCH net v2 2/2] selftests: drv-net: psp: test ipv6 tcp socket
 with extension headers
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, daniel.zahka@gmail.com, kuba@kernel.org,
 willemdebruijn.kernel@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 pabeni@redhat.com, horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org,
 raeds@nvidia.com, rrameshbabu@nvidia.com, cratiu@nvidia.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bjorn@kernel.org
Date: Mon, 26 Oct 2026 23:22:29 +0000
Message-ID: <179305694967.3134.10935221187526679130@kernel.org>
In-Reply-To: <20261022223014.556388-3-toddfreed@meta.com>
References: <20261022223014.556388-3-toddfreed@meta.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/drivers/net/psp.py,
  data_send_ipv6_exthdr() is supposed to skip when the remote UDP filter…
- [Low] In tools/testing/selftests/drivers/net/psp.py, the docstring of
  _remote_udp_from() describes a counter only: "Count what reaches the…

--

selftests: drv-net: psp: test ipv6 tcp socket with extension headers

This adds a PSP selftest that sends on an IPv6 TCP socket in three
phases: no options, then destination options, hop-by-hop options and a
segment routing header, then with each option removed. After each phase
it checks the device's tx-packets and the data the peer received. It
also installs a tc flower filter on the peer to confirm no plain UDP
arrives, and skips the test if that filter can't be installed.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index a5b1e14f120f0..47e8cb19f3763 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

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
This isn't a bug, but the docstring above says the helper counts what
reaches the remote, and the commit message says:

  "a software filter on the peer also counts udp packets from the
  socket's address to the peer's"

The filter is installed with "action drop", so matching UDP packets are
dropped at the peer's clsact ingress for as long as the test runs. That
is also why CONFIG_NET_ACT_GACT was added to the selftest config.

Should the docstring mention the drop? Or would "action pass" be enough
if counting is all that's needed?

[ ... ]

> +def data_send_ipv6_exthdr(cfg):
> +    """ Test PSP on IPv6 packets with extension headers """
> +    cfg.require_ipver("6")
> +    _init_psp_dev(cfg)
> +
> +    s = _make_psp_conn(cfg, 0, "6")
> +    try:
> +        # In happy path, PSP traffic arrives at the remote decrypted as TCP
> +        remote_udp = _remote_udp_from(cfg, s.getsockname()[0],
> +                                      s.getpeername()[0])
> +        if not remote_udp:
> +            raise KsftSkipEx("can't count UDP on the remote")

[Severity: Medium]
Does this skip path really get reported as a skip?

At this point _make_psp_conn() has opened the data connection, but
_spi_xchg() hasn't sent the client's key yet. On the responder,
run_session() calls conn_setup_psp() synchronously for the new PSP data
socket, and that function blocks waiting for the key:

tools/testing/selftests/drivers/net/psp_responder.c:conn_setup_psp() {
    ...
	send(data_sock, info, sz, MSG_WAITALL);
	psp_rx_assoc_rsp_free(rsp);

	sz = recv(data_sock, info, sz, MSG_WAITALL);
    ...
}

After KsftSkipEx is raised, the finally block at the end of
data_send_ipv6_exthdr() runs:

data_send_ipv6_exthdr()
  _close_psp_conn()
    _close_conn()
      _send_with_ack(cfg, b'data close\0')
        cfg.comm_sock.recv(4)

The responder is single-threaded and still blocked in recv() on the data
socket, so it can't handle 'data close'. cfg.comm_sock has a 1 second
timeout, so recv(4) raises TimeoutError. That exception replaces the
KsftSkipEx, and ksft_run() counts the case as a failure instead of a
skip.

The s.close() in _close_conn() is also skipped. When the responder
later sees EOF, it handles the queued 'data close' with no data socket
and sends an unsolicited 'err\0' on the control channel.

This path is hit whenever any of the remote tc commands fail. For
example, cls_flower or act_gact may be missing on the remote, an
ingress qdisc may already be present, or the pref/handle may already be
in use.

Could the filter be installed before _make_psp_conn()? Or could the skip
path close the data socket without going through _close_psp_conn()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261022223014.556388-1-toddfreed%40meta.com
