From: petrm@mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:20 +0200
Subject: [PATCH net-next 4/9] selftests: forwarding: mirror_gre_lib: Add STP
 test
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID:
 <0651437857445ed3bf6fc4a99faf56f02733f46b.1527788672.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180531175220.pmwP4P1KDgDWsuwvSAwoOU4JblMxvKz5sQjDEVRK1Ns@z>

Add a reusable full test that toggles STP state of a given bridge port
and checks that the mirroring reacts appropriately. The test will be
used by bridge tests in follow-up patches.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 .../selftests/net/forwarding/mirror_gre_lib.sh     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
index 92ef6dd..619b469 100644
--- a/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_lib.sh
@@ -96,3 +96,35 @@ full_test_span_gre_dir_vlan()
 {
 	full_test_span_gre_dir_vlan_ips "$@" 192.0.2.1 192.0.2.2
 }
+
+full_test_span_gre_stp_ips()
+{
+	local tundev=$1; shift
+	local nbpdev=$1; shift
+	local what=$1; shift
+	local ip1=$1; shift
+	local ip2=$1; shift
+	local h3mac=$(mac_get $h3)
+
+	RET=0
+
+	mirror_install $swp1 ingress $tundev "matchall $tcflags"
+	quick_test_span_gre_dir_ips $tundev ingress $ip1 $ip2
+
+	bridge link set dev $nbpdev state disabled
+	sleep 1
+	fail_test_span_gre_dir_ips $tundev ingress $ip1 $ip2
+
+	bridge link set dev $nbpdev state forwarding
+	sleep 1
+	quick_test_span_gre_dir_ips $tundev ingress $ip1 $ip2
+
+	mirror_uninstall $swp1 ingress
+
+	log_test "$what: STP state ($tcflags)"
+}
+
+full_test_span_gre_stp()
+{
+	full_test_span_gre_stp_ips "$@" 192.0.2.1 192.0.2.2
+}
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
