From: petrm@mellanox.com (Petr Machata)
Date: Mon, 02 Jul 2018 19:58:56 +0200
Subject: [PATCH net-next 2/2] selftests: forwarding: Test mirror-to-gretap w/
 UL 802.1q
In-Reply-To: <cover.1530553971.git.petrm@mellanox.com>
References: <cover.1530553971.git.petrm@mellanox.com>
Message-ID:
 <39daad3687d4e5bfc34044eadaaff90edabace86.1530553971.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180702175856.BTgJQtkfCMxsyGbg4Gyhp3hKw8IDRoitqYwVNNi5RzU@z>

Test for "tc action mirred egress mirror" that mirrors to gretap when
the underlay route points at a VLAN-aware bridge (802.1q).

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_bridge_1q.sh         | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q.sh
new file mode 100755
index 000000000000..a3402cd8d5b6
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1q.sh
@@ -0,0 +1,126 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Test for "tc action mirred egress mirror" when the underlay route points at a
+# bridge device with vlan filtering (802.1q).
+#
+# This test uses standard topology for testing mirror-to-gretap. See
+# mirror_gre_topo_lib.sh for more details. The full topology is as follows:
+#
+#  +---------------------+                               +---------------------+
+#  | H1                  |                               |                  H2 |
+#  |     + $h1           |                               |           $h2 +     |
+#  |     | 192.0.2.1/28  |                               |  192.0.2.2/28 |     |
+#  +-----|---------------+                               +---------------|-----+
+#        |                                                               |
+#  +-----|---------------------------------------------------------------|-----+
+#  | SW  o---> mirror                                                    |     |
+#  | +---|---------------------------------------------------------------|---+ |
+#  | |   + $swp1                  + br1 (802.1q bridge)            $swp2 +   | |
+#  | |                              192.0.2.129/28                           | |
+#  | |   + $swp3                    2001:db8:2::1/64                         | |
+#  | |   | vid555                   vid555[pvid,untagged]                    | |
+#  | +---|-------------------------------------------------------------------+ |
+#  |     |                                          ^                      ^   |
+#  |     |                     + gt6 (ip6gretap)    |   + gt4 (gretap)     |   |
+#  |     |                     : loc=2001:db8:2::1  |   : loc=192.0.2.129  |   |
+#  |     |                     : rem=2001:db8:2::2 -+   : rem=192.0.2.130 -+   |
+#  |     |                     : ttl=100                : ttl=100              |
+#  |     |                     : tos=inherit            : tos=inherit          |
+#  +-----|---------------------:------------------------:----------------------+
+#        |                     :                        :
+#  +-----|---------------------:------------------------:----------------------+
+#  | H3  + $h3                 + h3-gt6(ip6gretap)      + h3-gt4 (gretap)      |
+#  |     |                       loc=2001:db8:2::2        loc=192.0.2.130      |
+#  |     + $h3.555               rem=2001:db8:2::1        rem=192.0.2.129      |
+#  |       192.0.2.130/28        ttl=100                  ttl=100              |
+#  |       2001:db8:2::2/64      tos=inherit              tos=inherit          |
+#  +---------------------------------------------------------------------------+
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
+	ip link set dev $swp3 master br1
+	bridge vlan add dev br1 vid 555 pvid untagged self
+	ip address add dev br1 192.0.2.129/28
+	ip address add dev br1 2001:db8:2::1/64
+
+	ip -4 route add 192.0.2.130/32 dev br1
+	ip -6 route add 2001:db8:2::2/128 dev br1
+
+	vlan_create $h3 555 v$h3 192.0.2.130/28 2001:db8:2::2/64
+	bridge vlan add dev $swp3 vid 555
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	ip link set dev $swp3 nomaster
+	vlan_destroy $h3 555
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
+tests()
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
+tests
+
+if ! tc_offload_check; then
+	echo "WARN: Could not test offloaded functionality"
+else
+	tcflags="skip_sw"
+	tests
+fi
+
+exit $EXIT_STATUS
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
