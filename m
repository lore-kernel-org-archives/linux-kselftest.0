From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 19 Nov 2018 16:11:17 +0000
Subject: [PATCH net-next 09/18] selftests: forwarding: vxlan_bridge_1d: Add
 flood test
In-Reply-To: <20181119161006.5405-1-idosch@mellanox.com>
References: <20181119161006.5405-1-idosch@mellanox.com>
Message-ID: <20181119161006.5405-10-idosch@mellanox.com>

From: Petr Machata <petrm at mellanox.com>

Test that when sending traffic to an unlearned MAC address, the traffic
is flooded to both remote VXLAN endpoints.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../net/forwarding/vxlan_bridge_1d.sh         | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
index 0e3d7abc70d3..1edd5189c41c 100755
--- a/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
+++ b/tools/testing/selftests/net/forwarding/vxlan_bridge_1d.sh
@@ -66,6 +66,7 @@ export VXPORT
 
 : ${ALL_TESTS:="
 	ping_ipv4
+	test_flood
     "}
 
 NUM_NETIFS=6
@@ -289,6 +290,110 @@ ping_ipv4()
 	ping_test $h1 192.0.2.4 ": local->remote 2"
 }
 
+maybe_in_ns()
+{
+	echo ${1:+in_ns} $1
+}
+
+__flood_counter_add_del()
+{
+	local add_del=$1; shift
+	local dev=$1; shift
+	local ns=$1; shift
+
+	# Putting the ICMP capture both to HW and to SW will end up
+	# double-counting the packets that are trapped to slow path, such as for
+	# the unicast test. Adding either skip_hw or skip_sw fixes this problem,
+	# but with skip_hw, the flooded packets are not counted at all, because
+	# those are dropped due to MAC address mismatch; and skip_sw is a no-go
+	# for veth-based topologies.
+	#
+	# So try to install with skip_sw and fall back to skip_sw if that fails.
+
+	$(maybe_in_ns $ns) __icmp_capture_add_del          \
+			   $add_del 100 "" $dev skip_sw 2>/dev/null || \
+	$(maybe_in_ns $ns) __icmp_capture_add_del          \
+			   $add_del 100 "" $dev skip_hw
+}
+
+flood_counter_install()
+{
+	__flood_counter_add_del add "$@"
+}
+
+flood_counter_uninstall()
+{
+	__flood_counter_add_del del "$@"
+}
+
+flood_fetch_stat()
+{
+	local dev=$1; shift
+	local ns=$1; shift
+
+	$(maybe_in_ns $ns) tc_rule_stats_get $dev 100 ingress
+}
+
+flood_fetch_stats()
+{
+	local counters=("${@}")
+	local counter
+
+	for counter in "${counters[@]}"; do
+		flood_fetch_stat $counter
+	done
+}
+
+vxlan_flood_test()
+{
+	local mac=$1; shift
+	local dst=$1; shift
+	local -a expects=("${@}")
+
+	local -a counters=($h2 "vx2 ns1" "vx2 ns2")
+	local counter
+	local key
+
+	for counter in "${counters[@]}"; do
+		flood_counter_install $counter
+	done
+
+	local -a t0s=($(flood_fetch_stats "${counters[@]}"))
+	$MZ $h1 -c 10 -d 100msec -p 64 -b $mac -B $dst -t icmp -q
+	sleep 1
+	local -a t1s=($(flood_fetch_stats "${counters[@]}"))
+
+	for key in ${!t0s[@]}; do
+		local delta=$((t1s[$key] - t0s[$key]))
+		local expect=${expects[$key]}
+
+		((expect == delta))
+		check_err $? "${counters[$key]}: Expected to capture $expect packets, got $delta."
+	done
+
+	for counter in "${counters[@]}"; do
+		flood_counter_uninstall $counter
+	done
+}
+
+__test_flood()
+{
+	local mac=$1; shift
+	local dst=$1; shift
+	local what=$1; shift
+
+	RET=0
+
+	vxlan_flood_test $mac $dst 10 10 10
+
+	log_test "VXLAN: $what"
+}
+
+test_flood()
+{
+	__test_flood de:ad:be:ef:13:37 192.0.2.100 "flood"
+}
+
 test_all()
 {
 	echo "Running tests with UDP port $VXPORT"
-- 
2.19.1
