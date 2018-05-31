From: petrm@mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:02 +0200
Subject: [PATCH net-next 1/9] selftests: forwarding: lib: Move here
 vlan_capture_{,un}install()
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID:
 <196945ae7a8ded90e82cee21ee6e507c6a859487.1527788672.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531175202.7bsx1EnCO7hh9NweeCoWNEHdyE_YKomK8l1r3rPXTPE@z>

Move vlan_capture_install() and vlan_capture_uninstall() from
mirror_vlan.sh test to lib.sh so that it can be reused in other tests.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh      | 23 ++++++++++++++++++++++
 .../selftests/net/forwarding/mirror_vlan.sh        | 23 ----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 89ba4cd..7b18a53 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -514,6 +514,29 @@ icmp6_capture_uninstall()
 	__icmp_capture_add_del del 100 v6 "$@"
 }
 
+__vlan_capture_add_del()
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
+	__vlan_capture_add_del add 100 "$@"
+}
+
+vlan_capture_uninstall()
+{
+	__vlan_capture_add_del del 100 "$@"
+}
+
 matchall_sink_create()
 {
 	local dev=$1; shift
diff --git a/tools/testing/selftests/net/forwarding/mirror_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
index 1e10520..758b6d0 100755
--- a/tools/testing/selftests/net/forwarding/mirror_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
@@ -76,29 +76,6 @@ test_vlan()
 	test_vlan_dir egress 0 8
 }
 
-vlan_capture_add_del()
-{
-	local add_del=$1; shift
-	local pref=$1; shift
-	local dev=$1; shift
-	local filter=$1; shift
-
-	tc filter $add_del dev "$dev" ingress \
-	   proto 802.1q pref $pref \
-	   flower $filter \
-	   action pass
-}
-
-vlan_capture_install()
-{
-	vlan_capture_add_del add 100 "$@"
-}
-
-vlan_capture_uninstall()
-{
-	vlan_capture_add_del del 100 "$@"
-}
-
 do_test_span_vlan_dir_ips()
 {
 	local expect=$1; shift
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
