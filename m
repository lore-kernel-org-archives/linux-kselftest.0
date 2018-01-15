From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:43 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
	forwarding: Add a test for FDB learning
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-3-idosch@mellanox.com>

Send a packet with a specific destination MAC, make sure it was learned
on the ingress port and then aged-out.

Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/bridge.sh |  6 ++-
 tools/testing/selftests/forwarding/lib.sh    | 58 ++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/forwarding/bridge.sh b/tools/testing/selftests/forwarding/bridge.sh
index c53086c53b37..0bdcee478211 100755
--- a/tools/testing/selftests/forwarding/bridge.sh
+++ b/tools/testing/selftests/forwarding/bridge.sh
@@ -48,7 +48,9 @@ h2_destroy()
 
 bridge_create()
 {
-	ip link add dev br0 type bridge vlan_filtering 1 mcast_snooping 0
+	# 10 Seconds ageing time.
+	ip link add dev br0 type bridge vlan_filtering 1 ageing_time 1000 \
+		mcast_snooping 0
 
 	ip link set dev $swp1 master br0
 	ip link set dev $swp2 master br0
@@ -108,4 +110,6 @@ ping_test "vrf-h1" 192.0.2.2
 ping_test "vrf-h1" 2001:db8:1::2
 mtu_change $old_mtu "${netifs_arr[@]}"
 
+learning_test "br0" $swp1 1 $h1
+
 exit $EXIT_STATUS
diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
index bb423371f4de..264bf0af4c4d 100644
--- a/tools/testing/selftests/forwarding/lib.sh
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -22,6 +22,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
 	exit 0
 fi
 
+if [[ ! -x "$(command -v mausezahn)" ]]; then
+	echo "SKIP: mausezahn not installed"
+	exit 0
+fi
+
 if [[ ! -v NUM_NETIFS ]]; then
 	echo "SKIP: importer does not define \"NUM_NETIFS\""
 	exit 0
@@ -160,6 +165,17 @@ mtu_change()
 	done
 }
 
+bridge_ageing_time_get()
+{
+	local ageing_time
+	local bridge=$1
+
+	# Need to divide by 100 to convert to seconds.
+	ageing_time=$(ip -j -d link show dev $bridge \
+		      | jq '.[]["linkinfo"]["info_data"]["ageing_time"]')
+	echo $((ageing_time / 100))
+}
+
 ### Tests ###
 
 ping_test()
@@ -173,3 +189,45 @@ ping_test()
 	check_err $?
 	print_result "ping"
 }
+
+learning_test()
+{
+	local ageing_time
+	local host_if=$4
+	local br_port=$2
+	local bridge=$1
+	local vid=$3
+
+	RET=0
+
+	bridge -j fdb show br $bridge brport $br_port vlan $vid \
+		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
+	check_fail $? "found FDB record when should not"
+
+	mausezahn $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
+
+	bridge -j fdb show br $bridge brport $br_port vlan $vid \
+		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
+	check_err $? "did not find FDB record when should"
+
+	# Wait for 10 seconds after the ageing time to make sure FDB
+	# record was aged-out.
+	ageing_time=$(bridge_ageing_time_get $bridge)
+	sleep $((ageing_time + 10))
+
+	bridge -j fdb show br $bridge brport $br_port vlan $vid \
+		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
+	check_fail $? "found FDB record when should not"
+
+	bridge link set dev $br_port learning off
+
+	mausezahn $host_if -c 1 -p 64 -a de:ad:be:ef:13:37 -t ip -q
+
+	bridge -j fdb show br $bridge brport $br_port vlan $vid \
+		| jq -e '.[] | select(.mac == "de:ad:be:ef:13:37")' &> /dev/null
+	check_fail $? "found FDB record when should not"
+
+	bridge link set dev $br_port learning on
+
+	print_result "learning"
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
