From: petrm at mellanox.com (Petr Machata)
Date: Mon, 25 Jun 2018 16:43:55 +0200
Subject: [PATCH net-next v2] selftests: net: Test headroom handling of ip6_gre
 devices
Message-ID: <2071eab42614e7019ece0e2d6f89fdde55815347.1529937619.git.petrm@mellanox.com>

Commit 5691484df961 ("net: ip6_gre: Fix headroom request in
ip6erspan_tunnel_xmit()") and commit 01b8d064d58b ("net: ip6_gre:
Request headroom in __gre6_xmit()") fix problems in reserving headroom
in the packets tunneled through ip6gre/tap and ip6erspan netdevices.

These two patches included snippets that reproduced the issues. This
patch elevates the snippets to a full-fledged test case.

Suggested-by: David Miller <davem at davemloft.net>
Signed-off-by: Petr Machata <petrm at mellanox.com>
---

Notes:
    Changes between v1 and v2:
    
    - Move tunnel construction to setup() and destruction to cleanup().

 tools/testing/selftests/net/ip6_gre_headroom.sh | 65 +++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100755 tools/testing/selftests/net/ip6_gre_headroom.sh

diff --git a/tools/testing/selftests/net/ip6_gre_headroom.sh b/tools/testing/selftests/net/ip6_gre_headroom.sh
new file mode 100755
index 000000000000..5b41e8bb6e2d
--- /dev/null
+++ b/tools/testing/selftests/net/ip6_gre_headroom.sh
@@ -0,0 +1,65 @@
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
+	ip address add dev swp3 2001:db8:2::3/64
+
+	ip link set dev swp1 up
+	tc qdisc add dev swp1 clsact
+
+	ip link add name er6 type ip6erspan \
+	   local 2001:db8:2::1 remote 2001:db8:2::2 oseq okey 123
+	ip link set dev er6 up
+
+	ip link add name gt6 type ip6gretap \
+	   local 2001:db8:2::3 remote 2001:db8:2::4
+	ip link set dev gt6 up
+
+	sleep 1
+}
+
+cleanup()
+{
+	ip link del dev gt6
+	ip link del dev er6
+	ip link del dev swp1
+	ip link del dev swp3
+	ip link del dev vh3
+}
+
+test_headroom()
+{
+	local type=$1; shift
+	local tundev=$1; shift
+
+	tc filter add dev swp1 ingress pref 1000 matchall skip_hw \
+		action mirred egress mirror dev $tundev
+	ping -I h1 192.0.2.2 -c 1 -w 2 &> /dev/null
+	tc filter del dev swp1 ingress pref 1000
+
+	# If it doesn't panic, it passes.
+	printf "TEST: %-60s  [PASS]\n" "$type headroom"
+}
+
+trap cleanup EXIT
+
+setup_prepare
+test_headroom ip6gretap gt6
+test_headroom ip6erspan er6
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
