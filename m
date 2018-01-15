From: idosch at mellanox.com (Ido Schimmel)
Date: Mon, 15 Jan 2018 21:18:42 +0200
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 01/12] selftests:
	forwarding: Add initial testing framework
In-Reply-To: <20180115191853.26129-1-idosch@mellanox.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
Message-ID: <20180115191853.26129-2-idosch@mellanox.com>

Add initial framework to test packet forwarding functionality. The tests
can run on actual devices using loop-backed cables or using veth pairs.

Signed-off-by: Jiri Pirko <jiri at mellanox.com>
Signed-off-by: Ido Schimmel <idosch at mellanox.com>
---
 tools/testing/selftests/Makefile                   |   1 +
 tools/testing/selftests/forwarding/.gitignore      |   1 +
 tools/testing/selftests/forwarding/Makefile        |   6 +
 tools/testing/selftests/forwarding/README          |  56 +++++++
 tools/testing/selftests/forwarding/bridge.sh       | 111 +++++++++++++
 tools/testing/selftests/forwarding/config          |  12 ++
 .../selftests/forwarding/forwarding.config.sample  |  19 +++
 tools/testing/selftests/forwarding/lib.sh          | 175 +++++++++++++++++++++
 8 files changed, 381 insertions(+)
 create mode 100644 tools/testing/selftests/forwarding/.gitignore
 create mode 100644 tools/testing/selftests/forwarding/Makefile
 create mode 100644 tools/testing/selftests/forwarding/README
 create mode 100755 tools/testing/selftests/forwarding/bridge.sh
 create mode 100644 tools/testing/selftests/forwarding/config
 create mode 100644 tools/testing/selftests/forwarding/forwarding.config.sample
 create mode 100644 tools/testing/selftests/forwarding/lib.sh

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index eaf599dc2137..77b34d093a86 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -8,6 +8,7 @@ TARGETS += cpu-hotplug
 TARGETS += efivarfs
 TARGETS += exec
 TARGETS += firmware
+TARGETS += forwarding
 TARGETS += ftrace
 TARGETS += futex
 TARGETS += gpio
