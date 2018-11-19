From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:19 +0000
Subject: [PATCH net-next 11/18] selftests: forwarding: vxlan_bridge_1d:
 Reconfigure & rerun tests
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-12-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

The ordering of the topology creation can have impact on whether a
driver is successful in offloading VXLAN. Therefore add a pseudo-test
that reshuffles bits of the topology, and then reruns the same suite of
tests again to make sure that the new setup is supported as well.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index 1a3486ec1d21..a943d8da14b9 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -68,6 +68,10 @@ export VXPORT
 	ping_ipv4
 	test_flood
 	test_unicast
+	reapply_config
+	ping_ipv4
+	test_flood
+	test_unicast
     "}
 
 NUM_NETIFS=6
@@ -288,6 +292,28 @@ cleanup()
 	vrf_cleanup
 }
 
+# For the first round of tests, vx1 is the first device to get attached to the
+# bridge, and that at the point that the local IP is already configured. Try the
+# other scenario of attaching the device to an already-offloaded bridge, and
+# only then attach the local IP.
+reapply_config()
+{
+	echo "Reapplying configuration"
+
+	bridge fdb del dev vx1 00:00:00:00:00:00 dst 192.0.2.50 self
+	bridge fdb del dev vx1 00:00:00:00:00:00 dst 192.0.2.34 self
+	rp1_unset_addr
+	ip link set dev vx1 nomaster
+	sleep 5
+
+	ip link set dev vx1 master br1
+	bridge fdb append dev vx1 00:00:00:00:00:00 dst 192.0.2.34 self
+	bridge fdb append dev vx1 00:00:00:00:00:00 dst 192.0.2.50 self
+	sleep 1
+	rp1_set_addr
+	sleep 5
+}
+
 ping_ipv4()
 {
 	ping_test $h1 192.0.2.2 ": local->local"
-- 
2.19.1
