Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF84A7CA4;
	Wed, 16 Sep 2026 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600398; cv=none; b=C8BB1zmeci+Gwc1RL1sXLhlFERGcArkyplOldqBRpmhdmxusjeZt3Vu3PiJag7tivIg6/4oBGWLMC8HpcIsGAR5MjTPwjNpBukT6PNbYJ/j9q3WVz649FqswifwtlXI72CmRTG8bQG4QGvA+NDQ+JCcvsUACGlPtoCgFErnL8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600398; c=relaxed/simple;
	bh=lBTBQ+AeEAILr+eSl0d5P93ajBM4IBD+/ux9b0Eq4V8=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JwNZmtYuVIHdNROU7fKUA1S3PDLlyuBPI/e/SC0C6ClAjtZ3XIVWF6j0kd+BEezys1i3lKkr/MlZIBQdN81pTv8MxHkwXzIjmS2Ynloh1Nfrs2/qKtwbBjHHDBQPEN5/w1ydWLnP8ACItdOjG4uFPrZySZdhpsBzg6NcGa3yC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrgbqbNe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrgbqbNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666721F000FF;
	Wed, 16 Sep 2026 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789600397;
	bh=J/QEUcvSZ2w/o2gb77Pk/nyMb8ULXPLIpeXqeBAgaH8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YrgbqbNeqelT0NFpeYR+DPKhuRskSkRKO0WMoJNRmSrfurDIcPPeunV7c7Ujemcy7
	 czk/G8+wfiqxq+LqiOY58recGq0R0Ri3+nKKjFwx+33ppw6asuFGwAVkZ6f4cFSSvb
	 xibfgX9BBMf/sYjmWMmktfpcrAFjWriweyFb7vFNtBQx21aq6lML/v+ETi3Ki/jOHs
	 VIbhpSdVbohheZSYI9FIffcYOhWrqICFr9nTqxI5TmDKHpZeH8wgwgCx4A0qolC17X
	 g7hNF8vGkXIROvduTNSpiKMLJ/dnrrFPbsYE1buGafa8Ius00HVTZGOOytWWAxob38
	 vVUkHy2v9TBOw==
Subject: Re: [PATCH net v2 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: edumazet@google.com, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemdebruijn.kernel@gmail.com, andrew+netdev@lunn.ch, shuah@kernel.org,
 willemb@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Wed, 16 Sep 2026 23:13:16 +0000
Message-ID: <178960039600.22033.386517201454373799@kernel.org>
In-Reply-To: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
References: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0

- [Medium] In tools/testing/selftests/drivers/net/psp.py, the new helper
  `_require_tls_ulp()` (lines 338-344) wraps…

--

selftests: drv-net: psp: test PSP and TCP ULP mutual exclusion

This adds two psp.py cases that check PSP associations and TCP ULPs are
mutually exclusive in both orders, plus a _require_tls_ulp() helper that
skips when kTLS is unavailable, and enables CONFIG_TLS=y in the
drivers/net selftest config.

> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
> index 315648a770d00..a5b1e14f120f0 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py

[ ... ]

> @@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
>              ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
>  
>  
> +def _require_tls_ulp():
> +    with socket.create_server(("localhost", 0)) as srv, \
> +         socket.create_connection(srv.getsockname()) as s:
> +        try:
> +            s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
> +        except OSError as exc:
> +            raise KsftSkipEx("kTLS not available") from exc

[Severity: Medium]

Should this handler be narrowed to the errnos that actually mean "no
kTLS"?  As written, every OSError from the TCP_ULP setsockopt turns into
a skip, including -EINVAL, which is exactly the errno the kernel side of
this series returns:

net/ipv4/tcp_ulp.c:__tcp_set_ulp() {
	...
	err = -EINVAL;
	if (sk_has_decrypt_user(sk))
		goto out_err;
	...
}

The probe socket here is a plain loopback TCP connection with no PSP
association, so the only legitimate reasons to skip are the "ULP unknown
/ TLS not built" errnos, ENOENT from __tcp_ulp_find_autoload() and
EOPNOTSUPP.

If sk_has_decrypt_user() ever returns true for an ordinary TCP socket -
and the parent commit anticipates growth there ("As other users of
skb->decrypted come along, they can be added to sk_has_decrypt_user()") -
the probe fails with EINVAL and the helper reports a skip.

Would restricting the skip to exc.errno in (errno.ENOENT,
errno.EOPNOTSUPP) and letting other errnos propagate keep the assertions
below load-bearing?

> +
> +
> +def assoc_psp_ulp_exclusive(cfg):
> +    """ Test that a TCP ULP cannot be attached to a PSP socket """
> +    _init_psp_dev(cfg)
> +    _require_tls_ulp()

[Severity: Medium]

Since _require_tls_ulp() is the first gate in both assoc_psp_ulp_exclusive()
and assoc_ulp_psp_exclusive(), does an over-broad kernel-side
sk_has_decrypt_user() end up disabling both directions of the
mutual-exclusion check at once?  The result would be two skips in CI rather
than a failure for the case these tests were added to catch.

> +
> +    with _make_clr_conn(cfg) as s:
> +        try:
> +            cfg.pspnl.rx_assoc({"version": 0,
> +                                "dev-id": cfg.psp_dev_id,
> +                                "sock-fd": s.fileno()})
> +            with ksft_raises(OSError) as cm:
> +                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
> +            ksft_eq(cm.exception.errno, errno.EINVAL)
> +        finally:
> +            _close_conn(cfg, s)
> +
> +
> +def assoc_ulp_psp_exclusive(cfg):
> +    """ Test that a PSP assoc cannot be added to a socket with a TCP ULP """
> +    _init_psp_dev(cfg)
> +    _require_tls_ulp()

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915-psp-ktls-fix-v2-0-0eedc3b148ec%40gmail.com
