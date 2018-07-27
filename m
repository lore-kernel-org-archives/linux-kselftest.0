From: petrm at mellanox.com (Petr Machata)
Date: Sat, 28 Jul 2018 00:48:13 +0200
Subject: [PATCH net-next] selftests: mlxsw: qos_dscp_bridge: Fix
Message-ID: <0265c1caa420b594b88f2b43ca0cd8df100aa627.1532731316.git.petrm@mellanox.com>

There are two problems in this test case:

- When indexing in bash associative array, the subscript is interpreted as
  string, not as a variable name to be expanded.

- The keys stored to t0s and t1s are not DSCP values, but priority +
  base (i.e. the logical DSCP value, not the full bitfield value).

In combination these two bugs conspire to make the test just work,
except it doesn't really test anything and always passes.

Fix the above two problems in obvious manner.

Signed-off-by: Petr Machata <petrm at mellanox.com>
---
 tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
index 418319f19108..cc527660a022 100755
--- a/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
+++ b/tools/testing/selftests/drivers/net/mlxsw/qos_dscp_bridge.sh
@@ -217,13 +217,13 @@ dscp_ping_test()
 
 	for key in ${!t0s[@]}; do
 		local expect
-		if ((key == dscp_10 || key == dscp_20)); then
+		if ((key == prio+10 || key == prio+20)); then
 			expect=10
 		else
 			expect=0
 		fi
 
-		local delta=$((t1s[key] - t0s[key]))
+		local delta=$((t1s[$key] - t0s[$key]))
 		((expect == delta))
 		check_err $? "DSCP $key: Expected to capture $expect packets, got $delta."
 	done
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
