From: petrm@mellanox.com (Petr Machata)
Date: Thu, 28 Jun 2018 18:56:28 +0200
Subject: [PATCH net-next 2/4] selftests: forwarding: lib: Avoid trapping soft
 devices
In-Reply-To: <cover.1530204784.git.petrm@mellanox.com>
References: <cover.1530204784.git.petrm@mellanox.com>
Message-ID:
 <5362f7c8db72d8450cfdd857c63bcf520d875edd.1530204784.git.petrm@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180628165628.i2ZuIT3r3wdVXGs_RjTnjJDkmPJ0CphNLEUpNvSYLjE@z>

There are several cases where traffic that would normally be forwarded
in silicon needs to be observed in slow path. That's achieved by
trapping such traffic, and the functions trap_install() and
trap_uninstall() realize that. However, such treatment is obviously
wrong if the device in question is actually a soft device not backed by
an ASIC.

Therefore try to trap if possible, but fall back to inserting a continue
if not.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index ac1df4860fbe..d1f14f83979e 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -479,9 +479,15 @@ trap_install()
 	local dev=$1; shift
 	local direction=$1; shift
 
-	# For slow-path testing, we need to install a trap to get to
-	# slow path the packets that would otherwise be switched in HW.
-	tc filter add dev $dev $direction pref 1 flower skip_sw action trap
+	# Some devices may not support or need in-hardware trapping of traffic
+	# (e.g. the veth pairs that this library creates for non-existent
+	# loopbacks). Use continue instead, so that there is a filter in there
+	# (some tests check counters), and so that other filters are still
+	# processed.
+	tc filter add dev $dev $direction pref 1 \
+		flower skip_sw action trap 2>/dev/null \
+	    || tc filter add dev $dev $direction pref 1 \
+		       flower action continue
 }
 
 trap_uninstall()
@@ -489,11 +495,13 @@ trap_uninstall()
 	local dev=$1; shift
 	local direction=$1; shift
 
-	tc filter del dev $dev $direction pref 1 flower skip_sw
+	tc filter del dev $dev $direction pref 1 flower
 }
 
 slow_path_trap_install()
 {
+	# For slow-path testing, we need to install a trap to get to
+	# slow path the packets that would otherwise be switched in HW.
 	if [ "${tcflags/skip_hw}" != "$tcflags" ]; then
 		trap_install "$@"
 	fi
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
