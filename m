Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166349;
	b=kDNLFB+D2G21Xp3HAEL6PyifSB0BEXhGsQE/rx6qT7iUcOM1JWx6yJh8FqvooWP7p16E
	 8ZGFwvNvgsKMmf9iVxd0n0x/JV3HYl0ZIEOrWNT8KXSi4LFPchFObV6sbBw0EcD18J+T7
	 ZF2PSMpx12gckBve+jD9J1+HhShGfep3cWqvtKXdiXa8NQgAGSJaBQb5GUV6ZQ/sZrVQu
	 pm7GB/HQbkvZ9vMA2az8G8Qg3y9de4iB3chVm2PbW3oWF2HgcIZhV+SdDWcLRovhdQkMU
	 CLbM+YfrXoC+VSJfbPJTxViecO1TRqZiyiOfVcS9VI+2ni+Zzro4E9nT9iVa2/jRNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166349;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=SXeoHFfJ08+SsvxwU622/ejUUw9pYEAmzWxZavzjU8E=;
	b=rpV6gw//KC+nyBKi9gTrqORo8yHKXrIewkic5Zi6qNfgTIGF/dkmAuB0+dK+0nhXvrE4
	 HIyoYxskfupHMccJYf9JWLn85UpuAcVX8yy9ntOBYEq68EOTIzgpMU3z9Q/Dhm4W69K3u
	 /mLIG5+wnSd+jm7iIi3LhukHoIsxJYuO6S6nqKz0vofinjeX268f0R62oBpKheK3ecaGF
	 SBG62zIMwYNeThW+1O1tHKx6+f1mwpv+nfxx0rB2m1gc+8Orm09CHq1TNmntBfu5ZDfS5
	 JyNJbAtGnmH9KBf0G6/OUJeZu9Y2LdFeW/dHQe02+HMk5zL2MRb3fdBA7bZYLF0W4kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rpLfxKaa;
	arc=none smtp.remote-ip=95.215.58.245
Received: from mta1.migadu.com (out-245.mta1.migadu.com [95.215.58.245])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680B2606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 05:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rpLfxKaa
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=k6iHfgslbmnn3n9zufZFJ+9aHyYW9KHntgxnXO67GF4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793166341; v=1; x=1793771141;
 b=rpLfxKaazQEQ5pYCtSp7o/gcCRODjGm5J1Zb/HzD2+AM0PqqsWHQGbFojkvhJ3EJQIkfswpc
 0jz6mJuvoM38SCzyF365yxgUH9+6H6c0pqrmqC/icEodeyfP96obdARy2RQOb3kbF9i5p/CrrE4
 dw3rVmYRHywi6d7u8QzqyHYA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id fbf67270c8f6aec8;
	Wed, 28 Oct 2026 05:45:40 +0000
X-Mizu-Trace-ID: fbf67270c8f6aec8
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH 0/3] net: ioam6: makes IOAM insertion transparent to IPv6
 ECMP
Date: Wed, 28 Oct 2026 13:45:28 +0800
Message-Id: <20261028-ipv6_ioam_ecmp-v1-0-9b6715b6f4c0@kylinos.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQpAQBRG4VfRXZsakyy8iqRr/LgK0wxS8u4Gy
 29xzkUBXhCoTC7yOCTIukRkaUJ25GWAki6ajDZFpo1W4o6ikZXnBnZ2ipGj15y3HYNi5Dx6Ob9
 hVf8OezvBbu+F7vsBnCaRTnIAAAA=
X-Change-ID: 20261020-ipv6_ioam_ecmp-ae4ef0a4bdae
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

This series makes IOAM insertion transparent to IPv6 ECMP, as required
by RFC 9486 (C2): a packet carrying IOAM options must be forwarded
along the same path as the identical packet without them.

Patch 1 fixes the transit side: hash policy 0 hashed the raw IPv6
nexthdr, which becomes NEXTHDR_HOP once an IOAM Hop-by-Hop header is
inserted. The policy-0 key (and the ICMPv6-error flow selection) now
uses the nexthdr the packet would have had if the Hop-by-Hop header
carried only IOAM options and padding.

Patch 2 fixes the injecting node: the ioam6 output re-lookup on a
destination-cache miss hashed the transformed packet's NEXTHDR_HOP
instead of the original nexthdr (inline) or IPPROTO_IPV6 (encap), and
rebuilt the flow keys from the outer header only.

Patch 3 adds selftests/net/ioam6_ecmp.sh, covering both places: a
transit forwarder with a multipath route, and an encapsulating node
compared against a plain ip6ip6 baseline.

The issue was found while reviewing RFC9486. It can be reproduced and
verified by the newly added ioam6_ecmp.sh test.

Tested with:
ecmp_rehash.sh
fib_nexthops.sh
ioam6_ecmp.sh
tcp_ecmp_failover.sh
forwarding/gre_inner_v4_multipath.sh
forwarding/gre_inner_v6_multipath.sh
forwarding/gre_multipath_nh_res.sh
forwarding/gre_multipath_nh.sh
forwarding/gre_multipath.sh
forwarding/ip6gre_inner_v4_multipath.sh
forwarding/ip6gre_inner_v6_multipath.sh
forwarding/router_mpath_nh_res.sh
forwarding/router_mpath_nh.sh
forwarding/router_multipath.sh

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Hangbin Liu (3):
      ipv6: route: consider IOAM options in ECMP hash policy 0
      ipv6: ioam6: use transformed packet nexthdr for ECMP re-lookup
      selftests: net: add ioam6 ECMP test (RFC 9486 C2)

 include/uapi/linux/in6.h                  |   1 +
 net/ipv6/ioam6_iptunnel.c                 |   4 +-
 net/ipv6/route.c                          |  67 +++++-
 tools/testing/selftests/net/Makefile      |   1 +
 tools/testing/selftests/net/ioam6_ecmp.sh | 349 ++++++++++++++++++++++++++++++
 5 files changed, 419 insertions(+), 3 deletions(-)
---
base-commit: 5d7f3375cd574fc83f0cd30839b21455c0e79ae2
change-id: 20261020-ipv6_ioam_ecmp-ae4ef0a4bdae

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

