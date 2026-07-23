Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580548C40B;
	Thu, 23 Jul 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809464; cv=none; b=hONsRNBK6RYJGj0wceaGENcbUKV1+0CTVeaqLE7cd7256d4by/r73DcWKwyj4nExRn/vIWWpXw7YKZ0UgoZXP1xdU/iV9Z12BDsqKaLiv0l6Dl1mfLxDqUoL+Wrt62TK5ctNrhla99CLAjiOQcpeUGgosFflUVWqMEwz9J6Qtx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809464; c=relaxed/simple;
	bh=sGsOH7IsE3R7kSvvINB3StfD8yQJt6ttriwz7WJfYlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoM90Xzpw5Bg31WRgpKUTYVyu4poUrLkBhuhSA4mNjSMckyS+MGw+dmd7XDoR1Lv/mn0Z7do7/lgUSbD88FESYpaYExBs8CZXTTv+8+iuOvTkSw5sXg7A4roqj41dibDneE5yJit2RB+oUp/GRpL7csURDty6GgQ1jCQubgZzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from [2001:67c:370:1998:30cb:b625:4f9:61b4] (helo=alea)
	by eidolon.nox.tf with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsTJ-00000003Wpj-3TtC;
	Thu, 23 Jul 2026 14:24:18 +0200
Received: from equinox by alea with local (Exim 4.99.2)
	(envelope-from <equinox@diac24.net>)
	id 1wmsRa-00000000Q2R-3GgV;
	Thu, 23 Jul 2026 14:22:30 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Lorenzo Colitti <lorenzo@google.com>,
	=?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David 'equinox' Lamparter <equinox@diac24.net>
Subject: [PATCH net-next v2 09/10] selftests: net: RFC6724 rule 5.5 tests
Date: Thu, 23 Jul 2026 14:19:35 +0200
Message-ID: <20260723122106.99772-10-equinox@diac24.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260723122106.99772-1-equinox@diac24.net>
References: <20260723122106.99772-1-equinox@diac24.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This throws a couple of situations at the IPv6 source address selection
logic, primarily to check that RFC6724 rule 5.5 is applied as expected.

This requires `CONFIG_IPV6_SUBTREES=y`, so that's added to
selftests/net/config.  (The patchset also changes the default on that,
but arguably better to be explicit.)

Signed-off-by: David 'equinox' Lamparter <equinox@diac24.net>
---
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/config            |   1 +
 .../net/ipv6_saddr_rfc6724rule5p5.py          | 285 ++++++++++++++++++
 3 files changed, 287 insertions(+)
 create mode 100755 tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index ab890e6f79dd..07872f838c50 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -55,6 +55,7 @@ TEST_PROGS := \
 	ipv6_flowlabel.sh \
 	ipv6_force_forwarding.sh \
 	ipv6_route_update_soft_lockup.sh \
+	ipv6_saddr_rfc6724rule5p5.py \
 	ipvtap_test.sh \
 	l2_tos_ttl_inherit.sh \
 	l2tp.sh \
diff --git a/tools/testing/selftests/net/config b/tools/testing/selftests/net/config
index 96fffca6547c..cc9c0f38a9d1 100644
--- a/tools/testing/selftests/net/config
+++ b/tools/testing/selftests/net/config
@@ -50,6 +50,7 @@ CONFIG_IPV6_ROUTER_PREF=y
 CONFIG_IPV6_RPL_LWTUNNEL=y
 CONFIG_IPV6_SEG6_LWTUNNEL=y
 CONFIG_IPV6_SIT=y
+CONFIG_IPV6_SUBTREES=y
 CONFIG_IPV6_VTI=y
 CONFIG_IPVLAN=m
 CONFIG_IPVTAP=m
