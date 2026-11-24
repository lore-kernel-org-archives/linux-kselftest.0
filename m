Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520347;
	b=W/baXmpXoR7hJXoFUIoiQfq7r/pJPT0YrpbJHfTfQjZLU13TLRkpMnsn7mZAjxAHsyJf
	 Ogw4b7IxpsOuSf3hsjg1JALAtgNY+fa8EkMKCIH2AQ6UygAfBkAYcJVEP1ZPtK/RpKDwk
	 5NVNltGhnoq+DIahDyAoy22rf79xr909WN+TYl2ddu5d3jzsoudpI/J/wa73ECnATaCqq
	 Tzp2dJ7h5J6qQWS8W+UTUqP0zVeGDdH0pB1MhLsLAT24HiMvfBUzX5fn8unXSHnIpgFeK
	 Hw+JfLVYryBp2u2Epb1bdb89+HHywa8Smgp3r3+FBw179TZ/zGzJhfScDcyEL0g/9pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520347;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=vAgyY33rGyhoxd7++6dPjFy8c6kIItEzdXI6nMt/QAU=;
	b=RMQ+hPudOLxpSRo6toBT5L/mWEBlDCU02X6qdp4f35PLvuRSi345UIANexY1YdW8FMGL
	 bz6m8MQnVVfdjL+2wxdagngQxYI290aJ8v8lyLo/a5InxpQSIuBxYWntByAw8lmH+e/D1
	 9jm9lad327aI8pSYicdqXeinSjXgq2zl/lKpJBvDItl3RjdlwEa+byUu96yi6RjEwmQNO
	 G2d1hdoI+lXYDTY6CjMK/RO/mtosvPtlyYccaf/7VfJ7gfAOxQzct8akvblUmywWdAd8C
	 wI6XpYzUhJY4/Vh4q6z7GxEVEC5bPQxaX/Ga2pB/ST0JsK4Tjp8HA1uZXtMQsRXesCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.im;
	spf=pass smtp.mailfrom=fastmail.im;
	dkim=pass header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm3 header.b=glyhEjdW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=27ptkXp6;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB09606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 11:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.im
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.im
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.im header.i=@fastmail.im header.a=rsa-sha256 header.s=fm3 header.b=glyhEjdW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=27ptkXp6
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 087461400277
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 06:39:04 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Tue, 24 Nov 2026 06:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.im; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795520339;
	 x=1795606739; bh=vAgyY33rGyhoxd7++6dPjFy8c6kIItEzdXI6nMt/QAU=; b=
	glyhEjdWlOripV3KEgNEl3DrvKMz/KC6wKxEf0U4LZPNNXmmiMrxeP7gwghxAxgr
	pj45S3ynLBHgMLhslPbnI4KTJfDLpNGsHXBia3Mt+WEBkIBaKTUKH8HgtpwksYZX
	6yvP4SLN9o/G94KxNz3TYjdKtwjpZIlVejsBRrmfMPp3Cis0TZ1RQIv49j4bbKi/
	EIP8h/8gPg5+eLeeI+GfH3k1TmGYQNeVUNF6AJVgTcbTeoojWY3Nh8Qp5Ogcflcw
	wEyp25QbF4n5ebGkMroPsTOGWW3Q5itnZJ98nVeXzP4LozoBn02tPpHOOYs53ldu
	x4/+cxbaFQ6rV6kc7J0dUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795520339; x=
	1795606739; bh=vAgyY33rGyhoxd7++6dPjFy8c6kIItEzdXI6nMt/QAU=; b=2
	7ptkXp6Rn/pT0b8wppZnpxGadJcdDDazp/MWrusEiJ1ebOf9GjBlEtQxcMqsAXgt
	upb8iw2j5WGiqAPGC9aF7kmhw3xzNpLUZVH8vllZeayuV2UAmS20PjkCvB1BoVXj
	ZAg/7uruvWosqc85D/UpsZfL3E1sCFqixKdwEquyK/Vfc5BjRmM8HBAAtzxpEidL
	4JIuAdK+t0OydvXlvLFuLoI7q1M1kSJzK0HliYfG9fiyRp5FaLLBEcNUoMg8eiC7
	Lt2t3CnHbZwPI1vSQWvmt+v+gCbAhzOATRtoM7O+rQtK3fXk/+4xAm5AGR/lAjxi
	lZO2oVNn1ezZRI7QwCVtw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.im a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795520339; d=fastmail.im;
	mf=PGFsaWNlLmtlcm5lbEBmYXN0bWFpbC5pbT4=;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:fZaljjAYfytCmPVvAiyf+DPIsfbkwYgxoVAeF7jsMbC/pLw
	OCgyH+LE/s/kp3MckRZa8byzK/jpRie/zV5+oOdLSnurBkVjM+rPlPMDAGv0Pj3G
	IgtQHvg7/ySJFDcn5yvMB6EZJWLyAs93wwP88Gt7GcH6jY12uEAs+daL18vTK6RT
	L1yVSreMZjHsgadsp9dkNQT16MMMIP0Y62ZHLLjhbMOFRmvYPt5KC6zVlBUZYCKO
	M/BzbiYuT7Rlv1vDyebboU9/1mGj+dCE+a+7j7smqD6yvWnAsk10jMARDt5i2msy
	qpHyW7acIjT7Y7o5uewGPrxYHBzIP9FkAyg2/Gw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ALW9321OHBLiiL5SPsMumePA4d5xqqytp1VQGRM4k80=:dZY2KiK9PYfCfg7JMV7eBqXPw4kds7QQXD6ueU583vo=;
