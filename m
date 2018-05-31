From: petrm at mellanox.com (Petr Machata)
Date: Thu, 31 May 2018 19:52:15 +0200
Subject: [PATCH net-next 3/9] selftests: forwarding: mirror_lib: skip_hw the
 VLAN capture
In-Reply-To: <cover.1527788672.git.petrm@mellanox.com>
References: <cover.1527788672.git.petrm@mellanox.com>
Message-ID: <50138197e2d52547bb214ba4a21ef2397a0edf30.1527788672.git.petrm@mellanox.com>

When the VLAN capture is installed on a front panel device and not a
soft device, the packets are counted twice: once in fast path, and once
after they are trapped to the kernel. Resolve the problem by passing
skip_hw flag to vlan_capture_install().

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_lib.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_lib.sh b/tools/testing/selftests/net/forwarding/mirror_lib.sh
index 67efe25..d36dc26 100644
--- a/tools/testing/selftests/net/forwarding/mirror_lib.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_lib.sh
@@ -102,7 +102,10 @@ do_test_span_vlan_dir_ips()
 	local ip1=$1; shift
 	local ip2=$1; shift
 
-	vlan_capture_install $dev "vlan_id $vid"
+	# Install the capture as skip_hw to avoid double-counting of packets.
+	# The traffic is meant for local box anyway, so will be trapped to
+	# kernel.
+	vlan_capture_install $dev "skip_hw vlan_id $vid"
 	mirror_test v$h1 $ip1 $ip2 $dev 100 $expect
 	mirror_test v$h2 $ip2 $ip1 $dev 100 $expect
 	vlan_capture_uninstall $dev
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
