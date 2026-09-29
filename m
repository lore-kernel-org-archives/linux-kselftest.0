Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBAC2D77F5;
	Tue, 29 Sep 2026 01:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643753; cv=none; b=Zs5SUmAWoQtbp0sOCWfjmJA2zcnqaeB7RBSsjtDb6m3ay8FYAtHp3YqNascvRelDl65Zb78kdi6+mCZ3MSqpfJPsREGx5wf2a/hLi0VB1i/0U7WLleG9OUB27MesvY7pNNvygNOvv2p2b85/1m+TGWQnFOsJT95KXGud5uhfQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643753; c=relaxed/simple;
	bh=+z9Mq2l7b3cFxrV7k+MsiFGNtBO5JFhZFrNKYZF4rUc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GScZMp/G6LE9ZXo7+kb3wK9DYMtoCwumBeRttaEQGXwZ3E7Jtbd1YTx+MY342RcWbjlxriskWm9O0SqjEppOtlFu8Py3Yvqe68w1FZ3D1MvsjiuWHVwNsck5t1w5Z5do2zJrH1XFBYVOmJcQEi0evxlDSvqa9YsMGauhricQ8T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=LhunU1bU; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="LhunU1bU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1790643741;
	bh=+z9Mq2l7b3cFxrV7k+MsiFGNtBO5JFhZFrNKYZF4rUc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LhunU1bUK0FzoGVM3lm6Qyg9pLDmLV247fK01cT88nwObtZzocpfzKvULZ86UF7Fy
	 TY+zxQPKUUo9DC/7AnPEOf+K97ejxUR+ZaT2NZjfBQ8g0kKHSplqPZ/DPK86cyc+TB
	 oeN3R2Y9PGFnJ7oskDVJ+2cXRIaXsxCjcEZ4vG0NWYzA6BOczh+2BGfT8F0s4Kxw2S
	 Nh/XKtAb8ifgiC9XQbcYIlLM22eV1hjGn5yuRMjl3UzzmHtIpWfBmeSAYVPe1sXvY0
	 JpMrLs8AI7Gzsh2fdJUI+FYLZg1r9/yoguBUIclc3T7ms+LSLvpEgjiAHLYqzITDxL
	 qIrahGqUTeZHQ==
Received: from [192.168.72.161] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E04E56C457;
	Tue, 29 Sep 2026 09:02:19 +0800 (AWST)
Message-ID: <fb39875c7fa4131e565eebf8ffc9b3b19bb5ad87.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next v2] net: mctp: Make KUnit tests depend on flow
 support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Karl Mehltretter <kmehltretter@gmail.com>, Matt Johnston
	 <matt@codeconstruct.com.au>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski	 <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman	 <horms@kernel.org>,
 netdev@vger.kernel.org, Geert Uytterhoeven	 <geert@linux-m68k.org>, Brendan
 Higgins <brendan.higgins@linux.dev>, David Gow	 <david@davidgow.net>, Rae
 Moar <raemoar63@gmail.com>, 	linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, 	linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 09:02:23 +0800
In-Reply-To: <20260928205352.30502-1-kmehltretter@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
	 <20260928205352.30502-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Karl,

> MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
> transport requires them. Enabling tests should not silently enable
> additional kernel functionality.
>=20
> Make the tests depend on MCTP_FLOWS instead, following the dependency
> rule in Documentation/dev-tools/kunit/style.rst.

[...]

> index d8d3413a37f7..e64d4f7ef6aa 100644
> --- a/net/mctp/Kconfig
> +++ b/net/mctp/Kconfig
> @@ -14,7 +14,7 @@ menuconfig MCTP
> =C2=A0
> =C2=A0config MCTP_TEST
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "MCTP core tests" i=
f !KUNIT_ALL_TESTS
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select MCTP_FLOWS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on MCTP_FLOWS
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on MCTP=3Dy && K=
UNIT=3Dy
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default KUNIT_ALL_TESTS
> =C2=A0

Now _the whole suite_ is not going to get enabled for the usual kunit
testing, since flows isn't individually selectable.

> This keeps the full flow-test coverage: the suite is available only
> when flow support is enabled, for example by the I2C transport.

Hardware transports are typically not enabled for kunit test kernels.

Are you attempting to fix an actual problem you're encountering? What's
the aim with this change?

Cheers,


Jeremy
