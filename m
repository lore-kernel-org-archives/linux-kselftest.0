From: petrm at mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:09 +0200
Subject: [PATCH net-next 2/9] selftests: forwarding: mirror_lib: Move here
 do_test_span_vlan_dir_ips()
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <a309fa870ee8ade18e47952d129e8452a92063d2.1527788672.git.petrm@mellanox.com>

Move the function do_test_span_vlan_dir_ips() from mirror_vlan.sh test
to a library file mirror_lib.sh to allow reuse. Fill in other entry
points similar to other testing functions in mirror_lib.sh, they will be
useful in following patches.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../testing/selftests/net/forwarding/mirror_lib.sh | 35 ++++++++++++++++++++++
 .../selftests/net/forwarding/mirror_vlan.sh        | 15 ----------
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_lib.sh b/tools/testing/selftests/net/forwarding/mirror_lib.sh
index 04cbc38..67efe25 100644
--- a/tools/testing/selftests/net/forwarding/mirror_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_lib.sh
@@ -92,3 +92,38 @@ test_span_dir()
 {
 	test_span_dir_ips "$@" 192.0.2.1 192.0.2.2
 }
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
+quick_test_span_vlan_dir_ips()
+{
+	do_test_span_vlan_dir_ips 10 "$@"
+}
+
+fail_test_span_vlan_dir_ips()
+{
+	do_test_span_vlan_dir_ips 0 "$@"
+}
+
+quick_test_span_vlan_dir()
+{
+	quick_test_span_vlan_dir_ips "$@" 192.0.2.1 192.0.2.2
+}
+
+fail_test_span_vlan_dir()
+{
+	fail_test_span_vlan_dir_ips "$@" 192.0.2.1 192.0.2.2
+}
diff --git a/tools/testing/selftests/net/forwarding/mirror_vlan.sh b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
index 758b6d0..20b37a5 100755
--- a/tools/testing/selftests/net/forwarding/mirror_vlan.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_vlan.sh
@@ -76,21 +76,6 @@ test_vlan()
 	test_vlan_dir egress 0 8
 }
 
-do_test_span_vlan_dir_ips()
-{
-	local expect=$1; shift
-	local dev=$1; shift
-	local vid=$1; shift
-	local direction=$1; shift
-	local ip1=$1; shift
-	local ip2=$1; shift
-
-	vlan_capture_install $dev "vlan_id $vid"
-	mirror_test v$h1 $ip1 $ip2 $dev 100 $expect
-	mirror_test v$h2 $ip2 $ip1 $dev 100 $expect
-	vlan_capture_uninstall $dev
-}
-
 test_tagged_vlan_dir()
 {
 	local direction=$1; shift
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
