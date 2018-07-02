From: petrm at mellanox.com (Petr Machata)
Date: Mon, 02 Jul 2018 19:58:49 +0200
Subject: [PATCH net-next 1/2] selftests: forwarding: Test mirror-to-gretap w/
 UL 802.1d
In-Reply-To: <cover.1530553971.git.petrm@mellanox.com>
References: <cover.1530553971.git.petrm@mellanox.com>
Message-ID: <26f9123ca3d9cc6faf32df5a078eca852e9f787e.1530553971.git.petrm@mellanox.com>

Test for "tc action mirred egress mirror" that mirrors to gretap when
the underlay route points at a VLAN-unaware bridge (802.1d).

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_bridge_1d.sh         | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d.sh b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d.sh
new file mode 100755
index 000000000000..c5095da7f6bf
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d.sh
@@ -0,0 +1,132 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Test for "tc action mirred egress mirror" when the underlay route points at a
+# bridge device without vlan filtering (802.1d).
+#
+# This test uses standard topology for testing mirror-to-gretap. See
+# mirror_gre_topo_lib.sh for more details. The full topology is as follows:
+#
+#  +---------------------+                             +---------------------+
+#  | H1                  |                             |                  H2 |
+#  |     + $h1           |                             |           $h2 +     |
+#  |     | 192.0.2.1/28  |                             |  192.0.2.2/28 |     |
+#  +-----|---------------+                             +---------------|-----+
+#        |                                                             |
+#  +-----|-------------------------------------------------------------|-----+
+#  | SW  o---> mirror                                                  |     |
+#  | +---|-------------------------------------------------------------|---+ |
+#  | |   + $swp1            + br1 (802.1q bridge)                $swp2 +   | |
+#  | +---------------------------------------------------------------------+ |
+#  |                                                                         |
+#  | +---------------------------------------------------------------------+ |
+#  | |                      + br2 (802.1d bridge)                          | |
+#  | |                        192.0.2.129/28                               | |
+#  | |   + $swp3              2001:db8:2::1/64                             | |
+#  | +---|-----------------------------------------------------------------+ |
+#  |     |                                          ^                    ^   |
+#  |     |                     + gt6 (ip6gretap)    | + gt4 (gretap)     |   |
+#  |     |                     : loc=2001:db8:2::1  | : loc=192.0.2.129  |   |
+#  |     |                     : rem=2001:db8:2::2 -+ : rem=192.0.2.130 -+   |
+#  |     |                     : ttl=100              : ttl=100              |
+#  |     |                     : tos=inherit          : tos=inherit          |
+#  +-----|---------------------:----------------------:----------------------+
+#        |                     :                      :
+#  +-----|---------------------:----------------------:----------------------+
+#  | H3  + $h3                 + h3-gt6(ip6gretap)    + h3-gt4 (gretap)      |
+#  |       192.0.2.130/28        loc=2001:db8:2::2      loc=192.0.2.130      |
+#  |       2001:db8:2::2/64      rem=2001:db8:2::1      rem=192.0.2.129      |
+#  |                             ttl=100                ttl=100              |
+#  |                             tos=inherit            tos=inherit          |
+#  +-------------------------------------------------------------------------+
+
+ALL_TESTS="
+	test_gretap
+	test_ip6gretap
+"
+
+NUM_NETIFS=6
+source lib.sh
+source mirror_lib.sh
+source mirror_gre_lib.sh
+source mirror_gre_topo_lib.sh
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	swp1=${NETIFS[p2]}
+
+	swp2=${NETIFS[p3]}
+	h2=${NETIFS[p4]}
+
+	swp3=${NETIFS[p5]}
+	h3=${NETIFS[p6]}
+
+	vrf_prepare
+	mirror_gre_topo_create
+
+	ip link add name br2 type bridge vlan_filtering 0
+	ip link set dev br2 up
+
+	ip link set dev $swp3 master br2
+	ip route add 192.0.2.130/32 dev br2
+	ip -6 route add 2001:db8:2::2/128 dev br2
+
+	ip address add dev br2 192.0.2.129/28
+	ip address add dev br2 2001:db8:2::1/64
+
+	ip address add dev $h3 192.0.2.130/28
+	ip address add dev $h3 2001:db8:2::2/64
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	ip address del dev $h3 2001:db8:2::2/64
+	ip address del dev $h3 192.0.2.130/28
+	ip link del dev br2
+
+	mirror_gre_topo_destroy
+	vrf_cleanup
+}
+
+test_gretap()
+{
+	full_test_span_gre_dir gt4 ingress 8 0 "mirror to gretap"
+	full_test_span_gre_dir gt4 egress 0 8 "mirror to gretap"
+}
+
+test_ip6gretap()
+{
+	full_test_span_gre_dir gt6 ingress 8 0 "mirror to ip6gretap"
+	full_test_span_gre_dir gt6 egress 0 8 "mirror to ip6gretap"
+}
+
+test_all()
+{
+	slow_path_trap_install $swp1 ingress
+	slow_path_trap_install $swp1 egress
+
+	tests_run
+
+	slow_path_trap_uninstall $swp1 egress
+	slow_path_trap_uninstall $swp1 ingress
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+tcflags="skip_hw"
+test_all
+
+if ! tc_offload_check; then
+	echo "WARN: Could not test offloaded functionality"
+else
+	tcflags="skip_sw"
+	test_all
+fi
+
+exit $EXIT_STATUS
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
