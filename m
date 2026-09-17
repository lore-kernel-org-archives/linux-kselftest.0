Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316E214A9B
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 00:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603890; cv=none; b=nNPgDUloRLLyISg7lBRgAuOrW1XJd1OhS3szvLxtSL88fIYOL82FAIrNJDzwmSmdhIqmXpaRWfwvd9qNRPaXHyEzZ0k1T2XvO1fzUxNwtZYZOi9iMPUeTu6EAyxFfcqMH1/Wg8miTplLANEmENq/6gf+NV+IqNVq2S0ioW84Leo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603890; c=relaxed/simple;
	bh=ckLfNY5m7sw42q1GlHV4ctBFyqc0HiyBfdvgQ/3RKy4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=kpIP4I0tlL+NhAzgc1GyqlGlpu8MsW4n/LGKS4y21qrEVG7LkyEcTFLVp8/7kk09lPQ1EAJHyivisC5uRXnJnGT/IPUF/J2d34n7+adpf8tu2iULjwDSGKrG8C3JpUZfo/EGiF1whBWJ07vM5PSAa4eio9rlbERmWXorCzU+m4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYIlCm+g; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYIlCm+g"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a135ffb08so29206785a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 16 Sep 2026 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603887; x=1790208687; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kxh7qp6INDtgYuziuWlOBCsKbnHlhHZqtJui1JeMELI=;
        b=dYIlCm+gUgCP/q0SLLM4KC/RBdn1c5VrpBkO7l+OnCJQgZzjVKbNz8hqCm6FyS9qIv
         nAtxfpikhHTdgaAdSHvbpTmVNmwHLpnqmW9qBK96bWS1TPKyWgjVGRgt7vrl+sjh1Z47
         UUvx1i3jgvDlSBApn0FZeOqGCJqvLTHujCbicDy0tn/rwklpKuYamyU0iaeFu883BHkq
         e/N054p86VQWPMtXD+2PblBLI5Xhq8wo8Ww0r1C4xP4B7swCTkhy+fuXDclKqVutqzTV
         l3QAKB2PiupnA+aiTih4fh418DE0qE8nP+PDeT/YYfJe3+1+YaAfyqrUeI3Mrq5jLUwr
         Lgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603887; x=1790208687;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kxh7qp6INDtgYuziuWlOBCsKbnHlhHZqtJui1JeMELI=;
        b=DqNipmGycHJQJ2+B6FWg0jUcuzY2JB8F5WOadHYqaB45wMJlc1/cGbEOkvScSoii6h
         6wQm8aQInK5Irzq6BG00qGsiEPnsFk5vFE9i1YF33hXk+pX74W2fnYQ/QS53S9GV/dwk
         fBU7tOReWbY6xv32YmlzPlz6bnKfftWAs8VzLEoX3HvLnATXkt6rLctXgbSX9r52iRqN
         yOwZGtFLa11xtEahdM2HHMgH10wK4sgwp4LLm9M4ZsR6SDLkxjZTnDfUVBnj0JrccPs3
         NOB6G767RiUDPHwJTD9dvKz9W8vh+zD66Mh9rpYi+JyzAjN6g7DK7nt6ld0W3YWxt8SI
         m/kw==
X-Forwarded-Encrypted: i=1; AKwUvBzvMBvVot2vs7NxiGL3DrBicvDcYxP6uS5fLllEqe6qpQMlJwRWAnUrpcc+JIaAbpCKyK4yp0pyN/XMUMVaS4A=@vger.kernel.org
X-Gm-Message-State: AFuF++m3acAjywWTaHGI/mo2mqQJ2xRV7bOz68NuNTNs0dNK0M/3Llus
	tmrQDEE3GuCkU3ZBe4UtqONEm3vDeyWyrMdGB/oxUN749h/vk9PLo5JG
X-Gm-Gg: AYBFou0uPFxR2CgiKKUORPY6rpRYj+zTxd4TAwf2HaTrq28AabbVh4YJBQHfBjD1/n7
	xdskjmwf5gVynIYx3R67eXyP/rqVphKPJfSpZIic1kAkLE/DXZXEk+xILbrvbQB8Pcj3c8NdW9r
	SpRrqmxTOljv8K+F5XAPjf2CfLDg0ADpiR0gUIe7ft3/RJttTz1p6sNTJLCqKtrFQCYNWCq6XV6
	POBjs/0x++lfi8wli2aN0UKT+YQ/j862QeqeDmS/IhZIGt/Q5m/Dl27fP7iZsyxDZRQQpKEZ1fQ
	UkpcS+zM9xPF/OHISkPz19tO7p8TLOo2TyVVvIPfMhAGSNhni+HUiTHfIxgXeV0vxadJdLa6rCf
	WfP8fYdKXnEHgHUuGa1cQ1wnoB15j99lEReqR1R1aEOin1fhlH/1S2NutLEqdaCQLJ5kEAQLwX7
	ZNTVj09DjplOQjfsMN88Y0+wyrhE5CAxHQn5MDozp/F+kPnEGWMjakVXcQOuRomu1biGiHQUAvb
	Qajj/1mRBfAHcU=
