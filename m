From: petrm at mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:42 +0200
Subject: [PATCH net-next 8/9] selftests: forwarding:
 mirror_gre_vlan_bridge_1q: Add more tests
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <97030eb79ff7eefcb457e53711ec68e225a44d33.1527788672.git.petrm@mellanox.com>

Offloading of mirror-to-gretap in mlxsw is tricky especially in cases
when the gretap underlay involves bridges. Add more tests that exercise
the bridge handling code:

- forbidden_egress tests that check vlan removal on bridge port in the
  underlay packet path
- untagged_egress tests that similarly check "egress untagged"
- fdb_roaming tests that check whether learning FDB on a different port
  is reflected
- stp tests for handling port STP status of bridge egress port

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../net/forwarding/mirror_gre_vlan_bridge_1q.sh    | 129 +++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index d91b347..5dbc7a0 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -12,6 +12,14 @@ ALL_TESTS="
 	test_ip6gretap
 	test_gretap_forbidden_cpu
 	test_ip6gretap_forbidden_cpu
+	test_gretap_forbidden_egress
+	test_ip6gretap_forbidden_egress
+	test_gretap_untagged_egress
+	test_ip6gretap_untagged_egress
+	test_gretap_fdb_roaming
+	test_ip6gretap_fdb_roaming
+	test_gretap_stp
+	test_ip6gretap_stp
 "
 
 NUM_NETIFS=6
@@ -43,12 +51,14 @@ setup_prepare()
 
 	ip link set dev $swp3 master br1
 	bridge vlan add dev $swp3 vid 555
+	bridge vlan add dev $swp2 vid 555
 }
 
 cleanup()
 {
 	pre_cleanup
 
+	ip link set dev $swp2 nomaster
 	ip link set dev $swp3 nomaster
 	vlan_destroy $h3 555
 	vlan_destroy br1 555
@@ -112,6 +122,125 @@ test_ip6gretap_forbidden_cpu()
 	test_span_gre_forbidden_cpu gt6 "mirror to ip6gretap"
 }
 
+test_span_gre_forbidden_egress()
+{
+	local tundev=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+
+	bridge vlan del dev $swp3 vid 555
+	sleep 1
+	fail_test_span_gre_dir $tundev ingress
+
+	bridge vlan add dev $swp3 vid 555
+	# Re-prime FDB
+	arping -I br1.555 192.0.2.130 -fqc 1
+	sleep 1
+	quick_test_span_gre_dir $tundev ingress
+
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: vlan forbidden at a bridge egress ($tcflags)"
+}
+
+test_gretap_forbidden_egress()
+{
+	test_span_gre_forbidden_egress gt4 "mirror to gretap"
+}
+
+test_ip6gretap_forbidden_egress()
+{
+	test_span_gre_forbidden_egress gt6 "mirror to ip6gretap"
+}
+
+test_span_gre_untagged_egress()
+{
+	local tundev=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+
+	quick_test_span_gre_dir $tundev ingress
+	quick_test_span_vlan_dir $h3 555 ingress
+
+	bridge vlan add dev $swp3 vid 555 pvid untagged
+	sleep 1
+	quick_test_span_gre_dir $tundev ingress
+	fail_test_span_vlan_dir $h3 555 ingress
+
+	bridge vlan add dev $swp3 vid 555
+	sleep 1
+	quick_test_span_gre_dir $tundev ingress
+	quick_test_span_vlan_dir $h3 555 ingress
+
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: vlan untagged at a bridge egress ($tcflags)"
+}
+
+test_gretap_untagged_egress()
+{
+	test_span_gre_untagged_egress gt4 "mirror to gretap"
+}
+
+test_ip6gretap_untagged_egress()
+{
+	test_span_gre_untagged_egress gt6 "mirror to ip6gretap"
+}
+
+test_span_gre_fdb_roaming()
+{
+	local tundev=$1; shift
+	local what=$1; shift
+	local h3mac=$(mac_get $h3)
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir $tundev ingress
+
+	bridge fdb del dev $swp3 $h3mac vlan 555 master
+	bridge fdb add dev $swp2 $h3mac vlan 555 master
+	sleep 1
+	fail_test_span_gre_dir $tundev ingress
+
+	bridge fdb del dev $swp2 $h3mac vlan 555 master
+	# Re-prime FDB
+	arping -I br1.555 192.0.2.130 -fqc 1
+	sleep 1
+	quick_test_span_gre_dir $tundev ingress
+
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: MAC roaming ($tcflags)"
+}
+
+test_gretap_fdb_roaming()
+{
+	test_span_gre_fdb_roaming gt4 "mirror to gretap"
+}
+
+test_ip6gretap_fdb_roaming()
+{
+	test_span_gre_fdb_roaming gt6 "mirror to ip6gretap"
+}
+
+test_gretap_stp()
+{
+	full_test_span_gre_stp gt4 $swp3 "mirror to gretap"
+}
+
+test_ip6gretap_stp()
+{
+	full_test_span_gre_stp gt6 $swp3 "mirror to ip6gretap"
+}
+
 test_all()
 {
 	slow_path_trap_install $swp1 ingress
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
