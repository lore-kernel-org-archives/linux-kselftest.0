From: petrm at mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:55 +0200
Subject: [PATCH net-next 08/10] selftests: forwarding: Test mirror-to-gre w/
 UL VLAN+802.1q
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID: <0d431918534794d3ebadb15c3938808808b0bc45.1527171860.git.petrm@mellanox.com>

Test for "tc action mirred egress mirror" that mirrors to GRE when the
underlay route points at a vlan device on top of a bridge device with
vlan filtering (802.1q).

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
new file mode 100755
index 0000000..01ec28a
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -0,0 +1,140 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# This test uses standard topology for testing gretap. See
+# mirror_gre_topo_lib.sh for more details.
+#
+# Test for "tc action mirred egress mirror" when the underlay route points at a
+# vlan device on top of a bridge device with vlan filtering (802.1q).
+
+ALL_TESTS="
+	test_gretap
+	test_ip6gretap
+	test_gretap_forbidden
+	test_ip6gretap_forbidden
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
+	vlan_create br1 555 "" 192.0.2.129/32 2001:db8:2::1/128
+	bridge vlan add dev br1 vid 555 self
+	ip route rep 192.0.2.130/32 dev br1.555
+	ip -6 route rep 2001:db8:2::2/128 dev br1.555
+
+	vlan_create $h3 555 v$h3 192.0.2.130/28 2001:db8:2::2/64
+
+	ip link set dev $swp3 master br1
+	bridge vlan add dev $swp3 vid 555
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	ip link set dev $swp3 nomaster
+	vlan_destroy $h3 555
+	vlan_destroy br1 555
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
+test_span_gre_forbidden()
+{
+	local tundev=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	# Run the pass-test first, to prime neighbor table.
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+
+	# Now forbid the VLAN at the bridge and see it fail.
+	bridge vlan del dev br1 vid 555 self
+	sleep 1
+
+	fail_test_span_gre_dir $tundev ingress
+	mirror_uninstall $swp1 ingress
+
+	bridge vlan add dev br1 vid 555 self
+	sleep 1
+
+	log_test "$what: vlan forbidden at a bridge ($tcflags)"
+}
+
+test_gretap_forbidden()
+{
+	test_span_gre_forbidden gt4 "mirror to gretap"
+}
+
+test_ip6gretap_forbidden()
+{
+	test_span_gre_forbidden gt4 "mirror to ip6gretap"
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
