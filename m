From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:53 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 12/12] selftests:
	forwarding: Introduce tc flower matching tests
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-13-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Add first part of flower tests. This patch only contains dst/src ip/mac
matching.

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/forwarding/Makefile     |   2 +-
 tools/testing/selftests/forwarding/tc_flower.sh | 261 ++++++++++++++++++++++++
 2 files changed, 262 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/forwarding/tc_flower.sh

diff --git a/tools/testing/selftests/forwarding/Makefile b/tools/testing/selftests/forwarding/Makefile
index 48e5de22db05..5bc8340d4711 100644
--- a/tools/testing/selftests/forwarding/Makefile
+++ b/tools/testing/selftests/forwarding/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for forwarding selftests
 
-TEST_PROGS := bridge.sh router.sh router_multipath.sh
+TEST_PROGS := bridge.sh router.sh router_multipath.sh tc_flower.sh
 
 include ../lib.mk
diff --git a/tools/testing/selftests/forwarding/tc_flower.sh b/tools/testing/selftests/forwarding/tc_flower.sh
new file mode 100755
index 000000000000..de825ff2712c
--- /dev/null
+++ b/tools/testing/selftests/forwarding/tc_flower.sh
@@ -0,0 +1,261 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=2
+source lib.sh
+
+tcflags="skip_hw"
+
+h1_create()
+{
+	vrf_create "vrf-h1" 1
+	ip link set dev $h1 master vrf-h1
+
+	ip link set dev vrf-h1 up
+	ip link set dev $h1 up
+
+	ip address add 192.0.2.1/24 dev $h1
+	ip address add 198.51.100.1/24 dev $h1
+	ip address add 2001:db8:1::1/64 dev $h1
+
+	tc qdisc add dev $h1 clsact
+}
+
+h1_destroy()
+{
+	tc qdisc del dev $h1 clsact
+
+	ip address del 2001:db8:1::1/64 dev $h1
+	ip address del 198.51.100.1/24 dev $h1
+	ip address del 192.0.2.1/24 dev $h1
+
+	ip link set dev $h1 down
+	vrf_destroy "vrf-h1" 1
+}
+
+h2_create()
+{
+	vrf_create "vrf-h2" 2
+	ip link set dev $h2 master vrf-h2
+
+	ip link set dev vrf-h2 up
+	ip link set dev $h2 up
+
+	ip address add 192.0.2.2/24 dev $h2
+	ip address add 198.51.100.2/24 dev $h2
+	ip address add 2001:db8:1::2/64 dev $h2
+
+	tc qdisc add dev $h2 clsact
+}
+
+h2_destroy()
+{
+	tc qdisc del dev $h2 clsact
+
+	ip address del 2001:db8:1::2/64 dev $h2
+	ip address del 198.51.100.2/24 dev $h2
+	ip address del 192.0.2.2/24 dev $h2
+
+	ip link set dev $h2 down
+	vrf_destroy "vrf-h2" 2
+}
+
+match_dst_mac_test()
+{
+	local dummy_mac=de:ad:be:ef:aa:aa
+
+	RET=0
+
+	tc filter add dev $h2 ingress protocol ip pref 1 handle 101 flower \
+		$tcflags dst_mac $dummy_mac action drop
+	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
+		$tcflags dst_mac $h2mac action drop
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] | select(.options.keys.dst_mac == \"$dummy_mac\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_fail $? "matched on a wrong filter"
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] | select(.options.keys.dst_mac == \"$h2mac\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	print_result "dst_mac match"
+}
+
+match_src_mac_test()
+{
+	local dummy_mac=de:ad:be:ef:aa:aa
+
+	RET=0
+
+	tc filter add dev $h2 ingress protocol ip pref 1 handle 101 flower \
+		$tcflags src_mac $dummy_mac action drop
+	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
+		$tcflags src_mac $h1mac action drop
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] | select(.options.keys.src_mac == \"$dummy_mac\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_fail $? "matched on a wrong filter"
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] | select(.options.keys.src_mac == \"$h1mac\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	print_result "src_mac match"
+}
+
+match_dst_ip_test()
+{
+	RET=0
+
+	tc filter add dev $h2 ingress protocol ip pref 1 handle 101 flower \
+		$tcflags dst_ip 198.51.100.2 action drop
+	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
+		$tcflags dst_ip 192.0.2.2 action drop
+	tc filter add dev $h2 ingress protocol ip pref 3 handle 103 flower \
+		$tcflags dst_ip 192.0.2.0/24 action drop
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] \
+		| select(.options.keys.dst_ip == \"198.51.100.2\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_fail $? "matched on a wrong filter"
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[]  \
+		| select(.options.keys.dst_ip == \"192.0.2.2\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] \
+		| select(.options.keys.dst_ip == \"192.0.2.0/24\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter with mask"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 3 handle 103 flower
+
+	print_result "dst_ip match"
+}
+
+match_src_ip_test()
+{
+	RET=0
+
+	tc filter add dev $h2 ingress protocol ip pref 1 handle 101 flower \
+		$tcflags src_ip 198.51.100.1 action drop
+	tc filter add dev $h2 ingress protocol ip pref 2 handle 102 flower \
+		$tcflags src_ip 192.0.2.1 action drop
+	tc filter add dev $h2 ingress protocol ip pref 3 handle 103 flower \
+		$tcflags src_ip 192.0.2.0/24 action drop
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] \
+		| select(.options.keys.src_ip == \"198.51.100.1\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_fail $? "matched on a wrong filter"
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] \
+		| select(.options.keys.src_ip == \"192.0.2.1\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	mausezahn $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc -j -s filter show dev $h2 ingress \
+		| jq -e ".[] \
+		| select(.options.keys.src_ip == \"192.0.2.0/24\") \
+		| select(.options.actions[0].stats.packets == 1)" &> /dev/null
+	check_err $? "did not match on correct filter with mask"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 3 handle 103 flower
+
+	print_result "src_ip match"
+}
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	h2=${NETIFS[p2]}
+	h1mac=$(mac_get $h1)
+	h2mac=$(mac_get $h2)
+
+	if [[ "${OPTIONS[noprepare]}" == "yes" ]]; then
+		echo "INFO: Not doing setup prepare"
+		return 0
+	fi
+
+	vrf_prepare
+
+	h1_create
+	h2_create
+}
+
+cleanup()
+{
+	if [[ "${OPTIONS[nocleanup]}" == "yes" ]]; then
+		echo "INFO: Not doing cleanup"
+		return 0
+	fi
+
+	h2_destroy
+	h1_destroy
+
+	vrf_cleanup
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+match_dst_mac_test
+match_src_mac_test
+match_dst_ip_test
+match_src_ip_test
+
+tc_offload_check
+if [[ $? -ne 0 ]]; then
+	echo "WARN: Could not test offloaded functionality"
+else
+	tcflags="skip_sw"
+	match_dst_mac_test
+	match_src_mac_test
+	match_dst_ip_test
+	match_src_ip_test
+fi
+
+exit $EXIT_STATUS
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
