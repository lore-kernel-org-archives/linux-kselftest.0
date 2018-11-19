From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:20 +0000
Subject: [PATCH net-next 12/18] selftests: forwarding: vxlan_bridge_1d: Add a
 TTL test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-13-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

This tests whether TTL of VXLAN envelope packets is properly set based
on the device configuration.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index a943d8da14b9..0c17b0d427ba 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -68,6 +68,7 @@ export VXPORT
 	ping_ipv4
 	test_flood
 	test_unicast
+	test_ttl
 	reapply_config
 	ping_ipv4
 	test_flood
@@ -474,6 +475,38 @@ test_unicast()
 	done
 }
 
+vxlan_ping_test()
+{
+	local ping_dev=$1; shift
+	local ping_dip=$1; shift
+	local ping_args=$1; shift
+	local capture_dev=$1; shift
+	local capture_dir=$1; shift
+	local capture_pref=$1; shift
+	local expect=$1; shift
+
+	local t0=$(tc_rule_stats_get $capture_dev $capture_pref $capture_dir)
+	ping_do $ping_dev $ping_dip "$ping_args"
+	local t1=$(tc_rule_stats_get $capture_dev $capture_pref $capture_dir)
+	local delta=$((t1 - t0))
+
+	# Tolerate a couple stray extra packets.
+	((expect <= delta && delta <= expect + 2))
+	check_err $? "$capture_dev: Expected to capture $expect packets, got $delta."
+}
+
+test_ttl()
+{
+	RET=0
+
+	tc filter add dev v1 egress pref 77 prot ip \
+		flower ip_ttl 99 action pass
+	vxlan_ping_test $h1 192.0.2.3 "" v1 egress 77 10
+	tc filter del dev v1 egress pref 77 prot ip
+
+	log_test "VXLAN: envelope TTL"
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
