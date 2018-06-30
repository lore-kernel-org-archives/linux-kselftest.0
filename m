From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:51:05 +0200
Subject: [PATCH net-next 09/13] selftests: mlxsw: Add tc flower scale test
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <8b350871ba1694582a105c597371f5b39af24b72.1530319109.git.petrm@mellanox.com>

Add test of capacity to offload flower.

This is a generic portion of the test that is meant to be called from a
driver that supplies a particular number of rules to be tested with.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Yuval Mintz <yuvalm at mellanox.com>
---
 .../selftests/drivers/net/mlxsw/tc_flower_scale.sh | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/net/mlxsw/tc_flower_scale.sh

diff --git a/tools/testing/selftests/drivers/net/mlxsw/tc_flower_scale.sh b/tools/testing/selftests/drivers/net/mlxsw/tc_flower_scale.sh
new file mode 100644
index 000000000000..a6d733d2a4b4
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/mlxsw/tc_flower_scale.sh
@@ -0,0 +1,134 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# Test for resource limit of offloaded flower rules. The test adds a given
+# number of flower matches for different IPv6 addresses, then generates traffic,
+# and ensures each was hit exactly once. This file contains functions to set up
+# a testing topology and run the test, and is meant to be sourced from a test
+# script that calls the testing routine with a given number of rules.
+
+TC_FLOWER_NUM_NETIFS=2
+
+tc_flower_h1_create()
+{
+	simple_if_init $h1
+	tc qdisc add dev $h1 clsact
+}
+
+tc_flower_h1_destroy()
+{
+	tc qdisc del dev $h1 clsact
+	simple_if_fini $h1
+}
+
+tc_flower_h2_create()
+{
+	simple_if_init $h2
+	tc qdisc add dev $h2 clsact
+}
+
+tc_flower_h2_destroy()
+{
+	tc qdisc del dev $h2 clsact
+	simple_if_fini $h2
+}
+
+tc_flower_setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	h2=${NETIFS[p2]}
+
+	vrf_prepare
+
+	tc_flower_h1_create
+	tc_flower_h2_create
+}
+
+tc_flower_cleanup()
+{
+	pre_cleanup
+
+	tc_flower_h2_destroy
+	tc_flower_h1_destroy
+
+	vrf_cleanup
+
+	if [[ -v TC_FLOWER_BATCH_FILE ]]; then
+		rm -f $TC_FLOWER_BATCH_FILE
+	fi
+}
+
+tc_flower_addr()
+{
+	local num=$1; shift
+
+	printf "2001:db8:1::%x" $num
+}
+
+tc_flower_rules_create()
+{
+	local count=$1; shift
+	local should_fail=$1; shift
+
+	TC_FLOWER_BATCH_FILE="$(mktemp)"
+
+	for ((i = 0; i < count; ++i)); do
+		cat >> $TC_FLOWER_BATCH_FILE <<-EOF
+			filter add dev $h2 ingress \
+				prot ipv6 \
+				pref 1000 \
+				flower $tcflags dst_ip $(tc_flower_addr $i) \
+				action drop
+		EOF
+	done
+
+	tc -b $TC_FLOWER_BATCH_FILE
+	check_err_fail $should_fail $? "Rule insertion"
+}
+
+__tc_flower_test()
+{
+	local count=$1; shift
+	local should_fail=$1; shift
+	local last=$((count - 1))
+
+	tc_flower_rules_create $count $should_fail
+
+	for ((i = 0; i < count; ++i)); do
+		$MZ $h1 -q -c 1 -t ip -p 20 -b bc -6 \
+			-A 2001:db8:2::1 \
+			-B $(tc_flower_addr $i)
+	done
+
+	MISMATCHES=$(
+		tc -j -s filter show dev $h2 ingress |
+		jq -r '[ .[] | select(.kind == "flower") | .options |
+		         values as $rule | .actions[].stats.packets |
+		         select(. != 1) | "\(.) on \($rule.keys.dst_ip)" ] |
+		       join(", ")'
+	)
+
+	test -z "$MISMATCHES"
+	check_err $? "Expected to capture 1 packet for each IP, but got $MISMATCHES"
+}
+
+tc_flower_test()
+{
+	local count=$1; shift
+	local should_fail=$1; shift
+
+	# We use lower 16 bits of IPv6 address for match. Also there are only 16
+	# bits of rule priority space.
+	if ((count > 65536)); then
+		check_err 1 "Invalid count of $count. At most 65536 rules supported"
+		return
+	fi
+
+	if ! tc_offload_check $TC_FLOWER_NUM_NETIFS; then
+		check_err 1 "Could not test offloaded functionality"
+		return
+	fi
+
+	tcflags="skip_sw"
+	__tc_flower_test $count $should_fail
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
