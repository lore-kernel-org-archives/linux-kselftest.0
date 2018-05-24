From: petrm@mellanox.com (Petr Machata)
Date: Thu, 24 May 2018 16:27:35 +0200
Subject: [PATCH net-next 06/10] selftests: forwarding: lib: Extract
 trap_{,un}install()
In-Reply-To: <cover.1527171860.git.petrm@mellanox.com>
References: <cover.1527171860.git.petrm@mellanox.com>
Message-ID:
 <62e6587e5459918306bda15380ac6b5e37024b4f.1527171860.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180524142735.2RC3zocgs29bwgPBLtFwmor4Gyhs5AydYRWy82uh5LM@z>

A mirror-to-vlan test that's coming next needs to install the trap
unconditionally. Therefore extract from slow_path_trap_{,un}install()
a more generic functions trap_install() and trap_uninstall(), and covert
the former two to conditional wrappers around these.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 11c481c..e78ee7e 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -472,26 +472,35 @@ tc_offload_check()
 	return 0
 }
 
-slow_path_trap_install()
+trap_install()
 {
 	local dev=$1; shift
 	local direction=$1; shift
 
-	if [ "${tcflags/skip_hw}" != "$tcflags" ]; then
-		# For slow-path testing, we need to install a trap to get to
-		# slow path the packets that would otherwise be switched in HW.
-		tc filter add dev $dev $direction pref 1 \
-		   flower skip_sw action trap
-	fi
+	# For slow-path testing, we need to install a trap to get to
+	# slow path the packets that would otherwise be switched in HW.
+	tc filter add dev $dev $direction pref 1 flower skip_sw action trap
 }
 
-slow_path_trap_uninstall()
+trap_uninstall()
 {
 	local dev=$1; shift
 	local direction=$1; shift
 
+	tc filter del dev $dev $direction pref 1 flower skip_sw
+}
+
+slow_path_trap_install()
+{
+	if [ "${tcflags/skip_hw}" != "$tcflags" ]; then
+		trap_install "$@"
+	fi
+}
+
+slow_path_trap_uninstall()
+{
 	if [ "${tcflags/skip_hw}" != "$tcflags" ]; then
-		tc filter del dev $dev $direction pref 1 flower skip_sw
+		trap_uninstall "$@"
 	fi
 }
 
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
