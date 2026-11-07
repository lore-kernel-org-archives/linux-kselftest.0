Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085172;
	b=qS8irPP309LyWfG+bvCqGzylK4AnscqE93McLRyTpgO1QBYPifBFED4ZIytz3p5tVUT0
	 GYP29Uyvt2ll8ZigkT4szVxt+YfoBzk1kUEueJZxqd7sAbCy8PtQKDNGF6/+7ITP1I+BM
	 5wOClq5bqaNsdZYzfL2vpZb+cLvAl53iNn4Eu5WqZqVhDHduMh/AT6Uk+JhEMMZsdKlDL
	 M7KCGCTKBcAJs/7tfps/h7ck5+4Va6/iIM93bPUh7/JvwBxqZh8jbvguBGIPRnQJGEqt9
	 6Ky96Hkahv9295b4GcvaUIa6AQSiADM2/oIV5aAlaH+ZMDDUkval3Mk6IYuEX7GhGYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085172;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dzuonoA9qOkLc7kATxtO9OD76IIkPooDhtETN2ywYhI=;
	b=NQQ3KZiIobxv7ahVgETo3hm11hHOQUKj6t2FAX8U+AjpeOduqND9CoFEgfG7eO6BIE3O
	 qBixsDRv5P9L7Q+FdlATheqCoI76w/1emzgFPDhy2MWYmqxvdeIb6oNz1muh5gQd0rBw7
	 CMgI4slYMk6cnnKKMVWfCuMqf63O/afxeYzPf53TZa1zb9bFo3Tpkl/EcMhyVSjpHr8k4
	 CvY7eOYyLIvi4Kp4foEy9sMoxj1GMs1F6SKpUzYV73kgIEcbs33PCI/ur+KQtfnHmKncs
	 CfCmGHHFN9FK0aiUlwlGNM8yv04fzDUl7iYgTtzO93BhipE4hxKZDyCzfHwBL0Fq/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odcQ+DoD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99E7606A32E;
	Sat,  7 Nov 2026 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odcQ+DoD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E15F1F008A2;
	Sat,  7 Nov 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794085171;
	bh=dzuonoA9qOkLc7kATxtO9OD76IIkPooDhtETN2ywYhI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=odcQ+DoD+ixuvrLkIaAD3Ybtp7fexE+OCQbPvhz17u8kz/tn2UQuSCo9MYYg4c1gq
	 qRwe0yqsR9zNjzrhCEfKdzPSBjMbZeKzRCV5Cb7zuvSVsZZfvz7Q64w6jFOX3e7QkH
	 wHqaqPgVHN53WJLUjhda/8OSnsSpJpA+Dlg6gA8VOvT/EX8LPWnsowWf8+1vF0pFJi
	 22KKcBSrqDiq5RevrMHv6X8v0SyilSaWkXG1eSnyMvqVVMM7dwQvnezAYb4j+Ru6ww
	 0psIJp+lB9MIf4qfcyR3biqCVJcWxQR4Efsn2BBl+hdAgaSrZYbzmcXroRAW9cADe5
	 aFNBTCG9jBlHw==
Subject: Re: [PATCH net-next v3 5/5] selftests: drv-net: psp: add rekey tests
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Sat, 07 Nov 2026 20:59:30 +0000
Message-ID: <179408517003.994134.18139473201924553095@kernel.org>
In-Reply-To: <20261106-psp-v3-5-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-5-a8dd38f5a727@gmail.com>
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

- [Low] In tools/testing/selftests/drivers/net/psp.py, the second half of
  rekey_both_sides() (the "# now, tx then rx" block, lines 734-736) does…

--

selftests: drv-net: psp: add rekey tests

This commit adds psp.py selftests for rekeying PSP connections. They cover
basic Rx and Tx rekeys, plus cases where rx-assoc and tx-assoc should fail
because of a psp version mismatch or the psp state. It also adds rx-assoc,
tx-assoc and key-rotate RPCs to psp_responder.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index 71eeade62ad24..004faf4bb57ae 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> @@ -489,6 +558,186 @@ def _data_basic_send(cfg, version, ipver):

[ ... ]

> +@ksft_variants(_get_psp_ver_variants())
> +def rekey_both_sides(cfg, version):
> +    """Test rekeying both directions"""
> +    _init_psp_dev(cfg)
> +
> +    s = _establish_psp_conn(cfg, version)
> +    try:
> +        data_len = _psp_txrx(cfg, s, 10)
> +
> +        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
> +        _remote_key_rotate(cfg)
> +
> +        # first, rx then tx
> +        data_len = _rekey_rx(cfg, s, version, data_len)
> +        data_len = _rekey_tx(cfg, s, data_len)
> +
> +        cfg.pspnl.key_rotate({"id": cfg.psp_dev_id})
> +        _remote_key_rotate(cfg)
> +
> +        # now, tx then rx
> +        data_len = _rekey_tx(cfg, s, data_len)
> +        _rekey_rx(cfg, s, version, data_len)

[Severity: Low]
Does the "tx then rx" half of rekey_both_sides() check that either of its
Tx rekeys actually took effect?

After an Rx rekey, the old SPI stays acceptable:

net/psp/psp_sock.c:psp_sock_rx_rekey() {
    ...
	pas->prev_spi = prev->rx.spi;
	pas->prev_generation = prev->generation;

	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
    ...
}

psp_pse_matches_pas() accepts packets that match it:

include/net/psp/functions.h:psp_pse_matches_pas() {
    ...
		(pas->prev_spi && pas->prev_spi == pse->spi &&
		 pas->prev_generation == pse->generation));
}

The old SPI only becomes invalid when the device key is rotated:

net/psp/psp_sock.c:psp_assocs_key_rotated() {
    ...
	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
		if ((pas->rx.spi ^ pas->prev_spi) &
		    cpu_to_be32(PSP_SPI_KEY_PHASE))
			pas->prev_generation |= ~PSP_GEN_VALID_MASK;
	}
    ...
}

In the first half, the key_rotate calls that come next cause a stale Tx
SPI to be dropped. The second half ends right after _rekey_rx(), and
neither side rotates again.

Say the local tx_assoc in _rekey_tx() were silently ignored. The local
side would keep sending with the old SPI, and the responder would still
accept it through prev_spi. The same applies if the responder ignored
the tx assoc sent by _remote_tx_assoc() in _rekey_rx(): its echo would
still be accepted locally.

This half is also the only place where an Rx rekey follows a Tx rekey on
the same socket, which is the memcpy of prev->tx shown above. If that
path lost the Tx key that was just installed, would this test notice?

The v3 changelog says the basic tests now "rotate again after it to
verify the new key is in use". Could this test end the same way, with a
final cfg.pspnl.key_rotate() and _remote_key_rotate() and then another
_psp_txrx()?

> +    finally:
> +        _close_psp_conn(cfg, s)

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106-psp-v3-0-a8dd38f5a727%40gmail.com
