From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:18 +0000
Subject: [PATCH net-next 10/18] selftests: forwarding: vxlan_bridge_1d: Add
 unicast test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-11-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Test that when sending traffic to a learned MAC address, the traffic is
forwarded accurately only to the right endpoint.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index 1edd5189c41c..1a3486ec1d21 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -67,6 +67,7 @@ export VXPORT
 : ${ALL_TESTS:="
 	ping_ipv4
 	test_flood
+	test_unicast
     "}
 
 NUM_NETIFS=6
@@ -263,6 +264,10 @@ setup_prepare()
 	vrp2_create
 	ns1_create
 	ns2_create
+
+	r1_mac=$(in_ns ns1 mac_get w2)
+	r2_mac=$(in_ns ns2 mac_get w2)
+	h2_mac=$(mac_get $h2)
 }
 
 cleanup()
@@ -394,6 +399,55 @@ test_flood()
 	__test_flood de:ad:be:ef:13:37 192.0.2.100 "flood"
 }
 
+vxlan_fdb_add_del()
+{
+	local add_del=$1; shift
+	local mac=$1; shift
+	local dev=$1; shift
+	local dst=$1; shift
+
+	bridge fdb $add_del dev $dev $mac self static permanent \
+		${dst:+dst} $dst 2>/dev/null
+	bridge fdb $add_del dev $dev $mac master static 2>/dev/null
+}
+
+__test_unicast()
+{
+	local mac=$1; shift
+	local dst=$1; shift
+	local hit_idx=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	local -a expects=(0 0 0)
+	expects[$hit_idx]=10
+
+	vxlan_flood_test $mac $dst "${expects[@]}"
+
+	log_test "VXLAN: $what"
+}
+
+test_unicast()
+{
+	local -a targets=("$h2_mac $h2"
+			  "$r1_mac vx1 192.0.2.34"
+			  "$r2_mac vx1 192.0.2.50")
+	local target
+
+	for target in "${targets[@]}"; do
+		vxlan_fdb_add_del add $target
+	done
+
+	__test_unicast $h2_mac 192.0.2.2 0 "local MAC unicast"
+	__test_unicast $r1_mac 192.0.2.3 1 "remote MAC 1 unicast"
+	__test_unicast $r2_mac 192.0.2.4 2 "remote MAC 2 unicast"
+
+	for target in "${targets[@]}"; do
+		vxlan_fdb_add_del del $target
+	done
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
