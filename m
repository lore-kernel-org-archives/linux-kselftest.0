From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:16 +0200
Subject: [PATCH net-next 02/10] selftests: forwarding: mirror_gre_lib: Extract
 generic functions
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <2f771a18324d9d904fc3e50600dcf8793fb6bd68.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142716.Dq3SJYqEbkCnq9JYRdDIA_4KVP1mJFjeYiZAqz5ziOA@z>

For non-GRE mirroring tests, a functions along the lines of
do_test_span_gre_dir_ips() and test_span_gre_dir_ips() are necessary,
but such that they don't assume tunnels are involved. Extract the code
from mirror_gre_lib.sh to mirror_lib.sh and convert to just use a given
device without assuming it's named "h3-$tundev". Convert the two
above-mentioned functions to wrappers that pass along the correct device
name.

Add test_span_dir() and fail_test_span_dir() to round up the API for use
by following patches.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_lib.sh     | 41 ++++------------
 .../testing/selftests/net/forwarding/mirror_lib.sh | 54 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 31 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index 207ffd1..c7b2cdc 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -1,47 +1,26 @@
 # SPDX-License-Identifier: GPL-2.0
 
-do_test_span_gre_dir_ips()
-{
-	local expect=$1; shift
-	local tundev=$1; shift
-	local direction=$1; shift
-	local ip1=$1; shift
-	local ip2=$1; shift
-
-	icmp_capture_install h3-$tundev
-	mirror_test v$h1 $ip1 $ip2 h3-$tundev 100 $expect
-	mirror_test v$h2 $ip2 $ip1 h3-$tundev 100 $expect
-	icmp_capture_uninstall h3-$tundev
-}
+source mirror_lib.sh
 
 quick_test_span_gre_dir_ips()
 {
-	do_test_span_gre_dir_ips 10 "$@"
+	local tundev=$1; shift
+
+	do_test_span_dir_ips 10 h3-$tundev "$@"
 }
 
 fail_test_span_gre_dir_ips()
 {
-	do_test_span_gre_dir_ips 0 "$@"
+	local tundev=$1; shift
+
+	do_test_span_dir_ips 0 h3-$tundev "$@"
 }
 
 test_span_gre_dir_ips()
 {
 	local tundev=$1; shift
-	local direction=$1; shift
-	local forward_type=$1; shift
-	local backward_type=$1; shift
-	local ip1=$1; shift
-	local ip2=$1; shift
-
-	quick_test_span_gre_dir_ips "$tundev" "$direction" "$ip1" "$ip2"
-
-	icmp_capture_install h3-$tundev "type $forward_type"
-	mirror_test v$h1 $ip1 $ip2 h3-$tundev 100 10
-	icmp_capture_uninstall h3-$tundev
 
-	icmp_capture_install h3-$tundev "type $backward_type"
-	mirror_test v$h2 $ip2 $ip1 h3-$tundev 100 10
-	icmp_capture_uninstall h3-$tundev
+	test_span_dir_ips h3-$tundev "$@"
 }
 
 full_test_span_gre_dir_ips()
@@ -57,8 +36,8 @@ full_test_span_gre_dir_ips()
 	RET=0
 
 	mirror_install $swp1 $direction $tundev "matchall $tcflags"
-	test_span_gre_dir_ips "$tundev" "$direction" "$forward_type" \
-			      "$backward_type" "$ip1" "$ip2"
+	test_span_dir_ips "h3-$tundev" "$direction" "$forward_type" \
+			  "$backward_type" "$ip1" "$ip2"
 	mirror_uninstall $swp1 $direction
 
 	log_test "$direction $what ($tcflags)"
diff --git a/tools/testing/selftests/net/forwarding/mirror_lib.sh b/tools/testing/selftests/net/forwarding/mirror_lib.sh
index e5028a5..04cbc38 100644
--- a/tools/testing/selftests/net/forwarding/mirror_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_lib.sh
@@ -38,3 +38,57 @@ mirror_test()
 	((expect <= delta && delta <= expect + 2))
 	check_err $? "Expected to capture $expect packets, got $delta."
 }
+
+do_test_span_dir_ips()
+{
+	local expect=$1; shift
+	local dev=$1; shift
+	local direction=$1; shift
+	local ip1=$1; shift
+	local ip2=$1; shift
+
+	icmp_capture_install $dev
+	mirror_test v$h1 $ip1 $ip2 $dev 100 $expect
+	mirror_test v$h2 $ip2 $ip1 $dev 100 $expect
+	icmp_capture_uninstall $dev
+}
+
+quick_test_span_dir_ips()
+{
+	do_test_span_dir_ips 10 "$@"
+}
+
+fail_test_span_dir_ips()
+{
+	do_test_span_dir_ips 0 "$@"
+}
+
+test_span_dir_ips()
+{
+	local dev=$1; shift
+	local direction=$1; shift
+	local forward_type=$1; shift
+	local backward_type=$1; shift
+	local ip1=$1; shift
+	local ip2=$1; shift
+
+	quick_test_span_dir_ips "$dev" "$direction" "$ip1" "$ip2"
+
+	icmp_capture_install $dev "type $forward_type"
+	mirror_test v$h1 $ip1 $ip2 $dev 100 10
+	icmp_capture_uninstall $dev
+
+	icmp_capture_install $dev "type $backward_type"
+	mirror_test v$h2 $ip2 $ip1 $dev 100 10
+	icmp_capture_uninstall $dev
+}
+
+fail_test_span_dir()
+{
+	fail_test_span_dir_ips "$@" 192.0.2.1 192.0.2.2
+}
+
+test_span_dir()
+{
+	test_span_dir_ips "$@" 192.0.2.1 192.0.2.2
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
