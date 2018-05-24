From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:48 +0200
Subject: [PATCH net-next 07/10] selftests: forwarding: Test mirror-to-vlan
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <b53b987b0e1635af54cabcc3dab3deae1ad1e789.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142748.EwO7KEyTXwMWKETm7w278Ztl8XjyVcqECovOQY1HcBg@z>

Test for "tc action mirred egress mirror" that mirrors to a vlan device.
- test_vlan() tests that the packets get mirrored
- test_tagged_vlan() tests that the mirrored packets have correct inner
  VLAN tag.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_vlan.sh        | 169 +++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100755 tools/testing/selftests/net/forwarding/mirror_vlan.sh

diff --git a/tools/testing/selftests/net/forwarding/mirror_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
new file mode 100755
index 0000000..1e10520
--- /dev/null
+++ b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
@@ -0,0 +1,169 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# This test uses standard topology for testing mirroring. See mirror_topo_lib.sh
+# for more details.
+#
+# Test for "tc action mirred egress mirror" that mirrors to a vlan device.
+
+ALL_TESTS="
+	test_vlan
+	test_tagged_vlan
+"
+
+NUM_NETIFS=6
+source lib.sh
+source mirror_lib.sh
+source mirror_topo_lib.sh
+
+setup_prepare()
+{
+	h1=${NETIFS[p1]}
+	swp1=${NETIFS[p2]}
+
+	swp2=${NETIFS[p3]}
+	h2=${NETIFS[p4]}
+
+	swp3=${NETIFS[p5]}
+	h3=${NETIFS[p6]}
+
+	vrf_prepare
+	mirror_topo_create
+
+	vlan_create $swp3 555
+
+	vlan_create $h3 555 v$h3
+	matchall_sink_create $h3.555
+
+	vlan_create $h1 111 v$h1 192.0.2.17/28
+	bridge vlan add dev $swp1 vid 111
+
+	vlan_create $h2 111 v$h2 192.0.2.18/28
+	bridge vlan add dev $swp2 vid 111
+}
+
+cleanup()
+{
+	pre_cleanup
+
+	vlan_destroy $h2 111
+	vlan_destroy $h1 111
+	vlan_destroy $h3 555
+	vlan_destroy $swp3 555
+
+	mirror_topo_destroy
+	vrf_cleanup
+}
+
+test_vlan_dir()
+{
+	local direction=$1; shift
+	local forward_type=$1; shift
+	local backward_type=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 $direction $swp3.555 "matchall $tcflags"
+	test_span_dir "$h3.555" "$direction" "$forward_type" "$backward_type"
+	mirror_uninstall $swp1 $direction
+
+	log_test "$direction mirror to vlan ($tcflags)"
+}
+
+test_vlan()
+{
+	test_vlan_dir ingress 8 0
+	test_vlan_dir egress 0 8
+}
+
+vlan_capture_add_del()
+{
+	local add_del=$1; shift
+	local pref=$1; shift
+	local dev=$1; shift
+	local filter=$1; shift
+
+	tc filter $add_del dev "$dev" ingress \
+	   proto 802.1q pref $pref \
+	   flower $filter \
+	   action pass
+}
+
+vlan_capture_install()
+{
+	vlan_capture_add_del add 100 "$@"
+}
+
+vlan_capture_uninstall()
+{
+	vlan_capture_add_del del 100 "$@"
+}
+
+do_test_span_vlan_dir_ips()
+{
+	local expect=$1; shift
+	local dev=$1; shift
+	local vid=$1; shift
+	local direction=$1; shift
+	local ip1=$1; shift
+	local ip2=$1; shift
+
+	vlan_capture_install $dev "vlan_id $vid"
+	mirror_test v$h1 $ip1 $ip2 $dev 100 $expect
+	mirror_test v$h2 $ip2 $ip1 $dev 100 $expect
+	vlan_capture_uninstall $dev
+}
+
+test_tagged_vlan_dir()
+{
+	local direction=$1; shift
+	local forward_type=$1; shift
+	local backward_type=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 $direction $swp3.555 "matchall $tcflags"
+	do_test_span_vlan_dir_ips 10 "$h3.555" 111 "$direction" \
+				  192.0.2.17 192.0.2.18
+	do_test_span_vlan_dir_ips  0 "$h3.555" 555 "$direction" \
+				  192.0.2.17 192.0.2.18
+	mirror_uninstall $swp1 $direction
+
+	log_test "$direction mirror to vlan ($tcflags)"
+}
+
+test_tagged_vlan()
+{
+	test_tagged_vlan_dir ingress 8 0
+	test_tagged_vlan_dir egress 0 8
+}
+
+test_all()
+{
+	slow_path_trap_install $swp1 ingress
+	slow_path_trap_install $swp1 egress
+	trap_install $h3 ingress
+
+	tests_run
+
+	trap_install $h3 ingress
+	slow_path_trap_uninstall $swp1 egress
+	slow_path_trap_uninstall $swp1 ingress
+}
+
+trap cleanup EXIT
+
+setup_prepare
+setup_wait
+
+tcflags="skip_hw"
+test_all
+
+if ! tc_offload_check; then
+	echo "WARN: Could not test offloaded functionality"
+else
+	tcflags="skip_sw"
+	test_all
+fi
+
+exit $EXIT_STATUS
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
