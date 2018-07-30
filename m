From: petrm at mellanox.com (Petr Machata)
Date: Mon, 30 Jul 2018 16:39:57 +0200
Subject: [PATCH net-next 3/5] selftests: forwarding: Introduce $ARPING
In-Reply-To: <cover.1532961216.git.petrm@mellanox.com>
References: <cover.1532961216.git.petrm@mellanox.com>
Message-ID: <9fc8bf6931e5f159ca61254639b02a2dfa5e1e32.1532961216.git.petrm@mellanox.com>

Instead of relying on "arping" being installed everywhere under that
name, introduce a variable $ARPING like the other tools do.

Convert an existing test, mirror_gre_vlan_bridge_1q.sh to
require_command $ARPING and then invoke arping through the variable.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh                       | 1 +
 tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 3a4eba4f0d08..843a6715924f 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -8,6 +8,7 @@
 PING=${PING:=ping}
 PING6=${PING6:=ping6}
 MZ=${MZ:=mausezahn}
+ARPING=${ARPING:=arping}
 TEAMD=${TEAMD:=teamd}
 WAIT_TIME=${WAIT_TIME:=5}
 PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
index d3e75bb6a2d8..204b25f13934 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_vlan_bridge_1q.sh
@@ -28,6 +28,8 @@ source mirror_lib.sh
 source mirror_gre_lib.sh
 source mirror_gre_topo_lib.sh
 
+require_command $ARPING
+
 setup_prepare()
 {
 	h1=${NETIFS[p1]}
@@ -149,7 +151,7 @@ test_span_gre_forbidden_egress()
 
 	bridge vlan add dev $swp3 vid 555
 	# Re-prime FDB
-	arping -I br1.555 192.0.2.130 -fqc 1
+	$ARPING -I br1.555 192.0.2.130 -fqc 1
 	sleep 1
 	quick_test_span_gre_dir $tundev ingress
 
@@ -223,7 +225,7 @@ test_span_gre_fdb_roaming()
 
 	bridge fdb del dev $swp2 $h3mac vlan 555 master
 	# Re-prime FDB
-	arping -I br1.555 192.0.2.130 -fqc 1
+	$ARPING -I br1.555 192.0.2.130 -fqc 1
 	sleep 1
 	quick_test_span_gre_dir $tundev ingress
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
