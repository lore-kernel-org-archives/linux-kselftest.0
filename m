From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:21 +0000
Subject: [PATCH net-next 13/18] selftests: forwarding: vxlan_bridge_1d: Add a
 TOS test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-14-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181119161121.Zl-vkAm5UTa_Dm6gwdo460ID9dAshYb20lsPs6FciBs@z>

From: Petr Machata <petrm@mellanox.com>

Test that TOS is inherited from the tunneled packet into the envelope as
configured at the VXLAN device.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/net/forwarding/vxlan_bridge_1d.sh    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index 0c17b0d427ba..ac1070937ae7 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -69,6 +69,7 @@ export VXPORT
 	test_flood
 	test_unicast
 	test_ttl
+	test_tos
 	reapply_config
 	ping_ipv4
 	test_flood
@@ -507,6 +508,19 @@ test_ttl()
 	log_test "VXLAN: envelope TTL"
 }
 
+test_tos()
+{
+	RET=0
+
+	tc filter add dev v1 egress pref 77 prot ip \
+		flower ip_tos 0x40 action pass
+	vxlan_ping_test $h1 192.0.2.3 "-Q 0x40" v1 egress 77 10
+	vxlan_ping_test $h1 192.0.2.3 "-Q 0x30" v1 egress 77 0
+	tc filter del dev v1 egress pref 77 prot ip
+
+	log_test "VXLAN: envelope TOS inheritance"
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