diff --git a/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py b/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py
new file mode 100755
index 000000000000..21dfffc750ad
--- /dev/null
+++ b/tools/testing/selftests/net/ipv6_saddr_rfc6724rule5p5.py
@@ -0,0 +1,285 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2023-2026  David 'equinox' Lamparter
+"""
+RFC 6724 (IPv6 source address selection) rule 5.5 tests
+
+For reference:
+
+   Rule 5.5: Prefer addresses in a prefix advertised by the next-hop.
+   If SA or SA's prefix is assigned by the selected next-hop that will
+   be used to send to D and SB or SB's prefix is assigned by a different
+   next-hop, then prefer SA.  Similarly, if SB or SB's prefix is
+   assigned by the next-hop that will be used to send to D and SA or
+   SA's prefix is assigned by a different next-hop, then prefer SB.
+
+(and since it provides the "counterpoint":)
+
+   Rule 8: Use longest matching prefix.
+   If CommonPrefixLen(SA, D) > CommonPrefixLen(SB, D), then prefer SA.
+   Similarly, if CommonPrefixLen(SB, D) > CommonPrefixLen(SA, D), then
+   prefer SB.
+
+Note rule 5.5 was originally optional but made mandatory by
+draft-ietf-6man-rfc6724-update (which at the point of creation of this test
+was already "done" at the IETF but waiting in the RFC editor queue due to a
+blocking dependency.)
+"""
+
+from socket import socket, AF_INET6, SOCK_DGRAM
+from functools import wraps
+from typing import Callable
+
+from lib.py import ksft_run, ksft_exit, ksft_eq
+from lib.py import NetNS, NetNSEnter
+from lib.py import ip
+
+
+def select_addr(dest):
+    """
+    connect() + getsockname() to figure out what was selected as source address
+    """
+    sock = socket(AF_INET6, SOCK_DGRAM, 0)
+    sock.connect((dest, 12345))
+    return sock.getsockname()[0]
+
+
+def in_netns(func: Callable[[], None]) -> Callable[[], None]:
+    """
+    python decorator to put test function in netns
+    """
+
+    @wraps(func)
+    def wrapped() -> None:
+        with NetNS() as testns:
+            with NetNSEnter(str(testns)):
+                func()
+
+    return wrapped
+
+
+@in_netns
+def test_basic() -> None:
+    """
+    Simple & most common case for RFC6724 rule 5.5: multiple default routes
+    """
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64   dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+    ip("-6 route add default via fe80::1 dev veth0 metric 100")
+    ip("-6 route add default via fe80::2 dev veth0 metric 200")
+    ip("-6 route add default from 2001:db8:10::/48   via fe80::1 dev veth0")
+    ip("-6 route add default from 2001:db8:1000::/48 via fe80::2 dev veth0")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    # rule 8 would result in the use of the :1001: address, but rule 5.5 applies before.
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "rule 5.5 > rule 8")
+
+    ip("-6 route del default via fe80::1 dev veth0 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:1000::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:1000::1", "rule 5.5 > rule 8")
+
+
+@in_netns
+def test_nh_obj() -> None:
+    """
+    Same as above, but with nexthop objects for the default route
+
+    NB: The kernel doesn't currently allow nexthop objects for subtree routes.
+    """
+
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64   dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+
+    # distinct nexthop objects are used, because what matters is the nexthop
+    # itself, not the nexthop object.  To cover everything, make a group.
+    ip("nexthop add id 101 via fe80::1 dev veth0")
+    ip("nexthop add id 201 group 101")
+    ip("nexthop add id 102 via fe80::2 dev veth0")
+    ip("nexthop add id 202 group 102")
+
+    ip("-6 route add default nhid 201 metric 100")
+    ip("-6 route add default nhid 202 metric 200")
+    ip("-6 route add default from 2001:db8:10::/48   via fe80::1 dev veth0")
+    ip("-6 route add default from 2001:db8:1000::/48 via fe80::2 dev veth0")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    # rule 8 would result in the use of the :1001: address, but rule 5.5 applies before.
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "rule 5.5 > rule 8")
+
+    ip("-6 route del default nhid 201 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:1000::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:1000::1", "rule 5.5 > rule 8")
+
+
+@in_netns
+def test_low_metric() -> None:
+    """
+    Check that subtree routes take effect even if they are higher metric
+
+    For checking that "router advertised prefix", metric is irrelevant.  It
+    matters for the initial unspecific lookup to find a nexthop to begin with.
+    (The later source address check lookup doesn't change the nexthop, i.e.
+    the effects of metrics are already done.)
+    """
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64   dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+    ip("-6 route add default via fe80::1 dev veth0 metric 100")
+    ip("-6 route add default via fe80::2 dev veth0 metric 200")
+    ip("-6 route add default from 2001:db8:10::/48   via fe80::1 dev veth0")
+    ip("-6 route add default from 2001:db8:1000::/48 via fe80::2 dev veth0 metric 1000")
+    ip("-6 route add default from 2001:db8:1000::/48 via fe80::3 dev veth0 metric 50")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    # rule 8 would result in the use of the :1001: address, but rule 5.5 applies before.
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "rule 5.5 > rule 8")
+
+    ip("-6 route del default via fe80::1 dev veth0 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:1000::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:1000::1", "rule 5.5 > rule 8")
+
+
+@in_netns
+def test_no_subtree() -> None:
+    """
+    Ensure that matching on a non-subtree route doesn't trigger rule 5.5
+
+    (This was non-obviously broken in earlier versions of the implementations,
+    a non-subtree route would still match.  Make sure it doesn't break again.)
+    """
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64 dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+    ip("-6 route add default via fe80::1 dev veth0 metric 100")
+    ip("-6 route add default via fe80::2 dev veth0 metric 200")
+    ip("-6 route add default from 2001:db8:10::/48 via fe80::1 dev veth0")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    ksft_eq(
+        select_addr("2001:db8:1001::"),
+        "2001:db8:10::1",
+        "rule 5.5 > rule 8, ignoring non-SADR",
+    )
+
+
+@in_netns
+def test_longer() -> None:
+    """
+    Check functionality for non-default destination.
+
+    This is expected to be very rare in actual practice, and doesn't do
+    backtracking (also refer to kernel docs.)
+    """
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64 dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+    ip("-6 route add default           via fe80::1 dev veth0 metric 100")
+    ip("-6 route add 2001:db8:500::/48 via fe80::2 dev veth0 metric 100")
+    ip("-6 route add default           from 2001:db8:10::/48   via fe80::1 dev veth0")
+    ip("-6 route add 2001:db8:500::/48 from 2001:db8:1000::/48 via fe80::2 dev veth0")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:500::"), "2001:db8:1000::1", "rule 5.5")
+    ksft_eq(select_addr("2001:db8:500:aaa::"), "2001:db8:1000::1", "rule 5.5")
+
+    ip("-6 route add 2001:db8:500:aaa::/64 via fe80::2 dev veth0 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:500::"), "2001:db8:1000::1", "rule 5.5")
+    ksft_eq(select_addr("2001:db8:500:aaa::"), "2001:db8:10::1", "no backtracking")
+
+    ip("-6 route del 2001:db8:500::/48 from 2001:db8:1000::/48 via fe80::2 dev veth0")
+    ip("-6 route add default           from 2001:db8:1000::/48 via fe80::2 dev veth0")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    ksft_eq(select_addr("2001:db8:500::"), "2001:db8:10::1", "no backtracking")
+    ksft_eq(select_addr("2001:db8:500:aaa::"), "2001:db8:10::1", "no backtracking")
+
+
+@in_netns
+def test_multipath() -> None:
+    """
+    Test with an ECMP (but non-nexthop-object) dst-src route
+
+    Multiple nexthops for the non-subtree route can't make a difference since
+    the rule 5.5 code is called with a dst, not a route.  Nexthop objects on
+    subtree routes are rejected on (attempted) install by the kernel.
+    """
+    ip("link add type veth")
+    ip("link set veth0 up")
+    ip("link set veth1 up")
+    ip("addr add 2001:db8:10::1/64   dev veth0 nodad")
+    ip("addr add 2001:db8:1000::1/64 dev veth0 nodad")
+    ip("-6 route add default via fe80::1 dev veth0 metric 100")
+    ip("-6 route add default via fe80::2 dev veth0 metric 200")
+    ip(
+        "-6 route add default from 2001:db8:10::/48"
+        + " nexthop via fe80::1 dev veth0"
+        + " nexthop via fe80::101 dev veth0"
+    )
+    ip(
+        "-6 route add default from 2001:db8:1000::/48"
+        + " nexthop via fe80::2 dev veth0"
+        + " nexthop via fe80::102 dev veth0"
+    )
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "baseline pass")
+    # rule 8 would result in the use of the :1001: address, but rule 5.5 applies before.
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "rule 5.5 > rule 8")
+
+    # flip order
+    ip(
+        "-6 route replace default from 2001:db8:10::/48"
+        + " nexthop via fe80::101 dev veth0"
+        + " nexthop via fe80::1 dev veth0"
+    )
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "reorder")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "reorder, 5.5 > 8")
+
+    # try the other one
+    ip("-6 route replace default via fe80::101 dev veth0 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:10::1", "other NH")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:10::1", "other NH, 5.5 > 8")
+
+    ip("-6 route del default via fe80::101 dev veth0 metric 100")
+
+    ksft_eq(select_addr("2001:db8:11::"), "2001:db8:1000::1", "delete/baseline")
+    ksft_eq(select_addr("2001:db8:1001::"), "2001:db8:1000::1", "delete/5.5 > 8")
+
+
+def main() -> None:
+    """
+    RFC6724 rule 5.5 test driver
+    """
+    ksft_run(
+        [
+            test_basic,
+            test_nh_obj,
+            test_low_metric,
+            test_no_subtree,
+            test_longer,
+            test_multipath,
+        ]
+    )
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.53.0

