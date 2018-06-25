From: petrm@mellanox.com (Petr Machata)
Date: Tue, 26 Jun 2018 01:20:32 +0200
Subject: [PATCH net-next] selftests: forwarding: mirror_gre_vlan_bridge_1q:
 Unset rp_filter
Message-ID:
 <66d218fb95026460e240752eec3af58920a14d86.1529968802.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625232032.DxIpTLiUip5oSdeHZ3YM3rW1-Oqh6Hxjz57tVKOc978@z>

The IP addresses of tunnel endpoint at H3 are set at the VLAN device
$h3.555. Therefore when test_gretap_untagged_egress() sets vlan 555 to
egress untagged at $swp3, $h3's rp_filter rejects these packets. The
test then spuriously fails.

Therefore turn off net.ipv4.conf.{all, $h3}.rp_filter.

Fixes: 9c7c8a82442c ("selftests: forwarding: mirror_gre_vlan_bridge_1q: Add more tests")
Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index 5dbc7a08f4bd..1ac5038ae256 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -39,6 +39,12 @@ setup_prepare()
 	swp3=${NETIFS[p5]}
 	h3=${NETIFS[p6]}
 
+	# gt4's remote address is at $h3.555, not $h3. Thus the packets arriving
+	# directly to $h3 for test_gretap_untagged_egress() are rejected by
+	# rp_filter and the test spuriously fails.
+	sysctl_set net.ipv4.conf.all.rp_filter 0
+	sysctl_set net.ipv4.conf.$h3.rp_filter 0
+
 	vrf_prepare
 	mirror_gre_topo_create
 
@@ -65,6 +71,9 @@ cleanup()
 
 	mirror_gre_topo_destroy
 	vrf_cleanup
+
+	sysctl_restore net.ipv4.conf.$h3.rp_filter
+	sysctl_restore net.ipv4.conf.all.rp_filter
 }
 
 test_vlan_match()
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
