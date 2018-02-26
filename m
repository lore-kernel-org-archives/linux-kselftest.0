From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:38 +0200
Subject: [PATCH net-next 04/14] selftests: forwarding: Add a test for basic
 IPv4 and IPv6 routing
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-5-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226085938.B-_J8gjW8v2Q8sRKSXuVkq-LzFA2zXy2aS4dByg-Wr8@z>

Configure two hosts which are directly connected to the same router and
test IPv4 and IPv6 ping. Use a large MTU and check that ping is
unaffected.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh    |  15 +++
 tools/testing/selftests/net/forwarding/router.sh | 125 +++++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/router.sh

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 44c9650ceb2a..85611868a80a 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -267,6 +267,21 @@ bridge_ageing_time_get()
 	echo $((ageing_time / 100))
 }
 
+forwarding_enable()
+{
+       ipv4_fwd=$(sysctl -n net.ipv4.conf.all.forwarding)
+       ipv6_fwd=$(sysctl -n net.ipv6.conf.all.forwarding)
+
+       sysctl -q -w net.ipv4.conf.all.forwarding=1
+       sysctl -q -w net.ipv6.conf.all.forwarding=1
+}
+
+forwarding_restore()
+{
+       sysctl -q -w net.ipv6.conf.all.forwarding=$ipv6_fwd
+       sysctl -q -w net.ipv4.conf.all.forwarding=$ipv4_fwd
+}
+
 ##############################################################################
 # Tests
 
diff --git a/tools/testing/selftests/net/forwarding/router.sh b/tools/testing/selftests/net/forwarding/router.sh
new file mode 100755
index 000000000000..cc6a14abfa87
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/router.sh
@@ -0,0 +1,125 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=4
+source lib.sh
+
+h1_create()
+{
+	vrf_create "vrf-h1"
+	ip link set dev $h1 master vrf-h1
+
+	ip link set dev vrf-h1 up
+	ip link set dev $h1 up
+
+	ip address add 192.0.2.2/24 dev $h1
+	ip address add 2001:db8:1::2/64 dev $h1
+
+	ip route add 198.51.100.0/24 vrf vrf-h1 nexthop via 192.0.2.1
+	ip route add 2001:db8:2::/64 vrf vrf-h1 nexthop via 2001:db8:1::1
+}
+
+h1_destroy()
+{
+	ip route del 2001:db8:2::/64 vrf vrf-h1
+	ip route del 198.51.100.0/24 vrf vrf-h1
+
+	ip address del 2001:db8:1::2/64 dev $h1
+	ip address del 192.0.2.2/24 dev $h1
+
+	ip link set dev $h1 down
+	vrf_destroy "vrf-h1"
+}
+
+h2_create()
+{
+	vrf_create "vrf-h2"
+	ip link set dev $h2 master vrf-h2
+
+	ip link set dev vrf-h2 up
+	ip link set dev $h2 up
+
+	ip address add 198.51.100.2/24 dev $h2
+	ip address add 2001:db8:2::2/64 dev $h2
+
+	ip route add 192.0.2.0/24 vrf vrf-h2 nexthop via 198.51.100.1
+	ip route add 2001:db8:1::/64 vrf vrf-h2 nexthop via 2001:db8:2::1
+}
+
+h2_destroy()
+{
+	ip route del 2001:db8:1::/64 vrf vrf-h2
+	ip route del 192.0.2.0/24 vrf vrf-h2
+
+	ip address del 2001:db8:2::2/64 dev $h2
+	ip address del 198.51.100.2/24 dev $h2
+
+	ip link set dev $h2 down
+	vrf_destroy "vrf-h2"
+}
+
+router_create()
+{
+	ip link set dev $rp1 up
+	ip link set dev $rp2 up
+
+	ip address add 192.0.2.1/24 dev $rp1
+	ip address add 2001:db8:1::1/64 dev $rp1
+
+	ip address add 198.51.100.1/24 dev $rp2
+	ip address add 2001:db8:2::1/64 dev $rp2
+}
+
+router_destroy()
+{
+	ip address del 2001:db8:2::1/64 dev $rp2
+	ip address del 198.51.100.1/24 dev $rp2
+
+	ip address del 2001:db8:1::1/64 dev $rp1
+	ip address del 192.0.2.1/24 dev $rp1
+
+	ip link set dev $rp2 down
+	ip link set dev $rp1 down
+}
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	rp1=${NETIFS[p2]}
+
+	rp2=${NETIFS[p3]}
+	h2=${NETIFS[p4]}
+
+	vrf_prepare
+
+	h1_create
+	h2_create
+
+	router_create
+
+	forwarding_enable
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	forwarding_restore
+
+	router_destroy
+
+	h2_destroy
+	h1_destroy
+
+	vrf_cleanup
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+ping_test $h1 198.51.100.2
+ping6_test $h1 2001:db8:2::2
+
+exit $EXIT_STATUS
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
