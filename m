From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:15 +0000
Subject: [PATCH net-next 08/18] selftests: forwarding: vxlan_bridge_1d: Add
 ping test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-9-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Test end-to-end reachability between local and remote endpoints.

Note that because learning is disabled on the VXLAN device, the ICMP
requests will end up being flooded to all remotes.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index af88e1c146a7..0e3d7abc70d3 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -65,6 +65,7 @@
 export VXPORT
 
 : ${ALL_TESTS:="
+	ping_ipv4
     "}
 
 NUM_NETIFS=6
@@ -281,6 +282,13 @@ cleanup()
 	vrf_cleanup
 }
 
+ping_ipv4()
+{
+	ping_test $h1 192.0.2.2 ": local->local"
+	ping_test $h1 192.0.2.3 ": local->remote 1"
+	ping_test $h1 192.0.2.4 ": local->remote 2"
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
