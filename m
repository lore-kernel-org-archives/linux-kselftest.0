From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 26 Feb 2018 10:59:35 +0200
Subject: [PATCH net-next 01/14] selftests: forwarding: Add initial testing
 framework
In-Reply-To: <20180226085948.19368-1-idosch@mellanox.com>
References: <20180226085948.19368-1-idosch@mellanox.com>
Message-ID: <20180226085948.19368-2-idosch@mellanox.com>

Add initial framework to test packet forwarding functionality. The tests
can run on actual devices using loop-backed cables or using veth pairs.

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/net/forwarding/.gitignore  |   1 +
 tools/testing/selftests/net/forwarding/README      |  56 ++++
 .../selftests/net/forwarding/bridge_vlan_aware.sh  |  83 ++++++
 tools/testing/selftests/net/forwarding/config      |  12 +
 .../net/forwarding/forwarding.config.sample        |  31 +++
 tools/testing/selftests/net/forwarding/lib.sh      | 282 +++++++++++++++++++++
 6 files changed, 465 insertions(+)
 create mode 100644 tools/testing/selftests/net/forwarding/.gitignore
 create mode 100644 tools/testing/selftests/net/forwarding/README
 create mode 100755 tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
 create mode 100644 tools/testing/selftests/net/forwarding/config
 create mode 100644 tools/testing/selftests/net/forwarding/forwarding.config.sample
 create mode 100644 tools/testing/selftests/net/forwarding/lib.sh

