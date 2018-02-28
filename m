From: idosch at mellanox.com (Ido Schimmel)
Date: Wed, 28 Feb 2018 12:25:07 +0200
Subject: [PATCH net-next v2 02/14] selftests: forwarding: Add a test for FDB
 learning
In-Reply-To: <20180228102519.4156-1-idosch@mellanox.com>
References: <20180228102519.4156-1-idosch@mellanox.com>
Message-ID: <20180228102519.4156-3-idosch@mellanox.com>

Send a packet with a specific destination MAC, make sure it was learned
on the ingress port and then aged-out.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  5 +-
 tools/testing/selftests/net/forwarding/lib.sh      | 92 ++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
index e6faa9548460..1ba119f28963 100755
--- a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -26,7 +26,9 @@ h2_destroy()
 
 switch_create()
 {
-	ip link add dev br0 type bridge vlan_filtering 1 mcast_snooping 0
+	# 10 Seconds ageing time.
+	ip link add dev br0 type bridge vlan_filtering 1 ageing_time 1000 \
+		mcast_snooping 0
 
 	ip link set dev $swp1 master br0
 	ip link set dev $swp2 master br0
@@ -79,5 +81,6 @@ setup_wait
 
 ping_test $h1 192.0.2.2
 ping6_test $h1 2001:db8:1::2
+learning_test "br0" $swp1 $h1 $h2
 
 exit $EXIT_STATUS
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index ff6550e9ddaf..21af63e860dc 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -7,6 +7,7 @@
 # Can be overridden by the configuration file.
 PING=${PING:=ping}
 PING6=${PING6:=ping6}
+MZ=${MZ:=mausezahn}
 WAIT_TIME=${WAIT_TIME:=5}
 PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 PAUSE_ON_CLEANUP=${PAUSE_ON_CLEANUP:=no}
@@ -34,6 +35,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
 	exit 0
 fi
 
+if [[ ! -x "$(command -v $MZ)" ]]; then
+	echo "SKIP: $MZ not installed"
+	exit 0
+fi
+
 if [[ ! -v NUM_NETIFS ]]; then
 	echo "SKIP: importer does not define \"NUM_NETIFS\""
 	exit 0
@@ -250,6 +256,17 @@ master_name_get()
 	ip -j link show dev $if_name | jq -r '.[]["master"]'
 }
 
+bridge_ageing_time_get()
+{
+	local bridge=$1
+	local ageing_time
+
+	# Need to divide by 100 to convert to seconds.
+	ageing_time=$(ip -j -d link show dev $bridge \
+		      | jq '.[]["linkinfo"]["info_data"]["ageing_time"]')
+	echo $((ageing_time / 100))
+}
+
 ##############################################################################
 # Tests
 
@@ -280,3 +297,78 @@ ping6_test()
 	check_err $?
 	log_test "ping6"
 }
+
+learning_test()
+{
+	local bridge=$1
+	local br_port1=$2	# Connected to `host1_if`.
+	local host1_if=$3
+	local host2_if=$4
+	local mac=de:ad:be:ef:13:37
+	local ageing_time
+
+	RET=0
+
+	bridge -j fdb show br $bridge brport $br_port1 \
+		| jq -e ".[] | select(.mac == \"$mac\")" &> /dev/null
+	check_fail $? "Found FDB record when should not"
+
+	# Disable unknown unicast flooding on `br_port1` to make sure
+	# packets are only forwarded through the port after a matching
+	# FDB entry was installed.
+	bridge link set dev $br_port1 flood off
+
+	tc qdisc add dev $host1_if ingress
+	tc filter add dev $host1_if ingress protocol ip pref 1 handle 101 \
+		flower dst_mac $mac action drop
+
+	$MZ $host2_if -c 1 -p 64 -b $mac -t ip -q
+	sleep 1
+
+	tc -j -s filter show dev $host1_if ingress \
+		| jq -e ".[] | select(.options.handle == 101) \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_fail $? "Packet reached second host when should not"
+
+	$MZ $host1_if -c 1 -p 64 -a $mac -t ip -q
+	sleep 1
+
+	bridge -j fdb show br $bridge brport $br_port1 \
+		| jq -e ".[] | select(.mac == \"$mac\")" &> /dev/null
+	check_err $? "Did not find FDB record when should"
+
+	$MZ $host2_if -c 1 -p 64 -b $mac -t ip -q
+	sleep 1
+
+	tc -j -s filter show dev $host1_if ingress \
+		| jq -e ".[] | select(.options.handle == 101) \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "Packet did not reach second host when should"
+
+	# Wait for 10 seconds after the ageing time to make sure FDB
+	# record was aged-out.
+	ageing_time=$(bridge_ageing_time_get $bridge)
+	sleep $((ageing_time + 10))
+
+	bridge -j fdb show br $bridge brport $br_port1 \
+		| jq -e ".[] | select(.mac == \"$mac\")" &> /dev/null
+	check_fail $? "Found FDB record when should not"
+
+	bridge link set dev $br_port1 learning off
+
+	$MZ $host1_if -c 1 -p 64 -a $mac -t ip -q
+	sleep 1
+
+	bridge -j fdb show br $bridge brport $br_port1 \
+		| jq -e ".[] | select(.mac == \"$mac\")" &> /dev/null
+	check_fail $? "Found FDB record when should not"
+
+	bridge link set dev $br_port1 learning on
+
+	tc filter del dev $host1_if ingress protocol ip pref 1 handle 101 flower
+	tc qdisc del dev $host1_if ingress
+
+	bridge link set dev $br_port1 flood on
+
+	log_test "FDB learning"
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
