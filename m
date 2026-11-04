Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753088;
	b=UP5/kgwWgLVtR5A/RGRwiKYrOUyfsLo9H30mml8e0tXG16KDMsU69BIPDm2/qgnHW/PS
	 SyrZSOvfqhol6Ag2Ha1GslMv0xTXUDF/4XjBm5iaPBmr8raTZQeb0zM5/ukcjxcof+W8a
	 Ij+d/aCtJhGnOEBD3knDH2skVcCGl8f2AcE5s6W0+p8Vrpav2/0dYkbm76zRs3SbheWVs
	 kBWoMXFrxty7VJ0zt46FHsboju1b5uCmXJW2SAzkPSomF1hN69riPvXNIz6TcKCi8IbO3
	 bZjsi/cVQhrE8nlcfh7TiAWLf5EhX3znvEX8q7E9JCLVk04q+JbxbY5Nl7Axo6U1i6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753088;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=c35T3kU6/qhinEdzbeAC7pzjMrrfVOHaMqt5ai5YUPI=;
	b=wEhZPrgXElbNAZYkdhNGLkU9/UcCcEHnGCCnPRm6L9tDjESUyTQGjvNAz12uSWx6bxF2
	 A8lHbxV+TUq9S8DKyu05MnglYvoklohh94054L3/DiuPFBFCIPnOtBCNQxFHZqRQ2JlOz
	 HJTwKkichK+4ZPb+wSRGPaVThA7E1CaZDmi6hXiYftRy0RsW/FS/Frftv6KDRhIM06HZh
	 MjZTtre3sJh1A0CyPzxeKauhPFAuEL45CtoPKmJoGrwFUuZlEr4XQkKdmgsN8X2nbROrt
	 By5U6h5q7eyskcRIGpjnL+IBBlD2fpLNX4mPGaPR5Ccp53PPLzJULza2jIXPsuIugwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvUeAFcH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DE6606A338;
	Wed,  4 Nov 2026 00:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvUeAFcH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9A51F00A16;
	Wed,  4 Nov 2026 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753088;
	bh=c35T3kU6/qhinEdzbeAC7pzjMrrfVOHaMqt5ai5YUPI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CvUeAFcHHcVCUq6HZBEHdgEg/1GmpEdfRPTVzmnEMjGtVaS5PQ5RuzE+vrA0h8FZO
	 FB5cJSkUfold601UkR450pZDG/bt3KHVo7DgoSeCfmqj+uUA58ZbOV4T73Ut7f+DNu
	 bAPLI+G/MOayXAzR2P4UY/2aRj7DUWyyc99JLNAhFDYCr86CyF2MJFdnENxHLvpPuA
	 T3kc+iSIZT9CXgiS5geV+83eYQgS8a1jZcwZ2NchqquZTo2fg+gXq+hpe3DN9ZzUlh
	 RgS5m7nlonSmqabPRFCpOrJwF6OhZiznCxj71UyJ/qciPQNeOrMKrKH0xUhl2n35hQ
	 Y7S/kL3U7giAw==
Subject: Re: [PATCH net v4 6/7] selftests: drv-net: psp: test that ipv4 psp
 packets aren't fragmented
From: netdev-bot+sashiko@kernel.org
To: toddfreed@meta.com
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 sashiko-bot@kernel.org, kuba@kernel.org, bjorn@kernel.org
Date: Wed, 04 Nov 2026 00:44:47 +0000
Message-ID: <179375308755.488856.948082964372253216@kernel.org>
In-Reply-To: <20261103001143.246081-7-toddfreed@meta.com>
References: <20261103001143.246081-7-toddfreed@meta.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In data_send_ipv4_frags()
  (tools/testing/selftests/drivers/net/psp.py), the remote leak detector…

--

selftests: drv-net: psp: test that ipv4 psp packets aren't fragmented

This adds data_send_ipv4_frags() to the PSP selftest. It raises the route
MTU on both ends above the device MTU and sets IP_PMTUDISC_OMIT on a PSP
socket, so that its IPv4 packets would need fragmenting. It then checks
that no fragments reach the peer and that IpFragFails increases.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index c9a725cc89a27..f6888f93cb937 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> +def data_send_ipv4_frags(cfg):
> +    """ Test that IPv4 packets of a PSP TCP socket aren't fragmented """
> +    cfg.require_ipver("4")
> +    _init_psp_dev(cfg)
> +
> +    # Fragments which get out reach the remote. Set up the count before
> +    # connecting, so a skip doesn't leave the responder mid key exchange.
> +    loc, rem = cfg.addr_v["4"], cfg.remote_addr_v["4"]
> +    remote_frags = _remote_count(cfg, "ip",
> +                                 f"src_ip {loc} dst_ip {rem} ip_flags frag")

[Severity: Medium]
Is loc guaranteed to be the source address the PSP socket actually uses?

loc is LOCAL_V4 from the environment. NetDrvEpEnv only checks that it is
set. It does not check that it is the address the kernel prefers toward
REMOTE_V4.

The socket is not bound to loc either. _make_psp_conn() does:

    s = socket.create_connection((remote_addr, cfg.comm_port), )

The local /32 route that _ipv4_route_mtu(rem, mtu) adds pins the source to
whatever "ip route get" returned:

    ip(f"route add {dst}/32 dev {route['dev']} src {route['prefsrc']} "
       f"mtu {mtu}", host=host)

So the socket's source is route['prefsrc'], and nothing compares it with
loc. Using a secondary address on NETIF as LOCAL_V4 would be enough to make
the two differ.

When they differ, the remote route added by
_ipv4_route_mtu(loc, mtu, host=cfg.remote) does not apply to this
connection. With equal device MTUs, the peer's MSS clamps ours. The test
then skips with "mss N needs no fragmenting" and never exercises the path.

If the remote device MTU is larger, the test does run. Without the fix in
"net: don't fragment decrypted skbs", though, the cleartext fragments carry
src=prefsrc. The flower filter would not match them, so this check passes
trivially:

    ksft_eq(remote_frags(), 0, comment="fragments reached the remote")

Only the netns-wide FragFails delta is left, and the test's own comment
says that one only confirms the drop. Any unrelated FragFails increment
during the 3 second send window would then make the test pass falsely.

data_send_ipv6_exthdr() avoids this by building its filter from
_src_addr(peer). Could this test do the same? Some options:

  - use route['prefsrc'] (or s.getsockname()[0]) for both the filter and
    the remote route
  - bind the socket to loc
  - skip when loc and the chosen source differ

A related, smaller point: the skip check compares mss against
cfg.dev['mtu'], but fragmentation uses the MTU of route['dev']. Nothing
checks that route['dev'] is cfg.ifname. Should that be checked as well?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261103001143.246081-1-toddfreed%40meta.com