diff --git a/tools/testing/selftests/forwarding/.gitignore b/tools/testing/selftests/forwarding/.gitignore
new file mode 100644
index 000000000000..a793eef5b876
--- /dev/null
+++ b/tools/testing/selftests/forwarding/.gitignore
@@ -0,0 +1 @@
+forwarding.config
diff --git a/tools/testing/selftests/forwarding/Makefile b/tools/testing/selftests/forwarding/Makefile
new file mode 100644
index 000000000000..ef9380c49123
--- /dev/null
+++ b/tools/testing/selftests/forwarding/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for forwarding selftests
+
+TEST_PROGS := bridge.sh
+
+include ../lib.mk
diff --git a/tools/testing/selftests/forwarding/README b/tools/testing/selftests/forwarding/README
new file mode 100644
index 000000000000..4a0964c42860
--- /dev/null
+++ b/tools/testing/selftests/forwarding/README
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
diff --git a/tools/testing/selftests/forwarding/bridge.sh b/tools/testing/selftests/forwarding/bridge.sh
new file mode 100755
index 000000000000..c53086c53b37
--- /dev/null
+++ b/tools/testing/selftests/forwarding/bridge.sh
@@ -0,0 +1,111 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+NUM_NETIFS=4
+source lib.sh
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
+	ip address add 2001:db8:1::1/64 dev $h1
+}
+
+h1_destroy()
+{
+	ip address del 2001:db8:1::1/64 dev $h1
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
+	ip address add 2001:db8:1::2/64 dev $h2
+}
+
+h2_destroy()
+{
+	ip address del 2001:db8:1::2/64 dev $h2
+	ip address del 192.0.2.2/24 dev $h2
+
+	ip link set dev $h2 down
+	vrf_destroy "vrf-h2" 2
+}
+
+bridge_create()
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
+bridge_destroy()
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
+	netifs_arr=($h1 $swp1 $swp2 $h2)
+
+	vrf_prepare
+
+	h1_create
+	h2_create
+
+	bridge_create
+}
+
+cleanup()
+{
+	bridge_destroy
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
+ping_test "vrf-h1" 192.0.2.2
+ping_test "vrf-h1" 2001:db8:1::2
+
+old_mtu=$(mtu_get $h1)
+mtu_change 9000 "${netifs_arr[@]}"
+ping_test "vrf-h1" 192.0.2.2
+ping_test "vrf-h1" 2001:db8:1::2
+mtu_change $old_mtu "${netifs_arr[@]}"
+
+exit $EXIT_STATUS
diff --git a/tools/testing/selftests/forwarding/config b/tools/testing/selftests/forwarding/config
new file mode 100644
index 000000000000..5cd2aed97958
--- /dev/null
+++ b/tools/testing/selftests/forwarding/config
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
diff --git a/tools/testing/selftests/forwarding/forwarding.config.sample b/tools/testing/selftests/forwarding/forwarding.config.sample
new file mode 100644
index 000000000000..f2b14814e4ba
--- /dev/null
+++ b/tools/testing/selftests/forwarding/forwarding.config.sample
@@ -0,0 +1,19 @@
+#!/bin/bash
+
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
+# Various configuration options applicable to the testing framework.
+declare -A OPTIONS
+
+# Time to wait after interfaces participating in the test are all UP.
+OPTIONS[wait_time]=5
diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
new file mode 100644
index 000000000000..bb423371f4de
--- /dev/null
+++ b/tools/testing/selftests/forwarding/lib.sh
@@ -0,0 +1,175 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+if [[ "$(id -u)" -ne 0 ]]; then
+	echo "SKIP: need root privileges"
+	exit 0
+fi
+
+if [[ ! -f forwarding.config ]]; then
+	echo "SKIP: could not find configuration file"
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
+source forwarding.config
+
+for i in $(eval echo {1..$NUM_NETIFS}); do
+	ip link show dev ${NETIFS[p$i]} &> /dev/null
+	if [[ $? -ne 0 ]]; then
+		echo "SKIP: could not find all required interfaces"
+		exit 0
+	fi
+done
+
+# Exit status to return at the end. Set in case one of the tests fails.
+EXIT_STATUS=0
+# Per-test return value. Clear at the beginning of each test.
+RET=0
+
+### Helpers ###
+
+check_err()
+{
+	local err=$1
+	local msg=$2
+
+	if [[ $RET -eq 0 ]]; then
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
+	if [[ $err -eq 0 ]]; then
+		RET=1
+		retmsg=$msg
+	fi
+}
+
+print_result()
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
+		echo "FAIL: $test_name $opt_str"
+		if [[ ! -z "$retmsg" ]]; then
+			echo "$retmsg"
+		fi
+		return 1
+	fi
+
+	echo "PASS: $test_name $opt_str"
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
+	sleep ${OPTIONS[wait_time]}
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
+vrf_create()
+{
+	local vrf_name=$1
+	local tb_id=$2
+
+	ip link add dev $vrf_name type vrf table $tb_id
+	ip -4 route add table $tb_id unreachable default metric 4278198272
+	ip -6 route add table $tb_id unreachable default metric 4278198272
+}
+
+vrf_destroy()
+{
+	local vrf_name=$1
+	local tb_id=$2
+
+	ip -6 route del table $tb_id unreachable default metric 4278198272
+	ip -4 route del table $tb_id unreachable default metric 4278198272
+	ip link del dev $vrf_name
+}
+
+mtu_get()
+{
+	local if_name=$1
+
+	ip -j link show dev $if_name | jq '.[]["mtu"]'
+}
+
+mtu_change()
+{
+	local new_mtu=$1
+	local if_name
+
+	shift
+	for if_name in "${@}"; do
+		ip link set dev $if_name mtu $new_mtu
+	done
+}
+
+### Tests ###
+
+ping_test()
+{
+	local vrf_name=$1
+	local dip=$2
+
+	RET=0
+
+	ip vrf exec $vrf_name ping $dip -c 10 -i 0.1 -w 2 &> /dev/null
+	check_err $?
+	print_result "ping"
+}
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