X-ME-Sender: <xms:TncFa38cNUHB-U-p2ro8Zz3RJUOavie1mhiXXnAGjmBnodMyh8a-cg>
    <xme:TncFa-gP2r01wxsJ1Hkz9qasjspcYeIAWp3-a5nFWRZs87U_xxsBGyXyqQI8T1mc3
    1GRkKP0mHjCTz8Jyqyu-BtUIkIKSo7NCMrdJHAkD63Xf6H-CW6_D7Y>
X-ME-Proxy-Cause: dmFkZTGGKQ38id+eRgJdj+g/UOJo3vPtsb5ZGc3CTeQs6u6bt9K70NIT1LuxDKr4LkF+Sd
    XCj6mSYhEw6D3l1pSVUFKwRY89ot5WQpCU9AwgH4/A+HzaE2dTAcuf3zDDI62Y3vduKk8m
    6BLE/i0DiZUMjjhhlWWbQ53EsjQlhgquAQgLyIOp0jUZIJKioZ+wTptlDFYUKuhXdu702L
    khwKqjG3RFdMybZlR0IrgXPDASsJKNq+fYoAEknqNwayVpF0TJuCM68ZL5u+jvP2kSJzNb
    uzEL92YYUhy3WTFz5OeVGhFev0RoxpMHTkkKoJW05Y7hAdAmzEcJlTbvwpOHTvLhVHOcXK
    NFxq9luxS70aEA7UmQP5VBScPJ6mb9VjOUGPO8tfFVXuDmjRu1PhFb3ygA52AL64uurtb9
    KhkQdfYv4lANOAn+MnCvTycdOHoWduwolJU82ULFPHWUYncprDLFNvl/RNfy5PC0gyVFCK
    6Cy8ND2QIC4wk0iBJZCAxqZBIT1hEtwZg6OYDtgEBhjC6hRjs5/flLerQo2En8XAMtmnPR
    /Bi0koRiNGfZzM5x8NZJ1GnXquVShnGDJ7/ONDaOTph89nLlZ+XGJEqlGrBOWYxB40GGOf
    Mh8HXQwpidDm9408oeuDzjVXHpsMIw7rHAKtj0zg/GU0Mo7qZwM57bIiVHzA
