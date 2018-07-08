From: petrm@mellanox.com (Petr Machata)
Date: Sun, 08 Jul 2018 19:58:55 +0200
Subject: [PATCH net-next] selftests: forwarding: mirror_lib: Tighten up VLAN
 capture
Message-ID:
 <0fecbe018ff9a06a5f3686e3c4801b5005925019.1531072211.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180708175855.HltgzJ69YC1i7Il-LgFai058AHM4NhtkDuy5nCkmqYM@z>

The function do_test_span_vlan_dir_ips() is used for testing whether
mirrored packets are VLAN-encapsulated. But since it only considers
VLAN encapsulation, it may end up matching unmirrored ARP traffic as
well. One consequence is a rare failure of mirror_gre_vlan_bridge_1q's
test_gretap_untagged_egress. Decreasing ping cadence in mirror_test()
makes the problem easily reproducible.

Therefore tighten up the match criterion to only count those 802.1q
packets where the next header is IP.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_lib.sh b/tools/testing/selftests/net/forwarding/mirror_lib.sh
index d36dc26c6c51..07991e1025c7 100644
--- a/tools/testing/selftests/net/forwarding/mirror_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_lib.sh
@@ -105,7 +105,7 @@ do_test_span_vlan_dir_ips()
 	# Install the capture as skip_hw to avoid double-counting of packets.
 	# The traffic is meant for local box anyway, so will be trapped to
 	# kernel.
-	vlan_capture_install $dev "skip_hw vlan_id $vid"
+	vlan_capture_install $dev "skip_hw vlan_id $vid vlan_ethtype ip"
 	mirror_test v$h1 $ip1 $ip2 $dev 100 $expect
 	mirror_test v$h2 $ip2 $ip1 $dev 100 $expect
 	vlan_capture_uninstall $dev
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
