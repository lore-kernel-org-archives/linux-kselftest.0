From: idosch@mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:37 +0200
Subject: [PATCH net-next 03/14] selftests: forwarding: Add a test for flooded
 traffic
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-4-idosch@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180226085937.tbFxFWiQNBvGnI9oHsuE4lQaemO91s5QNGzHOIc6CEM@z>

Add test cases for unknown unicast and unregistered multicast flooding.

For each traffic type, turn off flooding on one bridged port and inject
a packet of the specified type through the second bridged port. Make
sure the packet was not received by checking the ACL counters on the
other end. Later, turn on flooding and make sure the packet was
received.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  1 +
 tools/testing/selftests/net/forwarding/lib.sh      | 89 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
index 1ba119f28963..651998e70557 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -82,5 +82,6 @@ setup_wait
 ping_test $h1 192.0.2.2
 ping6_test $h1 2001:db8:1::2
 learning_test "br0" $swp1 $h1 $h2
+flood_test $swp2 $h1 $h2
 
 exit $EXIT_STATUS
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index f02ab5a581e9..44c9650ceb2a 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -372,3 +372,92 @@ learning_test()
 
 	log_test "FDB learning"
 }
+
+flood_test_do()
+{
+	local should_flood=$1
+	local host1_if=$4
+	local host2_if=$5
+	local mac=$2
+	local ip=$3
+	local err=0
+
+	# Add an ACL on `host2_if` which will tell us whether the packet
+	# was flooded to it or not.
+	tc qdisc add dev $host2_if ingress
+	tc filter add dev $host2_if ingress protocol ip pref 1 handle 101 \
+		flower dst_mac $mac action drop
+
+	$MZ $host1_if -c 1 -p 64 -b $mac -B $ip -t ip -q
+	sleep 1
+
+	tc -j -s filter show dev $host2_if ingress \
+		| jq -e ".[] | select(.options.handle == 101) \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	if [[ $? -ne 0 && $should_flood == "true" || \
+	      $? -eq 0 && $should_flood == "false" ]]; then
+		err=1
+	fi
+
+	tc filter del dev $host2_if ingress protocol ip pref 1 handle 101 flower
+	tc qdisc del dev $host2_if ingress
+
+	return $err
+}
+
+flood_unicast_test()
+{
+	local mac=de:ad:be:ef:13:37
+	local ip=192.0.2.100
+	local host1_if=$2
+	local host2_if=$3
+	local br_port=$1
+
+	RET=0
+
+	bridge link set dev $br_port flood off
+
+	flood_test_do false $mac $ip $host1_if $host2_if
+	check_err $? "Packet flooded when should not"
+
+	bridge link set dev $br_port flood on
+
+	flood_test_do true $mac $ip $host1_if $host2_if
+	check_err $? "Packet was not flooded when should"
+
+	log_test "Unknown unicast flood"
+}
+
+flood_multicast_test()
+{
+	local mac=01:00:5e:00:00:01
+	local ip=239.0.0.1
+	local host1_if=$2
+	local host2_if=$3
+	local br_port=$1
+
+	RET=0
+
+	bridge link set dev $br_port mcast_flood off
+
+	flood_test_do false $mac $ip $host1_if $host2_if
+	check_err $? "Packet flooded when should not"
+
+	bridge link set dev $br_port mcast_flood on
+
+	flood_test_do true $mac $ip $host1_if $host2_if
+	check_err $? "Packet was not flooded when should"
+
+	log_test "Unregistered multicast flood"
+}
+
+flood_test()
+{
+	# `br_port` is connected to `host2_if`
+	local host1_if=$2
+	local host2_if=$3
+	local br_port=$1
+
+	flood_unicast_test $br_port $host1_if $host2_if
+	flood_multicast_test $br_port $host1_if $host2_if
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
