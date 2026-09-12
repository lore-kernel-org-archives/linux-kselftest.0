Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA364BEE52;
	Sat, 12 Sep 2026 00:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789173647; cv=none; b=i6XRMg6Zq89cS5PCKPkn8aj1sYFTmN5qDetWvrJnzs9giLviS3tCtRQ6IJPzosPk1fujz1unUQK7/NdqtdcKAd4oLTsz7ceiHPYCIs1Eug67LB+maEwzicvlG7N8/7/0Hd5tk0QGvU9ShgFfDpdT2FhdIx0CeOFrIpqr2yYB0yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789173647; c=relaxed/simple;
	bh=HTXjFcCENPL0zKD+MVsYIekFBoEEGZnkt/+gmT/74ds=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuhNQhHSf3RbTUVfqxX6DoMSBOGOL4py9E2EDcRt9SQ9OyFDS6awpHjYuGJzYIf+gAe1v8eGZYaaVO4kSufWtBsdK4SGEd8gK0oakKxM45LGGO9uQzMJfbd6HAQWH7utQ6Vuwyj6FQzV46FURzxoedumc+guolI/xDEPK/hIr+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2NntCDT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2NntCDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1361F000FF;
	Sat, 12 Sep 2026 00:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789173646;
	bh=6jQs7l7FH4twYetvS3emoyjZTP1Gvt3n5A3QEPWrLO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m2NntCDTGhAlXbCsadl8VWmmEwnIaDSl2tQRiawYAuTmA9jye/gaNt5sDvrzUqtz5
	 JI9sewL+hfcgsxiueoKgWR1VtVqfYnJacNmOTKR6zxIDEfzrdY+3/G6ggyKMRVGhpE
	 1YIk3yHS3bVFylE1jjzzLGf9q97/j24Lw4eP3g9MwtR30WzWjjQmcXPtpZIYYNFpkQ
	 cbVNmNXCz//3DP4sYpNOT/NH2KcocA4Tx0sv+hNyCtzN4eoD36KAeb2n30ej/AAdzg
	 tZGNhau8/UcyUAvPTETW9XmbDtjOi9ek6E/1B9J3DbdgLqO+BFmZzgH8h8KkoR4qck
	 R757Xw0g1Yb8g==
Date: Fri, 11 Sep 2026 17:40:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?= (SUSE)" <ricardo@marliere.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, David Ahern
 <dsahern@kernel.org>, Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=
 <toke@redhat.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] selftests/net: Fix icmp.sh race between ping and
 tcpdump startup
Message-ID: <20260911174045.76579e91@kernel.org>
In-Reply-To: <20260911-selftests-net-icmp_race-v2-1-c7458dec9d0b@marliere.net>
References: <20260911-selftests-net-icmp_race-v2-1-c7458dec9d0b@marliere.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sep 2026 15:41:33 -0300 Ricardo B. Marli=C3=A8re (SUSE) wrote:
> icmp.sh backgrounds ping and then starts tcpdump, with no synchronization
> between the two. If tcpdump is not capturing yet by the time the ICMP
> unreachable replies come back, the test fails even though the kernel
> behaved correctly:
>=20
>   FAIL - got ICMP response from , should be 192.0.0.8
>=20
> The empty address is misleading: it means the capture matched nothing
> before its 10s timeout, not that the reply had a wrong source address.
> NS1's Icmp InDestUnreachs counter still increments across such a failure,
> so the replies were generated and did reach NS1. Ping sends several probes
> over its 3s deadline, so losing every one of them takes a multi-second
> stall in tcpdump startup, which does happen on loaded CI hosts [1].
>=20
> Fix it by starting tcpdump first and waiting for its "listening" banner
> via slowwait() before sending traffic. Run ping synchronously, then kill
> and reap tcpdump if it did not already exit on -c 1.

It used to pass in NIPA CI and now it fails:
https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/819341/86-ic=
mp-sh/stdout

> Fixes: 7e9838b7915e ("selftests/net: Add icmp.sh for testing ICMP dummy a=
ddress responses")

Please don't add Fixes tags to selftest improvements.

> Link: https://openqa.opensuse.org/tests/5907626/logfile?filename=3Dicmp_s=
h.tap.txt#line-2 [1]
> Signed-off-by: Ricardo B. Marli=C3=A8re (SUSE) <ricardo@marliere.net>
