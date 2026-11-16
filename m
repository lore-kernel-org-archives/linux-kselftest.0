Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860873;
	b=yZSIgtc2r6fkbB7v6wSwmrvkDVJfp6eGVWVZN9LwoJfBcAZUWm30yb8d60Xj5tZA0eQn
	 l5H/Z1weO+6rLzw1pL72f95yXeAXXH76ulzGQghGi6JQfMw9r2yFA1WwiF88qDy8tbWuU
	 2PDUVZYxQo37AN3FgBXOls5CyLrGb0TAIaHBnMALejBUz1tbCDLe5TgX1Q7gRPMFCgPwl
	 D8/3pYPQsFs+lcNivuk+KHBn+WzQuQ2xBHRTsM74RceuTnsZ2fSpStMy8ZEwE8tD4os9X
	 b+N4x4rNo1tiHf5Xd83X6SvIoIJYvFPlmSZBgoPaEOyiQsAt8g2jAZOxhmoSJ7UHzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860873;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=4o0dTryM0917HXjO2xcyNWOlnxmskhtg7Kc/3xbY1nM=;
	b=r25ZogXOKwyrTeSNP9t0v0uCaioc+kqLX0+NK8+6bfCHo3SnmBxA6TRO4BwgwgXkI9wZ
	 cLO6rp6RB6y76GUaCfVuOz/o22/MYojt1eLuZ4QLiRbJahhRNYGQSNEsG0jvnK/T7DLzG
	 SmSKEiYo/rsjjxYdjPqBxPI19hSA1dm2D4YOGXUDOiIC4ypZJOs7SyzKXTwHWyxfEw84r
	 DXxPLraJj/rxDxmMNNeiO/iBIdvWRnIzzyOAA0ASWMcwv3rXYzfZgZPigb309ZlO4S6H3
	 OMedYF4PetrX+9ny6+qT8PIKIDMRpOfV7mOXe7+GlWh11gQrix1U3uPvEFEZHEjoIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=CrVBpOYT;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D11606A88C;
	Mon, 16 Nov 2026 20:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D11606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=CrVBpOYT
Received: by mail.grapheneos.org (Postfix) id 1FA1E3C08B8D4;
	Mon, 16 Nov 2026 20:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4o0dTryM0917HXjO2xcyNWOlnxmskhtg7Kc/3xbY1nM=;
	b=CrVBpOYTz6wh2RP6Ebk7ORHTtPl/ryG237tCG77dyYYAOjNIoH+LG5+hInRMd/WHDZJJMh
	hOWS10AVgzX+2cWOrA93LXB41byDYebBjgny8kRGCh34uaE1popF/+j0CAxU9MZXreikjF
	EbQXaid2KEAnnpz+vCmBTvtw48ClqkBteDdPHsTUe+crmsj4z361Zx9yiJY3D2FTinK5W1
	fgC4ILP9veB0u78A3cHVfid5ABtbf0S1vXrNwC8sRMHPfJS8mHq1jFKLBvNpu3KAtixoCe
	5F1WG4YhqvCxhQwljIPnci25x6Jl0o5CBOxi7lHIlchQCbRTpeMctukLBfyAYg==
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
Subject: [PATCH net-next v5 0/4] ipv4: restrict on-link fallback to lookup misses
Date: Mon, 16 Nov 2026 20:27:37 +0000
Message-ID: <20261116202741.13106-1-liamsmith827@grapheneos.org>
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

v5:
- Fix broken test.
v4: https://lore.kernel.org/netdev/20261115215640.18728-1-liamsmith827@grapheneos.org/
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
 tools/testing/selftests/net/fcnal-test.sh | 54 ++++++++++++++---------
 5 files changed, 53 insertions(+), 43 deletions(-)

-- 
2.47.3

