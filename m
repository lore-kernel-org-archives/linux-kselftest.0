From: idosch at mellanox.com (Ido Schimmel)
Date: Wed, 28 Feb 2018 12:25:19 +0200
Subject: [PATCH net-next v2 14/14] selftests: forwarding: Introduce basic
 shared blocks tests
In-Reply-To: <20180228102519.4156-1-idosch@mellanox.com>
References: <20180228102519.4156-1-idosch@mellanox.com>
Message-ID: <20180228102519.4156-15-idosch@mellanox.com>

From: Jiri Pirko <jiri at mellanox.com>

Test shared block infrastructure. This is a basic test that shares TC
block in between 2 clsact qdiscs.

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh      |   6 +
 .../selftests/net/forwarding/tc_shblocks.sh        | 122 +++++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/tc_shblocks.sh

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 3385ba76ac19..23866a685f77 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -30,6 +30,12 @@ if [[ $? -ne 0 ]]; then
 	exit 0
 fi
 
+tc filter help 2>&1 | grep block &> /dev/null
+if [[ $? -ne 0 ]]; then
+	echo "SKIP: iproute2 too old, missing shared block support"
+	exit 0
+fi
+
 if [[ ! -x "$(command -v jq)" ]]; then
 	echo "SKIP: jq not installed"
 	exit 0
diff --git a/tools/testing/selftests/net/forwarding/tc_shblocks.sh b/tools/testing/selftests/net/forwarding/tc_shblocks.sh
new file mode 100755
index 000000000000..cfc8a2ace388
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/tc_shblocks.sh
@@ -0,0 +1,122 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=4
+source lib.sh
+source tc_common.sh
+
+tcflags="skip_hw"
+
+h1_create()
+{
+	simple_if_init $h1 192.0.2.1/24
+}
+
+h1_destroy()
+{
+	simple_if_fini $h1 192.0.2.1/24
+}
+
+h2_create()
+{
+	simple_if_init $h2 192.0.2.1/24
+}
+
+h2_destroy()
+{
+	simple_if_fini $h2 192.0.2.1/24
+}
+
+switch_create()
+{
+	simple_if_init $swp1 192.0.2.2/24
+	tc qdisc add dev $swp1 ingress_block 22 egress_block 23 clsact
+
+	simple_if_init $swp2 192.0.2.2/24
+	tc qdisc add dev $swp2 ingress_block 22 egress_block 23 clsact
+}
+
+switch_destroy()
+{
+	tc qdisc del dev $swp2 clsact
+	simple_if_fini $swp2 192.0.2.2/24
+
+	tc qdisc del dev $swp1 clsact
+	simple_if_fini $swp1 192.0.2.2/24
+}
+
+shared_block_test()
+{
+	RET=0
+
+	tc filter add block 22 protocol ip pref 1 handle 101 flower \
+		$tcflags dst_ip 192.0.2.2 action drop
+
+	$MZ $h1 -c 1 -p 64 -a $h1mac -b $swmac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "block 22" 101 1
+	check_err $? "Did not match first incoming packet on a block"
+
+	$MZ $h2 -c 1 -p 64 -a $h2mac -b $swmac -A 192.0.2.1 -B 192.0.2.2 \
+		-t ip -q
+
+	tc_check_packets "block 22" 101 2
+	check_err $? "Did not match second incoming packet on a block"
+
+	tc filter del block 22 protocol ip pref 1 handle 101 flower
+
+	log_test "shared block ($tcflags)"
+}
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	swp1=${NETIFS[p2]}
+
+	swp2=${NETIFS[p3]}
+	h2=${NETIFS[p4]}
+
+	h1mac=$(mac_get $h1)
+	h2mac=$(mac_get $h2)
+
+	swmac=$(mac_get $swp1)
+	swp2origmac=$(mac_get $swp2)
+	ip link set $swp2 address $swmac
+
+	vrf_prepare
+
+	h1_create
+	h2_create
+	switch_create
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	switch_destroy
+	h2_destroy
+	h1_destroy
+
+	vrf_cleanup
+
+	ip link set $swp2 address $swp2origmac
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+shared_block_test
+
+tc_offload_check
+if [[ $? -ne 0 ]]; then
+	log_info "Could not test offloaded functionality"
+else
+	tcflags="skip_sw"
+	shared_block_test
+fi
+
+exit $EXIT_STATUS
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
