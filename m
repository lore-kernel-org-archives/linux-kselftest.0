From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:45 +0200
Subject: [PATCH net-next 11/14] selftests: forwarding: Introduce tc flower
 matching tests
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-12-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Add first part of flower tests. This patch only contains dst/src ip/mac
matching.

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 .../testing/selftests/net/forwarding/tc_common.sh  |  23 +++
 .../testing/selftests/net/forwarding/tc_flower.sh  | 196 +++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 tools/testing/selftests/net/forwarding/tc_common.sh
 create mode 100755 tools/testing/selftests/net/forwarding/tc_flower.sh

diff --git a/tools/testing/selftests/net/forwarding/tc_common.sh b/tools/testing/selftests/net/forwarding/tc_common.sh
new file mode 100644
index 000000000000..df3e532da30e
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/tc_common.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+tc_check_packets()
+{
+	local handle=$2
+	local count=$3
+	local id=$1
+	local ret
+
+	output="$(tc -j -s filter show $id)"
+	# workaround the jq bug which causes jq to return 0 in case input is ""
+	ret=$?
+	if [[ $ret -ne 0 ]]; then
+		return $ret
+	fi
+	echo $output | \
+		jq -e ".[] \
+		| select(.options.handle == $handle) \
+		| select(.options.actions[0].stats.packets == $count)" \
+		&> /dev/null
+	return $?
+}
diff --git a/tools/testing/selftests/net/forwarding/tc_flower.sh b/tools/testing/selftests/net/forwarding/tc_flower.sh
new file mode 100755
index 000000000000..026a4ea4b2fb
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/tc_flower.sh
@@ -0,0 +1,196 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=2
+source lib.sh
+source tc_common.sh
+
+tcflags="skip_hw"
+
+h1_create()
+{
+	simple_if_init $h1 192.0.2.1/24 198.51.100.1/24
+}
+
+h1_destroy()
+{
+	simple_if_fini $h1 192.0.2.1/24 198.51.100.1/24
+}
+
+h2_create()
+{
+	simple_if_init $h2 192.0.2.2/24 198.51.100.2/24
+	tc qdisc add dev $h2 clsact
+}
+
+h2_destroy()
+{
+	tc qdisc del dev $h2 clsact
+	simple_if_fini $h2 192.0.2.2/24 198.51.100.2/24
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
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 101 1
+	check_fail $? "Matched on a wrong filter"
+
+	tc_check_packets "dev $h2 ingress" 102 1
+	check_err $? "Did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	log_test "dst_mac match ($tcflags)"
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
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 101 1
+	check_fail $? "Matched on a wrong filter"
+
+	tc_check_packets "dev $h2 ingress" 102 1
+	check_err $? "Did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	log_test "src_mac match ($tcflags)"
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
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 101 1
+	check_fail $? "Matched on a wrong filter"
+
+	tc_check_packets "dev $h2 ingress" 102 1
+	check_err $? "Did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 103 1
+	check_err $? "Did not match on correct filter with mask"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 3 handle 103 flower
+
+	log_test "dst_ip match ($tcflags)"
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
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 101 1
+	check_fail $? "Matched on a wrong filter"
+
+	tc_check_packets "dev $h2 ingress" 102 1
+	check_err $? "Did not match on correct filter"
+
+	tc filter del dev $h2 ingress protocol ip pref 2 handle 102 flower
+
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $h2mac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "dev $h2 ingress" 103 1
+	check_err $? "Did not match on correct filter with mask"
+
+	tc filter del dev $h2 ingress protocol ip pref 1 handle 101 flower
+	tc filter del dev $h2 ingress protocol ip pref 3 handle 103 flower
+
+	log_test "src_ip match ($tcflags)"
+}
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	h2=${NETIFS[p2]}
+	h1mac=$(mac_get $h1)
+	h2mac=$(mac_get $h2)
+
+	vrf_prepare
+
+	h1_create
+	h2_create
+}
+
+cleanup()
+{
+	pre_cleanup
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
+	log_info "Could not test offloaded functionality"
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
