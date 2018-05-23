From: petrm@mellanox.com (Petr Machata)
Date: Wed, 23 May 2018 18:41:56 +0200
Subject: [PATCH net-next] selftests: net: Test headroom handling of ip6_gre
 devices
Message-ID:
 <a78543459df02997bc298c09e9aa56167b22d5a4.1527093523.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180523164156.5ueYLRg0RKGdQJgQYxORDPwvnROX-unJlEsqNyALdjE@z>

Commit 5691484df961 ("net: ip6_gre: Fix headroom request in
ip6erspan_tunnel_xmit()") and commit 01b8d064d58b ("net: ip6_gre:
Request headroom in __gre6_xmit()") fix problems in reserving headroom
in the packets tunneled through ip6gre/tap and ip6erspan netdevices.

These two patches included snippets that reproduced the issues. This
patch elevates the snippets to a full-fledged test case.

Suggested-by: David Miller <davem at davemloft.net>
Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/ip6_gre_headroom.sh | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100755 tools/testing/selftests/net/ip6_gre_headroom.sh

diff --git a/tools/testing/selftests/net/ip6_gre_headroom.sh b/tools/testing/selftests/net/ip6_gre_headroom.sh
new file mode 100755
index 0000000..9aaf63fd
--- /dev/null
+++ b/tools/testing/selftests/net/ip6_gre_headroom.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Test that enough headroom is reserved for the first packet passing through an
+# IPv6 GRE-like netdevice.
+
+setup_prepare()
+{
+	ip link add h1 type veth peer name swp1
+	ip link add h3 type veth peer name swp3
+
+	ip link set dev h1 up
+	ip address add 192.0.2.1/28 dev h1
+
+	ip link add dev vh3 type vrf table 20
+	ip link set dev h3 master vh3
+	ip link set dev vh3 up
+	ip link set dev h3 up
+
+	ip link set dev swp3 up
+	ip address add dev swp3 2001:db8:2::1/64
+
+	ip link set dev swp1 up
+	tc qdisc add dev swp1 clsact
+}
+
+cleanup()
+{
+	ip link del dev swp1
+	ip link del dev swp3
+	ip link del dev vh3
+}
+
+test_headroom()
+{
+	ip link add name gt6 "$@"
+	ip link set dev gt6 up
+
+	sleep 1
+
+	tc filter add dev swp1 ingress pref 1000 matchall skip_hw \
+		action mirred egress mirror dev gt6
+	ping -I h1 192.0.2.2 -c 1 -w 2 &> /dev/null
+	tc filter del dev swp1 ingress pref 1000
+
+	ip link del dev gt6
+
+	# If it doesn't panic, it passes.
+	printf "TEST: %-60s  [PASS]\n" "$2 headroom"
+}
+
+trap cleanup EXIT
+
+setup_prepare
+
+test_headroom type ip6erspan \
+	      local 2001:db8:2::1 remote 2001:db8:2::2 oseq okey 123
+test_headroom type ip6gretap \
+	      local 2001:db8:2::1 remote 2001:db8:2::2
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
