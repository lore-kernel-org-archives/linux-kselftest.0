Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779815;
	b=WlaraPfFpHW/kRvQzHGrk9I1deME2d2r76upHo4GD12xorE9URF1H7Z0yNUgtScsM/0L
	 dtYbEHynToFGMICcIqLIEmvd+8nDcbv7wB7lhc4isqEdY7+E9bGwDdZoXoGCgRMztqXV8
	 9qEEGixie8kztDmtK48mMFjEpp4XV9cs385TkCwBS0nHD7b2Sxi/QfZL83WskFU9Nd+lU
	 Z1GjzJzihwt1Im2MfKurF4uytkaPy671t3kk0es3Wj+VXguGJ9uKe9BPpXBYos+o/VH12
	 lyqXzfX3mQMiQsJoWFjWjrU+tBEGVsoYNMXSY+NnItiOQ9/vuKAHRt0iBSzzEpxI2PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779815;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=cDM1NA86OeeZcL9gQ0yYJliUVGVW/LGHmePT0Gn5Sc4=;
	b=wMj0xABmVXeCO2o/ki0QA8x7jafSg/tlCCTb1QLa85um9Vx9eezu2WupXBbo6Bz8BU2v
	 +pHv94Wv4boZoF5jLN1MpnbFGSnMGIHighYvKVbUjI12m5BUCYB96DwdGOldggkbUXct2
	 K3B/ci0F/wYLRuXnFpRs+QKb55Mpt1AY25DrO06o7I8tsdnk6KemMlDh95QVYHfcI+G20
	 7AYNJ1qzdQUHsdmSaQVAsS+xDdyTzuohaIshYqmfIMq6rfF6QNSdD641aEEbE4tz7Of45
	 YFbY4NcEoUWHFMTSONnwKtTxlykq4Kcl3JWRtroUWk8MXnlBRj072GVOA6tRG22RgkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=TDTAl6OA;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8B606A32C;
	Sun, 15 Nov 2026 21:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B8B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=TDTAl6OA
Received: by mail.grapheneos.org (Postfix) id CEEF63C08EE9B;
	Sun, 15 Nov 2026 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794779813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cDM1NA86OeeZcL9gQ0yYJliUVGVW/LGHmePT0Gn5Sc4=;
	b=TDTAl6OAy//qVfnqzemY6H32jX7IThB1tE/uTHcYwOqnscIEZ0ryIftF17fLkesv0PHTlF
	Xbv0ZKqB9hN6EyJz82HPM/D9kvqtnEk/oo9tbcBz/Vt0jxBGLhXUACcGUzEv04HPGWkfNH
	iBS5DsqM/RIAjl7ptwW5120t6LuzNlhW2utdyffbrRh1iH6M1VHbhPg9L76R12TgaRL8H6
	K5mnRaR0yMaZJAhqvSPYk1DgCT8cX5Ck8PQiX8zX/V0l/8pN6vKiGR0USy4woNLVmXPJ1t
	pvrz/0JjEdEUSCaPxRRaZkPnz3H4MuQtU6xR4/QOVEiPzAHfJdH+/GewDeCWEg==
From: liamsmith827 <liamsmith827@grapheneos.org>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liam Smith <liamsmith827@proton.me>
Subject: [PATCH net-next v4 0/4] ipv4: restrict on-link fallback to lookup misses
Date: Sun, 15 Nov 2026 21:56:36 +0000
Message-ID: <20261115215640.18728-1-liamsmith827@grapheneos.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Liam Smith <liamsmith827@proton.me>

When an output interface is specified (e.g., using SO_BINDTODEVICE,
IP_UNICAST_IF or IP_PKTINFO) and the FIB lookup fails, the IPv4 output
path ignores the error and constructs an on-link route via the
specified interface. According to the comment above the code, the
intent was to allow sending packets via an interface that does not have
any routes.

However, the error code is not checked, so the fallback is also taken
when the lookup hits an unreachable, blackhole or prohibit route/rule.
In other words, these routes and rules are ignored when an output
interface is specified [1].