diff --git a/tools/testing/selftests/net/forwarding/.gitignore b/tools/testing/selftests/net/forwarding/.gitignore
new file mode 100644
index 000000000000..a793eef5b876
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/.gitignore
@@ -0,0 +1 @@
+forwarding.config
diff --git a/tools/testing/selftests/net/forwarding/README b/tools/testing/selftests/net/forwarding/README
new file mode 100644
index 000000000000..4a0964c42860
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/README
@@ -0,0 +1,56 @@
+Motivation
+==========
+
+One of the nice things about network namespaces is that they allow one
+to easily create and test complex environments.
+
+Unfortunately, these namespaces can not be used with actual switching
+ASICs, as their ports can not be migrated to other network namespaces
+(NETIF_F_NETNS_LOCAL) and most of them probably do not support the
+L1-separation provided by namespaces.
+
+However, a similar kind of flexibility can be achieved by using VRFs and
+by looping the switch ports together. For example:
+
+                             br0
+                              +
+               vrf-h1         |           vrf-h2
+                 +        +---+----+        +
+                 |        |        |        |
+    192.0.2.1/24 +        +        +        + 192.0.2.2/24
+               swp1     swp2     swp3     swp4
+                 +        +        +        +
+                 |        |        |        |
+                 +--------+        +--------+
+
+The VRFs act as lightweight namespaces representing hosts connected to
+the switch.
+
+This approach for testing switch ASICs has several advantages over the
+traditional method that requires multiple physical machines, to name a
+few:
+
+1. Only the device under test (DUT) is being tested without noise from
+other system.
+
+2. Ability to easily provision complex topologies. Testing bridging
+between 4-ports LAGs or 8-way ECMP requires many physical links that are
+not always available. With the VRF-based approach one merely needs to
+loopback more ports.
+
+These tests are written with switch ASICs in mind, but they can be run
+on any Linux box using veth pairs to emulate physical loopbacks.
+
+Guidelines for Writing Tests
+============================
+
+o Where possible, reuse an existing topology for different tests instead
+  of recreating the same topology.
+o Where possible, IPv6 and IPv4 addresses shall conform to RFC 3849 and
+  RFC 5737, respectively.
+o Where possible, tests shall be written so that they can be reused by
+  multiple topologies and added to lib.sh.
+o Checks shall be added to lib.sh for any external dependencies.
+o Code shall be checked using ShellCheck [1] prior to submission.
+
+1. https://www.shellcheck.net/
diff --git a/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
new file mode 100755
index 000000000000..e6faa9548460
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/bridge_vlan_aware.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=4
+source lib.sh
+
+h1_create()
+{
+	simple_if_init $h1 192.0.2.1/24 2001:db8:1::1/64
+}
+
+h1_destroy()
+{
+	simple_if_fini $h1 192.0.2.1/24 2001:db8:1::1/64
+}
+
+h2_create()
+{
+	simple_if_init $h2 192.0.2.2/24 2001:db8:1::2/64
+}
+
+h2_destroy()
+{
+	simple_if_fini $h2 192.0.2.2/24 2001:db8:1::2/64
+}
+
+switch_create()
+{
+	ip link add dev br0 type bridge vlan_filtering 1 mcast_snooping 0
+
+	ip link set dev $swp1 master br0
+	ip link set dev $swp2 master br0
+
+	ip link set dev br0 up
+	ip link set dev $swp1 up
+	ip link set dev $swp2 up
+}
+
+switch_destroy()
+{
+	ip link set dev $swp2 down
+	ip link set dev $swp1 down
+
+	ip link del dev br0
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
+	vrf_prepare
+
+	h1_create
+	h2_create
+
+	switch_create
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	switch_destroy
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
+ping_test $h1 192.0.2.2
+ping6_test $h1 2001:db8:1::2
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/net/forwarding/config b/tools/testing/selftests/net/forwarding/config
new file mode 100644
index 000000000000..5cd2aed97958
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/config
@@ -0,0 +1,12 @@
+CONFIG_BRIDGE=m
+CONFIG_VLAN_8021Q=m
+CONFIG_BRIDGE_VLAN_FILTERING=y
+CONFIG_NET_L3_MASTER_DEV=y
+CONFIG_IPV6_MULTIPLE_TABLES=y
+CONFIG_NET_VRF=m
+CONFIG_BPF_SYSCALL=y
+CONFIG_CGROUP_BPF=y
+CONFIG_NET_CLS_FLOWER=m
+CONFIG_NET_SCH_INGRESS=m
+CONFIG_NET_ACT_GACT=m
+CONFIG_VETH=m
diff --git a/tools/testing/selftests/net/forwarding/forwarding.config.sample b/tools/testing/selftests/net/forwarding/forwarding.config.sample
new file mode 100644
index 000000000000..ab235c124f20
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/forwarding.config.sample
@@ -0,0 +1,31 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+##############################################################################
+# Topology description. p1 looped back to p2, p3 to p4 and so on.
+declare -A NETIFS
+
+NETIFS[p1]=veth0
+NETIFS[p2]=veth1
+NETIFS[p3]=veth2
+NETIFS[p4]=veth3
+NETIFS[p5]=veth4
+NETIFS[p6]=veth5
+NETIFS[p7]=veth6
+NETIFS[p8]=veth7
+
+##############################################################################
+# Defines
+
+# IPv4 ping utility name
+PING=ping
+# IPv6 ping utility name. Some distributions use 'ping' for IPv6.
+PING6=ping6
+# Packet generator. Some distributions use 'mz'.
+MZ=mausezahn
+# Time to wait after interfaces participating in the test are all UP
+WAIT_TIME=5
+# Whether to pause on failure or not.
+PAUSE_ON_FAIL=no
+# Whether to pause on cleanup or not.
+PAUSE_ON_CLEANUP=no
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
new file mode 100644
index 000000000000..9412c894b74e
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -0,0 +1,282 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+##############################################################################
+# Defines
+
+# Can be overridden by the configuration file.
+PING=${PING:=ping}
+PING6=${PING6:=ping6}
+WAIT_TIME=${WAIT_TIME:=5}
+PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
+PAUSE_ON_CLEANUP=${PAUSE_ON_CLEANUP:=no}
+
+if [[ -f forwarding.config ]]; then
+	source forwarding.config
+fi
+
+##############################################################################
+# Sanity checks
+
+if [[ "$(id -u)" -ne 0 ]]; then
+	echo "SKIP: need root privileges"
+	exit 0
+fi
+
+tc -j &> /dev/null
+if [[ $? -ne 0 ]]; then
+	echo "SKIP: iproute2 too old, missing JSON support"
+	exit 0
+fi
+
+if [[ ! -x "$(command -v jq)" ]]; then
+	echo "SKIP: jq not installed"
+	exit 0
+fi
+
+if [[ ! -v NUM_NETIFS ]]; then
+	echo "SKIP: importer does not define \"NUM_NETIFS\""
+	exit 0
+fi
+
+##############################################################################
+# Network interfaces configuration
+
+for i in $(eval echo {1..$NUM_NETIFS}); do
+	ip link show dev ${NETIFS[p$i]} &> /dev/null
+	if [[ $? -ne 0 ]]; then
+		echo "SKIP: could not find all required interfaces"
+		exit 0
+	fi
+done
+
+##############################################################################
+# Helpers
+
+# Exit status to return at the end. Set in case one of the tests fails.
+EXIT_STATUS=0
+# Per-test return value. Clear at the beginning of each test.
+RET=0
+
+check_err()
+{
+	local err=$1
+	local msg=$2
+
+	if [[ $RET -eq 0 && $err -ne 0 ]]; then
+		RET=$err
+		retmsg=$msg
+	fi
+}
+
+check_fail()
+{
+	local err=$1
+	local msg=$2
+
+	if [[ $RET -eq 0 && $err -eq 0 ]]; then
+		RET=1
+		retmsg=$msg
+	fi
+}
+
+log_test()
+{
+	local test_name=$1
+	local opt_str=$2
+
+	if [[ $# -eq 2 ]]; then
+		opt_str="($opt_str)"
+	fi
+
+	if [[ $RET -ne 0 ]]; then
+		EXIT_STATUS=1
+		printf "TEST: %-60s  [FAIL]\n" "$test_name $opt_str"
+		if [[ ! -z "$retmsg" ]]; then
+			printf "\t%s\n" "$retmsg"
+		fi
+		if [ "${PAUSE_ON_FAIL}" = "yes" ]; then
+			echo "Hit enter to continue, 'q' to quit"
+			read a
+			[ "$a" = "q" ] && exit 1
+		fi
+		return 1
+	fi
+
+	printf "TEST: %-60s  [PASS]\n" "$test_name $opt_str"
+	return 0
+}
+
+setup_wait()
+{
+	for i in $(eval echo {1..$NUM_NETIFS}); do
+		while true; do
+			ip link show dev ${NETIFS[p$i]} up \
+				| grep 'state UP' &> /dev/null
+			if [[ $? -ne 0 ]]; then
+				sleep 1
+			else
+				break
+			fi
+		done
+	done
+
+	# Make sure links are ready.
+	sleep $WAIT_TIME
+}
+
+pre_cleanup()
+{
+	if [ "${PAUSE_ON_CLEANUP}" = "yes" ]; then
+		echo "Pausing before cleanup, hit any key to continue"
+		read
+	fi
+}
+
+vrf_prepare()
+{
+	ip -4 rule add pref 32765 table local
+	ip -4 rule del pref 0
+	ip -6 rule add pref 32765 table local
+	ip -6 rule del pref 0
+}
+
+vrf_cleanup()
+{
+	ip -6 rule add pref 0 table local
+	ip -6 rule del pref 32765
+	ip -4 rule add pref 0 table local
+	ip -4 rule del pref 32765
+}
+
+__last_tb_id=0
+declare -A __TB_IDS
+
+__vrf_td_id_assign()
+{
+	local vrf_name=$1
+
+	__last_tb_id=$((__last_tb_id + 1))
+	__TB_IDS[$vrf_name]=$__last_tb_id
+	return $__last_tb_id
+}
+
+__vrf_td_id_lookup()
+{
+	local vrf_name=$1
+
+	return ${__TB_IDS[$vrf_name]}
+}
+
+vrf_create()
+{
+	local vrf_name=$1
+	local tb_id
+
+	__vrf_td_id_assign $vrf_name
+	tb_id=$?
+
+	ip link add dev $vrf_name type vrf table $tb_id
+	ip -4 route add table $tb_id unreachable default metric 4278198272
+	ip -6 route add table $tb_id unreachable default metric 4278198272
+}
+
+vrf_destroy()
+{
+	local vrf_name=$1
+	local tb_id
+
+	__vrf_td_id_lookup $vrf_name
+	tb_id=$?
+
+	ip -6 route del table $tb_id unreachable default metric 4278198272
+	ip -4 route del table $tb_id unreachable default metric 4278198272
+	ip link del dev $vrf_name
+}
+
+__addr_add_del()
+{
+	local if_name=$1
+	local add_del=$2
+	local array
+
+	shift
+	shift
+	array=("${@}")
+
+	for addrstr in "${array[@]}"; do
+		ip address $add_del $addrstr dev $if_name
+	done
+}
+
+simple_if_init()
+{
+	local if_name=$1
+	local vrf_name
+	local array
+
+	shift
+	vrf_name=v$if_name
+	array=("${@}")
+
+	vrf_create $vrf_name
+	ip link set dev $if_name master $vrf_name
+	ip link set dev $vrf_name up
+	ip link set dev $if_name up
+
+	__addr_add_del $if_name add "${array[@]}"
+}
+
+simple_if_fini()
+{
+	local if_name=$1
+	local vrf_name
+	local array
+
+	shift
+	vrf_name=v$if_name
+	array=("${@}")
+
+	__addr_add_del $if_name del "${array[@]}"
+
+	ip link set dev $if_name down
+	vrf_destroy $vrf_name
+}
+
+master_name_get()
+{
+	local if_name=$1
+
+	ip -j link show dev $if_name | jq -r '.[]["master"]'
+}
+
+##############################################################################
+# Tests
+
+ping_test()
+{
+	local if_name=$1
+	local vrf_name
+	local dip=$2
+
+	RET=0
+
+	vrf_name=$(master_name_get $if_name)
+	ip vrf exec $vrf_name $PING $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	check_err $?
+	log_test "ping"
+}
+
+ping6_test()
+{
+	local if_name=$1
+	local vrf_name
+	local dip=$2
+
+	RET=0
+
+	vrf_name=$(master_name_get $if_name)
+	ip vrf exec $vrf_name $PING6 $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	check_err $?
+	log_test "ping6"
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
