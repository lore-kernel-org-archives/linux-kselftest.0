From: petrm@mellanox.com (Petr Machata)
Date: Mon, 30 Jul 2018 16:39:52 +0200
Subject: [PATCH net-next 2/5] selftests: forwarding: lib: Support team devices
In-Reply-To: <cover.1532961216.git.petrm@mellanox.com>
References: <cover.1532961216.git.petrm@mellanox.com>
Message-ID:
 <f1578e8fee0a3e2afd436c0ff0d49ba04e7c3bbf.1532961216.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180730143952.WTA7CDbVxS0HdT50M_LoQ8X3yDZxerBM_tEBC8QgEdw@z>

Add team_create() and team_destroy() to manage team netdevices.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 81e36157bf16..3a4eba4f0d08 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -8,6 +8,7 @@
 PING=${PING:=ping}
 PING6=${PING6:=ping6}
 MZ=${MZ:=mausezahn}
+TEAMD=${TEAMD:=teamd}
 WAIT_TIME=${WAIT_TIME:=5}
 PAUSE_ON_FAIL=${PAUSE_ON_FAIL:=no}
 PAUSE_ON_CLEANUP=${PAUSE_ON_CLEANUP:=no}
@@ -425,6 +426,28 @@ vlan_destroy()
 	ip link del dev $name
 }
 
+team_create()
+{
+	local if_name=$1; shift
+	local mode=$1; shift
+
+	require_command $TEAMD
+	$TEAMD -t $if_name -d -c '{"runner": {"name": "'$mode'"}}'
+	for slave in "$@"; do
+		ip link set dev $slave down
+		ip link set dev $slave master $if_name
+		ip link set dev $slave up
+	done
+	ip link set dev $if_name up
+}
+
+team_destroy()
+{
+	local if_name=$1; shift
+
+	$TEAMD -t $if_name -k
+}
+
 master_name_get()
 {
 	local if_name=$1
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