This is a problem for Android, which implements its VPN "kill switch"
using prohibit rules, with the expectation that packets hitting such
rules are never transmitted. Unprivileged applications can bind a
socket to an interface and trivially bypass the VPN. This is especially
bad on cellular interfaces where neighbor resolution is not needed, so
packets can reach any destination and not only on-link ones.

Solve this by only taking the fallback when the lookup did not match
any route (i.e., a miss) and returning the error to the caller
otherwise [2].

It is currently impossible to distinguish between a miss and an
unreachable rule since they both return the same error (-ENETUNREACH).
Therefore, patch #1 adds a lookup flag that makes the lookup return a
different error upon a miss and patch #2 uses it to restrict the
fallback. Patch #3 adjusts the selftests and patch #4 updates the
comment above the fallback.

After the change, a packet that was previously transmitted on-link
despite hitting one of these routes/rules is no longer transmitted and
an error is returned to user space instead. It is unlikely that anyone
is relying on the current behavior:

1. It is a side effect of not checking the error code and it contradicts
ip-route(8) and ip-rule(8), which document these routes and rules as
dropping packets or generating an error.

2. These routes and rules are already honored when the output interface
is a VRF device or enslaved to one.

3. These rules are already honored by IPv6, which does not have such a
fallback.

The following is unchanged:

1. Packets can still be sent via the specified interface when the
lookup does not match any route, which is the original use case.

2. The fallback is still always taken for multicast packets. The
precedent in ip_route_output_key_hash_rcu() is to not enforce
restriction rule/routes on oif-bound multicast, so that precedent should
be followed here too. 

[1]
 # ip link add name dummy1 up type dummy
 # ip address add 192.0.2.1/24 dev dummy1
 # ip rule add to 198.51.100.1 prohibit
 # ip route get 198.51.100.1
 RTNETLINK answers: Permission denied
 # ip route get 198.51.100.1 oif dummy1
 198.51.100.1 dev dummy1 src 192.0.2.1 uid 0
     cache

[2]
 # ip route get 198.51.100.1 oif dummy1
 RTNETLINK answers: Permission denied

v4:
- Add unreachable rule test.
- Improve test commit message.
- Minor formatting fix.
- Reword routing comment.
v3: https://lore.kernel.org/netdev/20261112235932.23836-1-liamsmith827@grapheneos.org/
- Remove comment on flag.
- Improve flag commit message.
- Improve cover letter.
- Target net-next instead of net, remove Fixes and stable Ccs.
- Change author to legal name.
v2: https://lore.kernel.org/netdev/20261110061536.10811-1-liamsmith827@grapheneos.org/
- Restrict the fallback to routing lookup misses, instead of only
  honoring prohibit (-EACCES).
- Add FIB_LOOKUP_REPORT_MISS to differentiate a routing miss from an
  unreachable rule.
- Split the comment update out into its own patch and remove the
  signature.
- Enable all of the commented out device bind tests in
  ipv4_ping_novrf(), add a route miss test and update the UDP test
  expectations.
- Target net instead of net-next, add Fixes and Cc stable.
- Drop RFC.
v1: https://lore.kernel.org/netdev/20261019032406.88874-1-liamsmith827@grapheneos.org/

Liam Smith (4):
  ipv4: add FIB_LOOKUP_REPORT_MISS
  ipv4: restrict on-link fallback to lookup misses
  selftests: net: test restricted on-link fallback
  ipv4: replace obsolete routing comment

 include/net/fib_rules.h                   |  1 +
 include/net/ip_fib.h                      |  6 +--
 net/ipv4/fib_rules.c                      |  2 +-
 net/ipv4/route.c                          | 33 +++++++-------
 tools/testing/selftests/net/fcnal-test.sh | 53 ++++++++++++++---------
 5 files changed, 52 insertions(+), 43 deletions(-)

-- 
2.47.3

