From: petrm at mellanox.com (Petr Machata)
Date: Tue, 31 Jul 2018 11:56:28 +0200
Subject: [PATCH net-next 5/7] selftests: forwarding: Move lldpad waiting to
 lib.sh
In-Reply-To: <cover.1533030830.git.petrm@mellanox.com>
References: <cover.1533030830.git.petrm@mellanox.com>
Message-ID: <a485b5656848639080c61353e0fc367dcb9ee7a0.1533030830.git.petrm@mellanox.com>

The function lldpad_wait() will be useful for a test added by a
following patch. Likewise would the "sleep 5" with its extensive
comment.

Therefore move lldpad_wait() to lib.sh in order to allow reuse. Rename
it to lldpad_app_wait_set() to recognize that what this is intended to
wait on are the pending APP sets.

For the sleeping, add a function lldpad_app_wait_del(). That will serve
to hold the related explanatory comment (which edit for clarity), and as
a token in the caller to identify the sites where this sort of waiting
takes place. That will serve when/if a better way to handle this
business is found.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Ido Schimmel <idosch at mellanox.com>
---
 .../selftests/drivers/net/mlxsw/qos_dscp_bridge.sh | 23 +++-------------------
 tools/testing/selftests/net/forwarding/lib.sh      | 21 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
index cc527660a022..9e875ee8dc1c 100755
--- a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
@@ -103,16 +103,6 @@ dscp_map()
 	done
 }
 
-lldpad_wait()
-{
-	local dev=$1; shift
-
-	while lldptool -t -i $dev -V APP -c app | grep -q pending; do
-	    echo "$dev: waiting for lldpad to push pending APP updates"
-	    sleep 5
-	done
-}
-
 switch_create()
 {
 	ip link add name br1 type bridge vlan_filtering 1
@@ -124,22 +114,15 @@ switch_create()
 
 	lldptool -T -i $swp1 -V APP $(dscp_map 10) >/dev/null
 	lldptool -T -i $swp2 -V APP $(dscp_map 20) >/dev/null
-	lldpad_wait $swp1
-	lldpad_wait $swp2
+	lldpad_app_wait_set $swp1
+	lldpad_app_wait_set $swp2
 }
 
 switch_destroy()
 {
 	lldptool -T -i $swp2 -V APP -d $(dscp_map 20) >/dev/null
 	lldptool -T -i $swp1 -V APP -d $(dscp_map 10) >/dev/null
-
-	# Give lldpad a chance to push down the changes. If the device is downed
-	# too soon, the updates will be left pending, but will have been struck
-	# off the lldpad's DB already, and we won't be able to tell. Then on
-	# next test iteration this would cause weirdness as newly-added APP
-	# rules conflict with the old ones, sometimes getting stuck in an
-	# "unknown" state.
-	sleep 5
+	lldpad_app_wait_del
 
 	ip link set dev $swp2 nomaster
 	ip link set dev $swp1 nomaster
diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 843a6715924f..90af5cd23417 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -247,6 +247,27 @@ setup_wait()
 	sleep $WAIT_TIME
 }
 
+lldpad_app_wait_set()
+{
+	local dev=$1; shift
+
+	while lldptool -t -i $dev -V APP -c app | grep -q pending; do
+		echo "$dev: waiting for lldpad to push pending APP updates"
+		sleep 5
+	done
+}
+
+lldpad_app_wait_del()
+{
+	# Give lldpad a chance to push down the changes. If the device is downed
+	# too soon, the updates will be left pending. However, they will have
+	# been struck off the lldpad's DB already, so we won't be able to tell
+	# they are pending. Then on next test iteration this would cause
+	# weirdness as newly-added APP rules conflict with the old ones,
+	# sometimes getting stuck in an "unknown" state.
+	sleep 5
+}
+
 pre_cleanup()
 {
 	if [ "${PAUSE_ON_CLEANUP}" = "yes" ]; then
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
