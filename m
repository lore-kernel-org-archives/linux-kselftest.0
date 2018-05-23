From: petrm at mellanox.com (Petr Machata)
Date: Wed, 23 May 2018 18:35:07 +0200
Subject: [PATCH net-next 3/3] selftests: forwarding: Test removal of mirroring
In-Reply-To: <cover.1527093017.git.petrm@mellanox.com>
References: <cover.1527093017.git.petrm@mellanox.com>
Message-ID: <daf8235f3af7ca43d2fcb220f309522982b713a4.1527093017.git.petrm@mellanox.com>

Test that when flower-based mirror action is removed, mirroring stops.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_flower.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_flower.sh b/tools/testing/selftests/net/forwarding/mirror_gre_flower.sh
index 2e54407..12914f4 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_flower.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_flower.sh
@@ -67,6 +67,11 @@ test_span_gre_dir_acl()
 	test_span_gre_dir_ips "$@" 192.0.2.3 192.0.2.4
 }
 
+fail_test_span_gre_dir_acl()
+{
+	fail_test_span_gre_dir_ips "$@" 192.0.2.3 192.0.2.4
+}
+
 full_test_span_gre_dir_acl()
 {
 	local tundev=$1; shift
@@ -83,6 +88,9 @@ full_test_span_gre_dir_acl()
 			  "$forward_type" "$backward_type"
 	mirror_uninstall $swp1 $direction
 
+	# Test lack of mirroring after ACL mirror is uninstalled.
+	fail_test_span_gre_dir_acl "$tundev" "$direction"
+
 	log_test "$direction $what ($tcflags)"
 }
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
