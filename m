From: petrm at mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:47 +0200
Subject: [PATCH net-next 9/9] selftests: forwarding:
 mirror_gre_bridge_1d_vlan: Add STP test
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <db3de9cabd485e3c60b6cceb5a91aae630217cd0.1527788672.git.petrm@mellanox.com>

To test offloading of mirror-to-gretap in mlxsw for cases that a
VLAN-unaware bridge is in underlay packet path, test that the STP status
of bridge egress port is reflected.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
index 3d47afc..3bb4c2b 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
@@ -11,6 +11,8 @@
 ALL_TESTS="
 	test_gretap
 	test_ip6gretap
+	test_gretap_stp
+	test_ip6gretap_stp
 "
 
 NUM_NETIFS=6
@@ -80,6 +82,16 @@ test_ip6gretap()
 	test_vlan_match gt6 'vlan_id 555 vlan_ethtype ipv6' "mirror to ip6gretap"
 }
 
+test_gretap_stp()
+{
+	full_test_span_gre_stp gt4 $swp3.555 "mirror to gretap"
+}
+
+test_ip6gretap_stp()
+{
+	full_test_span_gre_stp gt6 $swp3.555 "mirror to ip6gretap"
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
