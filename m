From: petrm@mellanox.com (Petr Machata)
Date: Thu, 28 Jun 2018 18:56:33 +0200
Subject: [PATCH net-next 3/4] selftests: forwarding: Tweak tc filters for
 mirror-to-gretap tests
In-Reply-To: <cover.1530204784.git.petrm@mellanox.com>
References: <cover.1530204784.git.petrm@mellanox.com>
Message-ID:
 <2b0d63421c21703e02ee9aa8097dd8b86b875c53.1530204784.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180628165633.t57P7gMcM7JdatjuIUiYGeJauTdxKZulOWZUYT99JP4@z>

When running mirror_gre_bridge_1d_vlan tests on veth, several issues
cause spurious failures:

- vlan_ethtype should be ip, not ipv6 even in mirror-to-ip6gretap case,
  because the overlay packet is still IPv4.
- Similarly ip_proto matches the innermost IP protocol, so can't be used
  to filter out GRE packet. Drop the corresponding condition.
- Because the above fixes the filters to match in slow path as well,
  they need to be made skip_hw so as not to double-count packets.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh | 6 ++++--
 tools/testing/selftests/net/forwarding/mirror_gre_lib.sh            | 2 +-
 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh | 6 ++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
index 3bb4c2ba7b14..197e769c2ed1 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_bridge_1d_vlan.sh
@@ -74,12 +74,14 @@ test_vlan_match()
 
 test_gretap()
 {
-	test_vlan_match gt4 'vlan_id 555 vlan_ethtype ip' "mirror to gretap"
+	test_vlan_match gt4 'skip_hw vlan_id 555 vlan_ethtype ip' \
+			"mirror to gretap"
 }
 
 test_ip6gretap()
 {
-	test_vlan_match gt6 'vlan_id 555 vlan_ethtype ipv6' "mirror to ip6gretap"
+	test_vlan_match gt6 'skip_hw vlan_id 555 vlan_ethtype ip' \
+			"mirror to ip6gretap"
 }
 
 test_gretap_stp()
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index 619b469365be..1c18e332cd4f 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -62,7 +62,7 @@ full_test_span_gre_dir_vlan_ips()
 			  "$backward_type" "$ip1" "$ip2"
 
 	tc filter add dev $h3 ingress pref 77 prot 802.1q \
-		flower $vlan_match ip_proto 0x2f \
+		flower $vlan_match \
 		action pass
 	mirror_test v$h1 $ip1 $ip2 $h3 77 10
 	tc filter del dev $h3 ingress pref 77
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index 1ac5038ae256..d3e75bb6a2d8 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -88,12 +88,14 @@ test_vlan_match()
 
 test_gretap()
 {
-	test_vlan_match gt4 'vlan_id 555 vlan_ethtype ip' "mirror to gretap"
+	test_vlan_match gt4 'skip_hw vlan_id 555 vlan_ethtype ip' \
+			"mirror to gretap"
 }
 
 test_ip6gretap()
 {
-	test_vlan_match gt6 'vlan_id 555 vlan_ethtype ipv6' "mirror to ip6gretap"
+	test_vlan_match gt6 'skip_hw vlan_id 555 vlan_ethtype ip' \
+			"mirror to ip6gretap"
 }
 
 test_span_gre_forbidden_cpu()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