X-ME-Proxy: <xmx:UHcFa1_f312RZgYXqEMrnTw4AmkKMTxWxKr5sc4nvCobE9jZchmziw>
    <xmx:UHcFazyAfwGsVXdBGE1tgdybf3aLPfNRWkCSlDtm1chEn9LEDIS-pA>
    <xmx:UHcFa3_NeX3wtksN-MP8zAWPIHg0KttBrCbY0T_2bIE3dCNYcq73rA>
    <xmx:UHcFaxN8fuh0tYdYOB868r4nFHZAXZ44-57dpvA7t7ahobSId8YynA>
    <xmx:U3cFa7swwRahoueDmCOlHnNi2Hql5VtQirr4vRt82r2n9IAERyRjHful>
Feedback-ID: i559e4809:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6CBDE2F8005C; Tue, 24 Nov 2026 06:38:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 13:38:26 +0200
From: "Alice Mikityanska" <alice.kernel@fastmail.im>
To: "Haishuang Yan" <yanhaishuang@cmss.chinamobile.com>,
 netdev@vger.kernel.org
Cc: "David Ahern" <dsahern@kernel.org>, "Ido Schimmel" <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Shuah Khan" <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <274a4204-8a35-4550-a6e2-dff96aaee55a@app.fastmail.com>
In-Reply-To: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
References: <20261124013124.3693-1-yanhaishuang@cmss.chinamobile.com>
Subject: Re: [PATCH net-next 0/6] ip tunnels: Enable BIG TCP packets
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 24, 2026, at 03:31, Haishuang Yan wrote:
> Following vxlan and geneve, this series allows BIG TCP on ipip, gre,
> gretap, sit, ip6tnl, ip6gre and ip6gretap, which also covers their FOU
> and GUE encapsulation. The UDP length of FOU and GUE is already handled
> since commit 47282504ad21 ("udp: Support BIG TCP GSO packets where they
> can occur").
>
> Each driver patch bumps tso_max_size to GSO_MAX_SIZE in the setup of
> the device, like vxlan and geneve do. The default gso_max_size and
> gso_ipv4_max_size stay at 64KB. vti, erspan and ip6erspan are left
> alone.

Thanks for your patches!

Reviewed-by: Alice Mikityanska <alice.kernel@fastmail.im>

> Patch 6 extends big_tcp_tunnels.sh, which already covers vxlan, geneve
> and bareudp, to check that BIG TCP packets go through all these devices,
> without encapsulation and with FOU and GUE, with and without veth tx
> checksum offload. sit is only checked with checksum offload, as GRO does
> not build sit packets larger than 64KB.

Do you know why GRO doesn't aggregate >64K with sit? I had patches to
enable BIG TCP on IP tunnels too, but I've never submitted mine because
I didn't have a chance to investigate this specific failure. It would be
interesting to lift this limitation of GRO with sit, as it aggregates
 >64K just fine in all other cases.

> With iperf3 over veth in a KVM guest, raising gso_max_size from 64KB to
> 196608 gives +20% to +39% depending on the tunnel, see the commit
> messages for the numbers.
>
> This work was done with the help of an AI coding assistant.
>
> Haishuang Yan (6):
>   ipip: Enable BIG TCP packets
>   gre: Enable BIG TCP packets
>   sit: Enable BIG TCP packets
>   ip6_tunnel: Enable BIG TCP packets
>   ip6_gre: Enable BIG TCP packets
>   selftests: net: big_tcp_tunnels: Cover IP tunnels
>
>  net/ipv4/ip_gre.c                             |   2 +
>  net/ipv4/ipip.c                               |   1 +
>  net/ipv6/ip6_gre.c                            |   2 +
>  net/ipv6/ip6_tunnel.c                         |   1 +
>  net/ipv6/sit.c                                |   1 +
>  .../testing/selftests/net/big_tcp_tunnels.sh  | 131 +++++++++++++++++-
>  6 files changed, 135 insertions(+), 3 deletions(-)
>
>
> base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
> -- 
> 2.43.0
