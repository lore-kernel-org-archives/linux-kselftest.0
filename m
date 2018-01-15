From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:44 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 03/12] selftests:
	forwarding: Add a test for flooded traffic
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-4-idosch@mellanox.com>

Add test cases for unknown unicast and unregistered multicast flooding.

For each traffic type, turn off flooding on one bridged port and inject
a packet of the specified type through the second bridged port. Make
sure the packet was not received by the listening tcpdump session on the
other end. Later, turn on flooding and make sure the packet was
received.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/bridge.sh |  2 +
 tools/testing/selftests/forwarding/lib.sh    | 88 ++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/tools/testing/selftests/forwarding/bridge.sh b/tools/testing/selftests/forwarding/bridge.sh
index 0bdcee478211..7ae4f1639c45 100755
--- a/tools/testing/selftests/forwarding/bridge.sh
+++ b/tools/testing/selftests/forwarding/bridge.sh
@@ -112,4 +112,6 @@ mtu_change $old_mtu "${netifs_arr[@]}"
 
 learning_test "br0" $swp1 1 $h1
 
+flood_test $swp2 $h1 $h2
+
 exit $EXIT_STATUS
diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index 264bf0af4c4d..03e5253b30d8 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -231,3 +231,91 @@ learning_test()
 
 	print_result "learning"
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
+	mausezahn $host1_if -c 1 -p 64 -b $mac -B $ip -t ip -q
+
+	tc -j -s filter show dev $host2_if ingress \
+		| jq -e ".[] | select(.options.keys.dst_mac == \"$mac\") \
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
+	check_err $? "packet flooded when should not"
+
+	bridge link set dev $br_port flood on
+
+	flood_test_do true $mac $ip $host1_if $host2_if
+	check_err $? "packet was not flooded when should"
+
+	print_result "unknown unicast flood"
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
+	check_err $? "packet flooded when should not"
+
+	bridge link set dev $br_port mcast_flood on
+
+	flood_test_do true $mac $ip $host1_if $host2_if
+	check_err $? "packet was not flooded when should"
+
+	print_result "unregistered multicast flood"
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