X-Received: by 2002:a05:620a:294a:b0:937:27fb:96f8 with SMTP id af79cd13be357-93bb7900601mr761224785a.41.1789603887335;
        Wed, 16 Sep 2026 17:11:27 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7824d7b1sm338655085a.27.2026.09.16.17.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 17:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 20:11:25 -0400
Message-Id: <DLH5MRIK84UU.1ZS2B8TGS8TKO@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <edumazet@google.com>, <ncardwell@google.com>, <kuniyu@google.com>,
 <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v2 2/2] selftests: drv-net: psp: test PSP and TCP
 ULP mutual exclusion
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260915-psp-ktls-fix-v2-2-0eedc3b148ec@gmail.com>
 <178960039600.22033.386517201454373799@kernel.org>
In-Reply-To: <178960039600.22033.386517201454373799@kernel.org>

On Wed Sep 16, 2026 at 7:13 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> - [Medium] In tools/testing/selftests/drivers/net/psp.py, the new helper
>   `_require_tls_ulp()` (lines 338-344) wraps=E2=80=A6
>
> --
>
> selftests: drv-net: psp: test PSP and TCP ULP mutual exclusion
>
> This adds two psp.py cases that check PSP associations and TCP ULPs are
> mutually exclusive in both orders, plus a _require_tls_ulp() helper that
> skips when kTLS is unavailable, and enables CONFIG_TLS=3Dy in the
> drivers/net selftest config.
>
>> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/=
selftests/drivers/net/psp.py
>> index 315648a770d00..a5b1e14f120f0 100755
>> --- a/tools/testing/selftests/drivers/net/psp.py
>> +++ b/tools/testing/selftests/drivers/net/psp.py
>
> [ ... ]
>
>> @@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
>>              ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
>> =20
>> =20
>> +def _require_tls_ulp():
>> +    with socket.create_server(("localhost", 0)) as srv, \
>> +         socket.create_connection(srv.getsockname()) as s:
>> +        try:
>> +            s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
>> +        except OSError as exc:
>> +            raise KsftSkipEx("kTLS not available") from exc
>
> [Severity: Medium]
>

I understand the point, but I'm not sure this really worth the change. I
considered checking for specific error codes here, but decided against
it because maybe that would be end up being brittle if someone in the
future changed or added error codes. Aside from ENOENT when the feature
is not available, I think the only other error this could throw is
ENOMEM.

> Should this handler be narrowed to the errnos that actually mean "no
> kTLS"?  As written, every OSError from the TCP_ULP setsockopt turns into
> a skip, including -EINVAL, which is exactly the errno the kernel side of
> this series returns:
>
> net/ipv4/tcp_ulp.c:__tcp_set_ulp() {
> 	...
> 	err =3D -EINVAL;
> 	if (sk_has_decrypt_user(sk))
> 		goto out_err;
> 	...
> }
>
> The probe socket here is a plain loopback TCP connection with no PSP
> association, so the only legitimate reasons to skip are the "ULP unknown
> / TLS not built" errnos, ENOENT from __tcp_ulp_find_autoload() and
> EOPNOTSUPP.
>
> If sk_has_decrypt_user() ever returns true for an ordinary TCP socket -

The code in question can't take this branch as it is now, and if it did,
a skip seems arguably more appropriate to me, because otherwise how
would we even interpret the result of the test.

> and the parent commit anticipates growth there ("As other users of
> skb->decrypted come along, they can be added to sk_has_decrypt_user()") -
> the probe fails with EINVAL and the helper reports a skip.
>
> Would restricting the skip to exc.errno in (errno.ENOENT,
> errno.EOPNOTSUPP) and letting other errnos propagate keep the assertions
> below load-bearing?
>
>> +
>> +
>> +def assoc_psp_ulp_exclusive(cfg):
>> +    """ Test that a TCP ULP cannot be attached to a PSP socket """
>> +    _init_psp_dev(cfg)
>> +    _require_tls_ulp()
>
> [Severity: Medium]
>
> Since _require_tls_ulp() is the first gate in both assoc_psp_ulp_exclusiv=
e()
> and assoc_ulp_psp_exclusive(), does an over-broad kernel-side
> sk_has_decrypt_user() end up disabling both directions of the
> mutual-exclusion check at once?  The result would be two skips in CI rath=
er
> than a failure for the case these tests were added to catch.
>
>> +
>> +    with _make_clr_conn(cfg) as s:
>> +        try:
>> +            cfg.pspnl.rx_assoc({"version": 0,
>> +                                "dev-id": cfg.psp_dev_id,
>> +                                "sock-fd": s.fileno()})
>> +            with ksft_raises(OSError) as cm:
>> +                s.setsockopt(socket.SOL_TCP, TCP_ULP, b"tls")
>> +            ksft_eq(cm.exception.errno, errno.EINVAL)
>> +        finally:
>> +            _close_conn(cfg, s)
>> +
>> +
>> +def assoc_ulp_psp_exclusive(cfg):
>> +    """ Test that a PSP assoc cannot be added to a socket with a TCP UL=
P """
>> +    _init_psp_dev(cfg)
>> +    _require_tls_ulp()
>
> [ ... ]

