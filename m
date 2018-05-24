From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:28:06 +0200
Subject: [PATCH net-next 10/10] selftests: forwarding: Test mirror-to-gre w/
 UL 802.1d+VLAN
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <2baa18123d3f1594d552d808d68f155f0701a78e.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142806.uPxg-BDd2ceDMvWclUhv3ysJ7glilYymGnjHFfOpO0o@z>

Test for "tc action mirred egress mirror" that mirrors to GRE when the
underlay route points at an 802.1d bridge and packet egresses through a
VLAN device.

Besides testing basic connectivity, this also tests that the traffic is
properly tagged.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_bridge_1d_vlan.sh    | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
new file mode 100755
index 0000000..3d47afc
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
@@ -0,0 +1,109 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# This test uses standard topology for testing gretap. See
+# mirror_gre_topo_lib.sh for more details.
+#
+# Test for "tc action mirred egress mirror" when the underlay route points at a
+# bridge device without vlan filtering (802.1d). The device attached to that
+# bridge is a VLAN.
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
+	vlan_create $swp3 555
+
+	ip link set dev $swp3.555 master br2
+	ip route add 192.0.2.130/32 dev br2
+	ip -6 route add 2001:db8:2::2/128 dev br2
+
+	ip address add dev br2 192.0.2.129/32
+	ip address add dev br2 2001:db8:2::1/128
+
+	vlan_create $h3 555 v$h3 192.0.2.130/28 2001:db8:2::2/64
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	vlan_destroy $h3 555
+	ip link del dev br2
+	vlan_destroy $swp3 555
+
+	mirror_gre_topo_destroy
+	vrf_cleanup
+}
+
+test_vlan_match()
+{
+	local tundev=$1; shift
+	local vlan_match=$1; shift
+	local what=$1; shift
+
+	full_test_span_gre_dir_vlan $tundev ingress "$vlan_match" 8 0 "$what"
+	full_test_span_gre_dir_vlan $tundev egress "$vlan_match" 0 8 "$what"
+}
+
+test_gretap()
+{
+	test_vlan_match gt4 'vlan_id 555 vlan_ethtype ip' "mirror to gretap"
+}
+
+test_ip6gretap()
+{
+	test_vlan_match gt6 'vlan_id 555 vlan_ethtype ipv6' "mirror to ip6gretap"
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
