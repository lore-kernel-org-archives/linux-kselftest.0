From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:31 +0200
Subject: [PATCH net-next 05/10] selftests: forwarding: mirror_gre_lib: Support
 VLAN
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <65a48688c3c8c87cea558830b9fd1931137c011a.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142731.DDK7iT_NyDYXIAk2AKUQxsYqfa6-tf4IcWo9OpfyhaM@z>

Add full_test_span_gre_dir_vlan_ips() and full_test_span_gre_dir_vlan()
to support mirror-to-gre tests that involve VLAN.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_lib.sh     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index c7b2cdc..92ef6dd 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -43,6 +43,35 @@ full_test_span_gre_dir_ips()
 	log_test "$direction $what ($tcflags)"
 }
 
+full_test_span_gre_dir_vlan_ips()
+{
+	local tundev=$1; shift
+	local direction=$1; shift
+	local vlan_match=$1; shift
+	local forward_type=$1; shift
+	local backward_type=$1; shift
+	local what=$1; shift
+	local ip1=$1; shift
+	local ip2=$1; shift
+
+	RET=0
+
+	mirror_install $swp1 $direction $tundev "matchall $tcflags"
+
+	test_span_dir_ips "h3-$tundev" "$direction" "$forward_type" \
+			  "$backward_type" "$ip1" "$ip2"
+
+	tc filter add dev $h3 ingress pref 77 prot 802.1q \
+		flower $vlan_match ip_proto 0x2f \
+		action pass
+	mirror_test v$h1 $ip1 $ip2 $h3 77 10
+	tc filter del dev $h3 ingress pref 77
+
+	mirror_uninstall $swp1 $direction
+
+	log_test "$direction $what ($tcflags)"
+}
+
 quick_test_span_gre_dir()
 {
 	quick_test_span_gre_dir_ips "$@" 192.0.2.1 192.0.2.2
@@ -62,3 +91,8 @@ full_test_span_gre_dir()
 {
 	full_test_span_gre_dir_ips "$@" 192.0.2.1 192.0.2.2
 }
+
+full_test_span_gre_dir_vlan()
+{
+	full_test_span_gre_dir_vlan_ips "$@" 192.0.2.1 192.0.2.2
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
