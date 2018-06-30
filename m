From: petrm at mellanox.com (Petr Machata)
Date: Sat, 30 Jun 2018 02:45:47 +0200
Subject: [PATCH net-next 02/13] selftests: forwarding: lib: Add
 check_err_fail()
In-Reply-To: <cover.1530319109.git.petrm@mellanox.com>
References: <cover.1530319109.git.petrm@mellanox.com>
Message-ID: <bfc91ba98e593a46c7b9b4f7a0f7839fb1ab062f.1530319109.git.petrm@mellanox.com>

In the scale testing scenarios, one usually has a condition that is
expected to either fail, or pass, depending on which side of the scale
is being tested.

To capture this logic, add a function check_err_fail(), which dispatches
either to check_err() or check_fail(), depending on the value of the
first argument, should_fail.

Signed-off-by: Petr Machata <petrm at mellanox.com>
Reviewed-by: Yuval Mintz <yuvalm at mellanox.com>
---
 tools/testing/selftests/net/forwarding/lib.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/testing/selftests/net/forwarding/lib.sh b/tools/testing/selftests/net/forwarding/lib.sh
index 59272824ef37..5f4b7ed2c65a 100644
--- a/tools/testing/selftests/net/forwarding/lib.sh
+++ b/tools/testing/selftests/net/forwarding/lib.sh
@@ -156,6 +156,19 @@ check_fail()
 	fi
 }
 
+check_err_fail()
+{
+	local should_fail=$1; shift
+	local err=$1; shift
+	local what=$1; shift
+
+	if ((should_fail)); then
+		check_fail $err "$what succeeded, but should have failed"
+	else
+		check_err $err "$what failed"
+	fi
+}
+
 log_test()
 {
 	local test_name=$1
-- 
2.4.11

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
