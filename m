From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:22 +0000
Subject: [PATCH net-next 14/18] selftests: forwarding: vxlan_bridge_1d: Add an
 ECN encap test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-15-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Test that ECN bits in the VXLAN envelope are correctly deduced from the
overlay packet.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index ac1070937ae7..82a124cbd523 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -70,6 +70,7 @@ export VXPORT
 	test_unicast
 	test_ttl
 	test_tos
+	test_ecn_encap
 	reapply_config
 	ping_ipv4
 	test_flood
@@ -521,6 +522,31 @@ test_tos()
 	log_test "VXLAN: envelope TOS inheritance"
 }
 
+__test_ecn_encap()
+{
+	local q=$1; shift
+	local tos=$1; shift
+
+	RET=0
+
+	tc filter add dev v1 egress pref 77 prot ip \
+		flower ip_tos $tos action pass
+	sleep 1
+	vxlan_ping_test $h1 192.0.2.3 "-Q $q" v1 egress 77 10
+	tc filter del dev v1 egress pref 77 prot ip
+
+	log_test "VXLAN: ECN encap: $q->$tos"
+}
+
+test_ecn_encap()
+{
+	# In accordance with INET_ECN_encapsulate()
+	__test_ecn_encap 0x00 0x00
+	__test_ecn_encap 0x01 0x01
+	__test_ecn_encap 0x02 0x02
+	__test_ecn_encap 0x03 0x02
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
