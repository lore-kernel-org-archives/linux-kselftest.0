Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18C3C8719;
	Thu, 17 Sep 2026 22:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683881; cv=none; b=HBJlVE4Kmqvzp5mnhYeJLUTtO/WPGZfgvDk4YRSJb3DqdYTKqGFJYoqZlQhihqSXc2054QKshQAeN0kKSirrzH+mZ54CRmDLzAG40ngwuw3yXy1kIYjvhVqx8IIaOwGm8GDVZUqrQ4oXQEg0xswBEOUJ3qzwkB9U64H9aT2CDQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683881; c=relaxed/simple;
	bh=j72GprFdgf4mO78M0LzOo+/v4R/w6Ztrh0eI86vdWCw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oM7wvkTa8iZKkqPIuBPtloK6U+/jgxj9lJng3e0bZN64XU7TMOClKH4vyyElcOWGf+Non18yWpLtOhscNR0+w1WtMALmpQmaQfumIGKuGT6EjB4e3NhPaSB2FD5JJwIj8N37uqr95kcaMyAdrzjt7XBNEaiq9I3XlRMnHEP5pIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=URW5CTVX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="URW5CTVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174801F000FF;
	Thu, 17 Sep 2026 22:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683880;
	bh=TamPH02i1OSS5Z8ZfUS2RChlKcRo0wIi/arFQah9c4A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=URW5CTVXI+MAEyQe+j3J6o8Rn7YxYH8OfKj9ei3t9qw1exRKDWvuK5Opn3okVN18C
	 zkkPs59ghbpx3SHvj1u3HARNIy01fme0462XLsG08Q4yPKSujKQfNUrtngQkOOQeRl
	 dQe/ruMU6pRz95Hu3i2xOaHWBPtgFjztMlRDtBGea9CRuLOlee5y7j1UBXN9pBqbrO
	 M3bW+i4DNVb+zxD+ulfGD1uyrKZRTxF4gxTABrasJEfGd9wykUBSRbesJplozQMG3o
	 3C44pYWQcutHSZNmicBeFiQEvWChSad53zlEZ1qqw/nyHhTF0ESCxvm6NitiiSIwVD
	 OWhqtF09v9ebw==
Date: Thu, 17 Sep 2026 15:24:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Willem de Bruijn
 <willemb@google.com>, Anton Danilov <littlesmilingcloud@gmail.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: net: fou_mcast_encap: conditionally load fou
 module and skip IPv4 case
Message-ID: <20260917152439.64d14833@kernel.org>
In-Reply-To: <14cff809-d338-4a95-8e7d-10759615b394@kylinos.cn>
References: <20260911100158.854183-1-fuqingshuang@kylinos.cn>
	<20260916174029.78939f6b@kernel.org>
	<14cff809-d338-4a95-8e7d-10759615b394@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sep 2026 11:33:09 +0800 Qingshuang Fu wrote:
> >> +if modprobe -q fou; then
> >> +	setup_ipv4
> >> +	run_ping_test -4 eoudp4 "$TUN4_R" "FOU/GRETAP IPv4 multicast encap r=
esubmit"
> >> +else
> >> +	log_test_skip "FOU/GRETAP IPv4 multicast encap resubmit"
> >> +fi =20
> >=20
> > Two very important questions you must answer before posting v2 or any
> > other similar fix:
> >=20
> > Have you actually run into this or it's a result of an LLM scan?
> >=20
> > How many of such fixes would we need to make all the net/ tests
> > clean from similar issues? =20
>=20
> I noticed it reading the script, then reproduced it on 6.8.0-138-generic.
> This Ubuntu kernel ships with CONFIG_NET_FOU=3Dm by default. Without the =
fou
> module loaded, tunnel creation fails with "RTNETLINK answers: Invalid=20
> argument"
> and the test reports a false failure at 0/100 packets. After applying=20
> the patch
> the subtest skips cleanly.
>=20
> For FOU this was the only gap. The two other net/ tests that use it
> (pmtu.sh, rtnetlink.sh) already load the module.

I did not ask about FOU

> v2 sent: drop Fixes tag and the in=E2=80=91script comment as requested. T=
hanks=20
> for the review.

I guess I wasn't clear enough. When I say "before posting v2"=20
I was hoping you'd give me a chance to respond too :/

Whatever.
