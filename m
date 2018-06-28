From: petrm at mellanox.com (Petr Machata)
Date: Thu, 28 Jun 2018 18:56:39 +0200
Subject: [PATCH net-next 4/4] selftests: forwarding: mirror_gre_changes: Fix
 waiting for neighbor
In-Reply-To: <cover.1530204784.git.petrm@mellanox.com>
References: <cover.1530204784.git.petrm@mellanox.com>
Message-ID: <254e52c2f5694e96a86e622337637ff1b9c5e12b.1530204784.git.petrm@mellanox.com>

When running the test on soft devices, there's no mechanism to
gratuitously start resolving the neighbor for remote tunnel endpoint.
So instead of passively waiting, wait for the device to be up, and then
probe the neighbor with a ping.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/mirror_gre_changes.sh | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
index aa29d46186a8..135902aa8b11 100755
--- a/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
+++ b/tools/testing/selftests/net/forwarding/mirror_gre_changes.sh
@@ -122,15 +122,8 @@ test_span_gre_egress_up()
 	# After setting the device up, wait for neighbor to get resolved so that
 	# we can expect mirroring to work.
 	ip link set dev $swp3 up
-	while true; do
-		ip neigh sh dev $swp3 $remote_ip nud reachable |
-		    grep -q ^
-		if [[ $? -ne 0 ]]; then
-			sleep 1
-		else
-			break
-		fi
-	done
+	setup_wait_dev $swp3
+	ping -c 1 -I $swp3 $remote_ip &>/dev/null
 
 	quick_test_span_gre_dir $tundev ingress
 	mirror_uninstall $swp1 ingress
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
