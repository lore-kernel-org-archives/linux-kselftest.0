From: petrm at mellanox.com (Petr Machata)
Date: Tue, 31 Jul 2018 11:56:35 +0200
Subject: [PATCH net-next 6/7] selftests: forwarding: Move DSCP capture to
 lib.sh
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-ID: <b34620eb166408437e74626775eeb99969ad48d9.1533030830.git.petrm@mellanox.com>

dscp_capture_install() and dscp_capture_uninstall() are going to be
useful for a test added by a following patch, move them therefore to
lib.sh together with related helpers.

While doing so, change the rule preference from mere DSCP value to
DSCP+100 in order to support adding captures of packets with DSCP of 0.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh | 42 ----------------------
 tools/testing/selftests/net/forwarding/lib.sh      | 42 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
index 9e875ee8dc1c..1ca631d5aaba 100755
--- a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
@@ -34,36 +34,6 @@ lib_dir=$(dirname $0)/../../../net/forwarding
 NUM_NETIFS=4
 source $lib_dir/lib.sh
 
-__dscp_capture_add_del()
-{
-	local add_del=$1; shift
-	local dev=$1; shift
-	local base=$1; shift
-	local dscp;
-
-	for prio in {0..7}; do
-		dscp=$((base + prio))
-		__icmp_capture_add_del $add_del $dscp "" $dev \
-				       "ip_tos $((dscp << 2))"
-	done
-}
-
-dscp_capture_install()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	__dscp_capture_add_del add $dev $base
-}
-
-dscp_capture_uninstall()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	__dscp_capture_add_del del $dev $base
-}
-
 h1_create()
 {
 	local dscp;
@@ -155,18 +125,6 @@ cleanup()
 	vrf_cleanup
 }
 
-dscp_fetch_stats()
-{
-	local dev=$1; shift
-	local base=$1; shift
-
-	for prio in {0..7}; do
-		local dscp=$((base + prio))
-		local t=$(tc_rule_stats_get $dev $dscp)
-		echo "[$dscp]=$t "
-	done
-}
-
 ping_ipv4()
 {
 	ping_test $h1 192.0.2.2
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 90af5cd23417..ca53b539aa2d 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -653,6 +653,48 @@ vlan_capture_uninstall()
 	__vlan_capture_add_del del 100 "$@"
 }
 
+__dscp_capture_add_del()
+{
+	local add_del=$1; shift
+	local dev=$1; shift
+	local base=$1; shift
+	local dscp;
+
+	for prio in {0..7}; do
+		dscp=$((base + prio))
+		__icmp_capture_add_del $add_del $((dscp + 100)) "" $dev \
+				       "skip_hw ip_tos $((dscp << 2))"
+	done
+}
+
+dscp_capture_install()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	__dscp_capture_add_del add $dev $base
+}
+
+dscp_capture_uninstall()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	__dscp_capture_add_del del $dev $base
+}
+
+dscp_fetch_stats()
+{
+	local dev=$1; shift
+	local base=$1; shift
+
+	for prio in {0..7}; do
+		local dscp=$((base + prio))
+		local t=$(tc_rule_stats_get $dev $((dscp + 100)))
+		echo "[$dscp]=$t "
+	done
+}
+
 matchall_sink_create()
 {
 	local dev=$1; shift
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
